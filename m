Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428654B1274
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383954; cv=pass; b=gFnAWhPiWAwjkIhhQn55w5tVloVB1pJRmsZFsz2agKVfROiFLNv2sKuF05gb+/HgeFTcx1CgOAQuScT+QOCGqNooF4suc76deKBjW/sWoc1EjYvAvENXFirsp5ltEpMy/3hTgin1csVPlVlnNn3d+aErDtOS7WarHjiVYEwOYzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383954; c=relaxed/simple;
	bh=kRDX5d4Fxp6lom54Gexo11aTEyNvY7I7wqMeKyzSVVE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iew/K4sCYNK8VkCnxQV/IdFLKvoU5l0YofCzCl4t7a8buJAm2gNTlTzqD+JgVAKTlz53CMSKMTlZEfQFDfjSmyjS/5JPeNggX2k9jlcZQMIz6xRfhdcHctxzYymItI+vNgSQshLNuEVObWVMtFNTHLjUVU+mU+fqBymV/cbJJI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=of8+yMho; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="of8+yMho"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so47826671fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791383946; cv=none;
        d=google.com; s=arc-20260327;
        b=S1oC2xdZ5qHqwuh3UTROxttayq8/luog3Qv6D6M2ny+mgfkHY644rHRqY6ExB2H5zE
         DRdp/1KV5HtzfFI33YtD5QWX/29lF387H8eX5IJHWWcxS095Zlab6Y2Z/EYKeKLivC7k
         HDhojRXticIYKwF5p2yCUCJrPv6oCVuD4fYfl062mCUdAEtg8aUOjdpAqhfcPidxxFoy
         NjQ59/IzE4hypsNS8JlRa2pojbEx+conbFDGD0M0R3+dQkZo9QKdvV0jdmPReGEtchjd
         0uIUIta62reV/3Jna26j5h6O2aVvnxHJgNUgAjvamZw+idfmTyX6bY8GQ5nWFPMTQE//
         DV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        fh=9S4HVtATdVrOlrgzNuRFf0V+Fq1TPl3OFtoM1B7zQOo=;
        b=B+bKAqxFRLV3Qg98izXXs2GZSOonxDcmJlWvISPmpOG5ZBGuwmKzMEyxqTX0Few21f
         7O9AJdvXvvadxWKusG/MJFvFUpKbZeHVPg0fXMjfMg8ic3Q7+aMj/G44V5gxLF0Jgzoq
         5q803g8kcSOrkmxxFE3bSPHIvjTezaLKaRaD4chVTXxMct/b0uosqjNJTN6xilUenFwa
         +18fJkMFvgLjEKKob4qMbaGbyooyyXRq8bkwQct1GKV6i+Kbgj7HBXMfiOk/IgfgWxrr
         RMHvVYl0+UGg7DVBRoxQfqC6XfCY3aym/gc8U1MgDNp8c0sG9TGxYZ07a1iucASpe+bg
         5SUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791383946; x=1791988746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        b=of8+yMhoUczew89GXFWQqf1qdPVn70afHaFRCUI2xoKuTcmEsTWLrdNCHTh4TV1Fkp
         FvfVuyZPAweEq3O8ar2vBLskBXNgmxb7XVxZcXZLR1rxf/cAABPjp52z7Hx3D3AaHzu5
         F6WwpchiGaLgcu5n0fawAljxgdTkMKUlcWGC4XNM3+ymHMZ/80YtG7x/bpbGpSdQdlea
         /HaDiS2rQU1E7Kv4CS+id6XDk56RaOYmARBmXhpziFN98djzc6B4bZ1EVDZKP34U3pXY
         6ubBcexar99VE00YLqZjJ692N6BgGSo5H4SYu7q0A4UV1c+3rMi2lulu/ZUGlOMewlq+
         Bdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383946; x=1791988746;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        b=CDiGXMhxFuy4vW0hkzEOZ3WBHe5xB0WHrgHaw597qJ4Cf8Y862dtoYBcvjWG3oe2+a
         5raQ0ksbtd319xx1mLlFFfD3O9kQK/AoaBKmNSp0dM40IWe5AMV3M7mTQ8IJLPS01K7U
         KJn6g0QQW1gGbtL2jtxJiDA57wHsP9PmupKg2cKArbRT99Uo9a7sLlWyfTgKpw7rCdji
         wQLlqcJ8xoe2IjoLnja3LX8deXmtoR7ym8B6oOa3TEuZcmtd64R+IVJYi3ydAEOh2FO/
         oyBH5NbpEPeP9/UeFsrE8Bro5KmQlLkZosjtTBiJVgoNWcCcyxXtiBP9Wxq+iv1KUC66
         yogA==
