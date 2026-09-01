Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BFD308F39
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299200; cv=none; b=gMKCQpPBDN2eyEQJKVvbP2Mvf2nxOj8ruPo9ggVQLB40xoeC7coZ3HK6mLKVHak9pme520ZjKobNBPhmmDNcQTAx5K3e40xK5LZlxDdQ6muM2gRiuIEgQ7tFwQLQMY/Vvl/F1Ds8UOssH/yf1qupGleTyj1NnC+EztITbpAUaL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299200; c=relaxed/simple;
	bh=K1Wl/C/kiCwsRppKYsbDUf5OBFrVx/C5S3UJ3x2cFWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsRKPAKncoQBIIe3xe9CXTf/WlSIJsO8eIexs4KvGiaOHdkXLIMiXNo+NYTxQnG9L6eI9+a9L2WAoB5s+zXozfhlb9VFzXFPtusTuBIORPGa+LB/1zo0IDcoLniAmLF13PRefAFKN/WvU0/gDlLw1SwcsyGwH2Njvvu3R7DTlV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGdXuGWX; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGdXuGWX"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c25420fe973so48086466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788299197; x=1788903997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvfhRVJLik6BIqM90QcnUBNMu0LkZxv6XmlGLkglzY0=;
        b=IGdXuGWXNBAnBqxs0sX9JV23rnUHpmPRmPMLZ70pi9t2FgwnlaZbcXKspGlsw3Iw49
         U5N9XpJke3wsHjR1hwcBqsoFR1eY00M8RQlodKs6FtvAHvk1CuLWomhplzOI9ju9fn/6
         XKV27DrCGYHsnnzlEjdNcg+HyADqPyxQQs4nHWT/mA2PuOTwPt2oNlPCwJwa3JxYVeZp
         VqmDVjujAoQ45uy2Kfz1YZ6/lJTCriqEBnJ92uc3ogJxUagGCLVqDBktqrALCe420D9c
         /YUZ4POMgv2/PxgGwtOh5TUj2ahDLyRjmZGIeWJp/eqjG0ed8hcYt2qZQmcevgk1tw2O
         KNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788299197; x=1788903997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvfhRVJLik6BIqM90QcnUBNMu0LkZxv6XmlGLkglzY0=;
        b=YItuMIuDP4w9Z1fqQN4b81nvGvaqW2Q3YOMOVS2ULkkxDwk+sIO+Osbwf+s26TbE/V
         kK1bot3z3WzhQ727j+6zACtu2k05Ioszu86mb4CqPvd07fVv8s3tsyLCzQlg/x0oQnNK
         +YSBAUeUOcY6RYHvHgXOx9GO+2fU6sO1XUHwX2ACzvD6Ka40MGffREYY5AsuPWxpVQbE
         wguFYSqewua35o9xJ8+VezD80npCopmYSP1VktGCJ38yhRKoT622XMjRcvAtzVsyknK3
         Mc3OJDkWQiEFyKyhqNdSjL9If+sV87TmMt364YH0+e1zVhxCcETUDo3Z9IpnZsKcu2PH
         ta3A==
X-Forwarded-Encrypted: i=1; AKwUvBxvWVYX9FEBCTU+tY9DGU3Bk3Lm5o39vNbOvvFXmOaCHbo16ntQ7m47ZgkCNJPnHPKmkJXbmAUx3GMPLmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m6AG28wlLLiMEJlsq/Om2xBdmkhOaRoI75n7cpNVeSYinRAj4+
	4VBw4Ivr6Jeo7CMYfSytU5OlI9MjwYkuUs9LoVh80PuLeOZ7rBWhMo9A
X-Gm-Gg: AR+sD13iMUA87I8C81Z4zPo0MnHN1MhGOjoMwNUKVuiXmcZR5sYyY9gvl5AlvOP9Pm1
	8VBghCmu3h+NHn7ehktPrOVA53iaFnbuEM/JJ/IjPPeJVfrQPYxLCNxVYijkONb86I0ndQ3+pdZ
	NG47j9I9ZEqrXMlsr3XNTR+2EDph8F3AiidJIUmw5+E+jtVu1SG144LWm43SjvFGPZcWLAhYGiF
	JdnBc94FYB5KBkjx05AdjbR5uFmyDmy2lXyFrW8k4Yb0WUt7PM8oSNmI5K2WPuC0YXT0AtroTlZ
	issr6r2GiL3UAb7uQgCsb1jKkpI+90MnoqS84BA4LfnPcB5Gp35J90u2XxLnBVjWPysqTLa7QJ1
	iPUwWPn99sAG/AOP3l7+zYUsg02V/JVQjZfFMbNybFvDn0yQHfN1oRUDpEMg+xzyoP9Gko6v4I6
	VcWAczn8gVB1YMMOXIY69Md8G7X9YbnrRTX05Pp7o7i8tNdhYRAqblDRTATO5HO/r0KbkZ3nPnz
	4cjn5CsafErkDbcCjc1oToHX2zmkSg1teeVH6y+8Q==
X-Received: by 2002:a17:907:c1b:b0:c25:8878:3e09 with SMTP id a640c23a62f3a-c25d561620amr12442066b.22.1788299197377;
        Tue, 01 Sep 2026 14:46:37 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70fdsm27500866b.4.2026.09.01.14.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:46:36 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v3 1/6] sparc32: use memblock when mapping the kernel
Date: Tue,  1 Sep 2026 23:45:45 +0200
Message-ID: <20260901214611.60560-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901214611.60560-1-linmag7@gmail.com>
References: <20260901214611.60560-1-linmag7@gmail.com>
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
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/sparc/mm/srmmu.c | 47 +++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 1b24c5e8d73d..23a6383feb15 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -846,39 +846,34 @@ static void __init do_large_mapping(unsigned long vaddr, unsigned long phys_base
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

