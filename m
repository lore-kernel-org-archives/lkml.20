Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193035C6A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422448; cv=none; b=kpJ9xQGLoV/DJxPSSbr1yv5b8PORFo9cGU+kckMwaP6pjpMdZX6q/4xUmkjgtshogCuJ0gwNUSKbxm8nAr/WRgRpQogVlzqRV9DxLoYVDitbtFoRiCLKa+LBnLQY8FN1r3jRkmzDcarjlDpApH2/QPEE5fLWLf3iPNtZx+uBbI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422448; c=relaxed/simple;
	bh=OZCxqLqvD67tLuRH30Qg4GAbpyrJ2jMhoF/H6ap0zZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/8VexVbL1wJ4xEdeS6+9wxluq5o0jzlXi4+qTaGwTqXq7IGCMxGGSk7MOLTlj/S+zCkS6hI3x6VAx2bSBvQB5Qvl0hFQVLjUIlxG2O5zPfV7vYoyMuopHYzNVeE/4VaPo8C9aG/6VpD7nT6WazCyJbexbUS+NsoY2EmS5+8TTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0qoe3sl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0qoe3sl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-86908cbc011so5594752b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789422447; x=1790027247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iANkh4ZE63HnEW91pEiubYS4RY0yTffQC0st6T/ABSQ=;
        b=k0qoe3slSs8EebLI6J4JCBNVBtnJFLrjMxEA2Eg1G+kA7OOgid4We4DxGDl2JNRft6
         IBZCmcbY/z8Wiosw7ttOCUXD8Tew7MwIoenALMzBIptLH4VmVWnHmuaXOEF6F9Zhv2wj
         fIE7IINewAtD4o9T7j2EnTp1oKPAC09j6mredkCnJFmSP7KNONrDQRb6RxgUy4xG7Pek
         2VLdj9C7o3SvzAMW9crWidsMf9IuZhJ4eqG8MDa7Xkn43E0Req99cf6cy4kYFxV53g6Q
         rb22V+kb2TKvb0GDF66mhtSUMFS+sV/gLTnYYX7LJg2OFK6r0NqjhEX6LUBALZupqMPQ
         X24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422447; x=1790027247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iANkh4ZE63HnEW91pEiubYS4RY0yTffQC0st6T/ABSQ=;
        b=goAwafIh1whN1dadVX5QhsmX0+HBmWhANHVjL2qdYmu5ePkJdRPAFS+awbCFij+AYL
         ZEqFOGAJQ1PvyFTmiCFT0UElLwmlOHs5RJcGIdyrkQBKRyUlrsNYq/q9V/GA9UmnFz+i
         EGxhZMVYhebTHyIGcV7dREdoKmNjnpZOZ3JX4+P/8n6uBo0yal8Q2zYxiejlSJy0xS65
         3ejoo0NjYmGfseBMY9m3e6EPIkwcXVs0NEm4991dwlo7kRBTaAqo+pg04GIbXDCXMtWC
         vmJn2rD8alzKkusawAYFA0jcx+LUV5u83+ydOo6TXWUyvqJbls74uHY1d6KqoReWwpxp
         T1nw==
X-Forwarded-Encrypted: i=1; AKwUvBzMOvVHjzizb1BL+D7jCUW4hKKjsF6t8T1E45TsbhcDvsqjH4+YYZ1JOvlSslw8pnspuoCbKf6rphYD4Ys=@vger.kernel.org
X-Gm-Message-State: AFuF++lUznt1gb+2IurYknXqK42W/WNNP3kPdHjd165ztRDqeMWjbx92
	+z5oxPhl0K23vElDU1A8xsyHd5qoIK0GcEImjRA1VyumS1ypLgwPBno=
