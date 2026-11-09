Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208243;
	b=uk6+URtPU9LzNKDs0F2Io2WUwciELYn6mtGCmn/WUb+WNdWHSKimjA6FqMxBH2HCNAEt
	 uEGHWEeqGVcimDUXRx1s2y8fPTDL9Xc3KDtQSag22xe/efF5B+iyQZKQmJy9Xsq85RaXE
	 4kotl2nIEP9TUIj3w0wo9B0Z+rDseWgVnnrwYzQ4tUMpQqxoT4idmzZQWIwthEV0XwTIx
	 MWBbPIg1qTHa5r0ER2uhzd4QJo0163+9HX9D26DMLDlE5Y8y6TH/JswAN8SQE/hpMPNCy
	 wI7bTGLz5Ib9CILSwhjS+bWianq6wiqAvR/49PY2doiyUDsEwNeX0h795GjA3Ejoapw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
	b=Vr8ynrQzVyM5Mbedfi3PPaHgQ1Xa23Zn32BoYcGn5MwaSsO+6Xt1n4ptgWqk4UNFl71u
	 9avzuIpp5IfCfNfNpqkj0aQRqmJ4Yudr3GnSGIzvgud3/qK9B+9E+mwTHVrazfJ/RiVxs
	 yH5HedoPNBuGqXRPHFC2TXgfxIFWor0j1jYLhACJk0f9O47IYVQDoBG/TFUAd/0a4ecvz
	 CAakjQEH+QoRwMhUbPWivYE+y2meofQOjYXFCV5/aaTnAQkzmzHfDjvWvoz8bF7kk7TUJ
	 LBihlKqVScg0iCsYBV5woxupJXup6GQa1TAoWAzeEGUtlznhUeceUb+eyG7omHAWMfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoK31i3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C2606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75C2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoK31i3p
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b32daac9d7so3305407b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208242; cv=none;
        d=google.com; s=arc-20260327;
        b=cFuTS3s0mP60MBDKYR30vkwRtJJKGcAlXIb/ckubsOpYiFQdYTh02ctTWEdJ0piBHe
         kQbndbCN0bpGzxYnxSY51XVrccpgv8sUQDPeDkMtzj4/vLlkcud6rnrTrXlWwOFCztx6
         E4bGInEh8ScMYGoYsdKbdykIKFim7SV7F8BdDEryiwpyLZXFxSbxNlndqXui21iNCyiY
         78J/YHuVO29wtPJaDn96tvPd2yzz1PaJbtHwyoIcq+wf2M2hP8gGI8QwbpXqOYLMmKKR
         WYBzo5m2BXC7xCJYkQA6wsLQU6c8ROX9wBa/Oa6jyPt5vsM1K6+LUTvXVl3Wz6k5WNQI
         LCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
        fh=oQlSSAU0CtrG7FPWbfkehSGcobzAweYvEzuHqbPdawk=;
        b=d5RPbI28NQrvXH+0k2/05c8QjFFpfMCk69bK3L+3T9xW/UKCZs8Zg6Rwmyv/iVeDCW
         iyvGaj3y3zskZzOoJVGBCp8rRVmC27k5nHrderg23OntNVfEUSsH9zmjdThAZ90IyGdj
         TZ+6IwjBvfLNZdCyqRdvaEVGmztXt2wMxNxvOAQUKqBVnN60rPb98N0I2LV3wz8N8+H2
         l5p25vBOYBUKX8FL4+fjvJTbmdaW2OZRBwNL3tyED9VxPfxGQhu+a/f08RIE07J5JkqN
         /9MO9TxPOTuiGC16A5R8xL86JMMaB0chylPo7pGCHPb89MJfwjprRHFKtlGq2i6eK3HS
         Wqtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208242; x=1794813042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
        b=qoK31i3pV63aikaG2dHW3gw0V/bLxJgV0EQGKPdaCgbTdWoQAzcJC4ysHmJqxeXeQK
         9+FvOk5a8y7fVOX5soRaEWtz8ChW1XT27z0JEYxdmNX6r7G9906B+52XOoEONJugQwIp
         tXQ4GwV5SzU6agWZyZp7wr+2m7fo4Xjq64AMmF3wrnZbdag+yf3/b6AzEtjzT1L8BUJp
         ahvAmln9ikWXqUlTfrKGT2Pd1baNNMNsahWoYeqJO1cQk6bdfnyEaBy/n9OjKD2b5SQ0
         GpkrmIsYSF6ljDK6D6rYeAcAGPnJMHL5WmvE7quZq210Cp2DYaD3UdPD/NU0Z4Wwna1k
         vdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208242; x=1794813042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
        b=2phcMzQ8UfXuIy9cWcCt6jz7L/hfjaN3AC4xk943/+6VaV3VWhVo42YA84LoqZR3pC
         qqioY7637hkeFlEYBImeUE0Mg6alXa7iYQOEz95Hute2LoLkHFLVt3vKeqe3e840Vr6k
         zyfZ0NSAFifU0FhijAxm3zfL0y4vQdzXNxMdIAsbV57j7Niq5iuOXv8Y6mFkDldBcksY
         RMLnsEZ1i30MP3zFt6KGE1sRMoMuIHJwD/AvHpV5VI3/AMop54GgaE73hsmcuWy+BPEM
         dGSefRFm4UzHRO69sqWxdwP33m7M53cZ0k75NtLhvZjRmNTWrG670zsTG0H7dB76S2aK
         QNKg==
