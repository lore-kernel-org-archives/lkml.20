Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717780;
	b=LQFiFBLQ3b00N6FjamBnOV10eAc4EnE2IJSqbD+GGwk29qUInh3kuwcWft9jDE54OL84
	 mgqbMvPRorY849Mbx53YP8JVem71RXVky5/kWQ51vSs/MpF7EUVDhfNZJVqqNg1j63yXJ
	 Pgszwwy3QvrxUDy2XRoLydltHpJgtGh6Al9aCudBByid6LZK6fwTAb3PHDGrZ0V+LLXu1
	 WOOeW8rFpbBQfb/7mcfi/m3ZFtdN7Kvta1xBaC3u84hVtM556GkBbAHab98pGGAXHarDb
	 xKGsGZYpobXGP4nezv1vi91AQWyJqiHAcRiazIid4oRY+SPZyFTEe8UePKoYBy925pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=LikyN3ozrT/DE7xxvLKNqwx4AoYBeMfpRQuMhrwC9OI=;
	b=lFAKwyqiK23TN+5M9w3sonTb/bGZEDz4YuXfa8E2916tmRzFKQGHdP9xR0Hnt7LFu17j
	 jVVBQyQleyRQpSIjp45zPzA4aJPGR88LrVV79L1EjNHsnDz1TztaJPuErykLKSzlgUtlT
	 o9wOZQIt8dbFwzMxSIMQAz/NrbMauDCPPleMyad+4fn/fynW6gtiYXkPy6T7DpP5CRx5h
	 zb0cfcYhXOEBdQE9JEGqF0LN9rgToRgysAhqb19aYKns4yn3PJoHKBAyvz8KbDPYeBZ04
	 dHwqCLyiu1JP7L1oJn/yC0huNcsVh7NG3k++SEfclO/lVF4ODnjPICwNkB/4PEQbj0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PlDwjO28;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C379606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C379606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PlDwjO28
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso943302e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793717777; x=1794322577; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LikyN3ozrT/DE7xxvLKNqwx4AoYBeMfpRQuMhrwC9OI=;
        b=PlDwjO286Dh/w0brTAx7LFOQt1F3ospHclP4ow2NMiuVJNTCZ/vBihxXiuGAB5kUh1
         VnCJtMqYN3ta4E5m14/tXrt3NG3mJI9OxJ98Xxh5Qf7nW+7fDunUx37/4MCTINBK1m/2
         tHHyK71PIKuC8yj1DmK2Ky2Ls7gD42laQ4Plk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717777; x=1794322577;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LikyN3ozrT/DE7xxvLKNqwx4AoYBeMfpRQuMhrwC9OI=;
        b=uM4gDsQA2GTB5vgeZyufpe/9HJZ4/PFp/EZXqHZvifnRNGhrdLIoYtMJFXRW/X52il
         oNXg2kBYymuGZb5H3rBvQIFNQ3bspT4Ma8QfcswT1HZtldoyCl5eUxqig8qmeHDsFmRW
         IYw7VLw01OyxoDtjwdac1WYFd535FD+TgoPRXplBofgfc29FOLd9oWmSLSGze4nvSm6f
         2v7tjWyvUz4uR3IA/9jGIxY47xh/akYMFZDQTKJgtbpUZppin4lrKxlqQsJkR77mWcnw
         a2G6DSrVvIFRvsyuILCrstc4Ke5no8jGH/LYvHc/8xOE7ErnraWIyF5QGUHOoD+b3jCF
         7xkw==
X-Forwarded-Encrypted: i=1; AKwUvBx/oJGC5/P0sBhyAEYqv7EbV8t4SjJ0ZXCu56OQSxF1w/Ec+BUeZn8367WgMyJ1sxBD4EMDfWrelwbBVWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hNUtm0EDj0h+gRjZvyQWQopbIuntwkYe371bsR2iJ3CQjJYZ8
	rgxSPsQBMeZBli0HvQOak77HlmAhu3oIVn4pfwui63q02H2J+7+4tn1JE1/TgM7jATPN6gyDgGH
	OEUnkoPl7
