Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757934CA796
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767347; cv=none; b=Yvs6mD7xqsL9uuROYR+Q0vRy4JYrIM6y7qaC+JJ5wGcYb0Iv6oejf+QNx6tSsBsxprNJuLSk1wFJjnT0urL/0rPDQEUHx/v7AoeDE+80Pw0CqhMTtzikSRp2LFZWPb3S9u/Qj0Ivzzl52p69CisHrh7YKfhthKDkYXQdnrxQtIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767347; c=relaxed/simple;
	bh=q4vKpBb2U/07sqVSlrSZIeI7vjAKSotG5/o9Z94jkcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6CG355Iv/UpRPiV9vgZwpWtZ0VDXqd2Gq5lwF0ogYjIdhk+mymLXEAFkSszrHOsRt0cbvoOV5cTCBkHf6BfGjC7nZm+vg63IgpACSuuhFisTFxWjMY6iGadhHAh4+UShGsfdwefDytw2q5VIwE9N3w1c4dVWPGspZP5VtYw6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BFsO2qOW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BFsO2qOW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so22098955e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790767343; x=1791372143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3xLO9oHZX09j4z5ReQz7uxeTdbhZL5eq6oXo0UxzOY=;
        b=BFsO2qOWT/RWNckRPK6mrCVUxFSCncRualB1sROwkKS/Ajb4qcb98U3iE0vuu6iVDI
         SEaCZb4uJ4wlgQHaoOHuNxDCWcMciOnDgAnRuzVN5ShkvHJIEf8nAfSLcHwELMdRpakM
         CAR0xiIt7MrdauqMU3XuRmOJn0JxGmGjlQdXojjH3RodSy4olq5I/clcE5ErxbBGyW22
         iwdfBCwHDNVBxXyC/0qke6F2jc/3ULxeEWYmQRjOxasiGhrZadxlnBjo0FWNLH9UoGMk
         7TqxU/iETbnm7FQteo3YL4yTaEONOL1J5xZCZmKtadrNyBF29u6kbIpVCbsssI4niHJz
         yLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767344; x=1791372144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3xLO9oHZX09j4z5ReQz7uxeTdbhZL5eq6oXo0UxzOY=;
        b=ovdJf4/FOnjHBI3f3tA/+enPBBOgGWb1trtdIpVLjBA4QkkE7RJke1j80389v7crRf
         QFM+gNBGVA55vRDrjraM/n8GTZrekcObm5I/BuuhmvWHk0QxPTQIvA5qfzF8f6rcIueQ
         +gI1fvrtFuE2rrSkASgeSGggnHnr/b1F8xXK2wH4oqm02wiUK7F7loGETZzkoYx7AZrv
         zHqnh1NLjT1cjDP0mTS0A/sq11+8Nh0i00vyvY+WmJjA7VLXb4qWozfZBMx1cVbm+oZn
         4aqKECE2vPQQvEmwmwGPjTZCpgYD2OM0XHwydQ0K++CdT0oGRLT9H78Pw0YtnKWImR6q
         otqg==
X-Gm-Message-State: AFuF++lm+W1LCZEDg5pLM5LUy5wRMHnV4NTdMf+8EK/aWhUvOpL0Dryt
	oVsIaRJsz/T7PZNkx7zr9Fq+eJ/I/GnU09YM3/gNtZKGADBuztjn+ABCsKjSHTzh8xCtf3Pe6rd
	s+icNGAN7KA==
X-Gm-Gg: AYBFou0z5HKPsg1oeZbZLU25cvVkGqZSlMXf98mHV27DOCgR9+mm0UAs+l2MUBmGIEp
	X1zQ21cNoLRcKX66075K8G+k4FDzgPapgjnKxE/rNrHUZ839hOSXVmFu/jYSW7SgZwtZP0xlFT/
	mg6DD88c3T63v71z4jHwcycyfFOnfXJUrUu6aWaUOHoKqA57S34HjeFJlyX5y0IkqSHYE810ptY
	dttLTalQL/+VWzIIH6dSdPkPYw5oAaCXCmpKyr2ZlUusnLDjMrLmIxR3hCeCyNeUptU7JzetDWu
	BnetO49+0WMU0yc6v55tQqBBm0OwhsUnhDqAjWb21btAldW3KWZLQ58eQF13Qo2oM2b8ukk6Sc0
	I4dkzujg5EEh40/itcgMuMqjVTvcAdut8HfHKZsP5kH+oJwTSlLPiMPnb1tyn0F1MNi4dEANBBc
	loz9WxVB7+ELpX6x68mIqVmeRcXM/qe1mlkK/dwahfcXNJq8Dww95O9kOlt7T3iUGLrZrn/wXqo
	0HMsIu40lMx6Dl8
X-Received: by 2002:a05:600c:46cf:b0:49f:e4ca:e1d with SMTP id 5b1f17b1804b1-4a01b115536mr19041855e9.27.1790767343529;
        Wed, 30 Sep 2026 04:22:23 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a019740c34sm34097095e9.9.2026.09.30.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:23 -0700 (PDT)
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
Subject: [PATCH v4 7/7] mm: use VMA flag helpers in NUMA balancing
Date: Wed, 30 Sep 2026 07:22:06 -0400
Message-ID: <20260930112206.205083-8-gourry@gourry.net>
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

Use vma_test() instead of accessing vm_flags directly in the NUMA
balancing code touched by the preceding fixes. Keep the existing flag
predicates unchanged.

No functional change intended.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Link: https://lore.kernel.org/r/aq1FDhy00epXXtgd@gremlin
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/sched/fair.c | 2 +-
 mm/internal.h       | 2 +-
 mm/migrate.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6002882b9d30..448c36791d33 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4234,7 +4234,7 @@ static void task_numa_work(struct callback_head *work)
 		 */
 		placement_scan = balancing;
 		if (placement_scan && vma->vm_file) {
-			if ((vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ)
+			if (vma_test(vma, VMA_READ_BIT) && !vma_test(vma, VMA_WRITE_BIT))
 				placement_scan = false;
 		}
 
diff --git a/mm/internal.h b/mm/internal.h
index cbeaf1fc38cf..560406c36a75 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1240,7 +1240,7 @@ size_t splice_folio_into_pipe(struct pipe_inode_info *pipe,
 
 static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
 {
-	if (vma->vm_flags & VM_SHARED)
+	if (vma_test(vma, VMA_SHARED_BIT))
 		return false;
 
 	return atomic_read(&vma->vm_mm->mm_users) == 1;
diff --git a/mm/migrate.c b/mm/migrate.c
index c0f5f3ac71fc..fb4099f245a0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2705,7 +2705,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		 * See folio_maybe_mapped_shared() on possible imprecision
 		 * when we cannot easily detect if a folio is shared.
 		 */
-		if ((vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio) &&
+		if (vma_test(vma, VMA_EXEC_BIT) && folio_maybe_mapped_shared(folio) &&
 		    (!folio_numab_promotable(folio) || !node_is_toptier(node)))
 			return -EACCES;
 
-- 
2.55.0

