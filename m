Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DF49480F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101786; cv=none; b=BAp4E/sx5LHZrn9f4CaQElBUy3b7zvR+eSBW9JWjDlyR1GvOhaQ4fWKedkhhuNYAgNb68RswuBXjHiPZ6LAuJZE8G4A5KfHPDtTk7VpcQM61/8/YDH7/+8zJoJo9gQGv918Ann7vcithG6e+qclvwnJF1Ue8Gbg/8ZZS1mq4YbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101786; c=relaxed/simple;
	bh=h5CQimn+pnGcNICzqnW9+AOKntw/eMMcYRRlL+m7m9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZU73kHJXklIs0WMAe5ioUS87E+btfRrdYJStEGmufiVedXaNChOar5x8OumuE0G1iPlkVu14o/vW250dybRsTfySK8d9IAJD9s5NFxdxpmxFbqkMSXSknywdhSFJ0n1H4032HqgTbipKAPctOvFP53yWI7eRwtHC0WCWWd3L8/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SBD7C8Gi; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SBD7C8Gi"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadeb0so14589185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790101783; x=1790706583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVt6tYIl/AHtUN/63hgHvGCs0fPV42UvfQxmNYHhn/o=;
        b=SBD7C8Gia8h4vFBY3RUXVtwy2dNdNLs+cNdaecaR++yTtXzW+UNFho7nAXf3WNT1NE
         vVO6wA2VDa7yhRky3t8FVAKOwb1VFyig2M3BQFZ0G5YCOZTxyhcapJB7mjpY6go9fzwz
         33wIzxfo5GVo43m7stLuA0Jow3J6rs4Prb7GaUqB+U07Mkim3lYYuxhswGiKVVXv5wU2
         FbV0aOQtf1IprAi9rRfroZtGfubF+H6Ppmwtc3MQZb/emfBpsEP4BuThcUehWm1HmIMB
         J5QXBMb1sIOYAUkUqhYSyVu+WHqj8HoB/zTQf3LRczYy7taRAB8smdsWPHxNNp8CvrZf
         1c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101783; x=1790706583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVt6tYIl/AHtUN/63hgHvGCs0fPV42UvfQxmNYHhn/o=;
        b=UUPQmVXaMaa7xZE3BuugXXGhoQJW22YP0Gzf5SR0aWW0k224fC+xKP7DaUEGFMYNRl
         SU6o9ouF923cDY82XhKhA4eQ57k1Ku8VqK47Hky86JmBbfK0sTTq7VdDkX4wUIsg/Zzl
         XEg17AlN0UyI5U2V5PjmZ08R6f6KfnT+apJg2VurB7XGfIlAH9lPfmDBsDZpdPj78r4B
         oieIJG96Himo9MRh9lFLwzyk5KEDkz9jDt6xVDW7cMoYjloVngQZ6fI6I0Yr2DSTNunU
         aA9FEpGiAWIdmmmJ4EppInr4zjtSti+5NApVPn6Ix4Dbk54NKs/2NYsTKCy5KwzhDnnq
         GZFg==
X-Gm-Message-State: AFuF++l3XoH/uNhd8v+S9Gf4w93zZs90r/PMI1e/NB8QNoB448cUdH7j
	M8/YqLVnXrEDE5URwvDSXpcgJQ4CVFs+flQ56tHPYeyRnJDWg5RGTPQg0g95L2rqCJA=
X-Gm-Gg: AYBFou14fFNXyFmb6goIhMSzSpMi0iId4WV+k+ieJsI7/rI+m66z5IC7GZlcAg6US4e
	9joEB7zHhoGa9pGfRpe6JfD+1E9x3ntk1aVIUCaYGEiUqZC8gF/FdF3Z1+r14bEltNAkULQimay
	/3flmn4lty9inFnpXuoN+O6WtBitGH0SYzWpPHLJJgbU/3lSKOALKFNnP7pSj5M/S4UwxutEXqe
	6/V/ksRpINUQL+0zLGGyyq2GEC6u68Ll85dYJi5eEB7MNGuS3N6wVYXUjU3HH5Mhe2gbiLl2bKq
	xW1Zn9XfBTPJzXYsBMdaP57rl9VZgjy70Ik+6phl7rsx4nRClSzZ5hSAKQxfE/L12sMr3Wvj+Y7
	0y+sxDZ83mwXhILCAjZIsyEKkGM8w2BDvUoqHjMY4H0NCXsJFljlZknfn6BFeMZLm8+zdHXtbbF
	Xkb+8p0dmBjS+5SlMxEh4wY9+fTbR2MfygJD/GJ0dBYi0BUtEVouPHORUNQ4w0BGmDaVQBX8w9b
	vcp3whr6amtRFuPjlfUKGuOPErWOCrdXN656ceogFdOU40duBqdsNmNwPFZDw==
X-Received: by 2002:a05:620a:19a3:b0:930:9585:e08e with SMTP id af79cd13be357-93c25080ba2mr41386185a.10.1790101782763;
        Tue, 22 Sep 2026 11:29:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24889ac9sm37130085a.27.2026.09.22.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:42 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
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
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
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
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	raghavendra.kt@amd.com
Subject: [PATCH v3 6/7] mm: use BIT() for change_protection() flags
Date: Tue, 22 Sep 2026 14:29:27 -0400
Message-ID: <20260922182928.2199090-7-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922182928.2199090-1-gourry@gourry.net>
References: <20260922182928.2199090-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

The MM_CP_* flags are individual bits expressed as open-coded shifts.
Use BIT() consistently for the complete block.

No functional change intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Link: https://lore.kernel.org/r/9b5e1573-6fd8-48a5-a274-a6e7ff83d2fe@kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 225ba26c9d503..c2ffba42019c0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3596,21 +3596,21 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
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

