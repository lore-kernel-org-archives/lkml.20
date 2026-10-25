Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952985;
	b=i4KIxVPbTq72n62Jm2nUJeZowsQjqOEVfyZEmbDNqnQFeGIYzg21vQNIbnCAKSRHwrcK
	 Y2GfSlBmLPtrpOsO3UV15iHvddVnQ7I0kSwC00bsQFuHpbhlwvhDEWss2MgL4eG6zmKqH
	 m5XgjQ2YwRVqDoJqQm+dvWzE/58Ux7+jxomJ1yZhV3nKnKB6nGWZ52DQXYj9yk1Z/TtI9
	 1PsN6c1zgk2V4AlV5YZBT+D5LkDWKsEf4y7SyDugTwfyDXmtjdHiNC1hv8Kz8Aka0Ex15
	 +KJQ7NEAeaxYjTrt/tloc2AB4BIDlEDv4B5T31YWTKbNkenRKt3yoV5DNnG7aMMsgUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0ViJzLMdjNwSjsUaA4gnJdS3+jHjilI1Xx8EQmtZsBo=;
	b=JXM2y1Fa/3zAI9X85OCHJDQ1Wt4uQO0HbHibuKKMW73iiMCXXpUQviF6F6JdrRP1aoDJ
	 bYOigufMfAzuW2SqS/njsB+OVMaFLhNBDBfahQJ/0vgJOl/6uFrOpJMmoWNfhLUQVOI3x
	 qbaZjg3rhpT1VYDp1VNxaQdn/zJwkLdfAYTMCo0kqX6I3ErTDESU9gDIsbCMcy0eWQaxt
	 DHX//1ldOGycdNDKR2RDoVdD6bd0cc5v7kdSDIewshern9wSOeWrV63i4mCtnyJdcP8rI
	 I2L584isS38UqTAGwx/Tv5SlGb/EltweQZu9d5XvP6rB265fTdNDWHpEVG4beW88B+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=icSy9Y9Y;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD3606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CD3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=icSy9Y9Y
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2263040f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952984; x=1793557784; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ViJzLMdjNwSjsUaA4gnJdS3+jHjilI1Xx8EQmtZsBo=;
        b=icSy9Y9YJ04aGQdKdAOrjwcthPXedZz8fp5YPu4eDeg7MeYZGdW5Jmq1rLomS7e3P5
         LGVtFtjkrwWrHkmEZAkNUSw8oas7Wf1OtIjYbqyJpoHHrxZ1cOmALIrwVKT0/bqAu4HV
         YsVe8DP7CWvFzQEo3+5RazKTsniwxYD0GTWzmDytlWc8nrflINzmNP/E6NirbuSFOrQH
         7882gkXQYmFw5Ao5FhVlm8CjXUW3JSF0o4LfntlvnPkMX4uxzrc+i1eNr6pep7mtTOMn
         96IPUvk5+QZgmHa2VA4wy3nY8/LzEkwKkvcFsLgnIhiArEkYhAmnrvBk+zzrCV7Grobz
         5oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952984; x=1793557784;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ViJzLMdjNwSjsUaA4gnJdS3+jHjilI1Xx8EQmtZsBo=;
        b=XV/1mjiflmudsnTVGMwL7pNHwtzVKtvLZAeN489AOw2FxI3dY09ve/4vcKdwkRRkbZ
         DVCx9WQuP91AnjukzgieV+BpogKaTKCzy1X+0uaWI9hB5kETYqo+3sKSstaFBnA5lYSE
         yZKamp7jN9NOxz0AlUu9/6VaUWT6/2lK4NLH8cjUL2r16DWhszwR3i0i0GxMdL2WWfbf
         fclfB+ejdbH4lsNmpcQoeqspcheHRqylIuxETYotX4olLBjUOqyZly7s31Q0OxqSAErJ
         S9QZgvqhZh/ouVfk4GVUcbfe1x96VuXOBMo3M0y/KFdSH8PKFcf1on+8T//2FB/yclAJ
         CEzQ==
