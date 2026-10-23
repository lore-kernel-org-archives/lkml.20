Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737296;
	b=kpe7BuhhPZItcYdJShVEUiVSKnQGNBNkV8lwXuMxQ1YyK4Wz8kiZZYHAMhdk+YxJopGQ
	 6mKDtXV9rZeiL49K2WsIUC5yOKIF/o5v43Rp0cEMqs7oxpszJ4dwVRUOzaJN3Zy8JGlGd
	 Pj44PhmDngELohlo+99CXMs4bolRc14k01E4tNMwF7i3uWsdgSiDkOYMpYgekelsU8Hcw
	 ysLDGvBjHXIwtNgkczu8uWCogHveIBCwyHJ6Qyx6rw0qa7+zpw/uFE3VvKyq6nZux+MjH
	 feS8cZvlwxUplM900GnHZPWXdm092WiJJ9b1YE9PcvUXy0phADpUmlddtPinyvKvkNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=;
	b=ck5cmioanQGrNbS6ix0heRUWgaDzOxXUpyo0xqZdQ6tW895zIJAvBOOZPhiQBcw5Q2A/
	 HbjOg1n3v1zS/F9REYrSkEQDC7Jjz8yHpe54ic03Rj+JM/cNTWAcAYCFaagrR6pWRpB4n
	 ouPrhf+3I6z0+eqQtBjKHz3Z9FuIT8NQrY0sD7uluN/HVxL2XHpvhRb7Al2BxtEDTtCBq
	 LYwD/kJj714sAEYaz1DVJ4MK03NxnJtCN0Y8brJnGVFOH3a1Dxblxh8fOVnb60Fbb1Q5O
	 GSP2XPc8NdsAwLEiOW8OtpuCpcxnwmaVNsy9H0r7WcVQm/rSh+HfGcO10yfBOvpaqNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=S6UphPG+;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7E6606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA7E6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=S6UphPG+
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so448161a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737295; x=1793342095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=;
        b=S6UphPG+rRft9PJK9LNUZxfkqKKdBYGxMdEU19sUyV8HeZ/ImIX25itKyinkC02Uou
         0y6k0QqWX2M3bYEEIe8kKa8n2Qus54XCueOawO2ET/KsBA1iznnIdXGFKJVjogW6t1ZD
         e9aaun4U7YIIeou0+NInUXRIp5wSU3d6jk+yPJpx0M7luC62QcyIC/1cHeq52c7/+Fih
         zln6TnPTfPhSjBbXU8IZy050hDS4R42R8IGjVvWixUHRqeLAAfLFTzdsEj19kwfgU1Gn
         7EQ+59idWYC1ZHB4VcX73UhSyQn2yxXfi2SWvDoIAZu4xHQCrlz3iJS+p0UFlco/wmUQ
         0Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737295; x=1793342095;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=;
        b=JeLPmmqULueLXTTF/8+RrB4s/69J4xByW00tKf1pkzsbxLtqiM3XCtKvUJKJiTgfE2
         67z7hctp2zCulJCsPLtHtnLZEB1ulV6kAPKlzAIrXRvD5Bu3aOiH/mRvbgk/hOBxdhTB
         pzY2VDc4iQapXgM44w84hvihEunkuCWY4sia5Gm0FZi5zkyE7U9FjoebIRZpp2NpSZsI
         5BM4jSvV3lSyHxf01Ot+k5nBP2RHT2CimLA/5I0Kvxcp8nza81QNZ+K5MeuhUKpEYs5+
         qRF8plnrE+edQor4Ca3hiy/7yp+cxhYFG65+qYB6g4Nw2I70Z7Hn0sBNJyx/q4Llk3p6
         uhdA==
X-Forwarded-Encrypted: i=1; AKwUvByHLnkT8XPbDAiQPXxElphPSVGKgAWM/fARYHh052OfDzfQOblkqPkgpr3My7tYwQztbIGcEy08FnnDTQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+hLbhutkvG8mHWSS4KQGoMR1tPxvcAZimBldM5uVUfiYRSPDb
	prLyzZR4S33DvrDneMrXSq4qmrCP7LYiiPxgpYC7Jt/twNplJprfLP14UZwyYag6xB8=
X-Gm-Gg: AYBFou2DPIxwgxERnawj6g+dDmjXt3OePd0t0WJwPPDsWbapjvPaKjwCFse+rjcipzz
	ROQJk7njArFUNLp3Wb89Yyq/aaaBArmqvLZ2Z142NOQbxxYXv+NEmaXZXwcSfMsgHMv0KhM9XEW
	kFB0Ojybq2oy6iOLUvB5UKtPixiTd8XmS1eD/ytox2AL5b7R0tbs84vD2ap51X0a+mpYIxk6jwl
	0P1iJIrQyNyACaahARxnt+u7PloORQzLlu8TGwevpLn18DL6zAAU0sNpyHEeIxZjQb2j/M9TEFj
	7ye9/tvBwvxMkcPvtzQeoe6SmCBLMcfAc5edAmNlIJX5k/11t9R1scch6FhdlKv1bOM+q83ftdY
	5xbx1THn2WnAg4F+i25AeZq+NEdmfV5nqW3IAaH8eaXlxOPfABo16UHKOQDP/PdX7abddRokWCa
	2xZUzfrgshdivynZG8iWSpXVLrI51n/YgTB+qu696Q+MMRoXbJkJ+JTStqq5PRA9fIStg4QvRQm
	zcejUlus3L4FpjYuno1X48jPMOWPp/K2zoSg+2loFDg1X2tgxtMa3t8GCPB7X77kxZEKeQbQOg2
	HA==
X-Received: by 2002:a17:90b:5487:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3adce1737eamr1157717a91.61.1792737295119;
        Thu, 22 Oct 2026 23:34:55 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:54 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Fri, 23 Oct 2026 14:34:27 +0800
Message-ID: <20261023063428.3658761-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
pgtable alloc") made alloc_pud_late() run the PUD page-table constructor.
However, free_pud_table() still frees non-reserved PUD tables directly
without decrementing NR_PAGETABLE.

Free PUD tables through the common free_pgtable_page() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Reviewed-by from Björn Töpel and Kevin Brodsky

v2:
- Collect Acked-by from David Hildenbrand
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e111d25e18e1..f35fe4cda89c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1537,10 +1537,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pgtable_page(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0

