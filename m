Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794593378;
	b=ox63EcE/N6F/a+wSJiDjUcMkj8bApbalAfX+1rktzNiChhCWcsVqdYWy9jbhjDKiTqJK
	 pP5v/K18JbZLUJxKQpDd/F+EpAp8/zSKtAgvJLc9afW5CKWx5honFOEZRCrlkhYvbE7mL
	 0lA/w+R6A+uBgNEXQZHDJqlCXQrY4szbiXovezyBSvOJvXltuQrQpt8XGjU93gX8gTy2O
	 M5zaM1hNkS8BhoNMES8VMHDbJ4kNNQQpwT1z+slXgUy7Jc8lCttaLbZAdd9G6Jr2NhABc
	 8llY6hKLt+hlPeLNf2frOEauDug00pbKr5JTOSvPpWl93tAcSJIm6Up8/2I/Ow+eUHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
	b=C33nferVCl9o4qrzHTAbJfQfrdOmQPA9ZxWZVdC/Gl1pd4q6MmN0RByLV1wtW3zxEXLV
	 4zYZ0IdVBCiAED6p7uTj3KUbIoNeAKyzWvLBM6ww0pKZbXDR59/kuuP2opCGqtMoq9uFi
	 FXnBRKZUKlG2GDsqvhlxoEH4kuOFmQCQjD4Yz2WdzeZs+oWbNlCPMqLOh9CP4lLVsqtbd
	 vafAcHQlQ90o0/SoH+Tufvi6WsePjknKQYow2cTTaMKXHsKGywMGpDhdJnjiNAblkRJMT
	 KUg8GCPuBwX1zve0+cyKsdGMYItqi/1N5YzaxQ8DhA8Fo9jmOVm6RfmE4WjVmmmI5nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=ZUlXwx5O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0D606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D0D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=ZUlXwx5O
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso1803911e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794593375; cv=none;
        d=google.com; s=arc-20260327;
        b=gv6Nr9h3yPNMh7IbmBou4K/8mNXx9BIsizZuAoAOknib1aVteXaq4+Ht6RLJbWkL1G
         Iufq6w5ysCxLNW0Kliex//xLJXD2V78YeAejo2IpCZ4SyrwvsT0RmnaJjlduWfd75Qs0
         UXra/N675j+su2+MxW2TXdC9Qkv4GH7a2GnEBQa7/Hf0/nWZziclOYAfqmw73h7Uj+3R
         YtqmU6/sp22WqAkmfPZ/EN79j2HYox3bW+Cpsx0jNVtAIobvByPwYz+ru4018akaGNbO
         7xToT5RWe4+KQ7rpk+mcuML80xs20HxXT5+bXL6t/TRqsSJ28g+seYejLpkquE2aP70J
         m+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        fh=w8wUKXu7mQ0/L73hfujok7cKF0ywdCQj/I3KeBKezNk=;
        b=GUZI4To9VTx7HgsCJN8uYE1DxMzllfDPBmbdC7VluYTqlfENj1PHnQb3gk8xnLiFI0
         m3TV3Rj5z8cWmQ4HaeWh20/vRTmrJis6Dc/d393RSVfIXDAOBl7+vlaLTZzQ+1TdULkz
         tyXgX1JwxagXPM9uYVz7vAEXFJeLBoBEWGdls8GS+CNFzlFHODVvCcptmoEcPeJxq2MI
         aRCrmuHKHAVs7Cuw5gB10CCeaB2G/7rUXcP6CMF0TEVjmY45Mnz2yaJyppSAXr+LoGy7
         7ugy6YwvNdFGIywCn1u8kDOjDtPvQSVbtmZquDax98AoVuyytDIZE94fJGlEEPEHoBR3
         XH8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1794593375; x=1795198175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=ZUlXwx5OG+JQKWfGRiwNShFeE+rJAiJmlZWjpNqMGQeKJzQ9irRDrmXRJEQ1xQwKEP
         oC1p6fRP+O+QGsvPAuPCHwmqor3gx/ek44i5NeuMw99WRv6UEK2tKLz+pNNytAzDITwT
         i/iOkx4l6CFgUkIPEshBohju1FZwUExDyuCuzTiWrBvq4RfjqezCwFu6vEzuVMpdBzZE
         p4mlXrQLL0G5dTZHNvIyGmVrZoXGG128yfVH6Qly6GaD86HbSwXlHG3yyNivO26r2/6q
         2xEFgeMDAMBjpGowGt6CTX5OTq1vrEF3q2LO074Srvi/aTwi+7Mzxzul2Tio66/+c34w
         dbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593375; x=1795198175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=0CcECe62e85We4rUZGce8HJXsmQLfWaoprjxLYH+HUcFycQ3sgt90jUu+RwWVU2TxJ
         3vxYdKySN/d4lEPBAcscNED/i9llzBUeIMF+xbm/OxMiYQP32Z1ssHqhFsM8r9+689Vp
         H46dQDVSyE/6qMpv53WrvlUT5b1RAp6LxRYEcmBpJkK2v72DGJ1ZkfGAvG0MXctBh1VK
         Yid95fbOTyKqnycekY6TgUXcKue9pQNjr0H5VTKd4+mrW2tUEOLRvT9/41noqjEKShdd
         ZB/tubwQwv/roh1vh48Dxhhp/d/VuCfBhHeRKHFxr4FZlUUXTmMkUaNH1OGqmlOa0lI/
         EMqg==
