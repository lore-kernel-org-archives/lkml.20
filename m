Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041845;
	b=wBStkDLPJHbyMIJ4Rdn6DeJxaISPLhnh0WTBiCIx05KqMxxpQLin5O6rPbFdpKElNqCq
	 mRVgWiQX5Bw/Ye1+6+K5aG3c3pesFw2EUA7hCF8E6QNzchRms25UPo1R9zGZVc9rKBc4Y
	 U6UG53SEfVyG9DNVQ+9oAH2Ykl8Btbfr0c8lm4Ta9+V2Z+tzTWEzi+ZvX23vx6cPVhH7U
	 NZvnyHX/ykZyKi5swP/iekVtcK0Z+D6ICgi710b6nb5BjwrCyc9c/re0ZPEB+Q6RXFVhe
	 bIiWboquwGCtmo1/+k9EkRCI3WFg8ucoGJ1ILE4B02yBGs8SW94WsytFc74PggkKsdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=618ppnTTAMIe+DoCnrNMfZTILgIDF8MyT0GWuzKsSm0=;
	b=xXKEtBsitYN3Mw2Ae6BQe9MbZHGg4KAoufA0jy9Rwt9TgXwj+7BOVzqMqDEOSe4wDp1E
	 G3GQmUMxkye9Lja0gVTM8s07e1VUoadh2EfW0e0yVKZFLSPCTN5CGS5vjR9QX7G8q8Ea1
	 p+hxHpnA+31U/bkE/wwKxUYyJdE8MGWa7qG6jpsdnUW/ODocrjbMD9N3mBxlOsMZMyIu8
	 ZSlyKuve5Ge3rJO4iT9zKBdXFe0IGfpVYvfRB2pjQ/+10ivl2HzNJ02DgT+aTRzcsZ77G
	 xPYNgdWDgMq0J6f/Q3731oFRw1iEixHukV9QUazAc6acVVmoVFSjU4vvcLuT4jUGcJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GEf0g2kO;
	arc=none smtp.remote-ip=74.125.231.198
Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE5606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GEf0g2kO
Received: by mail-oi2-f6.google.com with SMTP id 5614622812f47-545a4fb8d5dso410129b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041844; x=1793646644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=618ppnTTAMIe+DoCnrNMfZTILgIDF8MyT0GWuzKsSm0=;
        b=GEf0g2kOp+3P7dWWSNiQJ7BcKpjD+/HmM2WdKR4ppwelkhCkkP2KI3jYvMw+iX4ALk
         z+PPgRd891GJqxS3DrxwdyWCud9lN8uth+9Af1u5ZK10decCdrxFOD1YTf0GVy8qRoNq
         p9i73cc60vLnqKlM1CECcdvHgGohQt4LNK0DQ/XTViWADdoD5sBokVHEUFE3zDqqILwa
         WSkZBa32qxhpZdQhDfIzEPw4A15GgnoR3oPSWmCYGQOc0O56x8/AxWFadZY5YTzJyOVq
         9kzRK8gHGUu5mKtwWqja+H5cex8OwGwdibBgJo0jhCuTcLhfCh8uZQlVQ9wjlp4L3LcO
         Pa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041844; x=1793646644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=618ppnTTAMIe+DoCnrNMfZTILgIDF8MyT0GWuzKsSm0=;
        b=0KGT6Z0Fm8F0uYKAP0bfTm2nmr3Leu7PRcJep2aTD2A0GHv36kXIjPZIbZBdzWIX9I
         7+uFydk9epypkx6Uw5bYrEJJasQxQY8ugQAW1xqkdqKebypi4V5Hu4Fjipf3A76P02fl
         moJtkihNOqSSJDbl+ZHtO6qN+0kesxROSKJ5CIPeYtcHx5W3u5OK5AfbT2vWjQon11dt
         UEjE08gMLZzykUy0mfVZvrVJ3Jj9adGDTgZ9D7lYfRLvI6MiHXfepEDJzo8bso6dsS3P
         CedT5J/ZGpQneafTh02vQbgVx059b8Sc9cqtQpZoIqMrwxUsd/j6B0NEK+dsLdddTbuv
         ru7w==