X-Gm-Gg: AYBFou3kOatafd/rHjcSgg2cZzPwmI0ymC/42mttaOggmjmeXSF9SinYN/ggTh3VY2j
	YXrHfd8O6WlZvGGyToevVBQDrs77Pj7+b//zvjjm7Y5WcyUqomKsA6svydfZR2qdIbo9JbwiPFl
	QAKkla2UBuMuvfb4LYNMt1YgIFUi/vgyn+bJ0s13tru9IJPeneWJDUfWJJEsmLZNzI2zsxNRRvU
	oDp4RDdLDwpblkL2btJaXpJCrf/YOdLl6SDwJ+tKLQxgN/Am+BNHwBdupOVUz2+sHVQhFAikRTI
	QZo4gT+K0OozzhN0n2bWmWW7nK9EerKp/UcD7a2pOxdTkvbmZ+Ddt00l2dAdl4DEJZMbq7rhqki
	dvDujg45l/ZmMhbqovOX9qQF/KbpcFL46bnYC6itD1AjQ82tli0BAcNDSPnkk2zBQQLUJUM1nQj
	ei1qQ08nbsLySgoSEIIxZE7tKxDM/mUkxTZ9zq0RkgUiVuw4DupCPYGoTuLjD0GkRaOSJwZ06rJ
	0gAldkWrqjyA1lJ3lWwORAL/48=
X-Received: by 2002:a05:6a21:6f09:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3db4051cbbemr8516759637.12.1789422446637;
        Mon, 14 Sep 2026 14:47:26 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3b80:bc61:4619:5346])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33be253c683sm1859672eec.16.2026.09.14.14.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:47:25 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] net: phy: qca808x: handle the active-high LED polarity mode
Date: Tue, 15 Sep 2026 06:47:20 +0900
Message-ID: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
LEDs") added PHY_LED_ACTIVE_HIGH but did not cover qca808x, so
qca808x_led_polarity_set() returns -EINVAL for it. phy_probe() propagates
that, leaving the mdio device unbound and phy_attach_direct() falling back
to the genphy driver.

Accepting the mode alone is not enough: led_polarity_mode records
active_low, so an explicit 'active-high' node stores 0, while
qca808x_config_init() re-asserts QCA808X_LED_ACTIVE_HIGH only for -1. The
bit does not survive the reset phy_init_hw() runs first, so the LED would
come up active-low.

An 'active-low' node needs nothing here: the bit is clear after the reset,
which is the polarity it asks for.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908105959.70453-1-donggeunyoo.kernel%40gmail.com
Cc: stable@vger.kernel.org
Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5 sparse
---
v2:
  - No code change.  Rebased onto net/main.
  - Cc Rosen Penev and Christian Marangi, per Andrew Lunn -- they may have
    QCA808x hardware.  Christian wrote f203c8c77c76 ("net: phy: qcom:
    qca808x: default to LED active High if not set"), the default this
    patch extends.  If either of you can put an 'active-high' LED node on
    a QCA8081 and confirm the LED comes up the right way round, I would
    appreciate it.
  - Say why an 'active-low' node needs nothing in qca808x_config_init().
v1: https://lore.kernel.org/netdev/20260912012819.2072067-1-donggeunyoo.kernel@gmail.com/
  - Supersedes [PATCH net v3 3/3],
    20260908105959.70453-4-donggeunyoo.kernel@gmail.com, whose
    Reviewed-by from Andrew Lunn is dropped: that version only accepted
    the mode, this one also makes it survive the reset.

Compile-tested only (W=1, sparse).  I have no QCA808x hardware, and there is
no KUnit suite or MDIO mock under drivers/net/phy to exercise the MMD7 write
without it.

 drivers/net/phy/qcom/qca808x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 8eb51b1a006c..68fd4d0fe31b 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -200,8 +200,8 @@ static int qca808x_config_init(struct phy_device *phydev)
 	struct qca808x_priv *priv = phydev->priv;
 	int ret;
 
-	/* Default to LED Active High if active-low not in DT */
-	if (priv->led_polarity_mode == -1) {
+	/* Set LED Active High unless active-low was requested in DT */
+	if (priv->led_polarity_mode != 1) {
 		ret = phy_set_bits_mmd(phydev, MDIO_MMD_AN,
 				       QCA808X_MMD7_LED_POLARITY_CTRL,
 				       QCA808X_LED_ACTIVE_HIGH);
@@ -603,6 +603,9 @@ static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
 		case PHY_LED_ACTIVE_LOW:
 			active_low = true;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			active_low = false;
+			break;
 		default:
 			return -EINVAL;
 		}

base-commit: e6b6078ea1731b05b3b552497b3bce4bf8b014ae
-- 
2.53.0

