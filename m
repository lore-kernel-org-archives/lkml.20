Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81363D9672
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077293; cv=none; b=mAbK6EMfQdrUEYn+zhcaf7UXUbaSEXwBSGI3kgF5CgPSY6Y1mi9g05Y40CPO2IOTCsbtzhOu2WBU+L7LqqhrcCpURimPxTLnePIUhuzKjhiwWlF1yyoG4qRSGAb8mYDxE1VkS1dTBFLcW5pUM5VZbNBvU2jaP+xrz1sSH1bB+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077293; c=relaxed/simple;
	bh=9Ehzebo+wU9MfyAVuGh2eu09vGLDnCZgCBDV/eCMhZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=roakBJBQnDWP+LhjVCtfgsRPnh/sxl1eaIo02yrPXvvAqf7oQGe4DX08rp8YIXuqxJGSFmylaVZuC++3TTD6mHFHHAZsdBJeE7osVrgRAwemjNU0fNsPe1jLWG+3rcvkySiAFwy1Mu4NTTYmaZpry3yzncqzkADkGX0oRNkrFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meUNA53S; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meUNA53S"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0bso1983266d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077290; x=1789682090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=;
        b=meUNA53S4Kdi99b6oZUOG6kveWmMny7s2rENFFpiRKvky2ZTyUAaYMK8SP44yvzlH0
         cw22jsfD1mE5lGD5V2YM03O+NbmB9pKFzcnVMmPEiHqv9UAW1fsIQN7Aozfvnh127JrW
         Y466S0loIEr1fYCXyzhmQi1AXU+BT5Ft3dY2xDPy4S0PCIDfeHReY/KPF4YDiVIgNlWZ
         4HI01I1FzdXb+HiEqCMUzacrAx4Kb4rqiIVDOJUQ/dNzN3AuyQELG803YR8GaAl/+1Ht
         22wUIQbrhO5zrm0fp0SO9FIrisBlL/4LmamLh9g5KETOKZ1g4cjYcqw1YcffbWQXpT65
         0RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077290; x=1789682090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=;
        b=SmrkKMbl5+HVlt/MZIMs3sFT/xJaeXoD8eFIkNuM7SgWcs5gc98u+jTqRqTSKOMCk7
         Y+F2E5QX+J8pOeuYfymwrnkdjSotiF1IEKlLEUW/xlAV7xt7K6z+SctU+yrDi/N29IHH
         TngUnin3YgfzlEdn9MlQEdG9Wq05Iu0KeExUB3BYS3oeu+g6FFyw7JvNG37uuiV6tuZm
         5aEIt3iqSxmdHJ63LkTEa5FQ85si8+A2+YdtKqJ2OqjTOAsda24ZlERUhuVSOpakZU0Y
         4LYpBobMZaW95A7tY1i8ZGXZk0E+Rs/2K4g758zMphf0geygNfXPEgbYXFnG9gkGtyto
         GFoA==
X-Forwarded-Encrypted: i=1; AKwUvByIX6VW7G2lGe9PbWPQaT6pEFde8mM+J5jD0MmFFfxVm9ehNB4MwcofJR4Vfb1TyRrp4w/FnPDaUcfymOI=@vger.kernel.org
X-Gm-Message-State: AFuF++k6iiyuhI+WsASLnRR5BFgmyi4FPSQ51cCGcwFxv83d+UFylsES
	J0hWVEYApW6qLKg2/ErsVtTZt6T66xt7ucDS8Kv13f6Wig60RTQ5kz4=
X-Gm-Gg: AYBFou19ykJRbBZbDRIPbA9/l6awVDTbrt+nLXA+Ouw8KxnaCkH7TOxHTcit4GYHfLw
	P4PnJ2IeuXhwpx5nw2Z9YeXDpIoKV9mzGPAaNCjF4592AsY4qjeNS1QMfIvmHBdxFL/4mxiqPZp
	GU4eTiFTie1AApzq8dxQd0FuGcobDFx1zjGRtzf18bhEuU+jh/0m9f2VhL0XXRqLr4CSI+Gq7DZ
	iyRLzPCyVI1gY0dCcGlaGxY/z+k4ipoGA8gWJl6A3VtHB1LBSrF/Fn6OUVN05KriYQts3S8yp9u
	kNFmu2c5y4z+pSs8lPd3U2SrFva7kA+pxjTs0YEmIAAPXDYR8wHl5zQEBXjYvE+0gukajfoGBBQ
	4atGDuQz5yRKq0XzhCWUd8FM0OmencPOAcZUuz+OaIrOZKhAbowcm/WgMJjVPdePv9bp06W7AFf
	t/F4UWE2S14njEWUM55jf1hlWgSCGJGGuRXDzBItLyEyqKcbQpEeKmSI6z7UYaMgppaRRpAKc3Z
	4gymfC6XAvqLDdmK+TkQL+t3yxuy3GLK2c3HJX2v7goE6uX1PbIHcHkQVtVkOkyA7z0CvaLCD28
	vrvJqqOpehOSpOA6VnCjT2es4590
X-Received: by 2002:a05:6214:3d9b:b0:90e:93b2:3205 with SMTP id 6a1803df08f44-912120d689emr17573146d6.22.1789077290445;
        Thu, 10 Sep 2026 14:54:50 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f496598sm5826736d6.35.2026.09.10.14.54.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 14:54:49 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] wifi: mt76: mt7615: restore DBDC state after ext PHY failure
Date: Thu, 10 Sep 2026 17:54:41 -0400
Message-ID: <20260910215441.76683-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt7615_register_ext_phy() limits the primary PHY to DBDC capabilities
before allocating and registering the secondary PHY. If allocation,
EEPROM override, or PHY registration fails, it returns without restoring
the primary PHY capabilities. The EEPROM override failure also leaks the
newly allocated ieee80211_hw.

Route all failures through common labels that free the secondary hardware
when it was allocated and restore the primary PHY capabilities.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 0f2173f093b3 ("mt76: mt7615: add support for registering a second wiphy via debugfs")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c    | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 42e11ba1206ee..02e51b2d42ed8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -542,8 +542,10 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	mt7615_cap_dbdc_enable(dev);
 	mphy = mt76_alloc_phy(&dev->mt76, sizeof(*phy), &mt7615_ops, MT_BAND1);
-	if (!mphy)
-		return -ENOMEM;
+	if (!mphy) {
+		ret = -ENOMEM;
+		goto error;
+	}
 
 	phy = mphy->priv;
 	phy->dev = dev;
@@ -573,7 +575,7 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	ret = mt76_eeprom_override(mphy);
 	if (ret)
-		return ret;
+		goto error_free_hw;
 
 	/* second phy can only handle 5 GHz */
 	mphy->cap.has_5ghz = true;
@@ -591,7 +593,14 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	ret = mt76_register_phy(mphy, true, mt76_rates,
 				ARRAY_SIZE(mt76_rates));
 	if (ret)
-		ieee80211_free_hw(mphy->hw);
+		goto error_free_hw;
+
+	return 0;
+
+error_free_hw:
+	ieee80211_free_hw(mphy->hw);
+error:
+	mt7615_cap_dbdc_disable(dev);
 
 	return ret;
 }
-- 
2.47.1
