Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685CB47ECD3
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789218287; cv=none; b=tdLZmOKlB844ctKEiQVH8/RzLUWxPKhY7C+yDYXeG+iEwBMoag3XIWreyqY9UKFeZUSv1O5xnrEmhRW6HWVXgOZMkOe7t7ewEcR9cU1d4Kub+W1ljXHsyKjgFooFcAU0hF/MOSBesltwAKTvpMu0K3T6CoJMBcVgFk/Dpxd7J9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789218287; c=relaxed/simple;
	bh=0nzfD1yEyPbsKp/gVbB5i/nz0U65iWYGKzyKw2h1xAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTXGpS+xuH4Jnzx6RvuA5ZSy7zWlyB4g3IbjPQDhMMNIPIb0/jOZIR08dOL75k8alXTejkrROzzBSSaqalMZ+A5nmTgyI2girY61ZUXHTrFAFBdE215FgTMLpvUPq2XAOonecfFVsHpEk2+pvGczJB12agFG46Yopc+u/ESktnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=jzTA9YUX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="jzTA9YUX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so20127125e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789218282; x=1789823082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8krarzmlflz0yDgWDl2bVIlnYuu42nINyDR+t6rfVXw=;
        b=jzTA9YUX07s7enm8sckO2rgDGrTXkJJOg9II7IjIVFXgKG5smxkTDe7l0aB2MKFalO
         67rqh1ccVxVdcdlDXPds+GjY4oivkZPfoShibYVzsqx/uxTW8tBbpi1CYg4NvqbjLn6M
         j6aYwraiN6/tGHmJseFSZXb8N43iss+1MM+7QFagd8QbtdMYGKlTGOtwH6iTB31VlPpu
         kszxRP89fAPmEd8synnEJQaaDiEVOvH5Z0QjKXgxcKP6Ez0+Dg9JU3Ar1roK4rc92qPO
         /dlk7OeH6oQqHSghcKv6BAHLi0XogWhiDClvVKWkzqbbwSZXBGElkQhGvvgPx4sydOOs
         GHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789218282; x=1789823082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8krarzmlflz0yDgWDl2bVIlnYuu42nINyDR+t6rfVXw=;
        b=RUCsPJoqIbaJ9ur9/ymyx1HkHYsoVqkMS5fP5M4cl5zfdeS0H414TWPff2NKr8RBBV
         S9AqHTapqj6DnFPXXCLUfttnNFJ7w0HrQhiAEMgA43Xpuljs2FB+Cv9FsEQmf2Jrsm2E
         xYUI4WY4p6jmy6JEo6cykeeRtrelUOB8GXjVCZe2wJLdAowHXYolQChXfGa23dxQQUWV
         I8HOPQcekWE9WGM7+tqKoJV94o4vvfjtWqABufr5J//2ZgBwqnHmKBkD/Rq3ubDhI7Nj
         zDvgmxPhVOAftjhGA1HwMAJd/DmBsK4ZjUu7gYf6pxnThAiHcCQDhqw6oDGfJUa97V9t
         1jiA==
X-Forwarded-Encrypted: i=1; AKwUvBxvDezw6JCKkK359AmnH4v8+8mWPeJare/ZBQu/VgJEviOMWFnpJt7AFViTqPeB7KhYhfMhgyVLKMyCFyk=@vger.kernel.org
X-Gm-Message-State: AFuF++k0cl88OsKD9CwgrqbmEokVSUk5Tdj35Ylsgg7FuZ7ArJTQpfv9
	N4lDHbef+UU6v/fgBTNjKMnBGEOxYhcAUi/j87RYlgH5a21WAB/kSdDZ7FzJtydJbIs=
X-Gm-Gg: AYBFou2b/rqYsoJHbb2c9iTBH6jYy+bZwwzJkt+q8phUxudgVq0rt8gWC/8eGiThyhS
	FbJt5Gj/cahUu2qg8pCZQ3psO0hC08FsrCZCOMlNGaP9XwO66fhDmt9bTd95TjQqx5gw1Wsz6MM
	N5+mNtlI13KkvuUtf6gj7n2/K1R2z/P3TIUFimRT8gASkIN+xjyZ+pwaHhEqaYWV8ry6uvHTCkg
	/eYo0nZggiTClvbVOpwwSQ+Ri+wZRPOcqxwoDiqW2GO/nhVDifOXMd/C+aUFtpGVml4PSZTkDSY
	KNGoMCjmVdn6u5rXVL/xKdInXZiUjO/Vwi0MJkvZ5ENkipSGKn9ANy5kryBBF8jk5QF1lE/CY/w
	xxz+WPo7tLnZAwZBqujMCtDtpWekYo66pFgePQcONMK/6sMI8gabM8pFw5WNSoBVKbByTT+o0MA
	RTcGZ3X2jGj0TSRfp5sBjv40QBEaEnBf+hPxs/YHSm7wk9e1aS7Q==
X-Received: by 2002:a05:600c:6085:b0:49e:6cc1:14d9 with SMTP id 5b1f17b1804b1-49e6cc11680mr27415325e9.32.1789218282324;
        Sat, 12 Sep 2026 06:04:42 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm80985785e9.5.2026.09.12.06.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:04:42 -0700 (PDT)
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
Subject: [RFC PATCH net-next v3 4/6] net: phy: air: skip the download when the MD32 is already running
Date: Sat, 12 Sep 2026 16:04:28 +0300
Message-ID: <20260912130430.2246285-5-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912130430.2246285-1-f@lex.la>
References: <20260912130430.2246285-1-f@lex.la>
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
 drivers/net/phy/air_phy_lib.c | 23 +++++++++++++++++++++++
 drivers/net/phy/air_phy_lib.h |  3 +++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 43d2eff808f1..c9b46cfc854f 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -1028,8 +1028,8 @@ static int en8811h_probe(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	/* mcu has just restarted after firmware load */
-	priv->mcu_needs_restart = false;
+	/* Firmware that was already running was never restarted here. */
+	priv->mcu_needs_restart = (ret == 1);
 
 	/* MDIO_DEVS1/2 empty, so set mmds_present bits here */
 	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 672a82539dbe..2b1a73beca8d 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -410,6 +410,16 @@ static int air_mmd_status_read(struct mdio_device *mdiodev)
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
+
 int air_en8811h_wait_mcu_ready(struct mdio_device *mdiodev)
 {
 	int ret, reg_value;
@@ -443,6 +453,19 @@ int air_en8811h_fw_download(struct mdio_device *mdiodev, u32 *fw_version)
 	const struct firmware *fw1, *fw2;
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
+		return 1;
+	}
+
 	ret = request_firmware_direct(&fw1, EN8811H_MD32_DM, dev);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/net/phy/air_phy_lib.h b/drivers/net/phy/air_phy_lib.h
index c288b34f2ffc..47b4bd0b7c1e 100644
--- a/drivers/net/phy/air_phy_lib.h
+++ b/drivers/net/phy/air_phy_lib.h
@@ -64,7 +64,10 @@ int air_phy_write_page(struct phy_device *phydev, int page);
 
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

