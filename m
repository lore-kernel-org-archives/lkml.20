Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5173E7650
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897754; cv=none; b=nzltx/uelLoxeSyzkZm8eQWEJ5vCVDBd+/B9rW49A5v4oQgKRYsCtKTwIEbbEod2vZufsE1SKqeEFoGqBK6JKxECcBbeGssH6X8c1Gm9FAS0vmWhwkbeme1M1mmtlSi1t9zkw1zuqJHzhv3YNIfFofOKpX0dLcDQgzIOLH+WMO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897754; c=relaxed/simple;
	bh=XCvgXtVDOQexlet7FH5jCB/Ll+55kV+TEw7kNGuSQ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMpD18DXjSEYT/Tt1i8dks+S4/ajLY7tFsrUZ5mXv80w6ZPj5vfSx3JHXpWWa2RvsxogiBAUADdyTghDgy+YKswKip29YyUIsQ0Mlbo75e4rGWD77dpUYVb2XOIOKCxJeQE8HtwGQp1Gq6ssjGSYJJ9r2w3/0SZ43QqUXy0YQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWBSrGFI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWBSrGFI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso27353655e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789897748; x=1790502548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjR0+aR4fqFhCdqun3B7g8hh4Gd9On2hwqPnG7OLZVk=;
        b=sWBSrGFIP7mHD/5ty11wSZrh4LT8RYMLnfYfRhoAfacoCkkhzHGcrv/4an8lVU5nwd
         pY3AGJL1SqVftCaMmzQF6X07f5wXJHsDPRLaHj+QodkH5pJSDYFk0brVAtVNxw2YhLPK
         DWj1As/bcCuGkjkatgKEWi1io2jQtHa03WM2BVZmVJ97SN4qQPTxDeIJK3QDZ5s5XOZl
         /dgiXWnsFgAopcng6ULOF1pYmVkTVc9v0bWC8BEac1oVFTXHOLbOmQ/4wmlYh6XR/HE3
         S5Xhqvw1NiiNAYGjNe1RhP0Quv1IIi6Wciq7xNNnSCeNeQFKr1Sdc230SCuoSyMzwF4s
         PcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789897748; x=1790502548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjR0+aR4fqFhCdqun3B7g8hh4Gd9On2hwqPnG7OLZVk=;
        b=F9w+4Wl6M4vN7lCma965OlQIPTjuALd+p2+NKLHmfr/1S0kC7GvvjqnUGoQs/FzFD8
         ALANHtg+fFDUP+R/Uof/F/+X+yXskYIP4WZ8KLZ6yuX8GGpjPkcM7IOnpJdWBd/072Kv
         HRkGL/4kvMAiJWVR3cS9MALWr/aVU7pq785b7oDbyIJ1x2WOQF1wsecheTixNHn+Bil7
         IfEwDMr4Ejr0qij+bUvPeSIk9CoQoy4de8e4jlWn6O01NNL1TqOWwcXjasnaI5So8L0F
         zKd8DI19hszOc95AwqoSkRL3P2hYVbgTqK77r2Cnsy+jUKRep2nIDCLuXn61tZQImvz/
         4arA==
X-Forwarded-Encrypted: i=1; AKwUvBz/RkDnUfhhCQ/OEQT80GSkGkZ66dWfMiK57ElZxbW6cukf2y9Ls1G3t3HFW1Kp34cz00DXT9oV6t3v38U=@vger.kernel.org
X-Gm-Message-State: AFuF++nB98QLnwzeDh4cQPIwpBtgu5BP/tkfWQoo29ADOJP5bZHwYerW
	S6gf1UPbGTFAsUFogZDDA8018q81ZlNc7SGsqKiMthZ5TnzYsCD0hnFM
