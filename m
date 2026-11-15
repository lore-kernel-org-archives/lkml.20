Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763674;
	b=5X7JibYGfsgd5fUC5c/A7QNOYGHGU3NvsY1WOcVJXJMMEOdaLM7+QngARo1bXIkt8FJC
	 5Tr8Rag+lFByrLJhKItald1L4aL7l0sSYkPEWeTwLYsP2MgdSeX7wsHQ9gNm0LVMrdGDa
	 ExxOlaF6PgkN0w+nHB1Ci2Bi8TBPZ9qQvFB+xAIwEhqSYn7iLDT6stzpotyrE7v8E3Y3x
	 6Q/hDGeXm2LTGXgQvjoS1vUshNWiMnc2QSoSF2cM0ZEatI2YmPLbxnVYLvhwTIm7R7dJx
	 hZztc2ognw9RlDCylkdnMV0w5Owvo3YRDSBfGRiOpInkOCZaVcemMFxdSowWM66VCTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
	b=YtsZwUqEaLzCnW3tzCRDKLt+ab7/O3C4Sl4h/WpnSEG2ssxq5FfC+RxDEZyHpCv4O5O+
	 KCJ4fEfVCqGT2ZCtiiXYU5g0wT/kQglODPlw5zSAY/1X0MXp4LBdTDk5YcaU9U26h2nrI
	 pvWi2CuXDRxQspublz+XG3t2rdVRlEe6HbHw8DCKLZwT8yOFnLZGjjSELc34q6b1jLeJc
	 GU6nKxe52whWNhOiOUIOE8gZHSkZhFosT0avNIlkdxLwK0X4IK85+6wLajO/bg7AlN6df
	 TA1YyFUITQ3x1eXK8vLtGL1Hv2KcVw65Pnt5gOBCmEfoAqRPy0FmCeFuH5XIcn8e6xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFz4PIQP;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF28606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF28606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFz4PIQP
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1301013a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794763674; x=1795368474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
        b=IFz4PIQPVo5w8z3QSe61pCiJxvlS0FftGpYWp5jtP/zao3q2FjH4H+5fGGqdjb5bgb
         rAsoUpBeJF/XxjkXS0MEtKRydCwfSxIWMwtqjjL+uYgiwz6vhXW7dvMBjVpp+BCx8euP
         7bIULw7tMqP+UJXmDf/AVJT4Z2cjByeOQuuefTvZroAlTYpO64DpwR89ASDchiSZFKkt
         xH6ghRvqQ6lVefNZSa1l+cZSLBF489bKgkU0v+h/66mGxJ5o3bFAy+n4YHZvbIgW2OO1
         p9sdXYN2U7Zm/r83Cpc5PfnjVn4y1enTFkWLusp5YU9pn3tjWBrRRKBO3KKmHKkkw/Hi
         4wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763674; x=1795368474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
        b=dW1Aj/5JKyjorgIW4hg4v+teTweDcJqjH4tI0I2eg8ZUDx6jOzN0w7bW+wI34mXV0p
         6h2O6CDQ49ORhiDTpWc4gwvZi8ktkG4imryaargC16BbbKGmt1htMg/JK1hnYuGje1pc
         bcMCfdSiZ7yptwJXG1V1JRdtGUMNNDFyIkpfGGmMKp8tQAf3/ldzffn1V1VOZmq2TWI1
         RWmasaVMucIhtiAxp06XtrthLEuXYEezV6cBeVffSvdKJ7dJfHeU146HHxn4O+A4XXnh
         HKD6fVy9S/R26grvMz8VZZCVuPzP40Mi5hojzXT1zQBKhU6gnC8iMAo1ps2jQRI/Wwl5
         ASnA==
