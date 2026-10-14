Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9EF27AC31
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991522; cv=none; b=ChdAq0WXuyWSjje31e6xx03FPVO7LhF4z1woKapgoGZACKekV9lf1XvrVmK3BJNJsyUZJk9ZVYYdl57Nm6uXxG8tvwt8/wsBbqoaN1WUNXbk+BKKEv4fsdVce8wrAbWnumnwug4eWtUtpd5JU32X/lxTTHkjWgz8ux0JSrDI6uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991522; c=relaxed/simple;
	bh=4xtlwMXyWzq87oKXlTSUTSJUcCXtxizVzZJcF/3R7OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SfKEBL8Sai1ld1NIMopiOXJfn7n1KqRVp8OZT4lNSmwRclquGtJymtwbeEM7VWuVlOxKuzKaNObV9Ufh3jgYPOFezm8R+rqn/PyLb2WmninYPr2tPAPiwejGhQQJChGggo2p+XIGUOCFlPF9o0FaCCXEu7MdrZgzjaXKmzt4UGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvV3QGR4; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvV3QGR4"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c8b520c640so183491137.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991520; x=1792596320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZlacUVzzy4HBA3NrxiUhpJFwP6Wb2PV4OZMdQ09R7I=;
        b=OvV3QGR4FZThAftPriNMh0Z49gdzBDi90bON/J2qGK4x6casf1MCH7iu0i1QXdMSA8
         BFyJfzLwcxt3JPev9LG1y+5VFqIIjSghbVMKzuB5xyqs4/68DP4kv6fVzv83zMymDsRX
         1qrn+koBA5ex4K3dDF0QYhHc56uAqHiRM6OIDLgzhtp1jpswVE9dKA5VU43IH4PR4PxM
         G3t9zI2cftnG/bVhkAMewxJOTecsfyxbw+/gLlhrTs/IEh+CI69jHmYi+lNLiJtZg/+m
         4J3ogY8xF8roffMtybaOz/QyRuHixaK1iSrl7cPnIt/uMsOcnuoy/Z+UdshEdh0pdDjY
         Z9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991520; x=1792596320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZlacUVzzy4HBA3NrxiUhpJFwP6Wb2PV4OZMdQ09R7I=;
        b=VkE1ZKQwc5LEASws5bAJC32/YzB27krWsRTSEAokYz6STHdgSUnfT03kKhC6cGVnwb
         t50mHnguff3bMemp0GiFwkeeGM+7jfP162W2/uaN04xGJJ+ip9Gir580VPuhYMKkdbV/
         pWNCEUWUCBxC0QN9LWFT9mjClQOu4T3Xv91pDdFZT13oKCOcK62QKvDIfr4EKLlKRlp6
         bfgNJ5c2tBIRuWttGrv9/eWplJDS+sq66BXuUZXWGohwK8z5+MwS10mtOdGLA7EWuIjU
         c/ZzN4z32se0QXf/bV7m63C7jgyseud8YvxVwVhJgpw+YfxKpZsj6GulpTfz4pc3arq/
         EQpw==
X-Forwarded-Encrypted: i=1; AKwUvBw9RSubZCvuVXGgE3kjxbGtisKPkU1WkBcfu54Sx08uaD/OvpBp0h1Ykb/A85yEDRM64TSS0zHh4PmDlyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuLc/KDqweVRVIn8Z8roPWTSBabwVV8LEd4QQWMCmRDyq35b9H
	MFAjfqPVPF2zoFARRdcbYp2GaUUWJwnk+K3so93x5bI+xLPvTFLq7aU3
