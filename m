Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817364BD35D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601693; cv=pass; b=CosydzJ99gqpPhpwx2zesrvokVE1KQTPABNl6pVpWa/o6WAOHyeIjDiBrTe713A6UjOL8dXITy5TL6J1RtDmEYTGM2ydej6AIYoj65xP3Rf/Sd88Jsr4at2wz97nKBrtSEs1nNClhcjjEL+JsrtCydU4MoEW+xnWGjOYIiZ3jQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601693; c=relaxed/simple;
	bh=0RvoQj5vNOfyxA8kxUC6Dv9RTQAzgxllJsJz1LHNKQc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VLiZ8iFZxSRy/bbONAAG/6L4KK0IQFqpaD3PHBQT6Jj1GTOcfWxgE1JkXtHg5bQi49efc7RGy3hIHvsl6eL6novAtPS+6YSxSOIBYN0VnpU7NC16BBO0aFaw0tf91XVITf9cvtTCG+MhSaQxJkFHmNJHCMavD0smuQJB7eZ2SRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jitAvbaM; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jitAvbaM"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dcdc386ddso161441566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601690; cv=none;
        d=google.com; s=arc-20260327;
        b=MerNPO/y2v+JL/9Ic8YgFq6OurYMX7E4WEQlrbwQUTFg+Qv/69j/824RD6oTER/O1W
         PftaGcGtdbZK80e5QRe6zP3v0+jngT7rI9uObMplKMaaCEMo7ulisZiEEi4bBg7ZZvCK
         jkzH8wPFPffqw3zoJQpuPrBnA8eIyV9FO66vmMW12zXVSIIcIDAx47OrfxgrvkjqCZiT
         OTjVDYvreWExWyvHyjuOWUghQ73kRmgjzRf6oqmYdlJhLiohhYSBDp5UeXVisRpqKTc+
         N3A/78RWPuCRUc2b0XTiFbP9geBtgvfoZ2tIPR00YH36SZt8A52kxL6iuFjhNdxOfbmD
         zDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lKpVI/GIjH6yd0YCpBwARd6V1SVjcmFw9CjyMnWolos=;
        fh=9hEB4wtI/0xed1czRW3pLae6hSMdWSBg7xiwGXaVgBg=;
        b=GlkzjLErbUMQmXuSxnMIlP2i8s5XXsO3ZGMZhrcRGIa1eIq/yjN3z+T2+8kVByCTmW
         KGSl3I1BIboXw82Stpy46L1/CmGCLVU7RJzZtRaP9SFEQlzSdcdTwGCjqFQKnANmTRlV
         VDxcrQPW410eky8bNmu7PdSr5MlJXQWLlpRnI5OUV3g4fwXBezwVualzplbZoSzHwQRZ
         6c+H59NNuqyDnwqvDlQhmd9Z7bQMz5NxSelgh4xCwL1plNVy3mpRVDYNmjOz7bqGXQlE
         ZuFwfzZtoi4wJ7WnEf/9XqUaJIxQPMk8CzcsbPrs9+0JD7c9Rm28WCIayYSwF/kDwsyh
         WXUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601690; x=1791206490; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKpVI/GIjH6yd0YCpBwARd6V1SVjcmFw9CjyMnWolos=;
        b=jitAvbaMDVXAfyzg+wlNY9ajPHS2TPH3SE0TIZHl1f6Gdc6Bot3wUr2NKyjW1mU/TK
         k4jomaRCJ0XZGARZ7Utmt7WPGo9PJP1iHe3LjFmkzsPO3dwXrUpb5YUHrfOBtcqUuoE8
         oEopiEIcD8aQa4X4b8/s9kGUL6w1LUuKQqeHe0WIFRQUHbR2K9ZN40dUWdW6gJ9D2bTq
         PMfm2UiDchTqxC4KKDNnJAZ1xA7r5Z7Y7zysSmBalsU229mzlnzgaWyfEdR4TFyMh4zq
         yNjfyQMr8Ohv0bXwc3HW4biS5Zpz8HCCebaAOdaorwa0mV2HIZLAsgyFqSxLuYlwPbtd
         8M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601690; x=1791206490;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lKpVI/GIjH6yd0YCpBwARd6V1SVjcmFw9CjyMnWolos=;
        b=Fa0aVS40gU3aDiDlwQKhgK2srntEEgeKx1+PvhUkZrKl3AHGRjGyXTaz565IEWhn2I
         I4a6NesrMw97wdS5CoJze5Bse8Q1Pastu6l2mIYTuEndWJJtsy8wup78RtOIpAxUm7u9
         FOCMPBZfd84Rc8tUgymkwmuanT6bGweDC3JBVlXw3zfAxkDfDZeUUpCAHnL8AGJL5/QN
         yl/lIz4xiWTgUBYs3brqGESmGqLP4Vb7v/ovlyayEX3uBV2zSZh+TjiyX+zEzqvw92ut
         pqjcjbkBnAnZrhSpx4NZs/lErIZswenyOCkdMy2ZgYcKnGDVo9rnH2Yimnk7Ju2cXHGu
         HRPg==
X-Forwarded-Encrypted: i=1; AKwUvBz/Nh/1JIwxWplgIHxPbrA9/w4WBIh2683Emc7Ro+UH+c9WAw1NnuP/hDjy55THXAG8y8t3DBQlRnMS6ys=@vger.kernel.org
X-Gm-Message-State: AFuF++mYADR0Y0VHY4Ws+d4UzqyD0OiUI1mSPQof71QishtkCeQA9wsM
	3n1lNJJIoGWhZjSnD4t8qUVK3wwGQrjXqLFLw/PsSadcJullpvs/nqKOjgE7rIBpUV6zL3pPck4
	cS3OmFqxSZvA/L0rkgepIpIOrXRiOxak=
