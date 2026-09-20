Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C01A2FABFB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943033; cv=none; b=X3atlPFQdvlT/W0EIolUN08FTgNft58MRbF/WalFRXcgalr/PYNNxr7PNc9eU0Uw+I1t+LLjggAhnkQ9eNASmpq6g3+JUZ81AJwXaM7V/7hmI3b6JNh759L9EaOxSQg7UTmXl6Bs9GBgjHMBiBk92QG3h3gqm8Jfnai9gvBL1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943033; c=relaxed/simple;
	bh=XcpS2C5b2gU7B0ckmofHcYCfd23MRKzruBLpc8zPt4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbIPlJmToRZ2yH+J3KQNvvgDBR6VmbFUBg6WmiUItjVkdIlqyJB5djCb0K1ixFKFKFzxvIJPe0KUw+4/pNB/twhjV69SjfayqJdm9gWC7rYO5m/B/o0OYv9XMevsxZqPsDICzWe05r8D1KfYOfj1R3oZdagPKpSyKg6iX+3XLR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUzB1v3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUzB1v3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0E81F0089D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943030;
	bh=XcpS2C5b2gU7B0ckmofHcYCfd23MRKzruBLpc8zPt4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jUzB1v3ju2gDsG4RCi219Fw+ggbv3vozCq7XFlY4FfIB4lO1HvzH6kLVZOIrJ58Ui
	 aXFZMbVFbCuXt9iTZowfHhsE13QMJ2kLwna2vZIDvMH8SladHk1cFsQqDfJ8VZbMLw
	 MKVn17XruoxrYdYGf+o3MKTjVNMliRCZ1/3/6iaKFxcXUNsv+ezKCECnNqypuZXBa1
	 Gj1D0yGOKZ60uU8bPKhHiSld8jIxnqLgoL3gnlDm3I1P2LQ1LvitRbKuihVJPqFs4R
	 0NVu0hDG16s1iS/cMnNmsvnhx4WYVa/lvRwNGBlWWx4Ca2Di16YLAeRBGcjiaQb221
	 rN1RrqyX/EIDQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so1807714e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLbdqE5MtwTtW5TbhOAlrqHGu9UcqmObeyg8E5+1t4HyrA6lu2NyPPppMQr2nlz+rb6BALmsTf7AxeLHE=@vger.kernel.org
X-Gm-Message-State: AFuF++nAfCht+94OGSUc5f/hUf+hdLJw9ssLXDRZypn1eSOFZw5oXztG
	SKMIhAnFVeFfPE2iiIdiN7iRiViL9m/Mwf7ifWvllk7LqjRoOqvXWtlYE5/UyEdQHlB7CV+qg6X
	aC0NxWXd6bvBHByq0gWjS6Mb3wdj4OPo=
X-Received: by 2002:a05:6512:1293:b0:5b8:9ee1:10fd with SMTP id
 2adb3069b0e04-5b8c195b2a3mr2596776e87.32.1789943029592; Sun, 20 Sep 2026
 15:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <sa6bj9x31zk.fsf@dev-ag>
In-Reply-To: <sa6bj9x31zk.fsf@dev-ag>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:23:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnh9UwMd_opPfhWrkOssDUJQkqmADa9Re_hqnGqHdnKrQ@mail.gmail.com>
X-Gm-Features: AcwNN1WxZQUUkn6BXksV0q35G5hTDHGJ7iW3Og4fCiJ7c6yi5T8Bf6oe0W8b92g
Message-ID: <CAD++jLnh9UwMd_opPfhWrkOssDUJQkqmADa9Re_hqnGqHdnKrQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
To: ag@ffroot.co.za
Cc: linux@armlinux.org.uk, dvorkin@tibbo.com, wellslutw@gmail.com, 
	arnd@arndb.de, afd@ti.com, aaro.koskinen@iki.fi, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Julian Braha <julianbraha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:49=E2=80=AFPM Andrew Gaylard <ag@ffroot.co.za> w=
rote:

> The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
> help text suggests that the user can build it as a module by setting to
> 'm'.
>
> However, it cannot currently be set to 'm', because SOC_SP7021, the only
> platform that supports it, is a bool option that uses 'select' on it.
> Also, the SP7021 requires this driver to be built in, in order to boot.
>
> Change the tristate to bool and fix the help text.
>
> Tested on linux-next-2026-09-14 on a LTPP3G2 board.
>
> This impossible tristate was detected by kconfirm, a static analysis tool
> for Kconfig, by Julian Braha <julianbraha@gmail.com>.
>
> Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

I applied this patch as a nonurgent fix.

Yours,
Linus Walleij
