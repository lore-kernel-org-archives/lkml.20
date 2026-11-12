Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794508788;
	b=auHAj2TwTyIcMJ5WW3cr90SvPmPZp0d+XzCS77E6cgNVD1rjCZ8MZcs4/RF+EJeKOnmk
	 2Ql5dDy0fOxrqjA2l1Ic5yjOdzxNvOWMRQgAGLrUXSrxBIJvIFJrZJGUOXd1Bsxp4CJqZ
	 CJlovS56zqAXKc1+W2jaK8cPc0QLZgpTl8a4ruCpDzKCFAmALmJZfjy4hS/QuHgAKpXpD
	 H/TwxCCDNolfyVDZTcODZcabuf+7KwhKC6nOn578aRfTBj/VGZXm+YCyRzQxsnO0h4KQu
	 cz70w5wSQd7lc8ysAlf1AIxORZnaDO9PrO12JbX65Km+g5uyBcK3uOfVYj80lg5j3Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=i6MYREZ9DJVIZIXy4iFOVHblxNTs+WTNzj/lKTj23uA=;
	b=ZkIa4Kd7+czh9ou/27K/FiTKS22uxso0GA71vCOL2efvpfika87fxzDf8K+DtXFX/yTX
	 GNB9zm2GHQNpRs72zjqZsf9K+nnLHT3AFYxU0H05kReD7N7aMBQUEw3NOdyKsNstyupdr
	 my+iiaq5BWa85n5jVp4xTkcJEclRSPjLA9kK/2UiAwdWxrPkSOEdVqJmDTG7Ty9fVJwJi
	 T5dNbn+FcoHobbTf8FXfhESfcnkNUSapzZIjtvbGbHboMkWVA6bCNeHpYKtPp15OLK0jf
	 K5VodIjdJc+WBH0Wvgbv2lKDjn1NErcAYbi7iLwai0KmVDLavxH8kXJVvbY+DkYVKdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I3k3j/mY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D4D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3k3j/mY
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b31fc13124so1687937b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794508787; cv=none;
        d=google.com; s=arc-20260327;
        b=Tf8zwD3h0mtRKTbw136xUO87/TjcZKPX0TQq//SNbftU4Fh2cM5vcjJcsMcKOuUQV9
         W6QCfHUc2NSpIqr/FjbNQVUJ6VygJ1rI6eCqrEhu2ipxtkz6eTlRvSVImnpcGco6cWVN
         MR/uQbuIH3A7IjdxhwbsnZVXFZuoPyuuRy7h6sQ6OEPciUrtFigLyQZsF40laTb8B+dt
         ymGWRfOb8P7wWHUX6amgs/Dw4RcxwTmRN5FRXkvoWHeckVLHxBcZAmSHeTRCkw/zbId4
         nEMefbBTGR9A0vlvWjzWLR9KZHHLLWSNiXsy0xQi2pYCGWVgh+AHhvDset9H0spPmzxZ
         rpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=i6MYREZ9DJVIZIXy4iFOVHblxNTs+WTNzj/lKTj23uA=;
        fh=bfKyy4pX42A7gzBvK+Ckin9QfRite9BKFCnYhW11gng=;
        b=feLe5HiZef9uXVU/UR5UM2Rvuhs0BBBKbLoriJfTUfPSXuw2PDBXeWLa1h/vxsZ138
         6wzaFjW+mIBxE07JXJq6FxT4hoEjQ4SSIgEMpdoW3JgOmZZs17dxFKgqrwZT6kGGSVIc
         JZdtEsryp7XSurrnrZNRqMOdHT0BDdK41H+v0QnrtTHwT3X/Hk2yC9Fz2D7nUTa2h3cb
         UMsAPMjzlC2oVEQan9KqwxwWsEPGHXyGe/1ZNogT8/rJjoJexPmkRk4xjZC/75eyHT0+
         XmIJ9v0tZdpnHQikbi8nUbc8mSlzt0MVfUlYUn1D4GyFVhiq5ki3WgA7AoJmCyuuoioH
         yduQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794508787; x=1795113587; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6MYREZ9DJVIZIXy4iFOVHblxNTs+WTNzj/lKTj23uA=;
        b=I3k3j/mYTGTMw/FTBPOP4HB+6ZhJfLYWSOZ6mfORv6arkKqEd9eYgj0c4y6HbtZ8sB
         IdFGTCAvNPynYPbO3LPein1BbBql3tUwQFx17Aef7RbiS07ckfzQdIsnOsHI4NejsBFN
         e8/sXG54bec0YuOi3HRZs9toEDblWvD47qGgJFp3gTh14g150slY7xcn3lBEQ2OiyJ5x
         50b95w5f+LSzvGV4ah04jqbIQSCvW3upSHnNeefPhpSzcXZsItC8nHzN/Uhg8a/cajdC
         sVa0lS85MQq3xKuqZxe65/MbCAZM1J6KScUceRAKL6Toc6EjWLueW8yHRfvfIaJGG9mn
         rXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508787; x=1795113587;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i6MYREZ9DJVIZIXy4iFOVHblxNTs+WTNzj/lKTj23uA=;
        b=pM+8JStL8/sI9U3KMl6WRpFCBC1rlrC8U91gpxllhtTYNatgteAzBDnNEvZbvASBdr
         rwld3ZTV47BUDh/oTfSvIXLT49Rzwb9HHv3Uuy66CSN8yFZNmkQ2QgvpNk7UBXi/ky4s
         cV2ANJdz1Qry1zkI8T3nkCgO7Ra9n0dTCrce7I2osK3jaskqw/PJno1CdvsT7OGizEN7
         zU1I6qsr7mPCFoLtxWcQ5WHFAtfH1+6BQraAPeoj3uJPWqSXzVmpd0A4f7cYy1uhOzu7
         PKLx21QoRBRchCtHUO3+rwoGytDvCLdMgjWOptt5azPtHL6qkpXV3vPWOADlrBZmSMXY
         wdvA==
