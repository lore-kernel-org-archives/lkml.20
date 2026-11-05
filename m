Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883859;
	b=X8OrcuC6rCBmlo/Tf5Ts2Pf94XBVHa/n0gRMZUom6VrPmV0Msye4XifjWEnHPicNAK1z
	 RcU394BMfw0PbczEuoDO73SuTMZ28JI+NBJeT5JGac0aQVKMT/oTd3Scg6ujgqPNHGGcC
	 XY693tbm2rDrm6rY96Op8bTbTTy9o9nb+BSDG35h41gN/KdGE3gJQXfWmrMG/b7oH7B6y
	 V96pdnR1OcwOlUuQFeXj+kJcwcR0WjgL99zJmZ7+uG/13ubO28JDiqrtSDoi3RuhZmEu5
	 Vi9TDeFUazhrZtn7zGTkGi7qVkgEA+ywkhFeIxJLeMdmGi/9HiB1X55Yqpozf99jdqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883859;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ljVZDzVIXJjcd9Ou8caC5YIrs7Owo+UZn82NsoYNtFI=;
	b=sCY/R0TFx5DXsKfoog1eYZdBuyeCVLRobqz1CKTddoPxtr6ZqNkityKDcBFQRI0tc0l+
	 kj90TfwP1vto6eQ0rWU5x6aEJpJMnhW5CelJ9r4cLP1y9sXNHwl4kBPZ+IJNCfgitmVZi
	 f6LxahG4ZNosQmpA/Cbb9+9VR9Ndtm6StKuiLMjxKRlvJiAYU7wVw//evQoNV7ru58bUn
	 rC5p6mc/8JmEx8JcLpw/jrOaGhTQvqxs0fbEDxnr3PpbhJ4LGUi776ubFqvEYIXmEMx65
	 DYln8X6V0LRCpCRvd8tNisqyLoOd4gFSjZu818euM1ImM4wzCkXtSrH8Z1FeLh+Xqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KmDJwRsB;
	arc=none smtp.remote-ip=91.218.175.164
Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A019606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A019606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KmDJwRsB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RdjxbMsSdN+BD16PpNIf6U9zDl/xhZz69PMzEzEBZV8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793883855; v=1; x=1794488655;
 b=KmDJwRsBKprnFPcDORCicIJiAY9nl8/3fGVAlrwAOfOdq4opTQyBx5FBqq63tBwz6jxa1UH0
 UhewUSJjK0EDYlcaWBsILIBq3dYfq9Pbep9OFyuCM87RhvyUAOF19OhOjpDfSzo0FVtREig6yic
 ym8fvIRB53sk8YliBbb9wrBQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f4856373a4f80b9b;
	Thu, 05 Nov 2026 13:04:15 +0000
X-Mizu-Trace-ID: f4856373a4f80b9b
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org,
	ridong.chen@linux.dev
Cc: guopeng.zhang@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH v2 3/3] cgroup/cpuset: Release isolated CPUs when the parent is invalid
Date: Thu,  5 Nov 2026 21:03:44 +0800
Message-ID: <20261105130344.664336-4-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105130344.664336-1-guopeng.zhang@linux.dev>
References: <20261105130344.664336-1-guopeng.zhang@linux.dev>
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

An isolated partition can be invalidated after its parent has already
become invalid. update_parent_effective_cpumask() then skips returning
CPUs to the parent, but also skips removing them from isolated_cpus.
The invalid child continues to isolate CPUs that no longer belong to
any valid isolated partition.

For example, on a 32-CPU system with all CPUs online and without
isolcpus= or nohz_full= boot parameters:

  cd /sys/fs/cgroup
  echo +cpuset > cgroup.subtree_control
  mkdir A
  echo 0,2-31 > A/cpuset.cpus
  echo root > A/cpuset.cpus.partition
  echo +cpuset > A/cgroup.subtree_control
  mkdir A/B
  echo 2-3 > A/B/cpuset.cpus
  echo isolated > A/B/cpuset.cpus.partition
  cat cpuset.cpus.isolated
  2-3
  echo 0 > /sys/devices/system/cpu/cpu1/online
  cat A/B/cpuset.cpus.partition
  isolated invalid
  cat cpuset.cpus.isolated
  2-3

Release the invalidated child's isolated CPUs when its parent is no
longer a valid partition. Use isolated_cpus_release() to preserve CPUs
still covered by a valid isolated ancestor and by boot isolation.

After this fix, cpuset.cpus.isolated is empty for this reproducer.

Fixes: 11e5f407b64a ("cgroup/cpuset: Keep track of CPUs in isolated partitions")
Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 kernel/cgroup/cpuset.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index fc5454c2740f..f3b808cea51c 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1976,10 +1976,15 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		/*
 		 * Make the current partition invalid.
 		 */
-		if (is_partition_valid(parent))
+		if (is_partition_valid(parent)) {
 			adding = cpumask_and(tmp->addmask,
 					     cs->effective_xcpus,
 					     parent->effective_xcpus);
+		} else if (old_prs == PRS_ISOLATED) {
+			/* No valid parent will release these isolated CPUs. */
+			cpumask_copy(tmp->addmask, cs->effective_xcpus);
+			isolated_cpus_release(cs, tmp->addmask);
+		}
 		if (old_prs > 0)
 			new_prs = -old_prs;
 
-- 
2.43.0

