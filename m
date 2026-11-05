Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793842875;
	b=5HTZyif4K1O7vKAH/fjCcxxDkVVqvTJVC8nyhQoxhWHdmYZsgqyp/CXdkZM8tmbgl24y
	 jsdwHz4y4p9DPwIPoqbFLttQxPjQcVktHGQz4+pWanWw0j+B6ir8EBBjr5SwNkYO5H9/T
	 xkAo+GcjfUsCgK5IVolhX3indPWyrmOIHIRHoTQG6mAi1yJV10VMVz7ovsCfPqK/BQca9
	 E5tyyTCuDaJj0xnxcgQx236C3UHn5ZWLDVCel+FwyMbZKbu8WONNaIPeVw5pluqZUQFMj
	 EUYwCHskNCii9WqgNsJWR7AGd8ZOkousRa5A6GbbmJLf/QN72nJeDz9CD0sNY1Z6WGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
	b=Sd3lj/5tzBOjRW5Di1LNQO7aTPl1Ere59ELb1yz4cIVgbN6Nx0eArVOOplyO2HCpjxF8
	 J6mc/qVcq5bPo9zp8gUeMdizrCoFX/maxAyh2bC59B8NbAEwSqKGzYxPnv5K5D0l+c7je
	 7DQPRCsZdt50eXKOZf/9K5zzMBQhtozvZuNPQjhM+slWkfP51No9FhbiYvNLqrmWx0MCP
	 0IhSG7jg5LK/GPDN9rSfj81HjX+6kcn/1BiCWAWgT1MTA3PpDZgVfpi/gPdJ/FkkR2GrJ
	 wT3Ag2FZpVWLOhobTn9cQsw3iQi4CWNwY5daC3AmAMn4xO3GUpKqdOCGGLscSSuvJyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/qfmrh/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6F606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD6F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/qfmrh/
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702dedeb70dso790546eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793842873; cv=none;
        d=google.com; s=arc-20260327;
        b=n2HCsUiN3Q7RlBr5M8SlceLeBNepMz3D1Rb3qVwb8kqgtlObL/t5zj7XH2XvcWOPlS
         MF5x0CQXG0Gz3hfWoPalt8IUnpNrR13Z7PH4nXO0zp5lO+tdUcOVuz33TotEy/1Uw/Zc
         sFgev5k0H/0e2zu9YtO2oEq/quZm2EI5SVyXoDnZrVACPLVHGHrP8f7nci0Qts4bC9bd
         fw6pzsp5N1z8YksFRYqWTTShZuM7OMSjxtXSjZYf/GvJrq1atadLcFzCnHzK8POsPJnn
         lxIqeK4IQYqXZipY0xYch4XtAg8LUw05HlUUhe3dIdaXcChbeZcdxhsnahejGRtNZQbG
         GVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
        fh=57EF7HzmOT5EcAN/+Qeb/EVfxj4pXRE2IKDPolk7HUM=;
        b=l1XhFK4gccY6xPkambJxhuk5ipiyv4Laoma5XMllohh9AkG+hNFgYQ4kb8Df8An55Y
         qLNKss44saM1LcROOVz84Jm3BEFXoYw9xo6EK9/8oKHUQ8YEZ2DyjlkP2FX0jSfwXZNy
         s+6OPC7ix/MjXS4LmtCrwzggZZFM7auqKxs+8RU3x98sy4PzCya26mEXdcLrRGR87q83
         J8oWJUu0tlGixR4TUPxvvDRvp4kmU9e9xKTnbxb/s+LSnt2zixQuI7tTRLa8i7xanG2V
         coNQAZeG4kBZLlK0T/dyfFCY0C8F4akIWH0t2sUJvjhGbAsJK3a1wxrI+jYzxBrWGr0x
         8G1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842873; x=1794447673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
        b=y/qfmrh/Ik4iv/md3hrX34X9Ve19BGAFJINutxWFAW+A/XH4KZqk7pwEuhrriKSB1V
         uS7wjhJsgYChIaKDUE1vwr97lUI0qFs6iMpeXCxiwmqdHSAYpelZgIXe9xLcjryKevBE
         QAqdN9uV89j9i6r1tYlJBEI4yx+BdrQLHey4LWRQUnCmKhyicwQdBNvkMKw3HtJR+x55
         3sPfm1RsHZge45rlH1ucRwtY+MiDxSCUmgLNxuBFPBDkltqvsex77+XiRYXWVr3UO2S0
         Tk8GxGbB9Uu6vhfhW3xiA3S2mrESX0rlVe82VX8tC04TYPYOZG4IIPt5ObtXyuXdPEYZ
         SXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842873; x=1794447673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
        b=AjeAQ86TTkmLzOsjnyGf0neBDwNyTd/UZNea7mOlaeXRjASzDwygkMHqiYc5BEXzUC
         IlJZa51IvA8xaPCkA8yoZJiFS+uE2M4JjqxRAuq6mGLA5IQE20rWiWEfJlgzh8vGS6rs
         LNrkfzA/AMnUlExkGWqyTMvayYlDkX5kxJdVQRnBnfuxbWXzZXv6ZtM/VxHa22H/FPsP
         lass7oj+YlOE+gCXUefI9shFiob3D+0/di7WwbY5fsTZIsU6vOd7TuhokqVzJ9w7pdeV
         PCyyQCINkTxtmGN6gmkFN8rz7imkkqkgwEzhz5mmGxF8UBv9abuH9/XtojaVFTc5M5r+
         8mXg==
