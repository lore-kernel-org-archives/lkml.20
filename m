Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554610;
	b=NfoS5iCv7PT7T0t1vJVbIxXXO2Q/tWZIHhN9cR7BBGacYs57/ac/ADB3GyB6sOkeYWds
	 KYjMKhXOVrJ6Ue/spgHt2P4wnoy9DNvhdiyPSaON5ev0L2CTchCe9U7lK7f8H/5NYSASr
	 0AShAtCkofureoztPdoQxp4uhse7zXoUVAUJ5LFfKdBFtkiLbPpTnE6Kg4NLu0/WaahFM
	 CYPxeKutxJehl2sWabJ/9/hXa0BMRmH9XAvKsGYRC7yGmwAzViRw415fHkVng/5UGvPAA
	 m7OsBY3jUysI3tiUxfXUupC8zZVvMsPd4Yj9oZtxKfhAbSlR0I0QK45USd5WdZTNpfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
	b=bz81NzB+sd3BrrxLMPWd361oJOAZ4EOWyVg3v1hxgF+571A7zMapREP/mi+3dbS8PIIU
	 AcoMZnqHLJJcDaTtB1SWvTEY7CrxW0oeP6XqNpTiTPtyknmTISU8zK5kkr1kcXr/+s07v
	 RFb8nNprhpOCI9EIQKmhC4WGBT+7l89yu9nWN14kb5k4WmyqeCuzBB4p/KdzYleUry58V
	 anQQ3+kDNyQYS3gJBvKycmdnw5Mc0ZMYurvyAjKOfcshDVGQcpFyLeD/MYo0AL53lZJ76
	 7S1mnyLrDP1mxLwi1b2ufAJL2jUkbSSCf1vEJ4mfYR20BUrT/nonXVsGx2p01zYcyKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acxBg2gl;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B4606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38B4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acxBg2gl
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89ecfdbe443so102361b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554609; x=1795159409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
        b=acxBg2glBEQVmwb3otbkyPsaaQPcoGT0veSWBH5GR/Wq5Vta6S6wWeq//2cRN6085B
         EsHafeYeYRy2KzjtXTVDLOxd5qhu6/qV2JM20OyWn4TTy9tmAGEmTAmpbEpalu5fSDnB
         /x6KPy62ntoH8riCQO9JN2WqmKOs0pEKy8jK1p1/gxNPGQRWniVZmzIT+da6upCLrG/p
         UnKe2eSsm+e4+6oeLzMxrVI6gpZ2J9SuufxaC8tLBowPf0av8iKUxfE9+IEtnANeAKdj
         4p+VBU98s2a4QUBpgGp+nTedZwRgwWIE4euF80Tn+8T1X/nmfpvIlmue8Qw3Pmv+MICK
         40iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554609; x=1795159409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
        b=XGaigSnfZ9jB3VD2iIXwetKvSIV79wGyQ/ZkUdu5b6nDVlOU+sK2w50FdyN3E+mSGH
         xlNflAy5BiewtNOvwlNknVinqQma7mXqmp5oiSicQO5TXFXxHkKBEWklDS3WZWp8mAH7
         i7E6Rd1qnmZeSbfFzwny3Yt3nGdyIX3UlPZopDx5u5AixXPZat0NMETBl5+u1Z5IM3bQ
         wDC/qYuMf0bCS1yp0ADOH3KMpCjLbDaJqbLDdJY5DeTZ4aZympOLxaFVDmFKRKovogHu
         S1HUs4PAT/vW9qTarMBdxiw+kIQI9EK5+w39M1xtxMwdGkCaq4P7Mjo8f+AAj5hFSAax
         vVrQ==
X-Forwarded-Encrypted: i=1; AL+hErG6XTb5X3EQ6GBFJfYqFTbnd6vc8OmiO4L5zhYGXMPmyW0aqt8mffFow08AuvAljaABXXoWe+iZJ7FaCpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+ORZZ/zCE1/Qxy5cn+N1Qo2LNclA3g3iYKO0YwGkGBb3u8L5i
	rgT+qKN/Q12Jx5Abl/S/Kph9jy/lhZ1LkGCn2SGzKCt3KLtBKhLfCEBQfBN4CN+l