X-Forwarded-Encrypted: i=1; AL+hErGEuaLYzRcirPqr58yzVnB+ixgUdUrischgXAmcS5kH0SYTFLrwdaw8d72I1AVWPZTifqocfJmECGB/5AU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HPlQ5aGcGggJM5NjMcM1OUhE520QoEFBfifRMCtM5/+s9d6/0
	LhJDvWwKzVFo1dKj+JBOsd4sSFfKi4EU9aakILxMrMh7/2piUh0KbhAHNaUFjosVvYnvpRtZdI0
	zJaXnlRJ/bDarHj6BSE+0pXMAKNHNp08iJ4Cb2f/EtD3m
X-Gm-Gg: AYBFou0H9AQu82GFp2F+Lvad6s/91F8MLBCH70Sg1XfXqnk/dVhFUhtHyrCQpjCDw18
	Nw40uruTUbqgoqC0jiQffHQ0Y2igXjOenD/sRLQ0YyJlidMQbNkWNHu/HkoniSyfj8bFe+TD0xw
	HYseG+TItpyUxxbq2a4ERPvf82QyrQbgTMio0yXtD72etxeRHnyft9vcqEdj8oYE3d+VmSYT+8e
	d6Gr3qwVyIXSLsTrMwfRR105TpfYsix6w8VANwtYEuYm6q4uXaAIE//xcuOl6/SZ7OejC8MC8su
	Mzu8rx0VVD/qvFcnreBLZ4EixfnFhL9zsyg7GrdjRoTL5SS2evaV21YXeJFlNckM79sJZByAM3I
	mP8MyCqP6lqvtaCijxfAIfvg4lF6kj7gwG0NzWHzjBvs8JXuSWbm96FVBx88sQ+juIz5wOQ==
X-Received: by 2002:a05:690e:4884:10b0:67c:2674:ec72 with SMTP id
 956f58d0204a3-67d894503f4mr165883d50.4.1794508787147; Thu, 12 Nov 2026
 10:39:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Vanchez Rodriges <vrsmilemen4@gmail.com>
