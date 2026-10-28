Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158861;
	b=3YY9gy0aMdszrivUUDERBAaP820TRbgqbImVNpmEoazgXs/XFH7A6wFnGH60ISw2PVDj
	 0Zc3qGk5whVp8GlqXSHZkZ3qM7ZVgS3PYXtMGCX6Rs736160A1rNBGpGY6BYurU/CBK4o
	 2gbQc4i2HPJs8vpG+v3FXa0769RRIypqaZj4glTNn5IenSsjiTcg7LC94tnk9s8VB2FgJ
	 v1v8usnZ6feQW6U4NMVlQs1xEp9ZtPb3RK8iW1FUrz5jCwvBwULIzlC7gTUzocZtbCOL8
	 4e3Aw4Qgb892eCJitEKzVQs5jitsHvXcb5hdQZYUC7YZ+054nOLily+NDd4Ho57z+Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DFz26Eku7ZAlqmVMiKR0VvxuKqR6CneczdW4fGPibk8=;
	b=TGduFYe/ZETRus50FiN6Wb6ZEEU9/uovZBjgvL1YW65rnezvCcOqyN7pfReITKF5OskH
	 fq4jOFd9kvd0bS6yj9+NjPVjIp2pYKFAgg6DncRU88kkZBxGAQqlLGy+V487RZ1+oZtr0
	 2YTJGl8FK+cwNbcoUTQRqgeiXiw7ukqFGg975363IZcNgHlvSesEE2e7Keng30t9ZkzbN
	 Dequ3+AxerQkg8teSt4c6iJT4Rl37Nb8F/n94U41HAMk510WRVWN+XRFpm01bAU0T3Qul
	 tydehugBnnMyNYi++WHckCI4nYR03blnK0ar+GYvxpGIw4+4JhVO/mnB5Eq5EefaA0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fFyCr;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C1606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51C1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fFyCr
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070755c8cso293820b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158860; x=1793763660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFz26Eku7ZAlqmVMiKR0VvxuKqR6CneczdW4fGPibk8=;
        b=KI1fFyCrQ6/xarfMSgFToJby/ICKLKjhUdNrft0pkdzl/Fp/VCteRjr7fHn+bqLLPh
         kBFGBrlTdVT5K/lk9cGG9YnGbToV76MKL3wl85LvLnAair9FceeTHffe6gJR+3+pY2xt
         YaHZPVdlyrV0Zv3EPGNj88rHvBzGkt+lkzF39H0GQpl195JVPBLORJHhGlY/Z6PTrp6D
         XHwI5PXECBihqVS2w7To/hffRaMvR+GsiOsGvPldGwoxY+PGv5vrHzpJb3sicT4Zjdkh
         ro8Okf6LIzVAH8noerCpRrlJ3yPuwWUPi+uGzgF3J78EbALrCRmVGVYdDkv7MrpYSAyO
         c3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158860; x=1793763660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFz26Eku7ZAlqmVMiKR0VvxuKqR6CneczdW4fGPibk8=;
        b=ZkpJJwINgi95LUHnBk9wHuq+iklnfxCGx7KULHedHkbKDZnEBSfAZcW3up2eCU4BXS
         RDJOk74efJJvMMJnlWa75ewdJDn93tW7W1A9qdoy9La+7lxfFUUh+NF91lHEgzBBocHZ
         AgFIKiPDzMb1++DFKykmyotzwoaH5sVoA7wtJA+ZW7734fWvgJ19nFW/kNbhAHEGCyeI
         MbhNy3j0M0blTU8EgJAhTa6lHd1h/2coEwbh64lP5Oi56RPc3gPFHVRQ8UA8FwOLtZio
         8dC/YDi3N8xpp9nNxOpe2udOjeC7ZSwsyOsWsupcsorKjjOpTbiG4+ZtLyAGEUscTG1S
         xJMw==
X-Forwarded-Encrypted: i=1; AKwUvBykRLRE37XkZerGUh9QbDhRPG7A4GbLuVZs2/3kTsU7G7BJTDLuuPQCrpCMNvBGXjIupzr7aNoqX3E5J44=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRxcgdOVu1EJy5+HcR0w/d24KrjckW/qrtRP7RwDcuoG7fjxHS
	PuMb8jd1O9wSR8ATXxO5K1IiyiRBZY38YIaL9qJXK48TBnzUlhUQmrPO