X-Gm-Gg: AYBFou2CpPXRqWUzmLWZogF0h1KD3kPLhYiQUiOEWltKXbwydP6ksL1aX7X2d333SoS
	H5QEk/WWpobL/Kv+KNQLmcPErXHb9nv5zSPOme4+agubXdZgzS1wjayDIknGh/mB/8ne5gt2WjH
	7JoudHwMhDe27yvjqX10NFhow0AlUYWCoEXpk1Fjk1jmnKLc/6Q6UpNqgFA77Lp592SOQrM2io0
	VASdBsoaEtSBbAQJdc9+I4nMkm0SMxj2V81TFpQzjws3dfLD4Xd4W5H6dPg/Yy7LWpF1kmGtt5Y
	XKyJP9/Bk6eGp3ooTLWauR6rUg+FrAt4uZQ5zs676SUKYw7q5xfVGX/ZvIwrsMzqkkY0e5oUSe7
	ZvLapGsIsxNVcxs1KYqsNIvHdTfRMfnrT2vpzSIzj7mzo4OL3osHtnUGJdxnB7TZywux0ZQBr2F
	t1DuVLvL0hHzE8BcULXXed0eBKbTfcllMa8MHOb+91hV++bereP8vxMSnmKeURlrAbJFdIhVWHp
	UmK9NxDevHxUREwkvzrFX0OFkU6YI2u+CjNqVw=
X-Received: by 2002:a05:600c:1391:b0:49d:272d:74b4 with SMTP id 5b1f17b1804b1-49fc566e5ebmr100511745e9.2.1789897748192;
        Sun, 20 Sep 2026 02:49:08 -0700 (PDT)
