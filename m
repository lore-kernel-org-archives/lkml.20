Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744093;
	b=b8miePEoRnSzB5u9UXhqiFTyzBcHnKM7wx07kcg+Ljn7PcsgqofnyiDVICxJWu/ZTjPE
	 w8f24ckyDPAWdW7BiKlh9I5iUu9M4bHdpaMqEVWi1f1Zw6wAdpO6jDQRxn6xpllLKeeLe
	 /mUT+/foHcYL/wJVQH5yH3bF1gBNwFh6sCcjvqk00evClOquYZpVF6BZLAhrC58IO9TsB
	 2cZ+kil+sFVK/3cOGlQadcSGhR8g8JFOY2iUjqWziGl1kMME4xLB8pUE7s5ZRuq1kPQFT
	 NJXfg4C1OjXkyAYocGc+HuTNb59jhP5rvBtgLEC0pso8gefNJeHA6a3YtNGv0ZomgAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
	b=Hj/NErpt3SdoN84o4sGYCG7FdVc1z+WxFPdPwEfTsbJOvMdB8YaY8YcfmXJwWL+FRrQM
	 mGer1hM3wOxmz4wB4b8PbZ38yC8h41m6AHAVMFe1KiQ38T0M/ubw1InbMTIFuJDmYFe9T
	 gHwP6PWO+gZAJHbPZjCQUzce7y7Cua12LNM8Z9BcSKbLqTvMhOiuNU2fZwoT8onnmikdn
	 4lYAaXxlI0CzNevjNW5lkqO6GRbx8lBiPYnq0Niq+dU+Qu+mVyouUY4PNYTusHPdER60w
	 b3uhzdXTGuZcrbm8l+ZideWU0OHkGn78rytkTwsaKNRnMrm+5/uXbaH8N0xwL6ivd3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nc3fbsAF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34623606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34623606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nc3fbsAF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso54736f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744091; x=1794348891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=Nc3fbsAFwQLcZ+tb7po6KLX6VdqQ+Q6fQLjoTUXMMwFjDeKa28sKPm6Ji9A/N+75Nl
         jgWylAHe57MoMhsCSYmX9/g9xE5ctQZtZqXTXVyEDthM0Xaw95kMgF0Rnr41U+4xToBu
         9oveUtKAeRyVgFmYvUFW84WYknTA1FCmEKlQDT1S2SnxbNSpbo0v3pOI6VAy0fuupiD0
         1HnldulSer/eS52AbkIYCrIcsGLnIyzhCRMnLoNX57PTOBl3/1NN6a/UWLo7+G0NKhKJ
         j6rSCfNt/qMScvorIMP6m9DAhhevIBh930aF02E2DtBSPFlZhPDcHZRjMIKP9dt0UAP/
         yD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744091; x=1794348891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=zjsye7eZyGlxjDoIdyrppf3eyFyGwA5MlSw5UwcpmCkEBpAeqvJbbOIqixK4G5tbgN
         hSF1/oqkwRrydQ/EKwmOXFCsISwdrB/eJnKIABHzZ76nuODEd78Gw3+YK/w9oRwMrEZb
         uVZFlRBh5xnLZ6IwKuJdLv5UVlHgfEZn13gJkX2fAiJ9dW+y98O5UrcE4UQXEXCgYt2j
         5al+tvPGM5A4orLg/G4A2kK2C+IHdIlixmalcUDPG7F2vRf3xe+h6IEYbNaLDd4qbmqA
         za0bMUmI5WDJPP0+dlNYhdkjGIq8RhAx1q9wwLuY2IXv/EoS64/0o1wGLbwUN8cRi0Ae
         y/gA==
X-Forwarded-Encrypted: i=1; AKwUvBwotL6Fm9bjHhrONUltvirzbS8QL+IZUlvIMa7CaEIkNcC7EZvVN5dQqsa0rcxnAa+2jsJ4J0fufqc01dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o/sS5xSHwE/9B2wrAi0D2N9X8N/bahwf1fSzVibhHdJCxxEMJ
	El6ecrKSODDeMRiTyN3ak07Yw6XTmpGGf6L2ADiI4Xs7/pZRBg2w+Rvs
X-Gm-Gg: AYBFou1/859/hQsW6yLQnJLCncGJYC3k4UskAcANuNQYYR5pjKsDgnOMRVYCut8DxmG
	aS03yTbUHn33gfYb6xTbve1FkYyFghqhhluvBi3RWJGPKY4kuxaw28Jw09C6xDWrVbWnuRwD0yh
	xF9Sb0stsZfe/uMcXnqsviadKCmoda9pHzvEcK09BAB8hHu3vR+th2kqpU+9wvciV5Jam2GdK7U
	+WU4FJcMvAIlPNgJ2WxL8VVA9G0vLhsDvob7537FqlLYQ00IgrsmTLe1JxvgmpMyfnmFKKHXFFC
	jWSCk9z+N9EV9zLpl0L3tp0rUxt8PUyekNvTZNjRleVRDRvUQ8Gg90YoG3d1Tcjw1T14CuSnJaZ
	zV56uHJKXdjVkcoNfx3Ud5gw++5KSCpedvTCsmZjVrptmKvj2qOoMQW92gtm3BzjBz+Qo5lJJ11
	bp9Wu98vasKnija6ly2kGrw5eeVyK4mgUphcZW3oKey/ZWek4tjDVjWC3oDkOlZnCKo5UoN3IC1
	SdytdXf+ZZxBtZogktBxmk7XH/iTnkOGQakSac1xOlvGor7k8A/mgLa10zTa5uhwKXkE3HbyS5R
	5Hb5kEg1fuzDMzWr92edkrbauzKHRQKkXyjwpyUEbYSGJSw9dxJJtSd38vJuWpvM9z4wMmnmpvf
	daTIRkMSNMPYvhIhfJM0TUiP/4Ls6AKo+2A==
X-Received: by 2002:a5d:5d06:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-48e6e303f29mr32359299f8f.17.1793744091527;
        Tue, 03 Nov 2026 14:14:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:50 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Tue,  3 Nov 2026 23:14:32 +0100
Message-ID: <20261103221439.30502-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
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

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 4c4eca870bde..3e4fb899a85b 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -36,8 +36,8 @@ static void __mtk_tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		*tr_high, *tr_low);
 }
 
-static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-			   u8 data_addr, u32 tr_data)
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data)
 {
 	__phy_write(phydev, 0x11, tr_data & 0xffff);
 	__phy_write(phydev, 0x12, tr_data >> 16);
@@ -45,6 +45,7 @@ static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		tr_data >> 16, tr_data & 0xffff);
 	__mtk_tr_access(phydev, false, ch_addr, node_addr, data_addr);
 }
+EXPORT_SYMBOL_GPL(__mtk_tr_write);
 
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 79e09727b81b..3565e39b96a8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data);
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-- 
2.55.0

