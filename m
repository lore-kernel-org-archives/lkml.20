Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218288;
	b=41P1f/VJSE3WiSwcDv8+eAAs+vPMzuHmFfXRl9V+xoPk9kAvfkBTEaSityCDBh79xGyM
	 i10sQc1voTvIngu+Fvwx4/pwrvII2KjqyymEk8m5OOhn94/V2TtHXxcYlRIeAhjnKNq5G
	 MVWXgnQDlpExADoqEI0BadmgfvIKyaONfSxgyq8gnqRIFjZ/haLVylnAGswaLHd2IPvAP
	 hFbG3kkb57lS7h+c03Ik5MrK00kwpZIrSAwRux8xDDJ4iwEqTfUEXPoWRI145t46f3BBb
	 Yxeg2gw7NHwYtntXu3n18hmGcSiE44aGU33tUmFLfSbyIc1zamSCsYLvsiQH0goThMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218288;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zRxoDvJqNHWKSGKGDlWFVgI4JaCLH8YmN1Nmzj2nWUE=;
	b=QavQ7nDJ4NgUlHZtFN0DlGOAxpoUypxtqjEZ8JbWKf40Vgg49e3u2SZW9fb4FuMWZX6c
	 /MnKPOQSRueK1dc/mlABNv9nMwFh1NybJN1LM9Wnr/o+mfNxWDzlF1JqMuJj9MMRPOigZ
	 U7q8f6q/JaZCxVoGlmMziAUnMedu46BKvUA4TOqBhlfjBGxpAhiDtiaJk4O2FoB9soA37
	 qgYV4JW6vP6svt7T7IhDCx7DDNCOqfL2fzcP02Pc2cxer3e5oySPx1uulKmDoMMrP2LH/
	 +tTOzBLfEMcO52nz6QTz9MYIq50HfYjJC0Wr+UF4W7Mclo0ktfCCvdR+VCSModcq3Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiU7Bxto;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8194F606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiU7Bxto
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4491F00904
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218287;
	bh=zRxoDvJqNHWKSGKGDlWFVgI4JaCLH8YmN1Nmzj2nWUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GiU7Bxtoaybvkr2gAUT3yojx7KVrIQj5sQtwNARIabBI/Xz1yNaf9KfzSNkjlh9UH
	 FLVF6kd6xzvAa9r+rdhTrAhRwKETpbM2boIYE/kM4Ftwc6As5sVXrG8DNuLKfvKSbR
	 O6iQtYcMB7B8lLupSrYY0sMVM0rPD3QRJni/DMt4/9wpLv2olp5ZR4HSRgiDb5owU5
	 /qBaAbYj/x9bDyvOYEg5V/636GMO5okouD3Uw2ckMRp1JT0Pe8hbdsfv/7iCWSeEBH
	 gjCawLRRjst4hmR66QFBP9pNVOXSUAJOF3cPYJ98lkOcPhattlx+4gbZ5GbQQD2L9D
	 LwRuHpj0RxkXw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso396571e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8K9uvnAjSC7Q1xe1vKkBP5fcAo45UGJIl8vPow5UUUT0NkQplOY2MYRluMUyetf5dlOPUQ6DVK1wOcCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dUIyDwM/cjmf5aH4cBmQe+dI3mMotgbhfNzVWJnXT8SWRIySa
	yp8Q5Xv23u/4gaI46FUlhaMeI3E1M1dAy+akimFjB9h/6MVPAFyaddQz9cqSXNnOCJEWg5a9CSB
	+rwriP3iamLwFfB9mp5zRK4gfdyh3Ax8=
X-Received: by 2002:a05:6512:438e:b0:5c1:4cad:c31a with SMTP id
 2adb3069b0e04-5c14cadc385mr777117e87.63.1794218285785; Mon, 09 Nov 2026
 01:58:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com> <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 10:57:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
X-Gm-Features: AclHuK8oK7P6B9InDKuo8Ak_aj4mmjEASZmzu1jiS_QJYKoqcrqXJkxA1OxDiQ0
Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Zhang Wei <zw@zh-kernel.org>, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:06=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:

> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver_probe().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