Received: from cachyos-x8664 (213-225-2-90.nat.highway.a1.net. [213.225.2.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724564565sm13133797f8f.19.2026.09.20.02.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:49:07 -0700 (PDT)
From: Roman Stingler <roman.stingler@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Roman Stingler <roman.stingler@gmail.com>,
	Erik Hakansson <erikhakan@gmail.com>,
	Filipe Lains <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION 7.3-rc1] HID: logitech-hidpp: hi-res scroll mode forcibly re-enabled on every reconnect for Bolt devices, overriding userspace
Date: Sun, 20 Sep 2026 11:44:39 +0200
Message-ID: <20260920094508.39682-1-roman.stingler@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Since Bolt receiver support was added in 7.3-rc1, the user-selected
"Scroll Wheel Resolution" (HID++ feature 0x2121 HiRes Wheel) setting on my
MX Master 4 is reset by the kernel every time the device reconnects, most
visibly across every suspend/resume cycle. I disable hi-res scrolling in
Solaar, suspend the laptop, and on resume the mouse is back in hi-res mode
and I have to toggle it manually again.

This worked correctly on 7.2 and is broken on 7.3-rc1 through 7.3-rc3.

#regzbot introduced: 022eb347ff3a48281e7e69c3addcb11bf24afa53


Hardware
========

  Logi Bolt Receiver              046d:c548
  Logitech MX Master 4 (WPID B042), HID++ 4.5, paired to the Bolt receiver
  HIRES WHEEL {2121} V1, multiplier 15

  Host: HP OmniBook Ultra Laptop 14-fd0xxx,
        AMD Ryzen AI 9 HX 375 (family 0x1a model 0x24)
  Distro kernel: 7.3.0-rc3-1-cachyos-rc
  Solaar 1.1.20


Reproduction
============

  1. Pair an MX Master 4 (or other 0x2121-capable mouse) to a Bolt receiver.
  2. In Solaar, set "Scroll Wheel Resolution" to off
     (solaar config 2 hires-smooth-resolution false).
  3. Suspend and resume (s2idle here, but any reconnect does it -- turning
     the mouse off and on again is enough).
  4. The setting is back on.

Solaar shows the divergence between what the user asked for and what the
device is actually in:

     18: HIRES WHEEL            {2121} V1
         Multiplier: 15
         Has invert: Normal wheel motion
         Has ratchet switch: Normal wheel mode
         High resolution mode
         HID notification
         Scroll Wheel Direction (saved): False
         Scroll Wheel Direction        : False
         Scroll Wheel Resolution (saved): False
         Scroll Wheel Resolution        : True
         Scroll Wheel Diversion (saved): False
         Scroll Wheel Diversion        : False

"(saved)" is what I configured; the live value has been overwritten.


Analysis
========

I have not bisected this, but I believe the cause is clear from inspection.

Before 022eb347ff3a4 ("HID: logitech: add Bolt receiver support for Logitech
HID++ devices"), USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER was not present in
logi_dj_receivers[] -- it appeared only in hid-quirks.c and hid-multitouch.c.
So a Bolt-connected mouse never became a HID_GROUP_LOGITECH_DJ_DEVICE child,
hid-logitech-hidpp never bound to it, and the kernel never touched HID++
feature 0x2121. The device was driven by hid-generic and userspace was the
only writer of the wheel mode, so the setting stuck.

With Bolt support in place the mouse is now a hid-logitech-hidpp device:

  logitech-djreceiver 0003:046D:C548.0007: device of type Bolt (0x10) connected on slot 2
  input: Logitech Wireless Mouse PID:b042 Mouse as /devices/.../0003:046D:C548.0007/0003:046D:B042.0009/input/input22
  logitech-hidpp-device 0003:046D:B042.0009: input,hidraw7: USB HID v1.11 Mouse [Logitech Wireless Mouse PID:b042] on usb-0000:c5:00.4-1.3.2.4/input2:2
  logitech-hidpp-device 0003:046D:B042.0009: HID++ 4.5 device connected.

and every reconnect now runs hidpp_connect_event(), which unconditionally
does:

	if (hidpp->capabilities & HIDPP_CAPABILITY_HI_RES_SCROLL)
		hi_res_scroll_enable(hidpp);

and hi_res_scroll_enable() in turn does:

	ret = hidpp_hrw_set_wheel_mode(hidpp, false, true, false);
	                            /* invert ^     ^ high_resolution */

with high_resolution hard-coded to true. There is no record of a user
preference and nothing consults the device's current mode, so any userspace
choice is discarded at connect time.

Note this is not a suspend/resume bug as such -- hidpp_driver has no .resume
or .reset_resume callback. The reconnect is driven purely by the receiver
re-announcing the device after USB resume, which queues hidpp_connect_event
via hidpp_report_is_connect_event().

The same call hard-codes invert = false, so "Scroll Wheel Direction" is reset
by the same path for anyone who inverts their wheel.

I realise hid-logitech-hidpp has always enabled hi-res scrolling at connect
for devices it drives, and that Unifying users have lived with this for
years. What changed in 7.3 is the set of devices this applies to: Bolt
devices were previously outside the driver's reach and are now inside it, so
for those users this is a user-visible behavioural regression.

Commit f0866517be934 ("HID: logitech-hidpp: sync wheel multiplier on wheel
mode changes") in 7.2 already added hidpp20_hires_wheel_raw_event() to notice
an external SetWheelMode and re-sync the cached multiplier. The driver
therefore sees userspace changing the mode; it just does not remember the
choice across a reconnect. Persisting the last observed mode and restoring
that in hi_res_scroll_enable(), rather than unconditionally forcing hi-res,
would fix this. I am happy to test any patch.


Possibly related
================

On this same Bolt topology the wheel also scrolls far too far per detent,
apparently because hid-logitech-dj does not forward the hi-res wheel reports
to hid-logitech-hidpp, so the multiplier-15 steps reach userspace unscaled.
There is an out-of-tree DKMS workaround for exactly this WPID:

  https://github.com/Magnetar-OS/logitech-bolt-hidpp-dkms

I am reporting only the mode-reset problem here, but the two look like
neighbouring consequences of the same commit and may be worth considering
together.

Thanks,
Roman
