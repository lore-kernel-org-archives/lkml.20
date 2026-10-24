Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792864335;
	b=uq2FVOy+h/YghFkPsqrjmqwSVP8jwSJX+XvgzEddtRp8qbmaYunFhKaAazkT3jDKDd8/
	 2RCLyqT6z/wVzB4nFik2L48Q7HvF30IP5qnCVVp4XeRgtw4A8NwY6mkvU5zoylmv2t1Nu
	 ZjO/T1Dmov8zfz66Hh/+a/k6xpUKnj07OYs0w9Nv78xENdXNUO4uMHkiJMfrBvj2MEwDW
	 e34sNxuSCfxezEFUTSLrqW1roap+7096eYPyHf9B/zVbc0ciOs1Zrr0FDhOoT63DzR5Au
	 bqpImWZWurmb5uBgM2a3PeO2ps/11U73aZMDUrFHDPxMJnulVIRU7XK3DBwVQfh0oIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792864335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
	b=pGv+pN8TDitsOyEjmTcD1x7ZFfgwXjp2hxioV6C8w2W6bcN3h3Oj+zDg5Ni4dDmYSckd
	 xwPYoqRMJfAXJezwdNBv8zf04AQ6nPatL4BDUipCedFvACAwa3QS9ipjQSVtQ1xhx74dx
	 FB5n6VJ1RCFc0oWo3Zv5zbDglLHAIFW1yqwJFJS2DLazq6Z+qRWlfesbyMm7tgbXGq7+R
	 sOTUrEO7unrQBN7k3IqvKinqc2SBmkb1xcAMTGa09J0Oilf3VmgWV2B6BEnBcQErEdgn+
	 MQuTyzXzmg3yPDbSnDWjNtgCWcKaSo4dTnj7KMCJdopJ7ErTLEnbmMHXN2+7DvJyG7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMsFzLFx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC5606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CC5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMsFzLFx
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df7f544919so1093252eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792864334; cv=none;
        d=google.com; s=arc-20260327;
        b=Etng4yQFpB8jqCG3ZHBJNhAG6LDgRh2N3SLOvWWs/gLBEDLriwEoslcciesjFEUFhf
         74THRC7gru4rsbVXBgI02BBlX0J8h5odbc9TbaQ0cwGTZdbyvk7JB+mT8ppPJZBtvcI1
         Hqv3EgXp143yuOsh6Jj7aUYe3p+QaYHuTJFeoR/48BhChBsxS6yMNbCyrUu0+D9Tjlnx
         xtMCa4paB79BQdjgotblfFM8V7EoHpd2shV8cwI44tjkyTvYkke6uAPXxYgMWOGdD8v2
         JxI9EWv9vzqfSBfHniSSye/BKZZg7IT2k/sMu5qOuYx7JTw4A4m0KpWU2SrtwkFVkQrN
         +lGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
        fh=gF943Z8yeq6GGNdDU97vmhCrLIek0n2RyFN+shnIbuI=;
        b=VoHD3kuVvybVaF02MiyWd50mwa9W+q+SnjbVEue2pstr3MYtu44IqnYFcQBUkIsO6X
         mQArZ0W2vLNafh85Olvm15QeiupoKtr63et/uSs3HiDyNpjXvwGgx7jJQKNIT0mLUPN/
         SZtWatce0/Y3l6DwZJPeQfatcZ1SLMjyvCPluf29vxgN+Zsv6e2GP2JgJVQjOTVxNNWo
         SAeFCBPE9XKBtfhDzxv9eHrsPpRUYErhceSVjfv8liniP/j6fmCrRSPeP2s3hAYqUZrx
         8slJy0AT7elR5S/d4AwbRu2M7e5CZBAZotuE1NT7loyC7DSH0/stIMi65oN5DVLiqXAA
         AN2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792864334; x=1793469134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
        b=BMsFzLFx3LtutkGefGNi/ZDmwTWkJozZ+zkbE47xwz4ri+SpNNb28gTxC19glia4OJ
         NC8YdiMng31PeB1TQUmUjtnNQHcrMg1I3cDF0Mm+IPmzaU/qXWkK6kNLcYCecHFD06q7
         xTISCk/Yh2Hiov8JBavC7yZCG0Hn1xfVTCCXD4Gg6YYcVVYmq4YoT+L8ZiOUkEmQ1Jjo
         FQs4mIvcW5kQ8dlZRYoPnpR0JX4Ubgua8025OcwsRSoFQXmuWU78LOUdiGw/ofcjY0pI
         4u2UKKzQppWBdJyxPEN/NQA3WUWErZ+MQ/jBleBREFCg42KEo6KRgaYSfsCYlk50iHdy
         rBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792864334; x=1793469134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
        b=VU4sU26ZMxxCLsgLnNgJB6upjbrQgHPVE1eSgH8omxeS28Afmpylb3RsefLaaKq/E5
         pdFm06A1hKR4liuytX+muUjWtlyMDEE0uzELMvgY1w6dmg2VZUSr68I6nS7P1g3PVbz1
         0yYB9KB7raCVEP8cdwbN4O5z7Ks+kKXvQ6IdWVuqKOOUhZKqKInUCZeehaJvyTobscVC
         7InuksvvU8VmHGQsJ3blook2q9l9bh6REl8pY8OGTmMqLnYplwzYeVADhc5EbGbiSBhy
         tusoUncPv+OojDkQ2gKyRGXiAul8Rb5zfLDD03fqZtdzaKfqNhKV5QMXyNV/HakEwnyo
         VIIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Tr1ixqZv2Kk/0RShZVo6IRLEOqBd1qCab8na7lYpGTXnYLMkPg00V0T6OHQKWs8UlQXXqTWrWfLRq9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtcaAbbz8gGaeqJ5KaUHeHVrfO5rN2ohbVP7WAFGDBHWNJBj3g
	VhW6cx5k5xlzu7SmzGEHRiubiVPbn5LZ3tHs101+mASj983Wm6qu7Zbq4VKBd/uqXU1ZwLBNCaw
	zLuaEL05r+xQfSCCR0gBgVPRXr+EyZcU=
