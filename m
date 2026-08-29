Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF74353A9B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981169; cv=none; b=rq+3c1Y9Hygr0HTOr7Gg3N6tMc9/I9qTLtCVAFKgTHdlQVW1KNrmhxdRpw/uQJAvvuxoIqVBZCMLhGdvdiT4TnlTPPaN9QbsL/s85B/XzNs7d/awao2l4Zj4MxG3t3VHkBBxxiwzxDIw9ZiB26VlFrC6hQLa8CpHw9yAv3NrJtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981169; c=relaxed/simple;
	bh=yBMJnSe/wEAhqAMpDl5hLrpEj78hz9koYakkvhJfxN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IE6K4VEeDyRRad1PFSJ2NpujwXBy3zYcwdkDOUGxX46zV+pVJuZGKvl8JDZXfzJ5U/V2awIEL5xTecpJgF4e4vCqwnreBgDsXw2VKKTZGgukNveaj1G1JQC2O/dALFwghNcXCh8T30VhvKLaCR6jiKdlXgl2HviFVVInbyTXIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=OBxqmdL7; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="OBxqmdL7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so567146166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981162; x=1788585962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmhTKeCBnYxrxfWImIjksOW0xx35+iGmqwjBQ/LHq7E=;
        b=OBxqmdL7SeNZxPPcnrEy5Q5aSWJqCIjCAFCiwvTpTU0MBCd8SRMbHRK2jznJX1lJgW
         egYTaHf23LGtf8BW0LZE4I3nT2KNB+/WVhXo9JduSXN4D1/NpmDcIlhPGOFuNbkyrKin
         TxuuBJ8qleFmwwaI365h3yY31INsUMGsh7tZXNzP9pyUoU35BXH7b9BHQOTFrsHAQc5i
         J4DDeVsR8k6bSbR0pFTHJB+Aejt2dyCTALlN6QI7zuoOqwx3Svb0vOdFWLZ5Bp5I2iZ1
         HK3eCuLXQuOswggVaLdmTwimUSGZXsQSZ9PZUUTqN9TGO4vqVSFy6ZEqHQqhpzZiLmwP
         /oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981162; x=1788585962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmhTKeCBnYxrxfWImIjksOW0xx35+iGmqwjBQ/LHq7E=;
        b=knHUy2pwX8YwqjuXAJdZO9OzzAHjKUkhp4eYr4hEXrDjy+7gWU1LOkTdGCkl/92jnM
         g9Q3iM7v2HT41NpPVVUohOSkoh5zFJBvfQXH9cEpd17nhdmrKg5jTe6hrg9MJHe/2upU
         U2sXlCF57gvY69uXrYhSB+H0RdIBWdi1r9Dw7HWQKR91lUJEZvlbEvr7ttZ/szkst8K/
         DRdUrFBgioS6BUfvGCtv6ZCznMtx/V6vXXCHbjXPpqIHSQ4onpHTe8XfxMWp0v2fy+Vf
         qWmXVxnVAAPs81e+ut7fhpIfpFLuARYg1bkctah74N3oZo62i2MfZorNodm3R892wKKL
         iKWA==
X-Forwarded-Encrypted: i=1; AHgh+RqmwTstbvjNpHvc3HbjWH4HKbzYpHdGk59PnhmL/kzQK+Glt/D2q75UTMKqdNe8QncvWtRRPBvRMjZZk6M=@vger.kernel.org
X-Gm-Message-State: AFuF++kGONFutUbmY4OniybNhHW942+2W+vKyBOOyQzme0yw7n2t4/WA
	ky4gQCrFSWDhvxA5EdlQP+LCb8dVCaxdIqoZjBe5p3q6RlVcyBoc8jAoaD+Ot4gwYLU=
X-Gm-Gg: AR+sD118tybwbWTkwbh2NQty1bfRM2sSgYDeY+yGlZuvPZlhycBEaTvHqgIcagb2pOr
	XgBo38Q2Quk9swMcfvWT3IERcpoUs+KWPkAsAvnotR1PCmTCR8J1Td0EdfgatWGuhiESjPM8uQd
	aiIm1a5cW4Oi3rT4sOZwc7mgB3Lj4s5obGbHZsTSCRbZq+8rOUiW1f6yFsR792qQbnsFAfW1/Yy
	TL9QAUuQtpjiuLPse0CP+OEctXr88CDWwrCpNHnr/M8U4lYANCyibyoM6pk3bOmOJ4UYOll2GZi
	p7iB6s1a+cgFrQ/JeRkcei3wa3vBVNfAupcpdiiJhS52RVYm6vz21VUOAS2LzIk93Q+QzM7kERk
	LhmAnK5vzROIcRnuw9rdZFLH4srbCXZvCnLW0f5mDUyZad9H/UeOIRvBbAS5m5Hy6FzXqVH6kW8
	Au5B6yye+C5e7W3QvMoTRjVM3S433AO90e2Ylqz2Tjcw==
