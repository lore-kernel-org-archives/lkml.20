Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E5382395
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091682; cv=none; b=jFArgCDGu70YuFWe+SDA0wWYMa5xSWcYQ/3T2fhdEknUaxv8EKTfSYByX4cbNnur+wTf1pqjhYHY3y4F4cSRp+AlBRHW/AaAdV55EeU9kf+D3gdHsqRAgntGfi+SZbJaK1om0xGf8NRFIYQkC52pgBpNDnW4jbOHX9ZNeQVNhjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091682; c=relaxed/simple;
	bh=/L+B8tJRHS4R8Ad2CdPqQmMJuscZ3nYa9ow7BrVUDeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KedOTaTFi/F/dWyByY9nLJzUUfm4uQK35/HVCddasaalr+GdAywmo0dqX6+amHjaUiZYIXCXk0JGPO/EGmmQunMICGUVLZqbCwhZQgs2fVV/88z5GNw0rxpBRR6AadhtQopyvk3B3yT6GeTR8Qry6TlvNNzHxTICjnZhHsjhpRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9h0D8M3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9h0D8M3"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2531f453eeso394521666b.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788091678; x=1788696478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3uv3O4cBZWmtlUcIzNA+n7dDtgG66MOQOoF5n5RkYY=;
        b=h9h0D8M3Eyf3m6EzTPomDeuKFKk73RXmbjhsh7yYdy+LK0xJ6o4T+uzv8lOgQ8ZcED
         YNBgqrei3QP5XY4+NbmsJrXt5tLxM3i5Hen72Fx3bjmHi3hr7wM+87IynnkIu4wyRO+E
         NzVS9acRjwRJ6rh/umCCbDH899AiITuQLEhrNmlp2X9X7iabqbnFBDDrwe5xi6judVFO
         rRiCsKgL9fo33roTEGXhYjFet/FXNslqM2RYb3GNmDyxca8AEifgiC/HPOrD/KjDY4ru
         w6BZRO9Dm340FfG7PJPCEa8hKfzKNOml6/2l3ThYtxZcUh/PQU2MJWbGiz0VKCvanq4t
         FMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788091678; x=1788696478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3uv3O4cBZWmtlUcIzNA+n7dDtgG66MOQOoF5n5RkYY=;
        b=SHf0yhHtEC4A76UExDRLSEBWNudyMDOXObA5ukhXHXOfSWGBIoLMt0awVK3NcvN87M
         Bt1KZcfb5cQoe4ARh5Adqnphf3RyMOwqK+3sZPTZiY/1Tzj/jvEKtIENyVT4ySw/8Pgp
         t+WC/P6x9/yhK9rAxedp2D/THktIK0tZcvXawmt6gTXupb6HhQOwz3DJ9LQpl4hBkSys
         J7kLpVIKJLTjukbydE4h0mRMftgg8OezV7rn2ErLfeHkuk2EB4MgPUXXt3XI2Oqe3mck
         MQ7i9vOKAqd+73xKn6FSSR+mc/dy6yJMFdbDsLnX1iRFQ+VepSNap3FsUKrWrtsnE/+4
         ESXg==
X-Forwarded-Encrypted: i=1; AHgh+RoqC0IoXnJjbpvL+wOx6Lf/PFcKiYc/rleTM0Ovd3L0Z83uMm4HBvIiKEM3DAS4zhWTj8cL30CjrTMyPo4=@vger.kernel.org
X-Gm-Message-State: AFuF++m1Abx9WvAgbVPXUyex7xzXe2WzgOiUgyzqBfHP8+9/V++1XSmU
	1F5Ar3IDOB7YpPW25B528dQaNlcrPtV1w1ndvrz0C62axxHji+/PA2+U
X-Gm-Gg: AR+sD10R11yyT/fGg3lCAVPt0RceXZIp4wWJQ0FYhLdaOA7dx3zdTqvd04OxTRLfWpt
	qhLvfig9gyS6wVALvx/Pro90IR3jxvwsbjcKaqq+9txcCfRPYkWfxgI1eMbLw0Db8ngZ/+hjBnH
	LdH8u8nO5OqYbh9wSWBjNVb5o/+yDmudlx9p9M53GF3JI30iqhCGmmJv4hOOG5g4L6G6DxfDxIW
	MsyKUg32DOdAM54H4hfn+wcZYMoXkn/mYHaVuOBw7g3WjtgHgkA9RLQ4GZgYioF9OoCe2yk2Pib
	7dXHYIteeLK4C7GOELraMlpBrD0k6UQmUpQmUBUywV17VDBqY6eu5+lK5RfgHCZA45z/ToJ4RD5
	PHS7SSvxIzJzmZXZpXzNvwHh7ikXJDLL3bnE5UfBx7fuCuYCEhhEKtrwl7q+enmoKaGCRn+kLBg
	6E/Ru1Ia9IYddLn3XHuw4fTrVIu5wKoc0CBlnDIkDV4y4Hg/xGpMF2/nw7PjNyTS/aYM9Hj/Y63
	6u5o0IlsaKwUTRSx+s3MerCm0ztnBI=
X-Received: by 2002:a17:907:72cc:b0:c21:2c32:e2da with SMTP id a640c23a62f3a-c2556d9fe3dmr1081954966b.8.1788091678234;
        Sun, 30 Aug 2026 05:07:58 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09eb6sm304287966b.10.2026.08.30.05.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:07:57 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 1/6] sparc32: use memblock when mapping the kernel
Date: Sun, 30 Aug 2026 14:06:40 +0200
Message-ID: <20260830120742.20950-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260830120742.20950-1-linmag7@gmail.com>
References: <20260830120742.20950-1-linmag7@gmail.com>
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
index f0fe09169528..483235458d69 100644
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

