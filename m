Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456874;
	b=nVRK7I0w0nCmufahSdJ1Q8A+rlxtCQeh2fqzp5eqVAED8uvixqlztQMULgToqwHxYDjT
	 tYs/pDY02q+UTIrd5WHFWUZJAzy3NXyuqs6CJEyCrG+tPVNayR0/utzWujpKhXemKtJq5
	 1l5xQRBYKZxOO4pO79+gidJ5MSjP+67gethRVtnmmpkYhOO9ynHzvhnn2TVmlkx57cIC0
	 cg+SbhjVwQjbT7SZOxsrbe+lOZytKxl56cFl7JohyqlPFtEaCc6zJbl7PFoER7v9j6bLJ
	 oGGz7F3yS7irGGo64eCBSlCW++8MkRJZJPEEA4ZJEwx6z096NsfkHBYyyulWCminTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P0qgmrxWcWb/JksWnHKqO69AaEHX+kvzj5Qtlp7QKxg=;
	b=s9KVUiCdXAEr9qJeWgrIGhdY70B4LF6y5jOxn1ZZf8DIKbHpfWAH7hDio7xn/ATmhf8j
	 /AfP3bBR9mD4JZLUbC402LVp7A4E4S95qHuK02xDYNo5jzYqYJbKR/j1Q9r858KV/wgM8
	 QTdMTlZE9gPiXz53DTFa1QTCGMf+VLeNoQ3a47lzmnNHhCu6M6NMmVJSiF7D/S9xto3p9
	 ziua4EadZr3aCtRX45z/zxtBeQppkHX7N1RhP0MkPLt+G44M0kZtSMQdYhLvO2JJ4gBus
	 Iln3S33exChuKoB9dNHBKm8cS3glHSiGcAsOvam5dpXFBZnQo8wX8Hf6CzmRXABfmoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shopee.com;
	spf=pass smtp.mailfrom=shopee.com;
	dkim=pass header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=BnefFp7f;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED153606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED153606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=BnefFp7f
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1751205b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1794456873; x=1795061673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0qgmrxWcWb/JksWnHKqO69AaEHX+kvzj5Qtlp7QKxg=;
        b=BnefFp7fEaefuztJEvVHtLXepmApEfi/9by6urloQN6Qu7KZmIj4rvSs5W2n4699PV
         O0uDtEPA0Qjh8XFv4tzc/HRWgvM9j6kTwqblWzWXTK8QcTGCGtINI+FacZ3QZaUswnFj
         Ssi8HqC8Mnu9EN8DjgEUSMKFvbYMDdyNG5m60kLa3A/Xvv9x02bBgwtVUhMGvVdvT0po
         E7GCnGZrF9v86RdOihFm/oE90FWSJ4j+4P+DzuLkm2ba7SxEYkTN0njN0rIBvlMKRiFc
         KZCRClgfIhGyi1nfp4wm7wCPVkQRKXIHakLY0v6wfjJe3TB1VIXtQqNMt61mYsonKp2o
         kUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456873; x=1795061673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0qgmrxWcWb/JksWnHKqO69AaEHX+kvzj5Qtlp7QKxg=;
        b=iPXZK/VZaJf2LoUUJmsWopFb1DFF2qnUdK0LeDxgmCB6eXdi34XjZy7197d26mD9dp
         oZnYSF1hykmS0/lJtR/3TMTqBmc1vyOzUiSCmoFF0QxHVlHQ4eAZ/mD9UUecGDt6Hmp3
         0k4ctAd6cIetkghnNDOa8Q2feMNJv1ZLOusgNi7m5Ewd9teqEjxrARN7L8PTgVkcQAlx
         iJkRrIdb2NZLeg7HwLvGIrjCs1pmPbhStdQxyGnEjs+3HEXURcDtWXzFKKJ7fJwjn0Gz
         C80l60YKD+gl6l+j1dfuf6qBSdstTEwI2HqnCvTGOvly69+nyeZ4/bzMYkOUdpOHLnO9
         WVQQ==