X-Gm-Gg: AYBFou1bKPRIa2dWK7ZuGgFA9y4a+2xmYNz1oOHG9UtAO6ZqL5U7Led2Dzu+fF+8SMH
	mvKxPEFxKlakMs/wKl1W2QkKLRjSEwKK+vSUJwYGqAwKM61KavjxAy9AidXGLeOzdi6tbfpuSsI
	DED5NDeCY/UJJ1NhER1b+QibxVDi42Q6jH7x+V1dVGyhVmW06OQw5fXIr+Z+bNeEzGhUnVAZZqQ
	FF112Dli9kM67HLPxBtzXU922VqbLQU30OVb7ubAgd9jy7aAJH4q5E1VB8Hdz4elQIG6l5e+yBt
	ukCQjLDI6q9bahx6tezkgIyNfEIuZMxPuiZDTfihJBpTPIQddLFhUAtakq3N4XnktbsgKH+g31Q
	piz7a1XZDpQP4bWttTikIim90pRqxde3LYg==
X-Received: by 2002:a05:6820:3285:b0:6d0:1fe7:1744 with SMTP id
 006d021491bc7-70ba0ff44acmr987867eaf.83.1792864333972; Sat, 24 Oct 2026
 10:52:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024172426.85842-1-kmehltretter@gmail.com>
In-Reply-To: <20261024172426.85842-1-kmehltretter@gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Sat, 24 Oct 2026 19:52:02 +0200
X-Gm-Features: AclHuK-D5m-VTC9W4g1jyUecKnd6iuPcMx40ZM19rHe_pOaJrrAaaS8tE7DJczw
Message-ID: <CABr+WTnD8RXfth=MT562uPT5qn6VefvcF0CbEn+Ye++nFRji3A@mail.gmail.com>
Subject: Re: [PATCH] PCI: quirks: Skip nv_msi_ht_cap_quirk when host bridge
 00:00.0 is absent
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 24 oct. 2026 =C3=A0 19:25, Karl Mehltretter
<kmehltretter@gmail.com> a =C3=A9crit :
>
> __nv_msi_ht_cap_quirk() runs on all PCI_VENDOR_ID_NVIDIA devices to
> enable or disable HyperTransport MSI mapping relative to a host bridge
> at bus 0, slot 0, function 0.
>
> On NVIDIA Tegra SoCs (such as Tegra210 on Jetson Nano), the PCIe
> controller exposes root ports at 00:01.0 and 00:02.0 with no device at
> 00:00.0, and the root port's HT MSI mapping capability is already
> disabled (found =3D=3D 1). Looking up 00:00.0 returns NULL and logs a
> false-positive warning on every boot:
>
>   pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge
>
> Return silently when no 00:00.0 device exists on the domain, matching
> nv_ht_enable_msi_mapping().
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Observed on a Jetson Nano 4GB (Tegra210, p3450-0000) booting v7.3
> (c03c1a14507d), where the Tegra PCIe controller (1003000.pcie)
> enumerates the active root port at 0000:00:02.0 ([10de:0faf]) with no
> 0000:00:00.0 device on bus 00:
>
>   pci 0000:00:02.0: [10de:0faf] type 01 class 0x060400 PCIe Root Port
>   pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge

There is this patch that was well tested on the tegra side (but likely
less on the older x86 nv cases)
https://codeberg.org/libre-tegra/linux/commit/63f7810994f4d2866a27b753ec8d5=
bc36e84373c
