Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635826;
	b=Nnd3Q8jvXv47E4WXOym8ZXlLAw/2qI+olJfr1evUI4/jCbqCTyuVLBpU7UJ9H3UKGgs4
	 /UfaiPwt3+NOXRAPj6E6bGlnRSGI5i19sTLDm4bRjzhddZuAy7MDqBzpH7TRbSxHuMpcJ
	 nL6MG8WHgbiP8aOIm39zDy/hE208XxnGzEEVPoMa24/WKh5QO4+w9bORjVIRYY/QUx37H
	 ckIrJfOMGSAcXSO+x4QQ2gPelIjjSAmLdij9/pqQOXXsxtjpkq+GXJRnQHmjZElyvfpYo
	 a4VysRdsB+V9L/4ao/piCbtifvwANX8Sg7/2uRs5gcFzWkQL/HVmf69AqTBLceAdOYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BL3IHRvJ9+gWwxp3abRrWJFWvxWrWClVc4DpkC67oPM=;
	b=EIny7eS5P6L1Z0SMZZssEQgjYHK4O8OUbTt9meYtTlNUOvroddSSoNSE+4bpP6wEjItj
	 wSF6GLKShIrxotXR2DKQ5iM44DCpWKeS32Cwk815ZsRQyzCrZyRKcuX406A3ww9gZh/Jx
	 pGga1aw5Binl15ws1gfV28DqvNc05IQkjE8GZnZ0Wb6+3vO2rW532cG5Cebi2PhSYYsiF
	 VVihLJDs084GA5b7xaCG74qVjgGVc3VBMyxW5qS1KcbcigZLVFAozXS+pyTf8b0uL0git
	 DiMT2r1YaBdNRGO7n/Ar9bzii5vEHS2MMoiqNMsytf4RSDiUkz1J51OhFDJCNi2+mmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDW3F65f;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A7606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833A7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDW3F65f
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so243603a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635826; x=1793240626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BL3IHRvJ9+gWwxp3abRrWJFWvxWrWClVc4DpkC67oPM=;
        b=jDW3F65fISoaz7+amfP89O1a+TNphBoF8sXcXEbXqNHiXy05gjaPxmmP9qspk2t3Fe
         JuQCtSOIZh6fLy5lcF9Kter3YdL6FRhO/CO4tzPoK/DzJ/956HE5p99gDAJEvuqWjK9I
         6y27cGBiAxdHopYyhntNX6nkFY8E0t5VOpEYqWJBvTiIp/u//Id8fFNHFT2Ud2wIe6oZ
         ZV0fDoNkiPdJMqbJSJGGtEoBjSXRNT+3hxGTQXsApCGeJRL3YabEWqheiTZJC2XqwOoQ
         4hWOsmEdjS7+ffdURfEqu+v5M4I1nSwbx3uygcurNxU4OB9C34H1vX1lmI+DdqpFOsCj
         vQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635826; x=1793240626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL3IHRvJ9+gWwxp3abRrWJFWvxWrWClVc4DpkC67oPM=;
        b=vDPj/2dHS1usfAQjaPcFI7uLGX431UvmjjwMXuCg1QQIiRRX9yExoBQsv+jhZE+8is
         B4QIhrpzW+zc0oi/9wlXBCGDnOLknJSvwkdA3YPmkh6STrDggr/Ajgx4vxbxQaCgTqfw
         63iTn6jfgP2+UUzH0DP87fZbw4xRgIMRbAMDJ2oN5gbCychj2M24N5lufUO6yJ55smLk
         pp0rw42BLLCt5eh6OTjryfGIEhTNksdl+kZyzSAHroFcHmGdj7tcp493+lwSaOKG/2Ay
         S3ma7eoTVj6AjBFZic/DZOm0ew3kzej4jwjmdMDPXe9GEn+1WSre/M9c5Hw27cb0YW00
         9UDg==
X-Forwarded-Encrypted: i=1; AKwUvBx446j8UXRJHzP6FT+tkGfl+nraymt9DXsIjtuJTnPQTebCGIkRoYT1lmxy5FONzdSWdhgQkAiqOLZcwL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYgibN8IDejjX2MI1uT7juAS9oCvqBZj6og2in0J4LCzy8Opgs
	RtaYaYWRqrTUOLhLWgIbHsIfCtrnnd7Dhtgxfh99A03nUBjgRkf5VCEX
X-Gm-Gg: AYBFou2yqQnmlN9Z9a5ws7R0mBQOUd96R94JuVn5+7pgj32AAQbsGkZQd9ByUZ3rLpx
	ayemLZMsNTg8r29LIcmVjwUCyDWHzBLZC10+0SKeMv8kaPdcmr4GlshHJjpaZMEVJNPEIym+Nm4
	rJrg0U0wo/SV3VSn7zL/SROQq29Rd4fYHa5Sgfj7Os7IvmB+DFYlkko39E6edrjQwADtoCYS4Sx
	FfqfljAos9fHuBuJTsYb/edF1O8cFtnZ2G9pjftiZ8TGE84D2+oFZCDqIaF0p30p9yVofAXx8+I
	XW7I1J9UE9B1+0ym1GYzkvvVmswZMiA+itxJyr9y/qdjczV9EiiUO1+WY378M0gP5KdPJ1ISUjg
	8GP5YrwVArO4fhAKNVJs5rdpzr7ww/pWyB9KWOO4Pa1kcdiKS8ETc5oXGcHQPAEQBJ6z0kbVGyb
	e+QMgTLEFCLXTAPubhAgE1+M4cCH8NeA56FXmdcQQ5nYH6ItILSc6BxlTK+kMPXjgqdW4FhL6As
	RDamnwzQYAkhcNK0CMMSn9V/gZ3u1pfD6TQBZuLkKiJTSq7fAezaRtmOobtXAw1zGzk3RhRr+aa
	iVFSgSRHDPPzvDkm4k685DSPPIW8ozLI6BXiCS7UrKIRRUYqw7n7pbcrFDeoasu7MxjjMQgYp/w
	XbSnoCGovFQy1ZkelhXEeTkRvjYOQ
X-Received: by 2002:a17:90b:4c85:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ada6c8842emr643889a91.21.1792635825946;
        Wed, 21 Oct 2026 19:23:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm1783949a91.17.2026.10.21.19.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:23:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set))
Subject: [PATCH ath-next] wifi: ath9k: release the LED GPIO after ath9k_stop()
Date: Wed, 21 Oct 2026 19:23:43 -0700
Message-ID: <20261022022343.1409432-1-rosenp@gmail.com>
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

Free the LED pin after ieee80211_unregister_hw() instead. This also
frees the pin when the LED class device could not be registered,
which leaked it before.

Seen on a TP-Link Archer C7 v2 (QCA9558, LED on SoC GPIO 12) when
reloading ath9k.

Fixes: e34f2ff40e03 ("ath9k: bring back direction setting in ath9k_{start_stop}")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/gpio.c | 2 --
 drivers/net/wireless/ath/ath9k/init.c | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index a7a11781d83d..f6aa2ec1683c 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -1128,6 +1128,11 @@ void ath9k_deinit_device(struct ath_softc *sc)
 	ath9k_deinit_debug(sc);
 	ath9k_deinit_wow(hw);
 	ieee80211_unregister_hw(hw);
+
+	/* release the LED pin only after ath9k_stop() has configured it */
+	if (sc->sc_ah->led_pin >= 0)
+		ath9k_hw_gpio_free(sc->sc_ah, sc->sc_ah->led_pin);
+
 	ath_rx_cleanup(sc);
 	ath9k_deinit_softc(sc);
 }
-- 
2.56.0

