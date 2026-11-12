Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490988;
	b=pGb1eHZem3MnzIUdstrFzkYhCo++AcGanHesOzAt2AjPjQb+zuoQMBIGiPrivP1vMTYC
	 PQYpYaWX4wkvHbA/YQZIBU8q2icMfI05HfgVgibXhgCpI2kgAVVu7qAZov1AEPbXbsttl
	 rIOhVaTEstSWphtOhrotfR201TEfhd1rMfzqqw+9glOuK5llYUgtZ1XwZKqS9RUhVdgam
	 xItlmeMr+6XQtEftysaf6kqVzoOynf7Wpz/ETer9/WAlPZrdDj2QXskcZsu2sKrEd6gsn
	 4mKX85NGxWZo9WMrPKUhsxYgj7c8troUSDj2sdKeDKHp9nn1kchKF1y1F3kkayLEoHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WpqRCk5B5nzcn0n6jouAOMVgDxIdILw4Z1c/KOkDk1Q=;
	b=4GIvYOXeJMLj+1FRKNI8XUvk84mc004GNVisf2waBK3YaivGVfI+l/EP0z0fWLLUXF/x
	 2CHwhRldQtBAxiQI9YqN5Ed7z6g4nAtj9D6qOOeHDpgCHae4lJJQKJP+UcSRtrlwYaW2K
	 MDhH0Uk4VRie4k9OEzO5Pg1CbqxrTi6CKvQ8rz8ZzJ/jpvJaa2xpzi6mMnT031IzoEURm
	 xygbwRvaf7SXqbXTFBhqaG6IC/qvnDZK4DKzK26pa6kzkQ5qJvLeqMB/Vn1OABWR2Guwb
	 YAHE6yBMaPJ8D0JhHkyx9yUWphgUhxVAeAu6yCZWXspIEJ/SGnFXG3RDNe7Z7ZZsd2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lex.la;
	spf=pass smtp.mailfrom=lex.la;
	dkim=pass header.d=lex.la header.i=@lex.la header.a=rsa-sha256 header.s=google header.b=gXVtT9P8;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D03606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.a=rsa-sha256 header.s=google header.b=gXVtT9P8
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50604721c8so398476766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1794490986; x=1795095786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpqRCk5B5nzcn0n6jouAOMVgDxIdILw4Z1c/KOkDk1Q=;
        b=gXVtT9P8NG4Y8mBnHBOSgiSMWHJhloOCqJbamVux/7OjkAWXpOFP9G4DG9cY+ilI2E
         irbP7daRSPbCbTSl0clmFcG7cPMelW2vHsn9MSnXy9WUGF6kGQv3ZMwHXBMqEvKdmI1Q
         BX3AIOkAVblge0WhthggOL6YUdfF8wHjXKGVTpMltpVkR13BHeJSnbxfR2xfT3PyB8Lz
         /rAKUMQrfYCP71VCJhayrU9wt1gozg6BxeLSya8R4f+ngOI5gqC/lX+X5bMo1sOOATuR
         zwAWg7QOfU4H3LaqSlyhrF5V1VcFdv+mf5sqORv052ju9qIcxcv0hrOcJTmAg3UoXCEh
         rR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490986; x=1795095786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpqRCk5B5nzcn0n6jouAOMVgDxIdILw4Z1c/KOkDk1Q=;
        b=ETjNx6cubIveFr66xpCpWj9a7y+RCyQtASADymmMxx1g5g5uAW7SECHlRdrRmyNmzO
         X/b281I11msuPHFhYR9fqQ2W7Q93TMB6Tc/Jma1DbdGWb2i+naA2eQ2MiwaE0g7LBemX
         wn1l1cY+Fp1XoEH045ay+WsRuQ9JVtFNdzwL5bSUXo+KuwR31ax/cTzZK8NVXXkFhzVu
         Nmdv9Ktsbwf4UhgZ0ZrPgrZnHCNGFKux6JaEC757D/BjCYXKsr1crO/Pzh9lBpiUrs1N
         Y//zjmOQIXlMQ9IcicEtm+G4AdG2TpOJgXMuyYN5g1UCYc+VNemwnQXZjAKVao94Fx1V
         /OwA==
X-Forwarded-Encrypted: i=1; AL+hErFUuW4t5MDMU73KMeSGObqtBNLEc4Q8GrMvZ0FSReG5JXP49ZoFlTIqSHHE4XLRmg0pK5u2QOF5faUJpfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JF+SFzmKBmhFA21Nf4zOcSnMtK0TSQEEJ0wYVLinCjRM8UopT
	rS7zHTZ7mc/0dT1ufo/bhsywPKdf/+LVNMkhCXUg8TfXldYPgUrfYLZGf4QiiAGk9BI=
