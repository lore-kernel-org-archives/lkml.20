Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626122;
	b=BjhfKzrAOGWiBpDKN5i/600ibkeGLIB0hJNXoueGcDVpJ5RyhDGKgXgIqVRHaA/0tFLI
	 bhNBz5/kK8Yz40wBn57zmYCAsSjz6RTYCZQu+4KJ0POX4omCx+oKVxrbvWUVvMQNtWbeL
	 IPiqDlpv5vng1ostCEWzkYloSzpepcSVxU9mvTIQMjzB4dLH39rLJ0jye58+yTP8TOJD7
	 909VYIHi9xisvxyIZGoPDASHTd6BaHL7FY36QL9Srk/Er85o8WWKfggYxB9f0hgTdtcD6
	 Niq3nCPW5pFXbCLK69aRgSfYZyNhtThIyUsCPSiHZT6BzUwXrfkl+E6Zm6sFP4usZbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626122;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K40LssP8OiY0dgBWU9vMWrD915dStcY2HaoQYfdzEdQ=;
	b=A4obT8loyw3H6Je1nnn8XazONyBebtibgWT1C+g6tJHmdWSnaZgx34YVrcZCPP64jXQC
	 MIvzWPeIOpMB9o2xo03c51zgtshusDikcZxfln0AW3e3ccsPbaavAr/DuzKmqdo83geuO
	 jYhB9E1DCZeg6yHXhokOV333vdjJeK3jc23hZ5N5vcyyr8gM1Z+t+Nhxdzae9oMFAfkah
	 2Led/RD2nN3U7oi6MAGYTT8LN7KoWaleQEytB+igZJH0s8/ZOYwMnX2AH3/tyglJkvFJ8
	 S7nhv0pggNjj+KYX8ry407C0NAToFOMT9ImVEf4D8nQOR69HEnRoso6R4uFcWeOyEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDP2AO6L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D419606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDP2AO6L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E2B1F000C5
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626121;
	bh=K40LssP8OiY0dgBWU9vMWrD915dStcY2HaoQYfdzEdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eDP2AO6L+kkKUnaU0JyIxD94D4aBvCW5MhhC3PF146cPgJU3lcPMltZ20OmUid+bo
	 7P+HVDKuoFfSA2bAbtjF3SdQI2wMgw3YI91iRlfr832ZAzaxHdq1v6/uMKlMd+XOiq
	 j/7J62vWj8zmnqaI5Oj+NwqcLaTimIGXrv67GiNtmPHXOQqNRoxcQC+OBuCUChj3al
	 tA5ELvvXKHVJfAR8NOWAR2lu8NnSFw+9E9JLf4JUQPPuLNIShSpBdbWpLwa7EKYvGS
	 C3tQQse7HtwZexAufMMWpy7uh1Xy0ql1d3Cigy3s2VXS2oDkqMlLVsDh/Nc4ZthCNx
	 rRIItGpFXL5Ow==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso1032136e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0np2Nm1djBx7IC11iMdKULwYO7Ax0NX/vYpICYIivO5NdZEOmjvbmIv0gPaLjleJZ/8WT4yEWPGMsY+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI/PQJL/T54bpr/JlNOsb1f6SbH3VPE5vCltwUsXZytb6YCRza
	z6U/+joIs/agbefqPkb6vnQGczn9r1+hOuyq13kmpB2AejxwDQ6H5+uOJTcpfh6YPMJVuad97xL
	BqfAcDRfd0vHNJhnyBkWPtz5Fu6L3e3Q=
X-Received: by 2002:a05:6512:158b:b0:5be:50d6:af8a with SMTP id
 2adb3069b0e04-5bfa1ceb37cmr1176705e87.33.1792626120440; Wed, 21 Oct 2026
 16:42:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-7-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:41:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnXm3aJ4OnN8vNym2fVpU0PdQy1SBrPxLcc69hKA+K2wQ@mail.gmail.com>
X-Gm-Features: AclHuK9mN2gA0wqDEHlNp4kMbBvt1v7fcpPP3f_rBZxENespfrI6p61sISoyu5U
Message-ID: <CAD++jLnXm3aJ4OnN8vNym2fVpU0PdQy1SBrPxLcc69hKA+K2wQ@mail.gmail.com>
Subject: Re: [PATCH 07/28] mfd: db8500-prcmu: Make AB8500 cell and IRQ
 resource static
To: Lee Jones <lee@kernel.org>
Cc: Kumar Sanghvi <kumar.sanghvi@stericsson.com>, Sundar Iyer <sundar.iyer@stericsson.com>, 
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:14=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> db8500_prcmu_register_ab8500() declares struct resource ab850x_resource
> and the mfd_cell descriptors on the stack and assigns &ab850x_resource
> to ab850x_cell->resources.  Although mfd_add_device() deep-copies the
> resource table via platform_device_add_resources() before
> db8500_prcmu_register_ab8500() returns, the shallow MFD cell copy
> attached to the child platform device retains a stale pointer to the
> expired stack frame.
>
> Mark ab850x_resource as static and the ab8500_cell and ab8505_cell
> descriptors as static const so the resource pointer remains valid for
> the lifetime of the device.
>
> Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4=
c9d
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