X-Forwarded-Encrypted: i=1; AL+hErEXCKmDFbvh8qtCd9cOWd5JEZSDphkVi60cLeVkJxVMTamyt4J8ovOk+feekoP+wvw76wiJWBbxRZpqWfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+4DaTkdp+/WyraHi6/JSLG2HOvbx1SI2dKND4oJsdsUrUtpYq
	9cteCvespK89d+/WazTyrqaBo5mY2DkVTpX8KVCek+K+0ecn8GPuEVrf
X-Gm-Gg: AYBFou1B5ubRxIriM2oSxtqtr1CZKCne0g1uJY7DSouWW8eMnv9htL0WMp7opw5Np8l
	BRgdippIMpA91Vovdk5sFMhkSMGq/5W10VWcV4lplojIJ/vzLv5QTYx+tVJGpisEqdA6A7A8OLo
	HWgkHXd93kg+lRwd1UaJdISYYN+6bVsBAQb3ignpoJmjiN58n4cq3xujMShjEpxwvKhzL0HBXcC
	b/AFTJZew/g0gywAT2eIjXT9KByw/NxuZlINzFMg+KebBDkS/nI2ibnWGhlKaW7JzDA6hGKZ33x
	ctFRi2DfeRfFuZUNyA2HUxj5me8hWz7cZr/v3Q6iOn8jP+JLpDrGqZCb0wJ+BMRcgwao0o04Gf3
	lUBRad50+4yyKiuE9iVVruom7oaHiU6+HGAk/7nVWk4hNc8mZtDLTnICBCemZwVOtRm3SG0eWUF
	KbJtkr5Qt3SqhPGAYoyxmwIITZ61sY8WKytgrdrO/jCzgmThy/1fpXf/JWFrVPULEG/q5yxU3fn
	KVBj4SXocKoCjm5/BOH9eQauO1Snl1oP50C4KEFmMFmixD83jL9EEnx1lq/3FlopbhtiiGF2NCG
	d6z4Prft8owXo1A1+cIvkKpmSMWSX213P+2pMVM41tF13S1cFvQLaYc=
X-Received: by 2002:a17:90b:4c8b:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1b0d07d05mr5600119a91.35.1794763673371;
        Sun, 15 Nov 2026 09:27:53 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm19051936a91.12.2026.11.15.09.27.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:27:52 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chad Monroe <chad@monroe.io>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Dylan Eskew <dylan.eskew@candelatech.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: check the RX WCID before using its station link
Date: Mon, 16 Nov 2026 01:27:22 +0800
Message-ID: <20261115172723.34964-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

mt7996_rx_get_wcid() returns NULL when the reported WLAN index does not
map to a station entry on a valid band. Commit a3ea1c309bf3 ("wifi:
mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO") made
mt7996_reverse_frag0_hdr_trans() load msta_link->sta while declaring its
locals, ahead of the !msta check that used to reject a NULL WCID. A
header-translated first fragment without a station WCID now
dereferences a NULL pointer in the receive path.

Check the link before loading its station pointer.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: a3ea1c309bf3 ("wifi: mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index f36da545045b..186216f21d28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -191,12 +191,12 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct ethhdr *eth_hdr = (struct ethhdr *)(skb->data + hdr_gap);
 	struct mt7996_sta_link *msta_link = (void *)status->wcid;
-	struct mt7996_sta *msta = msta_link->sta;
 	struct ieee80211_bss_conf *link_conf;
 	__le32 *rxd = (__le32 *)skb->data;
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
 	struct ieee80211_hdr hdr;
+	struct mt7996_sta *msta;
 	u16 frame_control;
 
 	if (le32_get_bits(rxd[3], MT_RXD3_NORMAL_ADDR_TYPE) !=
@@ -206,6 +206,10 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	if (!(le32_to_cpu(rxd[1]) & MT_RXD1_NORMAL_GROUP_4))
 		return -EINVAL;
 
+	if (!msta_link)
+		return -EINVAL;
+
+	msta = msta_link->sta;
 	if (!msta || !msta->vif)
 		return -EINVAL;
 

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1

