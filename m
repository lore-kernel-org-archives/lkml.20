Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751FA3EAC8B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444668; cv=none; b=la2dEKfGBYDrJ6b0b9b/g71gTkeGKcUqEYU49HwY/k+VqtluxH8ulD1jxLCUUR5tk7nsXpK7ByEMCxqg9qlBj1QNXji3uk0XVTgqx1IMBaNnoU1jvZTcDZdCQO1mTvZuasGCl8s34hW6A5NgUfMS/i9osHyWsI9N+AzwYMvT+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444668; c=relaxed/simple;
	bh=PUS8vg3eKrh52MewEnE+dnBAdvwDYq9NGtz9BnZ1fUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2AxcpdmTlocmUol6XUUznCuML4alJk7hCfvRlPb0aMOKbQIQuT62fu5dPV35Hk2TsX/SMdCvUen28DO5tA4DNRMnAYezzRHOesM5ret21FXxL5xoceh09FX+w/PhDDJ2twWFwH39aieZLh6pVHYBcF8h5q1+wHIvfveH9zwIng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FpovHUhc; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FpovHUhc"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so175734a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444662; x=1792049462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvkPG82zfhFkpnOg0JOtNiptSg9vrvtxMEvoINVoQXE=;
        b=FpovHUhcuDEvm7F2ohacfhQnj5Il6NH9HXU9MtyERNKOj2wtaBebj06SWmgZRamX12
         kKaRUWgcjg2CvcSDUAewqYWidoXztkaI+lGG5YAVQb+ZnM91vsZS7+VbuDzpVGQq9/g6
         d/IdDa20ChtYGcgWs0RDJGi0gJp8xMd+lknh4l9mIQOIx82RcJnD9LzM7MbRoLGpv4WJ
         X0dKunGBtkvG9p6/9JMnKp+Rc6irG1t5BO6qlap5Ye61yDTSMKNrRTweZxpWW+4p3LWI
         PVLxteVd7gJFLPX0F2VoTI1plaFGAIe7PIx7lFkTzarbLgFVT/+3VWUU/Lk7bWlu+Xq/
         D1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444662; x=1792049462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RvkPG82zfhFkpnOg0JOtNiptSg9vrvtxMEvoINVoQXE=;
        b=MNoTNLL+XbLP+oG8sqfFcUF1Zrbnn5vDLPrPVM4OGCB40qAy0UiAvWBgnHPXY2g6lx
         NmUahY+db6weP3XA9rWIRdcbOigRNxGdPfFj/wIl4L6FJum30Sc1965Lm48NbcfHpPkB
         /bAKKVdB3ihPS/dJ4XgDgeViFQsqtNMhIy4XSn4J82QvLum+BzVv1ZfXXRQv/q/RCKzo
         QsBltd/5HwQz6QXRjXa6h2ji3NN8kdLUdR3ib6eUma+sPeM4HgRxjpGVkyE1MWxXcN11
         74MIoaiDO8a/oXvyJHxA8au5HQiFHT1RkFjZ4Rs8Z7v4GD0pqwsdqBd5dLbhxMiSqB6H
         AJZA==
X-Forwarded-Encrypted: i=1; AKwUvBz2O0qPesxxntydPESz7mxN1EWETqolrhoIiH/zCIh04IlObrvhlru+t9mMCrMKQFpxXfJr8NOSGGU1vgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZeNwFBsFwvixcaH6rlcyUItaMDO24q6PwVDSfIcAcTMejZ4m/
	BdwGae759Eew7v2OKcrpMUhaLp3pDSCk8OEj7FFVydXeFykZJUZZOvFow5pBBbUkgZY=
X-Gm-Gg: AYBFou01sHquJ/RqIxVbzESbRprAgeLdWXUDW6ytgPUSPQrlu17lM9d9B19+6LB4Zil
	5/RrCc0uh68DzMxRM71OBY4swL2HD4TaAnJv+8zkAI6daMG7CHe129CSP6nSzFGUzncadpwsuEL
	VVWtiCkIYAPrYt26RD4OE6DbZMPrDK2ZYoEmwOrHQTuO4Y9zEwl0zFUrEEHV5xTeOmIJyaAeziG
	/WeKrN6tyv3sZ+MnJgCzpuyJFCujXdFkCWZCo0yaiob2qeXq9wFDBrodYxCemE1fTejDFkifcXD
	lPW9oH5xxMEoMMUKYCC2fLFhLEmBu86cycm0rv74C4ZAykh/lNSXjYPaffg3zNgARyX9eHdstPb
	wNbwmlPXuRnTo0tZGPTDtim4PMw6xmnSx9yCr6xJi91oW4lfEEsuH7V7rQt+UxWI2+I84JUkEOq
	P8FydVLN8NUtq6MzDy2/Gfe5arKOwg1M8jbuBywz15nqwFHfpbwVmvgHxrWgv3hfNzsb1IwX8nI
	AgjFadXeP1+EHxA5Lw=
X-Received: by 2002:a17:90a:610:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3aadff48952mr575784a91.8.1791444661248;
        Thu, 08 Oct 2026 00:31:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:31:00 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 4/4] arm64/mm: fix destructor for unconstructed hotplug page tables
Date: Thu,  8 Oct 2026 15:30:21 +0800
Message-ID: <20261008073021.2512665-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c594b83457cc ("arm64: mm: call pagetable dtor when freeing
hot-removed page tables") made free_hotplug_pgtable_page()
unconditionally run the page-table destructor. This matches page tables
allocated by the arm64 mapping code, which runs the corresponding
constructors.

However, arm64 also uses the generic sparse-vmemmap population code.
Runtime intermediate page tables allocated by that code do not run a
page-table constructor. Freeing one during memory hot-remove therefore
runs a destructor without a matching constructor and corrupts
NR_PAGETABLE accounting.

Use PageTable() to run the destructor only for page-table pages whose
constructor initialized them. This keeps the arm64-created page-table
lifecycle balanced while safely freeing constructor-free vmemmap tables.

Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing hot-removed page tables")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7343ac9294f8..688b33095651 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1495,7 +1495,8 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
-	pagetable_dtor(page_ptdesc(page));
+	if (PageTable(page))
+		pagetable_dtor(page_ptdesc(page));
 	free_hotplug_page_range(page, PAGE_SIZE, NULL);
 }
 
-- 
2.54.0

