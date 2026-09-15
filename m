Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC25344E66D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456403; cv=none; b=vEm/qhB7yVFb2/ueN/8nCbxucoUddxsj3kepfjx6BPd4b7lYxbKazhZXSkJgpTMtzUDiQvZMjYGwJKrDEEGebz2rx0PVzr2h32bC/D1Qef1kla2qMOVlJ3pCfa0AB+yj47sMscl4tXk0xPhlcC+NrCf5dOBAHhHGtS/Fu0PFBr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456403; c=relaxed/simple;
	bh=Rugh3Tqv3tAbXo0175lL1h8aaSYrMSeIxAdF0IyJcNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvNyCCYXZ/SUTjRGil8rYJhxvvNyBpSYg8T/dG8HnnRtf+eKbn/+5T9AJSDmQ6sccqd32LHNXnwsXH1cw2qMct5MMc41xifoSAFOipvrCI/gCdvMvNEafICp6Jf254/3FgX+W6ojrofzH0Ukl1AIbcE0mn7+0skI/19+zn4Mbzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8mjcLok; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8mjcLok"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482ea739de2so2824830f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456400; x=1790061200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSXpwhAn+c1I8VkohlJoHPXAChpgqqDqDqVS2XIHdSE=;
        b=G8mjcLokm9Xe0G/1YQCK60BVrdOtMRfRAYfrm3rGbnoxEgkW3/EfAS0rbTA7YVDrFA
         SvPMFbc9RumxoNEm6vKo0+/LF0PuTQs9t3OUKC7Y4KOHyFZckTULnQagz69uzM8i31p5
         CbMToSCVgDHs6jO4HPoAQoyjkjCAwzUuFIeibzkCSmAnHSTW4sT+iebXsIWMZgnFySdN
         fBLiATKtVYl3v4woSeC5sQWOpuHAn2Di4vh3pui/e7BernBvbu+wL6qOC12TCWKa9QYV
         j+tkmq9OGNmuzz5RBWAH4SPE8aqWcyrQH9BpEv840cxR2b8raThUX+9P+d35rzSMXg+S
         sIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456400; x=1790061200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSXpwhAn+c1I8VkohlJoHPXAChpgqqDqDqVS2XIHdSE=;
        b=IyeNQPrTOFBcfBXG3xebN/14hL1ufXVkZa/6+Y4zjfxc9X/JDEn6/niTskOj7AIixw
         YqPIaEdhL+KAlv2vVx7q6B/+ySLl3Ejvx1ewcg0WaP6CdXZck5VufG+H+K3axgfGjWMj
         OLwupMWl9E23t89COmXoFuY5c+hwcJNP8K6S9l/eilqU3mR2qTtqw5+C75RaAhYxn7x5
         9pE0N4v1zSmS1PvwNX+GBmgTvR1UmgKLhZH0EHcHC6BajIAvnD/OyfF5gykkPbWNWU3B
         6wecVrDM2tIUSTpq1LlMKddU2CuR45FlfJ2BH3LAlDHocOwLmJOShqb42cM5JGlBLTbu
         HFGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2mEe5qojXPozxyVM82E5c2MRkwzujYzq3iQnmglbe2Nt7Y6MDn0qnWTWZAywPk287ztmxmuzNjEkGASY=@vger.kernel.org
X-Gm-Message-State: AFuF++mauDcMvYZsrIs+K7MeEDrDhWOZgv6s2bGmlPD9cD1zhs1FAgFX
	sL/aQOs7R9nkb82sS4mOsEGhH+Q/Fia0270ue006ke9LmodElocLjyMYl+g/vNnu
