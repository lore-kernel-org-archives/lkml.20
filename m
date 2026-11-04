Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800175;
	b=tIsV7BcsJVMNEzokXcQgbiT2C8xsdQfmViSaReXOtOKvVD75ZRyVwQzKWA8utwuWmiac
	 sUzI5Iow3R2Tt3CLqx6Ms9j29lIp03+nHLbxzevTaI7V13eIEpG/ubGyvIrNQh1MaEoci
	 Tir7UeSlbZvwe+sX0G9KERjobA0A1c7r01TXMaSVi/4qTGrFN87oUoUR8numXFIJUOVQj
	 qiAwpiTmouvYkOGkEI9DbjJV1E+5ewxHDYYDGJ6U/kdZryIqFvlEvaiC7iz1YXUfSj4ok
	 K7gOxhSklRvQnl6IQGenMRxMwt5l6wvTPFLufAP3euIdXqkFATqxMwd2kh5kUeX6fCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800175;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xh/GEp2c7zYgIWG8y5Hydozqk2C8+o7JeISPlaQEupY=;
	b=2Mr8mKngzPAMcSfEyD3Dj77R7Ze+ecgKD+Yq9CFNb898OXwo5hBKM3x09uz+1l3B7xMg
	 LaHOW0A91kUYaxsBTVMtZBlWEIRa2ZvpUgI+3h8lS00LnzaT5mQK1lUmFHbtPM7VjI+HN
	 voEyDuDaORRZMDVcpyTEz7bMGp5kv7xQg7HmI2zp6qx8VitFHoy9YUMiM8O68dd6TZ/cd
	 +nQ3O7MbVnDOhCEVuBLAIIhf/SZvoq3+rh0IHQion1BMcQrk2Ib0CPiOzNVxy83F4L1GU
	 vU5xF2ka18zD0Eur5dBBc2g0StIs9O/Nzj25eN76Xqm9qetDG4F46lh5D8JMqQ8dDYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ax2k85fQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30298606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ax2k85fQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4EF1F00A18
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800174;
	bh=xh/GEp2c7zYgIWG8y5Hydozqk2C8+o7JeISPlaQEupY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ax2k85fQ/GPwwFEnF0c2ksgEYkv2siBK4xaOdobJMhC1SQoOgtEquppNpz9om+WPJ
	 2HighJ8Ah8IddaDfAvxhiJWT039TtBrMWFg/kKOa6Quzg7FmNht3VSVTFuuj9wuMYW
	 UPIe8W7UFsH8Vuh5Ma5Ve0PKuL6e/7Kk4TS0/aQWTq9Rq/ACHPTxsXycz0iGWOEChb
	 6fT076Gqv6EKNe77wUihUEJtSh7DdSVUVRWPpuSa2cu2elLVCc1dx7j+5NbdciBph6
	 DHgwasp8tavBk9cvLmW2zcdOYrKGVimvDUQIcSZKfLcY+3fm9LNK/12waef5sIFa8Z
	 9RexZ4fguU0BQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso541826e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:49:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxuHgjwNwVpC1UWH48tJq9fqmYSJmNNHcPqtxH5UARVXtIXW5dPJ+tDPxPwhO17y6y6KK0OQwUN5g0atvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kt4x09g98orf/8VQ3JLa9LmtT0WLCt8dAut8hOyBLF/COK6Y0
	lyUF4pjF9EztQN3Ru57FBhgRDiBszsM406o8waM/yuvvdGtBmryMiPIRxKgXwgRp/91nGcUF2+Y
	hhLrD4biHBobNxKMPokZVQfTsXRaKEGg=
X-Received: by 2002:a05:6512:3e0e:b0:5bf:9fc1:3938 with SMTP id
 2adb3069b0e04-5bfd957bcc7mr5494867e87.38.1793800173643; Wed, 04 Nov 2026
 05:49:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com> <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:49:21 +0100
X-Gmail-Original-Message-ID: <CAD++jL=yuKLqcpABypsd1icKUYesX=uiaJvUW28xUZoF2k5yjQ@mail.gmail.com>
X-Gm-Features: AclHuK9neIpLEL2dp-ulhGPwQf0eKyJA8-7rsKU-aX6vjOndnPekJ1Twq9QUMqM
Message-ID: <CAD++jL=yuKLqcpABypsd1icKUYesX=uiaJvUW28xUZoF2k5yjQ@mail.gmail.com>
Subject: Re: [PATCH v12 07/11] gpio: pl061: keep the parent device in a local
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:19=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> IRQ logging uses gc->parent. Keep that device in a local so the
> gpio-regmap switch can change where it comes from without rewriting
> every log line.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
