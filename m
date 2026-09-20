Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106A479864
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789942591; cv=none; b=JAaRQxnfTalDcgzv1bR6vAsrzbX5tXUUExzJDhYk9WhVYOmy0YxiW//hZivPrVHe9EGE7ZIRFgTHsR5veju4BApBRogdwlaMu3huOmIlGg/F/twueWeCn/idawxsgEF2WEkYmvNYT1kcnAAHH+vV2rTnv084IfsIIr5xIuYI96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789942591; c=relaxed/simple;
	bh=ebKDhKAhgud2bnS39ZCHaxinRFvr6zWcjZYPy1ikOOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krPrPM24VJ40e1VA521Fk/IyGC1u70QZR2RhD79YM2mBypYkVxqPjFAK210HLSmQQv2Knv5YLgtNDzn1Vc7GAed0U7kv1cMVHHuXTCX3lj2hpDbXsAmr5JFyd3EnPURdk2FBSIC+Al4jcyGcoZHDXhfUEBn3p4UZyPHKBghZgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/z6BbYg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/z6BbYg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83E71F00898
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789942588;
	bh=ebKDhKAhgud2bnS39ZCHaxinRFvr6zWcjZYPy1ikOOE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c/z6BbYgkJ7i8+amp95ZxK1RwzI6CDC37O0n5Q+4aoiiybJj5L3g1YpJmIw4lj5SI
	 AZigvj5aqCO191B7VBc2TjL/cd+vhakybulEN/M4QL0ZV+095Sy4TUizFO66odq3xi
	 MKM6UtbaV8pZ9XPEySeJlRPW6R5jogVeHsrre9iNrNugOAkH3R3QP+A8gtwc8tcZ/P
	 FFsdIyb4iShA+APROgmT5NCUtkrgH4HZAg7XM0TDpfLQAsuooC2zUIszNC4eRix5Z4
	 FQuCToEYtD53UeDm0dyr+07T80yB23bsTc55mpapt390J2hnAiwDH6oYbtDVzCHsiI
	 ZA6R5t69+NOiw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so2744407e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:16:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfA5T3HBfzmTGnv4eClKfQ82xegwq00rNE2PTDmuFAjvozeJbRxgUBi71QDXRq6EpCxellrBTX7PFAPOY=@vger.kernel.org
X-Gm-Message-State: AFuF++ni3HcAFDGXwr3gOImA0UmN4uJ+CNGYH5bFSFA9yTuYS8ptW/on
	semPfZFdp1bkNzQdwkX5BiWYqQTE7HHGnPOq7SnHPRpXRlnmHF/PbxV6MYuOfFkgmPuFw3qjpm9
	QFUHGNOBoKghV654C7AjBWMFpSeccwmc=
X-Received: by 2002:a05:6512:1293:b0:5b4:ab7a:8275 with SMTP id
 2adb3069b0e04-5b8c17f5ea5mr2698722e87.3.1789942587664; Sun, 20 Sep 2026
 15:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com> <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:16:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLmrxraJUDbRvixcrkMc_foxERA1hRavx5eSRcf9r0_FHw@mail.gmail.com>
X-Gm-Features: AcwNN1X7pTA7qBrMe4T51xXoaKqZZVpzO_aXkfOtaHIdAuBs1L1sA2lNLANIGoo
Message-ID: <CAD++jLmrxraJUDbRvixcrkMc_foxERA1hRavx5eSRcf9r0_FHw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] gpio: mmio: report the line direction on chips
 without direction registers
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mehmet Fide <mehmet.fide@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:42=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide <mehmet.fide@gmail.com> s=
aid:
> >
> > On trees: Linus offered to take patch 2 through pinctrl, and patch 1 is
> > pinctrl as well. Patch 4 gives wrong answers without patch 2 (an
> > undecoded pad register would seed every requested line as an output), s=
o
> > I would rather the two pinctrl patches land first or in the same cycle
> > as the two gpio patches, whichever way you two prefer to split it.
> >
>
> Linus can put the first two on an immutable branch for me to pull.

OK then I applied those two patches here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-gpio-dir-imx

Then merged that into my "devel" branch for v7.4.

So you can pull that and apply the rest on top.

Yours,
Linus Walleij
