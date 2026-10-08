Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7993E714C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444646; cv=none; b=tB3ZiXmbXi6gdnk+xve3OWrn+bt5nAyVJe4RNSfY0H6dAlWFnHIP+afzqbWgX5SRkDlhYxNL0rfnV59VqsSV3Kcs+3aO2C+FZXYnkDudkFryaNx2MyPMv/XFtRXWNgLUawg6YJ8kzBL0d8gzhu24txjFWu0pBwB9LtqXG9XWgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444646; c=relaxed/simple;
	bh=ydyb3IOeSGZZobo2yMEh05b4qt8nGnuV9b4ZLbtOBY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUseZ0wooqeQeybWyXtway8QJHwkJ7qxBOW5BocP/SWDBW3zwd1Og12uYZgwBTwG+55/5Sr8vFzgXxWQJCJE8AB5SAMvSBEFEjera2+Xyp+oji7hWGH0e32ZtVGms1BLxK4rx4RMWmwzBhABHeYg0pqeavOSXxRN5p/uWBVo6Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZrD5VQLH; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZrD5VQLH"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a706146559so2102966a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444640; x=1792049440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T793OI/j+CqX3HPTudoj2H2H2daFaSvH0eU6CPZ2Mo=;
        b=ZrD5VQLHRfekOl7Fed/ycgIAz40Z7FXYRRTnc8I/ay10Q2t+Xop/MzNN4DueIwV51C
         u1osP7WGtJvFGe8kvXDzfP3TrUj3f4L4ex+CIfdRTIH1huztGLNJe3+RhXvr7Us+c/ZG
         93pReZdxI+YpIU0UjRkexEROp7of9XV0Z6krnTPLzxFuhcCVTR/IpIu9KNElKKQ8TtEU
         XHUATz74KAlHXq/PzTw8cM0JzcIoastkbl2IMqIn/cj7yYngmF1OcQRGDr5W13SR7HWD
         eN7LAtt37+Bh2Z0RsIawr7DaEfOMm1HHs2B8qJIdYYnhghhncgc9beFwnPQ6ktp1i8fx
         zEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444640; x=1792049440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T793OI/j+CqX3HPTudoj2H2H2daFaSvH0eU6CPZ2Mo=;
        b=CGR97u63QevB88X0tAaeUGNa4LsS0wI1lvqBc7vM2+aL3EMZ0mvQkPmpwizUtkOytf
         W0RkdWK5RzaXpcwuy4HjCJPwm904VZeD70iXpDSZaY3Fae/QSmPhEtgQk7T5rsrVm15x
         Q6mnJcb3bUW78T0OjQLDNvpYZlaEdpGeXLMH4U5halcZuHGK+PetwJQbCJeBeul3q/ab
         ozG1VRXrPrMaFsqlDW1NuK0IS9U+oB00XrIVDlQ46fNcCurgxepFyVJxA9KqxUzEXKpa
         20P70ECrX1jFNWMwpdTW1/I1a9U9nNP5OsRiKal/qqfeTSuQ7yQZ4CDxzG9Jj+yTbUpH
         gv2w==
X-Forwarded-Encrypted: i=1; AKwUvBzZ1KzSpLEztemZY6tWC2xTS3SPmf0dVWofAcH+3UaTmqjktpT2XDq489tALWM0lHGPYOWkVHfy/L1hxKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIonvEKD4yx8mLgUq7wmz0lXSNNhsEtDPqVT8+FJg9elx6Ur5M
	DrPtXCa5jCXwHaLE9N0zEsCDnSSl/aVKd8D7wjzCEjXoZsZVzXITY5Mx3als1CqlO7Q=
X-Gm-Gg: AYBFou0hf1E2WcJfuTgtos1KFDhn+a9K57VltkRkMfH+9qByp/GGVwEd4NmrR0+umy7
	RterzEps991r5MzQM7P2R4R9yA/PKQrlXWF0PynLDKiWP5468Gg2veh3FF1WCKSjRnces1mqR2g
	+S7Po7FwxDuLwMODFlihdv6eX7TAZFrWgIMsL/a1ghbep3l6O/7+JPV3lXahiGJQ4bLAhEdk6vy
	jtFKGu74LiOWFxQRAZ5+aKhPnvqB0GB8V318jbQaul0XeHY4Db0AnZNw6PR+aKP0csxCO+cWJ6y
	NMtzKsO4W5sb3RhbuTq1Ei8Nx4EAzGnBZplvngbe8m8C4vjSmlJcffsxPPCTyOG9r/3YXFwPsJQ
	ASlEmac9KVm3IpIBvVq9ZLkFDgXDVECM0ndRxcPHotsYjv08BLmPby14LkmAHUlNDjOSnsWCc4y
	hj4je5cdmsNCa7Rzt6rawwiyTo52cA1UixkJxWYaIkCYQgZslDPye3W4vvQv2kt1FJwk4HGYQ1s
	1YwJm3yyjtW9QmebfE=
X-Received: by 2002:a17:90a:156:b0:3a8:a1e3:32a1 with SMTP id 98e67ed59e1d1-3a8a1e332e4mr2636515a91.45.1791444640094;
        Thu, 08 Oct 2026 00:30:40 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:39 -0700 (PDT)
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
Subject: [PATCH 1/4] x86/mm: fix missing pgtable destructor for vmemmap tables
Date: Thu,  8 Oct 2026 15:30:18 +0800
Message-ID: <20261008073021.2512665-2-songmuchun@bytedance.com>
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

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HugeTLB vmemmap optimization uses pte_alloc_one_kernel() when splitting
a PMD. Restoring the vmemmap backing pages does not collapse the PTE
table, so a later memory hot-remove eventually frees that table through
free_pagetable(). That path currently calls pagetable_free() directly
without decrementing NR_PAGETABLE.

Use PageTable() to identify constructor-backed tables and run the
matching destructor before freeing them. Keep reserved and
constructor-free tables on their existing paths. This also prepares
vmemmap teardown for generic runtime allocations through the normal
pgalloc helpers.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 70e682180291..a3ea627157ab 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1003,6 +1003,8 @@ static void __meminit free_pagetable(struct page *page)
 {
 	if (PageReserved(page))
 		free_reserved_page(page);
+	else if (PageTable(page))
+		pagetable_dtor_free(page_ptdesc(page));
 	else
 		pagetable_free(page_ptdesc(page));
 }
-- 
2.54.0