X-Forwarded-Encrypted: i=1; AKwUvBzijbLHlzcDqW0yU5oXwKEwImjsag01ML8/+5FkaOx0eT9CERZn9So99BmNIodjyZO/pwt40geeUwy+A48=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h/HUpq5xoLzAeORU5x/frSj0xmYuiC0/mpD+VkPrqDB7tVqW4
	PgzZ/Kj5ZhT3FQjxGRRzm2rsE//K8Dm1ERqQQRfjV825621WkE4y1fVE59IkqqfJrr7tFOY2pRf
	a8E+UtnlltF3oHcQGYEPfbOjLV+wDkmw=
X-Gm-Gg: AYBFou1xQ4gOJJRUQ3trweCgu/1hGarVNS84K8RnNq136LSNg9V+ya0qMAiuIc69pan
	V15I5VQXTEjNZotven1Hl5M5MvbnO5zzJ3tWOgY5/gKFXXJBGLyPaqRJoFs6vNh5+/TACN4rHjq
	0oY9lR/7JC2IlDCB73aIuhOZ57niJiQ2Rb4+LcvNyOxUPRQk/GsB/M1/xTllQVLALlHfWecPJEp
	rb9FZT3cpmbzfCBavsZemC8RosZzfte1hVQF7Bo+7Q+QNR14qzZPyx5agdbYyOEtIZtM/4mH8xB
	n9jfv/KlPyKPXnWuORLnVtZg7Qpv45dc7v8b+wPo5u9nWGVYxjzRTFXtZfVy+GnadDGuBr+wCWJ
	4bVmiOwfwGJWUqc6DOO0lWa0Wuusaph9aoUbbC+A=
X-Received: by 2002:a05:6820:c448:10b0:716:d78a:1008 with SMTP id
 006d021491bc7-716d78a18e0mr142291eaf.46.1793842873518; Wed, 04 Nov 2026
 17:41:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
 <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com> <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
 <CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
 <20261029060335.3ed1fbcf.michal.pecio@gmail.com> <CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
 <20261103072849.623325cd.michal.pecio@gmail.com>
In-Reply-To: <20261103072849.623325cd.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Thu, 5 Nov 2026 09:41:01 +0800
X-Gm-Features: AclHuK-X5TrkaE1jKVeZptLlE4JZ_rQJuOYK8Xl6Sro29jHm0kSyqERVpVnitck
Message-ID: <CAHN5xi00SAMQf7q7NFgc8LjekiALKiy3LtmT6_SAGWaxZYi_Ew@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the explanation.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B411=E6=9C=883=
=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Tue, 3 Nov 2026 09:01:50 +0800, Kuangyi Chiang wrote:
> > However, we captured USB traces using a protocol analyzer and
> > observed different behavior between the failing and successful
> > cases.
> >
> > In the failing case, the device ACKed the DATA stage but kept
> > NAKing the STATUS stage until the transfer timed out.
> >
> > In the successful case, the device initially NAKed the DATA stage,
> > then ACKed it, and the STATUS stage completed successfully.
> >
> > We haven't determined the root cause yet.
> >
> > In our tests, adding a 1 ms delay to both the UAC and UVC
> > control request paths prevented the timeouts.
>
> Could it be a device bug triggered by timing? Some xHCI controllers
> perform control transfers faster than others - we have seen anything
> (IIRC) from complete transfer in a microframe, through one stage per
> microframe, up to one stage per frame even for high-speed devices.
> We are not aware of any way to influence this, besides delaying URB
> submissions. I don't know how fast EHCI controllers are.

Hans de Goede also suggested that EHCI naturally spaces consecutive
control requests about 1 ms apart, while xHCI can issue them
back-to-back, and some older devices may need extra time between
control requests.

That could explain why a 1 ms delay helps in our tests, although we
have not confirmed the root cause yet.

For reference:
https://lore.kernel.org/linux-media/CAHN5xi1_T=3DC1v=3DhDqoHxLtc9uuZO5Evsv2=
hS2-ZSGd3_mo=3DqSA@mail.gmail.com/T/#m99c67eb54d5b60bad94d2643f4c28068e1653=
894

>
> > > > So far, we have reproduced the issue with these xHCI hosts:
> > > >
> > > > ASMedia ASM1142 (1b21:1242)
> > > > Etron EJ168 (1b6f:7023)
> > > > Etron EJ188 (1b6f:7052)
> > > > Intel xHCI (8086:8d31)
> > >
> > > I don't know that Intel chip, but the others are quite buggy.
> > >
> > > Have you tried other HCs? Any successes?
> > > IME, chips from NEC, Fresco, Renesas are more reliable.
> >
> > In our recent tests without the delay patches, we did not
> > observe any timeouts on the following HCs:
> >
> > AMD EHCI (1002:4396)
> > AMD xHCI (1022:149c)
> > ASMedia ASM1042A (1b21:1142)
> > NEC xHCI (1033:0194)
>
> ASM1042A surprises me, because ASMedia in general are among the fastest
> ones, except AMD Promontory chipsets which are extremely slow. NEC was
> slightly slower than the fastest chips IIRC. I'm not familiar with AMD
> Matisse and have no idea what xHCI IP they put inside.
>
> Purely out of curiosity, could you connect a USB 3.0 NIC like RTL8153
> or AX88197 to Matisse and see if it breaks after a minute of:
>
>   while :; do ifconfig <xxx> up ; ifconfig <xxx> down ; echo -n . ; done
>
> I found this to be a 100% reliable way to detect ASMedia controllers,
> including those in AMD Promontory chipsets. This is the periodic unlink
> bug I mentioned, which is mostly mitigated by 7c0c31c66a7f9 in 7.3,
> so the test is more effective on 7.2.

Unfortunately, we don't have either of those USB 3.0 network adapters
available for testing.

Regards,
Kuangyi
