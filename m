Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798245;
	b=xz0fgqkaqQBYvUDbDuzHqaGXBHx/tL1ugbVJ2YBrvkOf0/TOdS/Sux9YoftkKxnq3rmR
	 1tb9CUJYV1RHxa3/z1rzVw5Wej65pOSznY67ZOMnlE7FISSBM82B/mkeX+UUPtzNR1J4y
	 m4j3jEq8nJOmiac52oXXGMkJOF1/phcGTQr4yynDASprjayjk1mPM0iMYqVXTj6dcDkLz
	 BQYs9DLjWLP2fsu3A6u5Bjc/L6bZGDi7sYVjmw8vFmFR9gYeo35pdu0kNcaciqjcsc6vk
	 3X41vAUmyDeJUbIcWFrXbxwqxE2DQwdvU47DizLKuMFtV9kjbRl6bB0ysv3MkbiYT/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798245;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4pXFqn79QUbBsMjuDsGw7ClhjengxKNrsxIDFCP+w3Y=;
	b=W5vmDr1hpus9BCBD2uW93vZidcK3Bo+uT0fPJzLy0WST7sQvNCIR5rwoHPFuZz2K8CVN
	 RDynxl32Dj4OFeUZZGnRDzNItthVGCJwTQbI4m5PxFJLnP4Kqd40glBgU5B1MFrMtaRky
	 XCe3VmraN5kv4VBTx1wLoUHZupGkIJW+fYGTmy3gGGUv1pC0ozk3jxfQhww1sCCozfOOp
	 iO172xy6JO4Empcs6G+coAL2P8J8R5BfFmISvHO3MsNMqvLhgL9BfHnWTJ1wLGzszOFZr
	 nb/tr3bKDXt4klqbShYlgBLTbrBhTB5T8ETW+l3qXE6yNRoMmbeVUl+rxdDAdtNSLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgbphGeY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357A8606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgbphGeY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F371F00A15
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798245;
	bh=4pXFqn79QUbBsMjuDsGw7ClhjengxKNrsxIDFCP+w3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YgbphGeYhReO2HeW7nCyK8WwPBjD4NTfYgWQDBmktWK9VPmTiErEUAC85pa1xS3if
	 u7EMu1iSviuYhLTZP36TmIYRdS/g95KbgbfB0DV16579w/SP2Q1VREnwE8AMqOP13G
	 yCggGJ84nDc3RgWTKNqPlpv+9G7R4TlhxqztBbDWKJdjrex2REASAc+StKkcReYpi/
	 mh6Jph5QDZwemPFeZ5+aE0gFIyvqOsAyJ18lvqK5ISBMk/rasHSc8/ntbzM9R2UzVP
	 qEZyZnk5TIw+bq5RN50DwXGH0Hq459ZprR/J/ORFc8i8qEO7Ev7mVfCUIX2+94MDk6
	 hkvi0sK/PIphw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso424824e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:17:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByQzJb2WSt4tHU1EGGUPBttegpsm+mxEPke1EMkC3W0JEwEgG39IY5sbE7AXbljpUPqK6pDvX9JVcVhNno=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hRSKIJ3svNiiSNw3LGuUnuWDnKhemQi0yiQgH0sqcv9wn486y
	EDLVQVRJeGwPPU4z5/ZsujkMkNn2GPS1j9lVzP5mycJ3vaCPeEMVUuUzT6Yba8Tu4mdiSbzR8mU
	Lmax8xbCQ2Tzl5Kw7LyiLrRqHnICJbr8=
X-Received: by 2002:a05:6512:1087:b0:5be:4792:82ac with SMTP id
 2adb3069b0e04-5bfd956f142mr5584317e87.41.1793798243872; Wed, 04 Nov 2026
 05:17:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com> <20261021204654.1001101-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20261021204654.1001101-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:17:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLmuHRUbsZmm1m1GPCLT31MEtPpY96ADp0AFj6iCTcRk5g@mail.gmail.com>
X-Gm-Features: AclHuK8fqsm8ywooGbp3ToIhi0uO4SfX4QfwOgcQ0Of_DcYkQ4uTdXuJwY6t8u4
Message-ID: <CAD++jLmuHRUbsZmm1m1GPCLT31MEtPpY96ADp0AFj6iCTcRk5g@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: mockup: Replace custom devm_gpiochip_dispose_irq_mappings()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bamvor Jian Zhang <bamv2005@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Replace custom implementation of devm_gpiochip_dispose_irq_mappings().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
