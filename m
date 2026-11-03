Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712934;
	b=O2ACkMT2YIIoU19miA6subk0SkfC7V1RUn+eWgnj98HN05olguWKqhcALuZs28/ySelv
	 NoUejdbESLgefxaxYDfZiy3Lg71Z7Jq5HzlmLKfxIs3/totbm63SvSYUrdyyvpkzuFf/p
	 59AC/2TxDZkEMq2zqkDVVUno6WcsCFAuJg0LhFxGGPFeQ+6FBWhoboyPq/8RLzcnyf4TU
	 LaDoxUZlEKRalsHMYrH2mI6rfDV/eS1EwVSCss24iVeLULAKpVZvEoNKUwgEbrF0yaf6t
	 SZuhzlgu6b8OxKct+0N2uPqKLCXs06zL8srnOnAQ19Ys5EZbOPv3ekOCt/gFEveM05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=;
	b=iMXcOy6IxFgYPh4rEdGwtBjzCmYVPr/qaddu9MB1RMpZBPkeZiKPyZZLGSyF73f7FW17
	 ePryn1ZBymmpYVQUTxZQN2iNTYTVFAKnB/COx7v/p3kq/DcCk0eiufkrFlYrJ4KIQCwgA
	 MC6w02MMP0X+BlKGYWVxJRpSgmKIKbEVpU+3xJLlBk1iHEoF1pZa+p/aWPpkPWajRudIy
	 BHLGPBaPGsHOTR5e6toVDsdbEVHukcRUvETP9cKe/ZLogm6pSqF2F5bdoTbq0eztaCkip
	 8Sw7hJI1WeLNxRqkFyPfVxOVu/yc5Orc7wSEYkO8ZEdZjkS+nbzrPnzQFbcJnJZNDwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mEj/3hLt";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153A606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6153A606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEj/3hLt
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so4374655f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712933; x=1794317733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=;
        b=mEj/3hLtb96VY2ULZNiLzvdDfRuQcCryEtrxZD+1CRDHfCb1rKUnjdMvrrDlw4RWMp
         QUoQvv2Gcpe/yZRzRZIMSdmG65eOP9H6ljFehJBKWeqT8SIx2LLVctzXZj5sB914WOZb
         7ZZrLU6/J2DYF+//X/b2AWjMB7mUSrTI4XXCLOd1x8WHzPf4Dgkr9AmVH1qNUrw2T8Jv
         KfGW1VLxgc4ydCq5XsQCwIwrSrGPFdlcHNNlrssSKmOrqgUo0A5HdnClxke+XnfseNMy
         g5sMy50wZoi68eMq0Bp8vTF0I+LSrMcumRcuSTVTSplUbkQ8mnoUuRTy8vAz7R2XL8Q6
         5riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712933; x=1794317733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=;
        b=S33NHoSVIsw/A/8pmibj/PnN2/KT5u8c52iGRcDIaP6nRrTuFgURomSoIKq8DmdaXu
         7RXbsOTCNQTsmx0vUGW1nBiHBorBxJKV6ik2rYnbEHAOOctME7qW4EAdnS8RzEMNXnf4
         ELwPctSUv9L4jRx9wE+/XwoEnYfDrbOJ+9UXBDy+jxFlwVGJOw9fgxtenR5S7S/y2zO3
         ycmJVobBBSvPdx+RORx4ieoQidY386xIQQbp6i77prMPEjCnDcGwQ99zyHCy1EK00Gnh
         1uM05eSqfZs6UXc/m9TVp9N2pHWugXLWiMHseYtzoe2aG/9Ua8ieB3tkOyevQy7wSlU+
         3Ebw==
X-Forwarded-Encrypted: i=1; AKwUvBy5AxETQIhJ+2dEw0FDxNeQSs34XXdKuPa5jCfYdBh+EYuBDTzpbRSb+Z3v3GhG1iejpCNIexPr+5vp5fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U5E21NEmUC3oy2cntn6k22W1y8oT7H/7woowjiqKiZIbBBSFz
	i1X63w9/3m7Oy1aL2dZRzjcmHEoYTCAgPBT0eLUgFUqhIzh94lv2M3wbpn3twFRZ
