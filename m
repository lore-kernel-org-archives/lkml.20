Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868878;
	b=dv5hoECKIpMY6GzerNYbayMhlnUuihOeoIhB/qMSpJPfVfXGb6Uc4e/gaXYiWVD1HkBe
	 qAvuq0YZCq6gnszPOEGHoCkQ8lqmG2T6GweNcNoBBqGQbFDLJF9Uvmysa6wzgshIrHE+P
	 HyrwCxCaVDaProx9qXHpQxSfi2UKz1Lr4THEnbtrdpJLkrurYWlwVsTIEEYli3KZXtNia
	 brDtHlrX1NllMF+8Wz5oBIOQyQHMuhf8NFZNB+nw0RLgwns0kuXJ/1srfzmUpZhQeC4tb
	 VQCbtspdSMmkrA3SOMH13eaADKmijWnPIkQBI4e3V4dqD18VGqxrXnL6+hkEe+GwJnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868878;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DVVe3FzAnvs93NbepeyFk6hW49mA+Pu2o1a39rMbIEc=;
	b=YhOX8uggoSiQbrWPfSbgkDHDSyK5nGpYkhABhMCXlQnsqkWXVOeRvhqssdaZXpBUzR71
	 ZDuXagxI1UwO+gy+s0lhUFS1gB8XO8fiNf+iFt2QD3Ou69Waz0i2b2nPwkP9eGB+Sya1B
	 G3TsPU/eVkHWp5AceVpFW5yjXiHplba/QooHSF3R5ia0nYCYXj1O+MCxi/D/tWTtKggjr
	 eeWKgQ08f4gboXc0VcmkeBElbBTfxS/6IDlVyz1NqRyREH6bn60ywMVY829HNfIyJ7rUe
	 dHnhzmLWAvyJ/0nXuBLEYTK4c4hOUaQtOmdGnemcBMjBTYVTUabwzXr6rri4tyMOPVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TASrUzj4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7673D606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TASrUzj4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547EA1F00A15
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868878;
	bh=DVVe3FzAnvs93NbepeyFk6hW49mA+Pu2o1a39rMbIEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TASrUzj4saXMLMH3nA6tcJnUOlbZZJFqYGciiTf9bpRy/Z8YwmoSGwyJsWiJ/Uu1H
	 0bJeg2GvyXujibHLzoc/2aWl+Rws4Z+DVHdb4gnhF7BtcTjpHkw1iKFBFEto78YouH
	 fVNnKUmRct2mnG6iaW4cDnjzPdn3KLSt2uzmYVTgHxOLl9IhcgAMqZlc+X7TJwnNVG
	 rwSvzBYhQbnmUQPeoGXg+O365RVuBuY1x+pi0+cwahgptK6ArEawRk0EeLh7PTaNSy
	 abCUyhko73xR2xy3Ppokh2XvSCDfvsPsOS8i8A63dalLdvILxmfEQYga+YIswAGBII
	 poKP/X22aaiFg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so1224180e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:54:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxcLjH1FZwrJwx5gKGo8b6rdHzSTBQpTsCbLXJh//0833j8XqlezdAbNnaXY5IifpmjeG5PBVRLo81Mj6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ekvnuEeBcv/EaVRggmU8w/WZ32vhrIujoBuXXCnUJPwy5poPR
	3ZvkXuJcLUbUvq2EqFqk0f/44dSNuv63u+H4WcjmFqn77y1FZvQcbQYh8lb0XSCj9jvhzuqpvhg
	HEY+r8u1np8UuFSv+aRQ3GC8tPfCC1sQ=
X-Received: by 2002:a05:6512:3089:b0:5b8:bc5e:b58b with SMTP id
 2adb3069b0e04-5bfd95a4b02mr5739173e87.67.1793868877100; Thu, 05 Nov 2026
 00:54:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031081804.218566-1-pocj8ur4in@gmail.com>
In-Reply-To: <20261031081804.218566-1-pocj8ur4in@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:54:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=s=8myyXaA_bzpgdCXSTFuV6N9E7jSTugEpHLz6sCiow@mail.gmail.com>
X-Gm-Features: AclHuK9jzhrMR_GIOjckLsaRqpnIyiPrY4hPuPPG5HhQ-Fm9HL5f6KY7FDGM-wg
Message-ID: <CAD++jL=s=8myyXaA_bzpgdCXSTFuV6N9E7jSTugEpHLz6sCiow@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: realtek: Write the encoded slew rate value
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>, James Tai <james.tai@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 9:18=E2=80=AFAM Baek Kyu, Kim <pocj8ur4in@gmail.com=
> wrote:

> rtd_pconf_parse_conf() maps slew-rate arguments 1, 10, 20 and 30 to the
> two-bit field values 0, 1, 2 and 3. However, it shifts the original
> argument into the register value instead of using the computed encoding.
> After masking, these arguments write 1, 2, 0 and 2 respectively. In
> particular, the distinct 10 and 30 settings write the same field value.
>
> Use set_val when constructing the register value so that both individual
> pin and group configuration apply the existing conversion. Leave argument
> validation, field offsets, masks and regmap error handling unchanged.
>
> Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input =
voltage and high VIL")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Good find, patch applied!

Yours,
Linus Walleij
