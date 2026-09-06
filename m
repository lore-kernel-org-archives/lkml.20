Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CF83CC7CC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716759; cv=none; b=UPO9uTF29qmhNeAuFAUnglR0Z6tWGKPA6NRgzmNdEHFMk8+mHpU/VuBGh2ABhx/LkTBFEgzJqdW7bvpreSBJAVPYJoAdWfup8uD1v6E9Gjpo0HkE7/eAwnK6e7sSPjK/9/7E0XZtlbxkOYmB5CnMKWF8EmA5NcnB9dV7DxpVvDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716759; c=relaxed/simple;
	bh=mfqQI09wuYrBVevDapzW2RZDyiJlShiW65OxVXhZH7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwBru9609Ghl49FD+9znC3E98HG6cvjCN2O0g9zw+K8pBbsPC3Qcnu1qzf6b3Gb303d9F8WnlAoM8Wt06qVMEwNrIR4SP0kadufoD9/sbE/eE9E6uh6oSLu9L8ZU12r8Nouw6hni1CkVCgEZ+WDoa12I4V37Z0h6JaV0eztcdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Z6joZECq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Z6joZECq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495590dde14so38829685e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788716756; x=1789321556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hv48dP/ayYcrEmiR2YWQTT03r7gYDIp+vhAiB2fDDRI=;
        b=Z6joZECqwSQWuAkVMS3Qa07BhLVJmG82rx385TkDD7gJivhUcGTZ0NAg/PM1HQZsNg
         V5+YCV0P0xGbeliPHe5a6znH+nC8bWo5n5rwBF0i33nt7nPAJoCb+o37FeSo+wQIzE/9
         iKzwKIK8QShX/i8TJCOtYmqY03y8T55/Php9olanRehHk6xh/3EDXOU/2+PSG6rREeyV
         DNhjo3cgDvU0ykIydZrBjrE+PWlF8QOnC/UhG4cW1jdxZCPOpEtwf6ysK1a3rSqbEC3/
         4JrmabYSACP8/rBfvmGMyFkGAb/oZBeXhXawWH01RKPXkcoK3nVrtLVylaH8/URzbm1E
         AYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716756; x=1789321556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hv48dP/ayYcrEmiR2YWQTT03r7gYDIp+vhAiB2fDDRI=;
        b=CDF301E0iIHythaX9PS1EGxU7KYnMr51vDFhxyS8Br0VPIvLt2aV4gPb7dJUJJUVXx
         NlRWWR5YNC5gsQStV//VWQlBFG/TUoOZMIYB2ZyxxvO9rpXlj74lO+KVJbZN9K4+7u+A
         nxsIc1IrwQcDYBpb3RWVdzHCSalZSrEfgJQ6c9JIZ6P59tJJfMAelVPT5ouKvEoyAzgw
         Z7SbogFH9em7qwrGkd/zGhgTOiIWT1c58bXKhvERb50NmkZ5aDpWiZOBTOKlrp5f4uKd
         /toitRZkuHgIMKwrcUKku46NO+y46gTvi004M0w+Qooe5Jtc5GiigRh69fLZ6wH7yKa7
         C2Ig==
X-Forwarded-Encrypted: i=1; AKwUvByGKZLvsFyFVQT823KuyU3idkPN3CDB6bbSrGuSP8n3lrlzNIqgOtbPETA/QvgdY2v7ZqO2R4u0h5sBW7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kkBfparRGp/ggMT9k9NlXXm4zJVsMBvXwvD61Ts6hjQRkU+haM
	YDKRlVbByTOtGcT8r3pxdM1gfzTZTHb3/ImEQPN0E29W+Lbkbo/h2lkhCnwbNM5H5Uo=
X-Gm-Gg: AYBFou3CG9l50EB/ZajW8Lj7GclO2lHhUtfiUQZh/Suana+hby+kdm3bSAA6ULNcfrZ
	OwbrAKHh8RYxHwICaL5s4Lg2Afvs8/F01FzA2RVb8ZN42AL1EC4It2J2kZgMvTL+VtjkbbIFuE8
	xpGDB9isIdUmTUX72cJ1rCC2kPAYPxonfq89nR8nQq+3T3CHmw4DdUQJ2SChdLlJyoQRdv1drBZ
	s8OCTRT/r+WU0IWLdX1P8NfLuKptm6JNQ3X30FsfWkY6wPN1zQZ3t1Bu/xWz0Q4sE4GrZQjGday
	jCxI8Czk6wjTNXK/xbhNMB8wJBc+MlV/5LD0KfeyKY2S6OMT6KlwmwPyHh3DPv3iDZculssBVe1
	Dnaoynm9n6RFJers5THUZP9mhyD4q80EQKMm7NetzZX6uxrUb/7MCf8ry/QK3xYKGGOy3LEfch3
	YGFrPatfGrzD3wHOBxOJ2rkzVFlnKXhv/i1diJyLo=
X-Received: by 2002:a05:600c:a00a:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49cf81f6736mr374127555e9.6.1788716755666;
        Sun, 06 Sep 2026 10:45:55 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm245418805e9.0.2026.09.06.10.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:45:55 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 5/7] net: phy: air: skip the download when the MD32 is already running
Date: Sun,  6 Sep 2026 17:45:41 +0000
Message-ID: <20260906174548.4106801-5-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788711797.git.f@lex.la>
References: <cover.1788711797.git.f@lex.la>
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
index 920cc0ea1f67..786c0b26ae65 100644
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