X-Gm-Gg: AYBFou1tAg8sSUPWlE8AGs62EXSt0kF4EL5e1qMcnO1BtOOjMAjNYDmayfqWMn5PPsS
	f0tEwD/gGp+VGX+SJ7p4QaHzSylQ9y5Vis7XSLML+s1RK1CD6yRQKWkMedh2voERgoKvK53Amqz
	DVsLjt6oU//LpISZiFP++Loqn6oEQYOPN7T4rQyYx2Zs5/09jwEN2ARHF3DgIQiOKUEgauRSrtO
	ePC8nrHxI64DVQxgua33M/hISKSXrIFTo4cZFM+E92iB+NJOb7rlDpyv9tg9ziF22vy5pajfc44
	FbEqP04u32C1THYtaBB9j6C5Gisv02k0P6WOb67QGIK37uqw9p3Maudwi2srEfzDapiPy4BJCzX
	doZ1FeAU6E2MW3JZdCY7U3g0hsKfDxYUw98Q6WUcx8b0NQupUYLlAMVRk7mzyr8w0cLBpt7NuIL
	bcmkilbT1kDxxkigJnO8y6r0gEOrDfe5YbJx+FP0eybcbpfJszY6rKa1ILrxp9fsFwMpnSv/Mv4
	JLlp5YHpXeFZDLXmtzABFVBZMqlIgr8xyhPkkNFtMYQmG3bqCVGzC/y9EEar34SQ+m1eTAA3zJk
	bg1T/WC0xkOQ0HFUtycwWP0MjtLrtLJd7MoHSElolBzIKLaZCOxiDc0udHy3IZQC/EbAkrVvKNf
	W4WKH7rdwvpkLg0ixQjLJ2xhfEantWBvGYwvo7TiQax1tcdOo7mm0N1E32T36Q3S2i7REedVutr
	xJ7xl4GFYAQ6YIMS0wV5y2/MxsthsSdRXHHqNGnFFUq0eMGbzqw1cNkFVwidiK09uV+Xv3Y91S9
	l0D
X-Received: by 2002:a05:6000:26c8:b0:48d:f014:63ee with SMTP id ffacd0b85a97d-48e6e3040a3mr28458056f8f.20.1793712932549;
        Tue, 03 Nov 2026 05:35:32 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:31 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/2] wifi: mt76: allow LEDs with only brightness_set_blocking
Date: Tue,  3 Nov 2026 14:35:27 +0100
Message-ID: <20261103133528.53197-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
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

mt76_led_init() and mt76_led_cleanup() skip the LED unless the driver
sets brightness_set or blink_set. A USB driver that switches its LED
through register writes has to sleep and can only provide
brightness_set_blocking. Accept that callback as well.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index c9762082f473..e3eea578a97c 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -193,13 +193,21 @@ static const struct cfg80211_sar_capa mt76_sar_capa = {
 	.freq_ranges = &mt76_sar_freq_ranges[0],
 };
 
+static bool mt76_led_has_ops(struct mt76_phy *phy)
+{
+	struct led_classdev *cdev = &phy->leds.cdev;
+
+	return cdev->brightness_set || cdev->brightness_set_blocking ||
+	       cdev->blink_set;
+}
+
 static int mt76_led_init(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
 	struct ieee80211_hw *hw = phy->hw;
 	struct device_node *np = dev->dev->of_node;
 
-	if (!phy->leds.cdev.brightness_set && !phy->leds.cdev.blink_set)
+	if (!mt76_led_has_ops(phy))
 		return 0;
 
 	np = of_get_child_by_name(np, "led");
@@ -242,7 +250,7 @@ static int mt76_led_init(struct mt76_phy *phy)
 
 static void mt76_led_cleanup(struct mt76_phy *phy)
 {
-	if (!phy->leds.cdev.brightness_set && !phy->leds.cdev.blink_set)
+	if (!mt76_led_has_ops(phy))
 		return;
 
 	led_classdev_unregister(&phy->leds.cdev);
-- 
2.54.0 (Apple Git-157)

