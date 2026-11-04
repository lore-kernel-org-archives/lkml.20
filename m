Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763646;
	b=O526Ko+tv15dJ7YO1t9idPLkpV4Kq78FBCD/5gszCIKMCmM+2u40fXLZCXMRWUJaeo+f
	 PndgO2TqAwl48Kz+GS9OVnNgGAevqjVVO8NwhAa2G/Cb3vbgJO/k5Kjm+nC/jtDmLohCW
	 uS1suCkOVHDaFPcW/oWCbCRviEzimymWo4u1vws9hKtVwbhEU9seGAh2hlvCdBq0O7FCI
	 4R+35GYhiM96ssWFYlY7El3wGJ/blyTsQBoNTmTupL6DagiKa/jzcBBATfBzvkU/5e14w
	 6gnEyJAMACaAjURJGceeFJy6A0mENWM8A96aFpIFJrQFOCFJldlLloXDYaeMaIaBZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5edVbZiQ1mqFRdESlpRxmkO7WGdfvX23lf/UJ52+Uek=;
	b=CNE2KYJ1ebOPY+Y8gsD+UpKoFmB6bU6cAz79FxyVXq4lUhvarOm8QowUXZVo57toKYlo
	 lS3UH3B93tcCwV/pCmbV5arXVDOxtoGy3GvBrt6Zb/H10nGDxIwjhZF6h0e4pLtYGpTOX
	 mZ3mLKGVR/gbKE1Zl0lZ3ggdpSrw9n8Y8zZLME3mpu8B7mIOi8YqQmzVpWZ0u7l3F3YMW
	 WjC8aEsvPg4VinPGit7y6Fi7uJLm+CgiYgGPS26abIvH9NtrKE9lqNYLigpshT6EaH1tk
	 pn46bK850dPikFU3nKinEbWeqJo5Ncw8981w/IU80HLjE1VMzZula2mka0pz7mI23Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAusLrbr;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25F606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E25F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAusLrbr
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36cedf1bd63so157936eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763645; x=1794368445; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5edVbZiQ1mqFRdESlpRxmkO7WGdfvX23lf/UJ52+Uek=;
        b=uAusLrbr1NVy0QZH0/Kh71jsBm4902YOZ7prNifwX1aXa6Ubs9JKVzbTiD6rAVqBUc
         fMFCsZ0lEG9SNgPGqdcPaTfNFZpNT7+xfNmmCLGvD6FEgAsWFKXD1J3Qe2klxGT84ikl
         /VWUNB24nHR8ytSIdZQprcD58qrFHO2RNSJmQBwetHUhLphTLGC8WAqdRV2bx4XegXC/
         9zvNL6ZBBA2rWOOH5nJbJrnbus0M1utSItLGwzl5mVarlodn3RIoOHZY4zTZbXCh8cxq
         0STJh9lRXCPxuQAycUz7QCthAx/Z3iHxEVNDri7KCDL8k+b+D6oP3MM7ou9qnP4C/R3l
         CqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763645; x=1794368445;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5edVbZiQ1mqFRdESlpRxmkO7WGdfvX23lf/UJ52+Uek=;
        b=Lw6EXHWs0OxPPomEAYoaQ1AikbVPxHyV/9agAykPuKCsZti4VyZLqC0U+Il2mmhOGC
         GT7xomWGC4bOL73xG8K4xsj7Vtuh2vdBY2/E5L5+IR+sW4lgGzXNfjIQxuch7VyGwoky
         khSoD2PpYNf1o/KJ9h1iopVfKJzeze++r+VotHFzlZgr3BE6jUbgzO2Qeb8eqF4ieMP2
         oGOSH4mplHWqD4ivd2mPVwiaJqS0qhqnYr9I6uWi8tDanQMIGJenzg1oLdtgVWvvP9w4
         dBu8R64FtmFI2eLNPIpaTi+vIZtgwF1q7B6fXLilpEd09z9gRs3l1ZmcCKmUrZFJdRR2
         1j2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzs9NE151TMmvfVvahVWbkNGF429eOdSKzgx4+IvV+hGIcwlNvWddkyQpRi1XzyHdkItDFf+3MIbXbE20c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d63U74q1NHlaJ8cAaMgA1ge0+YkBzJ4HA+WIi/E8bLnRpAo9z
	+4ca8Fk2B4WGASF2knN2N8ZYT0Uv9mzXOKB7UMTl1l1DKcs4O+zGwc5z
