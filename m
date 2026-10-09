Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9850276B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584844; cv=pass; b=vA6m3RGLqJEj7SuxgQKpn/smNcCkp1iHtinpkBxtGn2fI/axfNPaumNH8kamBTy/w/GJNlfSyKlF0nLXIg8CEB/e1XkCRnSRTQP8xuiF3/bYSw3vGjRCgTqFLQrUNCP1FNwagULSeVu2TN6m8Wl8TsvG6rREonAthvs2ns5VQOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584844; c=relaxed/simple;
	bh=nvZAxM1uTFf6vqYXeKGDUerVMz9C1MteMmjjs+5GFBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+C/rM5Y0PbXR4+ryF4lOUEOuvjdozGLH/TxA/36esHacS4nAH9Ra0wn0e7FmGpBCU+sNmd4dEVvnnlw/n4enMaZfsHdBzeLCDZHZyoaP+G62EIGhS33BoJ0yDXMEn46t1nRDkP2j88f3rqPSmZKl6Buuwc7iHf5qwLgHXglnVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfNxO3Fx; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfNxO3Fx"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6aa97edc48cso285794a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791584841; cv=none;
        d=google.com; s=arc-20260327;
        b=BAc4Zq3m3q+RPbA6YQkf51bSyV3IQ32p214ikF2sebsaSB2QWaj/qzExY3UehPgcPC
         SkkVObwEx9YgBwChR87w0QhGP2Ypx+h6r21A12o1f57ksSRg6gyiq8wcI8KoZoumgBAn
         t5TMGPNL1TT/g5Q41ZP5Qjk00VhuKLb5BZO/xIr22eO4F+9O7LtAAGobXWgM3miNwrHz
         /U0/lZbr33qmobhgpKTdA8IUkpyxrjEtuM0SVwAQiyrTDrKSWQwQWtCS3LfUU9KEKhpd
         lJexxCmIBW9UORfiJV74MBMLWPs3quCrX7Y/Bbr14WeAtqLkvm0cVBoKQJTxOlimoaT/
         0v5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uiiw0pSBFiqDyg4Oqrw5tZefMD0LZeMyg0eFusxD5zQ=;
        fh=Tlz5I+hPd53e50pi3z0NdrSiQxOVsUXeIYh9m0BeHIw=;
        b=k8UM2XJw3WRBy8Lvh5rsf8KjlTuWKzTDC2+R8mU1cRW7UaSXYhotu5NWiRBBheL8uO
         +5ZRgSC1MxrFuGnlDYKAeJSIIt6gRI538W03CK8BTFv0+hv/miaCHz2OEP8BGfAfVM81
         RU3cV8l7ltGzHOydZVsh4vc5nI/5WV9MsIviR3F1kxDT/pNHK+i7CQLuArvXJnPB4tJ/
         XvcDrgRocC5OxBubpud7EdZj+p8+F1K6UrAs3uFNadRKyl4/wY9Ga8ImOQGX06g6SyVB
         a9Linj+X/it6nT/OY5ij+b16+UYDXznpnbcNGlot0CoDR7R7qvhO70TvJzyuOW8gvPo9
         1Pag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791584841; x=1792189641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uiiw0pSBFiqDyg4Oqrw5tZefMD0LZeMyg0eFusxD5zQ=;
        b=OfNxO3FxSMNHbDRZHri/Rxk6+3oT9GsmxGt6lpkyjWfJsTp2pSfFPHaoZ/FpiPyRVT
         +0OI3qcwfmr/foQMDxow0SldLHCtMrFR61aAttpHl1iVgRAW7q/vfklsX/8XfPlQdJ+Q
         LFMix9pbndGbc6JaSIH6KUBkaocfgm6XfgheQ6JFKOI9O3xU1dq4wAQlviOlzB9lQWP1
         MoEQaUBj6GCxdFotaN/YwgUdaPBrTSbOGtcPRRWmr88zdEGcKwfRv6jRPWxWCrr/W6N6
         fbXh39/LkgXjVl5qfbNv8K1Kg4P66wgShjNrXOHsJzennVHL98miM6kGL5PngttfCdo+
         dm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584841; x=1792189641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uiiw0pSBFiqDyg4Oqrw5tZefMD0LZeMyg0eFusxD5zQ=;
        b=GZDRs5N/Xy13tXCaf8kAcT1TNC6JPabSePAA4fy16m1dr9bx03raKSCTjOHqf6dtEY
         J4s628sp6hqpOsC7J8qu8HxpBa7mPMSO17cA7XMVSfOBMkMN9AXJEFEU6Az3FauwsbsO
         yNikndbRbx5qfH6SCLb9XeKyng3RxImwijeMsNpED9InOIZtdaD4kI4Yoo+MmELgYkPP
         bPiFUK2imuawhe580FexaYsxyicra2eHDPkohragx+OxgoSZd8OdxlwVRcMHzQNGJPH5
         mh7/g9pLXyy/uC7ISZZYbdd5aOvAEkwvaAacGFYxRTM0h2D8Vmu5QMpwDgp9v+dRpmR/
         9zpw==
