Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83033ED12B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394907; cv=none; b=mBzRCxlTAgLdXBbrPjBF6J+wAG5WSo0r5ONQHkth9IpC+N2KMCHxEaM7UfRibTocPkJrt06/p/RdM+DY93xNSpEH2rnB0cPL4kvWQcDwB3W80qq0NGqPckM8VrZAz9MJwSGqXk0+Uly7EA5e81cqMtrmWJRJ8K7TnBtGq4hRN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394907; c=relaxed/simple;
	bh=Xk5HW6iHgeHF8sKpghX9kJ+ATqknktzLKDmcmvhn+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRfSUeaersAIED6RfFMIAGZSRZDXox3FgUWePPebhgYG6oOF3YelbRtFlH9Nx7Wy4dbomKeSsAZduUKEkkE/jd0C8B4yGb86ijfZzGggYfMMo7cqlSLwqmzpLBsqX7Ilhc+xnX78LJ+SWpHfxWPfemSWHto7nRQA9x9G+2k9pes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKSbkNEi; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKSbkNEi"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso1170328a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394903; x=1791999703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgwIZlTH0lKclnCFBSlWFJ3rfoI779fFQpV/lMz8kts=;
        b=nKSbkNEiOPLK0GgBdIzbTT59ysTeYZ6ziL6+tHo8Kawx4L/Yl6aKk90y/lKk7Awxao
         Bbri2ZzYvH6k8qzPC51xTI1DY2RmFgvRylQskk+Ly7qeiWblRta8d6/IFYa1kNL0pVEb
         Ev5f4Qgiz88XZZ/UliN7RJEg0l2kHql7jOAkNKjkLvf5hLC0IA91RDlgay4xm9ZHmSxe
         fi1IFMPo0rrieiBsmYx/tj2hkjh+wXFHShVrc3rzMLFlNdsTVMT/sRvWZL6M3dh3upCM
         OsHLboRsTHogH5J3C+O1e2Gyr/lGk3xr0nCwoT4GTwz7CKaLRYj0ETbHuzViPOMbdziH
         4Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394903; x=1791999703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgwIZlTH0lKclnCFBSlWFJ3rfoI779fFQpV/lMz8kts=;
        b=suRHRFfTJ1MlK25iMuh7gYvwF+IhXoOztOz9iKwXYFm7aHv+7tecUklkkiLnGkjEOV
         dYKpDUNVBuMh6V8ASD5U0idKnWwUHOmiN4SXp+CcYeEFpBplBXv2ajb7iRGeHAlZh1Mj
         1tlLbKPonO10F32at/BwgohWn9T2PyvQvBC7lF9TnKbcpuKJZNJzCRF846z7zq1NPYlW
         av1ffhmKtcBnRox1EePPE4BogXoIo9mtqPMCZRB9dMpB3HGBpbrFJbrPRNqVaB/Y4RzP
         qPpU/uQCGiohxnT+RD0iphO3ZeWF2ib9lrFcAXlToYYduPmvtAvLgDZhCj3ehQQvCQ8t
         AZMA==
X-Forwarded-Encrypted: i=1; AKwUvBz8yNjS5voGZ9N7Z5dqXbmcp/YSv20HH1hR47aoZLreZJMd9pCy2IDiKLcnMD5jIX/S6371dMRF/JkyvPo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIW6WFzExY4J0iqkzD6Y9Et4j6k8iHIH+Sda8V9CvVdT4UhtnS
	6M/DCwEfp4Qbd34mn+nrTFP65B0n5Q8vUVyh8z8uQLcUOyRRPD6uqbuspHQdDS4+
