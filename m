Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925DA4A9D44
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932243; cv=pass; b=mnWbP92KLDbKSeM8oY8O86o95yMcxOePBJUg+ArfaUaCc7P7nqAl9vPg/QZ6dTEoIjcKKr20/SFZuFMB42aGz/7gazw35XU3coeCQR5fb5XHi8NsnS6Qaaj0r6Uyom9L1UBq/HyPoo6PojTf/u48A2qcqXVhGIqScWOS0TL6sKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932243; c=relaxed/simple;
	bh=uX5yLfhSFHtOGX4a7Azn9QZQsopUM+sBaevj4rp2hjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFGm5Ah/hc9pWazvcfAOmXzUdDy5i15+wW5k1nwWXYXwwSGuqadwUDzto5kOTev3ygtVSPluesRsSGeTOy2MQwz82N4/673qeV1XCZCi96IjcUO3yWZKrLiap40olKx/s1Iv2qqwwa2yJRGq/I8kpQhav3sS2gheWvop4NRtIWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5d5UmZ9; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5d5UmZ9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso7200876a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932240; cv=none;
        d=google.com; s=arc-20260327;
        b=XNu0uZju96XPIa17LB0XW/RX0A9j2vk1SeFc7O2p/rNOFkOdBM9yg2wJCcbaVoXDdy
         RcmGgjwqkhB9nsYjj2k0aiX2UEyWloudqcFI6+kFEDjU3BPxZ9718kCbHUz6xS4Qd7y5
         SDrLHqbLmPUwlzk9Npan1V2mqROBWr9177nLyM8iRT+tZzz82s1MW3pV8pgCkgCrlA6f
         J0JGDB3+aMO6FypESel66BaAj9OLfWtDIvYjLK802pWejwNGGA1ONazs4xCNOTvYihKu
         tafOkcTER8237HZWBvVakJz32I7HO981JD84s7d3JRNV067zPDX/TvVIAl5woY3NYjsF
         Wi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QFbc5zfO+ObMOre/yDc/Xu9h9BlesWAQjbdtJOd31Gw=;
        fh=aalsoBn2AhoxzSy3ppa38Gfb58RpNnL1zyg8yi9A8rQ=;
        b=esvIVWjcuxX7F3NtQdQoapzI57JEz+5H23Tr7QM1CcpKmiQl67Duo7Q85Qkox4wh/i
         0wslnzoP2GL5x5rtU3/lJClAp6UEDgWhFns8aIzT1O/FidEJ0xgzOllbBqtE0k4Kb89d
         1d4lG0w0lt/zsgMxCHEL2YPwoV1zxZzhHVlrh7iQBfuw1sZaRLAO2YBqedsCYneUPodP
         785wHpbVtK5f7W1vUkh3e19GxAsr7pPJG834uujUqVdG/ZdK64hA/jzsdi/g3QJVFDHf
         WcTOzw+kGszITZ0aJ2iZ29hF4vNQS8kqdjtchGXtA99b/ruoPVb3UcKcgV5EgqfoUZh2
         pn4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791932240; x=1792537040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFbc5zfO+ObMOre/yDc/Xu9h9BlesWAQjbdtJOd31Gw=;
        b=K5d5UmZ940TmPXzYbNnV9A5CAqkDZ79wICgpQcunIvZFEByadnk70E6msil8v3e2u3
         uFYaUASeG/hltztCKuATLEV9/GccjCMCYS8z95B4cMtbr2yU77EsLoCa29DBwz1h04Or
         gJ2SR3IunaZDXCYKGiR7wwmKjoi3d4Ia4Fq4KAYmDmZmLK0EMPPAEsN1mAfWx27dR+bh
         k2THprRDHyDH2BuHW4mso+1W05OTWHGdGnweExOpH7BouAEMRwdbHVaARpXiHVjRv9Wu
         MQw+yHXauwow2USsRrM8nEZ6q6u9SWC+jrrGheO5eZCt9Kr6S2ggFsH60rMN9PDyCWv0
         m+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932240; x=1792537040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFbc5zfO+ObMOre/yDc/Xu9h9BlesWAQjbdtJOd31Gw=;
        b=M93vnnzClpzmuQVluG15NUGfRajQ6wFzc65ncnpMQJNGYM4S/QmFi6o3B/jxKlDfTc
         GASjd5Jn2P1H1eMGi10p93X2I3cl4xSMVpgpE4kAiYESr55OOOSoiNosdz5dn1ihO6zj
         JQ6jwL8P9koPvqO/bq5D4BGmbam2hxo2fSVMjTdL1WNUsmYYf7pzodS0d5EOf1uhCJl7
         zJGnsbA3WPdQzra055gItT7nyrXoDHtZ6AJXBuIMh6BaEzVoa5z0PYjNo9mv1M6TM+z1
         M9VLeMhZ0InUF0sMa761gu8b4ivoAkB8NmZnxol0BaysrEn05Msx/p9EVto0D/A+auaM
         Q3RA==
