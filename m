Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244663;
	b=EOL6ov0yawayD2J/nljrf89l1n1BmvQuha31RNiBZG4K7w2fvYbQOYzcccIxPOVFeFRz
	 zsCpLlX6eYBkJpBb0DxS26cwR8AQDyY//PCbi9cENPWHs1367tYXqMq6EtQiOAfABaU+s
	 alRfLPnBSRxHIQOsROAZ117fiSTh8rf//FoDpDVKBboZKGIeleTsX812O2DxFc/+8NfdW
	 DU9on6y4XNk9VSAWqcTBgNDDLXhB/FEPdb2VuXiPsWOeoHjOCVin6X1a9s2cvB0CKkjoG
	 RqprP5krTQlUby86hXOD7PTfhbi0NwIA97rGX3GEqfWB/uy6Vo/m0IIdyeua0WNE7ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N6WTQTQRbYXwQiY0GfL/+h0zie0u4l23EdajHTFVMJI=;
	b=1sn+Tr+cckOHcmNBiwviOsYrzQRBuV8evivlGSvYKX9IuKxbaoozpY4OMSldYtpi26jR
	 buUBnR3V55ITMnQXkfyhkt8afS2Lpd5RhFHAJ7B1fXTrjQkc9oC28K/0nW3W0Fhj/YOqK
	 CRuCeTW+DdTgnjsZ+ELSW1Cjd3qJuKLNBY5XeNCe/eipTzg++7DsP5Wm7yJoyA5BPfF9W
	 nVgCZg+0b/U4RZ+/mnxEsZYmGL+aivQ7pVckRsF+l5AMYCf0PIWECyiaO1Cubo5OPH5ov
	 dFh2P2V90CwAzu7NJPh6RP7XBK04Z9XCzo24IroTYj2ME6rUwn25Ytdh5M/shUvTr6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=md6UCzoF;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1CA606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1CA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=md6UCzoF
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c468bd799ecso157986066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244662; x=1794849462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6WTQTQRbYXwQiY0GfL/+h0zie0u4l23EdajHTFVMJI=;
        b=md6UCzoFKluPISx1fQJzYzVoPNKc/a1LxqOY5Ra9wrIkO+MRkniUEbG3XCJMuvtEvR
         naWUNT4qH04Ifpd7y1SrROqHqYf+ThpVtx+efqADXW1Tx8OkyHTXF1KedfwkctoBYN75
         61hesQqh9C9zxO0pSmwZev+D36ehhXVGjUmUCHNA8hyMeXTwFz6vrgutT31OSb/X+gRM
         slu3SwUIq39mwWMxxdzMgyQpAl3byIuFx77tZ56nSQGMjO4Xys2Jgs0vq50i0oatFRlH
         dmfMARUsITrOMySt0IyYex3RLnzc7arAoxEby/99QK6Y4eWGJfrapP9KcfWydGWf7aGJ
         Vtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244662; x=1794849462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6WTQTQRbYXwQiY0GfL/+h0zie0u4l23EdajHTFVMJI=;
        b=YNVqId2WLaPHLeIIfi7MHvwV+oJ38Dp3H7ju/Sqvz71LI6StNueDDbGXN1CgvuTn6H
         WfXNma4lja+dLoToTHjKCrP1FoqWFRvCI7cgrMMS6p1mcqWbMuljMr+8BnLLAVYpUzP+
         qXiOhG2aiarRGFcTwmraKEJl+yEXj0ul4/HjHr1hptzG4wXK5o7HPoPoshkGlzOZyaU6
         ehPk+YefVtvI0+zk+vrjD+DtPwRA74g1Z7pcs4/ckpfXJVdx88ZYsqiJNFDkRgneXgCH
         HsSq8pJ7GF20+r0t5XnAhRijLJJddXmrqKHjPM4GePWpx7JyiuAH2XS3KgBUi5wrTsLL
         uDDw==
X-Forwarded-Encrypted: i=1; AL+hErG5Ovi4BS8LYWRSSjwNG8NiAwMCaLo4hj+QV8GDx4WKDcK6SsG/YJ7Q75wlzV7ZBV4RQzIvFUheB2W4dh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cbMv2/ea+CENkNRyVwCadk/O74onAyzJgSDQEaLuOW0jJOi8B
	yJsQLSicetkNTJ0G9mZXqjom7lWolQakCaraMgxIRpZgIv/7VxVLwlwo5h9DyyGP
