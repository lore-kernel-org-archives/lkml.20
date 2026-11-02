Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622875;
	b=qqtcaOrdJgyFjQaqFq9e3txk4NwgecL7WTc5xZ9BQbBB2Os7kupxPGo1QBuT2s5dimCD
	 uyOUzON7QVr6C1tnQMRmL/J6kQgkMQo1CYv9YAjqWK88dvSUmVw+/SaefozpTfKcICMlO
	 ho2/zs4KKYLHYn8cDLbjCocj5I9eSJCuzo347On2ks37P7nPYXBT+SuzfDGLaG/AwjDJu
	 pDekmHVIVT+QqzfzsICtLPWRPUFxHJQ72JKsAxx96uNWg8k6bUekSGk6bc7tvOytVFcpQ
	 3XHBWQJYTiwxTi/uXXWbzn4rNYUyNHXzSpFj+ex2u9SdO1xT5A7FQKv9Ii1cjNy6bPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Swv5UcPabS6E/hCnFYMyFqMC2vY1/PiK8X3IqFBNP6s=;
	b=vtEj7+dW328o5UKFJP6VPdIWKIUQEP1scg7PvaFOl1xgsr8DCvLiyVYTYoDgC7Ho6erz
	 ZEcOhlX+02nd/Vwfa6YsGqxW4+zGDHgc/arZBIvj/CCNqHmIeTYTL0BeravYij7+ruKoz
	 1W5tR7xmDpiexpFnXLl/Px1htmibJObUh/1Xdgke5pT6nD3xDv0EYtx0Y2dIIHH5W8YeI
	 EceejgiIIqk2TntKezLhnxz6FNIB5+MG9zEVH8FeAbWJ7EKHIfNY9CsO3e/Dg993UP+1J
	 +Wd+Imc+SK0ap0CHqEQ/5Cr0Y7iqzbXy9wCThFGRMpsFHJ0AVRoxHwfbH38plHoI2CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgJFK76F;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ECD606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29ECD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgJFK76F
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so26135725e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622872; x=1794227672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Swv5UcPabS6E/hCnFYMyFqMC2vY1/PiK8X3IqFBNP6s=;
        b=hgJFK76Fhm36xxhyzeI19UjhN/oZQigsRWrV+LXDfh8ZK4oS9UheRcAzrtHTeSkRza
         U0Byj7jhlD6yQRkDuepZBjfML+SEELFp5EGYGQ/4L+xj6j4W4PhuFFaaZCpONxYYOPus
         jnq2gMFzf0sCVXsf96NDXuKI92p9xaF75mwClvJGsa9lAFFs4GRoZ+Y+i/JZegxxE3rb
         z1mf+SntcEZGrtgVjxsW6A5HZ3xRBH1EkhwWn00cA23KnjsaslzJmESbnz+RTFaUJIz9
         UsQt6tUH0LZJxUdQBHjGjBGCrCL3UyAHMrdSVFqyGLddAADBnt4Gi7Yz9lu7mEgaGfY7
         xH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622872; x=1794227672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Swv5UcPabS6E/hCnFYMyFqMC2vY1/PiK8X3IqFBNP6s=;
        b=ViGbzSSGmlpk8wCtnuUAnQNji3JZHdND1AhBCrLQplVztiTJAnnxwqLKiYESmV4DJQ
         VSuQ2vovlArQvyPCbK2WtBZj5d4HdQFGos2qPE2g4NTto4oTziQxWP4s+2AD+pLBxfe2
         BvG3JUh3qQF5fVqS5cAXCKnGvPd7XTJVhkag022I3aHUUcElBN5lYcg2MvaME3YXx1mD
         rXj5VM8hQggkHAPyqJgAEh/dQeAl45XU/z5PhdVB8W7ccx3d+LVkCjGBvGByHdapaemk
         p8l0KW1c2nA5QVGreDO+XeQ28J52Zp+U2OXECkxqGq3vpjAZrizZRE1aQeHgDLjq+uzG
         05bw==
