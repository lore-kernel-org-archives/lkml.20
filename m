Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1944A3F0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456401; cv=none; b=i1H5A8uPrNJz9gh06h8nAfxOjOfWksmZfmJTpNplul3vFTwVwQIYVG9iL6WLU+37hhoZeXTZPGrKJpj/8pXLD/89SFQ5ITPN50S3giUG8yKkViyvYXhP7H8yQSz/EAdipHGys1gtoa3Wdg+Gu/pv5ys3idsUd+58EBJurtHUJSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456401; c=relaxed/simple;
	bh=89LQ3OLiDjTNU+MZYXlXqV/1LuBsmRvCi0ws7ieqTV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJbBcruAzR/EuvJkFI5pPVWqlAzfNFIiDRmIRLvc83EznP2Km5gFSTqELdRaxxXMJ/t1SSQZwO/5hSQDtTL9IqFtooMN2fTkyNpHfl7tPiY8XAVaKCKlzf2kmFkxNwPO7YMv5DknB+tF0w6iQU7MX44FAXaS139oVnnNMFltkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAcZY2PM; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAcZY2PM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so1016185f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456398; x=1790061198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTSKjTBTgH4aUE3tUTnvy6VKo0F+1AwP6oO4bSFumRs=;
        b=IAcZY2PMGRiQmc1dwh2bM4ftaS/rs/zMeTY5wW7EtMJaiUAIFvy+AHAByyNZvxDjhI
         UNJ/yjRauC8S4rFPuwyjfBF/W5UQYAYvV7H0FNKzb/knNFMAyWp9TrBSG00r0ZWlIQF+
         8kKIti42UdhPPv7im0cQXibkQeFEnyRwbP0W4AVj9ROMpjFFD3r9rUV3MqLmulO/7M+/
         xl2CMti7QEkHpKFCb4+HxujMyULA/OBBOCZ94ftbPSEr9TVAUfy3va/BqE6Hz0A32QHs
         Ti0++/YuXc1100wORaI6JopYm2089o6tJsHDHtH8Q17amSI9XO0Pkg7BnE73M7dZeAAd
         Yb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456398; x=1790061198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTSKjTBTgH4aUE3tUTnvy6VKo0F+1AwP6oO4bSFumRs=;
        b=qgEaMqtd/z6wuNkXSwP0SzQgysqIZ3oA4AfBKfsA/ZcpKkYlZcQH/s+0619AiM55Ah
         79SH00UxKRHHW6wIuHttWPj6H9r+eGFPQwrLeL5PvhFAbgoieMeE0AjENjJXcB8AVayy
         icIQGp25Yze1I8i+fbLrxM4ngOZP/pAhNk/DI6asSza85TgUSZpZ12p7cEc+0Z2FxiPh
         0rA638LC3rthqlndy38ApP6dvbXu58iTIriJwYdLUFL+gNdvDjve9Q/nhly9og+oh0sR
         K/NopzSAfrKzdueUTbwc3I5YD1m+BUMlyWjCIJQjiuJt+f0mNbq7Uylg/MvJVRiOEpWR
         IUDQ==
X-Forwarded-Encrypted: i=1; AKwUvByQE/1+8a98EZeJH3YyziSQ4eco0iDqXav26YPbCQwHzYZ3F4PlPzpH4lW+SipubbDMN4ofWmV/Q0CxbW8=@vger.kernel.org
X-Gm-Message-State: AFuF++m3tD402K7PZQwzRjAZfJEAc4YG5jYi9HVtay6hpRva7DecZAOV
	lMPA/PyQr74NsLU4YLBD0yviRRpSox3i3Ifgk7E13pA3ufhQ3A9rcylm
X-Gm-Gg: AYBFou1wE4bHmx17KH/ot5q9u4NlQoXWmlkNDbJH2ed6EAFV+0EzEyfHqAM6smhxz3r
	i1Geu+zI/NuqZUSF+tJ1NfNeUmCw3eN+f82lxwPDzkhRdJzzTHbCLlAnKzke+QNzGAj7hECEISo
	D9VCanYRntPnuWvpJQu43yMcMmKNDh3tg888w9b4XrxytXWX30hoHulEGSQytBQ1f8KLesrU7Jx
	14mJNrr2yMIBW8ykVQbvAJ7abNzoglpjdKEkiKyTEUl+7PCtqycqBaYZeRiOFQDFZZD6ZW27k07
	ebWespqGvMnoNZNCBKenEGLcsSRRTRlWXGPuojcViLofssmTHMxlgM1kQbbRcIEcX1fQcCd9PG0
	LizMdUwwMQEJPNxbT5pzR2qnTu+TslNot7/0IGD3hQPtPIY0t1wLwM+bE5hWLd/YLmhv//td872
	wHaVQ9mTcY/zuTUJdWx8tSrzEkUFNPWsIuWs1+ks2n64M9dRLVGhqWcDC2ZM/Du71PEhPDzWirT
	PLBx5knjokDDtxFU9ggQEF5dMRZg6YFr0yDsGTBEtwQgGuBesjPeGUfQtzQMi6Mv3Cv2vLnitLK
	NRHsVIaBW+W8AvoH
X-Received: by 2002:a05:600c:5352:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49e7d750bebmr24496945e9.13.1789456397710;
        Tue, 15 Sep 2026 00:13:17 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm117889265e9.3.2026.09.15.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:17 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] MIPS: OCTEON: read the L2 crippled fuses from MIO_FUS_DAT3 on OCTEON II
Date: Tue, 15 Sep 2026 07:12:46 +0000
Message-ID: <20260915071306.15006-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071306.15006-1-orgads@gmail.com>
References: <20260915071306.15006-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prom_init() decides whether to lock lines into the L2 by reading
L2D_FUS3, a CN3XXX/CN5XXX register. On OCTEON II the fuses that cripple
the L2 are MIO_FUS_DAT3[l2c_crip] - which is what cvmx_l2c_get_num_assoc()
already reads for those parts - so the test looks at an address that is
not a register on the chip and gets a meaningless answer: it can skip
L2 locking on a healthy cache, or lock into a reduced one.

Pick the register by family in a small helper.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -653,6 +653,24 @@ void octeon_user_io_init(void)
 	write_c0_derraddr1(0);
 }
 
+#ifdef CONFIG_CAVIUM_OCTEON_LOCK_L2
+static bool __init octeon_l2_is_crippled(void)
+{
+	/*
+	 * L2D_FUS3 exists on CN3XXX/CN5XXX only. On OCTEON II the
+	 * crippled-L2 fuses live in MIO_FUS_DAT3[l2c_crip].
+	 */
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+		union cvmx_mio_fus_dat3 fus_dat3;
+
+		fus_dat3.u64 = cvmx_read_csr(CVMX_MIO_FUS_DAT3);
+		return fus_dat3.s.l2c_crip != 0;
+	}
+
+	return cvmx_read_csr(CVMX_L2D_FUS3) & (3ull << 34);
+}
+#endif
+
 /**
  * prom_init - Early entry point for arch setup
  */
@@ -801,7 +819,7 @@ void __init prom_init(void)
 	}
 
 #ifdef CONFIG_CAVIUM_OCTEON_LOCK_L2
-	if (cvmx_read_csr(CVMX_L2D_FUS3) & (3ull << 34)) {
+	if (octeon_l2_is_crippled()) {
 		pr_info("Skipping L2 locking due to reduced L2 cache size\n");
 	} else {
 		uint32_t __maybe_unused ebase = read_c0_ebase() & 0x3ffff000;
-- 
2.47.0