X-Gm-Gg: AYBFou3HVPgsF69C76zVg7Dw/2KBdjjNUMGkelcyv4QNGyAfMtvIrHTaeKJxd987TWL
	9acZmuIBVe1T+Ep/Ah20IIQJNK/Dr4+CSMJAT1WckmC83sYAVpBXFk3wQGhR9+NzQML2Ec4HTtR
	UeURPioFAk2dtwJL6CS0bjSo4OawOrPGCTmB73FPIqFho+kfsYiimg+HCGPvDWdawTvd3+Y9ID9
	ZR2HZzvvn+nuxQxDinMeJCfn13i6oaxYtahY9xaGDyKVwci1EAliCwUFr1h8WLFTAtIOE6TBX4K
	faYtjpHy7dd10ERSwbb4ybqZzW076S5bJ7ni6GxIL68=
X-Received: by 2002:a17:906:c115:b0:c26:22ae:b66b with SMTP id
 a640c23a62f3a-c2ac2328075mr1105392266b.15.1790601689462; Mon, 28 Sep 2026
 06:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: V3C14-Embed dead <v3c14.asus@gmail.com>
Date: Mon, 28 Sep 2026 15:21:17 +0200
X-Gm-Features: AclHuK-PFJLnRG6bEMoU119kuWxbU_2B_Xy8XXlB17RbyGVjmrLfBG_DLK808G0
Message-ID: <CANXPfioBNN5mrijuy=sS3NJg8aWBKARi59uH2ZQrGFy468Z6dA@mail.gmail.com>
Subject: amd-xgbe: CL73 autoneg never completes on 10GBASE-T port (ASUSTOR
 AS6804T), forced 10G works
To: Raju.Rangoju@amd.com, PrashanthKumar.K.R@amd.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On an ASUSTOR Lockerstor 4 Gen3 (AS6804T) running Proxmox VE with
kernel 7.0.14-19-pve (a downstream kernel, I have not tested
mainline), the two AMD XGMAC 10GbE ports never link up with
autonegotiation enabled. Forcing the speed works.

Hardware / firmware:
- ASUSTOR AS6804T, BIOS V1.23
- 2x AMD XGMAC 10GbE [1022:1458], driver amd-xgbe
  (enp233s0f2 / enp233s0f3), firmware-version 19.118.48
- Link partner: Netgear GS110EMX switch, fixed RJ45 10GBASE-T port

Symptoms:
1. Autoneg on: ethtool reports Supported ports: TP and advertises
   1000/2500/10000baseT/Full, but "Link detected: no" on both ports.
   Same result when advertising only 10G (advertise 0x1000) or only
   1G (advertise 0x20).
2. Autoneg off, forced speed:
     ethtool -s enp233s0f2 autoneg off speed 10000 duplex full
   with the interface up gives "Speed: 10000Mb/s, Link detected:
   yes" ("Link is Up - 10Gbps/Full" in dmesg).
3. /sys/class/net/enp233s0f2/phydev points to the driver's own MDIO
   bus (mdio_bus/0000:e9:00.2/0000:e9:00.2:00) with phy_id
   0x00000000, so no external PHY is identified by phylib.

Log with dynamic debug (echo 'module amd_xgbe +p' > .../control),
after ip link set down/up (prefix "amd-xgbe 0000:e9:00.2" omitted):

[ 2206.375463] enp233s0f2: starting PHY
[ 2206.375466] enp233s0f2: starting I2C
[ 2207.390072] enp233s0f2: firmware mailbox command did not complete
[ 2207.390147] enp233s0f2: firmware mailbox reset performed
[ 2207.390162] enp233s0f2: 10GbE KR mode set
[ 2207.428875] enp233s0f2: firmware mailbox not ready for command
[ 2207.428945] enp233s0f2: firmware mailbox reset performed
[ 2207.430443] enp233s0f2: 1GbE SGMII mode set
[ 2207.430454] enp233s0f2: CL73 AN initialized
[ 2207.430805] enp233s0f2: CL73 AN enabled/restarted
[ 2207.990892] enp233s0f2: CL73 AN Incompatible-Link
[ 2207.990909] enp233s0f2: CL73 AN result: No-Link
[ 2207.990913] enp233s0f2: CL73 AN Ready
[ 2212.583519] enp233s0f2: AN link timeout
[ 2212.583855] enp233s0f2: AN PHY configuration

The last block (timeout, reconfiguration, Incompatible-Link) repeats
every ~5 seconds and the link never comes up.

I looked at the recent amd-xgbe work on netdev (RX adaptation with AN
disabled, MAC_AUTO_SW in CL37 AN, the pending "synchronize KR
training with device operations" series) and none of it seems to
cover this case; the last one is not present in my running module.

Questions:
- Is CL73 AN expected on a 10GBASE-T port on this platform, or
  should the port mode come out differently from the BIOS/ACPI
  properties?
- I saw ASUSTOR users being pointed to AMD's Ryzen Embedded V3000
  Linux driver package, which carries extra amd-xgbe patches. Are
  those meant to go upstream?

Happy to provide more logs or run further tests on request.

Thanks,
