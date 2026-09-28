Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D144DEC22
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605943; cv=none; b=mwVy70Sgb/nqojfR2muwstdY9viskiwTYIkGPaFwoiuyjYYIgwh6LrXn8ui4cJWEoG/lP3TF3zmABrTwzddTSZ0h+1c7MLEq8F5YaDtKMV9Riw+sbbKVngolu+TAEhvDEKiHiMRoxMDssvvOqLDbRhK1j8M3IuC3MaTHMmvXI8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605943; c=relaxed/simple;
	bh=4xsFsq6UI1uMBaGJq5oiBxB4qejVSgh74V4L6/cQvzY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XQ272sLj0g4JM+YT92eYMHhn5n2Thd4p4DM+krT35LCROZamHGbFFkmVkxnn3Gj/vGccKT8FTBfRF0yBwMArVqoXVdRODLhc/8Nt3djLVw9GVbpQmhy7xvSmaFikywt3OVAfhHNr2Lj6OpThIIV9I+Mw/15zAZR/d1hpDuZbtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oabPQtPd; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oabPQtPd"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f80e3f72so1454327e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605930; x=1791210730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/VflUiPNajJnp0ayxU8tq6LKcc1Q82tg7jHSnkHrkjs=;
        b=oabPQtPdHPZh/N6BPkRoRzoaDx2aXUofRIKFqCZj5MLG1UOlbat/PLIOHth8UqJIBp
         TCoY3e/ArdbcaNQsct0oGgR4GggntoUsJW7hgXrRO2ww2qfAGln2iib5yVKJ7SJNvtWC
         0zuwGLl5ibjxrp5l3kZc4itELt54mHEeQHf2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605930; x=1791210730;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/VflUiPNajJnp0ayxU8tq6LKcc1Q82tg7jHSnkHrkjs=;
        b=zxZTpnxcgB4wK0/9XXiKOr/7pzhvBMXk4w1mCpqBZm9NOOGYRFw/VEM4/NvRzgA5J7
         gwWz0jCizWIie293XCKC44t9s8bYBrnz+db8uhEeGMbDcYF+AWmxGfKIU0cNQ6RLHWLb
         zXukeRRh3KM/D4z0bE1vwjzkGZHo67rk83di6gtyuEFUDU96BmleOaDXhPXfMgaUwaOX
         b/s19t+SfXtnrEHKfWxu3Ym/sF/uX4zH9WiLcljs4RuOhYEKvAhaIJHfmNDIWhTzE52c
         jt2FkLFGHjLR8r2xjHykfVFgZ/TCdqxl/N2OjM63cUR66yn7J6ZH6jEtdQIBjpbA/FDl
         J61A==
X-Forwarded-Encrypted: i=1; AKwUvByNf6Z82rnG0PcxEfm1+2Kx+RqIGyOLMv/2Z09j7HbiWxASrz8FJllkFlU6zU//qRgCQ41IHzkba1vFd9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGYhIwCvBgCu7pt967dE1j42LC9y4gEeI72NDcXb5KeT4M8Pg4
	M6FhmrsXu9urDgboq470uFT/EGK78ImA1GpH7JtG/G+ZNLjr4N9Q7jo8xuXBl5/lahYKJeuGSCz
	c9DQ=
X-Gm-Gg: AYBFou3/R6HaigfMx2S0Q/OPA6JdQKfzg6zgGEP57zJDCWWr9mP/yTINrS5OVIyNilY
	zklu9wla96UpGM+DTImRtLZFJ8YbIhTdwGLNqHItF9hyhQMvKuWkmdsP9hNh4fDxCIabC8R5Wyc
	e9B0SqjmDI2JYDBUgSwN6Vk3APJ4jDbDz6uhvBoCqUOO9Fe38tKVHZkkazKRAnM1Br4+FNnOEx8
	ecK+DS9YNPhCQs9B8LHYKUq4yMvxbKoquLSE8K5LQSUB1l7XORobMFBNhmueBXJcvmqUNZ9CXJP
	l8UP40NmXqnHFlLGngFntkXQlgfcNJ2JiESKJJmRqGg9X5h3tV9kCsUii3O7exCFKy+U0uflkVB
	+M5m8NyPiDgvF0kLCwfqK9zjfHz4y9PITPKh5007O/OVnhGd74XX5uT17aiNmptzjPHkuHEjUIN
	5jQjhZJ1cpkOgESII0smYlO0WuP6diKkkOsHnOuSxjuCeXxBDz+b0pvD1Ru1LkZKR07YSGDVraN
	lhrqWZfdQUAhdKRPNP7pjmJ6I+aT4Z2bIvP1QaYMcOxJ3hsBg==
X-Received: by 2002:ac2:4646:0:b0:5b6:67b3:9f74 with SMTP id 2adb3069b0e04-5b8df0d4463mr3705125e87.5.1790605930461;
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/5] media: uvcvideo: Automatically handle invalid
 uvc_versions
Date: Mon, 28 Sep 2026 14:31:59 +0000
Message-Id: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGB6umoC/33MTQ6CMBCG4auQrq2ZtsOfK+9hXGA7hS4A00qjI
 dzdwkoNcflN5nlnFsg7CuyUzcxTdMGNQxp4yJjumqEl7kzaTIIsoIaST1HzSH794w0ZshpVhZp
 YEndP1j232uWadufCY/SvLR7Fet3vRMEFV0iYG0uAhs6682Pvpv44+patqSg/uBDfXHLgqs6tL
 G+AiHqHqz9cJV4AKlmZqgFjfviyLG8EGPfBJwEAAA==
X-Change-ID: 20260907-uvc-version-aedefc4384ce
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

This series changes the way we handle invalid uvc_versions. Instead of
just failing it will try to continue probing.

Now that we are at it fix the way we handle device warnings.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
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
Ricardo Ribalda (5):
      media: uvcvideo: uvc_warn should warn not info
      media: uvcvideo: Use uvc_warn_once when it make sense
      media: uvcvideo: Automatically handle cameras with invalid uvc_version
      media: uvcvideo: Do not parse bmVideoStandards
      media: uvcvideo: Force UVC version for Avermedia GC515

 drivers/media/usb/uvc/uvc_driver.c | 17 ++++++++----
 drivers/media/usb/uvc/uvc_video.c  | 56 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  6 ++--
 3 files changed, 52 insertions(+), 27 deletions(-)
---
base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

