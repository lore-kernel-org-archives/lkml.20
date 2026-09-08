Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B358534442
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869381; cv=none; b=RlVOJTss6yF/M4kqiIr70E4f8G7E5E1XcrjpUoOgegP+3nL5phYelSbA+IFTl0j1ZLtg08lKLfiS5nc+nWJyzBl1iNaNSC/UcUDJr6uUWu+dL+ibmt6Fg9Wtf4oVl+GiqheXXJVVFFeLO3nye7kiaq/p0BFLpc3Kgg31NhjIriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869381; c=relaxed/simple;
	bh=Bo+AKfq0xdp97KegmniN4emmRYY4XvZiH6958lLj3Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkzCu2+pdtENlkbc4UI9sRkbqqJHuwoMKpM6yYfz6FWWhyeNsQA4qveRUj6DQvWi3IIAvbXKyan6v8/ESdNGsrA66j4riJYx5ulZLwwYig5VE3rU7ls0P4T/KEOVq0LIjDMiFJoNDRf4DqgJ0p9TlVR73XqLeTH5t0Z7N8FUgUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U5OBG0UR; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U5OBG0UR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so21500a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788869369; x=1789474169; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oB1L7Eff5n72vYRYbZOAoXsdhb2SXZxFFS80HU00g/8=;
        b=U5OBG0URa3O7zFmoPnBZ8DR4qXlXlsNQw8qvegeUFezIY8DRpFIBuRZm5opC3Aba0D
         Amh+/ouytHBb7BigcoOPw5eCDPf9xxXzM8BZOrQYzGR0i3UOb2TcrYnpd87nZAgFFtO8
         667Rijk7FHB8ZljUsCe8Bgrl8Lnaw1iLC0+HTTIRiU4ifd3S0y0byxDVhavzYa5Znz1Z
         uT5UqF2uZ/G5YqYTNyj2livPaLpTvf4cP9T2HZZ5QNQhnsoZ3aR4SzJREtrY6EZSC03D
         wS5pVZf4HbN071w6ScjWQX6m84slDzSz0v2nkwXiZxQ4mO7B1Axk1vZeHlG3bRbUUice
         Ip3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869369; x=1789474169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oB1L7Eff5n72vYRYbZOAoXsdhb2SXZxFFS80HU00g/8=;
        b=lpUqq7WNOalST1TrQfLXzpWwLfgisainXTvmnB5yaiRDVXVyGF/ZB+JqIlahkRMwh2
         TCxysWEkoPy4HxhjdfrJCM+UGqouE3I4MquPDA05LHsXvvszJ5JHOm2liwLqZ6gBvQeP
         JxQzAVXSlTJEZgu0JeWSOELE5tEKJoqTY9uVD+f6koBl4iirLWzey0lw0N3l3QLKDJ3m
         bRNMAQHggwF41nN//UZUnG8I+mvYugEpkvhRpYdn/KZ0PtVbSlo/5B+hQTejgRgtJddX
         T6l0X3N41EI/VFCrg6yx9CM5yCfouGbHEKrYmx5NzILcN1LrsDoJaMWtPqyGoELMVt9j
         5CoA==
X-Forwarded-Encrypted: i=1; AKwUvBzbCbVgw4WWOSZf5XS59YTU45Gm8hDYw1zmLBF2BEk8SwznbdbIBCgSVtzbjtyM/sBE3/jiiOon6LnXbNY=@vger.kernel.org
X-Gm-Message-State: AFuF++klbT8lsNe6yxeTgv8ARUK/Ter2RVYyZ7LQn2XQR1+fqelvPukE
	/k1QHyVOPrlNCmmG9arcJv+QIHXC5oMXY9j7yti+ON81MOsK4pZyxzjeGxIdXF5AOQ==
