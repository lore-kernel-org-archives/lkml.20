Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704585;
	b=XbD83jKeNYM6UMIsDqPLdd9wbZWXtVJbbOGPKNx7QYRIWQzrmrtUqC1+spQMMWmlzBJx
	 Nh4AapE3VsJ06wdhhQe+osIhW/ISROTD/XCICuFpvbjxIUnpYgU08QGAPy+9PkbAENLuk
	 LYvuBuewcMx76JcTuROg7700bpF1pIoI0MCy7Hp8B2giuv87H08s7brD94ZhrCC++Rrx2
	 bw65Ktwip1sNal6/B1RVA0PyaCNQMgDPzTsSU1BDAUbUuLsn0E7tY7OG1v/pv4xRFvM76
	 JoLxocvVHuCCnGv5V0pe5zT0UuV+QvkkfaH6QzrHI/3OIxMegNiHL7sY77TtN2e9GTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7J25Ol6OoVWSYnoEuI8c8YQySc1v4KBrwsp24rZ47ZI=;
	b=YGkCSJLEefACi9+VpNFY3UdUk3VO8LyBrTaE0j6U4s/+MPpRogdmEpxQczoHMbV6P2Dg
	 hhP+h7f+xhhxNogTuHZmqasZsDCYQmz5+eF5bdEXK63iJ9/EYrZIjFciizgYZCDuCaLLn
	 N2lXKHcRkscDQnrOxbNY5/SlvqKYeBcQlVN4pOHMwfRSdEgkEqwq8juOERtrKRYqAQ+Hr
	 ms9Ezn0VeTV7z9Lpumi8xRdcte50wdXnRhRJlktKSgD6ShguuONOQZmgABu82vBRtiHQt
	 /OuZT4h/uErhhwMdtcj7WlDoRpMgC35ahtTXQL5EREF4lzJru9ZolVRlxU3MVs+f16g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeHky5D4;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303E606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E303E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeHky5D4
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e812e2b31bso1047215ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792704584; x=1793309384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7J25Ol6OoVWSYnoEuI8c8YQySc1v4KBrwsp24rZ47ZI=;
        b=KeHky5D4w1jTNabuJnhEKXIjEGl39SlghNWMWb0j6R5A8Qnk9REYC7g1bxUVpe7Qi4
         gecwTVCzi1vTPBYBYXT4mAJjBVb4o5kRVGOvqy/+C0g1tiKF57y9RC0gZp706CsTzwJx
         /ZaqEdGN3EprOAlATAR9c0XPIVuiCE4NPy+BJiQYphKIc0oYeh7GuJG2rXMSAP55ZYj3
         bo2ZF6kDYUtazOBZdUO9fPG+Xh7LdJ+4xafYiWF5OeO+eyLUcpX1zZuHDYlFjBDk6w+B
         MrEBwkF3Y028tBcnR+AIphPMRXQzQ0bEBWVd/MRE4+Flq+TfSwttnAO23JGBHiIodhtP
         Hefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792704584; x=1793309384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7J25Ol6OoVWSYnoEuI8c8YQySc1v4KBrwsp24rZ47ZI=;
        b=v0ykiAqnO+J+yK4EbNDO4pbCzoZfHBqNzG+TvgWYjV4Spfic1ffs1H4IoJgXe5i8nA
         HAIV8Y2vWiKGLUy/I3x6mLreQUhf+L2psS7Jv+6R+HUmTSYkwYJRzt7tXxAP3wk3iLnq
         FRhbXcb/F5dFbxzYyYKRTGsARevlBBDjekapdqBvxmBsqtc0e6NFf4QRRNgKl+TrrjcL
         ORfMF7PopBTUznfUIB0S19fV3dVoPjOV5eVu4Lo6evLe2wNW7Wn+lD+r5Yf1REvhoisJ
         Hzwyd3Wh2tZK1ijaMby2PSUuH530eCOrxXSdZcD9R2m2rCWp5A64vHQOKlEdCfZDMVSK
         0z8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLl4tJbwsTAl5uQt0sl0D06825Xo6Uo53w2PfJMrM85cpn4mR2TGxA5TI7WmyX0PKb9EJ9yPYsMJFDdMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk06iAyCesTtyg2ydGsnf7+QcT45c7n9nl2gsfDF/E6FktFGBI
	uFLVBkGViNzBaB4U5R7KdqJCkcFJjtxd2c+bPnyo6Kw+mKAAHPhXpogK
