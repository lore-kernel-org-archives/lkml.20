Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719980;
	b=Ct2dmoY7btoKKf7xFVhorfssglzDUwv6uLQI9b+HRZJCcqULT+sTsRgrBW/SE0knAZsS
	 THYvj5GgVd2yrlHlaKrMKVRuNIKw0qDijQ8hlJ9okwOW/CQXeO3KBtyuEc4CqorZUPAa2
	 b0d266Tz5eZnTVyhgwVbDtmHRF/vQpj3HMeWx2Jzds4LvZsw2X+1NRM5w/fF9CZue+ZRG
	 SkDiV9XrYdPlzxKl1h7Veg92oQnFGUb+2a4U9BE5w6eDbSApDOGP+Yj3RmXAq5YoQUfLP
	 rKHESqq5524m53xB0w0TEIWrPBRk8QLkd9W+6lWjBsqnGgpHMO2TPkTOJjtFTsQpCrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719980;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=;
	b=mRkCnYB8Cs3XhGo8PvcXp/AHNur2HSyYNzaMCVOA93YxtAmSRtA2HGzsG4qPaq4zUmp8
	 ObRo8n1T+q8o0dqH495CKaseVUxLNnQ3vOpPNilI6kGx9rsMGNXyoHxm6AyBexaAzFrJJ
	 XxNc8k5ETI1sBhL7R0/VIak/T49XyRNp/HniCsqAUTvj9ZjNvC0sl0MZPM5zow1AHdAMP
	 zYczmAOOskbuTcgscuvVW3w2czTQzd7Dz3JvzkQByEyyTxWrHHN9SIXoBiupmZ0P187xS
	 ENT0c3FsSeYdt4In0DpX8JFupDjZdG13Dja6brr4/yexiRBWsbw9hctQvZ9S30BBIVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dr4LZMbS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF91606EE87
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dr4LZMbS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843191F00A02
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719979;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dr4LZMbSEBAFmcA/cUbDDc1IenIMbDNdgmj4oDHTMRsIsJpkiJiF/5BwAu2R3Rl/K
	 u5LyhW1Wo9kblTPSl4Tbrr+U6RidpLtEsSSiPI5QoPZaT/L6xZA1FE8kiiAj/wAui0
	 UCY6rkOADElUv5wzSGJXn3Hr5qlECvbbhUlpXvhO8ICmiDlfqs5HigdVU3xHGoi1U5
	 jSCFd2xqJNEH4C5dDqi/OCsYUv4AaAH55yHBjNQhNWFxgqtsv1MwTBNcniSxUdHQQv
	 4DEOK9ZD7r9hLtI+THxSexWJGIXSvRC8On55nHwJMszAWkqzEWedB2+6a6ojBATVXY
	 H38miYnvtQq/Q==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-7143451981fso3065550eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByXck+NEatc/u0aurDHfX+WDOVTYkBeIE8vCslB6aqRXMlRGGWPHC4f+3H/Gy6K0KGjFLKuXzynnngTpeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FDEqkwmXqzCAxbc/wIUB11kvWyNJERmOHJuFWfP/90TgR0nbD
	33x9ZJQCCeHArppZaDPBAd639NgzEcHxL0IXpQviNPnhGiW/8L0WpMcAZqhon6qgaqoWUaPq6e/
	60ARtnudZqtHNdWa/FO7pb+p3L5PBW8Q=
X-Received: by 2002:a05:6808:c413:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-5640d9718e6mr9621332b6e.5.1793719978745; Tue, 03 Nov 2026
 07:32:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com> <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
In-Reply-To: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 23:32:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
X-Gm-Features: AclHuK9qbh-5u1j8zW4quirRvqcSTHBVHOecOsdol74xKAQ-eozqfaINKue7um4
Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: Rajan Yadav <rajanyadav0307@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail.c=
om> wrote:
>
> On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > Does the downstream BSP have this? It would be nice if we could port
> > it over. Then you can properly use the power allocator and/or the
> > schedutil governor.
>
> Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
>
> The energy model uses the OPP voltages, and Andre points out that the
> current OPPs are A100-only and don't fit the A133. So I'd like to fix
> the OPPs first, and then add the coefficient as a follow-up, tested with
> the power allocator on the K5C. Is that okay with you?

That works.
