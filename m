Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942584;
	b=iociYv2gbRFtX1hH1CB91aDmkmxVz/JRT9RPdrmR9l8IF/5lO58MyDu5kXNkDmxt8bda
	 EKp0AQhdUTLI7Lnu5WZ8L5dxTRbDulI2Yk0C/p8AbVIhk7dwp5ei9HuJv62HEtUtSRYPP
	 2Pd7wLrcXqFVk3tZnHqDaQNBZ6yWP4hONbSla9o0Z+zIid0AqHfprhrBUcS2aJReZ9LE9
	 GzoBAOx7EyAxz5fxUIGjKjy20Gjl+ghNUYNKFsw9i4dnaL9WrdUb1poK6wzzVKPyJkS9g
	 6LiwTuZj8+UGoCm8nO884HJifP6SecypQWi1QYOplzbUeZP7ZpjFNmlR5nYpwjwZrqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QgjUQIvs3qIFboQ8HXSfJd5nUrq2pq/h3iYL5W7cQ3Q=;
	b=ZhpS4B+aW/X1YndSSXK0EFSAjbHUZZTf8qU0mNTm5XBJEONHnTSr4/f92kCyE0Jc5a1i
	 Ud5HjpjcvUsX5ggOGPzWQ4Ux5O7roN4L2ruJR/hBweniB6IdNlxvThVgqPSiNwp/gqukg
	 z/B7a2Y/pH+0zkvPYInwut6H1HM5SxCccMGAkQV4Nrq2hc6veCKthj1A98VkgTeJwfuKp
	 4tlc+7GM6wQ0v5fwRgFpn5kan5Yd2sFQ7tBsFA4Sh+co8WNzOeFCBF+dSYx+ZXzm1naDE
	 llwFEr+i1E9bTWdQmC1CKUKwnQ5Gwp6dtD9AotGcdcQYjbKXMJiHqCrgUs5gSt5PjPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQ1noQVi;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8CA606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQ1noQVi
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06c60065fso97578b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942583; x=1794547383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgjUQIvs3qIFboQ8HXSfJd5nUrq2pq/h3iYL5W7cQ3Q=;
        b=rQ1noQViIAKFIn2+u9hAW+IPrCT/pPog8gbXMLjSr1UICqd/D+9RYpcICDNkBfjJrL
         iY/IKpPSD+gW7brrB1YMAdFH5CVocoMrjEamfF5yySiiiyrX0g7F8iUfT63obhu3+son
         IIx9J1FSJ0VfzBBSg8iUxG15/tM40t0ZbumcBE28DUPi2BBuEZ+Yy/AKMJNllmkmmL4v
         oxLfViUd1oOs7YZqrDZETrmwAbip5jtkL/iJuuKKrJcLyCGOuyaGgP7UhrhmCQcd91As
         c3KIuqQP3Uehjj5HUtzyR8gc4Roq+hcfFcA6U5MclHrWsT+6T7VMSEMuKUMMsT2RuMXf
         rK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942583; x=1794547383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgjUQIvs3qIFboQ8HXSfJd5nUrq2pq/h3iYL5W7cQ3Q=;
        b=K2+iYEg7ueQko+eyn+BY1ywDfY90XyA8vUDuvkVD7nV+UYzXg+C0NKyTyUVYYIiMjI
         vqCsTSBxXiSD/NZ0uaHL52IPP5KEc+JYtT4JVA+fAbef9WXAXx0QPua0ILZKasGb3PyR
         DtlhjjUZSFjipebyDwVP/vSEjoujEYONpObROmoj2NttCfchVLfOnLRDbvFuKkkotdXJ
         8S7sDJn1KWAkIO/iZjmrFZD4pMFku0k7qOqGjpyu9ti6/CVmwP+v9SOXgM7WbTuKN7eC
         dqek1Mxjs9qFai5uGWVnIHr5IjNiy1LY8+WMLRSYmlcCeKKCsmae1mh7o4GHREM3f1j4
         eF+w==
