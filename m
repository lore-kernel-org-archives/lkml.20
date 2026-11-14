Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657957;
	b=3VEI+pIWch7F3o/iw4Wea3M186TqRrWoroJjiPnIy4h4CYs4JKV/fnY7TEGEnHJdNiFI
	 yES8IE7yB00tTNTa/eZ8nkN1HnKM+los7PV0T4d0piHsO/Ga80yQQyC/OCtN6rHtHVNfD
	 ULWPcHf6zNhX/EwKAbKE99HpUYBIFstRozREZTA3mlyL1Fv1pJx5gmfMY140EXgjEzdWT
	 w7nnsFhjoo2powJGk3I0VMWE/8gCuJgPNXyY18lbFpNmnsYWWgE8LnsUdNHfH88nh0YrC
	 IgHXhf+drpkG7LmNf3wcTqpAE1GtqfzHTIODRHv5yjAHiniEbs/QWYxKV1iEYCaQAxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657957;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TTJBd8MeCtwetdr88TRDtX/XFHUMZNPbcncQK0sZCLQ=;
	b=CSAX+BbmOrzg2z4ZjTP9JUxDh9zY8AC5GscdvFR0Vl+pmsMKQhLExmGNPt9rQEyMqmvT
	 riCEBha9q9STm6yx61EFZAOmyziyl3TGSTyTDdPl9DtXH8XDmUrEVCzfTVMB+Z1gce/h9
	 RTpKOO1gA+tqOES8S1s2YKUAQJIE78in2i+AfePoOdHtALfsXYO1IqTNjvpMlWlM34Xl/
	 HYrCqATcebBQu0OxOBQS86boyV43pjusQjxjpNCFs197Zfw8WuOuusYbrUFvGwAFhGVh0
	 +DVGzGSj55wCLIK58bQlKtfjYDY5Q90omrCxsY0sf/KGJLD093mu8osYHfiT5iqP1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nNMmtico;
	arc=none smtp.remote-ip=91.218.175.151
Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE7606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACAE7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nNMmtico
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nbJX6d0wLsDxcIeKYKa6MMamnrI75sfXJCnw7NXxxyw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794657954; v=1; x=1795262754;
 b=nNMmticoobWIuInBp66zI7xEcyZHbzOrh6mVNES3GAdTFQoNgRh0eQAkh09y9WQP/aoo3IOu
 5in+A+m8lPRBvaLrycZ5gQNHlg304jmcetoql5+EYCXviTubzD2Pcx55aMur78bYb3qVsjJz9c+
 XgT4xWgCJGlSgV5JlIkXrhdY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b36a65535f5b74d0;
	Sat, 14 Nov 2026 12:05:54 +0000
X-Mizu-Trace-ID: b36a65535f5b74d0
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Ridong Chen <ridong.chen@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH for-7.4-fixes] cgroup/cpuset: Don't revive invalid partition without active CPU on hotplug
Date: Sat, 14 Nov 2026 20:05:32 +0800
Message-Id: <20261114120532.1438512-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

When a CPU hotplug leaves no CPU outside of the partitions for the top
cpuset, cpuset_handle_hotplug() clears subpartitions_cpus and gives all
the active CPUs back to the top cpuset. cpuset_hotplug_update_tasks()
then walks the hierarchy and invalidates the partitions, as
subpartitions_cpus is empty.

However, an invalid partition visited in the same walk may be revived
if its effective_xcpus is not empty. tasks_nocpu_error() doesn't catch
it when its CPUs are all offline but it has no task. Its CPUs are put
back into subpartitions_cpus, and the valid partitions visited after it
are no longer invalidated, as subpartitions_cpus is not empty any more.
The top cpuset is left with CPUs overlapping with these partitions.

It can be reproduced on a system with 8 CPUs:

  # cd /sys/fs/cgroup
  # echo +cpuset > cgroup.subtree_control
  # mkdir A1 B1
  # echo 1 > A1/cpuset.cpus
  # echo 1 > A1/cpuset.cpus.exclusive
  # echo 0,2-7 > B1/cpuset.cpus
  # echo root > B1/cpuset.cpus.partition
  # echo root > A1/cpuset.cpus.partition
  # cat A1/cpuset.cpus.partition
  root invalid (Parent unable to distribute cpu downstream)
  # echo 0 > /sys/devices/system/cpu/cpu1/online
  # cat A1/cpuset.cpus.partition B1/cpuset.cpus.partition
  root
  root
  # cat cpuset.cpus.effective
  0,2-7

A1 can't take CPU 1, the last CPU of the root cgroup which has tasks.
When CPU 1 is offlined, A1 is revived without any active CPU, and B1
stays valid while its CPUs are also in the effective CPUs of the root
cgroup, which triggers

  WARNING: kernel/cgroup/cpuset.c:919 at rebuild_sched_domains_locked

Only revive an invalid partition in hotplug if its effective_xcpus has
an active CPU, the same as what is required to create a partition with
tasks. With that, A1 and B1 are both invalidated in the above case.

Fixes: 0c7f293efc87 ("cgroup/cpuset: Add cpuset.cpus.exclusive.effective for v2")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261114083124.1340140-1-ridong.chen%40linux.dev?part=11
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7e374210c123..bfc852090765 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4016,10 +4016,10 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 		partcmd = partcmd_invalidate;
 	/*
 	 * On the other hand, an invalid partition root may be transitioned
-	 * back to a regular one with a non-empty effective xcpus.
+	 * back to a regular one if its effective xcpus has an active CPU.
 	 */
 	else if (is_partition_valid(parent) && is_partition_invalid(cs) &&
-		 !cpumask_empty(cs->effective_xcpus))
+		 cpumask_intersects(cs->effective_xcpus, cpu_active_mask))
 		partcmd = partcmd_update;
 
 	if (partcmd >= 0) {

base-commit: e234ed1bb82c96a5643fd70784f16cf3d72eeed3
-- 
2.34.1

