Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379161;
	b=SfUNoXA2jygBCAoljuix/+zU+3tbmJph/dlg5bEi3LNAsKQ3IkCBxXGdyUr91yE8z4mT
	 Uzk+/LNQHWQFg8fvi1XhPC6Zc9s3vdPRMnCd6OBFmVe+DyZmOKshreM01/ycbPgR4r5XV
	 z9pJgROMyNOTW58bDiJJYhscNRBcbkYi8BJpLuueUTSEUZCecBgBu3i5+wKgNsmGEFqmn
	 JCqLRRTJte/vlVhCquc67zS79twWam0llIn+yF8MCHclridAFKol0z8O8EF4S3haBSwQL
	 9oMGXviwoxwhhtuunnOoeuPnnaB/3rwmW3aAzdQezUN8wWzaaJnS9H7qX2J+ROWV1rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EZG8DW65lYxNMhPsjCMAIqNHtaoCok58c1D0j+yEE9A=;
	b=rECBR38Hr2vkLuniiS9q5m8PDx+cmSljjsuaYl8HxLzqtkOG56xlQeHoz2D1TBtewXfh
	 95w8Ms5/BSRqsJAD+k8l1z8Twje5x2s/La+ZUiDpBcQtpLZ76xr2cKLdacZMp9E9JUl7v
	 hkNslH3r3sFOy7TyCco6DhMDymx4DXteo6uB1MMgeDE79HgCMijIyEBkpVxwltlmgwYKy
	 P8dipcd+6fORPgbGQS6mA0aKyicBkKUfWtc49yDDE49cX2BK+GVOne2r4zMIl6QxCv/jd
	 zz1Tdhzaj2kkBV544eX6SWB9t+X7auyvzOudXesRNG+DGvUD5CYqZ0T+ZzDGod4NFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zonni.pl;
	spf=fail smtp.mailfrom=zonni.pl;
	dkim=pass header.d=zonni-pl.20260707.gappssmtp.com header.i=@zonni-pl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=he4gnpWw;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707DE606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 707DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zonni.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=zonni.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zonni-pl.20260707.gappssmtp.com header.i=@zonni-pl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=he4gnpWw
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso165817066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zonni-pl.20260707.gappssmtp.com; s=20260707; t=1793379159; x=1793983959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZG8DW65lYxNMhPsjCMAIqNHtaoCok58c1D0j+yEE9A=;
        b=he4gnpWw1/2oGJqngV1Dhe1ajGr+YVtS+w9ZQJOQywgzFg6AiRL0NdHp92dUbvHLnf
         8K2hZjqJe14PUuICT0ygtcxcVs54oI3AI3pOv8KrHozDUjiWSSEvYnT9pdFZyhKhF5SP
         3q2d5iTwyB77B/rDGS+Xq3ULDAYAAr5FhqayeLf+M2+3UIqyaaSI6W0SFmp3xCMHxnGW
         ViY9DaCSCsF4T5c5ssrQ21WampV00rwe0cSB/ck95Fs/c5S6TMa66K4C7Qe11dpxTx0k
         L8fRpaTkD38tcst4Qv2VWH77aiwQy4NhMphoT5E5KZGIyPsqi7USCUVy2BgDLh3e1FZ8
         FaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379159; x=1793983959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZG8DW65lYxNMhPsjCMAIqNHtaoCok58c1D0j+yEE9A=;
        b=ePMk6PlRJmbfdRmMTZl9Y2HdKe8SflQuH6MBvjmXf/j558YJ06SCrSt/uhXr2BJqF6
         InRryNGyIHfa40qJkk8KvIEeu5ka1MSMCkL8up+xUw+ZDo9wuTaNsyjx6tPiKjU9At6R
         SCll8L0N/aRBLSXJAIYLngdVgUif46/0r2erDEb6nj+fXLh6geMZxrasucsCtCom4QZ9
         jUMv6wGaukVijGAxVTwvGuUBtp5tlyr1PlV3NIyXF6qPkGo1BzR7S9LulVqTh2AJZO7Q
         xyV0EF1pGOHoZHEwOs4lrvvGXu44nnXt9bwHFYQsnKOHloK7yuBj8FoRSyfE/ykoa3ak
         cIpw==
X-Forwarded-Encrypted: i=1; AKwUvBzQOkn4XNWvDtXOHE9Luxqo4IJGzvF+xhLk9a4i4ryUqmu5UCJitBasX1VlrSnMuujHd12xqOi9wUG4mqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXfBiNQodWYEjLZwKihOPTyN50NeURBir7FGfuJW/+isBEgvmf
	RPjSCqk4eRE4JOXerrOMqcfxVJxdTQbXFqB3VKXa4gBHf7cOtUKvi6bHxeHfWc0XGRN2Ny+EIzH
	jnUowQtXmiw==
X-Gm-Gg: AYBFou0UzFD2SJJCQrB14Fdxu9bquocriP7zyLOTOBVLp7y3fphngE7xTtctUI8CWjv
	1mgm5G/8KZVoNiSyOx6kYHAIkNB4+DC/X64IapH/HJ3uTat1fZm6bzJFMwRfLggtPmcGenTeWYe
	ZS2A92sMUuxRqCcVTmvzIs0NMXvJNOm2IKCjg/Pir8XFuSA0AzlLHagUTRUcwO7dkxJHGw9KOnB
	TKT1rlzcyxMW8WL1QxcZMVUh1WOllDgrVsiXR4BNnliBYiV9gpkSl/BZRuloQOgHRiXSMA6tsWd
	mWxagIh1cJ3EGo36T+/CaiRKD1gHogMN/KsR2pAigG1ETdI1THIxlw47lCHTTRNXYaNqUS/wz2P
	IUqwmUCOTym7EPhK6HXYlAAjB/GCsSf9VADMTkNjAyivk7D1p6g4IuL6HblOTBOznvaD9cI9xrh
	gGztWNSW9A1FUdHsBlTac+CpTavygHWir54Uo1MeTKvTiqXpqiNH95d0520dH/Jux4SCCGPuElL
	JLT7mFQQk6dav6yBGQ8UyQf4u5KYv7LWldNUcIQmYyI52ff77ZMzc8g4+rHuGBnjXNItUZDPeCu
	j0o2ZfstITfSMHtTPsntYmrkcqaz23KulL1ZJjk=