X-Forwarded-Encrypted: i=1; AKwUvByEXtAdOyHoZNJ4adc4+cSGDSBnkfMLma7KRz2dfZTsufjWJGj9wsBKtbNdnRMiJIseFkov4YRnzcjY07w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqpEbyQ0JndeJ97i0UMGctjmroEOWX877S9BkfNMCPBnEB2eXs
	8+ShlimTtbE5b0tELeMcR/qlgZwKsBzWnMD1AUnLvQg+yA8OLqzvt3HHMxsE5usZmOvtJw9x51W
	CEhjH+24FB1TpLx7qHYWoJWNZSQ8/W0Bw0Zx/9wMksQ==
X-Gm-Gg: AYBFou3Zgr9Syg4IUlucPX2ZN8UFRhIM6yIT/lsq98ErCZZWHpb6x46ROLD5wmBXVTG
	WNscgXupGuAv6N+zegjtD9AIS61pRvGgyUotK88bkkYToMB6yfOKxgHRJrRABzi62i7Rl62tIz4
	cPCsbynyXm7gA+amiO3mefCAugYOXb81XlLb8AE8SzEw2uk6g3brVbf2H57QslgVXDc7F7DvCic
	O85rtFDHe44Nnycadc4ld167x7f3RiIL3ml8x3gnygVLHUjFllisUtYEJNf7RShmTQA8mAK7W0G
	XyxSJ+3h7JKFKMwirsqPTyn1n7iEVCMa0wf1DvrQSlqHhVWQKa/goss838PsJTua58jSUVAd4a8
	2G4OEfEPu
X-Received: by 2002:a05:651c:b08:b0:3a7:72ec:81a3 with SMTP id
 38308e7fff4ca-3a9a2c34ecdmr6211391fa.8.1791383945851; Wed, 07 Oct 2026
 07:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Wed, 7 Oct 2026 16:38:53 +0200
X-Gm-Features: AclHuK9LjOZDikj3APsjlF2mTduppp_g_q38pi3ZhWs0i5yvsBiQNsj3lRGM9E8
Message-ID: <CAFERDQ3gUav1E7sw7FxsPmmt9GW=tP_Jh=7ufABs9CSaMYK6kQ@mail.gmail.com>
Subject: [RFC] bcm2837 RPi 3B: sdhci-iproc Wi-Fi probe fails without sdhost
 (GPIO48-53 left in alt3 by firmware)
To: florian.fainelli@broadcom.com, robh@kernel.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
When building a minimal kernel for the Raspberry Pi 3B which doesn't need
sdcard access at all (root filesystem fully lives in RAM), I noticed that the
Wi-Fi doesn't work (kernel 7.2.6 with bcm2837-rpi-3-b.dts).

With:
> CONFIG_MMC_SDHCI_IPROC=y
> CONFIG_MMC_BCM2835=n
Wi-Fi doesn't work with following messages:

> sdhci-iproc 3f300000.mmc: allocated mmc-pwrseq
> mmc0: SDHCI controller on 3f300000.mmc [3f300000.mmc] using PIO
> mmc0: Failed to initialize a non-removable card

