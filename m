Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571517;
	b=A5kOMM4W4P9Kcz3go9Ltvz8UI4GtUfoCP/XH4701GN7Ar3rE0O56hcYL+CfsOLAH1mi6
	 tKo0uGfacclBogII5oRaa2v8V3lAFPF2eTS79Rulc9P7MgP6G9j8Joxufgq5ZDeSYl3Yr
	 7lwqhSm4sQNEifcSmno7+FenOIsuecSzYBBkba1PlqL94VwmUmOF15rBgAKvGEQUtPRtg
	 ShEzdBXfo5YmZx3ONqbfqnE80CDdFpFdw/MoQGrVyFDKageBwgHzdT/o3TKPZglcxYWcO
	 Mruu6mx4iKW+RPd+f0TWTDLW6+yHeymzyjn66O/1WPkpLYPPsNsIwK7NTXWQU6itlpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
	b=K+VTP7Y+7wplIYf6Ke0pEcIl1zkZbEYO5Q87weYPJ0m3Ytv6C9lzxLYjRwt/Ri7Ztet0
	 w6ITOG44bvnOJbM1hrF9Sg4i0qEegzZPLPw6qh3y+ifsFTPW8+b8v5Yy1eRhMfsGT+mKX
	 XYWy50v7WSMsrbcyji56C1mS/T1bv/l49Lp11i13Ocayv13L5aLKODjXBjl2bRiJwE0G+
	 OlA327dMh9RdWe0KZINCdgSMZHHrKK4rlmFbUiHPaqH+lkjnNt5tIJSrw5tGnz+8tCSto
	 B0ZkuynmZjbc3bcQxPOb/FWyaiwVFaG4MW2p+qWYoot374TT0yOnl1WeU3AQc8O+fRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RfxAPKX4;
	arc=none smtp.remote-ip=74.125.228.7
Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A79F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A79F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RfxAPKX4
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc53988d9f3so139691a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571516; x=1793176316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=RfxAPKX4hl5aHIBy3oFXof9+pDCNo13/d4gZ6i3Xrj4dC3l16eIihKPf9+C5SGQMq8
         ummbtZ8wwSXd6s+KGHxTrbAUHcNvP1jYKB+EqMh3uoeVloOYUGvvTLjPnITpOFcNb9TC
         79kCk38nYiUV/Ragt4271UH2xvhBjMtbux5XHYX7xO1Fm4lyWnoGBVz4mB3zA1IIlqbS
         hCjnl+bXMBGHJRY4Lbfb2gKosbDtp/3LVaUQqbP/4epINmcByOPHPpL/sI5E9cAlQfmz
         PYZoiDmYPOyJjyq1r8yuibxtwhk7vE4vEn4jA9GRvnBjhbzJcpca8TnMrb6n094qAqXY
         Uc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571516; x=1793176316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=1cHFRLE69n+LsA19RVXPLwDnPQwApc3Q22kgY5E/fRgOaHCfNzfENoAMUWPdip3A2B
         tUCi+/ATIeHiofiC/zX7BW413oZUhX44JGAFqoOqJ4CV7zxUVTclhufcR30OUm74WZTr
         zz/fpIkyf3HY0eMsAjb937Yn+HDd7KHMl1qaMN9pztdEj6uL/pBX21kQx3yqV69Oilyo
         Y//95+e1DqFlVu9ea7jVfzvUXM4Cb130cZXRqOLngkF5ZB01yQldZPO1lMo+UNjQPGuy
         uOcXp04Hk87gPRyHHGrDC70mTBE6MOgLoBaWZU0AWlIJ+XJP3icRBq2AHnFrOkP7jLtL
         pjRg==
X-Forwarded-Encrypted: i=1; AKwUvBze5qb7rXDoF8iG60MA368Zz4kXS+3gbYzXBb5aCIERP03LSawzef83VAIcU5hhahdijBaWvcVXnkV9l60=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8erJmRndsFKNZkOzSdkarkH96pCghWfZHk94STd92HSUR1n1z
	d5VGmqHg5odkMaC/fSIJsF/iHft+E9ZBnMITYEVRDdK2Kh1xTeR3l9cz
X-Gm-Gg: AYBFou2iLL4RHAAV33T58Df3kkLF/yHYYlDYGUx8u8Fhc2GGZKytte0RYE2/I820Z/l
	wtHVu0SmvK9H+yUOOlLmEbE67A1DZ7PAhi0xJtCTudfu7n3UpiSMxpvyfmNCqRTgNhR89AFfuL6
	AjGyNB8a4255nLaD/smpP+aVqNqynrVL6C09kVR8DKO8CBKQjfaz7vDAnBTw25eayYUwcTGDh6U
	3cPQQ9KdHpa0DLeFaBzvnUsQK2fJ6F/tArZltkLhQbtc8iSnwExs6XQvicMez4/xcZWwSBEYyBs
	64SP6o/vD4+99plG2Xl7nO6GAcgMO+3LBw4xJ+rq2WuINZYKfn6VWncjziI9Qhl5pOs3Po9g+T5
	2Ux2voak6Fuj4GgI1ro+je3cK4hEi1wopKFwO41rHRdR9VypClHuXlwSuZFtMFRX0pcdmmT9EJY
	02+pnUywlbFhQISIsC+rh/y/tz++MypGVh9yCveA4vZXtlEVUGoHWSqXw2g5N5d75VqBXzCMVsb
	TyPO1iJGY6lVf9pZ5feWQ6bIhWi0OQEn1egqszoe5O4MnWBAcM/zuOyWyvtyy1De6oc+w==
X-Received: by 2002:a05:6a00:21d5:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8a089de73admr1183835b3a.26.1792571515803;
        Wed, 21 Oct 2026 01:31:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:54 -0700 (PDT)
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
Subject: [PATCH v9 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 21 Oct 2026 16:30:09 +0800
Message-ID: <20261021083011.2170525-7-chenwandun1@gmail.com>
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

