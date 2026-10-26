Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027428;
	b=i3c2XY1fwIXA2nYUFZvltMzs1c60MiEa4pl6PdQsRRmDUJaPEZ9vWooKODE8EJgumbCS
	 QFWf9oTsYNJFEpv9hg/o8HllwR9wdlI2SYahD5U0BBdkzoZcLpKm1/H4IuR/1KqulPHr4
	 dTReU9hkoqXKq93VAwCwAHAw2eHQYZ7uO6R0iKpQ0S3TvL8DKUM3o+XZHIdWBvSfjw0Ek
	 eZCJIyXRDmVUp2xCbVsF+yiN0BcOKwYCKzcWDi5dxTulBExIzlF74o95pIxkadShXYqen
	 rPXiJkmLd+pVqh8qSWshRDrdU+pzePZVkv0DWtkEP10mvfRTajzPJNlh0Q2xn+/uv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A8RfuNOxSUZHyY3m5Pl0sedIFFoX+UXPT1Yn9hXipnM=;
	b=iuykKPuq7RqNNW4K6PARP7iUb6klEorxSYVN5Jy1CJHfHgZUjC1FA0917JjM4cdWmX82
	 kKvWstklvEelzGpL0WRi2fNIUIMEO3gNf//09AQDN/rB0auVMNs9p2IT3gvGCKI40Cy8w
	 qtGZLSTB3QpQyzVLDMllcnQiUuVhGeD4Xh8d0PB5dArph4Kq7molN6U4GpbAGo65ul5R8
	 ZxumTwMl5/oh/Z4m2OTb5VoyZuzVAmxh8AW5hXgUn/31BoE9YfWw1WGdTwQsSO7SrZ7Kd
	 N4Aaq0OFWpfi8uKsJfjl4fL6yrbuZeCs+Vif6cqqgqxMG6RrFqc5KKmgdKmmiECglOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XU73rdsF;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01608606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01608606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XU73rdsF
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so7257780eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793027427; x=1793632227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8RfuNOxSUZHyY3m5Pl0sedIFFoX+UXPT1Yn9hXipnM=;
        b=XU73rdsFN1oKEcVT3dK1mfEWHRmZQihXLhi5YZHCf6pnlvKy9Rd+AGx4s6nGZu4bUf
         wuEZrevHn0tebKAotGiDLpwXNmqYiJL787GmGyTfvbINDdJn4X2/Ocs8ApcMeeJwJlBt
         EwHRAwEeGiK0we6/rCtdoRjJVfVCAdx5/Q407tTgfSF32GFgQsGg/jrxbw+0m3eqqvB8
         RkoY+9GXgnMmx5dBgYuvcTHSjqh7l+YBoHXMkVwCFHrsIe58+/6DCAyK4nCnY6GDSFqj
         FxUIQ+jfxMqlmstgrXjO53MCPRdN9Kn2Oybu8mx1LuOjDbkar2jxU4KP50Sc03ldd8NI
         Kx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027427; x=1793632227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8RfuNOxSUZHyY3m5Pl0sedIFFoX+UXPT1Yn9hXipnM=;
        b=E/Ly+Jds8y//LUIPzBDXF2T1Fl4iyck/nrLY6uebUve9XvIcRMDB0VGUL3QyHCbPvp
         /V/UwLwebQAF3RAok3MK9ztEWUxLy7B8+ekRgsZZwW+Gx0nDPotn9mWKJd6bXpFpNWvZ
         2v1jzwiL/B+ouqMBQGAlbZxpE4TK+ZGNGLBRj7ojfu7gN4ZP7cJE8eRxYh70whlA7bji
         DRsARt8k+iQP47UBsJ4u8C6um8FAUsDWe/tfmlS321frbt45UYuzD1gvCMQrZuhQhrS1
         /ZZM8liRDwP36XSr36H/2lNtDF6SWZ26r4Tvv6CO0JdGc/+t2rwkiTZKzNBHiNFzGUKR
         wDpg==
X-Forwarded-Encrypted: i=1; AKwUvBwe/1JbHf88OGOGHzY6lO2mxOD5f9WWNO4MZwGIY3cdLJVEPiZ5Vr8/Mj3m79tFvBeYjZw/QFd9rBfsO8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/0W1Bew6jnwUvkCFmon74G4ki5ANbiIHSrgritTPqQX9EUtPN
	3WjhhBj56qiTi2jCg3JdFz432iLd1H02H/d5Mskpkp2HndmPbBznOfwC728tUWOKgQ4=
X-Gm-Gg: AYBFou2MbRCE2hYtkKsuH+nW2q1kCSX6qEgCSEVGcml0rGnF2HyYGVGLa6FvP5Jp+Q4
	vgATYDdB5K2EKZ+y+LeBPxAyr3A/bNOpC4vBBk3YuXD1CZ+xZOBajO3S9Sbf1GP+/3OqzSw4ENL
	mn+jjgnHiLVaK2BVv3VcbL0Q38XFSrmUaL864FO7/QdAwb/O8aL85TMPWYYTw7megDlaUH1iu3c
	vc9LceZlSwKrGru/D2fNzVhZhjwxA/v2pgcOImYylNYj2TcoTmwBnGQE6gGkXTlqMzhDZ852Hf/
	IuQYRdEI2JEKyxdxFAmS1bUGuSeDMtFQlInCJr/a+D9+CXTh94DpH3/vFJ8rywcaFQ9v1BOFx3q
	AcsEw1Fsij8FRy82O2Jznqx00S4aztQsVx+OZ6XutT4Srz2y4NwHfoJgAutGH1gNXAZehNNG+KX
	lZ9JsMC3CWWkkX0ULhisatxx7TS989laUMRk1ATVNyUQHVZdyZ7o2agiJyBQEVQX9fj5qvZzIsp
	Dw9iw5TQOZ+3eZEPrU6EjRngGz5SksT8DWYjgHtyJAJz2UBn1psYY0vOONT05m4nmE=
X-Received: by 2002:a05:7022:6982:b0:150:1cea:31a8 with SMTP id a92af1059eb24-19935be8443mr16206375c88.19.1793027426705;
        Mon, 26 Oct 2026 08:10:26 -0700 (PDT)
Received: from localhost.localdomain ([154.17.21.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm24603548c88.3.2026.10.26.08.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:10:25 -0700 (PDT)
From: Weiqin Zhu <zwq939681378@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: core: quirks: Skip device qualifier for BEITONG BTP-PG01A
Date: Mon, 26 Oct 2026 23:10:03 +0800
Message-ID: <20261026151003.16869-1-zwq939681378@gmail.com>
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

Signed-off-by: Weiqin Zhu <zwq939681378@gmail.com>
---
Changes in v2:
- Correct my name to Weiqin Zhu for the author and DCO signoff.
- No changes to the code or test results.

v1: https://lore.kernel.org/linux-usb/20261026133448.10185-1-zwq939681378@gmail.com/

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

