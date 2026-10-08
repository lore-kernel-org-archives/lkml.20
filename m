Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE034389F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485746; cv=none; b=uy5hjnzkMYy12XVpjEc5Mn2o76cwuNtHAv1PtNZ5KJa6rb6PwsVK/+eGEWTJiMjBt/pgIREDzd0ty+tWXob7fAvAjIVdXL9VwUoHB6nCOFjWHUMgyKk6LSKXbyveE0nqmK0JISj1bz4rZLqq5fQNU74lzG38qhCCudDkkTuMQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485746; c=relaxed/simple;
	bh=XaKILT6Vr7oFqSK4R19NK4yKIDRq3YvQPZPHbq9dhzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7sIRckpOHzKPoXbwml8h9nnlIaEDMO/EeT3Ba3t4Oljd7N87DvbSrL55+N5GgpfWkfd+vIqsnVpDOuyeL0rUhSDJy/w6H63XjER0/4+amiXEX7209RdM/WBzpBLj3Bi3C611bAp1xSTHuzRXn/Yf7qwxv6LGKevQy5BYYe3bzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rrell.co; spf=pass smtp.mailfrom=rrell.co; dkim=pass (2048-bit key) header.d=rrell.co header.i=@rrell.co header.b=lFrbXy5c; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rrell.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rrell.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rrell.co header.i=@rrell.co header.b="lFrbXy5c"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e618db81c0so16241955ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rrell.co; s=google; t=1791485744; x=1792090544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zHHbEd808Ojq1nUxykV5iGDQiC7t8SMz3dvPEQojHXU=;
        b=lFrbXy5cSjY1cFgAC/nkVcbQjr5+dtBq1wY0r+ztofafJcCHPq1159G1geuY8OAoTr
         E3mt/AmwVE9Pk/Kl78n0Po/QTbhoWPRy6Lz73RQHtciReuz1b1SsvnKimlcm6N8/Zbqg
         m7TVU14KlhHPjyPTJFuzeTw+yfZSN9tYfJhsAkKSkTgf25QP3hWcMj2Gu8cBZ0tGv9U8
         Ux9wRSzRc2TJqqVHSiEcbmIeehBBykOK8l/0RJ3wLx8dymQTNggTfLcLqE7t4n4NukE/
         8rhrvcaKqmb0+1k5GVh4NxFidMXjoB+J/ALb8i6xtSSry4m0kfEsrHEfpnQOc4l+xl+D
         o7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485744; x=1792090544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHHbEd808Ojq1nUxykV5iGDQiC7t8SMz3dvPEQojHXU=;
        b=w3HKLPLpPCvIvMBWvy/MvxIVlWohax5DTGA3HPURtEOnhY+vhbKLfWX8PXGc9Xl2rs
         9v7vdTUJJGt6SYeoYR3+lGd+CFI9yBOJZynqidU94RMidYWte7MnC3TWaBgyYa2+RGQS
         l1x4aNanQOd9qHaiXukzy7BTV2kKqgPyU1DtBGRuq7WXfIkElGB92xrWP4J/p4LlLgFl
         32rcIMC6htaPx+lNq6aMmn2LHac829g02RB9HgezPRRC5w6kJA8bWl5rMOuE47OPMwwS
         +n5l+WgNLOOTQCmA8FMJRuE2KhDXanJwtSNYZjfHMWIV90RQIeuLmGQdIaPo1VAmbLQ/
         +oQg==
X-Forwarded-Encrypted: i=1; AKwUvBwKKewY+3foF2CX6MEgJ4QSI/8GkPq5agiVSslxdil/xzUU9/o0CbuxOA9+nLSSRRRD1cfBrd4qeU2W98E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9NAxzf3zXxIHsIBwnue2FDK2iNPPnrNyqqlRfJ9QY8jJ5NqHj
	lIafgmpUdFXo2P6o92vpJW5Mi2K1sUvSsK2dZPYRTDfgBxfrUrEh7bpUk43hxf13bh0=
X-Gm-Gg: AYBFou02B/RT2kp8dm+KaBHfFuJFH7SRfxLABkrPQxKA6rgJBSlNIUsv//RUHDyaRhR
	phb8LZGkuk/u2x72L53A5yN7DxGKPZdreiOAAsu8M9oA2RJJ8C0xZdSVKQr7hn12FTK0aJ/p/Zq
	g98hf1X/1f4yCh36E2jZwhUMhETF3/cLPVL/CRLSi5QCblxtDwY2qKSx5eETRvqox143ND4TzR9
	3W/JqIDRClzrRA6Zk3ZLQb4C1hgICUI2pymGUQ2yr2lTSL1iQv4PzjQsoR7MrPRzCpaXfEGeA3f
	XN79bVOukBxPS9Xx2CB0OWX2M2GvZgdYxVvGJmNGcFTyud/IAJMZ5ZaVsdlZsX0UjF4nUWxl1Da
	WmCkZqz0s5h5/o4ksZ4q0dq4bGBB57fiPD78uN4WCSgWJ/fsXnKh2cTpOtZNNtl7vmyMAK0i/bq
	merQ2SPPW1Uf/C3GryVo+aHZflgvK/9oDuW1LPrAj1WZN7MHfmZWz8Qd6alwZuM3qwVovKFT+wy
	jHVjA==
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr54303495ad.3.1791485742089;
        Thu, 08 Oct 2026 11:55:42 -0700 (PDT)