X-Gm-Message-State: AFq9FYKFpfjBbVJTl3S2w6eddhOj7FQDBy9GGMcl2hUbIfu3AmssDRju
	z5A72vdSXNwtagRHQzRJteUOnkC8eK4dCZp2qCVI2v8nJ3Sh//58L3vILMLNYlE4toXVkTBX3Cy
	P8rnYymbJzWL3InOVBSi60TOhv+EYgCL0IpT8
X-Gm-Gg: AYBFou140ROA5vCcuQQOJd3zCUlSx4qLMpuKg0Kw3QyTl6NXmd6MNeQsglxQMp/TcoS
	jTL1ItKuTj5fIZtxNU6BmEwNfoN3Vru6vNjVsYCylNhY98n8WR6LyATFnyANCrDmp1Wga0F8MR8
	c+jIDehxUhsS9xdEVzhLBcOVWvl+ee4q9Fkd7O8YFdWFkoYMgY/O3OGT894JORKH+GbW30+9k1+
	vtKYiM5bK5tXS5W4Ro/rL6Qe7qZ2m5UdxWUEQy9PoYFJZ5u+zR8yuAPe2CK69xCnPw2+ku2NheE
	mSTbznOMh2zbLvIXiBfUbl6f8KpJXWBWh7K3f6Up0ObUrE8vVgWy5ZVNLhQYQxMJ4upaZ0CbvD+
	FrDP9qSkl2154T5HwrySSqXadpZxC2GSmmWtUfCS0eTzpGrbe2xknlwww1ELK+6sDTV6wRgUMpx
	yHnGEJMokrdysiNID0AH4xjH3E5A5A57N4/sK9bFfzdXGt4FzqnkkuRXUXd4i94iPHQA==
X-Received: by 2002:a05:6402:46cf:b0:6aa:8d3b:a70 with SMTP id
 4fb4d7f45d1cf-6b17c2b572bmr10322068a12.15.1791932239478; Tue, 13 Oct 2026
 15:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009213156.109965-1-rosenp@gmail.com> <58b72ce94e373266537d5c0456772db69a8fd808.camel@sipsolutions.net>
In-Reply-To: <58b72ce94e373266537d5c0456772db69a8fd808.camel@sipsolutions.net>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 13 Oct 2026 15:57:07 -0700
X-Gm-Features: AclHuK-7v4grdJs6crA6dpzaj61POSwZjpa8dXYSW1ynd6F4b5DPbbXNwTc9QY4
Message-ID: <CAKxU2N8BRM7rBdPRMCQRFvOWas43Lmi5BoTsVxbsNvueqxjmPw@mail.gmail.com>
Subject: Re: [PATCH] bcma: use the SoC device for DMA on MIPS
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, f.fainelli@gmail.com, 
	Christoph Hellwig <hch@lst.de>, Linus Walleij <linusw@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Paul Burton <paulburton@kernel.org>, 
	"open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 5:30=E2=80=AFAM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Fri, 2026-10-09 at 14:31 -0700, Rosen Penev wrote:
> > The MIPS BCM47xx code allocates a struct device for the SoC, sets a
> > 32-bit DMA mask on it and passes it to bcma in struct bcma_soc. bcma
> > never uses it: bus->dev stays NULL for the MIPS SoC host, so cores fall
> > back to doing DMA through their own struct device, whose
> > coherent_dma_mask is 0. Since
> > commit f8c55dc6e828 ("MIPS: use generic dma noncoherent ops for simple =
noncoherent platforms")
> > coherent allocations then fail:
> >
> >   bgmac_bcma bcma0:2: Allocation of TX ring 0x200 failed
> >   bgmac_bcma bcma0:2: Unable to alloc memory for DMA
> >   bgmac_bcma: probe of bcma0:2 failed with error -12
> >
> > Set bus->dev from the SoC device and do DMA through it, as the ARM SoC
> > host already does. Every SoC host now has a bus device, so drop the
> > fallback that pointed a core's dma_mask at its coherent_dma_mask.
> >
> > This addresses the review of the earlier postings: the cores' DMA masks
> > are no longer touched at all.
> >
> > Tested on an ASUS RT-N16 (BCM4718): bgmac probes and passes traffic.
> >
> > Fixes: f8c55dc6e828 ("MIPS: use generic dma noncoherent ops for simple =
noncoherent platforms")
> >
>
> That was in a MIPS tree, so perhaps this fix should be too? I don't
> really know what to do with it.
I thought it was weird as well. The last submission was sent to
wireless-next as well. FWIW I ran get_maintainers.pl
>
> johannes
