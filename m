Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497619;
	b=LGYeUjNeaH23OXJiQtblDIClxGjwEywWN4SLYygHhH8Rfy8uviqSZW0q+GcsR2zmOr6S
	 TuyRepBq+5xkifehl2iBHjO9g9mznbEPrgF3mTn59uxRYKNm9VomJEpHr0fYYD/wDaWHi
	 /GcqwWa1FIv5oOY1HPMl3LFrg7+EmbtBLuQ14LnZQT88fLSfR94ekUo9HkJTSD/5vDMxl
	 KjrGujSNwo6EQPEypxH93/MIecvs6KWZ5t/LNhfEVscsK60GMj3wIz7t9sDKwnZqQ/lOh
	 wpEFuvCd+pdY9hAiueSNaZrAb7FSr/zD2O1Wns6psnvGmBG4IOMlbpd/pZSdoCXi4Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z3BbB7EvRhTQxsA7XhxXSS2tjjNrAp5pTR6enOtvXX4=;
	b=jn52KcnFay/fPfqjAUDaNNXoAQHFfU6v1SV2vlHsEoRl0t9ADvjIKw1Jo1Jei4o7Ma2H
	 Ep4pbzaouZIKX0z4b8gEt1rqDW+P9UVroI+fxUb3rj2zwMbmFwE36TUlqQSvAm/G/oipc
	 0I21oH4SU1vBSexsNetp8sPqHtq3d1qZ3p5z0aWvd9avwU/1To7WkUhni1WkTg7b5ezd+
	 3HfyMazsff2hBKEhrlaTP2hLOYE3RiM1QqYzHfTNyHUwUuDfcXajc4VNzQtOD+n/wfCWV
	 Vfr+hu1JPoRrZdmv5CzCtYdT/TZ0F68Cd7dyk6lNUURjvvJ29/So41F5++g3ZzUcIXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blkGwaC4;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EB5606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EB5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blkGwaC4
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so48629285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497617; x=1795102417; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z3BbB7EvRhTQxsA7XhxXSS2tjjNrAp5pTR6enOtvXX4=;
        b=blkGwaC45pAUAFc/Wlj1uixQFN4RUlHtDjh9yZVXAuD4P2MKVCs57p1aE+XgBXNRhk
         AfNZDi226a4w/oOXHZa7dPbHDJ6oe61N/VmwylWp2RZkFqr1bOPPztXtS7Hyamburovc
         ViUDrACCcXvOjXXdZoqe0oUjFxYWn6hIKblLYJC4RklKszf5ZlVz+1SBuJ7jo+GiNezP
         Fv6RFXBkBeHqBU7zV7Q2Ov1qwlh3FmKI+Xb/R+puSpVVUOyQcZnytsBZQYoSrnM+zjEx
         rgXSxgNPLuugdYJhPRY3mTS7i/xFC5pLRnKwerU+HnqV2Kc1jBUTSsZsApY6SBp+7Are
         YX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497617; x=1795102417;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3BbB7EvRhTQxsA7XhxXSS2tjjNrAp5pTR6enOtvXX4=;
        b=M5wuo5u7+Tiq1nejC8ppsVJEk0Nnj81eDtgXlRFCTDfknYHvOMlh41Z6dBglM5m4Om
         qAKBcUXIxc4lVlL87DUqUZY5JH0/Kv2KkgUM1Ps53MtZ0ryV0lQ0b6k+UpeDYL6BiWrK
         xxD23D2AkjUednfZUiEScJH7NM2uHmiWg0fABuyqhds+42q3XbSevuECrZP3xJk/fDtV
         utHnUo0xRu/zslPFXoMYaHUBOhsYviiQf6juTgkhny/4NpcG2DuxmDi2ygPET3alqoX8
         unVgwH0rfCiJ8LbBV2caA+gnjU8pJ0JqLRzRz8gKmMCF4GcM+YvAY/joDjgGjCGWE+xS
         Y71A==
X-Forwarded-Encrypted: i=1; AL+hErFrHLSRJ/K1mkjzPd4lr2yf6OliD77ztjMtjOgVUlFs1x1PZ+dOLb4v+e9ewW6vwZdy8KVzTVLzZWo99f0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Db7CqHhodQXalsBT5IGxuAbQ0Y1WsFF7IuKaXzYI2U3VyuljL
	3zDJLRIYRv7rn0tXC977giaFw2HTJfwISBoiTd5IdNoxEBeXfuz5Zgrk
