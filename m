Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009014;
	b=2ZXz1fV08bi5laUUDwEDVl4a910ZXIj1WqMnfUq8prYNYK31PRgebBGJgrEfWCnSqDsf
	 Fy4PHpgrP0NkJHT9BJrvu15xlhYjc8ThjQ/bqhALRccwc2vnOSLI2K0bBrw0jbz8dEuH1
	 S1fzUb64pkqzwrPPjMtBSmeFXvpTMkjtJLEbsodtQCTaP7CyHv0i78Fx8OmL/Uu13fplP
	 rpSMjAmiD6lnuEBoPrtB9dqyulbVInGu7yMKLVKtXCshZopLGVKujfjBMx19zNqE0zVQI
	 wX4CzrDFxnwD1P7bVZKFj8QmXzw9/lcH4s45J/+i2RT4502M9/0h2lsmtExNjjYo3jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009014;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DcXU0oExIDedQwC/01NHEk+Um4PsVTZtewa33aoXSV0=;
	b=Mx+r++cEVr0hQkucy5TBFQ4c1CIid30E2Nfyt/PlP046npl18Cmq8fmiRnY5QzHMfrri
	 2AHw+V0g8Dej9JO0VG1Zfc+KF3CDkNtiFCHPPLgVF9r60ORXlDXxxXQOMu5mBAG/j0PoO
	 eMV2AejeWFB+07lOp5Nu+x7/iMPn8a0OZYp7xaqdRFB9UhqK6vVUPkKVVROTN7kcAvB33
	 dDDs3qSf6+yfYJce/gJWvhNsQJyd963fjrD3mDbCYQF4oGDoT7A8m7TSHnORoE64jk/Mj
	 XwDwrT9EJTVbkj0fCz/NrGkgb7ICgxt40dX7CCy/GoX/pnVCpDuwsdVpsMS4CDxgN0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxlXosMy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC648606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxlXosMy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00E21F008A1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794009012;
	bh=DcXU0oExIDedQwC/01NHEk+Um4PsVTZtewa33aoXSV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TxlXosMyFrKzbA7E2GTcZqpq6FJ0PDONXBMs1FkC/HZE4Fff5YVAoK1YUYUZNZ14I
	 /uQ4EJAYtPxNUDG3DO+MllJEMMF+TPnKscZgfRyBNp21F9AlRuEmLhoKDpBbBzKy6S
	 dw7r3zkS0RLmB6PNcRbh5/DNnSFAzEaughBGAHCsEVcqBNhEaBP7ICTRhTLzirx972
	 nQU/A99dgYKPsvLTwOTtb0b+6i475eQJjp8i0ks5W2MguTBfMGMycUjE+mksQ8vXEH
	 v5JBLf3CgqxSZhgAx59qIhftfQw3P3hWWshpLL2IXmwSaJzx8fWEYik2M7j139/Ykh
	 ZBqx7QhPjkpMQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-704597ef1d8so505118eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:50:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzg8FEce9lHt9/kzfGdTP6MzaTXmgOz7UfBoJvGbXaDeeJvGPOgg3Qx8R0AdgX/Yahji7LFG6AEpwQIdG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i2LCv2r1uWGSoCqZht+VKjHwtGNvhosVkX0+dAmZ3kGoWkSyy
	2xNvbuBq/5wKZuyqFI17jsDttCUDoCG8PfDi6rk1xXjKAQ5pajm0/4KNdeLcZbemaEGXaB+ye1A
	Bbxhi5FFGH5yysk9EPb5AViPY/0WYHx8=
X-Received: by 2002:a05:6820:f036:b0:6b1:d09d:6d73 with SMTP id
 006d021491bc7-716e73cce25mr2420784eaf.8.1794009012160; Fri, 06 Nov 2026
 15:50:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106225930.1379968-1-roman.gushchin@linux.dev>
In-Reply-To: <20261106225930.1379968-1-roman.gushchin@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 7 Nov 2026 00:50:00 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq7SweZDnbyBYAfg4rvJxowWtO_5LnB8-hnaNR2K228OQ@mail.gmail.com>
X-Gm-Features: AclHuK-_5NxlKe0tcJTJSD6o8Lrzde1RmDvupDJo9TYr2AbkqTlhAlZ6Fe_nV8U
Message-ID: <CAL4Wiiq7SweZDnbyBYAfg4rvJxowWtO_5LnB8-hnaNR2K228OQ@mail.gmail.com>
Subject: Re: [PATCH net] 6lowpan: fix netdev_priv() type confusion in lowpan_event()
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: alex.aring@gmail.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-wpan@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 6 nov. 2026 =C3=A0 23:59, Roman Gushchin <roman.gushchin@linux.dev>=
 a =C3=A9crit :
>
> lowpan_event() assumes any netdevice with dev->type =3D=3D ARPHRD_6LOWPAN
> has a struct lowpan_dev in netdev_priv(dev). However, non-6LoWPAN
> devices can also have ARPHRD_6LOWPAN, e.g. a TUN device via TUNSETLINK
> or a bonding device inheriting dev->type from its lower device.
>
> Bringing such a device up or down causes lowpan_event() to read and
> overwrite unrelated netdev_priv() memory. Since unprivileged users can
> create TUN and bonding devices in a user and network namespace, they
> can corrupt struct bonding and trigger a slab use-after-free.
>
> Also check dev->ndisc_ops =3D=3D &lowpan_ndisc_ops, which is set only by
> lowpan_register_netdevice() on genuine 6LoWPAN devices.
>
> Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
> Fixes: 5609c185f24d ("6lowpan: iphc: add support for stateful compression=
")
> Fixes: 2ad3ed59198c ("6lowpan: add 802.15.4 short addr slaac")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-97b284e0-576e-4373-b62f-eb132f482=
b91

nit: Signed-off-by should come last, after Fixes:/Reported-by:/Closes:.

The fix itself looks right to me: lowpan_register_netdevice() is the
only place setting dev->ndisc_ops to &lowpan_ndisc_ops, and
bond_setup_by_slave() does not copy ndisc_ops, so this is a reliable
discriminator.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Thanks.
