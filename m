Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701059;
	b=dwiqLZjaA7PBel9bGjpygIFRVZY5YbTl7Mo9rkIIZ5IA26ObqYZF/mcBZ0RmafTiFIA5
	 J3ixiwLSoWPNfPaGiV22n1eTUWZVeiwsPFarF19URz1UMn/ARbqjMX3uEyDZ8VKoqQui0
	 ujEclfOZC8lzWU2vWC2Q7dm+wMoEZtQSBOCpZM6q/67Wv+k+LFUcTOjuRHgroUfZlnG2V
	 8yJeYZxJ5qg4rkdW8qU7+glxv8ml+94jdKZHzPJHzpRfhXu6ZhZ1wnWvtarUwlWFdsX4u
	 LK4l6PX/+HbtRE+mTwfM/U5HZL3mTaXAI1fRgkY746CoqMa5uxRDOAx171eJ2oeaonw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LyGJat/C8ooo5bLDM+7UJK/pGeUEXPhrPklQUuKrBbo=;
	b=sAxmpCGVRQZeg3RRD8DhOFE4NMZxm/nUR3h1iYsaCAp8q9aV5AnqQU+68GZ14FTKJrpd
	 +KS0CMrVlQxgjHrlu/1izEqLtvB7FbVENyqJcIqVeYgYaOYWQo1wa3ttjLJB1AiVjqS43
	 XSlbBb/FSsAjlr+RkKVbCMIF8zLgfGaj/XT/xE6l6BYjYUPtWStIbqeVI6ipIZjaiBQqf
	 c1kxgwOhLfwyQ3xL1Pz5HFIY7LeOXPd6S8aI6RKZqRkH/CwdZU+GVRD9KlOT0WevI4jAf
	 zbv1tEMUPvFaVV9yk2Sm+vizpwx3MpbxwvClrKegSK6JpkDevNRC3uiAXq7NACAxYRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnayzsfL;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B9E606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B9E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnayzsfL
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so7479532eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701058; x=1794305858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyGJat/C8ooo5bLDM+7UJK/pGeUEXPhrPklQUuKrBbo=;
        b=bnayzsfLqTs+eKOv8w0V5WosDFWhGhb7nwYTs3aAPHPc5f7JRsOJcD6s+yHL0OJSGg
         1p9zSI+SzNlZh7hwyoiCbLB3QhHP1wVnru0SeKNm1evydzDbYlq6x5Ge+lgmrYWd/rma
         9/dueA0pidPNGmwPTs5wKISYiKS7tHGfwwUNceqt2q9CWig8XcJuPoPHc25JFwO90eSl
         EwNyyGmXc9/C1qy4oB8FlYyWAMuAnAFfSjc3vXxbgT55BKTne9EatLpJsHpSaNv+kXru
         17l7MBrB4NGvJcCvy2DTe81ajcTfeQrRFB5VsKqDO/zq/Sb0pgF5aG60RNsiFVgsNZWS
         0X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701058; x=1794305858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyGJat/C8ooo5bLDM+7UJK/pGeUEXPhrPklQUuKrBbo=;
        b=C9wbwVP7leVDwFt5bzT+re+gjp3GmF7bGxJ/YlCGed2m5dWkzkPbKsyW2VYrTFgPI/
         v+QciOJISxaV6WbPHxEa5+MYrI5GNErswrFtJ4OUYcR5z2jsZP783As97NWtzb67EhlL
         89J1x7VjURbCQmBY4vPUk/Ph91Xu+eG9PRbWMqn0RcW/kDDkscIXNWAUvUhc7vzk+2/F
         ns/vUcwFm5UoV0op3JNUvf3vxsOeY8VX2n1x2ovOK9TWob/hBcMP+r02VaLoTeFV67XK
         glNqr33CptQKqxc370ysTgPQYea85GYGksyd96U57WWC/myp3cLuvAfJvIHkQ2aG2rBP
         xqxA==
X-Forwarded-Encrypted: i=1; AKwUvBxMe7gQFPL+EoctH9pR2c7wXGr+YcH7STgFHp4N6A+5nsmVQuLfjVqTTZ/ylqrUrcvdf9096sKajHi1/nk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xJCC0wlZyvm0N65g6mai2j3xaE8rFs9zsFaimIusP0vUP/jCs
	UyybU5HBsGJ+EEkpW26Vw/tAKEDvxFhL+SByMsg72AijHJgTqNsUm34g
X-Gm-Gg: AYBFou0H722t6T1ujKarcPnPxy4jUmWaLJAdo/hyHBEJ0ZVghTR9kHS7iZ+0YY4uvE6
	ArayCiTvoIIyDctCMq/0MbOs2SLN960uRmm8OEuCyf8bd1Zy/Z5KH4eoSSb0GHmmbcvrmWMGFpC
	uAxzWYdtLIlTnwoLhw98LIePhfxo96QWnbl+lem1yxaIDwgeIloQuFWRgxwZNxUTy9LPcIUe9YU
	PUQYLySx/HPfXHb2njSd4xyXr996jwlsndVhgd+ylRhlPypB2WnaAIUiuFBDdgeag8aNtUmDyYE
	MT7/IP8u6m1GDXZ9aof39oxnB3qA22KTEQiv1w1ZzTkpAUz4APCbbjAw+NLHRYjN4Kk5VfBOD7o
	ucQsrH38rucK5/7vNG8n3RvAgDLmXTcr9yt3o4C2qpdCSSRfKGTOxkZL5hBcdHfPCdQZMM8DTxH
	Furzg2GnQ6fvEDgPreJI6m11Pi7DsQ8FnuwEK+jTKeD0TYSI4PSr+pu7bVvoPig+/9PV3Vuej7Q
	nuSFOdlEnlE8oGF4gpka7sDZ5vEXoIwbyvJba2I3LCTReDWuLnrJT/u6EmodPdLSis+J1WFPwg6
	8XspdmvJjCg2KyFpNNSxolCxqGltGg==
X-Received: by 2002:a05:693c:638c:10b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-36a423c2ef8mr19548958eec.25.1793701058355;
        Tue, 03 Nov 2026 02:17:38 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:37 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v11 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Tue,  3 Nov 2026 18:16:52 +0800
Message-Id: <20261103101658.766905-5-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
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

From: Wen Jiang <jiangwen6@xiaomi.com>

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses vmap_pte_set_huge()/vmap_pte_clear_huge(),
mm/vmalloc.c is no longer a caller of set_huge_pte_at() on arm64. The
only remaining callers passing &init_mm are in arch/powerpc, which uses
its own implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa..ce247b06fe03 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
-	if (mm == &init_mm)
-		flush_tlb_kernel_range(saddr, addr);
-	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.34.1

