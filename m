Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399819;
	b=XW2DQvZJGqspPPpgWkQRtLKmDQS8k9UL0dz1Ja6E/Sr83rjC8QYyEoX9BYigax9EKVo4
	 RJ0+OVsvMw5bTHaxAwNku8EihW/J+PMNb9blUjLqVtA4w0AyYQU35j3J9dTGJ3I7rGwd7
	 RuKbDN8Ri0Bp+f4rHykWTFIA0V7BP9M3CrWtcLoBV7BcAoeO1AzBSe6ctwsJXYQwJoEag
	 l0dpyHaKvfAO54v6tBtQs4YUbfhlWcXdhcGltWad66lZnp4d7+cBpgGTEc2UbmdmoRB07
	 R4Dza8gPV3pPLjvrjlHJ0iZL8YDQO9NSXwy7SV3jXH7gN+4FxjtvmNKxuqy/sWUK4Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ut+9IA7+uboYNcIm8+J4cxAe0hs4W7L46fYN/DTBCtw=;
	b=kM8bc+G3GYQIbzaxSOexwKjkYBniOsz0nEL8HbHtb6CGPORlStHSuvNWoyseo9+Dqxx7
	 4NGqI87dD8et4J2rrFz3x2cmSJgGG4tNuhBZKcvtTLTj4YAlttvPklqFIkkkHFhW8HueA
	 JPCsxtuljxiFcpvratHtQUnwF8K0wW8tPYKGXUBYxxAJqyEP5YPYVaxSZU32ontqNQ6aG
	 GIhjQ/sSaxQxP/eBg7llrjnpap1Y3RemuZsuoCO4XfE/yJxkDHSxBSv36+PIWVUE9KXNU
	 2YSbuSN6WMfPCyZjEIe0UAtIOXSPRcmMZtUN8yYrw/xqPlvLfKKQH3l3vtMaaXLjLBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ3hKdr;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B99606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ3hKdr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso591657f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399818; x=1794004618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ut+9IA7+uboYNcIm8+J4cxAe0hs4W7L46fYN/DTBCtw=;
        b=LeQ3hKdrRiIwJ9WYm2818uTU6CMcLXU7f11PkZfTD8EzLL97P/fnUbqAy9BMBy7E03
         6NPK8ze4FplLeq+oWoDl8osUEVLq7vY0i2zZl33ZWEGfHBt3x7kjE1ug950xIjyIs/r6
         ZQTcm+jnDmaNFUNfpyD6PmhPMVbpEKR8+xqdbUxul3IDlgDYtYOLWIjzZGEoFVG5LllS
         8PvQmfguG0350jsGWGl1AosdCZq9lQTCPAZwKLE0Be979prA6RaajtpJIGRk4Skeq4m9
         EaSqtNO0hDj46Ev/wTqpwvzdMwm9j24iVUDRYeG9stAOQsATLOe+zwS8Y7891vAz745N
         Kl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399818; x=1794004618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ut+9IA7+uboYNcIm8+J4cxAe0hs4W7L46fYN/DTBCtw=;
        b=RYfu2PBzvJizKfP++KQrdffPvqVkv6zxOaTgob91fwknwihLuv6EKbmeyvzoX37TO4
         HTIqL1nQovwhdTqiPqsPpzrwkKCUblGQ7O0kGKcycIH2/euzrN/QLwdiYFbUtqFnDc2U
         wMtQn4ZkvzXrLyLJ+csE+JNYPnGCsp3GJ5IImDD58bIpO+HJYERmzllYw7GnJtfAIHiY
         hoW3syQprJbkJwiAGymiFpOLY8J1Ri3Fh4l+GbhW2KLVx1wWf63Hjy77eRrGnBSOF7kv
         il0dro1pEkjufE45Tq7Teg94dOvBWcjjj63ZCpTMR7AgsD4brO0h2IVVxQfGb9ooHHFz
         HXXA==
X-Forwarded-Encrypted: i=1; AKwUvBxaJuG2SwFW74n1eHXcMb7diS0aQy4wu46FpeXtZYub3kaV/Du2S4IoasuLjILPpXwlMoPRzozVOAnF+PM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPuQOOHNax26bALYp8e3X0h0rtRAxkLuREP1KbEPTgZBwBNmsH
	w2bgC0wfIQm71/iswt/dB3/5kIBRSycnmv1uHFUo2xB9VcZdr/ciFeiq
X-Gm-Gg: AYBFou2lDAnAQU/6lIe6GzWMGUiipYa/vokrsOoRu6sAzt4Phthx+ZkAbUY47pGXW46
	p2Oq99d4TwOVL9rtABzCRHXVPSdNBY3PZ5XoAhE2RCBfxuXPWqUTK79iD+/91NNDCORo/4o8af+
	J0XNWJKml7Damu7FZyFIFMNav8SQ8dj9APJRm8t3tHpFsm5g/4MBEVxNa+1AsxcisSDAQuiYp7H
	kMycKPgF+p2Bqkrp8tWkUvZOBx3WM+dX75EUb3ufiFA/X8j0IYCCaGDOA7FmQY5gLo17GGtTAcV
	R71BFlrICANZ3T+GhfDZv1SpGWSoH7Dlm9nJe55wQN1b1UFJlrqknfORYSOGUwoHujy32RpH1OS
	L6jo8Q1RVNtli+6DLRdEvAVFwKRU72D7ywDb/kK4KVnfBxqHqdB6oN30lvxLPy4JaNypdYKWi0S
	hEvE1cwatxgQOjJ5Q/d3msgkF3c/eGKga/QmfQynBus8R1WXXjJzMElZ/bIdUi25MUQSDvbIKuO
	i4sB3UvZ9V98Q5mXgGQpOzP2PO9xQNEWalMgTkYnHRFDqTzSjMjzhMi9r0zSicY+Y+Nxaj2HWC0
	UjWoh/459SXP3BhEPG2mrXV2LMbR