X-Forwarded-Encrypted: i=1; AKwUvBzlaDNA4td503rKZ43/1TSjYxDJf5wv616P6KO13cTSvO4oFCIewqcWjyJslo45GEGBRxMDUZYRpQlNTQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoC9tZHKUcQx5XxZrOjGZf4iAO20h/M+9q97SBBRyTb75Bnv5N
	jUQ8xuZ1HvpyOorq2tNCIEjNzRXGbN0IyX744EjV9DcsfOmubPiA4NLCawj1xSpp/vrvPq07O+n
	+lx0VNHWxtQQ1MEikFTLWyrdpUhczoYw=
X-Gm-Gg: AYBFou0OKlL1ynxkirhmRjO7Yjyak6qkzfK7fuxyMQtlK90g4RDtr0nZygWcp7xOhHg
	lXMORbCYAhbTYXL8z8Bwgb7VpOpiZ8PJkv+lN4QnilRxUE3BWouJ58OaBNry786HaMY92K/Lo4v
	38XwgpKwfew4aTr8khpP6VqlUJ0F3e6Y2Ru3TnD95nowIVgpa2UC8f/t1MLlxQmXyV5At1JRaQD
	aAYQN2NuXpepTHV9uFM2CpJUons7qWTu1xJ26ivp+iPZD9jU8B8zWsWbrBfDvVWsc8rhiTJoKnn
	cTwLBOcTWXLvdnZPSQrG5QF0Zy0tnQt/EHg30fZTwGaUY4yclNtiiyTAcMLPoTThxDdwV0ay7tt
	mvjhFSVHjaDJmzH8vqbsUigdGwx5JGylMw6SXrWHOnAA0Sy4q/XIF9iCPa7sPpYnwTCh341U0xI
	kWASa8o74R1jzSP5sG3ZlxSX5cem/0KkdfTYBxctnFE/ItpThUFYRO+blRHZbynkHShQ==
X-Received: by 2002:a05:6402:1ec8:b0:6ac:bd53:d29a with SMTP id
 4fb4d7f45d1cf-6b17c1de783mr2926999a12.3.1791584841118; Fri, 09 Oct 2026
 15:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007174449.671416-1-rosenp@gmail.com> <20261009164732.GG83879@horms.kernel.org>
In-Reply-To: <20261009164732.GG83879@horms.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 9 Oct 2026 15:27:10 -0700
X-Gm-Features: AclHuK_prdV1ex9ara0f02v0arlilkcU-2ggnzgJ0G-N7v8b7hFnn0IO-j2lriM
Message-ID: <CAKxU2N_=H=D0p=g0XBqFtJFHDpidO-5d7P1kKZxXEDX86BGnPw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ag71xx: align the IP header behind DSA tags
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, Chris Snook <chris.snook@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:47=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Wed, Oct 07, 2026 at 10:44:49AM -0700, Rosen Penev wrote:
> > The receive buffer offset includes NET_IP_ALIGN to get the IP header
> > aligned behind a 14 byte Ethernet header. Most ag71xx devices use DSA
> > switches whose tag sits in front of the EtherType, which moves the IP
> > header by another 2 bytes. Every access to the IP and TCP headers then
> > traps and gets emulated by the unaligned access handler, around 6 times
> > per forwarded frame.
> >
> > Take the headroom needed by the DSA tagger into account when choosing
> > the offset.
> >
> > TP-Link Archer C7 v2 (qca8k), median of 3 runs, Mbit/s:
> >
> >                        before   after
> >   routed up               743     855
> >   routed down             660     749
> >   local receive           554     572
> >
> > The unaligned instruction counter no longer moves while forwarding.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Unfortunately this patch did not apply cleanly to net-next at the time it
> was posted, so our CI did not run.
It appears I was careless and sent it ahead of local commits. Will resend.
>
> Please rebase and repost.
>
> --
> pw-bot: changes-requested
