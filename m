Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797793;
	b=EMjvHJNvjxsadsHjmV86vrFZOaXFiU/H89X8MeJkke9NGP592EEV+mpu3/Hm0mF5z0Wt
	 ZMZKEsWBGD9yNbzLCD9lnJDW43zpkB+/dzJNtQZSt7i4YYknnbYfDMcrERWa+C97C5Okf
	 YqVG+zt1hOBKyMJeZ9lPa7ULRjxhJObzztDLo5QaSVdSPCFKVYC/ylPJo/1VG7z6Wxk6u
	 9l3UvIYb3k22IKwDczwSY/ADQeGxA2qDhFA/niQpAA+MY4GVd5/gXFbpYt8/gXgftkU3I
	 UiPzsFzxjlNO3qhQ/bcJtoB3ooyp5fbVZOwK/VNT7mFC57+KZ3pva2uMKSVnec6Gshg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797793;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xwyyLP9uPhqquv/1QCNLs+JtuCDwjysCkbHKh7eBSSM=;
	b=XBoOOqDZICTlkPEom4aYEoKNm7LfYCbvCswU/ktzeXAeRot9YnxIE9vQNIKa/k6xEC7+
	 pmEOrIIMbErcOSog35BvCwGdc+4W5t+/hgXn3MpE4o6sxdPL7Lb4IB7ltX66eRWkHS4Ij
	 xmTAvKrXN8xCkFm2veyGxqumr/NhDThKJm+dZRC1dm6rLbwQjH1i1vc53d44dZ2mwyHg3
	 0IbcCf2CCsRDzH3kJ55iPGLcDBeWJrWk4RHrN0uIfYRTs/LloYy99y4+GV4qS8sZ29c0Q
	 sN60wJwierJglBLAxY6ehP2RSOsHVGjpwvI0sudLF/N/IEFfAGkidbYoO0L7khH8Nng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHyDjjDi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BB606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHyDjjDi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E451F00A18
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797793;
	bh=xwyyLP9uPhqquv/1QCNLs+JtuCDwjysCkbHKh7eBSSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PHyDjjDi9zwDhdWdu/GH76iLs0Y1SrbvSiJ5STD2qoT+AofMfCf83eTxF3lAro1Xx
	 dH4914C0OzzfXQ2FTsN9iWIAkY5vPdyaf9jHM+58QMyeMGjDTuuGyk6lPrBPlzwf6H
	 pjYM3X00xYCeHSowPr6jgB0x/ZnCkBCUqPmOr0n0UZysjG6FL80A9qAvHs53n6JqZ4
	 kGDWaWRbsQKTr21MNvKMxaYLUVxtSfcDY4tncGb+A48ZaBDARo5VmrnQg/dBt1qeaJ
	 j5cl7IiMA/ID61mg1/WGtacMPXaPLCRqhaY6IZqRgGGkITFVbodbdlbL7TPro+/r45
	 0KOKCyJlnMMPQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso551981e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:09:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxp0QOnHsjo/kOtw1wK7f52OvhD0pMu3dXsUUDdP6YRULiu6Z8Ugs1zsIHvuhMOaNY4M44k9itzj6dM2ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z97ZoxvRTDzF1Ip0npvsalMJ0tNa+BMjzNpupwqt+/HHknLiByl
	vaIRzSI90cVLvRaCyWoxVO8uCBpFF8ciuzyxMenqnV1Ygl0MRGE2tULMYLSq0uAI5MpUnBcnxEL
	Vh7A79FstWOZuVGqH43aYIaZU8jeayLo=
X-Received: by 2002:a05:6512:2398:b0:5bf:ddef:7852 with SMTP id
 2adb3069b0e04-5bfddef9a55mr5642927e87.17.1793797791886; Wed, 04 Nov 2026
 05:09:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com> <20261021190212.2237804-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20261021190212.2237804-4-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:09:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRzTuh8pj5bHt6p9hQm3eoQ_fsV4zNNDoF6p12yO4Otw@mail.gmail.com>
X-Gm-Features: AclHuK_rs_aoVemsqZvmGaFtptlvPXeCNaMoSwjDWt11FcgwN-9NGfoyeGoPKLo
Message-ID: <CAD++jLkRzTuh8pj5bHt6p9hQm3eoQ_fsV4zNNDoF6p12yO4Otw@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Switch to using __free(gpiod_put_array) scope-based cleanup facility
> in gpiod_get_array(), simplifying error unwinding and eliminating manual
> gpiod_put_array() calls.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
