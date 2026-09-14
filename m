Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EA47ECC8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395443; cv=none; b=AgWGkQhPaAIVhZsILr8L9mNcZr87iN9SYjhGB7zv1yBjrGQLd0WgKWvFtd2lTbs6jWxdeBqffNqdby5UD/M/QKMH2qYRAoLnvAzbISESBm1JUB+XGc67dyQQrzZVR4caR6xCqz2gB2BP1bJ5Vul6Qnj3uyF/5arxlgCnyM0dwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395443; c=relaxed/simple;
	bh=8ceMByd673naR3PwEiJsfobu32L4XCtKVcpdbpqYa5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0YDDdkYsbkZgil3JD/t1Yv8LW1UxT+09eF082oWLpA/NLEzTe5tWcg6OasKy9SlF4ivace9ZwYJQFD9SkrcFxPXP8tubsKijYFolaywGM6V+OhTOqYwZc/he0QuD+OHYlKHifdn74urPhzo8zWtDcT6eIa/nAwSe6IuqeotJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4be07e7c54dso2904711b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395440; x=1790000240;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0GO/2vfF/XubgIzu8oiJogl7L+f/XkIHsO6TluNVPc=;
        b=ETSiQsMyNkJ4vBOWY83DC0UiRYBuVOsJBfNB1+bdI5WpFuBOHgDYKDNLQOQH84B71A
         3WG6Dm2bIyrrEIdhjWVBj2hXszFltnyMgqXJSUaP8qAFM+uPp7qc+YKrxyxVSg1Cxh91
         OC+F0rLBiazIZDpDmpnZOomx+UuKUalQFZWVIUzThyuQFMJ9iM4QLe2WidMq+MmLrD2r
         4JqU7WodOzZRBjJzJ8g7lKP3yY9TQ8sc7AXOZnZI+pTVdUEpOd0rdtZmoPgiLy40jFV+
         phqCWTaxusqYLMJq8IN0ZcGLNACrPZuF01sWITCS0avSdI9G3qV99+PLGWhxvJGz85xq
         RuvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwA0wu8cmkBHPr3GbGPUf14aj2ta2amJW0p1adIn7y4e4hL4SsUvmQ07UckUgw9+F7A/3hAdlnKBFw2zY=@vger.kernel.org
X-Gm-Message-State: AFuF++mMX42bKBZfVmMnNShV64lxqzXss/arZDdYDjtTuCPBfvZt2YdG
	v1vpYYDXyEzDH5G/vNeHhTs05R9+I3jON38AKsJVMTF6WQZecECQAEQQJbjmkOEj
X-Gm-Gg: AYBFou34Od+VRqQLlu8LOrsnbIyLDgeEWweI3C5eGr2GaJVO75RxxajPcE/UQ2dy0RD
	ypM724oV1QwRJtA/FllniL4kUBKaCg81/dLbkatqqoP8c5aypWj5apMvbUWCf4UTFeJ6R/Um7l+
	eGDrn8QSOOg638pdTpsFcPfaOGffmTko3KudKW0MR41bLhGRNuLGwYl0RJVfaEF2/ugJnDV7in8
	O+9tao5SgNtQ3/mMKk+E1uwZQ7o99/smfColCouxvhOoLdSMYLUH4c7AWJOOknmFs2zlAmsyW8Z
	TRDS6SBtxnPO1+Oi9bjAC1912InpSrW6/iKnAan23DJHYypmlLjaYfgkh4cqFMi3RrY3oSi3aDD
	RxCjAr5+6Q+veTlazl6luMD/KUrrkhCLUPYmWj6xqH4uru5Atvjvhj85wuvFZn0y3lOXNQz0mBc
	eKLKZIqesS0POKUA1ClJRhaGWt+AAvzkYz1G6l/5R46OuMqPQgXA92ojfsvxY6TnpnemsGW6hbZ
	9pQwqrd2Xk61tOljx7rXEbAj73H9pPDodylYEtAIQHi1hfx
