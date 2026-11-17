Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929519;
	b=GMPsuXhzPfHRkNA8GIo8Bvqa0YcByarHNwGtypcc8yre9hH6Dp9r1uDw4jFQ6Q2OJImp
	 CgXaLHYHKTu0eALgfBRhssH3kF2RO8VpJaRbyMnPSWw/Lk4b1PVNH43WGLEZforouj+9Z
	 Ew2SnA4ocV7yRAO0nCZpGPrMEUc1xYAjrndcAX5bKpaM6uFiKKRNp0DTJ4pPfbxn2COli
	 DKvBZSQVBwlZ7BvQAPgwieymfXz+2rpBT6sCz9T4YRAAJi4R+Z0IZoMBwNvumwqmEIXL+
	 EyYqEcTE4dhFR6SP8HF0QyxYHGU2pI2IbtdAQtX7BK4jsqWVM37fYZw/QxRYJWPdaWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cej5FlH9mXCndJQNACqKxUUko/pM9TqHH5ko3G8yZl0=;
	b=ZxGIo/WGH2/coggakkRKjBGiGOArmr0L2JxYOWXSD6uiGLMWpGAzzkvu1/YcTPGLQcIW
	 oLuO+j1B2Hit7uZtJgvQvS7RRACZfYRXZIvYZe0sYm6DxEnrcdekLkv9cgzDSIxUFyvLt
	 DDDz3NFma+qWZ8tcc/iMG9fteshaAJ9vypw5mcpLnWq3u5mupJpz9sqqKLu1XYOWALMQh
	 /OxbmXBdBKTDRgWoC7c2T1V8bNnb1sCgRwHTXZp7sKthH/6UAGzRuGt09v8BbSMDG4c3n
	 g5KCOGIlIGeUUnWoMxnGLvPsp6MRIjVooNpFuJr764k5FmZ39ZdNzk/rBPGjeaxdDag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6KupwTv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FCC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FCC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6KupwTv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so32362405e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794929517; x=1795534317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cej5FlH9mXCndJQNACqKxUUko/pM9TqHH5ko3G8yZl0=;
        b=E6KupwTvzsWbDQglrtCzkz2hEiZS6xYQmGS4ej2OMJ/E2fHpI7relGGtZol+S1zFyW
         s2zu2pb01GUffSrLOa4c9GImtVfOoLyqMS0um7+kwcTT7AK5+L8gKFKI9W6LwXT92fbM
         KcFftctLAbncEplU/RmndFznVX7QOhfW8e45aM7DWIk0m3Cyf+Gj/CC+gVAFf+s1+gCN
         deMtflBaiidXkiB3IDhdYX37jxmZczazhBf5WB/OZbz40KicPsNCRh22a5NABZglsPgf
         OBdPjBNhYU8T0KdjsYYQLqQGua0Wvdkx+uaIOL34d7BHUetSimR2ls3mj4kvOmIkJoob
         o0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929517; x=1795534317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cej5FlH9mXCndJQNACqKxUUko/pM9TqHH5ko3G8yZl0=;
        b=R2TEOmDvps9VDXudIe53ueyad35wMb8EDt3RhPB1JAYLSlTqOHCnFSqtteMVTpZ1R1
         loZxXzo5ardjuXWLh7BGR6fhUiRtGfyrxQrlQQ5DE3nf5JsCQti6EVIuHBjwVR9rT1J+
         Jsc0olDPOIFxHQrER9+Qjb35YYTCF5IFXPanxPOO14HOojAIGd5Vi3z9bvssC3kKNgGH
         kVnin99o6cEC83iwx1Lkdu7JrQtoHAfqJaL3IjQhf2wfaBXa1bmdocEoRVKlAt1zvMZ/
         O5MTiqBzBCsEyT+o3KUGgXt5cYesvi6p0cMDH5MtOTehTWQkhfI8Ig75OsrDQfcJXgbc
         cr/w==
X-Forwarded-Encrypted: i=1; AL+hErHQcf0gvpa4zhqlnYIN5Cz8IQcSDYbWyLwSbkPZqlO9ghSWaaQ+DTAgbTzx6BLPD4YJEkfWm9lUiM6JrOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z81XE7gLffWbZ2UNlpO8asL/fLYwOAJH9VUkHoRHiglZH0TtmTX
	IaEIyzOSMNv6h0kriyrTuYgj1KxYffNRDyKW4e22m8I0AFmNW4B9jc30
