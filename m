Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AE481AAD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215419; cv=none; b=mY08FaL4EN33CM93WRGlfgQNW+w2Tpn4fFFS6ioKKKNqwv9nY/hJoUthHKG6aizQ76cxZc5FPM74gKydgcDmYMAr1eNhRx1VXd3bleqHjXnKfoqEThSjLklSEaM7QuJVEN4PFR+bZVJKm5pEJ75AB216hPngzFmQmGQUwyqiwno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215419; c=relaxed/simple;
	bh=vdpsJ3hZNyAcL4ng7ir9nttQMH7WO6n1mJsbI2s3ZfQ=;
	h=From:MIME-Version:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKzMUYt4PY7VoLcxobz0+LoS24RwNlg1EAn2gLUqkeCJHO53MD/LEmKIwKqlshEDKtwVcoD3XtKr67P7EXJWuY8dnqPviwpSKIrlRpbR921hkv6SMf0Gztq57fnkvpcQ6GtavUopri61o1me2/NONsNl6kEZFrxSZTyM8iHJr0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=ossystems.com.br; dkim=pass (2048-bit key) header.d=ossystems.com.br header.i=@ossystems.com.br header.b=iGxMBD5U; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ossystems.com.br header.i=@ossystems.com.br header.b="iGxMBD5U"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-779d18ef706so1470133137.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791215417; x=1791820217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=iGxMBD5Uo4zYet5tlE2VYT1Jwy0iTPSGqlXU7tUA4EA5GyQZyxbcrnvU+T/ywXai27
         UoCtXM2GztpWaegImtlL2AV2O4h9Tebw3mQWfguGL4FPBOR71mZo2B2qbCm9eKFDjSB0
         +H3/WUidthjsh2XTcLjSESqkDiSZEvbXcMGVYSqyQ1yFMqZsW6jTBZgD9ahURlSWADhi
         TXFIDyXn/fwmopJPbW5AGBlp9F9KIsE6n7977QRDEHwoglRaZCNgfkCsRfAzRPIasp5o
         QsruayJUC8vy3MB+wlTO5JyKMEzDtkToyI0iKmztGHK9k+76rmRm2qqkZaOsQgvdBlcg
         uCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215417; x=1791820217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=Jnf+HqTl7Eihd3L8rqyhXYF4TslXQVe/vSmQo3794asXrqPUZRrnCDpNDGD1wFeuBc
         e7s/zzEkdNXG25WAv2hINAGJaoh3cZXQ5z9fYGhjhw/6U6I+WQvgqot8iNtZHVKOudCN
         JBI2rg6oR/mRkRYapozKCn/1SY9YgiFAOnceq7YZkKDSKegAc4mRoUn7wxlgLlD2pWOX
         xCA3yjxCTYLhbuRqt69rNVqK3fbk7ruFbfdZ2ye2nlNpLwgwIfeTM5RiaVC8DRJVB77j
         ZQAbhQapI2LaURw21W/3ljbFQI4Ko+2xf36DuwlU0Rg3T+DQj0bUIMDfY8mQ4tPDTfjB
         yboA==
X-Forwarded-Encrypted: i=1; AKwUvBxXeUHAvZG8gPbWm7qV51HWLdfxBnJV9spq2JIQXqgJunn+XwCG+DjE/DorVyxGfN1p44oDwqQk1BFWGrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJizipzNVVSaw5SQebOxODkog4HP6YwvhYIbpLhb/NnII5ZkZ1i
	l7b7jsh0KJ4qtpRaY6EbfJJnYP78PAuTTtRSwfblbJuMO8Cuf65Ln0gXMeFvKR8H09hsoMZ1/JH
	R1hdVpVY=
