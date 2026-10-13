Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2657E3FBB7D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901662; cv=none; b=lgYCsuyfBVZ3Ryxk4TUBVZrTtJVcbSXNnq3Z1Evrh/QS4TS859t5hDIG8onLlvl2c8G6JAACo0fmI7VCbC6C5Yq0/dTCBKgGS3aO1OaYKpB4pHiBNGNccAV0DFHYzYpAR8pAgBp+UY/67pJBTVJc5W013Oi7p/RF16pzvHgMslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901662; c=relaxed/simple;
	bh=NZKnBMsTlEv5VIQbgRx+b8+0ULAauvjEqoSq3YJNCkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNn1GA6uIll0hKuU7vwGJT8kc+ywPI5fYTcNNYeKu2/3KyEtEglrieY9YgNzIdhHGyvjKLtHnWu6z+4zu/Mj57w09xHVUfxp0Z5cTJyTvTj4r9DoZhJp3HRkcpgFy6IG/r9lU6mmCMmIsjMByc2nrVBVt4CA6WjRJpzOCEXdGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=emB06pHt; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="emB06pHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iX
	DAwEzI6YClfsZwoWfAR4r7aRqTD5xFqxKyONFlpj4=; b=emB06pHtLC9JvSScmY
	Vkw55ndjFyBWvk5hm61jR5lEewnTIw5Tdi8w8DxbFTH5Y5kvmSbauazMS1L8DSv1
	2IHWJMWlhm8wFP6s8IMjLOjRvkqGs/kAa0J9G1L65K9KEqdr87cpjv+T469WmaeI
	vpON0ArvA8cE4dTfmif6C1UwM=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3f+SJP85q22CyEQ--.43028S2;
	Tue, 13 Oct 2026 22:26:18 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	sh_def@163.com
Subject: [PATCH] sched/loadavg: Use READ_ONCE/WRITE_ONCE for calc_load_idx
Date: Tue, 13 Oct 2026 23:25:52 +0900
Message-ID: <20261013142552.262520-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgD3f+SJP85q22CyEQ--.43028S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFykWrW7Jr48Aw4fWF18AFb_yoW8ZF45pF
	92yFyUGr48XF1rZa97ua4UCrn8Wrn7CF43JF1vyrs2vF4DKF1DKF1IgF1a9FyYgrn3A3Wj
	qrWjvry7Kw4q9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFJUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QpAn2rOP4rjvAAA3y

The NO_HZ fold path reads calc_load_idx locklessly from
calc_load_write_idx(), while calc_global_nohz() updates it from the
jiffies_lock-serialized global load path.

Commit caeb5882979b ("sched/loadavg: Use {READ,WRITE}_ONCE() for sample
window") marked the lockless accesses to calc_load_update. calc_load_idx
participates in the same cross-CPU protocol, ordered by the existing
smp_wmb()/smp_rmb() pair, but its accesses remain plain C accesses.

Mark the lockless read and publisher access with READ_ONCE() and
WRITE_ONCE(). KCSAN otherwise observes the concurrent access:

  BUG: KCSAN: data-race in calc_global_load / calc_load_nohz_fold

  write by interrupt on cpu 3:
   calc_global_load+0x392/0x420
   tick_do_update_jiffies64+0x171/0x1e0

  read by task 0 on cpu 5:
   calc_load_nohz_fold+0x7a/0x110
   calc_load_nohz_start+0x26/0x30

  value changed: 0x00000033 -> 0x00000034

Keep the existing memory ordering and writer serialization unchanged.
calc_load_read_idx() is only used from the jiffies_lock-serialized
global load path and does not need an accessor.

Fixes: 5167e8d5417b ("sched/nohz: Rewrite and fix load-avg computation -- again")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/loadavg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/loadavg.c b/kernel/sched/loadavg.c
index b601e0243d0e..f87059e0e251 100644
--- a/kernel/sched/loadavg.c
+++ b/kernel/sched/loadavg.c
@@ -209,7 +209,7 @@ static int calc_load_idx;
 
 static inline int calc_load_write_idx(void)
 {
-	int idx = calc_load_idx;
+	int idx = READ_ONCE(calc_load_idx);
 
 	/*
 	 * See calc_global_nohz(), if we observe the new index, we also
@@ -333,7 +333,7 @@ static void calc_global_nohz(void)
 	 * index, this avoids a double flip messing things up.
 	 */
 	smp_wmb();
-	calc_load_idx++;
+	WRITE_ONCE(calc_load_idx, READ_ONCE(calc_load_idx) + 1);
 }
 #else /* !CONFIG_NO_HZ_COMMON: */
 
-- 
2.55.0