X-Gm-Gg: AYBFou1ZGfaWGxpc4WSnAJQmTqfs6UEoOILzNNqxchscGToa1SgzGfVIWjttMEOyQ8+
	lUNz7aT2pIK9D3yXUkSwc8swPG2/us6iU+t5GYwdILZ5MXKPbTj5ptfuiyfM3xayBTAnQbLy6IU
	SoR+10QwaaSn7sA+a4objYDNK7KXxiBEEIcVC6drDyH+mOvEER7LX6u0+sA1eeGCD/qYcB3TuQo
	zrJgEw1pplWwEBB29X6x3KUIzj9ygsiU11NtKuqhn9A7lRx5mE3AcKXhLmjuuA9N/zTM6bA0AzO
	WL3dmxFE2oBGyizEGtoruCDfUumwncfw6cOMcsJgrC6q4fYlNIJritTchVMxNVbVOktHqcRYDUj
	Boubs+brGsOOWyp6nvSC+r0QAA3jBZy+EHKiLYbUA8CqCbX1X+SILeeyRsIfJGSmv5i/j3Ajv7b
	YqZFGvhMRh3IzwYnDmiBdqeKWUB8uS4ccmnz3ClKPr2yYYBBVAoEMjiiR55lbwcWkhnfdJDvM49
	cnjuU6Qq83W5y05WJBHla50GcrcN+sstIjVxxIo2x+gFDW68ZHKPmZc9A86ucXOHXwI+gY6E6Px
	fx+w/2Chf/PDMPiHGFAT5XVJVjmyRvunor5X828qwR3oD9IUDjenp/L1Ad6yB0nwA8xjwxMhnie
	F4aWYGB7/+tBaFipvuWIYxts=
X-Received: by 2002:a17:90b:3806:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3adcdfdb688mr169990a91.15.1792704584283;
        Thu, 22 Oct 2026 14:29:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm606547a91.0.2026.10.22.14.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:29:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless] wifi: mt76: mt76x02: restart mac_work after a channel change
Date: Thu, 22 Oct 2026 14:29:41 -0700
Message-ID: <20261022212941.3666724-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Since the channel change code moved to the core, mt76_set_channel()
cancels phy->mac_work before calling the driver's set_channel op. The
mt7603, mt7615 and mt7915 set_channel ops queue mac_work again, but the
mt76x0 and mt76x2 ones do not, and they only queue it in their start
op. After the first channel change, which happens on every interface
up, association and scan, mt76x02_mac_work never runs again.

mt76x02_mac_work calls mt76_tx_status_check() to time out frames that
wait for a TX status report. Without it, frames whose report is lost
stay in the wcid pktid idr until another report happens to sweep them.
On an MT7612U station sending 25 Mbit/s of UDP, 48 such frames piled
up within seconds. They kept their AQL airtime and their socket memory,
and the sender blocked on a full socket send buffer for up to 30 s
until a connection monitor probe swept them. The work also collects the
survey, A-MPDU and EDCCA statistics and checks for MAC errors.

Queue mac_work again at the end of the set_channel ops.

Fixes: f4fdd7716290 ("wifi: mt76: partially move channel change code to core")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/main.c     | 2 ++
 drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
index a5c40d350612..a2763cf648b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
@@ -26,6 +26,8 @@ int mt76x0_set_channel(struct mt76_phy *mphy)
 		tasklet_enable(&dev->dfs_pd.dfs_tasklet);
 	}
 	mt76x02_pre_tbtt_enable(dev, true);
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
+				     MT_MAC_WORK_INTERVAL);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
index 550644676201..ab4d0e3f79bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
@@ -49,6 +49,8 @@ int mt76x2e_set_channel(struct mt76_phy *phy)
 
 	tasklet_enable(&dev->dfs_pd.dfs_tasklet);
 	tasklet_enable(&dev->mt76.pre_tbtt_tasklet);
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
+				     MT_MAC_WORK_INTERVAL);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c
index 66b06a493d95..57550ab3b7da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c
@@ -45,6 +45,8 @@ int mt76x2u_set_channel(struct mt76_phy *mphy)
 	mt76x2_mac_resume(dev);
 
 	mt76x02_pre_tbtt_enable(dev, true);
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
+				     MT_MAC_WORK_INTERVAL);
 
 	return err;
 }
-- 
2.56.0