X-Gm-Gg: AYBFou0mdJfaxsaNssiyCuFpSn5ajbV6r8PRVZpDTC4E0z9v9RP9XN5AO1dYzw7MAdP
	b1YlMS11QUlAc7xodqZPCDo1x9XpSuCvgR1PO4BAICASS9o3J/n0p9VnkQlyIkRnXbWqUfVWNuD
	jA3Fj/Ogg4t0Z/UHYJubFOfSylqH/rORwiOMTW5iMZiDyKNuyOE/uL0DQn9Z3yN8hYmwgWjgmfj
	Yl3ehuKLz7s/wOoLtmP7R/J1OWdMoSNMPNk1oBPRSsErroCPIWe/bwJWg6g0GADMTUKgbqD46l4
	+zXefGUJITvTmpIpE3IooOyTs/rgK4YSGR5J7KzSIAzpxBTvsEBqm7HowZaJHs4718QiSQDtps3
	7Arix3YK1Naerf7GZwSIyMdbomkbYoan0Z888ggPEzzmE5ryZVPb7/ygVDieuC7IVQwtUqaP6qQ
	o6uPfJiKCcWXuVgnxoZG0QJw/31+PuNJ5RZKcv5bnuAF0EQq/0epoUaxzQsOeJG7jtqNNW+DeXp
	oqeCjL/FkRqDe1Ol1ZZYufSq4dyum304AeLuGM4IlsTZIt3abbrpoSz35Wr5wLDmqb9uFfbkBK1
	+3D3D8q3DSAEfEZxkcoNkj+5gmuxuNmKxL59/pGivB7PC4EgffwbW6QvMjMIufPzw7dY+VP9gz1
	A3zjmvHVfuXoe2FSXwlmSeYjXgsuVai/7wOg6bYTciwEow0QNHsrEmjGGoqY/kLvZweie5Y1InA
	dPJQ==
X-Received: by 2002:a05:6a00:ab0d:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8a6e6b175a6mr1061341b3a.15.1793158860024;
        Tue, 27 Oct 2026 20:41:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a73bf7efsm596875b3a.52.2026.10.27.20.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:40:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set))
Subject: [PATCH ath-next v2] wifi: ath9k: don't re-request the LED GPIO in ath9k_stop()
Date: Tue, 27 Oct 2026 20:40:57 -0700
Message-ID: <20261028034057.114021-1-rosenp@gmail.com>
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

ath9k_deinit_device() frees the LED pin in ath_deinit_leds() before it
unregisters the hw. ath9k_stop() then switches the LED pin back to an
input with ath9k_hw_gpio_request_in(). For a SoC GPIO outside of the
WMAC, ath9k_hw_gpio_request() takes a new descriptor through
gpiod_get_index() at that point, and nothing releases it again. The
next probe fails with "request GPIO12 failed:-16" and every LED update
hits the WARN_ON() in ath9k_hw_set_gpio(). That request also runs
under sc->sc_pcu_lock, while gpiod_get_index() and
gpiod_set_consumer_name() may sleep.

The input direction was only added for symmetry with ath9k_start(); the
suspend/resume fix that brought it back only needed the output side.
On WMAC pins it also undoes the "LED off" level written just before it.
Drop it, so the pin simply stays an output driven to the off level.

ath9k_stop() still writes the LED pin, so free the pin after
ieee80211_unregister_hw() instead of in ath_deinit_leds(); otherwise
that write hits the WARN_ON() in ath9k_hw_set_gpio() on SoC GPIOs. This
also frees the pin when the LED class device could not be registered,
which leaked it before.

Seen on a TP-Link Archer C7 v2 (QCA9558, LED on SoC GPIO 12) when
reloading ath9k.

Fixes: e34f2ff40e03 ("ath9k: bring back direction setting in ath9k_{start_stop}")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove ath9k_hw_gpio_free in ath_deinit_leds
 drivers/net/wireless/ath/ath9k/gpio.c | 2 --
 drivers/net/wireless/ath/ath9k/init.c | 5 +++++
 drivers/net/wireless/ath/ath9k/main.c | 4 +---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/gpio.c b/drivers/net/wireless/ath/ath9k/gpio.c
index 2dbc7efdd637..d525d8ef9369 100644
--- a/drivers/net/wireless/ath/ath9k/gpio.c
+++ b/drivers/net/wireless/ath/ath9k/gpio.c
@@ -67,8 +67,6 @@ void ath_deinit_leds(struct ath_softc *sc)
 
 	ath_led_brightness(&sc->led_cdev, LED_OFF);
 	led_classdev_unregister(&sc->led_cdev);
-
-	ath9k_hw_gpio_free(sc->sc_ah, sc->sc_ah->led_pin);
 }
 
 void ath_init_leds(struct ath_softc *sc)
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index a7a11781d83d..d35460e352d9 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -1128,6 +1128,11 @@ void ath9k_deinit_device(struct ath_softc *sc)
 	ath9k_deinit_debug(sc);
 	ath9k_deinit_wow(hw);
 	ieee80211_unregister_hw(hw);
+
+	/* ath9k_stop() still drives the LED pin, so release it only now */
+	if (sc->sc_ah->led_pin >= 0)
+		ath9k_hw_gpio_free(sc->sc_ah, sc->sc_ah->led_pin);
+
 	ath_rx_cleanup(sc);
 	ath9k_deinit_softc(sc);
 }
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index 740a6fc7b067..07797cc89ee0 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -942,11 +942,9 @@ static void ath9k_stop(struct ieee80211_hw *hw, bool suspend)
 
 	spin_lock_bh(&sc->sc_pcu_lock);
 
-	if (ah->led_pin >= 0) {
+	if (ah->led_pin >= 0)
 		ath9k_hw_set_gpio(ah, ah->led_pin,
 				  (ah->config.led_active_high) ? 0 : 1);
-		ath9k_hw_gpio_request_in(ah, ah->led_pin, NULL);
-	}
 
 	ath_prepare_reset(sc);
 
-- 
2.56.0