X-Forwarded-Encrypted: i=1; AKwUvBzlcJhTvbhWJmlwJZJNvg48km1HlNmBr0k/WAVINw4D3sJQwYr21DnVhIBlwlyI406alwaXCXIkogYOpb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Eptjj+ZEy3vDhzFMl2ujCI/JRG7KoIQkGSJRU3Y0g1j/nfQPC
	ro/0AQNIr0NrkD5y5sKR5AIxVXPImlcAzKKRwsehAitz8QVpLZ/vk5t7
X-Gm-Gg: AYBFou0oZmmv6NgfNcCYv5BVJMOaraA6+8E9K8QQ2tsKVK/jbJf16aayq2O20qO4RO1
	GHvozj8g9nxdcc4j6hayztBLnqnekfPb/cXlwgcf7w1ez9nuVrzNycTUsdmJZCVA0eX5hM/oHlJ
	/HB0TiGGZOkhHpwP4KfR2WkHyvqierlyACvVuUsiH8IFki7hk0WjwlQP38BVVM+XriJONYEAjgE
	ldb2MFAJ7wUGjx2beD2r/Vks8CXgbPrUGqfNMitIB6lxge1I4FipEU7qFejLScBQLKxhQJ+Jq92
	xumz8uPmuGIjnVHKQlG27wgFuMDRGhVL613teKJ6J6QSzdjxXEIC7RdTlZBD1Rcv5A8ZitmYWi0
	qh4uBDTs36AKYZ8/DokkVokiEJ6culJa4iOCl5qfRkbGzJNyzRGKVHbjnKBbE/Zu6m9/AJB/bwg
	fmDh55kfbmNwdxevUUVr+vtOW+YaP0DY4L1ZXWQapqUN2wM664e7nlAcpB0qk5wQVd5+nD4hRdr
	Xjq48d9dL2b5JzOLAOb8p6jAzWpP8hZo82unZ+OlxMb38NeNyGrNmNlxmuv0zECCYZtOEC0Q4Yp
	ilQJcKoBNCAuIKBzs/iBreV92EpE465bsFF4awpkj6cxfNuk3pSdWZ6lT4z/DYrkikuSow==
X-Received: by 2002:a05:6372:a80c:b0:3e2:7c10:d47a with SMTP id adf61e73a8af0-3ebb29acdabmr1525173637.15.1793942582911;
        Thu, 05 Nov 2026 21:23:02 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35a9a216asm245356b3a.54.2026.11.05.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:23:02 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: codecs: wcd-mbhc-v2: cancel button long-press work on deinit
Date: Fri,  6 Nov 2026 14:22:42 +0900
Message-ID: <20261106052242.2000264-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

wcd_mbhc_deinit() drains two of the three works embedded in struct
wcd_mbhc before freeing it - correct_plug_swch (via
wcd_cancel_hs_detect_plug()) and mbhc_plug_detect_work - but not the
button long-press delayed work mbhc_btn_dwork:

	mutex_lock(&mbhc->lock);
	wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
	mutex_unlock(&mbhc->lock);

	kfree(mbhc);

mbhc_btn_dwork is armed from the button-press interrupt handler
wcd_mbhc_btn_press_handler() with a 400 ms delay:

	schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400));

and its handler wcd_btn_long_press_fn() dereferences @mbhc
(container_of(), mbhc->current_plug, mbhc->jack).

wcd_mbhc_deinit() frees the MBHC interrupts first, which stops new work
from being queued, but free_irq() does not cancel a delayed work that was
already scheduled. If a button was pressed within ~400 ms of component
removal, mbhc_btn_dwork is still pending when kfree(mbhc) runs, so
wcd_btn_long_press_fn() later executes against freed memory
(use-after-free).

The asymmetry dates from the teardown rework in commit (CVE-2023-53842),
which added the correct_plug_swch/mbhc_plug_detect_work cancellation but
left mbhc_btn_dwork undrained.

Cancel mbhc_btn_dwork alongside the other works. Its handler does not take
mbhc->lock, so cancel_delayed_work_sync() is safe to call under the lock.

Found by code review; not runtime-reproduced (requires WCD codec hardware
and a button-press event racing component removal).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 0000000..1111111 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1624,6 +1624,7 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	mutex_lock(&mbhc->lock);
 	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
 	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
+	cancel_delayed_work_sync(&mbhc->mbhc_btn_dwork);
 	mutex_unlock(&mbhc->lock);

 	kfree(mbhc);
