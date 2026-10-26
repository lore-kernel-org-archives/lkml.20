Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021697;
	b=zYRZrkO4izuil3zRg5nryU4mO/I9NzC4NU+xiczDIP7j1z64Peowq25MlVtgzSzhCV08
	 2r1YiRsoAoTgBekEBeoDjU/TYjN0VVuSZfjqoUOBjmzJPeeAyzhO731QFxCMDFCCSOpJt
	 euKcmNEkqcT1BQ8K6F0Z5JvXHjSQmrnsjcZtdFxQlSVbBHwp1qxbNoDXyCkopHdbWjNUU
	 +7lCrz3ycr/YJuXG++GzbxQh3YHQyGb9/h+eaztFRUutm8CeioJy6B0cdHhDO/c628cAQ
	 DL1pqfq6lp8iKxS6epS21xS8drY8oRIXPK7dstApfGunnX4J3I/1JnUKfCGpmiX4ykA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ph6mKQKaPm1MUpvQa59GZ4TL6tR4lI7/GVACd9ay4HE=;
	b=3e7KKcCKUIOgB7z+a25ylY7UWPNfpLBmM5OffeDR/IoTq3zA9ERJKitbS4yua2MBtzRi
	 R3SgwqPb0PFvjx4m3Pun958LxoI0CszPBv61/23bbulE6bFz6QbwU2qIRl78WlSdW8d3Z
	 1g3MCLSnSlGChblD5jN2+U+U4tPcQcBp1TxGr1/bTMknnJuGXwr59NsLGII+dxnXk+dmV
	 Rx8CGdvFj6PYoSLBwlZt+vJze4pIZl4rInFZJtjVs7uiYVg8sBolOcQtozS3gbQpg+GEN
	 Lg20EZNto6BBzC+OY2JwUT1PukLpaf0gnOSaiDfX1wG97+6h95W1VVpBTRR+3qWgNdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rJyscda+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF232606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF232606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rJyscda+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so3626208c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021696; x=1793626496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ph6mKQKaPm1MUpvQa59GZ4TL6tR4lI7/GVACd9ay4HE=;
        b=rJyscda+z9obu97kIzHawsUy4OQ37Kt5wQIp6GV3hsUEq4mF5Y//dSjpDzxAO2LNF5
         OQEXv8wGes7zrliRrBbOw2aR5QKPVC6mZIlix03Di10jCCg1ICusv28ERBE3KhbI1WJC
         poiCLe1JjdbB1N0hko/hvh+92FLosIt6ZHWTmPTygwBY/ipiNr3sKg/bDkOoNMeioisG
         0E6OBcVC6aHQaglif/MuD7BzkncW5W4s+pogvFGaWNzLxnjO39D+Q6laCpodKjE8u6/Y
         g3GM/5JPYeO2uApGxuOEsqWnL2h7LqJO9V38x57aKpAxWqhSBkF0nPgloZlrD83jrzld
         LNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021696; x=1793626496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ph6mKQKaPm1MUpvQa59GZ4TL6tR4lI7/GVACd9ay4HE=;
        b=uplnsTtQphYM+JRjLXUsEvJs6copzvCl2v52e6LpIBK/vfr7eJQi/LVgI8F2gd9TKS
         zWByIDV+i3OqlB838x8alPWUjDsGlap7DbbjUNDFnt7moesJOjAsyM4xVq/FBNJTHUNC
         hxAzpAxxLyn6SE2oF7mUJfwdlL6zDJILh6gfKdiBBDZwyYtBN6sw00fp0qYOsy63mZTE
         05izJmhI3kRQOFhNS1GWnGsKf3N54E4ihL+9HYvgRz9F2Gi4oGMmcvcRQr6/vQbK+9zc
         ruzEmQDXpVPvPUpjKtiPpRWP+XxW8NAkbPZUmKYBkcXh2caJLJNir3MwN5ZPhVQ3Xezg
         Nr2Q==
X-Forwarded-Encrypted: i=1; AKwUvByGayjp28YGCO3zYJ3mAoOcKwPXwePNvs1SCsxg8CkqSuTj87VeMA91vcSJbZEhH4jflshUG+mI8N84c4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzulGsq5Yey9XGEz4dovugqPgypvRsCCyW97kZZkFAbB0aN/hR
	EbYqwVsn0HdhrwBQVWfq77cApQtpOo6hNt1ycqEGVD87/3mAanfpCIbKkdLYBUsNLSM=
