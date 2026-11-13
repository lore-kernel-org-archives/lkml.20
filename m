Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572672;
	b=phwUiQ/oyC6yFrLAM6RGe20RL2VX/mpD0yaKLjgcBD/WsqeMblzrTPVbJN1JPZMH6a0v
	 26xadhs+7EF0a18tu/meWEI1KrA8pdeSNiT3WuYFKgENKB04krntiEUI1vq/RjMtHM4Ne
	 L3Eg/BYjcMtUeNgxvCQwSROfgEwl3Q4DT/QIoRm9n/It1ZUvH0D3ecC3RW2xKJ54czSIM
	 ysZVJmho2GwpLackh5SOfrthS4Z/UOn+O0aHnxgPmvAEbWBMeqj2Yr+yAVFgexUIZjaaF
	 0za6g72WEgbhitYCeptAsV16nKwpe5TjaWqm7HNBCAVKfYI37XXCcLO1prvPstWW5Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
	b=14LEygWm24EZ603QP0o7+SvQasrQ/ctrfG1a2qDCgktzkQy3XzE/6u6eN9wyjrc17Fxw
	 S2k4oyjDD+cM+LD2AyOkct0xrl4g+MO8o37DnVss94L4M28TuhF7LC50G/K1hWaFihova
	 CTuz+K4h+O5CoUWHEW0YYBYiSB2sq6VA6+j2CbH/00wyaz6j157DLqerJ0yEQeN14RSEj
	 ceTY++dI889zDwZumOEgaoOeyMwOgn46SJoUwzlZvV7Qo45J3vrr2tLl8Q4CVC8RruYdd
	 5js1zNZ8wFiSbkCLfS3voQ46SzmW7ma8yJ2hk9pQOyIgzXgyY49EY7GuNTNBtQUMFrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ElxbnzGO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B2460A383A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B2460A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ElxbnzGO
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b1535be329so863722a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572671; cv=none;
        d=google.com; s=arc-20260327;
        b=SVJvJstH4pL+DineqmdOzr8R5BiYskq+kthJYErAtk1t5MSblKNoPxMZsfx5VitdpC
         zy1vhTblaCP/stenL5sJ4X4GQlcyjQTgEQrostDf1VeY8hJzKpOQASJv+tZSY7WP5pUR
         WF/U6pDcKhHmLSP3GAdpI5zX+6cjbniL2VmhEPoN8gIaVdchscH+SszL+hFe4HsGSpU7
         6Ct0y/3K6EyOJJRcoTB2M5b66R1s50FlsBBlqFcuj6fGV+QnucmM2TI5+N6ngZ53suZY
         u98XXWwZ52hc4n0ljDs/nX/cRhFeZqNG1VzbfyT7h70z9Cz0gKwZ/IhrnFW0oG/slNEL
         rUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        fh=pO31KTeRY3TjK44eUHQdXOCzpdbd3rC/MnkMIM0KBIY=;
        b=i2NfrwEjRQqa37HNoKPijTHeDOvMEsXH56I+RWUEtj7fwQNtIow6SJTLq/RPDBvTlz
         QJSfTcNIjeuUtBFVV2NcRDIBegC/gmon2PtO1ja0+mNj1xbXWLKobYwlDqyyg/vtXhg4
         TJF1OP3AWXWgTypwuk7vVRPwQjguZrJGy1jdf6kQ3jniNMCp5FDSYe6k7RPdtsgNRZNJ
         2AvcgbL8Z/5tQGVbWuf9nkwmAQUec4ni6Y0XeNf9sR1n3hU5UbOLL0Y7FevoEy1OfHtf
         PvVWM/2UNvP+rDfJPI7Ofv7+zInDGiZhte9hNcYlTVgdTZ1rVCOrFcK4pHOXwuHC/g6U
         NZbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1794572671; x=1795177471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=ElxbnzGOtU2NKf/45LZpX7xm8kXYQeP2jtOeAvXd3OMW40BOKvbtDNsnysfUxalwMF
         waPnHr/TALZINvPWVswP3Ji//vhwoWyVwCWIKMCC/If/I5KXsONr0CJZLB2FmyVMrj+N
         Hw/nhZRHaf0OZLOtkPyRKepw0DCN66HCm/qVrZI2FStIHGeYhyullHi5/Ix0rJezkRpj
         6ebi328c3+wkdpvYSf08rAP6s4ldkRdH7jYJYJe0rJEhD0toAfhtqZhJ9EEzM+QtOW5o
         2IKe60eQWf2TkVfdRdmKu7ZZYghHQ+hrdOtkhyVoBfLEPiCyJTR2tnUfoJQF3c4GaQ0s
         9Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572671; x=1795177471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=Yx3GF4f1+SYrVonHeM8NvhAjcbcyz9VxQfG8XPD9bxbjrk33culqPO4cewkidv6cnV
         avlzai/8j6ZwkjRlRGhiqk+kxqlXWGDPOdZ58XHeG3ivXBUQNe2pQh/2t3ib53B+A3IM
         183eUTP1PQJo0Rrcbu5X+IMFIEEpkAfNYYouTaE60tiWKTaiDABcomp9prpj7XZlWora
         wo+vFkeOPaP8n/AUtGStSOnjbF6B3ifHypYUkooyokdonKE7N7bKfgUYv/Y84R2mcHOz
         Uras6OMtbTnGQOcDPXEc82b6aGOy83HUi8FXG/D4HcKArpK1mDq8lDeuChg+rRzxhL7W
         mX4Q==