X-Forwarded-Encrypted: i=1; AL+hErFnMjZbmTCL2cVjb0Nkv14UYU0bRmR+fHoMBNCaustgESXElrsIUQ3yAJ6KxjX/EtuE7qURHPzkrqUlSdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nj2m6U9MH4kHUpii9ACO95QCa7IPvntczFwMgNMF9ckgg/7AP
	jocthahFJmbDONbqD/HZMxf6BnshmuporTpUwAnLp0K89eQIx36ifhD5KWXCWZcHCe0=
X-Gm-Gg: AYBFou0nUUMjEIZkuR6FDudmfgfpjCbtmf4IjDjlEFIY0DvXgLDsJi+sCp7BtO4ovjL
	fuFU3c1o6hqrA3nm+8FomUH16MXf0cdWwYc6oCD06rVpeIcEzL6B9rBaXy3rqA2I67KIBMAg7kN
	OpsGU1DsvUuWLMx3gcn5N6wCeUO0G2tDlAqSh5zbNZnuXW0O+71C6FLh9wq1FVQM5Sj6/d69PL0
	j1rpAUu/+fTtYfGn+w1spbj13vCNTT+vBQVC2E6oaQ1TdwMRL9wUXevnHfiEpNb728WPA6saqkR
	sK+3+m4/hY68BosjzVWH4/CJAcSusSt7c491EMNav1hM1/0f4fPAeylzecVPGwaN3kCMURu2KHb
	z1FL7CzvnjRCkse9SEbjT2WelJ+qnQEY3pH1a/RFiKxcyqvsqXRg0qI1eDAr4pyuGssrWPJ0Pdg
	InbqMgQaA/z9xav4KnwN8bOg3Vi2f8n+MvuEyW8EUT0I+u3t5cuoqiJ0arR2FCUopqzb4BGgz1X
	FR7Pog8WoP5+kndqw6rxh0vy8xLbx5BNkNPL1v8w4MpQlVVsHqjpulIpAv1mpMNg2SKJFhZTaRR
	GzHvPpoMHFqW3I57FkNZkwRNOMyHyBti6qp99YfNm/BnsyG6NVsdMowRfziLMzNIi9x4jTh0NOP
	sGDHAeyoBc4ah+EI=
X-Received: by 2002:a17:90b:1e47:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3b182fcd7b0mr3552008a91.63.1794456873292;
        Wed, 11 Nov 2026 20:14:33 -0800 (PST)
