Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30073D8122
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600427; cv=none; b=FCHBjgEopCcDXnrFP18h5DwrIwtI1VqUR8dIOMuPbBfWIqzKTXdK5C19ozu0N7Nqk95/8Z9nx8nW3L/9YSfZ9yHkCpPKkUiNEpwsxctZ9o+i6NqI+NkCGGVV2z3Po2+eM80MFa2wyavQYdRciksbSdgrA5LaIwd8LJMsvqmDQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600427; c=relaxed/simple;
	bh=J1UCxf74Usvo8/m/zisLMoMzaDelPgwuv0YSMGlmZ0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLexzZE8pZj9Wb84iheAMYZIzjUuMS5xnEDWGlk9a448/ZP1T/nLwmmbdbeFU/ppKkmYBXbnqZ4IvvaVoBELtV5XZeI4eBHMAbQqExeWhtw1euQc1URwbJuCAB7VCiVy7Oj+cndisWkdNHUx3bZewv2zDt8DtQ5l5JaotQUNPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b3acd242adso403215137.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600424; x=1791205224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=swC+rKb42cR1zlVWS2oz+HcUhOn9Ph47VvSZUMBtH00=;
        b=vley/DLFObcc0ncegDejfBENLpxwL0ezXfPIo3H7eBuKVbMJxHb4f6P+Bg8A+Ba66p
         dSK7mE2c4D37gENP6AaTHXmwb/KjKPDfNNeSN0tMbn52uM+ac6QXNOvfWXJpkYC/cMm0
         KSeZbZuBRonhAkUVchuWMnlhsRu/u16xcw5UDfpDWTjhyBrIs+7MGyqbm2IaDzwafZK7
         oyyHKEmXp0VjvUEe4NdHRIzbflvQQuvWPLcGeRfetyg8WXMtlFEu39scfa0hJeo8zzm0
         J0jo5CE/JHj2uup80i5VeECVm0anvqIA/pUd/4mwEFf2c+zicyZEKJyf4qttbnyBKCjF
         n7tQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlnKiZzFfujqoIIlcluee3wBXOFxDPchiI1YYoyaLkg5eOjLSTwBVKIXK8/E1zh2zXcVASK1UZFMW2dQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlcUgpbu2f4UctacoRTZxTWaZOpDSE58ef/84f8p0KjG4iFY/k
	ieCMKTaaf9bd0G+6VlV34d5aD2jgo5rAwyOo1YSLOQu7TWMN9iRnfFYfR8HcMVm8
X-Gm-Gg: AYBFou0riskGM2I0GhI4cIFKorCGWfMU8iU+ItibuJ3woG+XiNxsGISQnZ8sVjyPm2W
	B1gBIxPf1Uwwy9Rg6oE8SPzg3WSiKAm3kDnSAx+/iPr/E2EijbUp1DW63OjgEExh7ZFRZlJZY9W
	q9uS7V6GXJRJvITTzxr94AoQG/yfatuKpX+NDt98fypz2fYUBBifz0bH9JK+YAH3CQWWGm5433s
	OVn2aHF2KVh60pnJKbAw+/uiP0Xglq8auCvFFbaWXqdwavlRD1B4IKmBUWhtzVqdiztwHok3MMs
	pRwE4Eg3rFveFdERYNbM6M87BD672G/p2hLUz+g0pb4Ngw//JhadD6V1bhNX12S3sFmQrBEA9Mp
	0alTrOdQlgwFQe9XzJb3bdc/SrX74T/+caAUCSwiZsHDHJ5veKi2JC+nYdHhOmGneVa06u3ySXF
	AW9mVuJ65m5j0kR5hlIbTAqhhPtMJ6teoXKVa7kHxSACiq1vz5Yjmh3CYgw+oiE5BmA6hyn1sVW
	OLm8uUKtFYiVoAlOncxv9F5gfgPXlwDBf1F
X-Received: by 2002:a05:6102:3ec3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7af1f621049mr3828464137.37.1790600424148;
        Mon, 28 Sep 2026 06:00:24 -0700 (PDT)
Received: from mail-vs2-f13.google.com (mail-vs2-f13.google.com. [74.125.227.13])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b257379sm9269691137.4.2026.09.28.06.00.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:00:20 -0700 (PDT)
Received: by mail-vs2-f13.google.com with SMTP id ada2fe7eead31-795a0ab5227so943251137.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTprwE0qyWR+Anf7SyNvvJeszjNOmM+FdJ16Duw2zznnUpdausQURimuOI0TRyycmjmVGzopfjYx9Bvu0=@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a7:19aa:f0d2 with SMTP id
 ada2fe7eead31-7af1f40a6ebmr3883955137.31.1790600418873; Mon, 28 Sep 2026
 06:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:00:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHAFoa+RvhzXDS=hijNXqBk=Fnt++LVm5rTiRQzzvm2g@mail.gmail.com>
X-Gm-Features: AclHuK_dpCNqN6yq7ND9MT0G1Ai1EvNq4GQtb8fvGHVDUDen2mnNfX37jzbkzIA
Message-ID: <CAMuHMdVHAFoa+RvhzXDS=hijNXqBk=Fnt++LVm5rTiRQzzvm2g@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a779f0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car S4 documentation R19UH0161EJ0140 Rev.1.40 , Jul. 31, 2026
> chapter 9A.1.1.12 Software Reset Control Register 11 (SRCR11) bits 22
> and 21 describe PCIEC ch1/ch0 Application/Local register reset. Add the
> matching reset into both RC and EP DT nodes of both PCIe controllers.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