X-Forwarded-Encrypted: i=1; AL+hErGKoYZfPgVkF6uk9IFamMlsUxvRjxW4Et3f5B6BTFGP6tOOr4M0Mbt0m1Cco222+7CTcdm4NMvvgbMAAOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ukf50GaekgPlmU4xmTRnhpwA5pNOghlRnzJwZzkT6IiAsle5M
	x8daxhruRntbvyjEs2x2e4Eg8rVULF2UC8wzH1/nZuhNp8nl8Qz8/P7YzaJuNrVSwH2MLQlqlsM
	1u9BwqI4hp72H+wZMxs5tuAGJJqAwPgMkC17HtYsmNA==
X-Gm-Gg: AYBFou2TK/mR9H9mY6XSRt1HudBB3WFV/bT8OzuTSqOxykvVLtRONSEskWOaetm60lu
	bg71ZD6fkECJ+OR1ZwPFIph0QIPpLW5qZg2UNNqocAeT+En68pxT3UMErQgZDutBG+Y0vzXT2cv
	Ns00XepIAdT1E1qFim0VQ5gufYMVPooKYudEGHqXnS7mDdPz36h0kDXKms7uzoUtfpGJwPTZUFQ
	soLW/1gtyYyssBNymeM70430Lvz8Q56iv6D2q5ooGMVsLE65d+ZQ2aCJm3daJTvpPoeoLftYKe4
	genZYGAYtOattMbCyT8n3W68dM/M0RRUSrJ5gWqW/Lv4EZnRgsz9DNyP7IIhBzgSAzjRA5KzXv7
	UWCeEUJraZIS/CfHN1gjPyKZZ6pYQaRyqUYjR1loSgAUnpsYxdorcdDqXiMzcSvQncrEC
X-Received: by 2002:a05:6512:1188:b0:5bf:b93d:a85b with SMTP id
 2adb3069b0e04-5c17099fafemr1222262e87.25.1794593375264; Fri, 13 Nov 2026
 10:09:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
In-Reply-To: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Fri, 13 Nov 2026 19:09:24 +0100
X-Gm-Features: AclHuK_YnjdCkTrewni0BQPjUqpjzPPZv35V1L4cPB8ogSTTtBU8c_5Nldb95ug
Message-ID: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Gaston Gonzalez <gascoar@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <uajain@igalia.com>, 
	Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:20=E2=80=AFPM Martin Wetterwald <martin@wetterwald=
.eu> wrote:
>
> On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > > Hi Greg,
> > > this is a regression introduced by aa125180c673 (via your tree) in
> > > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > > staging-linus would be great. Thanks!
> >
> > This is not a staging driver anymore, please route it through the prope=
r
> > tree after -rc1 is out.
> >
> > thanks,
> >
> > greg k-h
>
> Hi Florian,
> Now that -rc1 is out, could you take the patch?
>
> I've checked 7.4-rc1 and I confirm the issue is still present.
>
> Thanks!
> Martin

Hi Greg, Florian,

The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.=
c)
is currently listed with Florian as maintainer by get_maintainer.pl.
But Florian tells me he doesn't maintain VCHIQ.

How to proceed now? This file doesn't seem to have any maintainer as far as=
 I
understand.
Any pointer to someone able to take this patch would be appreciated.

Thanks,
Martin
