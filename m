Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571488;
	b=Wjehh+kGGyTXQH7ibmKANkyftO9Z7ZWmsZfwq26+Cxca+5AgVIS/3HMhMZcocEGgy9dZ
	 nbzq0a4a/LBjfMM+nuGnrhro+VqA6Uljo/MeqBSv9stcLhFt+3Ab2AVlyufsSOCGuEiNU
	 +1YmR2TCxcMBSsmcsUDQTw/PKZi1ncwJxU8Z7dBsRnBwvJ13YKi+kzmygfU10WFMANKpq
	 VU1YHejgRZlLRDypEdAJiRWf/8zv8gXmf8pQE4z7oqrwJO1R4xUzi9nhWCtSsuqA/CEbe
	 bztcALKNjo0mktT/iO7Fd6GVKiNz3aIjacqLuId92PkZN2BCJuUUpjunplT/tDkeWHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
	b=taxHsmBYg8UAj8OQWCmCJ/doHMrudru5wNb9vlUdcxy8MAuCJQwxSEgZBiDnTNyftybn
	 XNySJLnsR8+yyPYTSqK3U85lR0phmSPO7BKQo2sQNW40Y1oshpyjhH60GorajnHS4PtAH
	 J8Ir6B7be0MHjXcNR6Kb8lf0XSS3bsLwPVAiDOfXjCFRtSf3Xe/IA0FABNLhHB7mGGp2F
	 c8d4dF2PN4c/BwrIHRNBfsecBU4XfGObwwRCmWKqiYs6Vf6H570cqrCMtGfx78iMlUANX
	 R1uoR0wkGSuYTYaBmHzelr3X9qj4JH88OPIYP59/jSA26US0RmtdtWhEC9hOcDLqQ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFEqDUr+;
	arc=none smtp.remote-ip=209.85.210.196
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1989606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1989606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFEqDUr+
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so260401b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571487; x=1793176287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=lFEqDUr+j6HoSBgzxTP1iXUMQ3z3VuCnpKIM7RVCnr+RCvjBHwR3ZHqM4l20d0DJHb
         dItVVtFeiZpKk+xPNUtBgEklIk3QSl6/qkJqK3MGuVwTxJcE5K9WadyI7oGDwKyESK+8
         x7BKua2EXOiQ/mGvwfY7VwWgKMCTODMo1UkY/Hthow1ZTVPd7+sC+pp2lwAjZOcDearI
         oaMaW2hq3Kzka04/FogkjQ0u2FzxTbCZ6iR3NC/joOICsL11Jcj/7xFvT1xWgTbFS3P7
         69ryY26xT889xF8LCyXmtY+ptFtOxJwtJxdpdGhlbl8CRN3Ftyi5d5eyEjLGgBnbnVgu
         umDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571487; x=1793176287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=lwjWCvb26M/CPsa9rrYGlBQTlwzfrikJnZLd6w37y18U4G2Xv1RJfluv8He3lQqgGS
         xm3sjikhVRQ0YGiIFsPWnv7z3jXW16SisCAx51svTASabo5rZSTy6feIzytswsL5b5OF
         OUREt65dF2lWRcW0JNXKLWLjfP+7kddJDzOdhqN/tgpgvCZYklicO+R0dJL1kZXqeC6b
         FkUNYS3x6sp+trJCb/J0nk0FfVatYBXyMRdBawVvkISXSlvPh4PYeOSH32vaqw1gjxUh
         60paOrDah7ZovzT0UrMPRTiTq6lZOL8h3lXG6ManSghlZH22G8d1PChVhMXqgEZALyIR
         qzyQ==
X-Forwarded-Encrypted: i=1; AKwUvByJNBn0DZLSQfCdcADmGPfUqWFTzHQGBTxVUVaGZvc+7rasdM2A9m8lBMdstDQjzNs0LBsD1xooTFZBWNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ5sOMT4HNT2X8H0vczagBakZPNDseRS1Zo5IDjoAOfgMDmfX3
	VdNtBzO1Zha+pupxlUWQeqs17pZYcg3OU7/qttNBUbrlRUQzI5psQQSIijEZ0iNGjs0=
X-Gm-Gg: AYBFou0L06RvovY5kpi5VLd23n4mrOo+JMHgjFcS/4jmpjhIEp4/LwHfdwhG4PJD+2K
	Vtq7g2wYa273W9qlLFINRiCGILYqSAPymbLzZFQtBGP7etRAV0rerCeCF3eRVtrCRslX1Rppxwr
	H5rYT258UcGiqDgt0RMVMVXJFmIGtPVuf5Onb4zPQokQ+7l4iCr1/fzPTl5r0fBLubsX4A39rH5
	u7HMV3pYJcsBMerJQyeqarAdgZv22Bu9caVs4TG6exIgP9ScSTORRJZscgZ3uAkbDsTdR7y9ci0
	0wauMv562x7h6tkgkNmbtOt86ZnCsaq4HGrrCJ7xqz35II1UF/lD+WRXAjg+TXW9dpnp1q4VTpY
	7hfqK0cnVQhGtMbO4IldKZxH8qLsboiE/sxSuWODXV8vZL26G7OjayhVR/YGYpn1VtYLiZoiZqs
	h6dgVh1JSlPNPuETAfSrzSM8BtiEnL02vPsB9eeb9dueJ/O3GntigyvN1EoT26Q/FAQX2RndJs5
	L9IwJ5nXk1+Oo7viAFBkrvyhz0kY5X9lImtVpsLqC44s188wb+H+pyp1o16ws5oBCQi1z5zvOPa
	t3qVjPGwEmHXaQ==
X-Received: by 2002:a05:6a00:2e1e:b0:8a0:4d37:660d with SMTP id d2e1a72fcca58-8a07bf67824mr2764848b3a.2.1792571486193;
        Wed, 21 Oct 2026 01:31:26 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:25 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Wed, 21 Oct 2026 16:30:07 +0800
Message-ID: <20261021083011.2170525-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0

