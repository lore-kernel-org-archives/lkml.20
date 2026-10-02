Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16FE46EC7F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932245; cv=none; b=su8k7elaLnrNIcg+lEJ7ZE3jxDQ9C74AzUZ7GZ51gVLHYQwBmsZF1ra4T3lz8JQqD1aM+USFNtij9jn5IuAmPBcjIGF2VI7tDGQB4OQc5hlJZh26lf2EgduIBgtTQNRPpuWOQ5bLlaFaOoeswk553oBBLZc+kRXDbARY+bSzwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932245; c=relaxed/simple;
	bh=rJFabS9A6VooWqxCr+iHyQIU+isGMK/08v7UC19fxnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lZdsEXDie3eXUYJInX5BXtq9d10oicpCipaHM8t3TeSE0a+t6ef5Vg75dCOfwMAmnUOAlwHe2xeGs8vuVl8Rb/GxcRkYKkE3hxM/UKph2sCNhKFUakAjGZs9/6vOunDEeTf1JMjcjgXvAizABxR9M9UupjDC/Vhxiqz/1zQ1Rog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dq5gq3Hk; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dq5gq3Hk"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so59107755ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932243; x=1791537043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/5XOnfiZIWhHaazfIksBYAhb1bM+JDK1FK2T/8kf0k=;
        b=dq5gq3Hk3us7sOJiZSUs36lQD7z4ANC/Hos9oAPThaFASiNltkkTn1KGhPPDG9ag0t
         wYhv3kYMjj3OGLz2a2+NrQLtNxp+G2kF1PaPc3Q3oT7xed+HYw/DFFzxqE1DR7Ct/sSU
         wD/AWghAyySFyN4o7mdnNq/DXdOYfr/aGpzOsqcZGaPJV4Cj3U21oksefEReDe6TcVaz
         83OVn48tyAd9z0SpL47FGfKst0zNc/4KJiZx7lA+UTGy6bMaecoYxV/YN4mUnmZj+7BL
         EFl9CcPRn6fp8QlwJw8xeM7dfTYUTtdskV0SgEuAr6CgAFHUuYlQoN3/uIVpnoTviMrD
         qpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932243; x=1791537043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/5XOnfiZIWhHaazfIksBYAhb1bM+JDK1FK2T/8kf0k=;
        b=cgQUF5h+/wVPw8NUxea+1o/v1v8NMr8GPeZTKq1LFwYVUJegrAIfHSaf3mADHJsrP9
         uxmfuukSQP4Q1lUDoYrAlK3f+/A6nkUuRVtykAwbn1T6jXNcWFE2Xdb+kUg7Av4CM1db
         eMF6H7THqtJDpUSOmMX8ev7slT10lX+9hMN+v6ZpfHBQLBdjcmSC484ZgWYRBQAmxVzT
         mfCiSCYZ70JGvXOLmwwAl7F7yjqvy7P2qB5ZxcXfBNENDoAb+FVO1rHZ7MaKe24w0INh
         1oyZsxj2WVXqgxhfquAXpsZDL7DAVHVo3p5Uo0Kwv3s6wmBTuJCeeT67SLMtTMilz6bj
         HT8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDnd2z23YODT3XzUeJRdRf04V3TpmaAKt1KywGusQA6DS9yhS8jlcQ52HWHKlgoXoFQj1HxLlI3Kg/kJI=@vger.kernel.org
X-Gm-Message-State: AFuF++mlqIaZsAcw1v1CumJCsZhr+163tZQHOJ0Y9modbuThzJKBjQIp
	akg0KF78X0vcV0hZMqbwbnbBBMKvyocu5Cnk0YtaXeT/ny8xKUuuACuq
X-Gm-Gg: AYBFou3GR2TSWSvlIWToD4Oa5+N5iEgWr7EMcFaBBJFiAaM0ytJW5HppRLPIkMNKsfn
	YERp3g/IbwJJvkqwmrG5LMcLnL/yYdRZ3/Q6/yiKrOMdmUXU78g+13KMRG/WSj3GpD37e1rV+jp
	q+uiABpb44nb/JHT24+exs9aECIpvViFTpGjCxjs3akRk9n9kZU/1sVPsnKQFUF9mFheFhodRV8
	TvKT7D3BMOBQ27XWZYwvVrszKkUub5EXEfksXvoNO5QdNubMdRWzR8l44G/cIvn8bDY23PpBvuD
	Lv4ug+dr83UE/Mo6sxWqzmlxup/8xaMEuvu3tokXm8LdGqQJzpaL/SR3RAPRG/FPj5D7MBzkTI0
	x947+znq24Qiczd/NXXY/KnGZAtvDHB/ynnVTRLIGNZ4s7ye0OVCzWTkSQvDCxuJ4bW98R73tUm
	adLdI07+WN7Ps5TOQeaZgeKrhGTGnTFueV3t35XWMrkxlXwxHU/Q0Ng+VhXDjU6A/+wZpiNSAVO
	VH5rjOf+VLE7pLdRY2A2Q==
X-Received: by 2002:a17:902:ebcd:b0:2d7:107c:917b with SMTP id d9443c01a7336-2e498517c3cmr18629185ad.0.1790932243081;
        Fri, 02 Oct 2026 02:10:43 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:42 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
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
Subject: [PATCH v10 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Fri,  2 Oct 2026 17:09:45 +0800
Message-Id: <20261002090947.869220-9-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 99bd22c086bf8..aae6141aaebf5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3568,6 +3568,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -4079,11 +4087,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}
 
-- 
2.34.1