X-Gm-Gg: AYBFou3o5lnWKMsSYkGiYyx09YEZWYfSgbfGELfDX5UXAunQOBTrhCKSAnsJRwxrufQ
	d9lCaIYrKDjMQU2cEA91nYPOg/x5zpLpkTG0QcKeb74Raz2Dg4AizPo8xRJjIf+PlzTqlvXSJFJ
	rAgmE7+jYALLZFEGQoMTVbZLDrOzMSF6oSiYqSS5iFVcSnK96Yx0MCkNl1D0c9Bd0Uk1R/F88Ct
	wY5THLRX7Y3k+L//d17EBWjHOw7HRLSTpuhFPXxS0S37knqrYnWa92nwjLFwmipYVAz2BItp+IB
	FwwevJmxfS5sURvYuJbbXQcl+bTU5uepkTWyGZjePPasVCgyoXoFezay08yUZf25Rh79VH4E9JH
	V0vzAdmuGofqUyQKQR2gYAewSnA7N+9zu0buMcRuAEMKrr4VWesUm3RSk89mPIBZTkeOsFebxFN
	jjeiV+PXpIMnh6piMzrT1hoismVNj5KYJgz07SgJmidxCecR0nAFolznTHb9QIiT6of8M+rROwe
	3EuDRrbn54U9+WSWiWY0vraLFbnzCv5z1sN9DcYBBWMUhYd57z7Fz0MdAM7ZC7iIZ8AId0wPmZa
	3OItoWgapUnWBz9s
X-Received: by 2002:a05:600c:6288:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49e7a66c9b1mr64903965e9.16.1789456398333;
        Tue, 15 Sep 2026 00:13:18 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm117889265e9.3.2026.09.15.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:17 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] MIPS: OCTEON: program L2C_CTL, not L2C_CFG, on OCTEON II
Date: Tue, 15 Sep 2026 07:12:47 +0000
Message-ID: <20260915071306.15006-4-orgads@gmail.com>
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

cvmx_helper_initialize_packet_io_global() sets the L2 arbitration modes
by rewriting L2C_CFG. That register (0x1180080000000) does not exist on
OCTEON II; there the L2 controller is configured through L2C_CTL
(0x1180080800000), whose corresponding fields are rsp_arb_mode and
xmc_arb_mode.

On a CN6335 the stray write hung the board hard when this function ran -
no exception, no watchdog, just a dead console.

Keep the L2C_CFG write for CN3XXX/CN5XXX and program L2C_CTL on CN6XXX
with the values the vendor SDK uses there (rsp_arb_mode 1,
xmc_arb_mode 0), which is the same trade the existing code makes for
the older parts: keep IO blocks from being starved under high L2 load.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1014,7 +1014,6 @@ int cvmx_helper_initialize_packet_io_global(void)
 {
 	int result = 0;
 	int interface;
-	union cvmx_l2c_cfg l2c_cfg;
 	const int num_interfaces = cvmx_helper_get_number_of_interfaces();
 
 	/*
@@ -1029,10 +1028,21 @@ int cvmx_helper_initialize_packet_io_global(void)
 	 * to the cores. This avoids conditions where IO blocks might
 	 * be starved under very high L2 loads.
 	 */
-	l2c_cfg.u64 = cvmx_read_csr(CVMX_L2C_CFG);
-	l2c_cfg.s.lrf_arb_mode = 0;
-	l2c_cfg.s.rfb_arb_mode = 0;
-	cvmx_write_csr(CVMX_L2C_CFG, l2c_cfg.u64);
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+		union cvmx_l2c_ctl l2c_ctl;
+
+		l2c_ctl.u64 = cvmx_read_csr(CVMX_L2C_CTL);
+		l2c_ctl.s.rsp_arb_mode = 1;
+		l2c_ctl.s.xmc_arb_mode = 0;
+		cvmx_write_csr(CVMX_L2C_CTL, l2c_ctl.u64);
+	} else {
+		union cvmx_l2c_cfg l2c_cfg;
+
+		l2c_cfg.u64 = cvmx_read_csr(CVMX_L2C_CFG);
+		l2c_cfg.s.lrf_arb_mode = 0;
+		l2c_cfg.s.rfb_arb_mode = 0;
+		cvmx_write_csr(CVMX_L2C_CFG, l2c_cfg.u64);
+	}
 
 	cvmx_pko_initialize_global();
 	for (interface = 0; interface < num_interfaces; interface++) {
-- 
2.47.0