X-Forwarded-Encrypted: i=1; AKwUvBzdg01aW8V/F+7HmVYYlJW2+tKMP3vfZBSZbbXSRi1pQy6idEU3FZv7RsmFRtMFYUW2Zhvf1ZFmjn/ENlQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxkLg75mz/OgD21alQuVUnuFxWEFTuCjqT+QDgwZPUsatQcb4U
	dyQUw8n+iZeuOgOp1c8bDsdCW3hCvZzR4C1dpTTQpF7pj+scTcfcFi8h
X-Gm-Gg: AYBFou0AaIoxU6k/92WJaz8kmAtdHWOkcfQ5uh2F+Z8V3hSh8q3TnPcWRBhbZPVI5Fz
	QQDwNpaqas/wg5r2oZzXjEdUF+5Rp2K13IlIiQ0QwVYn5BHbost6UZrkjSYZrQ4OAuQjmtRc0Z7
	aJETpe80ZCvv02sSMGInnlWwVGlcsfen4EXgUkoK+AnGKYuC9dK3OWGzeKjONAwuz6qQXD5Myx1
	8vwG7TEACf3OvRdUconix8wNXbhOSgoXCTQKznKUFWZN3KrPN4RuPfPB/McmHT3VYM1AffHvj2G
	QrT2sIqh4VXXvrmN6/ZJ7rU8tBDVeRtiDFEnBWFraVpJMiS0KgIdfZRLrstL8Hrh9aBLQgq+Xht
	nIPkNIGCUAy9YH0IcIb5x/OO452z8Lz5zCqQSO4ke4bNYSf2uHE17cnj6uiPayUngdnr/9K7lPB
	W9kP745FSoF3eYgG9E5FBbcENqXXhN4tJl1QmNgd9e0Gb7sPBUJ/CZZhFUGyvn9bYWfqUyUcNGX
	RZWOdLgJ2LbNq0zavQH8hIS8P6fTV/4A1hp4E/KSZ4QiQDoJOA3jByZkaIqyMi+DkwIB3DMFWrE
	jI/kh+tOFx+lTPKMYZzF7e7otUvKut9bcP8=
X-Received: by 2002:a05:600c:3554:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4ac14ec66d9mr242086245e9.2.1793622872329;
        Mon, 02 Nov 2026 04:34:32 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm20321842f8f.35.2026.11.02.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:34:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next] wifi: ath9k_htc: do not fetch the beacon of a finished countdown
Date: Mon,  2 Nov 2026 13:34:30 +0100
Message-ID: <20261102123430.1136741-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

ath9k_htc_send_beacon() checks the channel switch countdown only after
ieee80211_beacon_get(). mac80211 replaces the CSA beacon only after the
channel change, and ath9k_htc_set_channel() re-enables beaconing before
that, so an SWBA event can fetch the CSA beacon again on the new channel
and mac80211 reports "beacon TX faster than countdown".

Skip the beacon while the countdown is complete and finish the switch
from there, as ath9k does for non-EDMA chips. Finishing from the skip
also covers a count of 2, where the first fetch can complete the
countdown before csa_vif is set.

Tested on 6.12 with an AR9271 AP and hostapd chan_switch: the CSA beacon
was fetched again in 3 of 40 switches with a count of 5 before and in
none after, and all 60 switches with a count of 2 completed.

Fixes: f0e449627e4a ("ath9k_htc: add support of channel switch")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_beacon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c b/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
index 81fa7cbad892..2b5bf07511bb 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
@@ -214,6 +214,13 @@ static void ath9k_htc_send_beacon(struct ath9k_htc_priv *priv,
 		return;
 	}
 
+	if (vif->bss_conf.csa_active &&
+	    ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
+		spin_unlock_bh(&priv->beacon_lock);
+		ath9k_htc_csa_is_finished(priv);
+		return;
+	}
+
 	/* Get a new beacon */
 	beacon = ieee80211_beacon_get(priv->hw, vif, 0);
 	if (!beacon) {

base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
-- 
2.56.0