X-Received: by 2002:a05:6808:5088:b0:4b8:4703:db88 with SMTP id 5614622812f47-4c634d51a07mr2464203b6e.17.1789395440154;
        Mon, 14 Sep 2026 07:17:20 -0700 (PDT)
Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com. [74.125.231.171])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330da5ad4sm10956409b6e.3.2026.09.14.07.17.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:17:19 -0700 (PDT)
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7fd8ecf2ef3so454314a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxhgEqyiZCnFrKztU8fPUWaLvI+0wMzXJt4RQspWlomzCxX6ATRJxMHerKBTOqs4qpwIR5A9TN2JpXKMAI=@vger.kernel.org
X-Received: by 2002:a05:6122:5315:b0:5c6:65e5:99a8 with SMTP id
 71dfb90a1353d-5c9749fed16mr2500859e0c.3.1789395132980; Mon, 14 Sep 2026
 07:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073058.253000-1-den@valinux.co.jp> <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
In-Reply-To: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 16:12:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDJac0Soob+Cf-dgwWPBpGrfCwHDN_nWTyE84pXJSoGg@mail.gmail.com>
X-Gm-Features: AcwNN1Uyp_yKSLQHdhola9oXjT2PLkCEjRN0YsdOH8kD2k3alY3_Suk4gIB3dpw
Message-ID: <CAMuHMdWDJac0Soob+Cf-dgwWPBpGrfCwHDN_nWTyE84pXJSoGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Set UFS lane count
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palash Kambar <palash.kambar@oss.qualcomm.com>, Bart Van Assche <bvanassche@acm.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 10:44, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 11 Sept 2026 at 09:31, Koichiro Den <den@valinux.co.jp> wrote:
> > Since commit e72323f3b09f ("scsi: ufs: core: Configure only active lanes
> > during link"), the following error is observed on R-Car S4:
> >
> > ufshcd-renesas e6860000.ufs: Tx lane mismatch [config,reported] [2,1]
> > ufshcd-renesas e6860000.ufs: link startup failed -67
> > ufshcd-renesas e6860000.ufs: error -ENOLINK: Initialization failed with error -67
> > ufshcd-renesas e6860000.ufs: probe with driver ufshcd-renesas failed with error -67
>
> This is very unfortunate...
>
> > R-Car S4 has one UFS lane per direction, as described in section 152.1
> > of its hardware manual. Without lanes-per-direction, the UFS platform
> > driver defaults to two lanes.
> >
> > Previously, the core used PA_CONNECTEDRXDATALANES and
> > PA_CONNECTEDTXDATALANES to configure the link without checking them
> > against lanes-per-direction, so the missing property did not prevent
> > initialization.
> >
> > Explicitly set lanes-per-direction to 1, now that the validation is in
> > place.
>
> Given this breaks backwards compatibility with existing DTBs, I think
> this new check should be relaxed iff the DT property "lanes-per-direction" is
> not present. Are any other platforms affected?
> Possible solutions I see are:
>   1. Skip the check completely, like commit 06a34d9c1f47b923 ("scsi:
>      ufs: core: Skip link param validation when lanes_per_direction is
>      unset") does for ufshcd-pci?
>   2. Correct hba->lanes_per_direction based on the actual values of
>      PA_CONNECTED[RT]XDATALANES?

Both solutions would modify the core, instead of the platform-specific
driver.

> Alternatively, ufshcd_init_lanes_per_dir() could override
> hba->lanes_per_direction to one if "lanes-per-direction" is missing
> and the device is compatible with renesas,r8a779f0-ufs.  Or perhaps
> hba->lanes_per_direction could be preset in ufs-renesas.c, and not
> overwritten by UFSHCD_DEFAULT_LANES_PER_DIRECTION when non-zero?

As ufs-renesas.c does not have early access to hba, I went with
handling the quirk in ufshcd_init_lanes_per_dir() in
"[PATCH] scsi: ufs: pltfrm: Add quirk for R-Car S4 lacking lanes-per-direction"
https://lore.kernel.org/ae0cc2bd764e6dfffce99db3d8b44a55887c508c.1789394185.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
