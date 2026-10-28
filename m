Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209432;
	b=LCGTD9067oVynTH/k/PY9Wc2EHOuks9IAfTukO//v6C8dRszibHWt2FJrdnJo20pFPfY
	 3vn4u+sV15YV7d6b7+h/B6MVB/y9A0hHaShkkUbSn3ltE/e+wpeDq7WtPs/flMSHmP/xw
	 1hhCacYgIWne2iyriYW4JFwNZBuqjtAQAlak8LsTfedl0wiEztaBaa6j7C4Lf4CgowJ0f
	 YVO9DUwBCd4tZWfL3rjmmjbtvrcTyFGAt411DyiAkY8dI9CFY9nIjgeU2xKETdWcOhGJk
	 d8UMLSGaYT9dxSE07qMNUs8s+hzpfPpF6kgjCoSwWx4dhbkLmW7BFzDYkh5MgYtflyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gnYk9mfIVN/zPIOrtWIc8Ged1/pnLoxgeSZf0zwa4jA=;
	b=EsyUN2nL60qQ4qnTYvjb8fkwIh8FEpSJgbAYBnEL6CGC657p3Re7R/uorTc5Ia0xk2LC
	 uWFrAuw+vgnK/KjifWFHaL911+kLaQ6WqCVDLDMI/C4Ul/z1xVWbucLZqQiFS0rlpE+lJ
	 rDeaiAet4xyGEeOeVa87Yf54FI2Eo4BEgI23LHtS81TaLhD37vceKwEDs2EyJPOpGqr7a
	 AcSTXeKprsabBZDqv4R9o0B6bkZJQuWbw0r3N0kqKLzphy1Xv58Dpfm0UeAjyEwkQjcw0
	 CHAWP41ppVMUyEutl2ncT8RKVUz6lucBsDj0EOPRl/ADeY67HIdqpzUdW9F8Qbu91nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWi2t7TO;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWi2t7TO
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53c156ba662so788190b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209431; x=1793814231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnYk9mfIVN/zPIOrtWIc8Ged1/pnLoxgeSZf0zwa4jA=;
        b=pWi2t7TOd44Eg+6imclUJU9GB+HVHns8S9UEPU7tH8nxTHM5qiwUk3Tw/W7VA602oe
         qWUQ87i9kY68xNZH44BMDGWZmsx4srbezbnGe8JzeCP4hAXHazvzwJdcsI9m5G04Kubz
         TSzKrztvYmmwuGAXO7wNOa+F6tZH6DT/OmZ7bmXlRxTYW2guMAFGTHA2L9PNhXg0cA4O
         ZfaGgv/15EDQwME+L5a+K6YNsf4YQ8xyTrvDZpU7IAryijKF80j4b3S0ycI8GO+R19FT
         yfnfZ5X0/e6ZpjfMRKHUVY+H3KU5Md8Bd4vdWdHw4awTVQQIOy8mokpE1yvUpHhm6L3p
         q3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209431; x=1793814231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnYk9mfIVN/zPIOrtWIc8Ged1/pnLoxgeSZf0zwa4jA=;
        b=tYMT3OyxFjzb29gqgMQv7PbTp5JA1JeNFq38yGrP6pBFL4CAs0/P02MqmO9RF+h3SK
         xKLtOGXWEfNowjtNGv5RupDV1891Hk1QRyOPAoMYLzQlT3cnmcz7pLh7pqPD0jex/IDL
         Objl1iOYBRIKniP52x+9EkybVI0h4CVglgVZOSJcPweY76MDUsV5DuUOJYFS3xTr4bxN
         piv+PUfUFUIk2wwLgTPnbQ3ma7QuhDUvu8gMH68cc5PAu0Qcczw236yLExjFJDkNnw2L
         e+eXkZvs0BvI1mPT6MvJ5fyL1Z00ws2XDmQZy7GPenoKiH2nsuYQuEMImDQGGMgjQgFh
         n9Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxSTs9c1q5zKsdoDcAXV3bthdA4rO5u5CXLucYCBL+czagkPZNeOo4yoS2KJe/um6eTYcvN3nG2lIIrykk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHsfBIE20XNktpK9Cddfxi2KqJo1/3pZXxFxu4hFyTbvaVnInS
	dD2MlMO3rXB1X56/fkRI64Z0U3a7rDGVCeKUWDXXClUFNLhUZldqVwoP