X-Received: by 2002:a17:906:7315:b0:c08:580e:899a with SMTP id a640c23a62f3a-c256ddef826mr325586566b.10.1787981162504;
        Fri, 28 Aug 2026 22:26:02 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:26:02 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 5/9] net: phy: air: skip the download when the MD32 is already running
Date: Sat, 29 Aug 2026 05:25:42 +0000
Message-ID: <20260829052546.1152446-6-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The download is unconditional, so a chip whose firmware was loaded by
something else - a bootloader, an earlier bind of the PHY driver, or
an MDIO device serving the chip - is reprogrammed with what it is
already running, at 144KB per probe.

Read the status register the loader already polls for readiness and
skip the download when it reports ready, only picking up the running
firmware's version. The wait that follows is what makes this safe: a
chip that was not in fact running fails there instead of coming up
misprogrammed.

Living in the shared helper, the check covers every caller, and it is
what lets the PHY driver and the coming MDIO device driver coexist:
whichever runs second finds the firmware already up and leaves it
alone.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_en8811h.c |  5 ++++-
 drivers/net/phy/air_phy_lib.c | 28 ++++++++++++++++++++++++++++
 drivers/net/phy/air_phy_lib.h |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index fdc64362a565..fcc6e373edd6 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -1030,7 +1030,10 @@ static int en8811h_probe(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	/* mcu has just restarted after firmware load */
+	/* Freshly downloaded firmware has just started; firmware adopted
+	 * from the bootloader is already past its own start. Neither needs
+	 * the restart a later resume would.
+	 */
 	priv->mcu_needs_restart = false;
 
 	/* MDIO_DEVS1/2 empty, so set mmds_present bits here */
diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 1ed5c69d7073..c1187f357f4c 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -374,6 +374,12 @@ static int air_mmd_status_read(struct mii_bus *bus, int addr, bool is_c45)
 	return ret;
 }
 
+bool air_en8811h_mcu_running(struct mii_bus *bus, int addr, bool is_c45)
+{
+	return air_mmd_status_read(bus, addr, is_c45) == EN8811H_PHY_READY;
+}
+EXPORT_SYMBOL_GPL(air_en8811h_mcu_running);
+
 int air_en8811h_wait_mcu_ready(struct mii_bus *bus, int addr, bool is_c45,
 			       struct device *dev)
 {
@@ -409,6 +415,28 @@ int air_en8811h_fw_download(struct mii_bus *bus, int addr, bool is_c45,
 	const struct firmware *fw1, *fw2;
 	int ret;
 
+	if (air_en8811h_mcu_running(bus, addr, is_c45)) {
+		/* Loaded by a bootloader, an earlier bind, or another
+		 * device serving the chip. The wait below is what makes
+		 * trusting the status register safe: a chip that was not
+		 * in fact running fails there instead of coming up
+		 * misprogrammed.
+		 */
+		ret = air_en8811h_wait_mcu_ready(bus, addr, is_c45, dev);
+		if (ret < 0)
+			return ret;
+
+		ret = air_mdio_buckpbus_reg_read(bus, addr,
+						 EN8811H_FW_VERSION,
+						 fw_version);
+		if (ret < 0)
+			return ret;
+
+		dev_info(dev, "MD32 already running, firmware %08x\n",
+			 *fw_version);
+		return 0;
+	}
+
 	ret = request_firmware_direct(&fw1, EN8811H_MD32_DM, dev);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/net/phy/air_phy_lib.h b/drivers/net/phy/air_phy_lib.h
index 6b11dbeaea9b..8d9f24da1271 100644
--- a/drivers/net/phy/air_phy_lib.h
+++ b/drivers/net/phy/air_phy_lib.h
@@ -59,6 +59,7 @@ struct firmware;
 
 int air_fw_write_buf(struct mii_bus *bus, int addr, u32 address,
 		     const struct firmware *fw);
+bool air_en8811h_mcu_running(struct mii_bus *bus, int addr, bool is_c45);
 int air_en8811h_wait_mcu_ready(struct mii_bus *bus, int addr, bool is_c45,
 			       struct device *dev);
 int air_en8811h_fw_download(struct mii_bus *bus, int addr, bool is_c45,
-- 
2.53.0

