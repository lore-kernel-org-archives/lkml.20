Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF74EB84E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612160; cv=pass; b=iAItcX8KuuGk7SrJhxdIt7UBpKVGLz9r9W8/HvexJ3tC57wspDrV9MHhNQAkDGTROqsC4+R9H0Ex5MTQAdo2+OIhy2uC9hXXcmBAldpZwLkBkNPhkDjPhykPqWkxOnkeACY1Bk5gH49GA6rAM/0AnXZ5QuV0CzAN3DOCg1m29uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612160; c=relaxed/simple;
	bh=5zhxTTDmIVJyF7gRnQGI1x1uORVwq6Xhxto6tH0D/wQ=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=l992z6uD1eC5dP3eljamBwdIQeEtCTgcd51oIKCUh8rRy0qFwjrPFKFaff+JF0U5W+HYDzniCCAfa6izDTgho/lVHMx/s9/fZgUC6fp869TWLgomToz9YcQaW88racO67m9HjW3xarY9zYul2tbtOBdiprlWnT/4nan5ZVPw+e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlOhyslV; arc=pass smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlOhyslV"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4c1e3be1093so1323649b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612145; cv=none;
        d=google.com; s=arc-20260327;
        b=adCs7J9B3KXkNaP9ViuCVyqhkcgCedWVE2Rw/p/AwVwmi/dN/FfpBGAMF6raQk3iyY
         XHwJB+uEcqwrsQhL/I5i38/eniQzS2XsMtrsnTEBmIAQJA87UgGh+dF5D/IVjOBMc6pP
         wbv9K/sldgwtlaP3NIMsV+slQMSbRhR1B1at9bx+uBKPlAhYfWusGW1bzs45KVFr6qlG
         IIbtTa6xjGB1f9kbRbxHT2gYTfVzAMhZvOWlGJMklfkdOTDfbj9LBjPHeBJfUVlcmkk4
         GASnELGH8HU6K51oYTZnqHzPQ/bMXP4PzsDt/MJz3Wh35nbUTvYAPb+m9C8H5KK53y8W
         uomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=0A5INQy7dX8LBqGciPLMu7YdS8AMK7M47XwobBkMymc=;
        fh=okYkAfqpbrinrAE3Ra6iQ+ubbZ/JWLbzTDrYah8Ld0A=;
        b=Z1GWnwxwxlrCUxGk9qe1+w3jNhM9ldzhlEMhpuZBcMtncLgW2XFlv6FNkKPINQc4uV
         7w+zaMioTVt0T+MNCJoFe0ozunMFEYoy0IDLcdC8d6GxQOUGtChbmhq3qPoUBvarhvjT
         Yd3+UJhALBHy6VgCjll5sehynSnm8i6v7+MSzC3FmNJyvzNLiMZlvoM2/E2rZR4pERHF
         hJydw2kbKnrcQfZWMI9HHFbpQ9wBOWLDoZ3sEVU/qdaswU72/xjnX5VUDZoOz0APqlfs
         LUwqray31RLZw7Fsjweca0EKgF6QMUhvh4fhirUHyvF9PoA4y+zXBVh24YxO3Fh2xMbj
         RFNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612145; x=1791216945; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0A5INQy7dX8LBqGciPLMu7YdS8AMK7M47XwobBkMymc=;
        b=ZlOhyslVUrlWymcuC/MqPbxr4onRVzChOjkIPIgTGWjevHlLxpftjx9So4kGgay9TJ
         I1e0qyo36WrHA7CrVVzULjLmP41bpz1dbXrPO3oH3v3nCeEwlpJ7ctpgOKwNry3cP4lm
         EucllAX1KO++yYuDTC5kpHW/nv+i5kyZ3ssIavSSPgraGgJeo4XW8jWJULZv46eIRI2P
         c/lAhgZ+rQSD4Pr2aLFtxo+JiIQ5pxA5huBRQLGhn8L3iOOx+1fMpm8aDk7Xj6du4W4G
         c51aMVXxbAszP4ySV1HTYxr2bQhKi3c7KWKZ8oKF5ZPIcL4T9C8fbyWZPwKQKiIW4WBm
         qHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612145; x=1791216945;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0A5INQy7dX8LBqGciPLMu7YdS8AMK7M47XwobBkMymc=;
        b=bwFdD6DhLI5CRy4yYoxxbP8U0WOKLb8VzqlU9UvNyLzDT9vxEgO3J4SdTfOMuqMfhL
         UW9cvra4UzBL2vT1eqaTBLh+2P/YtElwH4xnYqjcQZBFAuYf6w3lByhuH4UoSaljm+tV
         /n3qb64GL5qVGOfy2N2SKugYn7uWYXAx29dnTCVTszYCvKH4pywCnehuN3+HaylVTJ4x
         Cqje641jsPEy52lx5uwBYyHAwoRvFB36edQIVKn3KeYMZwUtQWP2ltM2jw21AsD9yECt
         9i1701L+WiEhnN9tBWGhIldn1d0tEUxBdI/aX2CDbJFEL0b2SJYCXwP5wryIfwDukxus
         s5Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwvwapZQC/OjVPkScbm3mQsXuzRtnVDioh6+NVr1IYIYj3qeuvIOvP0rMzFEXAGlKAZZFE+xrXKB/qEr2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mqlxkJ6xu0WQR6lP4oYS2p6Q8WTVQVGaxxkbjTK4Xu3ATKfOqd
	gA2hmrnfoS/5VxixBGJiW/II4n5fECwROpPIMUF2QlyAPBh+mUXAqktEOY8muPJ/5GCNcNqytuv
	FGCBC9An/d7PoMVyVZ3gF/j6cYEyMrZJSmF/z3ugiFWFkUyk=