X-Gm-Gg: AYBFou3hQL7C8qu824W1264SkTtA8hIqTsKzhfKqWr0fMB7Meelhovb7eaMLa2Y1gkt
	ioPRK01FOYYnuiOU1XhOsKsaxDbl1EmHWONwOY5a84dZXl7mHHASDrGuynsxF4JAOnjRa2UggIt
	orSQw0PFTDi5wzrQWwYKPzfhEPx2bw4NIbBf3pFQ1B9IW7Z5ZbYJkIZVDuUEfe13t9A6kTcWG4Y
	cauj8viSqh9WlZK+c8PcDWnEFNnRFBS+FRlCYEFaH9afP4VL5zrUOX2/rsgEybTkFSvVNLqr3uX
	sLY9x9aoCfPC174DIgBvkKN5Rq4DuG5QjBGZiTwzfwRfvhgNWMhpSbpArRorIyMOcRn3WjfbL3I
	vZjgZGAAxjRLjNxzrbR/8pTWCSqefZxG2NlMMopKYr0IR7x+UH8Oj7cnapf8BUePbl2QWW/23Xe
	u3nf/+inqugoLeX6fccJKAWZZ0JGRJTikMqe135LaMZik0mKR9BdyanZPo42y4jlODrGpZSfD0c
	7LqF7qpC0tQcmT7+0uq6PlXKbht9Lb+8e2Lczzf13u/ZDbYUnlGOY5k0SobChFI/DmgqwCVfrtb
	rIoUOqFk+UjrIncN2Wzk0FD1OyAmMJsn4Ga83FtTTZt4hRMIqva8AKtjJ4/bdiD9eC74wx7c+57
	dLpg0TOuSwWLq
X-Received: by 2002:a05:6a00:bc8c:b0:8bd:30c8:e414 with SMTP id d2e1a72fcca58-8beb3458494mr3160450b3a.1.1794554609089;
        Thu, 12 Nov 2026 23:23:29 -0800 (PST)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8becbad7de3sm649518b3a.0.2026.11.12.23.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:23:28 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chen.wang@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hminas@synopsys.com,
	gregkh@linuxfoundation.org,
	looong.bin@gmail.com,
	dinguyen@opensource.altera.com,
	paulz@synopsys.com,
	balbi@ti.com,
	dlan@gentoo.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Fri, 13 Nov 2026 15:23:05 +0800
Message-ID: <20261113072305.220610-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
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

On Tue, Nov 10, 2026 at 03:06:21PM +0800, Inochi Amaoto wrote:
> The current DRD implementation of DRD will cause a interrupt flow on
> CV1800 Series SoC. It has two reasons:
> 1. The DRD does not sync the phy mode when change the controller mode,
>    it is a violation of the DRD as it does not rely on a OTG phy.
> 2. The CV1800 is entered with a Session End Detected interrupt, but the
>    DRD code has no change on it, so the controller will enter the
>    interrupt storm.

Thanks, fixing this in dwc2 makes sense to me. I am dropping my PHY
series [1].

I tested patches 1-3 on a Milk-V Duo 256M (SG2002), on top of
f66469d9905b, with this on the board DTS:

  &usb {
  	dr_mode = "otg";
  	usb-role-switch;
  	role-switch-default-mode = "peripheral";
  	status = "okay";
  };

R=/sys/class/usb_role/4340000.usb-role-switch below.

Bare board on a PC, after booting:

  # echo device > $R/role
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

  PC$ lsusb | grep 0525
  Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget

  # echo host > $R/role
  # devmem 0x04340000 32    (GOTGCTL)
  0x002C00FC
  # devmem 0x04340004 32    (GOTGINT)
  0x00000000

The interrupt count did not move over one second in host mode, so no
storm. Switching back to device gave "configured" again, and "none"
went back to device. I did one host/device round on each of two boots.

On the USB & Ethernet IO board, with a USB stick plugged in:

  # echo host > $R/role
  [  136.556790] hub 1-1:1.0: 4 ports detected
  [  136.837392] usb 1-1.1: new high-speed USB device number 3 using dwc2
  [  139.174764]  sda: sda1 sda2 sda3 sda4

  GINTMSK 0xF300081E, HPRT0 0x00001005

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M

> Note: This patches set does not resolve all the problems, as
>       usb_add_hcd() will override the role set by dwc2, but I am not
>       sure whether it should change skip_phy_initialization of hcd.
>       So I kept it as it is and users still needs to set the role
>       in the userspace as "role-switch-default-mode" in devicetree
>       takes no effect.

I see the same at boot, and the "set mode" print in the PHY driver
shows the order:

  [    1.777738] phy phy-3000000.syscon:phy@48.0: set mode 6
  [    1.778979] phy phy-3000000.syscon:phy@48.0: set mode 5
  [    1.779005] phy phy-3000000.syscon:phy@48.0: set mode 1

That is PHY_MODE_USB_DEVICE from dwc2_drd_init(), then HOST_SS (not
supported by the PHY) and HOST from usb_add_hcd(). The PHY ends up in
host (0x03000048 = 0x142) while the controller is still in device mode
(GINTSTS = 0x04000020). On the bare board the UDC stays "not attached"
and the PC sees nothing. On the IO board the hub does not show up
either. So until a role is written, the port does not work in either
mode. This was the same on all three boots.

I am happy to test the next versions on the Duo 256M, in both device
and host mode, and send a Tested-by.

Once your series is merged, would you like me to send the DTS change
for the Duo 256M, or would you prefer to do it yourself?

[1] https://lore.kernel.org/all/avLC68zOj8WKuslb@inochi.infowork/

Regards,
Chen-Yu