X-Gm-Gg: AYBFou3vd81L+tGzQkkPw+/IkrDQoaa7iK7cqRAEDwgrQCGKNcPafQwDcA2eYmb5FGF
	8lLRYoMLncD4hK6U7YRz7PY+bA/j3fbVWyUfGWdpIcL+kDkk8+WfQuPzAB7gufzE2YtlnwiCydD
	nKWGiWUNnT4Hz2+Wd0zvnxRaA+SnhtAmBGjUILq+1AhvtCEgrgvIBohz1r8VE9C4mty6TJTNmWi
	5BN0DaokgveLqPE/dzkT5IS+5H/NmS/jRiT2+xeH4y4MEGSlt3hMNXHSWLv8drns8vlc9aGF7EG
	+kroE6a72ZXUfSa3qKbaOJK7tDE67jquKWSLmoIZh0T5ZWttG9SjwU6QV/GxpTP/lz6z69aaSYF
	ZdqgYcqqOdeUenEcQIq2ePxThGOEE6lr2tqk8gSQ9KO8HRMg03P4V+rJGxyHaJ7Nd5s7q/m3crk
	4tFaOY3tOWjBwrhG2/gXJVQBsL8EIzs7WOi2pcjNVOtJ3f7MKQWmtJesguCFsPcqTg5E6CKHUqb
	zECOZj/t789W11o+AGJhjVUnMdwy0R3VtT61dnUMl4ETvYf0yLa/C61YvXgVX4jAPGsVwGQLL/7
	6DDvnwXAJdp7NeXCsd22HQiRNUDQMA==
X-Received: by 2002:a17:907:c13:b0:c4d:4be1:4197 with SMTP id a640c23a62f3a-c5066c986f8mr488046766b.41.1794490985681;
        Thu, 12 Nov 2026 05:43:05 -0800 (PST)
Received: from remote-01 ([84.17.55.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6930sm349138266b.5.2026.11.12.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:43:05 -0800 (PST)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Lucien Jheng <lucienzx159@gmail.com>,
	Albert-AL Lee <albert-al.lee@airoha.com>,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net-next v2] net: phy: air_en8811h: use firmware loaded by the bootloader
Date: Thu, 12 Nov 2026 16:43:00 +0300
Message-ID: <20261112134300.4188612-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
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

On a Keenetic KN-1012 (MT7981) the EN8811H sits behind a port of an
MT7531 switch. The driver has to be built in there: as a module it loads
after DSA has validated the port against the generic PHY driver and
failed to set it up. Built in, it probes when the Ethernet MDIO bus is
registered, before the root filesystem is mounted, so
request_firmware_direct() fails with -ENOENT, the PHY stays without a
driver and the port never comes up, although the bootloader has already
loaded and started the MD32 firmware.

When the firmware files cannot be read and the MCU reports ready, keep
the running firmware and let the first .config_init() restart it, so the
PHY starts from a freshly started MCU as after a download rather than
from whatever state the bootloader left. Nothing changes when the files
are there. A board that relies on this must not give phylib a
reset-gpios line, as the pulse at registration stops the MCU. The
AN8811HB path is unchanged.

Tested on the KN-1012: with the bootloader load the PHY binds and links;
without it 0x8009 reads 0x0 and the probe fails as before; a rebind with
the files present downloads them as before.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
v2: read the status into a variable instead of wrapping the comparison (Jakub).
v1: https://lore.kernel.org/netdev/20261017180251.3618606-1-f@lex.la/

This replaces "net: phylink: wait for a PHY that probes after the MAC"
https://lore.kernel.org/netdev/20261006124731.1528963-1-f@lex.la/
following Andrew's suggestion in
https://lore.kernel.org/netdev/b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch/

Developed with LLM assistance; tested on hardware as described above.

 drivers/net/phy/air_en8811h.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index a03d63dd4ac9..d1de58c3c294 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -518,6 +518,19 @@ static int an8811hb_load_firmware(struct phy_device *phydev)
 	return en8811h_wait_mcu_ready(phydev);
 }
 
+/* No firmware files, but the bootloader may have started the MCU */
+static int en8811h_use_running_fw(struct phy_device *phydev, int err)
+{
+	int status;
+
+	status = phy_read_mmd(phydev, MDIO_MMD_VEND1, EN8811H_PHY_FW_STATUS);
+	if (status != EN8811H_PHY_READY)
+		return err;
+
+	en8811h_print_fw_version(phydev);
+	return 1;
+}
+
 static int en8811h_load_firmware(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -526,11 +539,13 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 
 	ret = request_firmware_direct(&fw1, EN8811H_MD32_DM, dev);
 	if (ret < 0)
-		return ret;
+		return en8811h_use_running_fw(phydev, ret);
 
 	ret = request_firmware_direct(&fw2, EN8811H_MD32_DSP, dev);
-	if (ret < 0)
+	if (ret < 0) {
+		ret = en8811h_use_running_fw(phydev, ret);
 		goto en8811h_load_firmware_rel1;
+	}
 
 	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
 					 EN8811H_FW_CTRL_1_START);
@@ -1214,8 +1229,8 @@ static int en8811h_probe(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	/* mcu has just restarted after firmware load */
-	priv->mcu_needs_restart = false;
+	/* drop whatever state the bootloader left in a running mcu */
+	priv->mcu_needs_restart = ret > 0;
 
 	/* MDIO_DEVS1/2 empty, so set mmds_present bits here */
 	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
-- 
2.53.0