X-Gm-Gg: AYBFou0Blwqhqc0aEmLL6P3BXC+KKxFw2OYr/ENV5WskU6Bf2PeZyD+KHqvuUN0u6l9
	UZAGt7EO/osRJc5ArgmcJiArNKeJxyf5qqn2CDAeCBfckAF5gYuzTcvUOoKSokQF81PbBZTPnxz
	1xRDzT12YnFZhDc9ZXtgVonOpqKyefS/6NCHv/SHTfTVM9UBjzdy3OAeOV/k0vwjegoU3lIIgaG
	tGeg3v0zfMprSG3iZEDY5e6G3lYgAa4qCcRPfqge7EughQwLi4rGFJQR25FCtRSN+ntdVKTS871
	XBcJLZikn2qRW0Df5b9pEzLa1aztUoNHiiCAkFXP2mo1LOC+im7OSfQx0fV4rxWfPggkAf7Thwz
	n6+Q6PkVofA==
X-Received: by 2002:a05:6808:198e:b0:4d6:90f4:48ba with SMTP id
 5614622812f47-4d72ac45eacmr14395634b6e.44.1790612144676; Mon, 28 Sep 2026
 09:15:44 -0700 (PDT)
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 18:15:44 +0200
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 18:15:44 +0200
From: Aveline Noir <jm5905938@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Sep 2026 18:15:44 +0200
X-Gm-Features: AclHuK9iPdog26wVV94AzoDOB6Ecnbo54mNzfsBz7HWPWdsxEbSKehYuy5Lt6Js
Message-ID: <CANOyQmGfmBdTRaEamVdGuMBToVLeXGi6qLrnX=xkA9acsL9TSQ@mail.gmail.com>
Subject: [PATCH v2 0/2] HID: picolcd: Fix output-request and framebuffer locking
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+912222e4cb82423535fa@syzkaller.appspotmail.com, bigeasy@linutronix.de, 
	linux-rt-devel@lists.linux.dev, deller@gmx.de, simona@ffwll.ch, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

This series fixes two PicoLCD locking problems. The first moves output
requests into sleepable context and serializes LED state updates. The
second breaks the last-close/deferred-worker lock dependency using a
private framebuffer update mutex.

The first patch was tested separately with the original syzkaller C
reproducer and bounded concurrent sysfs/UHID-destroy workloads on
PREEMPT_RT. The complete series additionally passed repeated framebuffer
open/write/close and persistent-open framebuffer tests. Pre-fix modules
reproduced the respective failures. Physical hardware, prolonged stress
and suspend/resume have not been tested.

Patch 2's Fixes tag identifies the fbdev change that began draining
deferred work from fb_release() while holding info->lock. Patch 1's Fixes
tag was checked against the upstream transport-conversion diff.

Changes in v2:
- Address Sebastian Andrzej Siewior's feedback: clarify that the issue
  is not specific to PREEMPT_RT and identify picolcd_data::lock as a
  spinlock_t in patch 1. The code changes are identical to v1.

Aveline Noir (2):
  HID: picolcd: Move output requests out of spinlocked sections
  HID: picolcd: Avoid framebuffer last-close deadlock

 drivers/hid/hid-picolcd.h           |  4 +++
 drivers/hid/hid-picolcd_backlight.c |  7 ++--
 drivers/hid/hid-picolcd_core.c      | 46 +++++++++++++++---------
 drivers/hid/hid-picolcd_fb.c        | 56 ++++++++++++++++++-----------
 drivers/hid/hid-picolcd_lcd.c       |  7 ++--
 drivers/hid/hid-picolcd_leds.c      | 31 +++++++++-------
 6 files changed, 93 insertions(+), 58 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0