X-Gm-Gg: AYBFou1MJz4gBAXJ0oWMOHTrBH6Jtb84Bg8NkPOi4ChkKJpMnK05AJr2wzrKWGfxfPq
	iRyaG1bihPEeN/+SsZ9ceH0gQam+6yn6AymxSmuxKkZzF5ORv1/2DTrurwEVTJCXUZC0QigrFTK
	V6Tdsj9MsPkGx3t2SqbUnCOTGe/EEu/n7jiGVdDW3ZY6KSUayoCgDygEnPPjkJZjUfD4sEHUFS+
	4TChnyu4Q1M4Rmcd0syzbeUcO0W59cVsu4nWX7dOR+5HV1qB3AvYWPt5vBDMhy2E+ZFq118yovw
	KYFAEc2Kr74NK/LaFWEFteLNSDsH8tqN/nCnGOug4zq8IE63NCE3EsJ0ybTRCBLuwfXmob88yWY
	xZZHTGJcRk4jTKFmGL+qcy/qqnh7aWC1FfhDr1ZqCcCEYW3e7tV/844eL1AfeWLtmGokEQeLM66
	nXEBcfzkg17eyivPjdBHSHbLUTTqcKkP80Zng7B0t3pvtAI3vINJkzDYFrMYXQwqG0Lm9xYEy7o
	a4g2ADiA/dAyZE0nhYgSaCsbWxsMUSmi8QzaF9uUjdTBD0FqCYpuIjn61pdJFaSicrkgpZkstcf
	fIWGNZOlAUFT9d3a/yyaQcKLiKrSqqOGP/B00KOrwlmZbCYZV/fpngtVwNWw2O+9d1E85dk=
X-Received: by 2002:a05:6808:1207:b0:4fc:5e91:5377 with SMTP id 5614622812f47-56384c86a46mr2096223b6e.59.1793209431161;
        Wed, 28 Oct 2026 10:43:51 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm1612114b6e.8.2026.10.28.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:43:49 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v3 0/2] leds: tca6507: Fix use-after-free on unbind and turn the LEDs off
Date: Wed, 28 Oct 2026 12:43:46 -0500
Message-ID: <20261028174348.64014-1-danishkhateeb03@gmail.com>
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

Patch 1 is v2 unchanged apart from the rebase. It sets the work up with
devm_work_autocancel() so devres cancels it after the LEDs are gone.

Sashiko pointed out that the "LED off" write queued by unregistering the
LEDs then gets cancelled, so an LED that was on may stay on after unbind.
That was already the case before 1b5c2fa7081c. Patch 2 fixes it by
flushing the work instead of cancelling it. It is not marked for stable.

Changes in v3:
- Add patch 2 (Lee)
- Rebase on for-leds-next
- Link to v2: https://lore.kernel.org/all/20261015144033.56519-1-danishkhateeb03@gmail.com/

Tested in QEMU on a next-20260930 KASAN kernel, with the driver built as
a module and a test-only module that adds a fake I2C adapter, logs the
register writes and adds a software node for a TCA6507 with two LEDs.
With both LEDs on, each of 20 unbinds was checked for a final write
clearing both LEDs: with patch 1 alone it was missing in 7 of 20, with
patch 2 in none. There were no KASAN reports with either, over 20
bind/unbind cycles and an unload. A W=1 build with GPIOLIB is clean.

An LLM was used to help with this series.

Danish Khateeb (2):
  leds: tca6507: Fix use-after-free on unbind
  leds: tca6507: Turn the LEDs off on unbind

 drivers/leds/leds-tca6507.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)


base-commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf
-- 
2.56.0