With:
> CONFIG_MMC_SDHCI_IPROC=y
> CONFIG_MMC_BCM2835=y
Wi-Fi works:

> sdhci-iproc 3f300000.mmc: allocated mmc-pwrseq
> mmc1: SDHCI controller on 3f300000.mmc [3f300000.mmc] using PIO
> sdhost-bcm2835 3f202000.mmc: loaded - DMA enabled (>1)
> mmc1: new high speed SDIO card at address 0001
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43430-sdio for chip BCM43430/1
> mmc0: host does not support reading read-only switch, assuming write-enable
> mmc0: new high speed SDXC card at address d555
> brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/1 wl0: Mar 30 2021 01:12:21 version 7.45.98.118 (7d96287 CY) FWID 01-32059766

So, just adding CONFIG_MMC_BCM2835 makes Wi-Fi start working.
In my understanding, CONFIG_MMC_BCM2835 should not be needed to use the Wi-Fi.

After analysis, I noticed that the Raspberry Pi firmware leaves GPIO48-53 pins
in the alt3 state when Linux takes over (sdcard pins routed to sdhci-iproc).
When CONFIG_MMC_BCM2835 is not compiled in, the states of those GPIOs won't be
changed by Linux. And we end up with the sdhci-iproc controller electrically
bound to the Wi-Fi chip and the sdcard at the same time, resulting in a probe
error for the Wi-Fi chip.

Here are the states of GPFSEL3 GPFSEL4 and GPFSEL5 tested with devmem:

Register  Address     GPIOs    MMC_BCM2835=y  MMC_BCM2835=n
--------  ----------  -------  -------------  -------------
GPFSEL3   0x3f20000c  30-39    0x3FFFF000     0x3FFFF000
GPFSEL4   0x3f200010  40-49    0x24200924     0x3F200924
GPFSEL5   0x3f200014  50-59    0x00000924     0x00000FFF

3 bits per pin: 4 = ALT0 (sdhost), 7 = ALT3 (sdhci-iproc)

In the MMC_BCM2835=n case, we can see that GPIOs 48-53 are left on alt3.

I would like to be able to compile Linux with CONFIG_MMC_SDHCI_IPROC and
without CONFIG_MMC_BCM2835.
What is the best approach here? Is the kernel expected to rely on the GPIO
state left by the firmware? Or should it configure these pins itself?

I tried to have both sdhost and sdhci-iproc claim GPIO48-53 in the same state
to avoid the double routing, but it's not possible because pins can only be
claimed by 1 owner:
> pinctrl-bcm2835 3f200000.gpio: pin gpio48 already requested by 3f202000.mmc; cannot claim for 3f300000.mmc
> pinctrl-bcm2835 3f200000.gpio: error -22: pin-48 (3f300000.mmc)
> pinctrl-bcm2835 3f200000.gpio: error -22: could not request pin 48 (gpio48) from group gpio48 on device pinctrl-bcm2835
> sdhci-iproc 3f300000.mmc: error -22: Error applying setting, reverse things back

1) A solution could be to let the gpio-controller itself own those pins. I can
propose a patch removing:
> pinctrl-names = "default";
> pinctrl-0 = <&sdhost_gpio48>;

from the node &sdhost in the top level DTSes and make the gpio-controller
itself change those pin states, so that no matter which SD controllers are
compiled in, it will work.
I tested this on a 3B in all four combinations (sdhost and sdhci-iproc each
enabled or not), and it works. It adds one message to the dmesg:
> /soc/gpio@7e200000: Fixed dependency cycle(s) with /soc/gpio@7e200000/sdhost-gpio48

2) Or, if we can't support RPi kernels with CONFIG_MMC_SDHCI_IPROC=y and
CONFIG_MMC_BCM2835=n, we could perhaps add a Kconfig restriction selecting
CONFIG_MMC_BCM2835 automatically if that's really required.

3) Another solution could be to ask for a firmware change, so that the states
are cleaned before booting.

What do you think of those proposals?
Martin
