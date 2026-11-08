Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166399;
	b=poApqM26FekY970JGgVmOZY4lY0RImylwyvQUPmIo93w2VPf/cV6J7fgWussWCwzUNKt
	 1uZMP7q2xIXMtmxEIDP16Jr3jF8Vxi/wflABCz5rQeTdYYSfI0h3LasFTx9KaXtOVPLb3
	 vVvHkOLkeMz/n/gxsAJfX/6FtDJupvNP/suOichfEInXMCKWHLPta1mh4w+OLvjAE0pI3
	 8aZzHoevJyYxMWK1+3f47WfQUiUnCsROauqTuQvNrD8YLaI/GmzZ13oW1/SXjyD9skXR8
	 DMKA0T3f9Tg+75CjzMeO6t+xQQflxVJhcB8fFImOfFEDgYcAjVqttpZXAtgfFqWeKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=RN6tgwL6B1vPW3b9gCBznsfhVUtrE6LF+pImFI4kNIg=;
	b=gBwRmsWkeXRJwtwD1VeceIO1uRSPHtRs7yJiyg1H0Yk5JK3AovokuQFlha18cK6/5pdn
	 cd6EnZXELRVvEM3QPqMRRarJItacTrjv96hTxNzFJZqsmWw1iwmV7eJR4CpPLL+dF6IQ+
	 l3zp0KxL+LV8X88WTDLmBqmkiYyRlksSW+f44A7jv3zEYQ5gSyRD9QJuIykp1Cgqv5WKA
	 GCHYd2FRLiyPxltzdfLlKqKBVGkNdJjTkR2+2dJOV7f2/wee+y0xGmDJSMIB3+mBoyQ1s
	 wbDf9vVQWVjd8GwpVByGI7h1T873zJGB80Vi42b05Dp2JMryr71nWQ3rIUSoWDAKkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UTvH7vON;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793D606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9793D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UTvH7vON
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so3303015e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166397; x=1794771197; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RN6tgwL6B1vPW3b9gCBznsfhVUtrE6LF+pImFI4kNIg=;
        b=UTvH7vONZbc8N/egrsEsm2GcpoX+D6aQTnbYJvCqaDKF+PyEjkQj8wQWBKOX8M9bBj
         aYFCjwLMeneGRwDwiT1Yn91VJRwSB1EDiVQOGnaLU09/raBNK9UawghLkpUAlZ/tQhlm
         bPhTxirPMFWRWQmPvjHJXxfg9yvWTZRJEgVP1X2o5AkHZsk4REBb9f3LcUknTh3ACzG5
         XgmxAkK/DVugmD+PYKUQsQgl3Z/B8ZApxNkv0H8VD/NjAgnilRYsLKvnJRDaqdKm1Xfi
         JUG1Us2cyFiHWHigXTy9iiuqOFcFh1EYDcM7BAOVX/snXYIjT2HLpHNxUIW2OpjVGbs0
         0+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166397; x=1794771197;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RN6tgwL6B1vPW3b9gCBznsfhVUtrE6LF+pImFI4kNIg=;
        b=UERN+FWTyU4y32bGq7BJhBtNBd2DSQceO5RqyhuKLxFwXYSIIndSY5uL0K+YLp/Yi1
         SL17OwjIi8CgpeW1iuymg2HiMsnilrOc7h/t7/0JDiwJTZg5VXFW+nZtc8Wrv6bMGwaL
         ZFjmeY4KO2viW4/OwpQFp6pL77fSPwGVQhxuqo6cBJly03rL4I58Yq54ERgNY/WcFov1
         AuiUmtuxLPUrHa5JK+6r53tXmndaqHQ5e3IGD8Sd3fahRYfw9CroBgQ0BNR/1PrSCAag
         Lqqcib8HVhee8jQGm7lQwBDtNEnoV+hmht+UbJeiF1GAPsv5R57LdzGksX1JAPEztSqL
         2KLQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ/N0TVhPUdJ1j3I6hI60C639V0RNoI/h52acGgK4Mt65XCWnxdSNDjatCX9a58YMsgaySi97rQz8z5zA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p9xn+nlc/emjS0tHsmwyRXo6kNAcudJPjCwTUn0NHRSX7OKBA
	epEAwRFuwLlrzWEQMjIqKFHgGG2pnz8RPV7FbnyUt+/r/tFc5CaDMs0s
