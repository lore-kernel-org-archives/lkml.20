Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576294;
	b=loEf7PIWqTILy2ctoLbnr6x8qiF3U003UyMplFkgxvDThqVG25IM8xDpomKseC9jYEDI
	 tw+huFFoJsYbt/q5PtNbzVAUmMLmLdUwUaANJYvlIeZKQQonuN7KSuT5ALshUeTvQ3ITc
	 jbaNYOnXynIsuJD6npin+wiNYfDdKkt5n9HxtN6pIhveQfEeh0URk2zrUGhMk9jDSAl2j
	 TKLtV7O8VdaQ6ZGBhbSjWlrKAuth1L3/J0/jmpqvPIh4juMvCLuwiQBXD863Tgb90/2Cj
	 CzXosBbMZgyjOjsjDNJMZpAVShlUdrKbkwXEGmuAb2wqj4DVdABuUao2yoF5u9RyEOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=20q7fyL44IefQuhPWlx1GZf/JmbaLKjuNxOAz7TK1Bo=;
	b=PeaM4jLNwbRqFCb0eoBvQEsoL7VCX+CX6tVNn/rwgDFNihuoVdh3TgX0XT7kP2oqDWhY
	 TDdqsBgU/BWMejqnVUzh9WlZZrSuRxi/280FaFPY+WjA2e87rwQyXLwB03dw5Vr4kaf9N
	 +m6xB07w+DQ17544NlBSMs1aKmgyRweEy20vVCTmQo2y52F53PBiQwhLtmmb0XEDz/0xZ
	 F6QF7IfSFz0DflwfMhdlMrlJ/QbgKn69FONymkwZ4Hlv5O7iYOqWX+TU/ASgY8GpuSaya
	 dGJR3oANAFd+vEI5EGUlrIcIcQRSdjT42/12V0l6MKeyZ0mMusO00E2Yav1+CSthErQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtJ38hN7;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019FC606B552
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019FC606B552
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtJ38hN7
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso193789166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576291; x=1795181091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=20q7fyL44IefQuhPWlx1GZf/JmbaLKjuNxOAz7TK1Bo=;
        b=wtJ38hN7c8113rv+J4rUT1dC8MrzAxD7vaxWDOZ3TTdSK2jznYI7Kkqq68+xrQpKJz
         R/sHrAod4N9AxbJ6IQcukUudRkUP0fBhZfnFFhxCMFzM7leW8ZzGBefhRvVmBLy9/n21
         6Th0Fa3fs+EvBECBDIVH+ifvs6WG6JAbs4pjDR3BeiN0LBxDfjdRS7BYNLAHsZWb9gmY
         qwzqhqs8Y/x6ZR2jvKlg2JwvmMCCUHmNZ7lqL5lVgZMRVkHVRasAulguCQIOxj5tw+1m
         5KZt5K1CdSZyU22QP+ehMDaXvqUbOWVE97O1KRp5IO30QK6tPrCihfHBjHBmqrnPL9q4
         wwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576291; x=1795181091;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20q7fyL44IefQuhPWlx1GZf/JmbaLKjuNxOAz7TK1Bo=;
        b=go0pSUCo66QhKfqraNSsE6Tt932tRJ8xL3DpLDdq95zvRxYe5Pv/wNToj7l/9KFwmD
         UiVcAOFgolpVhUJczBD9ZJCbb+1YWLAwiqihRUUKlgPZmdXYi3EtnbyE7AYvF8TJaxB4
         +ow4XFR8rMUbuhO/Qg9cxtl1GgPIrQLgy/5E/qJOcLShGLppPlUN1Vl2Kq1Q9Io/W7gF
         Dnkt67AenTtXpQ4uxacMpzoCDZ4PatACnl+M04JusFVmbzIHkDtR9ZojLB0YSDZuSt08
         81eYTzUO8xBRW4IT8icqWz7cFKcl0Wim9KcnTYp1w2ajJ4lW7R+XGE/xGdXiub1lKSc6
         1Nog==
X-Forwarded-Encrypted: i=1; AL+hErH390BO8frDSS1T66oilcFqNIWmWdpaCYDUNHfiC0KBaiGJGn8z8hI3lMV3vuhfczSVgtn6c8Qegxioq4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CaU/Ag3VVgvHfXwnlk2iGqWP2M1X3oFB4g9llD9efMNJqv6hR
	n2Wm5L1otXIB4akGViPOfxCIaIhcIdQD1fC4OpDwCPAAG4KSnAWFLP7BakQ354Jz2zazoA==
X-Gm-Gg: AYBFou17DYV60EBsiPSLwnzq/iiIn4TwKBHOkoh9sqWURV7CypARTp1V46jpFyBb4hL
	6VtMm8HiioJq8kE/NyZkNNSvO/h0Ay6baD+VNhYNk6evdzfRwGoYT4Fe7oCZBxXawvZeUxApbzR
	rgDRWaY1Z8E+NxvGBUAwj88DutIE8BxTOGL7TDpfRTkR/r1imJyg3N32yGc00z6pPkykmIAQ9La
	WTpgSMXj7do7AbNwdiB7VHqsxGGPivjtc1WBzeDkyn9vsXfKmcphsCJHeAOUqhcTRKsCCk5Hyya
	uagAkUPh1OjUDHUFuPBTDS/sFUh7FsexF+ajyBL6RsbDl47vyueZZCZHf+wyGadmJTD79j+AveC
	jq8LFAny/JLj/u1niBID8UibKpOcSbjYplSgKj4ck8Py6sIAtkWCLLMcS/MS/ValVkNBnV0Jh8o
	irIyViTumdZMiWVOMkoG+CESirXBeIeZ4LjyOJHUJ+uq/ZV6FSPfMfJSq/V13wxsrM2rWT31XU0
	gqw2h7AMR2rITFCMY2kaKR+0jUftXMIUu5mqM1xtfvHJnLLs4f9ZG0476bX/zyDouraRnGQI13+
	ZcGowAoe9u+1mcXLryC/mUeI4EOjVoIfVXelKLv27J6dARHwTy3CFotfuUzzdsIUrMI4I11spy0
	jbDOw7bU=