X-Forwarded-Encrypted: i=1; AL+hErGhkPy4y0mFh9gjjQDEp38zhEd7p+U8bfKfn4Bkd7/bD1iV0e19NzGDwpiF5cwAXgn8Z3tsbngMEm86bic=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hVsbnBcwqX/q+c6L9nb+z2Eu+yEy6q84xDDr02ySkn9WasQ5B
	7uBW9xaru1r5I3KVkRRKxUoHZTcbtVLuL5TpW3IH2GhYaQbZC2KICMvUacn3boMtz2wBXbpFunJ
	+NdQn+8NQmebZA23Pno/NQL+o7fwDu4w=
X-Gm-Gg: AYBFou0cJSk45Sim6+wgJ6FGJTcDs+E+sADwDykN68PFFRCRKdMwdq4v+G+vJs6QVyv
	BtrmWa4Q94vHUmePFktw52zwyYJkOVTGKhJnNbQl/ILgSj4md5RD4kMaxHnSmZjsePLOXOTNd15
	9x+fkglJB3HXxK5W1x6csiSAC8ZKxPj2HgM5tYGyYBETa/F14qcWhVHW+tbs4EY3YRdiBRXcjnH
	VXHAPLVCGdVpPSqrEujF7QmfApTNyzcumN4EbFIBdzqoU56qH/y7JPTWIL7rjNVXeG3o3Y+DD3p
	z5dw8/yFCW5DUTfx7tGp/bPvMmsnfYUWt3oV0Ct8xX2vrDX8rHPSK9SCA9sa0DRb4n3d9vHu8Sq
	47DOj6jAGlO1Jj402PYwzoumDJ27MPnk3SuJQESS+0A5CnrUh1n5r5eUFwUEkd1QMtl053Fj0Z4
	0e8OCJsNVCMhCgBH0OdTMS6xw0VI5Bn6fp01kxDp37GByKrAz8fBhX26EOOz6YLOaDGABS4Goru
	ONqmAPHTh+Sc+9cC+wpR2+GXShG5UAP6FiP0e097vgyNCte4JZ4X4tkfWafjw==
X-Received: by 2002:a05:690c:9213:b0:8b0:dadd:e578 with SMTP id
 00721157ae682-8b36cab7460mr16553447b3.30.1794208241914; Sun, 08 Nov 2026
 23:10:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:10:05 +0200
X-Gm-Features: AclHuK-FhW3Y6XmNHzP6haZP4G5X-CZNURWWPI-z5sCpXmwCxD-yiO7h25l1YMQ
Message-ID: <CAHp75VcP6AD8-vSG-QzxTCWm8RWJG2CQJ=9mrn=3nFGJd2YJXw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix MSHW0040 button driver selection on AMD
 Surface devices