X-Received: by 2002:a05:6000:2011:b0:48d:f14a:917e with SMTP id ffacd0b85a97d-48e6e2f24f9mr9160016f8f.11.1793399817797;
        Fri, 30 Oct 2026 15:36:57 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:36:57 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 00/15] HID: ft260: add UART and GPIO support, plus I2C fixes
Date: Sat, 31 Oct 2026 00:36:22 +0200
Message-ID: <20261030223637.86907-1-michael.zaidman@gmail.com>
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

Mainline supports only the FT260's I2C bridge. This series adds the
UART/TTY interface and GPIO on top of it, and carries the I2C fixes
made alongside them [1].

Patch 1 is Christina Quast's v4 serial driver, ported to the current
I2C code. Patch 2 holds the fixes it needed on hardware. They stay
two patches, as agreed with Jiri, so that each has its own author.
Patches 7 and 8 add flow control and the modem pins.

The v1 thread:
https://lore.kernel.org/all/20260822213941.98882-1-michael.zaidman@gmail.com/T/#t

As said in the v1 thread, this series lands the current driver first.
The MFD split follows as its own series once this one is in the tree.

Changes in v2:

- Patch 1: the UART config enums are split per field and use the
  UART_ infix from the start (Linus Walleij). Lock, read_lock and
  wait are initialised before hid_hw_open(). Lifetime and TTY fixes
  (reported by Sashiko).
- Patch 2: subject now says what it fixes. FT260_UART_RI_DCD_STATUS
  corrected to 0xE2, as in AN_394 section 4.3. 0xB1 length check and
  wake-up timer re-arm (Sashiko).
- Patch 3: subject drops "on top of UART". linux/bits.h, GENMASK()
  and BIT() for the GPIO masks, FT260_GPIO_MAX renamed (Linus
  Walleij). GPIO shadow, combined direction/value report, uart_mode
  OFF (Sashiko).
- Patch 4: timeout of the last I2C read chunk from its length
  (Sashiko).
- Patch 5: a failed feature report is no longer masked; word stores
  use cpu_to_le16() (Sashiko).
- Patch 6: __func__ is printed once (Sashiko).
- Patch 8: v1 patch 10, Rio Liu's RTS/CTS/DTR/DSR polarity fix, is
  folded in, with Co-developed-by. Error paths of tiocmget and
  tiocmset (Sashiko). The TIOCM ioctls stay; the switch to the
  serial_mctrl_gpio helpers needs serial core changes first, as
  discussed with Linus Walleij.
- Patch 9: subject drops "gpio:". i2c_enable moves to the interface
  that owns the gpiochip, so it changes the mask the gpiochip uses.
- Patch 11: the reset work is flushed on unload, and -ENOMEM does not
  trigger a reset (Sashiko).
- Patches 13 to 15 are new: reject an I2C clock outside 60-3400 kHz,
  return the byte count from the i2c_reset store, and recover a bus
  that a slave holds low.

Testing: two FT260 boards, one in chip mode 0x03 with a 24LC512 and
an FT2232 wired to its UART, one with a 24C02. A pytest suite of 202
tests [2] drives sysfs, the gpiochip, the I2C adapter and the tty. It
ran on 7.3.0-rc4 with this series applied, built with PROVE_LOCKING
and DEBUG_ATOMIC_SLEEP, loading the in-tree module. The second board
was strapped to 0x00, 0x01 and 0x02 in turn; each of the 202 tests
passed in at least one of the three runs, with no lockdep report.
Every patch builds with W=1 without warnings.
checkpatch --strict reports no errors and one warning, for a quoted
kernel log line in patch 15.

[1] https://github.com/MichaelZaidman/hid-ft260
[2] https://github.com/MichaelZaidman/hid-ft260/tree/main/tests

Christina Quast (1):
  HID: ft260: add serial driver

Michael Zaidman (14):
  HID: ft260: uart: fix the serial driver
  HID: ft260: add GPIO support
  HID: ft260: i2c: reduce driver module loading time
  HID: ft260: i2c: silence sysfs store big-numbers
  HID: ft260: i2c: reduce bus-error message severity
  HID: ft260: uart: enable flow control
  HID: ft260: uart: add modem pins control via ioctl
  HID: ft260: group sysfs attrs per HID interface
  HID: ft260: i2c: fix large write transaction failure
  HID: ft260: workaround for TN_189 errata endpoint STALL after
    enumeration
  HID: ft260: i2c: abort in-flight transfers with STOP before reset
  HID: ft260: i2c: reject an I2C clock outside the supported range
  HID: ft260: i2c: fix i2c_reset sysfs store return value
  HID: ft260: i2c: recover a bus held by a slave

 drivers/hid/Kconfig     |   10 +-
 drivers/hid/hid-ft260.c | 2435 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 2175 insertions(+), 270 deletions(-)


base-commit: 720806515cb6921ab05caaa6f470f7054b56385e
-- 
2.43.0

