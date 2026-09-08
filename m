Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F44583AA5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883044; cv=none; b=HoCNxBALN38VYkYP8YGpAWsKnpDK79xBWWhJr0d/uQVdfoUs2he90JT+a8GpTS9SEIAGLgRiohKRQdXSdwyN+Plpi17Tkgq/roskxpfRY4hcJLiCXLAd8niFyZoI53TMhxcAzsJr757mkgIcHBqv4WSAjFAXX163Yusd5aXjRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883044; c=relaxed/simple;
	bh=R+trTOYlMixGurkSaokPqFVhZzEOyMehQzqZ+3h2vsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HU3rUfUdPN2O1bDgHsfHvmbbYgIoiKZ2eiek1RhPubqylvke+rZTM12MwdEC6ov7pkZVBI6SCnEzyKjGISlD1FXiG1n1iYHTjaJX5nhpTJaq/YiFnc5abjpgYgQaFgqnHwR1TWPRCp1BXujj/1PdGzMLYDk8F224FUaIj/LnFT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=c0LVPc0d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="c0LVPc0d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso35069345e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788883038; x=1789487838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R61YL4bM9jY5pVzf4nxgHgxN6hURjg68AYKuV/uyHLo=;
        b=c0LVPc0dfNv6tKSwPGwQ7qtKI4ML2uEf1r5Z+cQawlNp85IHjIH8nWEYz1QTeJrnr+
         UnSJW+fUGu3Cj4xinumaJVEm28zDIKoVY6JkCjOJQQlxDldLeWDKGZaEGrEwlc45jCA4
         7WIunzhZUV+ejqUDH2ST/LRG+yQj8PJuwaF+eCYS37T44mrEK0o3UUZlbtESlVptc1Ex
         st5cqb3gWK1kAVK39/Jx0LpJI4OqA4hgV+pWrEFbKDkDIcFlVCwMW+fLjR9sf9c+w52U
         IcLRj/9HKmKERvxVX81bW0RX6eSAeeD2K4e0FJQGlmeKlWYl/UFehn+afEgEf+k5L4m4
         JnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883038; x=1789487838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R61YL4bM9jY5pVzf4nxgHgxN6hURjg68AYKuV/uyHLo=;
        b=SLNPRebllyryEMIt4HHYKsWLjGxTzzX0PtuWbfnliPc4hmGjDD7Ng30B5F1vfPTsUf
         EGGNoQALTlW+V+0D92ia6HARjNZCzSh/09Yd50NNrpUk56d2CtUmIZewlpRQe46JafTM
         mNZqR3caNhwyQOhePlW+AV/H520EqHqT/siRwVLBfEGXwlWdPbiVQfA0kqnwOeynZKR0
         ish3RyNycFgTOmofQT9mS4K9ipsuIZ+BpG3LgH+sYjzOE4OSaoNEtaKvfY7hq/rJHPey
         vKUNPsO/xX62It2rzTm15h8C+AtYA/3jNAHzE94a9e5CJOj277IAE3pumvanITYI4pGr
         b65A==
X-Forwarded-Encrypted: i=1; AKwUvBwD3eoADwn32TQf6qWeiccuJ+LpzWcl5POeJidj2hbCleIIqbOM/2g9zIJ+MbUvmmJuPlJYir61lO5ALp0=@vger.kernel.org
X-Gm-Message-State: AFuF++mse+fBb6Ub69dbGT/FaTPzfYp+ihCcuGKjJzoH3Fg/lv51XsYv
	4V386sKoY8/15Aq6DsGMfm4fPHVL2uXViooIrSpBPvneeLvXvMIpZxex1sTZ28ZwTz0=
X-Gm-Gg: AYBFou15yzVtXq+PdqdaxFwV4UOtdW/Ug05HIrLgz8jGc2I+g0Sgzw4lsGsiE8LNDFY
	FQx5VPOBGV4LjLeLekVRMwIRTbn0V7Qpd0pryAvvMrIpEpClZNNSOjMHRKKpZc3RbDZ2jsU+f+x
	IZBCvt5BqM0TcGsmgvOutVMV7izGS8fmPcgTeMZ797AIqdDUFH2/uvCDXJsow3rQjdtX1DUyX+Y
	bPTQLWg6j4ay3dBI+PhoxC4OdNuFQAXz/fOcJOj8+R2kUo+cLtZ6/OwisQWJX8PTpo6N8I84b/W
	nbi39sM42NuGCMSuXskP0M1z9SUqiHAl3J7OR01IgPxKK9yZ9LGbY6F0KD2LU07wgxhVBJcaKKx
	YuauFXs6qr+59at929hRv9jIvOUoY0EI7nSwUJv7QVEz9UzWwLlkzhYKyXqKItkKVkI1Klz0tNt
	g2GISDJ2ZDxOenGeZFbt/pFOO+dnfngymoc5BnbNwVYdwBoEpM8g==
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr147455505e9.1.1788883037684;
        Tue, 08 Sep 2026 08:57:17 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm37345704f8f.21.2026.09.08.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:17 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v2 5/7] net: phy: air: skip the download when the MD32 is already running