X-Forwarded-Encrypted: i=1; AKwUvBxMoMrEzaG9jHXZfbyP7YY8xcemS0tOafnQFjLlsnOhkmeuC7mknUug+6zEe8s9TfBXoorB76ayYOWWtIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPHpcey2Gt+uI/fCH395IPXMJchSZDImv/05za1iH7+jxwwxf9
	RbdQ/xNSM0xBgJVBcKhM6LIrLSjUUYmnWQGyeasTTLL5LxzRWK9Tam5x
X-Gm-Gg: AYBFou1IT7Pl9KSUD4b2Wf+21UIrLTLvisYTpDWdwqTpQsJFtTbAvqPdsbU98BtA5V5
	5uoslSGlnNNAcLulFfeUlNdnP0LBrI8R/MmovI1Wm7VMTLKchU97GVv59LAVFoaJR3f+FxG7ojy
	3vbPEaZalfxbmrTd4VYvFn6BtjKOdCzqfxL6cCUS6vd7YaMI2atiH7Zbn8CU028EKPHC0dIZy/A
	JHIYt4cFKSvaFb+u9wT8+/TwmXH9V7OPH+7J4WQmEOPKpo3+0oB0eSJhAQ6zPcDuTch5XaUf1wD
	IYMUMDP5i2x/QHThlVesnVGIj+2N8WQ920SP25jQXScgq4QabKy1pViLE73fjZjU0j7LDlPetN4
	PJ5JGP9DpePM1wyPl/f9rqG/vRtYCg78gvEh6Uj6RVNmfof0SJ0tjwSltzgGGZmRDYstUzYOMGP
	xAACxuxyonY93XFctKa61E+5s6Ol4DUfNWWFlKlJLPRuW/c5ES/Q24ekVv2nRcmip2pDs12LFi6
	FDR1QE9kmszDE/4+Fgt7xjyBrMTHZ8HaINGVRUELhgzDMis1LVhsdi+r8E5P7fSG/w4aSRX+22l
	cvay51IphevEJZzD4ZeRMFHc58v254fiwFBi79Sof8tM7FT4CjEHssOEicWEzGfvv88=
X-Received: by 2002:a05:6808:1209:b0:4d6:90f3:74a3 with SMTP id 5614622812f47-55c003118bemr5492504b6e.46.1793041843805;
        Mon, 26 Oct 2026 12:10:43 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:42 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:36 -0500
Subject: [PATCH 1/4] wifi: mt76: mt7663s: don't advertise random MAC
 address scans
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-1-944b1f7e63a8@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=1887;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ZxzBWCMIVzBy2zHcQbyAGCsHpmwqwCbczZ1Y+dIdAUw=;
 b=JQfaph5OJQ4fE5sflHyc3YV9ljMuTh+tTrOIW1IgQQ0aFKTtqLSEtsrcaemUK4HFew0sfFGir
 3w4+xgm3WyyBDexS52kgyrjuzRFqDFkswzrbmOnDeL9cZqTcguX/7yc
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

With the MT7663 offload firmware (N9 3.1.1, build 20200604161656) on
SDIO, a hw scan with NL80211_SCAN_FLAG_RANDOM_ADDR completes in about
50 ms with no results, while the same scan without the flag takes about
5 s and finds every BSS in range:

  iw dev wlan0 scan flush            -> 17-23 BSSes in 5 s
  iw dev wlan0 scan flush randomise  -> 0 BSSes in 0.05 s

NetworkManager randomizes the scan address by default, so on an
mt7663s it lists no networks, or only the few whose beacons happen to
arrive during a scan, and it can't find the network it is configured
for.

Stop advertising NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR on SDIO, so user
space falls back to the device address. Scheduled scans have their own
MT7663 request layout and are left alone. Only the SDIO variant was
tested; the PCIe and USB ones load the same firmware and may need the
same treatment.

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 665b0f1e939f..e6685c51fa6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -200,6 +200,12 @@ mt7615_check_offload_capability(struct mt7615_dev *dev)
 				   WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL |
 				   NL80211_FEATURE_P2P_GO_CTWIN |
 				   NL80211_FEATURE_P2P_GO_OPPPS;
+		/*
+		 * On SDIO the firmware ends a hw scan with a random source
+		 * address at once, with no results.
+		 */
+		if (mt76_is_sdio(&dev->mt76))
+			wiphy->features &= ~NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	} else {
 		dev->ops->hw_scan = NULL;
 		dev->ops->cancel_hw_scan = NULL;

-- 
2.55.0