Date: Thu, 12 Nov 2026 20:39:35 +0200
X-Gm-Features: AclHuK_bSBYZdCtuoiVdZFboVrMKpHYHDVsA8gPuh0MKzFXHdyBQBj2cHtvPzxw
Message-ID: <CAEoJKMuqFEZO2wfV09ea4ioKeExbP53Jhn2yQ6Wnxp+fpA6yGg@mail.gmail.com>
Subject: PCI: pciehp: spurious "device replaced" on resume, Acer Nitro
 ANV16S-41 NVIDIA dGPU (same as MSI Claw A8)
To: lukas@wunner.de, linux-pci@vger.kernel.org
Cc: bhelgaas@google.com, Derek John Clark <derekjohn.clark@gmail.com>, 
	pgriffais@valvesoftware.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This is the same problem as in the MSI Claw A8 thread, on a different
laptop:
https://lore.kernel.org/all/20260806214808.1202819-1-derekjohn.clark@gmail.com/

I am not subscribed to that thread, so I start a new one. Here the
device is the NVIDIA dGPU, not a card reader.

Hardware:
- Acer Nitro ANV16S-41, board BRZ_SKF, BIOS V1.14 (2026-04-02)
- Root port 00:01.1 [1022:14ed], HotPlug+ Surprise+
- 01:00.0 NVIDIA [10de:2d18] (RTX 5070 Laptop)
- 01:00.1 NVIDIA HDA [10de:22eb]
- Kernel: Ubuntu 7.0.0-43 (based on 7.0.14), s2idle

What happens:
- At boot the firmware writes Subsystem 1025:1969 into the GPU. The
  kernel caches 0x1969 at enumeration.
- After the first D3cold cycle (runtime PM, before any system sleep) the
  register at 0x2c reads 1025:1883. sysfs subsystem_device still says
  0x1969.
- On resume pciehp_device_replaced() sees the mismatch:

    pcieport 0000:00:01.1: pciehp: device replaced during system sleep
    pciehp: Slot(0): Card not present

  and the resume hangs. pm_trace points to device_resume() for
  0000:01:00.1. No pstore, no lockup or hung task report.

What I checked:
- It hangs with and without the NVIDIA driver (module_blacklist), with
  pm_async 1 and 0, and with the GPU kept in D0 (power/control = on).
- In ACPI (SSDT), the power resource of the root port, PG00._ON, writes
  the subsystem value through a register at 0x40 of the GPU
  (PEGP.SSSV = DSSV), only in the path after power-on and reset. Writing
  0x40 from the OS with setpci does not change 0x2c.
- If the kernel caches 0x1883 instead, the problem is gone. I tested
  this two ways: GPU removed and rescanned after one D3cold cycle, and
  GPU re-enumerated by pciehp after a resume. Both sleep and wake fine.

Workaround that works now: a oneshot unit before systemd-udev-trigger
removes 01:00.1 and 01:00.0, waits for 00:01.1 to reach D3cold, then
rescans the bridge. After that the kernel caches 0x1883. Two lid-close
cycles passed (25 s and about 1.5 h), with the NVIDIA driver loaded.

So this looks like the same firmware behaviour as on the MSI Claw.
Lukas, your quirk_msi_claw_cardreader() in that thread
(https://lore.kernel.org/all/any5ciFCjh-0cGkB@wunner.de/) matches only
the Realtek device, so it does not help here. The same kind of
SUSPEND_LATE quirk for this GPU would be: NVIDIA 0x2d18 with cached
subsystem 1025:1969, set subsystem_device to 0x1883 (the value the card
reports after power loss, not the vendor/device ID as on the Claw).
I have not built a kernel with it, so this is untested.

Your other patch for the removal path
(https://lore.kernel.org/all/any3vMJMpxdK8Ekp@wunner.de/) is also
relevant: here the hang is in device_resume() of 01:00.1 (snd_hda_intel)
while pciehp removes the slot. I have not checked where exactly it
blocks.

Other ANV16S-41 owners report the same hang on wake, for example with
RTX 5060, so the IDs may differ per model.

I can send the ACPI dump, lspci -xxxx before and after D3cold, or a
full dmesg if that helps.

Thanks