X-Gm-Gg: AYBFou2GG8ohzQCggB8bbm62vZH13ZKpFY4FAY4cLKKUMFdzMtyRbGwwE+WvYkbrxLa
	LiNTH7Aysf1oECEAOdLy+f7f8eZHsINu0lY4feuch0ZBjzyxtRFWYKG7QROjCT0eVg/mWgFta9S
	1EP0IJY2LGu4ktB9tAYm0/KtcsKHaehkTdVejFxSQg6q9e35YkA7VkvpxhbQ9SVI+Rji+GAjr5s
	bk5GprMmWYSI0QHnUfNwbc0H2qc8L98PRpDkQGRBb/yY+Er2/1zISamqc6d32WQ+YOx/ylGYlYy
	qXRacaRZjQ9x+YHsuALg11FHAGPmVJACgvsjS2ZQvRmew4MY6LKPQBuXNYnH37pfEex5O+eqUXS
	ZHCO14+v1iQNisRImtB8w+4+enbwJT+nBLgw6QH1Ck/6Bu4tGHO3pda2TNhkzGy/DOiVnZoOhLw
	GrCOelKxE6ql5ljN1CiHEtGwiSg03wtP8wwH3EKcbGOwG0XG9iJ3PadeFGBZ+rXgELM+PWSCjol
	pO37E14b8J4jDuCuFqlz3PP2bT1qM9p+WT1BazEz+j8ssAHoDD2J10muJP1v2ht+oWyQ1P5bBka
	iBJKkO9O1khOQg3axLRg4hVsQK7Sml3lpzpCnDujAP5FO3VHKerWflfYjmguJg3YlVPwTjzIpIF
	X1iRv8+QJtw==
X-Received: by 2002:a05:6512:3d06:b0:5bf:a12f:e10a with SMTP id 2adb3069b0e04-5bfd951d34emr3802682e87.3.1793717777523;
        Tue, 03 Nov 2026 06:56:17 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1b1ddb3sm2037346e87.27.2026.11.03.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/2] media: uvcvideo: Automatically handle invalid
 uvc_versions
Date: Tue, 03 Nov 2026 14:56:02 +0000
Message-Id: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAAL26WoC/33MQQ6CMBCF4auQrq2ZtgMWV97DuMB2Cl0oppVGY
 7i7hRUY4vJN5vs/LFLwFNmx+LBAyUff3/ModwUzXXNviXubN5MgK6jhwIdkeKIw/fGGLDmDSqM
 hlsUjkPOvuXa+5N35+OzDe44nMV23O0lwwRUSltYRoKWT6UJ/88Nt34eWTakkF1yINZccuKpLJ
 w9XQESzwdUfrjKvAJXUVjdg7QbHBZd6zTFz2wDVWjlzrcsfPo7jF6nKJ9xmAQAA
X-Change-ID: 20260907-uvc-version-aedefc4384ce
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This series changes the way we handle invalid uvc_versions. Instead of
just failing it will try to continue probing.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5:
- Rebase on media-committers/next (drop patches 1, 2, and 5, already applied)
- Reorder patches so bmVideoStandards removal comes first
- Blame missing bmVideoStandards
- Link to v4: https://lore.kernel.org/r/20260928-uvc-version-v4-0-da0e983fcb95@chromium.org

Changes in v4:
- Handle invalid dwMaxVideoFrameSize.
- ctrl_size -> video_ctrl_size
- CTRL_SIZE->VERSION
- Link to v3: https://lore.kernel.org/r/20260911-uvc-version-v3-0-604328d8a0dd@chromium.org

Changes in v3:
- Move uvc_video_ctrl_size to uvc_video_init()
- Fixes for uvc_warn_once
- Remove bmVideoStandardParsing parsing
- Link to v2: https://lore.kernel.org/r/20260911-uvc-version-v2-0-395f27b0444c@chromium.org

Changes in v2:
- Add quirk for Avermedia
- Change the way the compliance error message is printed and cache
  ctrl_size
- Link to v1: https://lore.kernel.org/r/20260907-uvc-version-v1-1-34e45dfe04de@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Do not parse bmVideoStandards
      media: uvcvideo: Automatically handle cameras with invalid uvc_version

 drivers/media/usb/uvc/uvc_driver.c | 10 +++----
 drivers/media/usb/uvc/uvc_video.c  | 54 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  3 ++-
 3 files changed, 42 insertions(+), 25 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