X-Gm-Gg: AYBFou32Qv3Xp7Nixdvhz3WCz4+qoQET0hatSBPufwAmZnw9BsV+3r2sFMQ5JacXaM1
	0XfwDp91VU4wdtDP+h5Qbvj+iuJkoqt03sNEgLZ2cIoNCkNjVJKQLdTrxt1/xlaBImsD0kmmk5Y
	UKyjAong3h50d0HT6eMuSgEQBwooGucYKuys2b6X9khwwW2CL5tCX75bP42wyQ7uPQQN2+QwIJw
	XRi4c9l0fjcOsRHvxFnSg2sSOClVDt62b1RUTay+OA+dhmVvq5RwML+61AlYkS2pVu4FRl8q8FM
	DjKKINwjjhS2bLw6ImExX0QmelrvPrYThrzkgZ1VFA+Ybvnnpj6aOpRyf2MqIRjQqY5PIzXvP9Z
	WOYgq/h2n412+/CAxvv0ksEUZ6DYsWILArFnXTqxaCn9mOLc4Y0FI1NTHE87PkDLulkKsH9RibT
	Ghiv1Gt6V81963SMK03vb+cRJRN5fnXvG8Y7958wAYaQmBnqhpKwB8MUZOTK45PdOZ3BPtAZy2R
	qSAyFni+992Z/RuDri+PKHIftGx+A==
X-Received: by 2002:a05:6402:552:b0:6a6:76c7:65d0 with SMTP id 4fb4d7f45d1cf-6a7f6886444mr92790a12.5.1788869368430;
        Tue, 08 Sep 2026 05:09:28 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e66eb84dsm5663263a12.2.2026.09.08.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:09:27 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:09:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <ap_69OsnAOwQyo50@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>