X-Received: by 2002:a17:907:72c8:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c509640e213mr207866666b.30.1794576291197;
        Fri, 13 Nov 2026 05:24:51 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:50 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v7 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Fri, 13 Nov 2026 17:24:39 +0400
Message-Id: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QwWrDMAwG4FcpPs9DUmy522nvMXpwYrk1LE2Js
 9BR8u5zCoWQLdDjL9D3I91Ulj5JVu+7m+plTDl15xLcy041J38+ik6hZEVAFiywHoe9BdBDaqX
 X35fgB8naGA+BqAmOQJXVSy8xXe/s56HkU8pD1//cW0acpw/Q/Q+OqEFz7Ti6WBnw/HFsffp6b
 bpWzeBIzyA0I1ZswBr21soaqRYI2g2kKgjhm/MFYarDGjELhHADMTMSTAXskb2YNWKfQWxBnJg
 6IIbo6M85/EAYEWkD4YLEgI14NuUxcYlM0/QLYQlwPxECAAA=
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5147; i=alchark@gmail.com;
 h=from:subject:message-id; bh=3vAzwPDkYxTNwi1y600ys71JIPozJFxUEKDzhpDEevY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR951/gm5FW4ql5f+uZDRHicla7csud7AXEX+1MMN0w8
 ZlwwYLajoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6XTgjw/ELNnuFw3d4sX+siLK0nWdl6lOyc/2n486z8s7mhOrW+zMyTJoa+em
 67ec5S36t888P91ylOvWsxpXfSUrrjuye7HRFnhcA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add named defines for the registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog, and let the watchdog restart the
SoC, which the machine's own restart hook fails to do on WM8950.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v7:
- Rebased onto next-20261112
- Register the restart handler at priority 0, the last resort, so that
  it runs after the machine's own restart hook regardless of
  registration order (thanks Guenter)
- Wait for the reset to assert after arming the watchdog in the restart
  handler, rather than return and let later handlers run (thanks Guenter)
- Link to v6: https://patch.msgid.link/20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com

Changes in v6:
- Dropped the binding patch, which Rob has applied
- Rebased onto next-20261111
- Moved the shared header under include/clocksource (thanks Daniel)
- Pass the watchdog a single register base, and keep the watchdog
  register offsets in its own driver (thanks Daniel)
- Build the watchdog driver in rather than as a module: the timer it
  depends on is always built in, and the driver is tiny (thanks Daniel)
- kfree the correct structure upon aux child release (thanks Daniel)
- Return -ENODEV rather than -ENOMEM if the timer failed to initialize,
  and drop the message on allocation failure (thanks Daniel)
- Unmap the timer registers if its interrupt is missing, so that no
  watchdog gets created on a timer that never started
- Improved code comments and commit messages (thanks Daniel)
- Give the watchdog a default timeout, so that opening the device
  before setting one no longer arms it for the next counter wraparound
- Wait for a pending match register write to settle before rewriting it,
  as the clock event code does
- Honour the nowayout parameter, and disallow unbinding the watchdog,
  which would leave it armed with nothing to ping it
- Added a restart handler, so that reboot works on WM8950
- Link to v5: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com

Changes in v5:
- Make sure the watchdog timeout value is clamped to hardware limits
  before writing it to the registers (thanks Guenter)
- Add a comment about the watchdog match value (deadline) wrapping around
  the U32_MAX boundary, which is expected behavior (thanks Guenter)
- Avoid moving register definitions to the shared header file to reduce
  churn: the watchdog driver gets direct pointers to the two registers it
  uses anyway, so it doesn't have to know all those offsets and bits
- Put the watchdog Kconfig entry with other ARM platforms where it belongs
- Link to v4: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com

Changes in v4:
- Changed the watchdog driver to use auxiliary bus instead of platform
  (thanks Guenter)
- Split out the register definitions into a header file shared between
  the clocksource driver and the watchdog driver
- Replaced -1UL with U32_MAX in watchdog max_heartbeat_ms to make builds
  on non-32bit platforms happier
- Link to v3: https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com

Changes in v3:
- Dropped the DTS patch already applied by Krzysztof
- Rebased onto v6.15-rc5 as requested by Daniel
- Split out the watchdog code into a dedicated platform driver, like
  timer-gxp does (thanks Daniel)
- Link to v2: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com

Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/

---
Alexey Charkov (4):
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
      watchdog: Add support for VIA/WonderMedia SoC watchdog functionality
      watchdog: vt8500: Add a restart handler

 Documentation/watchdog/watchdog-parameters.rst |   7 +
 MAINTAINERS                                    |   2 +
 drivers/clocksource/Kconfig                    |   1 +
 drivers/clocksource/timer-vt8500.c             | 179 +++++++++++++++++++++----
 drivers/watchdog/Kconfig                       |  12 ++
 drivers/watchdog/Makefile                      |   1 +
 drivers/watchdog/vt8500-wdt.c                  | 150 +++++++++++++++++++++
 include/clocksource/vt8500-timer.h             |  22 +++
 8 files changed, 347 insertions(+), 27 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
--  
Alexey Charkov <alchark@gmail.com>