X-Gm-Gg: AYBFou30FUrRPpTgF0h691f3h96v0JAJkZFD/vxz5E6JV/57z94B+6eTqZXKkbU5uL5
	jvemOnV3K0E3ecJuRbuYrAme8hbaz9c8nHdIqeGMe7qD2TulLNgeSegwEelVwelnyCh67cf4Ibb
	+69gcbXI6P3Te6l6CayrXjaVeEugbME5C/17nDSocamYQNivNUVYbvLiSHheBo/FowfjFbSYn50
	jcQaFsfYr739JdArmfC5sTWjhtOAVnMuY6fo9/xjP1o9ZliGJ399TzPKOJpxcH72Bieik0T3IGc
	eqWxS58mwRFc+T3HBje7iH2w/S00gG/khopQLddYOLYDd3r8fAacTaZi51XJG8cmjommqSQArSq
	qzIrt8YYtPRp+KgAy/gmQ+L0RV5wiB39eAIT4IH7TGdq7kMHBz6Q5jQFUJwqNiPrOPV1uizjdwY
	d52DKShLG56RoR65r3Pe4AYuFNJO2OdkuilZc0IXOJUlCZBr60W0Wc9GcNM5ipMTF9ZCcLMR+uS
	BCfJyR0i7j/rLsE5vQcrO7PcNbrIUvC4yKv96btthG4S5Cu1I7UODHTt4hw0E9ThTbgu31bEfvL
	AZ5wwQEItK/bhGvwn10/gvCLrEcmQTrcaT4QOgVSnSesz9zXPl/iNz71ZXlblLY=
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4b963c6674fmr45033395e9.17.1794166396932;
        Sun, 08 Nov 2026 11:33:16 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm105422115e9.1.2026.11.08.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:33:16 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH 0/4] drm/vkms: speed up composition with a precomputed
 gamma LUT
Date: Sun, 08 Nov 2026 19:33:08 +0000
Message-Id: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBjF8VfRd221sSSvIhdsB5+ENqSWdzdc/
 up/TiAPx/BUJYEcTva8LhEqTciM7TJAsI2mTGaFUrIU87EL3VvkFtDagGK5OfR8fS9189sf3QS
 zv1O67we9oNo7ZwAAAA==
X-Change-ID: 20261108-lut-4fde3dee44ce
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

Four patches: a fix so that a frame takes the gamma LUT from the state it
is built from, a table that turns applying it into a lookup, a test, and
the CI entries that can go once the timeouts are gone.

apply_lut() samples the gamma LUT: every channel of every pixel gets a
fixed-point index and an interpolation between two neighbouring entries.
On a 1024x768 mode that is 2.36 million interpolations per frame, and
kms_plane@pixel-format takes 160.1-167.8 s while
pixel-format-source-clamping takes 78.9-83.8 s, over ten runs each. CI
lists both as Timeout in drivers/gpu/drm/ci/xfails/vkms-none-fails.txt.

A channel value is a u16, so a channel has only 65536 possible outputs.
Patch 2 computes them once per LUT change into three tables (384 KiB) and
applies the LUT by indexing them, which leaves the composed output
bit-identical to the interpolated path. The two subtests take 4.87-4.90 s
and 9.70-9.84 s.

Patch 1 is the fix I posted on 22 October
(<20261022215803.621996-1-oaroraetimis@gmail.com>), and patch 2 builds on
it. Patch 4 removes the two xfail entries and has to be merged with patch
2: on its own the subtests still time out.

The other approach I considered. drm_fixp_msbset() computes fls64() with a
62-step loop; replacing it with fls64() is three lines, needs no memory,
no cache and no lifetime, and returns the same values. In a userspace copy
of the same functions the LUT phase goes from 153.9 ms to 10.5 ms per
frame, ~15x, where the tables give 0.9 ms, ~170x. I have not measured the
subtests with it, so I have no wall clock for it. It is not part of this
series.

---
Oarora Etimis (4):
      drm/vkms: use the gamma LUT of the state being composed
      drm/vkms: precompute the gamma LUT for every channel value
      drm/vkms: add a KUnit test for the precomputed LUT table
      drm/ci: drop the kms_plane pixel-format xfails for vkms

 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |  2 -
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 54 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c          | 47 ++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_composer.h          |  3 ++
 drivers/gpu/drm/vkms/vkms_crtc.c              | 24 ++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  6 +++
 6 files changed, 125 insertions(+), 11 deletions(-)
---
base-commit: 33ed26235db93162935d1719bc6f538c384a2fd8
change-id: 20261108-lut-4fde3dee44ce

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

