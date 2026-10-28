Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180306;
	b=2sD4io6cR9j2KozvFbws5kVnxp4owAGNLNUk2NYWMBDt2Nra3n3duQMy6e6+k8QHfihq
	 0pfYhxtU928xewpZQh1v/eQIyzDqmpQ2mj2SAo0E+1RfPzGCTZN021i9gLwh4vaMMHr4e
	 NpEa+ItRwOf8UwJ0oPjTVPJaBhoPpOaiks+rBdDUIdtSUdmwO4JCFl6UCtVXEsgNRU9wm
	 /TRyE95Ez0EA9nkpOjRAt1ArXRsrP0LLcgdqWQ3vwi4RN/GqI8LAGLBWTBsWjkrIlYkmy
	 Gg+/Nb6I+5zQdbsH15E/IIGoa1Jnk6NWEt5yEgZ9BlDcOBrf+vQoH1dS3qb6/I3tJ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180306;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=;
	b=rlSjeCOZ3O7JARyOu3vWbgw21DvwBXyCd9HhmiC0GYP8KCKpXOx5gGpcKG3E9gIGSwMJ
	 4Vm6Ta3/fCvA/hu8HI/SSBJl5XtvQ4J9HEwkaURuLHNbD8e+VXOMW3OB4dbYxLFDKOVMk
	 5LeBTu1ZY9u0RAMPsnch5DR3Xzf9hVqI3Qx05EIJnslnt520wOWTO4ckyOCt1Cdjrjk9u
	 3J99E2IRD4IuzxOINXWtf4LYPZMd0MehsrpBSH4wmQyprtR8hwH9GcmChPHXStwYcJq6K
	 /ll0u5uOu/i/GNn2Yft00uYCkXWVhIgnn7yPLvJWnIFBL60jzQ09KhVOOSrL8+TuFeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTz4ccFy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD8606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTz4ccFy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9041F031EB
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180305;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fTz4ccFygFqrLoGtnIUHOqwYAG6fYE83eAzaKKKFTGrFdbqiyeG/xOdDlpbWljBj5
	 5V6xdBINwYU5kocYciXsQsl86nG4vrMADyaBoGICOH5SM52l6lMFMVsUuePcwpd0nk
	 dqsLjl1bgVEXkSKvvBlyt/4fvoEGoZPymlRX6HulIa2tbiCQvsXUeYPp4K3IUVrqRU
	 pYkgAmPxiymSttYf90sD3iHqe3+rcjhblkBwBr3nhPmk5/7ostKSP2aFHP8Aoo6ME5
	 BA5mvwUjZk8wNBLra4DsKT3qmgjZC2uJF2DNqeQ9/eHo66ETgnyVIkVrdJ4CTpoy8c
	 oOvJG1pWVoFTA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab46699a09so5071091fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIznh+a9Y4scJb0LuLT6i0/zLj9sEdFkxefwoF2NGXqHVCRgPPwkt4WOptoS5n8ivrka+5ZkMfg9HhCtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfDj8f8pIxnNxbklwR1qAh+dS4tD2TnnMgOKPZxbbNkvwOUO+C
	gFC1JapUjeAl9XUS8XwAM23tIAaJjtCRrzFpET82syVbfA0frReek/WcsPoJlCHnhOfVjkXsocx
	cHDe/lmbqpHyDpXnV5RuLMyCBHlV0vKp+m0IknLOZ+g==
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3ac9cf82d06mr3952511fa.20.1793180304502; Wed, 28 Oct 2026
 02:38:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
Date: Wed, 28 Oct 2026 05:38:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
X-Gm-Features: AclHuK-0IY-K4Sj4xF2g0AMS5-uqQjH_1YFYYyMfdx08al6vG1--BGlVHEhA67A
Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 06:03:12 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> data. This is useful for non-DT/non-ACPI platforms that want to
> associate device properties (like DVS GPIOs) with the regulator devices
> using software nodes.
>
> Add software node pointers to the PMIC platform data and have the MFD
> core assign them to the buckv cells.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
