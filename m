Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872388;
	b=BWbyJGuuPIzmKgqenx57SRSLleFL89bM3uW25UORI8b8kIUpGDEfq55DECcB3gxn+jj2
	 lfrOIZaEtlhG7l0pcuhTDvf2ELuIym8yCb8i/eX25GOhAVWGFzhwxpoVpCrMIZLvtRoI0
	 fdcfwbAu3DBoeGNuYdDxKteQSy0tl6T7E3yLi4kyNK80DuipTVxW7suH/Z9Cfbg4MNLhe
	 Xendxn40jZaoeSyGxBajFyyb8Mn6zs09n+2nH8i6WF+7WEFVqJbJIOHcaPDV4s01dzS4Q
	 cGABX4wzeIlfyHPHUrH0pJrp1BDVoyChk5vxiwuSLjBInJ9bLoVcEniLwLeZ5T0UBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872388;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Idn+SmsO2M3f0YI+n9T3ryw9MvtjbedDGjimEeioACw=;
	b=E1DXTwNq0GdV+4IwLe0yR6aWL5/lxkfg0Ag5cVREudwYVjH7CcahNHHkfVCs3f48lVF4
	 +N8OirTV3kflvYmF2tkAoSPmjfHbSWUMwnnOeLXe2/J80DfQM1wOLgvCqG9y3uczvKL2A
	 uREgpLGukLag55iu5Pw+lxrCNglyU8COL7u+tMWujzzj8OcB6ZVMdyHApIq6xFYt+17Of
	 xI+FosGm/lpIWRmRlkEd+U49GKiWECkx/a/6ssXCM87EBpiLsZUU01vrSYolixTfrvWiD
	 3MRcwmQVNgJ7WAMN9ATQImqrHFwHYhcYoAeSQ+zZnuhEkyBmG4siLrOAcTxZqTf2XAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="cwt/ENdp";
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E160606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E160606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cwt/ENdp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872385; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Idn+SmsO2M3f0YI+n9T3ryw9MvtjbedDGjimEeioACw=;
	b=cwt/ENdpsNSpqxL/yIjsjtB/jVOB5EEk9RidqDu2Va6s+SyPjDnnVASOuIaW/NhlENCx8FRZ/XURN4Xi1x8E8IC6RuiYyE2S3AMBXMJzrKMCfh/TOYAhM90JJ9+RsqertZnemTRZXM8aIWJ4AT/GDOqUwZ14Ls7oMsKN1V9G0j0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XE8JNsH_1793872384;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XE8JNsH_1793872384 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:53:04 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: catalin.marinas@arm.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mm: kmemleak: reschedule while reading reports
Date: Thu,  5 Nov 2026 17:52:50 +0800
Message-ID: <70139bdb8c7a61913d5081671fcc2af37348fffd.1793871596.git.tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793871596.git.tongweilin@linux.alibaba.com>
References: <cover.1793871596.git.tongweilin@linux.alibaba.com>
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

Reading a kmemleak report walks all tracked objects under RCU, even
when the report is empty. On large debug kernels this can stall RCU.

Use kmemleak_cond_resched() in both seq traversal loops. Request a break
when need_resched() is set and periodically every 256 positions, since
preemption can clear need_resched() without ending the RCU read-side
critical section.

The helper pins a linked cursor and defers its removal across RCU breaks.
Already removed cursors remain under RCU to protect their forward links.
This allows RCU grace periods to progress during long report reads.

Fixes: f5886c7f96f2 ("kmemleak: Protect the seq start/next/stop sequence by rcu_read_lock()")
Assisted-by: LLM
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
 mm/kmemleak.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index d959d11f6..0fe7d336c 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -2216,6 +2216,9 @@ static void stop_scan_thread(void)
 	}
 }
 
+/* Also break RCU periodically when preemption clears need_resched(). */
+#define KMEMLEAK_SEQ_RESCHED_INTERVAL 256
+
 /*
  * Iterate over the object_list and return the first valid object at or after
  * the required position with its use_count incremented. The function triggers
@@ -2233,6 +2236,9 @@ static void *kmemleak_seq_start(struct seq_file *seq, loff_t *pos)
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(object, &object_list, object_list) {
+		if (need_resched() || !(n % KMEMLEAK_SEQ_RESCHED_INTERVAL))
+			kmemleak_cond_resched(object);
+
 		if (n-- > 0)
 			continue;
 		if (get_object(object))
@@ -2256,6 +2262,9 @@ static void *kmemleak_seq_next(struct seq_file *seq, void *v, loff_t *pos)
 	++(*pos);
 
 	list_for_each_entry_continue_rcu(obj, &object_list, object_list) {
+		if (need_resched() || !(*pos % KMEMLEAK_SEQ_RESCHED_INTERVAL))
+			kmemleak_cond_resched(obj);
+
 		if (get_object(obj)) {
 			next_obj = obj;
 			break;