X-Forwarded-Encrypted: i=1; AL+hErH34ktePZ3tlRelQsS1bgCAGlhMQONBQ5B51TFGGfaNOiKPEbTSSDTMsdfIYBqt/YEZ8k110sDyrGzdWuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2fvDEVJgMYcbDDC+DUJtgFLfrqh6XV6hzCTBBHGAc6i8X5L4i
	3e0aquhnD6oWgIOawGdhJyGxN67xWnQLy6CTtE/9p1AaE2e9mcNQb8dT+Vt3476k5Fh6irimlJj
	IwvEHFkIkvRexiS3a6OcN6/ppT/9Ma4skaqczX7K7e3IRqr/NK/a4vo4=
X-Gm-Gg: AYBFou2jsQV+lClRZuB5Ke6/cn+911C+l+InkspNPwBuYEa8FEg2ADw4Es8H61qyGnq
	+NDj9Jk8l8NSVhe6BAOkhtcIbzH+QO7KqZ4OvkeN2moUQlepYi+uEDEpIFSsJiiKxjK1AdCNmyy
	IS/I6CffZLROrAA67H9DG31cwnk2N9xUwVuH70ahcSL64z+UTny/zmPWF+Rfu6foweVnc+HXmFp
	Vi4ox8sInhmhrorzTAVPOed0Zahts7xp2u2hvWGYOnhbyihzqhmKtyAYzwZBLd3L41ONSghSx7n
	Pb95x+7fYkUDwpec1IXvInY1v1uo2u5GgvE0zlyssNHpwS+o8bEXa476xhd9DlGT36wbd85IgOw
	LUf19UdEtUxLD71QqAWCrjSIchOQsIp2dCvkxUloTz5zffnZCYYtAYC5qG63ZrO2TbV9ui98AIH
	lZisimCsArCUxMzwNM
X-Received: by 2002:a05:7022:f4c:b0:1b2:6cba:7f48 with SMTP id
 a92af1059eb24-1b50315622fmr2098905c88.31.1794572671002; Fri, 13 Nov 2026
 04:24:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-3-cunyuan.liu@cixtech.com> <avLsAlL048MtIX4x@e142607> <avRm82TLBe6I6LAD@cix>
In-Reply-To: <avRm82TLBe6I6LAD@cix>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 13 Nov 2026 12:24:18 +0000
X-Gm-Features: AclHuK-6TzVh3nCVDRnwGMEM8YGOPOqHwZQu1e6cxT9cH1x835RSR9V7MLMVi7Y
Message-ID: <CAPj87rOi0+T7E7Kge4z-8L9FuCSTt6dCqT+9+YtF3wDkd4vRVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panthor: Add initial support for CIX Sky1
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, boris.brezillon@collabora.com, 
	steven.price@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com, 
	daniel.almeida@collabora.com, aliceryhl@google.com, p.zabel@pengutronix.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Cunyuan,

On Wed, 11 Nov 2026 at 13:16, Cunyuan Liu <cunyuan.liu@cixtech.com> wrote:
> On 2026-11-10 10:03:46 +0000, Liviu Dudau wrote:
> > > +static const struct panthor_sysc_config sysc_config_cix_sky1 = {
> > > +     /* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
> > > +     .alloc = {
> > > +             0x00230000, 0x00000023, 0x00000000, 0x00000000,
> > > +             0x00523222, 0x00523200, 0x00000022, 0x00000032,
> > > +     },
> > > +};
> >
> > These should not be in the driver but in the device tree bindings. If you extract
> > the system cache code into a separate patch we can have a proper discussion there.
>
> I will move the eight SYSC_ALLOC values into a DT property, such as
> arm,sysc-alloc, and submit the system-cache support as a separate patch.

Whilst doing this, please break the properties out. At the moment,
it's written as 32-bit groups of 4 source+RW pairs. I would much
prefer to have groups of [<sourceR, sourceW>, <sourceR, sourceW>, ...]
than just the raw register values to be dumped into SYSC_ALLOC*.

FWIW, I agree with everything else Liviu said. I don't have a strong
opinion on skipping out devfreq if OPPs are not present vs. exposing a
single fixed OPP from the clock provider, but the former does seem
better for me.

Cheers,
Daniel