X-Gm-Gg: AYBFou3zgkGOTHX4H89hjBcf0Yf6u5LaZ0h7/VLrKq2jA8tqyH0XLQksIdeBeZ1roqJ
	kRyGYbFAdsqitirp6H9jnp7j+tY+MAyGzgq8tkXg2c4tsBJDldNPSomIETwg2v7+bVOZ+d3yDRe
	Tr07V1KyHRuRMr/sPMhvrumdCm5k5t0KkqftCv3o+QrKtRyQu+Q3nr3dMer9EfCLC0JQb+784O1
	a0NnUhXkrlxo9cN/zE5JUxCPcvPauJ19G7Pc7HbrmKXki799ALcmdcAhjYmkdu8I34OGbVADdjU
	uFuZwjFg5v4lDibCcmngmzUqt5V+MHUWarDtzmpoMUCIo3/WaOVtOMcl/tynLq9lOu81qRpdStO
	bColYCIg/8+WVLHcZITU+h+ZpLnIkAuS23nk+dvR4Hk26MszmZFQxyira77SeQHDkvsVKvTUqRy
	86sonWa9j++ToyqgaN2ad/grgdEPAPO07qV+6Y6no5HfrN/XXt7KczgTAfMEP4kozGjvHZQE1OR
	hiwJuqXyE2/NIaV4lhRHrM1Q4DB7VEoxpXQn0wp2vygq3eO8jHd1Ig+SPD9e6KeyiA6PZhtRm/5
	TLTNJGGtZw6gO3WFV4jfz15lCHLVcW6aKf/SoZMBOec/LCbx
X-Received: by 2002:a05:6102:4193:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7cb50ad7b90mr3825371137.0.1791991519989;
        Wed, 14 Oct 2026 08:25:19 -0700 (PDT)
Received: from debian-t14-gen1-fuhrysteve.ts.fuhry.app (235.sub-75-230-129.myvzw.com. [75.230.129.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5e5b1sm54887516d6.18.2026.10.14.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:25:19 -0700 (PDT)
From: "Stephen J. Fuhry" <fuhrysteve@gmail.com>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Stephen J. Fuhry" <fuhrysteve@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: input: ignore the battery of Keychron keyboards over Bluetooth
Date: Wed, 14 Oct 2026 11:25:05 -0400
Message-ID: <20261014152505.2523337-1-fuhrysteve@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keychron keyboards identify as Apple's wired aluminium keyboard, rev B
ANSI (05ac:024f), when connected over Bluetooth. hid-apple has bound
that ID over Bluetooth since commit ebe0b42a4252 ("HID: apple: Add
support for Keychron K1 wireless keyboard"). The Keychron K8 tested
here does the same, whichever position its Mac/Windows switch is in.

The report descriptor declares a battery, so hid-input creates a
power_supply node for it. The keyboard never answers the battery
feature report. Every read of the node blocks for the full 5 second
uhid timeout and then returns -ENODATA:

  $ time cat .../power_supply/hid-<addr>-battery/capacity
  cat: ...: No data available
  real    0m5.10s

Anything that enumerates devices pays this on every pass. With the
keyboard connected, "udevadm info --export-db" took 10 to 26 seconds;
with it disconnected, 0.11 seconds. KDE's Solid library enumerates
devices on the GUI thread, so Dolphin and the Plasma panel froze for the
same 10 to 26 seconds. upower already gives up on the device and does
not list it.

0x024f is a wired-only Apple product, so a Bluetooth device using it is
not a genuine Apple keyboard. Ignore its battery so the node is never
created. AVOID_QUERY would stop the blocking read, but the K8 does not
send the battery in its input reports either. The node would then stay
at its initial capacity of 0 with status Unknown, which looks like an
empty battery.

Cc: stable@vger.kernel.org
Signed-off-by: Stephen J. Fuhry <fuhrysteve@gmail.com>
---
Tested on 7.2.6 (Debian trixie-backports base) on a ThinkPad T14
Gen 3 with a Keychron K8 paired over Bluetooth: no battery node is
created and "udevadm info --export-db" takes 0.12 s with the keyboard
connected. The keyboard types normally and hid-apple still binds it.

I have only the K8 to test. If another Keychron model on this ID does
answer the battery report, this hides its battery level. I do not know
whether any does.

 drivers/hid/hid-input.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index edd6bbf..380ff8a 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -381,6 +381,15 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ELECOM,
 		USB_DEVICE_ID_ELECOM_BM084),
 	  HID_BATTERY_QUIRK_IGNORE },
+	/*
+	 * Keychron keyboards in Bluetooth mode reuse the product ID of
+	 * Apple's wired aluminium keyboard. They declare a battery but never
+	 * answer the battery feature report, so each read blocks for the full
+	 * uhid timeout and then fails with -ENODATA.
+	 */
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_ALU_REVB_ANSI),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SYMBOL,
 		USB_DEVICE_ID_SYMBOL_SCANNER_3),
 	  HID_BATTERY_QUIRK_IGNORE },
-- 
2.47.3

