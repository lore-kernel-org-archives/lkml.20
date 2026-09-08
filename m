Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DC4C6F08
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865221; cv=none; b=OMzQuQlqcJFjCJ55b0ba5AI4g6PNn7gTrFj6qN+7vJaw7d/sAEUPwvjprbyXtjP8P6br1oIgF2RhNdRqhcojDf7fXrDrHNnjSkFTXhUw5rfgwsNb2vjEZHPdE2sLZ96568SaQZVIdLg0XBmJToZuoPDqtyCNf1BMEmShbriS7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865221; c=relaxed/simple;
	bh=Suqd5ftmj9Y6jk+Ge3M0i5T+AGs4crNAREB6UPMJwV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orUEjzV215Zxv6qofMb1ryrlbXDaJB9l3EJKP417VDmYgxJ7ZZOoUsjx7i7v/CliYUTUehiqEBgZ8Nh/ZJj0FzxTXqxjiRy2ux97bb26D4eQWVAEo0E1oILS6JsNv9O9WpO1mI1xHb1RWvR7XxnVZdZ2DK4t5cbhseRr5BRrhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaKesQsa; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaKesQsa"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3230972a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788865219; x=1789470019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MIH5m8h4rgx1wf2ZdrB4T0rpezySvGnbGk7lhC4ZfU=;
        b=XaKesQsayHa33cKi/oxjUxR1e7fx9zCCzLvtX4oKd1R+tq4A5G1D27r34HcDaUQJtg
         iYmfJroc0p6vmNl0LnuSfE7x2OyeUJ6GfmvHihAechfBWtRDlJoMb9RmzINHnZqzImU+
         KqrJuGrL2EDf0XF1kOLTCzCCuPsPicOe1+HEjDB16iXWnAjw52AkTFskGo55Fgv8Uhi5
         qKTPDjjHkn+4/tQI/HwNkHDvc8o3XoXs+i7AmAu4+f0GjwaUCvLffUvZg3F6Fzx+52f6
         g3bRXv4vTziTlQW70VkU+gzg2U/sZKK9MAI5K7j7evQqCMxDti8o9vlIuaKH1qs12W/x
         kL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865219; x=1789470019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MIH5m8h4rgx1wf2ZdrB4T0rpezySvGnbGk7lhC4ZfU=;
        b=YZeZxJs3V/EPEYG2miUhn4WWpum37XeDY+jWtnsTp456CJDlhxgg89q4F4fSj7CGW8
         JcwJ+t4xB8JYVtJ/KFwYhids3H1MdXY7RkOTyWh7eXofVzk8wESRsbuB6NRh238xLqPg
         xMEnvjAQmqb2Tal0S9g2o1Y5Iv6DxOqecQq+AZ1MLzu72jc2fcoJOSy5U+Zq0hEUi6Wv
         NHWcSdtvrXQuzWzp1sAx1f6o2eoVWzHIE11XSlxX/2hiu6ivV8as5KT6qkN6afRxggKO
         Jk250YDPzC7oUTGr/s9ugbBApRgFveUYyFVLREposLh9/MFHyEvmYN4HxTjmuMNPSXXu
         JzHA==
X-Forwarded-Encrypted: i=1; AKwUvBwdt0V8AigenkuQ7KeVC9S3Oe9EfTxHG2WEoEg99vzcXLqdur9hdiAWetwdULL0QSJrxA8hU4px5FLkjis=@vger.kernel.org
X-Gm-Message-State: AFuF++kNxQMUEqu35T5vPA7iRGXhMKzjodEksr02JcO85yWMN3T431LS
	EJ0OxKvxiwz7P6kU/lL2CIbCl1ziqxY354LrGdiusLKR7mB+/oSwXEM=
X-Gm-Gg: AYBFou05fJZGg/GeTpO/Ry/QMBPhWNcgSu5pI4jfLmjO19XcXIaO2VRPRS+7zYvL8PD
	/zo/0hoy9wP8gAJd1d1ECvCWNOa05vXWLuXNdocFXKa51MSCpUlHSi3krd3nWhUknFcsuLSAOjP
	Kc5yXUQalr3xMIic4j2WMuhCG3cbr1xE5rrdXZMskl4WIa7mmVhafiHHqcswrVGKT6xmCEX9YGC
	Kam77FhhFKqsY/YVKvijftZ/CNkrMW68ZsjiykdANfsdSH8lKHLdMLN3TA3MsLVxW1BanE0IoZz
	U8bPSa+ZZb5y/aD0S5KUtOfm3Da9QPdAE6amUwyZzxyEdPEQNh6qnLnVBpIDeMZ+ji7wbJUsxyL
	ueEFG+DSz2JbeFsD8UELKK4EkxTBl+hgkyufIHZOydYuavyb49uQ4gKkG0kyDGTvWI932x90x7k
	ltsYrZgrw83OmeOtKr2Df+XAK5oYSzR+J3+fThrzi4R16y1IZvmqjRUV/hXdnB5cl03YPihghMB
	qhnwGC+Uu0F5K9Q
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr43960484a91.2.1788865218856;
        Tue, 08 Sep 2026 04:00:18 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:f6ea:9d29:b387:9ed5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm32429842a91.13.2026.09.08.04.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:00:17 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux@armlinux.org.uk,
	daniel@makrotopia.org,
	o.rempel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/3] net: phy: dp83td510: handle the active-high LED polarity mode
Date: Tue,  8 Sep 2026 19:59:58 +0900
Message-ID: <20260908105959.70453-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908105959.70453-1-donggeunyoo.kernel@gmail.com>
References: <20260908105959.70453-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dp83td510_led_polarity_set() only recognizes PHY_LED_ACTIVE_LOW, so
PHY_LED_ACTIVE_HIGH falls through to the default case and returns -EINVAL.
of_phy_led() propagates the error, of_phy_leds() drops the LEDs registered
so far and passes it on, and phy_probe() returns it. A device tree marking
a DP83TD510 LED as 'active-high', which leds/common.yaml allows and
ethernet-phy.yaml references for led@N nodes, thus leaves the mdio device
unbound, so phy_attach_direct() falls back to the genphy driver, which
cannot drive this 10BASE-T1L single-mode PHY, so the interface has no
usable link.

The callback initializes polarity to DP83TD510E_LED_POLARITY(index), which
is the active-high setting, so the request is already satisfied and only
the case label is missing.

Cc: stable@vger.kernel.org
Fixes: 5b281fe7e396 ("net: phy: dp83td510: introduce LED framework support")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 drivers/net/phy/dp83td510.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/dp83td510.c b/drivers/net/phy/dp83td510.c
index d75dae6071ad..9e9a41bf6457 100644
--- a/drivers/net/phy/dp83td510.c
+++ b/drivers/net/phy/dp83td510.c
@@ -439,6 +439,9 @@ static int dp83td510_led_polarity_set(struct phy_device *phydev, int index,
 		case PHY_LED_ACTIVE_LOW:
 			polarity = 0;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			polarity = DP83TD510E_LED_POLARITY(index);
+			break;
 		default:
 			return -EINVAL;
 		}
-- 
2.53.0

