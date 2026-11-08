Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153393;
	b=PZe+9pseVN0rGXHjQdmLilRKfEZGplNtB/ePeYX9o39dXdaC4ab8OTFo36Qjh/6S2ykE
	 6uJMdJj1GrFpDYl7HLDnRACSpqM+0SznMb/q4OouLM8JTsj8dfQz95IepK58I+OGUmFub
	 ywKX0+rDBSNK6TL7s6ooU+HC+F4KH6CBGcOpjEs4LjZ93zdb9N5ooXfN1u9da3uFDRD63
	 71wkGc4ceCylQgutWFdmJEetB/9uN8Yid8DebnMNtn52muAyNQxzLmhuhbXWGggANxORx
	 L4vdJLmHAiEHo2UUkARolfB8psAyxUW6QNLqrA5oTGj8U6sCnsAS0/d3oYsxrJNNOyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JK29MDVmuTI3bC659OetYO7/ux09RXcoPKlf4Kypjy4=;
	b=IDnNoBkFbIl9D5nvFdl+h5IP+ULgkh7R1OjRT+fwS4calM+PaI5z/R73wLdiz1WnbsKE
	 I2J+sD+8Qq6SYXkkXshLZuTxoU6ZaAn0/WpCuKl7S9dGgteA8ZkCXuU/fv7Kej5smVVj1
	 34etsl3abU6Po5dGY2x2HpJj12xNqJrrYMkShsTUoIgCJBtGToRv+XfOA0lRs4OWU+o8b
	 SQzRVNmSR8ALKvANDY5o7mm+fpZkLX2hqDxfpvN5UbxBJ6ZUsGWmYBDedbqezAkCfgpaj
	 PH1Yaxa3h0SC/L1Pr0pJoie1HWRrXVtab95tdyzlnlFJ8o8JPQ9MSOIO5D8UcyqQGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bDkv1Z50;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD19606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bDkv1Z50
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso37268e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794153392; x=1794758192; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JK29MDVmuTI3bC659OetYO7/ux09RXcoPKlf4Kypjy4=;
        b=bDkv1Z505mRfqOA6qru2nUW4NB0bvKWtEA4ey4xtccoDZ7J9L/EeSkSSL4KDZ0ry+c
         gAPBHGtchuOL1mLdEUP7WAzvYXBA4OK3wRgH62ZPDvNn4Yzvbw8J3kJjRtGwruOEPxOD
         wyPSjmowNOUsgKqAdB8AEFA64+DO2YZj/vdUoU0X+qjwnJM4fjP0Amzcjl7GslijaM//
         pp1DAZXWQBduiO/MDnEv6kZ8e7iNWfsqOt3qZwJNAM3ywxAyPzEybH8NoNX+rWZWAfeQ
         u7x4wHf1C8tOWlStEm75G9aOVRI36T0zt3h92DG+vSo/BKU9rPvFaumgt6hdXHcQNqAS
         OGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153392; x=1794758192;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JK29MDVmuTI3bC659OetYO7/ux09RXcoPKlf4Kypjy4=;
        b=YhwXv300BsoLKmagLMP20qe9lRwXccdS0rtKQLOTGltoOjxfmIo9taO8Fdd+G2XANh
         V7AjaXOFoRjZFJCwOBXZZ014iKoZLIheEnCzMlEisQ71o00PaZv0p8OlrV2rAWuGo/Bb
         +94B5Jm3ji+RkMKVZQTnXhRHL9sulPZq2jPSXpPNB0vN7lQ1yd49N0RtGjOtgPicsTC4
         LO9gWqvDeYg3ZVqIdc4tEgyYsH7YCIN9AiwIeBYtnnRXOW79JJ0y+Ia/qqX5YPdSc4D8
         d/aY2pZ3aadfxoD1Z0eLOphd9Qd7MzfaLB4ZqLqvr1p+WnwNVtcsj38tYqt+1rLSru46
         lV1A==
X-Forwarded-Encrypted: i=1; AL+hErGw3D5EdPJE0h/al89z2rpv7qUP/GbAFlKcV+9XBlXhKamMvD14la5gb/YOqrih6OwlhJbm+TELXMZ4LJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IvFnC++TBE/v4ESbbYSEEon5eNpD2n02wBkUTlSlsO/WoWwup
	OUwVEXkswKSW8JFAiwtCVCW6Y0Ke4jRTiMgrKwWpE4zWEV4rH1vpx9XwBjbmeHFNPyI=