Date: Tue,  8 Sep 2026 15:57:05 +0000
Message-ID: <20260908155707.4164559-6-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908155707.4164559-1-f@lex.la>
References: <20260908155707.4164559-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The download is unconditional, so a chip whose firmware was loaded by
something else - a bootloader, an earlier bind of the PHY driver, or
an MDIO device serving the chip - is reprogrammed at 144KB per probe.

Read the status register the loader already polls for readiness and
skip the download when it reports ready, only picking up the running
firmware's version. Adopting is reported back distinctly from loading,
because nothing on that path touches FW_CTRL_1: the PHY driver must
leave the MCU restart to .config_init() rather than assume probe
already did it.

The image in RAM now wins over the files on disk. Where the PHY node
carries no reset-gpios nothing clears that RAM on unbind, so writing
new firmware files and rebinding keeps the old image running and
reports its version as the current one. A power cycle, or a reset line
on the PHY node for phy_detach() to assert, brings the reload back.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_en8811h.c |  4 ++--
 drivers/net/phy/air_phy_lib.c | 26 ++++++++++++++++++++++++++
 drivers/net/phy/air_phy_lib.h |  3 +++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 6822774d9ae3..d1c7c472f0e9 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -1024,8 +1024,8 @@ static int en8811h_probe(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	/* mcu has just restarted after firmware load */
-	priv->mcu_needs_restart = false;
+	/* Adopted firmware was never restarted here. */
+	priv->mcu_needs_restart = (ret == 1);
 
 	/* MDIO_DEVS1/2 empty, so set mmds_present bits here */
 	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 5b7427e0d977..a5b6b3606bec 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -410,6 +410,17 @@ static int air_mmd_status_read(struct mdio_device *mdiodev)
 	return ret;
 }
 
+int air_en8811h_mcu_running(struct mdio_device *mdiodev)
+{
+	int ret = air_mmd_status_read(mdiodev);
+
+	if (ret < 0)
+		return ret;
+
+	return ret == EN8811H_PHY_READY;
+}
+EXPORT_SYMBOL_GPL(air_en8811h_mcu_running);
+
 int air_en8811h_wait_mcu_ready(struct mdio_device *mdiodev)
 {
 	int ret, reg_value;
@@ -443,6 +454,21 @@ int air_en8811h_fw_download(struct mdio_device *mdiodev, u32 *fw_version)
 	struct device *dev = &mdiodev->dev;
 	int ret;
 
+	ret = air_en8811h_mcu_running(mdiodev);
+	if (ret < 0)
+		return ret;
+
+	if (ret) {
+		ret = air_mdio_buckpbus_reg_read(mdiodev, EN8811H_FW_VERSION,
+						 fw_version);
+		if (ret < 0)
+			return ret;
+
+		dev_info(dev, "MD32 already running, firmware %08x\n",
+			 *fw_version);
+		return 1;
+	}
+
 	ret = request_firmware_direct(&fw1, EN8811H_MD32_DM, dev);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/net/phy/air_phy_lib.h b/drivers/net/phy/air_phy_lib.h
index 70c8ba66bd73..226dc9f2eb07 100644
--- a/drivers/net/phy/air_phy_lib.h
+++ b/drivers/net/phy/air_phy_lib.h
@@ -64,7 +64,10 @@ struct firmware;
 
 int air_fw_write_buf(struct mdio_device *mdiodev, u32 address,
 		     const struct firmware *fw);
+/* Returns 1 running, 0 dormant, negative on a failed status read. */
+int air_en8811h_mcu_running(struct mdio_device *mdiodev);
 int air_en8811h_wait_mcu_ready(struct mdio_device *mdiodev);
+/* Returns 1 when it adopted firmware that was already running. */
 int air_en8811h_fw_download(struct mdio_device *mdiodev, u32 *fw_version);
 
 #endif /* __AIR_PHY_LIB_H */
-- 
2.53.0

