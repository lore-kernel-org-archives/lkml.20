Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059435;
	b=u+fNtxX/dXzkXM0XtlLCfQ++dyX7MfXCRyahdCkHYsz0Fj5nlNusP23UYmM56ce+ZiK2
	 /uzFDUUWWnydbYFT+Om9M+3urysrKm1tNTuKc/HCYeelofUqgOli3eH67foQwCfkRxF5i
	 2l1uh1RRWBTJc5tu18ktrfQ5hi1yXpDFitAz0E/RIuRYwrYhP5K8yBccNaCE6OZUPzbxz
	 M71PikVWqp9+WaLarxT6qVeIwy6jXyUiivMDJriTYmXuYLGiIOLp6RiEBbHMm7wWuxO4x
	 ujIK6dusekHe4f698gjURORtgilvYVn6KFKQftrELDMDDeQ3oPflFnjYl/IyiljpT1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LValEK7sCbZl9kgj7RilnfIodlMc9vaM8NFPGguTOMw=;
	b=IFLWedPxM7mItuRh7l2/cO7odgNtkrJohL40K4v68YhYhCXeJG/sfMfGrTpEvPrByzGY
	 uJEmmuQ3sFSHz+LcquPVPVi5Ma/lDzYbuZ3Fy0ZXWpt86rFafapSEHN8M+nfP3fkQxsST
	 bcr82oD2feV5Ibzc52sEAbdBuEnhDjvqQnsLS3y+Ag6UlynnADN17byTKMv10BwH4KA6I
	 qQDU5CZb8dtN0N13C7406MRrE9mJmwJ3goHrWulhNWBB3XQm1tiKwv5aHjqHSD5BSU33o
	 4KpmlB9W68vzDQhXFQsZ7qBXXMjzL0Bs9f1hertS8BQAyBCjLIlIv/Zn+Jd17cV5ceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLFAd1ri;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4FC606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4FC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLFAd1ri
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-19305bcb72cso1478491c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059434; x=1794664234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LValEK7sCbZl9kgj7RilnfIodlMc9vaM8NFPGguTOMw=;
        b=WLFAd1rit+C2YIXJ4UJ03RTXwlSX+rpZORERRQm245U2ZYcDY2dspKdacHRHVXU+24
         vrfVkdDn1NoGW6mQrcyHNkRp+a68oHXr37IyuHpxv0TBkAbyx7VNkmPigusAEtAKCyt2
         G9gZ5GJcZHjMydEhgfsPLSdy6vzTLCKwVPEwkOWduv5wHfWNLmF11t2VqNKdVvlY5m43
         1E09LixdGBQwRJMsf/4HeurDjuBnLeoA/HBnWX7Ni1+/gqAgLOOO4Fu1jcMl1Iz77+oY
         lAVFGFJsIxiLjmVfjIn5iDGOf/Zusmf+T4jUTkpI1gIcM+5pvG3xXzHpeoU5Zs3IfohJ
         Rskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059434; x=1794664234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LValEK7sCbZl9kgj7RilnfIodlMc9vaM8NFPGguTOMw=;
        b=vH7QWswxDOfH8vMzB7TTGoqJ338Bixxb5JAFArTQCeaniKpxlqITrX0XqSVrwX69MJ
         +WksbRIZ6C9bzt5m2Tah0R+2SSvATCfbLDigrIUAPcGhw8ep8jGwnAp5syuIv640PNA+
         sRAX9FXSoPkuwBbxFBWii+l1hMDL0rqE1jbxZ0ZDME15fYC8M4ItYV3L+2KxXOtrYhyo
         aEQCR3dYCwJqwFeOlUxqIfm4eK9PQTeV6l4FmGHjhecIPuSzqa0H3TnlSdauNZmH06oQ
         Rhu0HuIeN/tokMkHMu3qgh+HbungvQAovDTTCkeJPRSrRWFrs25/abDT6lP4ktBMh0K5
         x9Ug==
X-Forwarded-Encrypted: i=1; AL+hErEyO/PSQYl8xaTbTIo+csqVB8gpKuc48/1v6w8JKSy9VHjQpOR7G9cfekL/4OkYQYREz/YH/jVmyplJIK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5xqR7gKhi40ezPLgZjbDqRHNMrtMKI/aio1oa8ooCgvzrCDjy
	Ik9dxMI/eYlKchzSQcRauS9HaSGyE/eQOaoIJjngG6s+qouO0iz0w7De
X-Gm-Gg: AYBFou15ke6I/7d9J1R0sHJGv1h+ourgvdOnpTzeKkL24byxuJsDv84nFL+8s1ee6yY
	ZzmWs6tURcMdkKyU60sNvRykpNBrOlTLOsD1IfcT82hl96FDZbaxmb2cdRCD+ckMvw3ue5cy31i
	9qTjM8qSXowtwZXFgr5fzXkjoKWiH4RDPaxkXGqWovWkTlMe8hpJ8/fnBLrGSss42zdmVWG+y/e
	iEG+b9r854O9gFcsiLZPvhgS6hRYOlHyRgLuLIthaA2EVmn3pVCPgDoC/Ap1hj+MnC/uLsftpKo
	i2hEHKRr1jAwWNM6SNdrEmamXD9V6tR980BntEbvJMVLVl6NWujV1bNfU8br6saHreXIiWvDFIu
	tS/zgGk2HrdnF+jiXQIaq6PTT6vbTKZptBroQo9htyMpugKog0W4vhCPDH4UP7/pKgeVAqIk15B
	Qj9H+t48DG51fImDM59zaU0FCsRW57V7ofTeHwwZaO+AQO0FXq10gKFsDha5fnAq2fiKivUPT57
	5CcG1WXQiT9mqgNnOPiEHTIwtyfjjvCwRxzi+loKvVxO6zJRiEt9lsLLpqHMXNbOSBFpAr8eUPl
	g5D6d9iTExyv9lTEqzLEwivOMxcq7oH1AMnJFC0pxdkEXTmpG9A6ujjQqQ==
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr7574830eec.20.1794059434348;
        Sat, 07 Nov 2026 05:50:34 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:33 -0800 (PST)
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
Subject: [PATCH v12 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Sat,  7 Nov 2026 21:49:48 +0800
Message-Id: <20261107134953.748622-6-jiangwenxiaomi@gmail.com>
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

Previously the function returned a single CONT_PTE_SIZE for an aligned
range, so the caller mapped one CONT_PTE block per iteration. Now, for a
CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
that fits within both the remaining range and the caller's max_page_shift,
so a single vmap_pte_set_huge() call installs several CONT_PTE blocks at
once.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..c29704a19e276 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
-	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
-	 * aligned in both virtual and physical space, then we can pte-map the
-	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
+	 * virtual and physical space, return the largest CONT_PTE-aligned size
+	 * that fits, for more efficient use of the TLB.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min(end - addr, 1UL << max_page_shift);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1