X-Gm-Gg: AYBFou1UU8ZU5EadoFwFuaNeAAnM2c0ZDuKKoRl0R7mrJCFg7dWk2N7YW5FAxDXSelt
	yDKIOnYJVezXrYr6RcMxcFpl8EPhhfN1Hs0SIbI2Q2VwGNVvjn9kcY3mrwX0O76iBzFjGw+bWtV
	92XtAaOKDWL5be9Q+X3gO4NDs3vKDNWnx3Jm/2SLBKntM0S0JFZChyc2cyoVNe3vqBRIs1atbrL
	CIAhn0DwlAVoOa+2zZJiIMI1bOU/UYXMDdIpmndHlmLIBtNIfobbFA3nB1QHzg0FlHREGgVpvQJ
	4+hOPrjQDzpf04oN43Qtiw06NJkbX86cs6uAuVq9p/0GYZ5TCfTPrq2QOoXaKoZvzqeBSLrI8Fr
	UNXkXML/rpxnXXUIPgo4HFo/SC8tWvs1GDQKKpWgvoXcYKtm6bg3z4VoNTgmQ7lD+my3oeoVA+b
	YYphkMAaJUVdIHyqtFK+x3cpAkO+ww85tyEqBajdWA3BmYIBBfsn/6AgnElJN2vf2HhkG3Hqq7r
	5IR4Z4hB5cFLxfUPLs3WcDyDB5v9LOeWD1sk3+jqaooA7DOci+aMmdIMnef966Hxj0qGGqK2Fma
	QkW25zZ/EL1E0RIjJGQC3Y0PMwb3PmiPkZwhtuM+Pa7HJ+KW75j2S89vC5pnEAKwp1aiezxexhc
	slg==
X-Received: by 2002:a17:907:3f1a:b0:c46:7fa4:922b with SMTP id a640c23a62f3a-c504953a0f4mr2383066b.33.1794244661472;
        Mon, 09 Nov 2026 09:17:41 -0800 (PST)
Received: from torstein-desktop.internal ([2a01:799:3a1:9700:9811:d134:cbdf:c22b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c4d6a4af091sm191633866b.50.2026.11.09.09.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:17:40 -0800 (PST)
Sender: Torstein Eide <torsteine@gmail.com>
From: Torstein Eide <torsteine+linux@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] HID: lg-g15: G15 v2 contrast and game-mode LEDs
Date: Mon,  9 Nov 2026 18:17:25 +0100
Message-ID: <20261109171727.2812614-1-torsteine+linux@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series adds two LEDs for the Logitech G15 v2 to hid-lg-g15.

Patch 1 exposes the GamePanel LCD contrast as a g15::lcd_contrast LED.

Patch 2 binds the G15 v2's keyboard device (046D:C226), which is
currently handled by hid-generic, and exposes the Super-key-lock
("Game Mode") state as a read-only g15::game_mode LED. Normal key input
on that device is left to hid-input, with the same
HID_QUIRK_INPUT_PER_APP setup hid-generic uses.

Tested on a Logitech G15 v2, together with lcdproc (g15 driver, hidraw
mode) driving the LCD: the LCD output, the contrast LED and the L1-L5
keys all keep working, and the c226 input devices have the same names
as under hid-generic. Also tested across a suspend/resume cycle.

Changes in v2:
- Drop the framebuffer patch; userspace (lcdproc, libg15) drives the
  LCD through hidraw instead.
- Drop the remove-path patch: hid-core holds driver_input_lock during
  remove(), so raw_event cannot reschedule the work.
- Contrast LED: clamp the brightness before indexing contrast_values[],
  and restore the contrast on resume under g15->mutex.
- Game-mode LED: set HID_QUIRK_INPUT_PER_APP like hid-generic, read the
  initial lock state before registering the LED, and guard the cached
  state with a spinlock so a resume-time GET_REPORT cannot overwrite a
  newer input report.

Torstein Eide (2):
  HID: lg-g15: add LCD contrast LED
  HID: lg-g15: report Super-key-lock state on G15 v2's keyboard
    interface

 drivers/hid/hid-ids.h    |   1 +
 drivers/hid/hid-lg-g15.c | 347 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 343 insertions(+), 5 deletions(-)


base-commit: 2c2fe95ab19b09bef7391e3e5cdf8146d09792b6
-- 
2.53.0