On Tue, Sep 08, 2026 at 02:00:45PM +0200, Jens Glathe wrote:
> Hi Mostafa,
> 
> On 9/8/26 13:00, Mostafa Saleh wrote:
> > On Tue, Sep 08, 2026 at 11:39:54AM +0200, Jens Glathe wrote:
> > > No dependencies. But I test if i can apply to torvalds/master
> > I can't apply it on Linus's tree so I used your next tag + (revert
> > for the QoS broken patch I mentioned)
> > 
> > The patches doesn't build, I added this for now:
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 0cfbf3018a7b..d282ce5635d8 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -173,7 +173,6 @@ dtb-$(CONFIG_ARCH_QCOM)     += purwa-iot-evk.dtb
> >   purwa-lenovo-ideacentre-mini-01q8x10-el2-dtbs := purwa-lenovo-ideacentre-mini-01q8x10.dtb x1-el2.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)        += purwa-lenovo-ideacentre-mini-01q8x10.dtb purwa-lenovo-ideacentre-mini-01q8x10-el2.dtb
> > 
> > -dtb-$(CONFIG_ARCH_QCOM)        += purwa-iot-evk-el2.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)        += qcm6490-fairphone-fp5.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)        += qcm6490-idp.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)        += qcm6490-particle-tachyon.dtb
> 
> Yes that's true. Will be fixed in V2.
> 
> > I can't boot in EL2 (with purwa-lenovo-ideacentre-mini-01q8x10-el2.dtb):
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> > [    0.000000] Linux version 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP
> > PREEMPT Tue Sep  8 10:10:35 UTC 2026
> > [    0.000000] KASLR enabled
> > [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> > [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> > [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> > [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> > [    0.000000] arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt
> > [    0.191075] qcom_scm firmware:scm: qseecom: scm call failed with error -22
> > [    0.198139] qcom_qseecom qcom_qseecom: probe with driver qcom_qseecom failed with error -22
> > [    0.227426] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x86cd79c0, fsynr=0x400010, cbfrsynra=0x1000, cb=4
> > [    0.291862] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1000
> > [    0.299508] arm-smmu 15000000.iommu: FSYNR0 = 00400010 [S1CBNDX=64 WNR PLVL=0]
> > [    0.307018] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x86b020c0, fsynr=0x400040, cbfrsynra=0x1000, cb=4
> > [    0.318879] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1000
> > [    0.326462] arm-smmu 15000000.iommu: FSYNR0 = 00400040 [S1CBNDX=64 IND PLVL=0]
> > [    0.333884] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x86b020c0, fsynr=0x400040, cbfrsynra=0x1000, cb=4
> > [a lot more of SMMU errors]
> 
> Well that's true, too. I prepared but never sent a patch for the EL2 PAS use
> case.
> 
> https://github.com/jglathe/linux_ms_dev_kit/tree/b4/x1-el2-unfuck
> 
> My mini-x is up on EL2, too.
> 
> > And with in EL1 (with purwa-lenovo-ideacentre-mini-01q8x10.dtb)
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> > [    0.000000] Linux version 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP
> > PREEMPT Tue Sep  8 10:10:35 UTC 2026
> > [    0.000000] KASLR enabled
> > [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> > [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> > [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> > [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> > [    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce ids 32->19
> > [    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pages 1024->256
> > [    0.223762] remoteproc remoteproc0: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qcadsp8380.mbn failed with error -2
> > [    0.235468] remoteproc remoteproc0: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qcadsp8380.mbn failed with error -2
> > [    0.246800] remoteproc remoteproc0: request_firmware failed: -2
> > [    0.252897] remoteproc remoteproc1: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qccdsp8380.mbn failed with error -2
> > [    0.261226] qcom-pcie 1bf8000.pcie: supply vdda not found, using dummy regulator
> > [    0.261707] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> > [    0.261729] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.261871] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.261889] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.279415] remoteproc remoteproc1: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qccdsp8380.mbn failed with error -2
> > [    0.295042] remoteproc remoteproc1: request_firmware failed: -2
> > [    0.332189] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
> > [    0.346753] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.349142] ------------[ cut here ]------------
> > [    0.354378] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.359106] disp_cc_mdss_dptx1_link_clk_src: rcg didn't update its configuration.
> > [    0.367176] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe8, CPU#2: kworker/u33:0/56
> > [    0.384583] Modules linked in:
> > [    0.387723] CPU: 2 UID: 0 PID: 56 Comm: kworker/u33:0 Not tainted 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty #2 PREEMPT
> > [    0.398963] Hardware name: LENOVO 91B6CTO1WW/3796, BIOS O6NKT3BA 05/02/2025
> > [    0.406111] Workqueue: events_unbound deferred_probe_work_func
> > [    0.412095] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > [    0.419240] pc : update_config+0xd4/0xe8
> > [    0.423267] lr : update_config+0xd0/0xe8
> > [    0.427295] sp : ffff80008027b980
> > [    0.430703] x29: ffff80008027b990 x28: ffff000802f813c0 x27: ffffc1572aad6000
> > [    0.438024] x26: ffffc1572a4df03f x25: ffffc1572a639ff6 x24: ffffc1572a61b412
> > [    0.438026] x23: 0000000000000000 x22: 0000000000000002 x21: 0000000000000001
> > [    0.438028] x20: ffffc1572a4bb085 x19: ffffc1572acfc020 x18: 0000000000000000
> > [    0.459979] x17: 0000000006af4b93 x16: 0000000000000094 x15: 0000000000100000
> > [    0.467302] x14: 00000000000066a7 x13: 000000000199e0a9 x12: 00000000000000a5
> > [    0.474624] x11: 00000000000000c0 x10: 0cf36ad3ab101c53 x9 : a7b4a80d3a726d00
> > [    0.481946] x8 : a7b4a80d3a726d00 x7 : 0000000000000000 x6 : 000000000000003f
> > [    0.489268] x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000001
> > [    0.496588] x2 : 0000000000100000 x1 : ffff000800c8b000 x0 : 00000000fffffff0
> > [    0.503913] Call trace:
> > [    0.506433]  update_config+0xd4/0xe8 (P)
> > [    0.510464]  clk_rcg2_set_parent+0x58/0x68
> > [    0.514666]  __clk_set_parent+0x50/0x214
> > [    0.518696]  clk_core_set_parent_nolock+0xe8/0x1b4
> > [    0.523611]  clk_set_parent+0xa4/0x13c
> > [    0.527458]  of_clk_set_defaults+0x2f0/0x644
> > [    0.531847]  platform_probe+0x38/0x9c
> > [Many more of those also]
> 
> This sounds odd. I have tested all three possible DP outs (just to make
> sure, added a real DP cable to a display and have screen on 2 displays) and
> it boots well here. No dptx_ errors. Although, with both displays in (HDMI,
> DP) the box doesn't want to boot... like, even start the uefi boot entry.
> But that's a different and non-Linux issue. Add a third type-c display and
> it boots again and all three displays come up.

I don't have a display connected (never managed/bothered to enable it).

Can you please share your .config, I can test with it, just to eliminate
the possibility it's causing the issue.

Thanks,
Mostafa

> 
> jglathe@mini-x-jg:~$ fastfetch
>                              ....              jglathe@mini-x-jg
>               .',:clooo:  .:looooo:.           -----------------
>            .;looooooooc  .oooooooooo'          OS: Ubuntu 26.04.1 LTS
> (Resolute Raccoon) aarch64
>         .;looooool:,''.  :ooooooooooc          Host: 91B6001CUK (IdeaCentre
> Mini 01Q8X10)
>        ;looool;.         'oooooooooo,          Kernel: Linux
> 7.1.12-jg-0-qcom-x1e
>       ;clool'             .cooooooc.  ,,       Uptime: 12 mins
>          ...                ......  .:oo,      Packages: 2198 (dpkg), 12
> (snap)
>   .;clol:,.                        .loooo'     Shell: bash 5.3.9
>  :ooooooooo,                        'ooool     Display (LG Electronics 23"):
> 1920x1080 in 23", 60 Hz [External] *
> 'ooooooooooo.                        loooo.    Display (PL2792QN): 2560x1440
> in 27", 60 Hz [External]
> 'ooooooooool                         coooo.    Display (Type-c): 3840x2160 @
> 2x in 15", 60 Hz [External]
>  ,loooooooc.                        .loooo.    DE: GNOME 50.1
>    .,;;;'.                          ;ooooc     WM: Mutter (Wayland)
>        ...                         ,ooool.     WM Theme: Adwaita
>     .cooooc.              ..',,'.  .cooo.      Theme: Adwaita [GTK2/3/4]
>       ;ooooo:.           ;oooooooc.  :l.       Icons: Yaru [GTK2/3/4]
>        .coooooc,..      coooooooooo.           Font: Adwaita Sans (11pt)
> [GTK2/3/4]
>          .:ooooooolc:. .ooooooooooo'           Cursor: Adwaita (24px)
>            .':loooooo;  ,oooooooooc            Terminal: /dev/pts/2
>                ..';::c'  .;loooo:'             CPU: Qualcomm Snapdragon X
> Elite 1E80100 (8) @ 2.96 GHz
>                                                GPU: Qualcomm Adreno X1-45
> [Integrated]
>                                                Memory: 3.08 GiB / 30.72 GiB
> (10%)
>                                                Swap: 0 B / 8.00 GiB (0%)
>                                                Disk (/): 58.09 GiB / 255.62
> GiB (23%) - ext4
>                                                Disk (/minipool): 128.00 KiB
> / 1.71 TiB (0%) - zfs
>                                                Local IP (br0):
> 192.168.0.58/24
>                                                Locale: en_US.UTF-8
> 
> > However, booting with the hacked device tree I am using [1]:
> [...]
> > [1] https://lore.kernel.org/all/20260429141815.827157-1-smostafa@google.com/
> > 
> I briefly compared the device trees. Quite some differences :) I will go to
> the ToT and see if mine boots up then.
> 
> with best regards
> 
> Jens
> 
> 