X-Gm-Gg: AYBFou1UusOLQVJgNkG8rhoqIqAUwiXtFJtVXooWorfg1eUfu86drq8ynciNXbmfbi7
	rI16jw+x2rPeyeiZz+tQLxNEOv4uCOOLIj18kG8GECzPnUpNrXUK4/1y0oOxkginY5cZBZvPpGT
	QMCQBu5Ai2mrj9GZl0TpSm72gbEajI/kAr0ujmVIMskMh5tXXuTIrjLAIU8ci1rRufplQYpQJzY
	tPnyHp2ZDoRP0rzhs2VFtHaFRr/eRp5T8OKVAgqtN4Ml0NMt0UHCUYUKZTznftKCWDeQ0P42d1j
	QDVVaNfWKgYdUXgKClvVBpbQ+coCSUGnVJ9CzVjGcI0fYrOhsFdxAxivUE/VnoOZ/3KcfbBgLf2
	x7GQ8wz/5OY86azJxXkJreazYr8o0EKtUDUtT5ZSS0BQl5J8KI2ePNC/+GZY9SIRxw1sCaEQ1r5
	QUCLGbcHTFNOqsKCkOAa+kv3NVgEwFOTSkfP+oXD47LQyCQ1jUY6L05eMFTHybZ8jkHQJeAdkLD
	ypyd3be2DQBgmHLL/LQUwU8ddcF6JQvkx1vqkAj4kjA2DSQYbKSQcUJpiZGRqW8YNSu2kSFpyUO
	+v9S03HMQrsvCBxtxUmV2JAO7NAYpEOQ697m7TXEZXxwwbFd0B2uz0GAlHI4Orv+zcHg3+CTUBN
	fljoPGiSVZlvUYlbZ0w==
X-Received: by 2002:a05:7023:d0b:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1abcbd01d43mr23800273c88.4.1793763645133;
        Tue, 03 Nov 2026 19:40:45 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:44 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/7] gpiolib: scope-based management and cleanup for
 GPIO descriptor arrays
Date: Tue, 03 Nov 2026 19:40:28 -0800
Message-Id: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAC2p6moC/z2NzQ6CQAwGX4X0bMluQRFPvofhwE+BKrBkF4mE8
 O4umHhpMsl80xUcW2EHt2AFy7M4MYMHOgVQtvnQMErlGUjRRSvSWMTYjGI6KbC2zJjEVUqcp/q
 sIvCr0XItn6P4yH7s3sWTy2nP7EYrbjJ2OV7Oevf+dZ36QyFRlFxVjBqrXia7hN43r9bM96bPp
 QtL00O2bdsXzwaWTr4AAAA=
X-Change-ID: 20261021-b4-gpiolib-free-74d92ea91503
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

This series fixes a GPIO descriptor leak and a fast-path cancellation
bug in gpiod_get_array(), fixes the !CONFIG_OF_GPIO stub for
of_gpio_count() to return -ENOENT instead of 0, introduces
DEFINE_FREE() scope-based cleanup helpers for GPIO descriptors
(gpiod_put and gpiod_put_array), converts gpiod_get_array() to use
them, reworks descriptor array allocation to avoid krealloc(), and
switches the fastpath bitmaps in struct gpio_array to bitmap_zalloc()
and bitmap_free().

In the final patch, each of the three fastpath bitmaps (get_mask,
set_mask, and invert_mask) is allocated with its own bitmap_zalloc()
call rather than packing all three into a single bitmap_zalloc()
allocation. While Andy suggested a single 3x bitmap_zalloc() call to
avoid multiple allocations, slicing one bitmap into three pointers
still requires rounding the bit count up to BITS_PER_LONG and doing
manual unsigned long pointer arithmetic (which would still break if
bitmaps ever gained a header or tail), while still adding a second
allocation and extra bitmap_free() paths on fastpath cancellation and
teardown. Using three separate bitmap_zalloc() calls achieves full
bitmap API abstraction at the cost of three extra slab allocations when
the fastpath is used, and is kept as a separate final patch so the
maintainers can decide whether they prefer the single contiguous
allocation in patch 6/7 or the strict bitmap abstraction in patch 7/7.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Added cover letter for the series.
- Added a patch fixing the !CONFIG_OF_GPIO of_gpio_count() stub to
  return -ENOENT instead of 0, and dropped the count == 0 check in
  gpiod_get_array().
- In patch 6/7, separated array_info assignment from declaration in
  gpio_descs_check_fastpath() immediately before NULL check to preserve
  reverse-christmas-tree order.
- Added patch 7/7 switching fastpath bitmaps in struct gpio_array to
  individual bitmap_zalloc() and bitmap_free() calls per Andy's review
  feedback.
- Link to v1: https://patch.msgid.link/20261021190212.2237804-1-dmitry.torokhov@gmail.com

---
Dmitry Torokhov (7):
      gpiolib: fix GPIO descriptor leak in gpiod_get_array()
      gpiolib: fix fast-path cancellation in gpiod_get_array()
      gpiolib: of: return -ENOENT from of_gpio_count() stub
      gpiolib: add support for scope-based management of GPIO descriptors
      gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
      gpiolib: avoid krealloc() in gpiod_get_array()
      gpiolib: use bitmap_zalloc() for fastpath bitmaps

 drivers/gpio/gpiolib-of.h     |   2 +-
 drivers/gpio/gpiolib.c        | 224 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib.h        |   2 +-
 include/linux/gpio/consumer.h |   4 +
 4 files changed, 134 insertions(+), 98 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261021-b4-gpiolib-free-74d92ea91503

Thanks.

-- 
Dmitry