X-Received: by 2002:a17:907:d40c:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c4ca7a4087fmr238307766b.24.1793379158505;
        Fri, 30 Oct 2026 09:52:38 -0700 (PDT)
Received: from [10.0.1.50] ([89.228.212.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm88828566b.17.2026.10.30.09.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:52:38 -0700 (PDT)
Message-ID: <361defcf-9268-40d2-a0ac-eebd51d5da10@zonni.pl>
Date: Fri, 30 Oct 2026 17:52:37 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] usb: pci-quirks: always assert xHCI OS ownership
To: Rishabh Jain <rishabh.jain1198@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mario Limonciello <superm1@kernel.org>, Michal Pecio
 <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260902052631.75c6068b.michal.pecio@gmail.com>
 <178832755831.50581.1058201741431375556@gmail.com>
Content-Language: en-US
From: Maciej Zonski <me@zonni.pl>
In-Reply-To: <178832755831.50581.1058201741431375556@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I tested v5 of this patch on an ASUS ROG STRIX X870-I GAMING WIFI
(AMD 800 series chipset). It fixes the failed xHCI state restore on S3
resume and no USB device is reset any more.

Tested-by: Maciej Zonski <me@zonni.pl>

Hardware
--------
  Board:   ASUS ROG STRIX X870-I GAMING WIFI, BIOS 1805 (09/18/2026)
  CPU:     AMD Ryzen 9 9950X3D
  Sleep:   S3 ("deep"); /sys/power/mem_sleep is "s2idle [deep]"

  6f:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
          800 Series Chipset USB 3.x XHCI Controller [1022:43fc] (rev 01)
          driver: xhci-pci-prom21
          path:   00:02.1 -> 03:00.0 -> 04:0c.0 -> 6f:00.0
                  (behind the chipset PCIe switch)

  Devices on that controller: Intel AX210 Bluetooth (8087:0032), a
  Logitech Logi Bolt receiver (046d:c548), a YubiKey, and several
  HID devices.

  The CPU xHCI controllers (72:00.3, 72:00.4, 73:00.0) and the ASMedia
  ASM4242 controller (6b:00.0) resume fine with and without the patch.
  Only 6f:00.0 is affected.

Kernel
------
  7.2.8 (NixOS, CachyOS flavour, so v7.2.8 plus the CachyOS patch set).
  v5 applied cleanly (drivers/usb/host/pci-quirks.c only).

Before the patch
----------------
Every S3 resume I looked at showed this (shortened):

  xhci-pci-prom21 0000:6f:00.0: xHC error in resume, USBSTS 0x401, Reinit
  usb usb8: root hub lost power or was reset
  usb usb9: root hub lost power or was reset
  usb 8-7: WARN: invalid context state for evaluate context command.
  usb 8-8: reset full-speed USB device number 6 using xhci-pci-prom21
  usb 8-4: reset high-speed USB device number 2 using xhci-pci-prom21
  usb 8-11: reset high-speed USB device number 7 using xhci-pci-prom21
  usb 8-7: reset full-speed USB device number 5 using xhci-pci-prom21
  usb 8-6: reset full-speed USB device number 4 using xhci-pci-prom21
  usb 8-5: USB disconnect, device number 10
  Bluetooth: hci0: Found device firmware: intel/ibt-0041-0041.sfi

USBSTS 0x401 is HCH | SRE (halted, save/restore error). btusb then
re-probed the AX210, so bluetoothd lost and re-created the adapter, and
the USB devices on that controller were reset or re-enumerated.

The disconnect was also visible: on every resume the desktop showed a
"YubiKey connected" notification, because the key was re-enumerated as
a new device (device number 10 -> 11 in the log).

With v5 applied
---------------
I analyzed three S3 suspend/resume cycles on the patched kernel:

  - two short ones in a row on one boot (about 13 s asleep each),
  - one long one on a later boot: 07:29:58 -> 16:19:29, about 8 h 49 min
    asleep.

In all three, the kernel log between "PM: suspend entry (deep)" and
"PM: suspend exit" contains none of the lines above: no "xHC error in
resume", no "root hub lost power or was reset", no "reset ... USB
device", no USB disconnect, and no hci0 firmware/probe lines. The
Bluetooth adapter stayed bound to btusb, and the YubiKey and the AX210
were still enumerated after the long sleep.

The "YubiKey connected" notification that appeared after every resume
before the patch has not appeared since the patch was applied.

The patch also fixed a problem I had given up on: my Logitech Bolt
receiver (046d:c548, port 8-6 on this controller) was reset and
re-enumerated on every resume, which made it unreliable, so I had
stopped using Logitech devices to wake the machine. With v5 applied the
Bolt Receiver works consistently across many suspend/resume cycles (this
is what I observed in daily use; the three cycles above are the ones I
checked in the kernel log).

Thanks for the fix.

Maciej Zonski
