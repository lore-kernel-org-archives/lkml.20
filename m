Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DD54C9E0A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767345; cv=none; b=ms/3+JpZtYuja69a4hZBBeNaA02CJnAHcRr1NypB0RQgNSPmOWJ9fAQDF5HobV6XOXxRPKdf7x2qDWeme4aO4RVO6ZqJtkBbMI3fT5ym8/S0vO3It4s8TUwzeakvOKrOcIEJ0mAntvvTImpJKAPU0Xgv7DU6WhA5gd1AXoLRRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767345; c=relaxed/simple;
	bh=PAz3jM+qxPheUnywmGMefqbUgua9gV/9erJXhb6EO9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+EN39MzPD/TGWMQwOVt8XdL5EOgdRquz3CFSkkSirlBkcIBoav0YvCdE0g8mpK2NzZhC67pDQej8XOxozbpTIZou8DuxxDrPO/zp2v6e7K7a5IZgDeji4bwycsNH6iCX3i9glwHJnm4jt/ilqJPKRhWjWLanUwHWyofGVMqLlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TDJt3a5m; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TDJt3a5m"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so39114185e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790767341; x=1791372141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDIeJ2sMTLX9NIM+Zd+dtevwaUNh5Mn6tm+wOwUi9Q8=;
        b=TDJt3a5mtHCJaRRQEv/sw8HbcmPZdSM5DNFjOvHINDUJZS3Svt3uw6BVqg4TVvFmUN
         RTnxWGOSWwN+Aq3R6/sSseG1HWWRa7MQpZrD2FeZ98hos9AQ2jeDlO5BKzInRGGJWGs4
         1LQH4jqDklhEEyjfACNvkdLCEgP88bxGwinAKGkOmMgIgnfohk5IER5E0F6NvrmgFayH
         IjYPVljtPFg0W3AdySR7hastpECa53mU2diKtvfL/jTlmUwvl6bNBKvWPRCYUUqALPYl
         HSm58gooCbwyTrnMk4OSByQPojfCqWXV03HlDL7YMmyxggFk0OQtATjg74WPOpSe/JjE
         mJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767342; x=1791372142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDIeJ2sMTLX9NIM+Zd+dtevwaUNh5Mn6tm+wOwUi9Q8=;
        b=1cGlQHkYZe04QaExqN2cBbYR1wTnSbg7cAkSKp9st/g+R66jt4UtoHyr7nDr4AopOb
         lDXX/kkVdKvL6j3z0vyIbMiNRr4ZrLqn4uBLNrL9aX1GquPe9BWp0gjJjB8Kx0N5kvEw
         X6jdXHWUAyiEpMrl1gK/oVgizSDPppstxFfVO/KiPU7SwUavFZap7cXgJkXlNaqBO9SR
         vJ3QcUDX/y38j3pwKEQakqeyJ9EX8O2GxRHijVsb4dSVhQsanDEDFl7Z/PvylPf0aKSF
         L1bph2HSJsL2tPvp0KYEtJsu+0iZQuZgdD1OnYsRs80zPPhqCwx+gQBADiee5EY7pGqH
         JzsA==
X-Gm-Message-State: AFuF++kUvWXdFrzQ0P1zfx01Z4/bue8XUzNlvN1DZJEivUHyPfYajJ/W
	cpqMXiistsNY6acw6s2ySVERbPKRHeXQvNKRdKI6/V1kADzWMg60sxyFasWsH3xE8xg=
X-Gm-Gg: AYBFou1qAQZgqWnyfzNfV3icqLgHsfOF8l4+3oKz9jiYFzGNXqqUtAulLESnJNSSmoX
	a1B1zGixBTvdBOX2KoUnpTMNZtNrVWr8HoEcPAsK7RcrRA7snANqNxpI372ByADHBpU2BWQDz2d
	7rPQJbp5SIv4oAbCUnH0vcSqCiM1vN7mqDZu4AfPfpZEIzYFg3MtlU/Urh/LTYwNbWdaBrsgVzy
	tXyo9CUer96IcI57CZJ2ZLMI08yvWrbHAXJdXvuvrtG7pcYB6x9rmy+V+lntb163njaYYaiamSw
	49mg2y+oMgoincAvarVySJeswyxUb6yU4lbmTsNly6BUQTi+KS+O6tWVaqgNC3fmBBzffaM0T1G
	mKaM0ET0691KT8T4Nf9t0PAn1BoJN/zvpYQKxtO0VU/ofrhvUtTUMH52o3SxRHs355JRsfgc3cH
	zNNPuLtmHErR1Jxcqm77Co8WFD2YheDSq3eJjGhrn6/0R9I5sWMBIXAmjNri9jkFIFe5otzV+H9
	lMXaL+wgJWGERL+
X-Received: by 2002:a05:600c:4714:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-4a01affe8bdmr20455645e9.15.1790767341528;
        Wed, 30 Sep 2026 04:22:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a019740c34sm34097095e9.9.2026.09.30.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:20 -0700 (PDT)
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
	shy828301@gmail.com,
	osalvador@suse.de,
	raghavendra.kt@amd.com
Subject: [PATCH v4 6/7] mm: use BIT() for change_protection() flags
Date: Wed, 30 Sep 2026 07:22:05 -0400
Message-ID: <20260930112206.205083-7-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930112206.205083-1-gourry@gourry.net>
References: <20260930112206.205083-1-gourry@gourry.net>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 69107e877fd1..b68fb9041777 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3597,21 +3597,21 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
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
2.55.0