X-Gm-Gg: AYBFou2+Sh4YMb2bw++3UIK+F0UpyfN3hVAbPrUi6ZMny97w6Mze4QXzNgPaC6TMHtJ
	CkJx4A2bYW1XkLL7aWyeE83ulDFKPG4WIl4lxAaJhF9URBPK+FdHASBVbSpDHEjrMpDw+m916m9
	a3IeaEHCHge4V6nRHFobGLpMenbIprUXoJ5ViVzud3GTAkl/7wo2YuTjk++qz91mfRk5OMCUlcy
	T0rOnIs222v8TaJ+ZravJCeCo3TMxztSFBAvxWHLgglTMzW4wwXnQfeABuvhamkxwOgW30mqHg/
	KQR6hdtGT6MfQNj5I80GVkHZcDZlBOtL1RoQJc3o2Wp1tgZ2k+/xxoVrFOAG4nsNSZ7uUgGaPRA
	kkJE3lQTYxtVH1EXaWE2NZH9gInwhiPfXW0hlR6FSeMGROPB7MFtwwA6liYdIfpGED64Ue7U5pz
	WZnRCGJUWHiskaG0ZttZHkEA+GOz1rj23FUSdDIMJyGPTCrn6mxoZ3sFmiCq1v/qJA40WksDBlN
	pZSOMzyS2Y4xrsFT7rtVQJnVpsCgax8Y7nriXcSBDbGEJVngJry1QZ2USWK+YdE38sAMLdgoVxv
	jqG2Ew5sKxtfaTQOzR14ZuOI0V2BAUyWHJQ+lqjDtW2w9Yd1+hO7Ms2IGZxzD9i43UtrfvfCHFG
	JuwKM65vferUcpgsj0801qrKOW2atcsbRSVKWKGtekgiZvX+AXCrZKHLH/mltpaeQ81sc
X-Received: by 2002:a05:6123:64:b0:5c9:a60b:e5c0 with SMTP id 71dfb90a1353d-5ece724fbd5mr492168e0c.16.1794153391927;
        Sun, 08 Nov 2026 07:56:31 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece6069662sm2078039e0c.5.2026.11.08.07.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:56:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kho: check fdt_phys in is_kho_boot()
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Greg Thelen <gthelen@google.com>
Cc: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Evangelos Petrongonas <epetron@amazon.de>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023054518.3258350-1-gthelen@google.com>
References: <20261023054518.3258350-1-gthelen@google.com>
Date: Sun, 08 Nov 2026 10:56:28 -0500
Message-Id: <179415338854.358073.9410769433043113739.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=mM2B1WNxYEzouTeXd1iMrrTZ9Kih7nqHtFvmUB5THMA=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JuuMqQ0q2iiQjSKjFS6r+naeIRZABjkt1NEg
 9AFf7Sq2OOJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCbrgAKCRC7dyhM23N6
 3kMmD/9uCE4nQFVuk15wOnI9NIxeSab1p5bGiQyaOO1FPMifDpfLJgy4YhFU1/HPX9XWn5ekYEg
 p0qr/AVUD+JXW/MxeCXhsPafSlziDGPcHhcZrrgdOG6ro39EIj6WrS77ta3QhQWcqh6+vGvEem2
 yGrcqfR5If1LYD/jiNemKuLGvElD+xnG1Q+GVn9PLm0szTidchmpiESGFf82iOd8R+pmIgr1Cw0
 FBebpRNz3Ju2Kvk66F1ekS01vnGyX+Eo4QhuHPcPP+wrjZTgLR7x24wV5T80aQGDHamLZQqMtal
 TqzeATUi4YvNQMsavBwZ6Y13Majg8MnDaFWK5ClMDThk+WtmaTQ1GgN09AsoQHp9kEcfWVEBRGU
 9yCNx1+3Oxl6gg1I5qbGxYIMW1JF4sKPEISWrRN3hkK9wlK0zuPF4AljgRiHDjvimUfWmM+iduS
 1hk3ldlqQKmkQXwG8qVbAPHxzJzHISCjJo5UyiEOu74OZXxD2pUaUVJzsLtNis+5Js/ndbko80p
 3w6ENK7E800cYwSL8v374m4vHg+Vzr0/iLwf+9sCPUtMhfYJLugrMkxYb6sSsqSsLEtEcuztmEJ
 3kajzAcRiLi+lQn2EIvjWexnxSCodVLr3gsDdJJ/QkYjGsyb98dgsTCp/1xi78lGcH38cAR+aYw
 CRs86UV2DQ0ZQxg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

I am planning to take this patch, and change the commit message as 
follows to address Mike's concern:

> During arm64 setup_arch(), efi_init() -> reserve_regions() calls
> is_kho_boot() before arm64_memblock_init() initializes memstart_addr.
> At this point memstart_addr still holds its initial sentinel value (-1).
> 
> When booting via kexec with KHO enabled, kho_populate() sets
> kho_in.fdt_phys from the /chosen FDT node. Calling is_kho_boot() ->
> kho_get_fdt() invokes phys_to_virt(kho_in.fdt_phys), which evaluates
> PHYS_OFFSET and triggers VM_BUG_ON(memstart_addr & 1) on arm64 kernels
> built with CONFIG_DEBUG_VM=y:

Repalce the above two parapgraphs with:

is_kho_boot() is called early in boot before the linear memory map is 
initialized, so calling phys_to_virt() via kho_get_fdt() there is 
invalid.

On arm64 (and similarly in upcoming riscv64 support), this triggers 
BUG_ONs in debug builds, such as:

> 
>   kernel BUG at ./arch/arm64/include/asm/memory.h:377!
>   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>   Call trace:
>    is_kho_boot+0x2c/0x38 (P)
>    efi_init+0x94/0xf8
>    setup_arch+0xf0/0x240
>    start_kernel+0x84/0x490
>    __primary_switched+0x88/0x98
> 
> Check kho_in.fdt_phys directly in is_kho_boot() instead of calling
> kho_get_fdt() so that early boot callers do not invoke phys_to_virt()
> before the linear map offset is initialized.

Replace the above with:

Use kho_in.fdt_phys in is_kho_boot() directly instead of translating it 
to a virtual address.

-- 
Pasha

