Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790372;
	b=RLxLnNoAUH5c5OR9i+bcIwDSDAisE9wHOLhyAkBiXifB/0K8lnikZyll9QRxEp5KLNqE
	 3+7pJ3/7R6M+JZQKhg3OogebiQERJOXpJYnnVGjw2CtJ+UNjN4+WWAQL2XcMR0FlMpzmH
	 v4KBisVawuUXrmMLHdSy3W7lv4Byb/T5ZhwRXcUQ6DpczpQ4TD96nnL8+jdiAKtR/AunY
	 9P90vFJTmXgLr0qNYZE0rv3qI/Gxez1au+H6XQxI09Lzfq0Ue1TSkvlpI2cFYUOb/vpOz
	 j82LyCrJC6Mno0LUopGblDvWM0mhPfhcH6RNUjjkWZ8mm0FYkzoEyBhDmorjzzQccfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
	b=YGPLoiH4NClilh84far3vXIOU6Po4XIMQ7EdlXRfS/SrYUMlvLpDobuYjQ65GJSw3+Yl
	 YkCx5jR3P+jRl23DJvv0Upp1VF519RNi59JtlEBin234OOxQ4GJpWOywd1wW0/j3lHjm2
	 Kbj0A5E5A3Y8DH9IyAcgWu4dAANk66+lYdgTOK8so5bAARm1EnYRnbZ3CDhCDTo6MiWBC
	 xoGb+IhiKR5m7HqF/HPxOmYxq59fVmsbqbbPzkfov8b5R3cwUlEXY8Ip9Iak1KVhfzPet
	 e0EtvDNg72PrYoZrOktnTl6J5tp9Zlhbm9PxkMBhBZZMf5FZF40V3I1QmxsCw5+ORlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dw13DzYr;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9AB606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9AB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dw13DzYr
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-843ea301d60so957162a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790371; x=1793395171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
        b=dw13DzYrYenFb1Aw6eabG9lwOCkwfgxYO1noCm1cGs6zt3beK9qZ7/nz+Qhjd+TEpQ
         KWBMP0at5VLP/r3hrcxHrwVIPg+mBzRjeiz2QOG3eQi0jE+Wn+c51yhFHelZq0n5ZQ6q
         9uU+dc1OCWYhpLrkXZi2CbsCl3CK+6VgaufVYJxyUwRD1D9PZ5JSp9QHN9ymgLvYPGZM
         2Adc5LvLyGjeHe2Q9dhS30GGcNaX6TkADym8UNTV4qTWfh6NCy3GBdUtFjJLSTnacZKY
         jeqnBvsjrdfM4HYJpsFsDpgepO/xjtkGRh5XP+viwr+ArtGkeYo68yJrGQCGr5T+hx5I
         i7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790371; x=1793395171;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
        b=cSJK3As1a4pN+qWCS4IHM9xVdD6Fl7FNKFmJmB87VPs4ZziyvArCCClYPal/4+0gCB
         caxepQBYBNhieEcBWjupc2b1dj3hxEici2xhNYMIqVNdxT3PuCRTdCFNB3tPhHZh9vY2
         KnmQxX9C7wHgauhoumaPJqwwhixqt9U2EbPQXhIJDV92vICzPyjLc5bfHs3TknEVxB+K
         USXYue9FDcjlFvtIBAQqs2ouNU3e/AUsTYmryBdKJM5G8ESpKF9slk1Z2sd7ula6sXPN
         d73o/KCbvdA6u2LM74fXanlQo1HZzjVaI790LjfppfvhlLhun0NqvACsnl2grQsZ6FSN
         yDbQ==
X-Gm-Message-State: AFq9FYJ8cZBK50YdjsQOuOKxbS6H0EFvtsuJ4yQA51EWCti674pssU5j
	RxX7fMXOy+fTzOkOCOqay/G5U4FlthLMNlEBLi7+NSwbwGQZv8W4WSFX
X-Gm-Gg: AYBFou3x1irrEpGU9XRMU6YB7dmyiClEffZ7hA89WKMXz5mxBWX+9uiOs0uu+qGEgxh
	HG+YfPukojVnNrMR1Vt9uVjK+ZE5Eiyx58AHoWUE6QtaRVLjLeqXvALDjCp8NXbz0Lb0OT0R4xx
	cvEkwynPI1sdhTg+B98vGGCOCyhrUUa3H/Aqik0D1KxRztdcavppgrJiIJQtOS9ndau3iOu/UbW
	k0jizv91zD8yS3s6hmK1ZSaQJayTBNs+z/qlCnksc81Dk9pA7joxr4/iF2VlIB+RteBOzULsnwO
	MR5O6TvwOyBzVEoTaC9wPCksm32xdopb+rlz4pz95G3oN+91mI1S8vWWRMZc07lUijOZs8J8G20
	xujqtM18hkIEqKAoD1CaOX6PcDc81IG3kDcp3MTplZuchV4jOZ2l1bo8RiDG1mrBafl0CRmvzHf
	W6VW6bHZvUcHKj67q6afvoqkaSkZd5uEGKxy4rTANrq3pzaCptssz1MQImoyoxwZhJj8EsSwRKS
	xXv09FskszzWAVN5qCR/l8xCGlpO0ksF7K5cDUwEz0Z3a3EvjXXl3lB/dbkE6/4J+TfQpvTZL9Z
	H7nZr28r2hWpzDypmTbkDzvSAWHniNU3dqDwrcgJSNHWA8QOp+hE1O2/bguDR9kGoKQn16CgoVl
	mVjMu0tYMY5meo1907VvYXZxNgrz3WT/3GRXBQiOuVbl1jkQLGQU+L5gfkaH6UdsG/tuz8flKNK
	PyQg==
