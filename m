Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3E395AEA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120229; cv=none; b=gcHKgSV2DjQQvSKXZ3t+TlEi6osO1aWfo5v0EnD3N8M+vdRRMOXfEDB+DQ+hd3+djVkDLBCD8NW8/H6bszIdktKNLUqrbiUg/Ftohcg7py2Br3vRXQFaJpUmG5721XI792Ie9UMUxCFx0PgRVRoEPpPlWCj4Gb/nHr5kIhhES78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120229; c=relaxed/simple;
	bh=KS2Sad4txxYAPU7Ulhsill0lGwhrig2221eGQ+9zjh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9yVFLP7kaJEzYKoevUSUvmsymk4crt0MmWUGEOasZK8X+CjKK7HZjWfhkPdZIthHn9CDtVjaGZCgh95nZmDFwkNOQyG+A1F5t8ulGwLXueFibtoRxbd3tDBzEtoY+e2WR8euPSnKRZHEgvcAgeN2NTL6fD95orud5WbiTX+YDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IV2Ytxcg; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IV2Ytxcg"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so1779506a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120228; x=1792725028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=IV2YtxcgOAoslEI82SjyNA8PfCAR1TnlJ+VuscCAUCNz0Z0oQfDszOQsHtHLEDKw7c
         Ipss62GbmLPgat1FPw6rUuN1UjWCrOX1xceGrvDiOuVGNubEPTHDp9lvykxGGZext7JH
         fhzVM4hhjtlWlnhHSZJiWZhGjgK0aUrJXymVyhTrh/lOoQFPdYVwtU/dHPayhtf1xZ5d
         P94FhMjVPxIIMAjiw7znSVoh7ptxkximV9wmtFw6BdQETgMK09Mp3sRKc7qQnKRk6bFK
         lCR/KSWGcbgdpvmFxKK8RfZx7sC0w3Ua/Cz9cC+C7AJ2CxhRLrBKBMxPXj4gvE4OruJZ
         vwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120228; x=1792725028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=AoBuHSbRVhjpP+TZOD7xB6yLjLH6aWf6LyVhcTHf4BUYR4D5a6V/n4sn2zZhOGKXZL
         FGgO3BRfQfPh2+UGCudbFATtGznKt4WOrg4O3mcEm/m1xzj1rD4QwQ6XNB3tJljHwHNk
         nzSa9VUyl451xZPc+bMPY+EhpjJyemQxeUvAI7Sk3Vhqbmf4HOegGdl4niGe4vq2wWzY
         zUVdQ8tgWSU2KdK96wOdMzoRwwf8K6XhFJoWKNyfCAN2FTowsJTHXSfmoaNNIQ87P6hK
         Ksz6/+vOamHo7VRHKRJcHp85pD3mqxoWxsUN5+h2oDfZcKS5twijvL5c9j8WVj79AHJb
         2nUg==
X-Forwarded-Encrypted: i=1; AKwUvBy8KEjZ2krPsXouSyVWZABw/swu16dVs0mvQNX+tTihpORaVSi2LnLkboQxVqyZGYbA42QHAEEZmzjjZgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEU7sfqXpgiHPvnw0QjPv5XCE7sQe7hYYTNwZjNgbjQ+/T82ci
	+JHM7qt+g2eKRFwcxs58iY9xMmm3/2B7b+YbkiPDSzDmR+kuDyPVbbkF
X-Gm-Gg: AYBFou3/89mdPD2oNcGiwjyeIuRPBztNj/6E3gsa+WCEQgBmLR9bjrav6s3tIRIezQc
	RwMRg+mr7Hm3DYkVnHHJPJFNkc4azytZmW4/5AMG+/mVRedzoFq5tmifzaDdFq1fvG7M1HTTd60
	fxuyYSrikq7zr+YLQTg0Wa2u1Crg5jV8MNc1HEuWOtp8WrXoiUooG4ogBn9qB0S7nlE5oHziGsi
	i4j38mbKqXm/w4YuLha0tdpP9Jfj3cXHKtLwGURSzmgEprY0kY2Tb67EA2iOtq1HKB80U/3Itp9
	IkEqBqnttd9/jTuYuQvqLYsZXcsy9ucE3bVwDgXye2+zzead7CMA/KkwJ1R1Sz54KK2B87TRRv9
	3yu4ms24BjWv3bATcw47VNVGuiVzZQmPLb9xIAPYgbweMisHVNzMSQgM19x43lLwpStTt0xW0hH
	jTaGGM3uANdYvVp5Mp9lu2mIQJIUZiP3RGxCduun0mFnatemxpbCDN3NXoIAG8A7bxPOdSzfrBT
	LPNScOkQbygKuTJwHfJXA==
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr16967413a91.20.1792120228159;
        Thu, 15 Oct 2026 20:10:28 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:27 -0700 (PDT)
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
Subject: [PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 11:08:53 +0800
Message-ID: <20261016030855.4062882-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

