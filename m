Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323108;
	b=TxheMiuvS/xplFBVYUDYROsImXhjsg852VDqicj1oJTG7JOu/vLgyVt+fEs8QrDNe3J+
	 Hitcc5xMIf9ubVUEugOh7FY8KununMs8n0G1LHn8bdz6Esv6vhTRMFXW1mkweHOf6NHFF
	 h5DnGNJJIeE4fLb4ythyZJcA8Dgt+xK8PHQFF3h+FluVXm09iu7IFM34XvjyEKNcgYCWT
	 z94VaI5QieyEyQSUKPdxJ2b0PRJXfbVbukP61EmXYas0O80krZv2WYVmO0Vmy5QAPLX1J
	 mdPtmE427495RYwHniMxBF8L1pJ6JvNQZqYeuou6Ix6degMCWtQEE0/5EQjaNE78cAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b9ZjhJYgeBT8nslEyZrG/np7JkCr0xptEAmrRjaWc2Y=;
	b=d1LcTZUBLv4PPCNreTqWn+w6+PSSTwlVP90qTpgrAckMo/E/z3kN4HKFLFksPStuLCU4
	 pqeOcekmqIV9oQ2S5Ec6Y43Vzv4YDt2oHFJOA7Y/MAQmt4+CqGjhYlJ3JS0Y1Y7Cr60AO
	 M9AVY21+KNsUW4vvLuA9MDQJ/jcthwuOd/zzJF5MQV/HnbVHj8M4S4Rsmr0UskE+JcPqX
	 fO348yOkfRKF/dGRVzso34xkgzuWr1Hh8f9LNqYOBN1sy03jcFoJipLmNf9fQcLykKd0r
	 lFDBlZ0wdAsVx8KhHxC3ngwZvg5fMkyRXGHfM7K8LaSd7v80uxcFuf8V4BGbiDybRvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XsETHIlG;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1560A382C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB1560A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XsETHIlG
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e7fc8265aso25193596d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794323107; x=1794927907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9ZjhJYgeBT8nslEyZrG/np7JkCr0xptEAmrRjaWc2Y=;
        b=XsETHIlG3dg1M3yZoQuooqw5ZHm0WwLv715qToTGWfi1teAFUeAnVHW1QEnRU+rXzt
         t0WheuuCPYvaMwedMR4LFG3TucJOrMUNtslikV6qMCCU8Gvwgcb5rA06sUIrOzPBC5K3
         X5R4+24WFJ73nyZafv9bmGwCK500Pppg42Ti5R8wbXgkM2VAtweOaaemahnHiiDjro3q
         A2hWjQTaB655DxljC876C2T5STQ6Ph2u8qtaw++GbEvrVJ0XDTbC3emCmydLbgU1Ifdv
         GTJMj0A/d8NYzxU7n6ydDBuXZWKT1zeOWT1owGZYz7VJ7inE1qry4XPMdp1ATwxDN7ga
         jEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323107; x=1794927907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9ZjhJYgeBT8nslEyZrG/np7JkCr0xptEAmrRjaWc2Y=;
        b=bPZAfCE6vFwZukjgmWZedZ4QBpYa8JwMiFXak3Yw5GTtDSZ1VcKjIq0fy1XAiNneem
         85dhMH4GJexf5/Yj7c0J4Ll7kOYJv5Tvar853GftZfaYuQ5O3FX2S2cl74D9vRMi8fae
         3its6d270grgPN8RchYjIuu9iZ3eTIw80p6i/94P/gQXT5SI+1EW2knpwrwd3R3LknVw
         FzL5qHKbBg+TaffshUm3S3hyFLPsPPUkkBCygzj3B7+1JKOQAZq2lmr5P1/D+63zDQZK
         v3jhfr5asaywz5iv62b9UcGxJ4yQ1t/0XZS5DPqXMiq6+VTf/akuu3TLseuO0rN4dChv
         WFVA==
X-Gm-Message-State: APuU4Z/1Jcy/g4POKdvXY2z8J/N5VrC2fJudS8ZFdIFF7Xm/tLVGE2oL
	aotX5unKiBRcxtpGkOIL9bk0HYkzz6qMT04VN9Qi5f3tUqW8KdZxS9RdyHsa4qxDpTg=
