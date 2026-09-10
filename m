Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181B397E64
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028248; cv=none; b=TmEPb3ONx3JIPAJlAHlI+BxRX5ha5caGdFG9x0Isg6B46dBZPtdPe677CeKS7e59N3nycuNtOxcIDnkh5qCvNJADptKP5p0HuhQQ50b8MkXCIKAQ3978hExse6wwfx6GE9+GK4ZXjOoivE8yKQWPd1lj9V+UJuJGitVfYnADnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028248; c=relaxed/simple;
	bh=A9QmHRxhcnlFEMXPsheklMbj5r20vpaPgP2nE5PMD2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/S5HA5UrXuV3585vA3n8ggwJEDTATdpakgV6PlsTGhPDJjyI/B5Jxr8TtAD6HwwoS6VauiXVAHAmAPe0m2IX7gacchct1J+RaSBq4iQok9GXTC4EP1c1oYcJirqZOT9/AfULTWR663Vc2XEW08GJkzMzlIiExEHnrdHrKPfmkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX2vNhOI; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX2vNhOI"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5301db51586so21880991cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789028244; x=1789633044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8w29+FNmbA7LWNO6WgdUJylIFrA2rKKIMGzm7xHnRZg=;
        b=mX2vNhOIAOwa76+OqBd9FCSTAiBmq06wRjyx55dI4Y2rEtiIx2hooyuQwbkadi41YR
         k5ldR5XWyOYsh3JrVS329wcN1sD7qzQgh14grLWkPU0LzBtoWDr7tYR7FycOjA9rjxmM
         XU1Nr3H6p6bpaIlNNiKhGjtnJlqGTe2Qr0T1YurtF/UVD9+v1N1im/ypTrnFbrlovsJY
         Q7XepRHTsKv2KeBlWJX2P0WgBPY4N5zovxd7JQwkBds6nF0pfeSDeuEzUa9Z9QZud6UQ
         Ho2b6CS56m29id4lKVlHEfphl4HOOYrkD/EQPEFvIu4IbHmCo/qnpiKjYu5XRsAkZ7Hc
         7PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028244; x=1789633044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8w29+FNmbA7LWNO6WgdUJylIFrA2rKKIMGzm7xHnRZg=;
        b=Fj1C1hMPTF5AYB/2DVQS16+ZtAXAUOPFkXIV3paIOaiqT+VjXrg6WYZhVERvZznHDI
         Yt7b88UwvBpWhKirbpo2miEOuflLWZm1pJGwxZOLuUgU5ivuYop3vq+f13x1GfoRHinC
         UUHFuJL5/QfWDDREml00FyD44lV/LoTjUHX7hxYOGn9SpQKjvl4JAbmz8nQJq7Vnj1Qm
         ThMWJX342/jX/V9RiinrtYexfIKPSFjnLy98kdnihnWsN5fhw/w1Ip5zs8T7ojHJLqin
         pdoEQwTPo/0dR0fi4Lhsca64sF9rKn+gzwxO04xYBzqAkpxBNknjmRfCOcUzTuZzI8kO
         1+FA==
X-Forwarded-Encrypted: i=1; AKwUvBwv4m/MWQkmiRpVd+vebZyEAah8Th4pGoh3tDHsw9Y3MaJDaixbmU+a920jilr3aFN7BkBwW2Dmnt9Pmp0=@vger.kernel.org
X-Gm-Message-State: AFuF++mvpuuapNtXaOds15eR5yZxSZbeZzz7+JWhwNbYjKTC9rTyHOje
	dMjgDQ3F84rTjKJ8mfYddb8gudaXzVbE1uyFuBkKTPFObSO2PfL0bCdpA8cl8/b5
X-Gm-Gg: AYBFou1nchTQZCg97duyl1s9FlfHA0+5US0QrzBPIFJCiZs04jsxjR76Tz4o1n+fgqo
	uS9D5DgsZUdBiNlw2zVRmNB2qmmqXDV3iKdh77UliEllU321bIIeEvAYMc5zpLjUtsCt0DDa8fL
	dcStMaVsJ6JE7BjrUOspBE3E6sn9mXozhELb6Of1vFA6jejY0jvNZg45wTneMspN8PmRj+5Ma4g
	9h0Iwf9IVejysOMRixvSZgElKBsUdfX1Epz2WW6q4iGJKSBswQsclhdhKMD38vFOw7wH7ZpNblu
	lHSQo/u1HJy87oMARcDUvPBPxb+CcGK8bpaAuhpQyA3RlGiLQmy0oPSq0v8qJ5uaKOL3s3DGjrb
	ERyK6gtxdAczWJ9ww4Fukkqy/2sLgMgg44I3EExzyH8VmTCh7XeKNW3VA5LmZ6fRTnuX/mH8FcJ
	N7em6K6/AsvT88vINGQV9+q65VbsM1skT4AXviOkQvddPdQEHkRdGR0fcHLVhkSFUVqfszCX8VW
	h1R
X-Received: by 2002:a05:620a:8388:b0:939:9c21:8ece with SMTP id af79cd13be357-9399c21b43fmr3256938285a.42.1789028243645;
        Thu, 10 Sep 2026 01:17:23 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939a57535a1sm1087723885a.0.2026.09.10.01.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:17:23 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 3/3] wifi: rtw88: widen the ATIM window while an AP interface is up
Date: Thu, 10 Sep 2026 10:17:16 +0200
Message-ID: <20260910081716.769081-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910081716.769081-1-mehmet.fide@gmail.com>
References: <20260910081716.769081-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The frames held for dozing stations go out right after the DTIM beacon
and only for the duration of the ATIM window. The chips come up with a
2 TU window (the two that program it set 0x2 at init), which drains
about three frames per DTIM; the vendor driver sets 0xa or 0xc in AP
mode instead. With the 2 TU window the measured page pool exhaustion
takes ~100 s of ordinary multicast chatter; at 0x4 the same storm
already drains, so 0xa leaves comfortable headroom.

Program 0xa when an AP interface starts and put the default back when
it stops, since most chips never initialize the register themselves.
The bound and the filter of the previous patches still apply: the
window adds drain capacity, the budget protects the pool when that is
not enough, the filter keeps chatter off the beacon-paced path.

Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 2 ++
 drivers/net/wireless/realtek/rtw88/reg.h      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 0b622d7663b6..2a9b09fa76e7 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -474,6 +474,7 @@ static int rtw_ops_start_ap(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 	rtw_write32_set(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
+	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_AP);
 	rtwdev->ap_active = true;
 	rtw_store_op_chan(rtwdev, true);
 	chip->ops->phy_calibration(rtwdev);
@@ -490,6 +491,7 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
+	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
 	rtwdev->ap_active = false;
 	if (!rtw_core_check_sta_active(rtwdev))
 		rtw_clear_op_chan(rtwdev);
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index 08e9494977e0..0b9ba6f37680 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -483,6 +483,8 @@
 #define REG_DRVERLYINT		0x0558
 #define REG_BCNDMATIM		0x0559
 #define REG_ATIMWND		0x055A
+#define ATIMWND_DEFAULT		0x2
+#define ATIMWND_AP		0xa
 #define REG_USTIME_TSF		0x055C
 #define REG_BCN_MAX_ERR		0x055D
 #define REG_RXTSF_OFFSET_CCK	0x055E
-- 
2.55.0

