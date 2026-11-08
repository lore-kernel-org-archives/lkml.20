Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122378;
	b=Las0HoJfB1HPw3MdwPMio2mGOGrsJvn+X4RxVppidasC5wHWmFw7W0/7epHNKPz4gTki
	 yBiLmvwKpBDcJR7Jp2rR1BjMahmI8tKOONafKoDx0Nxx/4Eq1BAutyrt63RpglOvA7Ybx
	 7ARZeOdtybWk8p187JVmkF9ebBWad+pgbAY5XW8e5KD31qPrBrRmwGxe2A3MSyfLW/m+a
	 phyn9et+whU6YSe/X0VxCygosrbguuABpYPhtvyD2QRfGsU1d2z33CEh5Oy1nSTa63jEn
	 ZvHwMvcc8u9KY06WE2cN6InwMGehl9/f07eOiUOsJoPwlj2tJDC1oXLVRwmyxf3eC4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
	b=ln8J46Pe0pQHX4AdN9nBTmRz6XnSAXt4LoH8k2lDhLJ46sCaizrsaY8PZcPWjV7Ta4tv
	 7/bYlC0IlzYxr9dKrU6OiY1mLuRFzuDMmAx2UPmUCT3a/3haZFmSe2qw3LXQFfYU7aZii
	 +XjQcrNi+fPEAb0jL+qKmLpUiA2fDPOntg0GUbNL7qj02arLtfy/aky+9et7Tk3ixBt68
	 EqZkuFss0BFmyQpcUaOCQAOcwKD0ljVb9FCzir/b3Q5z8Pvi5hRqdoAZWJ/jRt8E1KkXQ
	 ihbuQBZTfxO/lrf168k5rDrWiYcluF8gvAS68lOcowvAwIMwbBjDQFA45UytzaHsfDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIunIJod;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7B606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E7B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIunIJod
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so271441c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122377; x=1794727177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
        b=WIunIJod53GohmJ24fGH0/xZydu9uCPXQeoc8r1VuQH1mOV1UGotZ5VWeNnYmDhnJo
         jdQ+PG1eGcO2Pkj1SigV/6eBWO7t9gIoJa3SnrmH9pz+WaiVVHC+h2I13vk5ICg9LAUw
         OljboNDwihSZSBy/oP9pWQc2F8CxwXwMQWRoIapJchtnSX4CCWE6L61WNu7WF6WmyWvl
         9v51/lkZRCIE1JNZpehSXtTbLaW8l8qwWgIQveFXGwCyfTTmj8g7+A6Sokzv+t9Mcn5U
         HOM8cjEPVccx2HX1NLpUrs4EYzTJZmzim7g8hq3GRzo5Euf1fl47rL7MM4WFrCpUVtZs
         0qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122377; x=1794727177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
        b=OmM4mw5sVSWqKkYVo9V99Uorsup5xKdxe4RRn98HD0oI7qiFJDU2Irpu9hK03Bvbo0
         sMfnxlSPYJLftCmpMuJeMuxHEKchlv8c3jzlzXTQcU+nK7y9HE7uXKZKIUaa5vfB7j+P
         M6Gh5GvHC+c7BnKx1v/JQPpfjB/blXGYvON7Ou6JzP+2WgZ4jbMrW2SICC0Gr33avlHE
         pviW82nyXHM/YpMpUptzdA73Mt26w9LODVyMKywNXaLGYns6CD0pWPZIEiRdWV5rEmdM
         vFL5FL/yo4uBSKilPTzMHn0VLPgfjJSA4qZgbnK/LPXz+UkXr/rwTkJxuyqMS3uW6AQZ
         N1Pw==
X-Forwarded-Encrypted: i=1; AL+hErGWFtBqtPPsbURQ5ICLk5eCCAXBdYs17DTzwEXNfk0V33CpL4Su6/Y/LHILvEwuZe60ccloEin1cU//frk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JAHttUF2rk1Lb+1GVnl+wZWkO0+Xpw9PfZUNaykcJk/Nqpfr1
	vLw+DWRBiKw0Rdz7X1KufuvseYIDOOgWPE9FjMFnuh39C/LHheb8h0ob