Received: from LPMV6FJ9FM.cn.corp.seagroup.com ([143.92.118.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm3451131a91.3.2026.11.11.20.14.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:14:32 -0800 (PST)
From: Runli <mingyu.he@shopee.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org
Cc: Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	littleswimmingwhale@gmail.com,
	Runli <mingyu.he@shopee.com>
Subject: [PATCH v3] mm/bpf: Always flush memcg stats when explicitly requested
Date: Thu, 12 Nov 2026 12:13:48 +0800
Message-Id: <20261112041348.66915-1-mingyu.he@shopee.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

memcg_rstat_updated() stops walking the ancestors when a memcg exceeds
the flush threshold. A concurrent flush can leave an ancestor below the
threshold, so the early exit prevents it from receiving further updates.

Consider root and leaf on a 4-CPU system, with a threshold of 256.
CPU 0 is flushing another CPU's stats after CPU 1's stats have already
been flushed. The counts below are shared stats_updates counters:

  CPU 0 (root flush)                CPU 1 (leaf updates)
  ------------------               --------------------
  clear leaf->stats_updates
                                   add 64 to leaf and root
  clear root->stats_updates
  finish flush
                                   leaf = 64, root = 0
                                   4 more batches of 64:
                                     leaf = 320, root = 256
                                   next update:
                                     leaf > threshold
                                     break; root is not updated

Root remains at the threshold, which is insufficient to trigger a flush,
while further leaf updates keep taking the early exit. The periodic
forced flush restores progress, but until then the root's aggregated
statistics can fall far behind. For example, page cache grows at rate of
1 GiB/s, a two-second wait can leave the reported usage about 2 GiB below
the actual usage.

Make bpf_mem_cgroup_flush_stats() force a flush without waiting for the
periodic flusher, while preserving the memcg flush bookkeeping.

Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
Link: https://lore.kernel.org/all/avKy9oMwDRjKjfzm@linux.dev/
Signed-off-by: Runli <mingyu.he@shopee.com>
---
Changes since v2:
- Add mem_cgroup_flush_stats_force() and use it in the BPF kfunc to
  preserve the memcg flush bookkeeping.

v2: https://lore.kernel.org/all/20261111071434.34547-1-mingyu.he@shopee.com/

Changes since v1:
- Make the BPF kfunc flush unconditionally, as suggested by Shakeel.
- Leave memcg_rstat_updated() unchanged.

v1: https://lore.kernel.org/all/20260911032905.63683-1-mingyu.he@shopee.com/

 include/linux/memcontrol.h |  5 +++++
 mm/bpf_memcontrol.c        |  5 +++--
 mm/memcontrol.c            | 17 +++++++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 69e1bcc67c58..e4131a368d8c 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -988,6 +988,7 @@ void mod_memcg_lruvec_state(struct lruvec *lruvec,
 			    enum node_stat_item idx, int val);
 
 void mem_cgroup_flush_stats(struct mem_cgroup *memcg);
+void mem_cgroup_flush_stats_force(struct mem_cgroup *memcg);
 void mem_cgroup_flush_stats_ratelimited(struct mem_cgroup *memcg);
 
 void mod_lruvec_kmem_state(void *p, enum node_stat_item idx, int val);
@@ -1464,6 +1465,10 @@ static inline void mem_cgroup_flush_stats(struct mem_cgroup *memcg)
 {
 }
 
+static inline void mem_cgroup_flush_stats_force(struct mem_cgroup *memcg)
+{
+}
+
 static inline void mem_cgroup_flush_stats_ratelimited(struct mem_cgroup *memcg)
 {
 }
diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
index d8f579c28560..f04be9479e38 100644
--- a/mm/bpf_memcontrol.c
+++ b/mm/bpf_memcontrol.c
@@ -154,11 +154,12 @@ __bpf_kfunc unsigned long bpf_mem_cgroup_page_state(struct mem_cgroup *memcg, in
  * bpf_mem_cgroup_flush_stats - Flush memory cgroup's statistics
  * @memcg: memory cgroup
  *
- * Propagate memory cgroup's statistics up the cgroup tree.
+ * Flush the memory cgroup subtree and propagate its statistics up the cgroup
+ * tree, regardless of the number of pending updates.
  */
 __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
 {
-	mem_cgroup_flush_stats(memcg);
+	mem_cgroup_flush_stats_force(memcg);
 }
 
 /**
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 84f4a8fd4d16..0057e0ab5a45 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -824,6 +824,23 @@ void mem_cgroup_flush_stats(struct mem_cgroup *memcg)
 	__mem_cgroup_flush_stats(memcg, false);
 }
 
+/**
+ * mem_cgroup_flush_stats_force - unconditionally flush memory cgroup statistics
+ * @memcg: root of the subtree to flush, or NULL for the root memory cgroup
+ *
+ * Flush the statistics regardless of the number of pending updates.
+ */
+void mem_cgroup_flush_stats_force(struct mem_cgroup *memcg)
+{
+	if (mem_cgroup_disabled())
+		return;
+
+	if (!memcg)
+		memcg = root_mem_cgroup;
+
+	__mem_cgroup_flush_stats(memcg, true);
+}
+
 void mem_cgroup_flush_stats_ratelimited(struct mem_cgroup *memcg)
 {
 	/* Only flush if the periodic flusher is one full cycle late */
-- 
2.39.2 (Apple Git-143)