X-Received: by 2002:a05:6830:44aa:b0:845:3cfe:608 with SMTP id 46e09a7af769-850f7f763b5mr662878a34.0.1792790370828;
        Fri, 23 Oct 2026 14:19:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Fri, 23 Oct 2026 15:19:26 -0600
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WSzW4bMQyEXyXYc7egRImUcup7FDlI/Im3aOLWd
 oIWQd69tIMetkCBvRCrb4Yz0ttyttNm5+X+7m052et23o7PMeRPd4scxvOjrZvGvGTIlCDn9fw
 yn7bLeqBE68s4XVbf/Li+plXqcFG3KhOWwH+czLdfN+mvDx9zsN9MLle964nDdr4cT79v3q/pe
 u6vDf7fJj5YrQycw7LN0b48Po3t+2c5Pi0P7x8+J/v5EkkuH+bLHGdb438IRjIYiEKTZBpbaVD
 VY1BqLVFHLgXHSKXdIoyLHKKA+zsl7K0UpsJjgM4JUGc10lAanYxKNh+N9pQTS/KmTbtBKiJUw
 bNjyDSiXBAEJ/PcU63m3LipFxMtHlYsrhjFJKzdyGZtI5nvqa7uNQH3KVUxlsnduPXBgg6lNWn
 JKzPuKRtpdPfJXQujskYJKc3J4eWS0yRUYfxnQyuTmBxqyb2SIoQ5qCZqyhFMoBp2qmNPVcjKZ
 rVL5EfrOZo0FshdZCIbUayOXfdUSgDxINg7QEi7DvbEUT+kuEkoKTP7mLKnUKRJmg08RZ0aN5R
 nZRNW6MM7VitSEo54Mu9/AE2U8xkEAwAA
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Add an H616 compatible and configure the existing 16550A port type with
the documented FIFO capacity, receive thresholds and automatic flow
control. Preserve the BUSY-safe integer divisor path and keep the UART
gate enabled during termios changes. Attach the existing 8250 DMA path
using single-byte peripheral bursts, with channel acquisition and PIO
fallback handled by the normal startup path.

The patches add the binding, driver configuration and SoC DTS compatible
in that order. Based on next-20261023, which includes the TTY changes and
A733 DMA register-layout updates, with the posted IRQ-safe locking fix [0],
pause-bit fix [1], virt-dma synchronization helper [2], and sun6i channel
lifetime v2 series [3] applied first. The sun6i pause bookkeeping lets an
8250 RX flush account the paused transfer and release its running state,
including when it is flushed before the allocator starts it.

Apply [3] with git am -3 on this base to combine its tx_status() changes
with the intervening NULL-descriptor cleanup.

[0] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[1] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[2] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com
[3] https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Keep PORT_16550A and set the FIFO size, transmit load and capabilities
  during setup, following Andy's review.
- Select H616 setup through the matched platform-data pointer and remove
  the type and DMA burst-size platform-data members.
- Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
  with port locking and runtime PM around register updates. Keep the
  standard half-full FCR default, selecting 128 bytes on H616.
- Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
- Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
  fixes and their prerequisites for DMA enablement.
- Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com

---
James Hilliard (3):
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: identify the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 12 +--
 drivers/tty/serial/8250/8250_dw.c                  | 87 ++++++++++++++++++++--
 3 files changed, 86 insertions(+), 14 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef
prerequisite-patch-id: 9dff51079bc5d3efa29e789a7c3f0488c81f5773
prerequisite-patch-id: ea1a9ffb79d473d7d81611bb7113fc21b63dc73b
prerequisite-patch-id: e4b676f0542956d309df0dd168d7866c05e3965a
prerequisite-patch-id: 502d7ee59c7643e92aa0e7c029ccb37e66bc539d
prerequisite-patch-id: 11000237f90066cfda7f17005010a3041277fabc
prerequisite-patch-id: 3cc8c1b80f1852d96e2b57ec7d09af935e4c413a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

