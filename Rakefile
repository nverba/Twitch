require './environment.rb'

desc "Queue followers updater (daily)"
task :users_update do
  User.only(:_id).each { |user| UserPrepCache.perform_async( user._id ) }
  $log.info "#{ Time.now } rake :followers_update"
end

desc "Prep unprofilled followers"
task :collect_unprofiled do
  User.only(:_id).each { |user| FollowersCollectUnprofiled.perform_async( user._id ) }
  $log.info "#{ Time.now } rake :collect_unprofiled"
end

desc "Flush dev data"
task :flush_fu do
  User.delete_all
  Follower.delete_all
  Unfollower.delete_all
  Log.delete_all
  $redis.flushall
 	$log.info "#{ Time.now } rake :flush_fu"
end