X-Gm-Gg: AYBFou2pNSCiWYzf6sc+qggCnTxm0obVWvrOCWLjeteJb4QO+zfF/gZsiUv/47tE13v
	ZscP2z8GDS8g9a0J1+Z+Y6woLg2+Asr6dQNcgLQ1RVCK0LIOZ/tHmnSUjcZaPko9kNpr29DROvF
	sS8drBw1sggv8QTIRP+bzqAs7MHL3CUefHZCsyNf0PfEOz0Luo9+NoCmbz1gDnqdSWwpuNOcouf
	ucJ44Lu+PmBD+GQHAfKR3PCm3rZlMUv6YhW703bZF2qvFQp83MZ0rHfMiVUUzRPEKjK0EiGxNPz
	N70/w5st2vZlPQF7RV2Ti1WqyAumZgQu8fz+cMmu/VtcTK6wg4fvB4Gi8EHCD6FKbr1rvcHKsOn
	12ixqFa8u3Ywr4JtO7nSdv6Kt3L3DFY+qPradvFLO/Or2TDqTYaE4yD7u1oep9gr+kkFWEqIvTH
	2EFAvcMRr/SZrV6e72V91invEzPYpmDaAKxAi3US5RVPUx5Mc75kF9Cl9oYKEQVWjStk1WTAEXK
	WhK7dRnkLMN2LTS5pUzN+rP4PLF1mPLkG8xspGZ88ZU7TvvZwRbDVLUDaw2UfR3BEOFiszj7fmF
	2WG2WOFkmfOLL8A+rrhqO67LzMhXmpKUYdHkDonjQrVYmxygh5icOZezFg4ez3lPZngf/fbLIm0
	MICvMIrKfcdo6LPU=
X-Received: by 2002:a05:6214:f2b:b0:91e:8ee1:9307 with SMTP id 6a1803df08f44-91eef5e807bmr47437096d6.1.1794323106997;
        Tue, 10 Nov 2026 07:05:06 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031c7dasm22902406d6.1.2026.11.10.07.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:05:06 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@techsingularity.net,
	mingo@kernel.org,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	osalvador@suse.de,
	raghavendra.kt@amd.com
Subject: [PATCH v5 6/7] mm: use BIT() for change_protection() flags
Date: Tue, 10 Nov 2026 10:04:45 -0500
Message-ID: <20261110150446.2452975-7-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110150446.2452975-1-gourry@gourry.net>
References: <20261110150446.2452975-1-gourry@gourry.net>
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

The MM_CP_* flags are individual bits expressed as open-coded shifts.
Use BIT() consistently for the complete block.

No functional change intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Link: https://lore.kernel.org/r/9b5e1573-6fd8-48a5-a274-a6e7ff83d2fe@kernel.org
Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 55817dea7307f..da22750faddbd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3572,21 +3572,21 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
  * because something (e.g., COW, uffd-wp) blocks that from happening for all
  * PTEs automatically in a writable mapping.
  */
-#define  MM_CP_TRY_CHANGE_WRITABLE	   (1UL << 0)
+#define  MM_CP_TRY_CHANGE_WRITABLE	   BIT(0)
 /* Whether this protection change is for NUMA hints */
-#define  MM_CP_PROT_NUMA                   (1UL << 1)
+#define  MM_CP_PROT_NUMA                   BIT(1)
 /* Whether this change is for write protecting */
-#define  MM_CP_UFFD_WP                     (1UL << 2) /* do wp */
-#define  MM_CP_UFFD_WP_RESOLVE             (1UL << 3) /* Resolve wp */
+#define  MM_CP_UFFD_WP                     BIT(2) /* do wp */
+#define  MM_CP_UFFD_WP_RESOLVE             BIT(3) /* Resolve wp */
 #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
 					    MM_CP_UFFD_WP_RESOLVE)
 /* Whether this change is for uffd RWP */
-#define  MM_CP_UFFD_RWP                    (1UL << 4) /* do rwp */
-#define  MM_CP_UFFD_RWP_RESOLVE            (1UL << 5) /* resolve rwp */
+#define  MM_CP_UFFD_RWP                    BIT(4) /* do rwp */
+#define  MM_CP_UFFD_RWP_RESOLVE            BIT(5) /* resolve rwp */
 #define  MM_CP_UFFD_RWP_ALL                (MM_CP_UFFD_RWP | \
 					    MM_CP_UFFD_RWP_RESOLVE)
 /* Whether a MM_CP_PROT_NUMA change is for promotion only */
-#define  MM_CP_PROT_NUMA_PROMO_ONLY        (1UL << 6)
+#define  MM_CP_PROT_NUMA_PROMO_ONLY        BIT(6)
 
 bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 			     pte_t pte);
-- 
2.53.0-Meta

