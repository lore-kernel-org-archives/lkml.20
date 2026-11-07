Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059454;
	b=QcezQDt3EGoS896SS5LXIQEJubl0fdPjTvxyYnC3jl2PEds+XYeIKM7kBGgpZKmWMvN8
	 uXXtVagUZoqVOzDKbQpe+ZFuALAJP/8X1fXuVNTgZWrEGmi5ZyWqXsSD/Owzbm72+svGe
	 iLWUy2cKX2WIXiW8AhTyOR4t05f1Fqj6z9BuObamflrRc9tJQZSB60+0916zVJntm5/De
	 0fcUrs7scs54XsBTKqSVPfgLofO5IiMrxKpisldNHo+mTJyx707V+/3p8jnPYxd9X7fIy
	 jiZakzevihq9lkOg5BoevEeC3rHsayhJcn9ZTQSKfJiY+u56cZ4SVkiwhb9X/MC0d7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3gOi0SI6UE3i3Ok6KJpgZYZu7b8c3dBRXUCOezx+hkA=;
	b=ZwoBZtrEmGQyaGSZFXBrfvcvG1/fmYKBU0jbMLyTNk0MOBf0poSCrWnRoNzdATi+CaI+
	 IpJH8ZKmx/mRCFpCRN7li8NN5kxo40rPDCVQGKcxWL8NBUf7RugfIFEW+54xlCt/9lZq1
	 /ryfmyMdtApt4Zwrxj7dbvFp0gjWkzv8c82uOG5ecmPIPGHqWTdzQJ/XQJhg+Tbe0A2ba
	 f9e58U5BvgB7p2VU4WcaggDVVdJLbLGlOkwtlut1+rnAsmCq2pYwodbfQmS2sMH74nMTO
	 8xbHxEto8ZcG6UYFwrQe+DisE/QPhwxQU66be0cg092yVdIu+g5aaS2fzHAAXrVCNvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoOOOR+U;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A5606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610A5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoOOOR+U
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2595980eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059454; x=1794664254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gOi0SI6UE3i3Ok6KJpgZYZu7b8c3dBRXUCOezx+hkA=;
        b=NoOOOR+Up8Tb/zJlSaG9NWezIRSHgzHur7zT9mtFr+tSTUx74zbQ/5whtgAjwoTWGN
         X2pURFqnBYJHumh7GB0isO5YE5qoDEzqUnoRG2tWHkLrT+Bgvvy0I8zk2WbprMX3E/Oa
         BWIFMfopR5ThdHaT8EqrQhPLGR9CJn+Sd7DVWJoDQlO0LzqHCc+7bAe5mkYwZvLoE+TZ
         uZ1fitqJ+9PNP3PV/2eYA9YgJ8I8cT9AISnFV6qNZNmkokh+x48KCH4iVw9UViGM0gBi
         pQaTti0nwiI8A2DxKDGlio26FSiZYUtfvxk+GtPZZqzDxhfhHIyt5YDpyZDWfpvom7y/
         T0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059454; x=1794664254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gOi0SI6UE3i3Ok6KJpgZYZu7b8c3dBRXUCOezx+hkA=;
        b=nJuy85nmOBSag7HaNcoyX0DuKhrflfmbXiMzCzhiN2EfPD0JATayBptPzIT1xk8vt/
         79Q8ptr6JC4nsmniov75Qn1okc0luvhUulJ75eIAj32WNquPRm7hXwtbZHwIBzuRRomk
         w7V/V7SwEFiJUcgSzDADYnJq7gwe7itQYiKOztfx1kEl6jIko/fsQmh5eLcLthFdXhmM
         8VuiJk7mm/BZoL15cDuVcy8ybFyvvXvHEr2WFVVWXWwo2+PR26C8+YSx5D+l6tXjOGx7
         /mo+oVi3jsh/xiiBeCJSC4VkErqY9B7aMKmYdgDIfFRkpRgdiO3vqxUGLxi+kf734hlH
         n/Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwVzDbM7xo2kSinknreMXrZ42feTVLta7WbI4lVZ7+fV/qmnigdxDfAoFFi3HoHwPndt/wVCbctWgCoNa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HzH2bodUIFy2OQCVUuTGMDICN1cTurcd1EWqqxp6n895PhIGA
	8RuqnD9pf1XIeEe9hd6liEpg1gIeU4hRr/8sH5IsqihFIfSUlwWca9G9
X-Gm-Gg: AYBFou35ov66WxEzVRWrBfMPRZfw6XSaxP8nZCK4UrM6oq1LpDuMdw9Rvs+/7pL5arL
	IdZaCD24VOo+YvgZ7oOwJMAjKHfSF7v3tlQ61P10ykvh0OreFUwQqfsyA5R9brFC3QlCzDAvdBR
	gRsRwpS52xRHb5XWY8BU/nDIbABhMO1DiydRKHLwPi6U5j9r/LvMKNuWu1LAW5EqoxCpulRFcSY
	tV/ZI4ZzsnKiBn8UdbxV4GRFJcwapkKRm8LjcEuhPB9QvDdhlBgLUHZN8h/mOwppPMziMrUAvnV
	5QeAVjsjw3auXhd0V8in3OabVjg/DAjIhOfN66U/HiQw3XUOAcFeCiV+eF3/Mmx3rvOTKHPlhhV
	rp6rqKuk63zIPUA7OEc1hs6er40cCFp7E4MAQ/PWQ9a7FnGzRRSOnmfOga2XKFX8iBZHklkiiVG
	Qy/nB2Gg8wf2yhi4CU8Jb/Rtlg8oOT+1E4r/e+dClRfWaV6rHEzLEuyX5RFS81wngICQuO4yWn9
	YT22EuPGAHwty8wRYPM2Slrh3n0d+L1pJv9yCD7r1ii1RG2LolNYYfmcGRt73ed10YA/CTrCiAS
	h5+r/UCD+dSKQHrwrMVzV/n83kqRxLPUDdHcWta82Fp6H9JvaqneTXMcPw==
X-Received: by 2002:a05:693c:8843:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36f72cc18dcmr8373352eec.4.1794059453503;
        Sat, 07 Nov 2026 05:50:53 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:53 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
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
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Sat,  7 Nov 2026 21:49:51 +0800
Message-Id: <20261107134953.748622-9-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f2dd9bef4de0f..884e178405171 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3609,6 +3609,14 @@ void vunmap(const void *addr)
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
@@ -4128,11 +4136,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
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