X-Gm-Gg: AYBFou1/irsqcdGtF2vHtBYOX8GPxG3TYTVtiwY6Psmh7x47g4f6/nSX38rTKVdxxqj
	V75mDyB7x4GrgjZO5V1eZxTFVjlltskaaUlYPyx2Am/hEDHpQCAdbiHe5/PlOimcvvjokhW/Fxe
	eVGUofoyenI/8InF7UARz7QgXOSjdA48d34Tp2uV1iYy/iHM1cUxyYI0n2Je/X8DQ5c8IQItOuz
	wa8/7JCVQ96KzbAkL1q1AKoSdnimvF2xOwH7gzgOVYdkmzSPqxJAcwUgjOelx2dORLH0s2AooO6
	QFeqxq7hDSfXiIBANkpBgaFCUqWu3u6RNFtIifEtYXXvCBHumr01B+qxje6UJrybUHKVB1ivpUj
	NCsUuN3dpA38Nc941TTJoa3G66J50s+ZuPzomwrWuVwaNwblvDguZSBbWPL8ePugRGgRnLWiNAb
	bo/npkzb9F7Hf7/abBHi3dSytO+1I72jTPmgcBGA0OmYJxB9jz9cMaNgTs4f7eDcdDGKi1HPDCd
	tz51/xDuV3t1RzKa8/xofrUkbdvqcthmnnNTu10
X-Received: by 2002:a17:907:86a3:b0:c2d:f76e:f030 with SMTP id a640c23a62f3a-c317bd4c293mr310630066b.13.1791394902899;
        Wed, 07 Oct 2026 10:41:42 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b009e80cd8sm356802a12.8.2026.10.07.10.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:41:42 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v5 1/6] sparc32: use memblock when mapping the kernel
Date: Wed,  7 Oct 2026 19:41:10 +0200
Message-ID: <20261007174128.959307-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007174128.959307-1-linmag7@gmail.com>
References: <20261007174128.959307-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memblock already contains the available memory ranges when map_kernel()
runs. Iterate those ranges directly and remove the sp_banks-specific
mapping helper. memblock range ends are exclusive, so use end - start as
the range size.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/srmmu.c | 47 +++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 9a74902ad181..110e2f248c60 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -817,39 +817,34 @@ static void __init do_large_mapping(unsigned long vaddr, unsigned long phys_base
 	*__nocache_fix(pgdp) = __pgd(big_pte);
 }
 
-/* Map sp_bank entry SP_ENTRY, starting at virtual address VBASE. */
-static unsigned long __init map_spbank(unsigned long vbase, int sp_entry)
-{
-	unsigned long pstart = (sp_banks[sp_entry].base_addr & PGDIR_MASK);
-	unsigned long vstart = (vbase & PGDIR_MASK);
-	unsigned long vend = PGDIR_ALIGN(vbase + sp_banks[sp_entry].num_bytes);
-	/* Map "low" memory only */
-	const unsigned long min_vaddr = PAGE_OFFSET;
-	const unsigned long max_vaddr = PAGE_OFFSET + SRMMU_MAXMEM;
-
-	if (vstart < min_vaddr || vstart >= max_vaddr)
-		return vstart;
-
-	if (vend > max_vaddr || vend < min_vaddr)
-		vend = max_vaddr;
-
-	while (vstart < vend) {
-		do_large_mapping(vstart, pstart);
-		vstart += PGDIR_SIZE; pstart += PGDIR_SIZE;
-	}
-	return vstart;
-}
-
 static void __init map_kernel(void)
 {
-	int i;
+	phys_addr_t start, end;
+	u64 i;
 
 	if (phys_base > 0) {
 		do_large_mapping(PAGE_OFFSET, phys_base);
 	}
 
-	for (i = 0; sp_banks[i].num_bytes != 0; i++) {
-		map_spbank((unsigned long)__va(sp_banks[i].base_addr), i);
+	for_each_mem_range(i, &start, &end) {
+		unsigned long vbase = (unsigned long)__va(start);
+		unsigned long pstart = start & PGDIR_MASK;
+		unsigned long vstart = vbase & PGDIR_MASK;
+		unsigned long vend = PGDIR_ALIGN(vbase + end - start);
+		const unsigned long min_vaddr = PAGE_OFFSET;
+		const unsigned long max_vaddr = PAGE_OFFSET + SRMMU_MAXMEM;
+
+		/* Map low memory only. */
+		if (vstart < min_vaddr || vstart >= max_vaddr)
+			continue;
+		if (vend > max_vaddr || vend < min_vaddr)
+			vend = max_vaddr;
+
+		while (vstart < vend) {
+			do_large_mapping(vstart, pstart);
+			vstart += PGDIR_SIZE;
+			pstart += PGDIR_SIZE;
+		}
 	}
 }
 
-- 
2.43.0