Received: from omarchy.tailc658b0.ts.net ([172.92.210.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e83cced75dsm658205ad.43.2026.10.08.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:55:41 -0700 (PDT)
From: Darrell Gum <d@rrell.co>
To: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Thu,  8 Oct 2026 11:55:09 -0700
Message-ID: <20261008185537.84917-1-d@rrell.co>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
References: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 11:19:11 -0300, Francisco Beltrán Millalén wrote:
> When a PCI device becomes inaccessible while the system is suspending,
[...]

Hi Francisco,

I tested this series on another MacBookPro14,3, together with your
Alpine Ridge SXFP quirk and the Apple native PME patch. On this
machine the combination takes S3 from never resuming to working, and
it fixes USB-C hotplug while the Thunderbolt xHCIs are
runtime-suspended.

Hardware: MacBookPro14,3 (15", 2017, T1), two Alpine Ridge 4C
controllers:

  upstream bridges    8086:1578   04:00.0, 7a:00.0
  downstream bridges  8086:15d3
  NHI                 8086:15d2   06:00.0, 7c:00.0
  xHCI                8086:15d4   07:00.0, 7d:00.0

The dGPU is a Radeon Pro 555 (1002:67ef, subsystem 106b:017a rev c7).

Kernel: 7.2.5 with the Omarchy distro patches (linux-omarchy
7.2.5-3), plus these, in this order:

  e18d1abc3bff ("PCI: Avoid saving config space state if inaccessible")
  this series, v2 1/3-3/3
  PCI: Extend Apple Thunderbolt power quirk to Alpine Ridge
  ACPI: PCI: take native PME control on Apple machines
  a5be7ad8f5f0 + a22e5e4f2ebb (amdgpu VI reset quirk, incl. 017a)

Everything applied with offsets only (no fuzz) on 7.2.5.
mem_sleep=deep, stock command line.

I applied and tested all of these together. I did not bisect them,
so beyond what the logs show directly I can't pin a result on one
patch.

Before (stock 7.2.5-3 on the same machine):

- pm_test=platform hard-hung 3 out of 3 times. That includes a fresh
  boot and runs with brcmfmac unloaded, and it did not recover after
  more than 3.5 minutes. pm_test=devices passed.
- Real S3 never resumed. Every attempt needed a forced power-off.
- With both TB xHCIs runtime-suspended (power/control=auto), plugging
  a USB 3 stick into any USB-C port produced no kernel messages at
  all. With power/control=on, it enumerated at SuperSpeed right away.

After (patched kernel):

- _OSC now reads "OS assumes control of [PCIeHotplug SHPCHotplug PME
  AER PCIeCapability LTR DPC]". PME is missing from that line on the
  stock kernel.
- Hotplug: with both xHCIs runtime-suspended, the same stick
  enumerated at SuperSpeed within about 1 s. 7d:00.0 resumed on its
  own and 07:00.0 stayed suspended. Nothing was forced.
- pm_test=platform passes. "quirk: cutting power to Thunderbolt
  controller..." is logged for both 04:00.0 and 7a:00.0.
- Real S3: every attempt resumed. That was about half a dozen real
  S3 cycles over one morning: rtcwake on AC, plus lid-close suspends
  on battery. amdgpu resumed in 1.2 s.
- With a device attached (lid-close S3 on battery, about 1 min
  asleep): a USB 3 stick was enumerated at SuperSpeed on 7d:00.0
  (behind 7a:00.0) before suspend. The quirk logged for both 7a:00.0
  and 04:00.0 with the stick attached. After resume the stick was
  still there with no USB disconnect logged, still at 5000 Mbps, and
  its filesystem mounted and listed fine. Unplugging it and plugging
  it back in about 2 min after resume re-enumerated it at SuperSpeed
  in about 3 s, with power/control=auto.
- On that cycle the xHCI of the other, empty controller logged
  "xhci_hcd 0000:07:00.0: xHC error in resume, USBSTS 0x401, Reinit"
  and recovered. I'm mentioning it only because it's on the path
  your quirk affects; I haven't looked into it further.
- noirq resume takes about 16 s (15.9 s on a real S3 cycle). About
  11 s of that is in each upstream bridge (04:00.0, 7a:00.0), then
  about 5 s in the NHIs (06:00.0, 7c:00.0). Another 14,3 owner
  reports the same split in s2idle (stock kernel plus a local
  Thunderbolt workaround), and says it drops to about 0.5 s with the
  ACPICA change proposed in
  https://github.com/open-acpica/acpica/pull/1235 . I haven't tried
  that here.

Not covered:

- The "plugging into USB-C no longer wakes it" trade-off is
  untested here.
- Only one S3 cycle had a device attached, and it was a USB stick.
  No real Thunderbolt devices and no SR-IOV.
- The stock kernel also lacked the amdgpu quirk, so the real-S3
  before/after mixes both changes. The cleaner Thunderbolt-side
  comparison is pm_test=platform: the devices stage, amdgpu included,
  already passed on stock.

Two workarounds that have nothing to do with Thunderbolt were in place
for every patched-kernel run, in case they show up in other reports:

- d3cold_allowed=0 on the NVMe SSD (02:00.0). On stock, the machine
  never even reached S3 without it. I have not retested without it on
  the patched kernel.
- brcmfmac (BCM43602, 03:00.0) unloaded before suspend and reloaded
  after. Left bound through a real S3, the Wi-Fi firmware state is
  lost.

Thanks for chasing this down. This is the first kernel on which this
machine resumes from S3 at all.

Tested-by: Darrell Gum <d@rrell.co>