To: =?UTF-8?Q?Antonio_V=C3=A1zquez_Blanco?= <antoniovazquezblanco@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Chen Yu <yu.c.chen@intel.com>, Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:37=E2=80=AFPM Antonio V=C3=A1zquez Blanco
<antoniovazquezblanco@gmail.com> wrote:
>
> This is a rebase and rework of Sachi King's series from November 2021 [1]=
.
> It was reviewed then, the review was never acted on, and the thread went
> quiet in March 2022. Sachi has confirmed they are happy for it to be
> carried and no longer have the hardware. Both patches keep their original
> authorship and sign-offs.
>
> The problem, restated, because Hans asked for this in [1] and never got a
> clear answer:
>
> The AMD variants of the Surface Laptop 3 and 4 use the same MSHW0040 ACPI
> device ID as the Intel Surface devices from the 5th generation on. Both
> soc_button_array and surfacepro3_button match that ID and tell the groups
> apart inside probe, by evaluating function 2 of the MSHW0040 _DSM, the OE=
M
> Platform Revision, and treating a returned 0 as proof that the method is
> absent. The AMD variants implement that function and legitimately return =
0,
> so both drivers draw the wrong conclusion, and surfacepro3_button binds
> where soc_button_array should.
>
> The sound test is whether the device implements that function at all, whi=
ch
> function 0 of the same _DSM advertises and acpi_check_dsm() reports.
>
> To answer the question of which models are affected, every ACPI dump in
> linux-surface/acpidumps [2] carrying MSHW0040 was surveyed, 32 models, fo=
r
> UUID 6fd05c69-cde3-49f4-95ed-ab1665498035 revision 1:
>
>   Model                        fn 0 mask fn 2 advertised
>   Surface Book 1               0x03      no
>   Surface Book 2               0x0d      yes
>   Surface Book 3               0x0f      yes
>   Surface Laptop 1             0x05      yes
>   Surface Laptop 2             0x05      yes
>   Surface Laptop 3 AMD         0x0f      yes
>   Surface Laptop 3 Intel       0x0f      yes
>   Surface Laptop 4 AMD         0x0f      yes
>   Surface Laptop 4 Intel       0x0f      yes
>   Surface Laptop 5             0x0f      yes
>   Surface Laptop 6             0x0f      yes
>   Surface Laptop 7 Qualcomm    0x0f      yes
>   Surface Laptop Go 1          0x0f      yes
>   Surface Laptop Go 2          0x0f      yes
>   Surface Laptop Go 3          0x0f      yes
>   Surface Laptop SE            0x0d      yes
>   Surface Laptop Studio 1      0x0f      yes
>   Surface Laptop Studio 2      0x0f      yes
>   Surface Pro 10 Business      0x0f      yes
>   Surface Pro 11 Qualcomm      0x0f      yes
>   Surface Pro 4                no _DSM   no
>   Surface Pro 5                0x0f      yes
>   Surface Pro 6                0x0f      yes
>   Surface Pro 7                0x0f      yes
>   Surface Pro 7 Plus           0x0f      yes
>   Surface Pro 8                0x0f      yes
>   Surface Pro 9 5G             0x0f      yes
>   Surface Pro 9 Intel          0x0f      yes
>   Surface Pro X SQ1            0x0f      yes
>   Surface Pro X SQ2            0x0f      yes
>   Surface Studio 2             0x0d      yes
>   Windows Dev Kit 2023         0x0f      yes
> Exactly two do not advertise function 2, and they are exactly the two tha=
t
> need surfacepro3_button:
>
>   - Surface Pro 4: its MSHW0040 device carries no _DSM at all, only _HID
>     and _STA.
>   - Surface Book 1: it does carry the _DSM with this UUID, but function 0
>     returns {0x03,0,0,0}, advertising functions 0 and 1 only. Function 1
>     there is dGPU base attach and detach handling.
>
> Worth noting that v1 said the devices needing surfacepro3_button "do not
> have the _DSM". That is not true of the Surface Book 1, and the inaccurac=
y
> is probably why the problem was hard to follow. The commit messages now
> describe what is actually tested.

...

> On merging: please do not separate the two patches. Both drivers match
> MSHW0040 and discriminate only in probe, so with only one of them applied=
,
> which driver claims the device on the AMD variants depends on module load
> order. Hans asked for the same arrangement for his own two patch series i=
n
> 2022, so either tree with an ack from the other would work.

If we go with this series close to its current shape, I really ask
maintainers to use `b4 shazam -M` for it to make a cover letter
(without list of files and changelogs) be present in the Git history
(as a "merge" commit message) as it supplies nice piece of
documentation (see the part above ...). Alternatively we might want to
see this be listed somewhere in the code as a comment, or in some file
under Documentation. The rationale is that it is always hard to find
people who may test something on a variety of the HW and having a
technical background provide a valuable summary.

--=20
With Best Regards,
Andy Shevchenko