X-Gm-Gg: AYBFou3OJukz3H9sOCCeDTd8AOFp5OSK533P9msT2elHMaAJFk4PWR85C5KzW5WSxUj
	kgl4p2QdEOO2u5H4xGw3+H2tt9QNXLX4AeVITUo5SsiAHG74ctXYYhz36LT8guq5UWKWAcDZTa/
	/6s2DptTc5tMACItLz3LXGwqfH5t14c33iFAe2POwFUD0iVkDr5qrGZZbMJ2hazPFnamO61lAoP
	Ssse524cIqiR+mldvXxrkQUDgdhtpp7wwXPkYxBon28M1jQLesWhUi6d47k9oo5lG5I/g3shocF
	nWDDmvWBM+yaxSchRTUr6T9xoq7xFxIEBJJwdLU3PURYFUk5kkAb2KagQsHCznRAUcI09mTupn+
	DtZivuxFLmo1iSYT5IOR1eSIWoTtWDKjoWQszahABC8A4KeGPadRw/RycqVkeZcTAk5G/hELC7f
	ItoYpjMXU8drRQHlwwnE+dyzJs0p0mWke8ZwitKpIaswJ9EwMxh2E7E/PsERJUYmz6fxA2hkx0/
	r3hlZcsTktLvaTBLAG8J2EH1HPA0xvjm7pTRYQmeD8+8zx0Fb4du5vOWPOAQwyikt7266fhmS7g
	dTt/MfS7PD6awAlriJZz+AZ806/q0zKG4mgqXibMFKtslMYLbqJS7xiNelabEKiZcqN7HfFLOHT
	Je5Kh4g==
X-Received: by 2002:a05:600c:4f4a:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ba0939726dmr133509675e9.26.1794497616817;
        Thu, 12 Nov 2026 07:33:36 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:34 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/6] serial: vt8500: Clean up the probe using devm and
 new serial core helpers
Date: Thu, 12 Nov 2026 19:33:08 +0400
Message-Id: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw6CMBRFt0I69pm2iHxG7sMwKO0DnuGXFhoNY
 e+2uADv7CT33Lszh5bQsSrZmUVPjuYpgLwkTPdq6hDIBGaSy7sIAb8WGecQNTWAHlBN2wKm1WW
 eCjQm5yy4i8WW3ufus/6x25oX6jWOxUZPbp3t5zz2Ivb+fXgBHJo0zcqbkllb5I9uVDRc9Tyy+
 jiOL5E4i57MAAAA
X-Change-ID: 20261111-vt8500-serial-cleanup-dfc9731edd70
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=alchark@gmail.com;
 h=from:subject:message-id; bh=8PpJS3y5hC3pEkcD/IutXHMoQpc5qWIJgmCmvXikxks=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veP5PV5iUoGy76ensRUHhHWvxfbKKS60yGSMN3S0+
 yPpO0WnYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKkWSWb4K9rzrGPTod57hzf3xLrv1/JYef1olm7KDG2OshviDyY5RzH8My6PCQ3
 fvbBfNFEw8l5M7xaxBJclqx+6nl57QO/apsRwDgA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The driver has been carrying legacy vestiges in the form of a bitmask and
a local array to track which ports should be numbered which, both of them
not really needed anymore with DT aliases and existing in-core tracking.

Remove them altogether to simplify the driver and get rid of leaks Sashiko
found. While here, also convert the clock handling to use the resource
managed API, and propagate errors from uart_add_one_port().

This hinges upon two new reusable helpers in the serial core which allow
getting the console port for a given line number per driver, and another
one to auto-assign line numbers for which drivers currently keep an
assortment of local accounting boilerplate (some with locking and leaking
issues, such as vt8500 to date).

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Added a core helper to get the console port for a given line number per driver
- Added UART_LINE_AUTO support for automatic line number assignment when no OF
  alias is provided
- Link to v1: https://patch.msgid.link/20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com

---
Alexey Charkov (6):
      serial: core: Add uart_console_port()
      serial: core: Allocate a free line for UART_LINE_AUTO ports
      serial: vt8500: Look up console ports with uart_console_port()
      serial: vt8500: Drop the port index bitmap
      serial: vt8500: Use devm_clk_get_enabled()
      serial: vt8500: Handle uart_add_one_port() failure

 drivers/tty/serial/serial_core.c   | 89 +++++++++++++++++++++++++++++++++++++-
 drivers/tty/serial/vt8500_serial.c | 89 +++++++++-----------------------------
 include/linux/serial_core.h        |  5 +++
 3 files changed, 112 insertions(+), 71 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-vt8500-serial-cleanup-dfc9731edd70

Best regards,
--  
Alexey Charkov <alchark@gmail.com>