X-Gm-Gg: AYBFou2k+StLlXezkulkP/YkL6yp0MgJl1dW2AzHyyf7kxpJkEoztsk3zTVq/zYHPOn
	If6wLwVOtOMb/nGa+v2FwlKRhRx8gk3EwsLYfqgrCO7Cecnu46DK4zVbTmnB5wPEp9+YWi1pmPG
	TqHSdWf2IEFpdevXi+Wqm9Rs0a/kd3aJHyAli0vFGDCjBc18hxi9DPdQpMIPa4j1V51bRjpLbHy
	E4q+kewLk2q7e+KJLQHTvlj96NdBdLdG7i9Yxt3fTsAdDxilmHum634jdp3D6EbsKI2M1vbU0vO
	haTwYw1zIcKXCFJNxAGZ9VcpIeR74MpyfQJLOlD0bzYwXRBFswybrQYUBFEu2RnYp+Fsc7DSczx
	UeHOj4pF+AAvbQz8xqQqPEiJ8WlzjF8hVddxlNLYBwMNgvk+3pRC97nkzX0ZNLUOppBlTQ8JN9v
	/VZk6S9TdN/ssLGbqYKds/McKbQLcmlVsm5/RoRjRmZonG6RBfdDKpZIg+El9mdTZgalG/6G2f0
	IMWPkdj+boECzuId8lh+uz5dTUg/mliSxUKXp/EjY6HzctURa1101bQ7lHuvFADF8U7FLV+AdVv
	KAepIuYbWFsju/8+9N5AIPecFmPdDn0zqHI=
X-Received: by 2002:a05:600c:4f12:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb65edbbcemr225699605e9.33.1794929516791;
        Tue, 17 Nov 2026 07:31:56 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm108960895e9.10.2026.11.17.07.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:31:56 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH wireless-next] wifi: mac80211: replace the CSA beacon before clearing csa_active
Date: Tue, 17 Nov 2026 16:31:54 +0100
Message-ID: <20261117153154.1804945-1-mehmet.fide@gmail.com>
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

__ieee80211_csa_finalize() clears csa_active and only then replaces the
CSA beacon with the one for after the switch. A driver that fetches its
beacons with ieee80211_beacon_get() and skips them once the countdown
is complete, as ath9k does in ath9k_csa_is_finished(), tests csa_active
first. A beacon fetched between the two steps passes that test and gets
the CSA beacon again, which goes out on the new channel, and
ieee80211_beacon_get() reports "beacon TX faster than countdown".

Replace the beacon first, as the finalize work did before the clear was
moved ahead of it. csa_active is still cleared when replacing the
beacon fails.

Fixes: e487eaeb076a ("cfg80211/mac80211/ath6kl: acquire wdev lock outside ch_switch_notify")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on rtw-next on an i.MX8MP board with an AR9271 as AP, ath9k_htc
    with "wifi: ath9k_htc: do not fetch the beacon of a finished countdown"
    v2 (link below), hostapd switching between channel 1 and 6, one sniffer
    on each channel counting CSA beacons heard on the new channel. Before:
    3 in 200 switches with a count of 5, and a print in the driver showed 3
    fetches between the two steps. After: none in 200 switches with a count
    of 5 and 80 with a count of 2. With v1 of that driver patch,
    back-to-back switches and AP stops in and out of a countdown gave no
    warning from mac80211. The rtw88 AP channel switch under review
    (RTL8822BU, RTL8822CE) counts down on the air as before.
    
    https://lore.kernel.org/r/20261117151703.1802556-1-mehmet.fide@gmail.com/

 net/mac80211/cfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9e47360ee8f5..9458838bfe63 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4776,9 +4776,8 @@ static int __ieee80211_csa_finalize(struct ieee80211_link_data *link_data)
 					&link_data->csa.chanreq.oper))
 		return -EINVAL;
 
-	link_conf->csa_active = false;
-
 	err = ieee80211_set_after_csa_beacon(link_data, &changed);
+	link_conf->csa_active = false;
 	if (err)
 		return err;
 

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.0