X-Gm-Gg: AYBFou0qCCv/ji0hah7DpDWiZB80n4tqltanSkfUfJ5yaZ7EO1DSrrwf9hjA6KbPl+c
	xJQzOFzPHcVkeKssXH59yWGYbd1AsMeC+iE0qihtQayQK5yA+iNU0QQg2IiSGc08w/aUth8aV4o
	S2WgHF8yjqKMXAVo59TE/O6xPUJ0y54YCj9ik6NOF/73XFJdeixfYGxuvUaEBtRGxBggtpHQW4n
	dc9rJu55g8eI/1qPQw3ek5GB8iCAUYxA4/oHu7FZYjuhZA8tBZCzDjzU+H/IQ8F9UNKd6iuv9Bi
	YObRs3a6EW8l/9RopuLwbaT7XysDw8JCp9hfLp1hbjb6ONGFltRLgtcfPKccMUakFZXVgTRicqA
	+UltMj2e1GCfnoccW31lQc1yfmNptXeQQUQ+dr/uM6M6CQqsc5B4q1JkiZSp/8/vNg7oYtcamuT
	kxT5OYXdAIY9L5d03DutnFNk1kzus74MJAzCht1WksPQJ+75unGxbZXltesOMW3UeI9leansI3z
	yq0ehgTSOVDPUJgzOY48ExRlepDJj1zQ34Kneon+lhAAc4Ifbl9eGbz++ZG+mq34nvLcnwH91Rf
	VMovXCKZCSciwT080cVpP3Ydb8UfOsK49bCFgVpL+VmNWA==
X-Received: by 2002:a05:7022:3b87:b0:165:aced:1fde with SMTP id a92af1059eb24-1b39fdad047mr1551818c88.0.1794122376963;
        Sat, 07 Nov 2026 23:19:36 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:36 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 1/4] wifi: mt7601u: fix out-of-bounds access in rate index
Date: Sun,  8 Nov 2026 12:47:43 +0530
Message-ID: <20261108071820.35303-2-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
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

The rate->idx value can occasionally exceed the supported band's
bitrates array length, leading to a memory out-of-bounds access.
Add a bounds check to safely fall back to CCK rates if the index
is invalid.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/mac.c | 32 +++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.c b/drivers/net/wireless/mediatek/mt7601u/mac.c
index ca9cf628eb10d..bf485dabca745 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.c
@@ -118,19 +118,27 @@ u16 mt76_mac_tx_rate_val(struct mt7601u_dev *dev,
 		if (rate->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
 			bw = 1;
 	} else {
-		const struct ieee80211_rate *r;
-		int band = dev->chandef.chan->band;
-		u16 val;
-
-		r = &dev->hw->wiphy->bands[band]->bitrates[rate->idx];
-		if (rate->flags & IEEE80211_TX_RC_USE_SHORT_PREAMBLE)
-			val = r->hw_value_short;
-		else
-			val = r->hw_value;
 
-		phy = val >> 8;
-		rate_idx = val & 0xff;
-		bw = 0;
+		int band = dev->chandef.chan->band;
+		struct ieee80211_supported_band *sband =
+			dev->hw->wiphy->bands[band];
+
+		if (rate->idx < 0 || rate->idx >= sband->n_bitrates) {
+			phy = MT_PHY_TYPE_CCK;
+			rate_idx = 0;
+		} else {
+			const struct ieee80211_rate *r =
+				&sband->bitrates[rate->idx];
+			u16 val;
+
+			if (rate->flags & IEEE80211_TX_RC_USE_SHORT_PREAMBLE)
+				val = r->hw_value_short;
+			else
+				val = r->hw_value;
+
+			phy = val >> 8;
+			rate_idx = val & 0xff;
+		}
 	}
 
 	rateval = FIELD_PREP(MT_RXWI_RATE_MCS, rate_idx);
-- 
2.56.0