X-Forwarded-Encrypted: i=1; AKwUvByt7i/n8p5klYJrE6YQg/6xA02A8mVWTOJL6RIKDcGGarX6dlDPD5L0SrcCTVXMN27+8OSVipHU0ODSbuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRMu75ahqBMpBXkv7GJLVsAIARK56OOljcK5Iown2VUZsVJcoN
	9J7GnHwsek9ZVyg9h2cQnTOMn4XmscjySTZ6KHvvk4Ls3AP+aTwsNyT+SD1xD3Ug9IA=
X-Gm-Gg: AYBFou3do1R3BunhJP9iQkX7HaLFfUSliskwn99PCSnGUKcc5AQp3ZECujid274GZuW
	nL+r+k2rbqktIYu9o8YPorpB4WasFQEnBdrMZQlisgAa98p9BHQEmwWBEr4X0d8WqysY0zUwEDN
	9O6sCTlyexlf8yFbwVHpmOyGettg69Db/bIIK/hjIOypNZ3zL1uJc0sfJI2Sg8qPU21d4Idz1vL
	l/r59QfcptY5znh0iH8+rElhuFgmqfuttOLGL7KIPe+ytvkHz5E4Dtfnd1WdK+TWgjQ9mJwbjtx
	HO8jWbVZLMCbsB2iLLyAatT7i7qFCD5obR0sTpZCoYh3nePq4g6B+OFwJCwW6eStPBZuWoYw6mn
	K0tTj1SJhSc01Zo4TcE3mHkHD4BCSRfYHqzGLEX32sd65De7RhLKSFIUXzGJdjp/Eo23tTIYJdx
	iUcuufkqU3jvnyFFzNHMR4liFkTAqvUmqtNMAwkPLFdF373i42PqEau3n06D0yh2nxtxz1l5kco
	niuNPTScEJxu1S7kr7HxWDIH4x9e7MIfFPTgk/DWG64voebQrraQQ==
X-Received: by 2002:a05:600c:3e14:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a35ae8806amr89044655e9.8.1792952983503;
        Sun, 25 Oct 2026 11:29:43 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm138255175e9.14.2026.10.25.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:29:43 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Subject: [PATCH 0/2] platform/x86: asus-wmi: fix and unify keyboard
 brightness key handling
Date: Sun, 25 Oct 2026 21:29:35 +0300
Message-Id: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4auEWXcgSatpexXpwiRTnRZUMipC8
 O6Ndvnx+F8GocQk8FQZEq0sPA4F5qIg9O3QEXIsBqttbbSt0N+wlUXw6yO+eSPBOji6uruuHs5
 D6aZE51Cy5vW3LP5DYT6OYN9/8CK9MXUAAAA=
X-Change-ID: 20261025-b4-asus-kbd-fixes-6c7e3780597b
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The WMI hotkey path and the HID event path in asus-wmi step the
keyboard backlight with two separate copies of the same arithmetic, and
the two copies disagree. The WMI copy stores the new level without
clamping it, so holding brightness-down at zero drives the cached level
one step below zero per keypress, the "value >= 0" apply check then
drops every following transition, and the hardware-changed notification
hands the wrapped negative to userspace as 4294967294+. Pressing
brightness-up at maximum reports 4, above max_brightness.

The first patch fixes the bounds on its own, so stable trees can pick
it up without the rest of the series. The second patch removes the
duplication: both paths now step through one shared helper that reads,
computes, and writes the level inside a single hold of asus_ref.lock.

With the series applied the level stays
within [0, ASUS_EV_MAX_BRIGHTNESS] on every transition and userspace
sees no wrapped or out-of-range values.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Bartu Alev (2):
      platform/x86: asus-wmi: clamp keyboard brightness hotkey updates
      platform/x86: asus-wmi: unify WMI and HID keyboard brightness stepping

 drivers/platform/x86/asus-wmi.c | 79 +++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 39 deletions(-)
---
base-commit: 9d3475065167197742b0882aff21cf8e78393277
change-id: 20261025-b4-asus-kbd-fixes-6c7e3780597b

Best regards,
--  
Bartu Alev <bartualev@gmail.com>