X-Gm-Gg: AYBFou3VPms/6vOE21NWsmbgjeiZHqn2nOKol0GRAO5iUBksTvLoNG8V0aPsVfoxjMW
	UAzHCK2EBl45FVvMKwTBq2mnIU94iZ2xZkA+cWGRb01XfQ4zCxn3HGE+oQwUIYOrI/sNXDaItwb
	xoV/J0Y+6me3y2M1pEC1nmkSvi2y8Z7VYylljA5n5+eBVUdLAEViIpvi2kp7jtanq9AYOkpglh2
	+iSxLRQ66D2o0RmP50IDCt0yf22DRfBuAZH1m5aMcrJVmzyZPHwncXzHIlRBGqBTc6CmDLZEaYZ
	juZNV5HldBZrfLGiRPRVYCEuHh2mglE2mPCeET9A1EtJ1f+zonrMIBPjE4/PcFaklnygx/MaJbt
	cpMoETYSrfIFMKZT4ctxIji2Za7tgsCmutDdS/s218XEOYAemcTHBQRcU8B1kR4MaaCGTNfC9ar
	8d8emGZdsB1Naahon7KZKziD17jJCiEvEDjOugH7NIbfmoMPWu8fsu/gwtOCJy65owojp4YUx6H
	74nQFQr6x+VRaK2U/zNTniSU/hZpokiTym9EY3NEb755P6l46Gu
X-Received: by 2002:a05:6102:32cd:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7c2457ce32amr2061274137.23.1791215416461;
        Mon, 05 Oct 2026 08:50:16 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da641688e2sm14545383e0c.18.2026.10.05.08.50.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 08:50:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-779d18ef706so1470002137.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz5WvzkJuzTSgzMP3LJWKuYh0+HKWYk2XhPUUyIYu7jDwDEHKoqCLHn3GoCCONlBI4cq23uMOeHwOwMAuE=@vger.kernel.org
X-Received: by 2002:a05:6102:50a1:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7c32f13da5fmr1970603137.3.1791215410224; Mon, 05 Oct 2026
 08:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003012534.418820-3-otavio@ossystems.com.br>
 <20261003012534.418820-5-otavio@ossystems.com.br> <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
In-Reply-To: <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
Date: Mon, 5 Oct 2026 12:49:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
X-Gm-Features: AclHuK9M-oP6_gI2ooGV7CYgI6qML-uXhAEOVd9YWl1vJlrxk84aNQ57MoMLtgc
Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks for the review.

Em seg., 5 de out. de 2026 =C3=A0s 06:02, Andre Przywara
<andre.przywara@arm.com> escreveu:
>
> Hi Otavio,
>
> thanks for sending the patch!
>
> On 10/3/26 03:25, Otavio Salvador wrote:
> > Without the calibration cell, the THS driver leaves the sensor
> > calibration registers at their reset value (0x800) and the reported
> > temperatures drift from the real die temperature by a chip-dependent
> > offset.
> >
> > Add the SID node at 0x01c1b000 and wire the thermal sensor to its
> > factory calibration at eFuse offset 0x40, one 16-bit word for each of
> > the two sensors.
> >
> > The R40 user manual gives the size of the thermal sensor key (32 bits)
> > but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
> > but that word is zero on all the boards checked. On an A40i running the
> > Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
> > eFuse word at 0x40 (0x08780875), which confirms the location.
>
> So in some U-Boot BSP sources on github I see
> arch/arm/include/asm/arch-sun8iw11p1/sid.h putting the sensor at 0x34
> (like the H3 or A64).
> Can you check the values there? I see that Tina-Linux puts them at 0x40,
> as you reported, and it's probably more reliable there than in the
> U-Boot sources, but it's worth double checking.
>
> The rest looks alright (checked the manual and how the compatible string
> is handled in the driver), so if you can confirm that it's 0x40:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Yes, I checked 0x34. The BPI U-Boot sid.h for sun8iw11p1 puts the
thermal key there, but that word is zero on every A40i I dumped: three
boards on mainline with this patch, and the Boardcon board on its
vendor kernel. 0x48 is zero too. Only 0x40 holds two plausible 12-bit
values:

  board 1: 0x08780875 (vendor kernel, THS_0_1_CDATA =3D 0x08780875)
  board 2: 0x082d0822
  board 3: 0x083d0838

The value differs per board, and on the vendor kernel THS_0_1_CDATA
holds exactly the word at 0x40. With this patch, CDATA on boards 2 and
3 also matches their word at 0x40. So 0x40 it is, matching Tina Linux.

I also compared the MMIO window at SID + 0x200 with the register-based
readout (the H3 method) across several boots. All 64 words matched, so
the R40 doesn't seem to have the H3 readout problem.

Best regards,
Otavio

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854
