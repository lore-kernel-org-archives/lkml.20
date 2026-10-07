Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A12222AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360330; cv=none; b=JUguEZgYBUCSQv4ahs7YFb+kmNHJbrvdIQCX0KnKG6kM9y8vpn3TOiw2Xs7ITUmU8RSRP3dYwnotMoa6BEHo/Qlc28vr5EV1Esol92vydXHd7blzHQQ9/tbL1AUY9HdDLzXmiVjZhy5we0VcaZ6mOgm1be8c6lYz7B4adI7N7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360330; c=relaxed/simple;
	bh=Y9mtTQ8wyIos/K/EetjBMsNI/oJ+JEHvhFr7bLm82lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjY9qZ9amEIQmDT8LiB9NWZw32bup7mw6Uj3LbTfF5dG9BnW3CRSQ03JWCZMB8vy4odsU7U3hsTPs1KsyZXCcFMnWh0A9LWe1Nm6YjK9hfNFNb9TG3jRDVaOvSVmqyjxcZpCSYnDw3v1qjRtVJF5HZYCLyZzn3J5ruyBUg93W4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIzjwscM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIzjwscM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so3240895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791360322; x=1791965122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5nDkXCXtLopN/dGr01gYXBLYEX8HBQVPURAZPTClNE=;
        b=OIzjwscM2pGN0xJ/JUngpedzWdla1nif1Pqr9eychmaHG1UcdK0nbhPORrg0lNREyO
         CinNu4LU88mkN0O4UK79SiuL7L07pta+y04OlIBxDLBLUYFR6a5XYBQWWJQkPp8Kjqxb
         ABR2cjTCTAoTsMGz+240XtROtsdD2XmWZdL5WUuW7RjD0R4OzTjeoee7Sb/ABX/6ssoL
         zW0n+rgpHryTXYEx7l4zK34agLXTv2+vlVmg7uEhMHWQ1sHer3bFdl2D9xO5ovvOoGNn
         KtTgGct4/GJLeMoiFYhCG279//gNWPfA8gZ9wrHZFkCo5y7w0o70ZV0iox3Fx0lAXalk
         dGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791360322; x=1791965122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v5nDkXCXtLopN/dGr01gYXBLYEX8HBQVPURAZPTClNE=;
        b=YWL80A7wIrn8YzMBf/QiaWsc2v1vf3j9xcsFE20zPU5OfVws9GepbvvcF7VEG6EFMk
         pzOPyT3XbpSpJsOUwetnrdbPc82Qbh9OYEjAPAxd4kPIbEF7r+d8u04X0L936ZjQgNwg
         GwdgwxxmzR8gnOoj5y/ZEpt9i+qf9QfId/lALKNYpr7/vYZnrTiQ8qDk/6qPpnKbU7Tv
         KvwqsfydugkhL48oVAwxyaMQ/3WAR9G79/XflCeIpUj+bBgkyk3ycS0wpXDB2W065hAy
         rPbKdVPX3MQQ9/490bCngTKZ5fblrGxbPb5ou8fhdKSGPNXPDM/vJDVyReXV9cYwQ0wg
         X2Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzYc9ybRkG1DlViseI0YAw5gw8Y/QiKxYEzLUrNFWhci+4NTO85L1rh2S6bZtT68vdEW5HNVTY+ZwilxL8=@vger.kernel.org
X-Gm-Message-State: AFuF++nWmgZEM0m5C1OHufjemMc0IRQ40Abz2gU0bd3UHs64wY3zwqox
	tJwopCz7iUyBzg3IBvQ37QLZhiHQJH+dCTNMv99GmX+v/jdVKGbbES6xuARlS0va
