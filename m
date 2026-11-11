Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366571;
	b=Q7dPnhrIbFaBvOyxN6cGYdLWjHxKaEMdghcqqna5kQ9WXIB1e/KOSd5usqTqcVOVPaPA
	 p7tkZXzR/j+0+Dj+g95HEK6d9CDCbTNjgNx+dmAiyFHLH7oacqLECoiqToSTgtCkJ13RH
	 wBGlFk88c0Sx49f+5KG5sqhVKb2K9LP9BngaW2vp6NGpfY81bMpP8i9I9k5rjQbfdZ5of
	 8ttt1CfAYT5HDisatBhc+PaZ/Yi4PWfR0a2Hg7AT4G1ENKk7k2mE7uK5eQIJuu5ji3QZE
	 ep/oBJ2x6um1XdqDO42ZZ8XNxyLHFiNtUT3g0EK9k/sHW4V8gNP7hKmcqkxs75wnsVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Km95marAPwW2pP8wgGsfAj1lfQ/5UdjiVvHJl74YYFY=;
	b=tm/Gq1MmCSCytiutqyGq9TOypFPB6+OzG6/QUJZc2qqxzOvaf4IoKEmsRTMhnvjHmjuj
	 KMZRSyCkvL1xunSmeaVEvP22l1hZd6z0Z4B3pEJ+8Wtm27qPkT4tz5cptrzIb+vF4jiat
	 pP1aiAf6Cd8R1AwfwCFNWBrQbxjZzmZwCkMLAJaxo5OqqHhXWpcQ9PIMy7tRaYYcNkw9h
	 NqrREej9Pz4pyFOayYujeYzz8kMxqZjFFfU43TpwYjsdDD8gOrUew62Wc4ETMFAeHkbVA
	 dRtJi9KKEGPFki+Kf7LFqzd2tImhrvdu/15GCzYkTDROKEDo8pV4/rsykemXLMZ1rng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yu6/zSzc";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yu6/zSzc
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4014260c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366570; x=1794971370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Km95marAPwW2pP8wgGsfAj1lfQ/5UdjiVvHJl74YYFY=;
        b=yu6/zSzcY6SQl82moNdVoYbZ5vLT5/Rd5+BUkLSeRPBQp6GFvmlYSDEdB0bcorerSU
         eGB+AwUR9/svhYaJDkU9HMHNOyFCX1ETlYti4Od9Q77/z2jScdwSddmCMLcie4WePzK3
         VpT2ubpPvbPLG0HEbVltBazneZ2kEzTjTpTC6NZ0z8cUv0ODF032PZLTr2pQJ/9MAiee
         ISpFuup72dSCFWP3KQmw52sqsgmjMMGM0ptfD9Wd/uXMGngAivHgJ9d+OHC2Zo/pcGyn
         ShMtOGPObldG6qwxCpF95q+cuU2PFL+7i+Jbb+DiA2aTgMPOXbTUYwcEMO1Uz2ySH+eR
         FZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366570; x=1794971370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Km95marAPwW2pP8wgGsfAj1lfQ/5UdjiVvHJl74YYFY=;
        b=zlwzDC/E22+4TEqUs4FtBdkRRbo69BzWopRHX8TFJs86dtNNvMmkOo4ouW0F+ZxdED
         KbiKBAr3Hn1Id0zXQq5yirxBUuqUxYv9ww2OXoPWBd/Y+TxsCS3/ebJ0LQ5GAnQcu5f2
         s60Ql6MEuMu9PBs5Eh3Oa1Hn9CbiEY1BEryDcaGG8NoZqBjCyeN26NYrGNaleihreM5H
         +KIm8qKI29WLzu0pdUdiX5kf6fvLY0Ql2pQFd6KsOtCFBOyY7mGGa0LIcsszORDFQFOL
         BPLJFZJPWTJ+PcQbwj2mS852D3XR6JVClHtQEOSO9/7lfNFV6N4m6VlhtUmXzTwWq6Wf
         WEDw==
X-Forwarded-Encrypted: i=1; AL+hErGLOGABNCrkbtoNS3EN8begqma/vmXG+lPY9Z21AldFOYcbsj/uzDDwkCKxgkHMO8tGEVwTRfeQKhFK5dM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qKDFHsH/S/UaOdN/kRArQWfsYZ/nZR1KEBVnJUqxR7G2Mj7lL
	LBO+D4+0hEUFdPmOsvWK/bj0KasAasImrajjX08s/YN6D/IEGuJVn7xb
X-Gm-Gg: AYBFou09krcudzXaK7mfCTYEfLk3tAHs9DJY8RT3rL3s3mcWX+uYi+RlFWpU/rRHVKZ
	KUnC3TYa2IGV1XLxnjCntM27TLpaWOm/l1xeIThp+27OZqY8gWr1rA6TdTdfne8WNc5EthRpTxb
	OaN5CusA8sWG/JrSsvUdrLNj+iKRtNWm6CjATU+/y3tScQSBJSuJNGTC7TOED8DmrkpQcIgPgV2
	0bbOO8gVhE0/4k2vtHcG5WM8tJqY6bwMfmikIsF+hLDmtWouTRwdAdcnaztdXpsTQ5oJHJTLMKp
	ta7etDhpLpNf+qJArbOAwkZQHFGrdvv9QJgUbH419X7tMSEc8DvJ5Q32FkJ3DsPtOjsh/tgWfUK
	rrCyP4JVvVbYGBCKdLYjilmhQoRacF37hA8j0NQwN/XGRNBaUHH5eoFmi9pFuxsugjnQAVPuWg2
	Qes/JqDEC9mm7XneyOe8NKvARPswfSpugJjvu6YozEjyjMD1L7PLphP5vMLyueuyEMcCWHkDxsr
	8TlCPutjDuaPR6Qu0UTEuc0pEegX08h/rItW8T9FtqrNa6NeXxoWvh6coUx0dujD//5DAliFMP8
	yoBZdszM7rpertKga1ECGWUWv+whdsvoooQkO2GEy+874IN7IFOqtO0l3w==
X-Received: by 2002:a05:7022:7e8c:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b3c03387cfmr1271942c88.33.1794366570168;
        Tue, 10 Nov 2026 19:09:30 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm9623484c88.13.2026.11.10.19.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:09:29 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 07/10] mm/vmalloc: extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Wed, 11 Nov 2026 11:09:20 +0800
Message-Id: <20261111030920.1297625-1-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-8-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-8-jiangwenxiaomi@gmail.com>
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

Hi Andrew,

Could you please fold this into this patch to use an unsigned long
page index in the walker?

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6a150b11261a3..48240fb674b9d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -557,8 +557,8 @@ void vunmap_range(unsigned long addr, unsigned long end)
 }
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	const unsigned long chunk_pages = 1UL << (shift - PAGE_SHIFT);
 	unsigned long pfn, size, chunk_end;
@@ -608,8 +608,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 }
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -646,8 +646,8 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 }
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -666,8 +666,8 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 }
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -696,7 +696,7 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
 	pgd_t *pgd;
 	unsigned long next;
 	int err = 0;
-	int nr = 0;
+	unsigned long nr = 0;
 	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);

Thanks,
Wen