X-Gm-Gg: AYBFou24NGn+qTqrNPjVROxeudYzhhXrS/3UJ+anbKz5rYpIIWvxC7Tj0oCS6M4vgQ9
	bOyNxPSfw9eQH8nMH4g2GoIXJveCg/0JON+k3M5qUCDgBo/XBz5dr1t9Cd4toHV+nDsJ07m4nw1
	gE2nD3agHl4TZM93/YkWie/wfhUx/v1CGLKZZRF2J1h+9Q3fqh1+ZzcJijVsGD1xUfhmD0ge0yY
	bzcIdTdiHeaopjK2IH1/i3szOtO9whi2QBtmPP0GIxEH/ihuLYvMcygi9EZVL0/Dn692VrrLzs9
	OpLxYMNsTultVYVQMK2pO6ieXkG8RZIvZXs0cWND3QOYcbGlKTwAQcjJFTwTy2R7FzVGEahbyUo
	RrnQYSbIgwTiEDdyTHspYGwasK4GUrfriq+5Fvn+l61CDT5jxg1/HL7l37M5ZJbRkKJGqX4vWQ7
	98d2tltv5CUZfG/uuwnH00M0sDqSrD16YSNSSsSmGHLnLRRzw1yCKRhNzEIiwnq9m3+wRN+W+TM
	XwLpa1eKOt98wJl4fUW5WVAus2PBpWw+JuDD4Y7c4E/hAOL1vLdzNQzNOVZm4LIVp4=
X-Received: by 2002:a05:701b:2301:b0:138:30b1:4c00 with SMTP id a92af1059eb24-199290fe43bmr8991827c88.3.1793021695702;
        Mon, 26 Oct 2026 06:34:55 -0700 (PDT)
Received: from localhost.localdomain ([154.17.21.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm33014470eec.28.2026.10.26.06.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:34:55 -0700 (PDT)
From: ZeroNinEX <zwq939681378@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: quirks: Skip device qualifier for BEITONG BTP-PG01A
Date: Mon, 26 Oct 2026 21:34:48 +0800
Message-ID: <20261026133448.10185-1-zwq939681378@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The BEITONG BTP-PG01A wireless controller dongle initially enumerates as
4131:800c. Device qualifier requests fail with -EPIPE, followed by
failures to read the configuration descriptor. After port recovery,
the dongle can enumerate as 045e:028e with only two interfaces, leaving
the vendor configuration software unusable in a Windows guest.

Add USB_QUIRK_DEVICE_QUALIFIER for 4131:800c to skip device qualifier
requests. The dongle then enumerates as 20bc:5162 with five interfaces,
including three HID interfaces, and the vendor software works through
USB passthrough to a Windows VM.

Tested both usbcore.quirks=4131:800c:i and the built-in entry on an xHCI
host. The patched kernel was tested without a dynamic usbcore.quirks
entry. The configuration-request size quirk alone did not resolve the
enumeration failure.

Signed-off-by: ZeroNinEX <zwq939681378@gmail.com>
---
Tested the built-in entry with kernel 7.3.0-pg01a+ on an xHCI host through
the original hub chain, with no dynamic usbcore.quirks entry. The dongle
enumerated as 20bc:5162 with a 146-byte configuration and five interfaces,
including three HID interfaces. The submitter also confirmed successful
USB passthrough to a Windows VM and use of the vendor software. Secure
Boot remained enabled using the host's existing enrolled MOK.

The changed source file compiled without warnings with W=1 using both
x86_64_defconfig and the host's USB module configuration. The full
host-configured kernel and Debian packages also built successfully with
debug information disabled.

The available usbmon capture covers the unsuccessful configuration-request
size quirk experiment. No capture of the successful path or cold-replug
trial count is available.

AI assistance: OpenAI GPT helped analyze the original enumeration problem.
Codex used the supplied handoff and USB traces to check the upstream code,
prepare the device-table entry, and draft this commit message and workflow.
The submitter performed the hardware experiments and confirmed the VM and
vendor-software tests. Codex collected the running kernel, boot parameters
and cached USB descriptors locally after the static-patch test.

 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index a4bcbe9c9..c01c5cfe1 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -615,6 +615,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* GameSir G7 SE */
 	{ USB_DEVICE(0x3537, 0x10a0), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 
+	/* BEITONG BTP-PG01A wireless controller dongle */
+	{ USB_DEVICE(0x4131, 0x800c), .driver_info =
+			USB_QUIRK_DEVICE_QUALIFIER },
+
 	/* DELL USB GEN2 */
 	{ USB_DEVICE(0x413c, 0xb062), .driver_info = USB_QUIRK_NO_LPM | USB_QUIRK_RESET_RESUME },
 

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.47.3