X-Gm-Gg: AYBFou0hhzb0Rc2YZQ5l4PNTahpIj5R7yicYo4ZDzSF4pJHY0veXuNi4UJ+UPbP38IQ
	oS0BUUZoJaryaGWlbHRHJEsjzUwUmfBG4swJ6/dIc4yGD9c33+tCf/pRHJicIcfR9O9yStRDR34
	Xe2mW86Yn6QRSJEBjoJIkFXunQUzWHYDkJb8djD/vo35301bdle/7EB+hQeopA1HwxWiDeDZS2Q
	ETuQ/dKRJoVFTqVJWR1SOkmZfkK0BY4FLClDzrP0ouyCLxLXPqwpKS6AvkB4zBtYI23sFEodGsy
	UtH0UzkSmgPYWNsDSgpeo+FOGVBFPnqZsi4HkCAdDYEHPAXwtFSxMse7lQBzt0HtVdR7pr/532m
	7Y9jcPaWnduRyCXKH0jqfCvm5SKleVsMjB6g7y2kG9FMuNZZqVazpz1hIXI27WgHhuTf4R02qal
	rKfLQiO7GuvfqneL2i9mfvI1nJUH/ghhQS9Dp9Xy/2kbnvKaKdAAfzrkmUMfOq4AsPOn/+90T/W
	eh/kMaHPzSHZDzGz1Arop8cInx9rKsFPtbPFmeMJWNJpQYuYI+bPHwF7pbQBIo=
X-Received: by 2002:a05:600c:34c5:b0:4a1:6ad5:257d with SMTP id 5b1f17b1804b1-4a18065ec2fmr19406915e9.29.1791360321830;
        Wed, 07 Oct 2026 01:05:21 -0700 (PDT)
Received: from blinky (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c50f54sm123829665e9.10.2026.10.07.01.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:05:21 -0700 (PDT)
Date: Wed, 7 Oct 2026 01:05:19 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Message-ID: <asX9P5ZEcSUdiuiz@blinky>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
 <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 09:46:31AM +0200, Radim Krčmář wrote:
> 2026-10-06T16:54:53-07:00, Charlie Jenkins <thecharlesjenkins@gmail.com>:
> >> User-mode use of Zcd, Zcf, Zfa, Zfbfmin, Zfh and Zfhmin requires
> >> non-Off sstatus.FS, which we set only when has_fpu() (CONFIG_FPU and D
> >> on all harts).  The vector floating-point extensions Zve32f, Zve64f,
> >> Zve64d, Zvfbfmin, Zvfbfwma, Zvfh and Zvfhmin require it as well, but
> >> hwprobe gates them only on has_vector().  hwprobe otherwise reports the
> >> extensions from the per-hart ISA bitmaps alone, so it can advertise
> >> extensions that are always disabled in user-mode.
> >> 
> >> Report correct environment to user-mode.
> >> 
> >> Fixes: 2e2cf5581fcc ("riscv: cpufeature: add validation for zfa, zfh and zfhmin")
> >> Fixes: de8f8282a969 ("riscv: hwprobe: add zve Vector subextensions into hwprobe interface")
> >> Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
> >> Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
> >>
> >> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> >> index 7818e1d32622..b57ccd116bb1 100644
> >> --- a/arch/riscv/kernel/sys_hwprobe.c
> >> +++ b/arch/riscv/kernel/sys_hwprobe.c
> >> @@ -146,15 +146,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> >>  		if (has_vector()) {
> >>  			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
> >> -			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
> >> -			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> >> -			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
> >> -			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> >> -			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> >> -			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> >> -			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
> >> @@ -163,14 +156,26 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> >>  			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
> >>  			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
> >> +
> >> +			if (has_fpu()) {
> >> +				EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
> >> +				EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> >> +				EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
> >> +				EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> >> +				EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> >> +				EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> >> +				EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
> >
> > The vector Kconfig is gated on FPU=y so the vector instructions can't
> > ever be enabled when FPU=n.
> 
> Right, I'll make the commit message clearer in v2.
> (Zve32x and hence has_vector() can technically exist without CONFIG_FPU,
>  so future implementations might require use to remove the dependency.)

Yeah having vector dependent on FPU is not really accurate but since
nobody has built vector hardware without an FPU it hasn't come up yet. I
feel that would be highly unlikely to happen and probably not a good
idea so maybe it won't ever happen...

> 
> I think this check is adding a bit of sanity, although the platforms
> where it comes into play are already very wild.

Yeah I agree, it is reasonable to add the check here.

- Charlie

> 
> has_fpu()=false and has_vector()=true is possible on heterogenous
> platforms since the filtering/validation of floating vector extensions
> happens on F extension support on that hart alone.
> 
> If other hart doesn't support F, all harts will trap floating vector
> extension as mstatus.FS=Off, although scalar vector should still work
> because has_vector() isn't keyed on V support, but only on Zve32x.
> 
> Thanks.
