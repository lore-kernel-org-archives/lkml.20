Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626078;
	b=r/EPzO9jAsJB0shJLIolTxZpY+8KFJh8GoFFlSmojbKOH2XP+pQoaHzc5aD4uELaPAm+
	 0VTCVfeEErQdO9wXMFDRTJWnxsCdhgm5ya8X3z8WlD/LAkc69cuPQnDbC1huuP2uerHt0
	 VU8x6iSVZmKtvVQ9YzaUXTQUfL3WTUaLXcsOKBJHCEl8h1jTpPV4YhLBi2XnmtI1ASrVb
	 GFQXH/YrDacItzI0y3cCIOtKTKG9+DRNJIo/LutAypvk5vXeEZIANgNvkcytbVX2sA4VG
	 BHrQz8XmrN2yts8fTzZlgK7xCIQmrutBtLXvH1z6/WFlRNTsIxE7qhCl3aVAbORxvjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626078;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J4DhFTEeDoKbntxLITsLWIvgLd3FXN6aVEqXjdkWZdA=;
	b=29H1C5Sj/fs/+q0qmVt7QNGy0oxrc1juEwsK7URGJSvVNiZ9kvSKBGD2TU8jvq72q3pr
	 oAD7loSaP6coLQIxSTd6Z0dbq906b86r4vGWjXWYNWQZjnHpTVWJQ/SeAVxE9t2OBd24D
	 ElmpbhON5bWjA35xoIMAMpYaQOK4cnRLBze9GYutb845bFf50QK9ybtPi41VA8F7Y+SrT
	 CNp9EI23iVszkzDCFLmgG/36YvwAN5MHWqme3n048GTHLT3hJJgivEI4FwcAjijr8+doD
	 Lt11dyramvBRcoIHNbaXnja2TxmaMYzy6sbbpJPhuKC05PBGJ8JQ+WwD3i/QgUQLqJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D1llVcx/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB754606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1llVcx/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548B01F000C3
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626077;
	bh=J4DhFTEeDoKbntxLITsLWIvgLd3FXN6aVEqXjdkWZdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D1llVcx/Wcx2gxACxf6PGWvV4TKxazaq4Q3KGU6h4AZUmyGDLgr1XhGcuLAN8UDtF
	 ds97t3PfI79HGI/CpZotBeWlUyaPy5sYWX+4YbDhQ6knZLFpLKG0GTdy1hj0kW7QfC
	 zHaCd4xsoKRkjww2W1UASPu8Vpwr3j9QQphByjXjMOm9LeDq46blt1y4eyvPJTfIxl
	 nPPOCcOWt/D5lR77swScRX+J1VQNYhdZddlBq96h846cZ0fTwnGY7ja+x9/BgVgmEY
	 Zf0ctifTnhFFcvOyVY+1kNPzOE0WQ0QAU90vZ1FfunNlrQyobbIHfYIDgddnh95OkA
	 3cp7cfs1mbd/w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so1168868e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3ROIvE7Ox5rTIlRrZYliqDQKWgbBYLA+9IVMTOgRqImVElTVR3n2FP1CB7rS5oT0vBtlEw4dfsgSfO34=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7sX6h7JirNoL/gdz/8rfDjbpZsJ/c0BEtUpYHF0oyay4U2DJF
	tA6BCvLzzj1eJw2bLByNQwy99ABHRziobxgy36u36fFnNa73u+Yr2pWL56blXDJAB7PSdIgbDYP
	2yvXpbdX2KAAaxwAa3/N0Q4m9oGh9FKU=
X-Received: by 2002:a05:6512:3e0e:b0:5bf:7c40:d086 with SMTP id
 2adb3069b0e04-5bfa1b96422mr1376212e87.8.1792626076140; Wed, 21 Oct 2026
 16:41:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-23-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-23-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:41:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLmLOP+5ef-iLvfzc_7RCD9+qMsRgX4ngD1=tiafBw_3qw@mail.gmail.com>
X-Gm-Features: AclHuK8pfYXRmoE4oCo4fv8YhwqKRNMvuqICl15jr0fU6UsmfMQ7frp0R1kJ7GI
Message-ID: <CAD++jLmLOP+5ef-iLvfzc_7RCD9+qMsRgX4ngD1=tiafBw_3qw@mail.gmail.com>
Subject: Re: [PATCH 23/28] mfd: ab8500-core: Register sysfs attribute groups
 via devm_device_add_group()
To: Lee Jones <lee@kernel.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>, 
	Rabin Vincent <rabin.vincent@stericsson.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Wed, Oct 21, 2026 at 2:16=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> ab8500_probe() registers up to two sysfs attribute groups with
> sysfs_create_group().  On AB8505 and AB9540 (cut 2.0 and later), the
> second sysfs_create_group() call unconditionally overwrites the return
> value of the first, and if the second call fails, ab8500_probe() returns
> an error without removing the first group.  Because the driver context
> is freed and driver data is cleared on probe failure, reading any leaked
> sysfs attribute dereferences a NULL ab8500 pointer in
> get_register_interruptible().
>
> Register the attribute groups via devm_device_add_group() and only
> register the second group when the first succeeds so that devres
> automatically cleans up registered sysfs attributes on probe failure.
>
> Fixes: 93ff722e8853 ("ab8500-fg: Add power cut feature for ab8505 and ab8=
540")
> Closes: https://sashiko.dev/#/bug/linux-a9ac1a9d-5a97-4ad3-b4c5-c7775c24a=
333
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Neat, thanks for fixing!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
