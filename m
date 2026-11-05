Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867647;
	b=saVOuuQkX8M6oFSkfi2lFARVV+JvIZppQA4BV5hZbq9dhGe830kyUD6k9LYwh/VBhxkr
	 UkfGgxYzUxWiR6VVQgDH5toIW2rPOvxC5kxow8mhi6cEmPyJX8zknb9TV72NgZiNUWarH
	 FDdTlEtvRutAynBZgz22T1l21PIljgc2I199O3x65VOcN7ZeXCzouBfc9PEJiRLj77n5K
	 mSiRoUsKjDEh3+3ahWXGHnxNIJ2Hkt+l7AiTCiyrMi9QhP+SAb4pHNXKEXTsZ8tOAeI8y
	 Ingt/0BQKWH+P1Z7/Qt/ye9M0BvKIs+b0OOFLEZUpJQjRD0SvOV9jRRxXY5/KLOXASg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867647;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WxzGpf08LrKpKuRsmQ6LKWumhJfgKnAt6y8cqHphZJc=;
	b=RAAiJoXBOF6UY3lEQabABZK0mkOP9mFWrr3UtJSwjJ4F+cqd6J/rLrWZj2RbS4efw693
	 sIFJfrTqPmUn4HE6WVCjAWZc5cdJTeVyA4nXhTgxMwtats42/1xs6vl/W6hMU5ACPWwvz
	 iA3glo+YRgSQRkZUJc8icWI1wUNoTSOkqRY4DaAFssKdlHgoe/okAzcVFueIkaD7Okq3c
	 9l0yYOGIXh8d6HMeMVP6ssbdxA2t5m0uKhZft5s8VGQHmy1IowLIYTTRDtVrHsdJK6rZM
	 cu5Rv5cyOppedXFy0d6cDR8QdIzD4BJBNoLxBqvLKCwZG/xE9F83cfr65GRgzNHI85Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfdkFSMO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C28606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfdkFSMO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A2C1F00A17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867646;
	bh=WxzGpf08LrKpKuRsmQ6LKWumhJfgKnAt6y8cqHphZJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NfdkFSMOQQWLe65YCQWxRnqqqdGtVtJSIFDIdL8GU3ifFX2o+bzacWfF6GYxlSXKp
	 k6mKicu7tCbL0txb4S7yIaJbaEbXhNFiwCR4vLNWIAD4p4fudXl1GblFBBMrHK8GTZ
	 NAwN5Pal4Nu4hH1WfQ4kt+ly1ZJHd8DRTuqhcYqQfRT8LsNLBO18V1LldWCZmH2eIj
	 1h8pXk/xhGSVRmEh1axeuQ4ymE97ROq9s5/n4nrLOTEsKIOJdaJQW3tykNFq37/YHt
	 lV91nBGRED12BKsfgAXWbSRAihYrQ63Jo7LGC/COMWWrs07Dk0he3ZuF1lgEC1qdY2
	 HyWvEpnXUhs6g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2012820e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzGQDKPMxmAdkMXgEH1sN2b/8Ofy+soiRKz3pqf7EH3pu2/JHjYTABv7vRuqZb2+JCgKLV8p+P+SPf/0Sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fiEyKs8tou1eStr9kywLELzV+Ns+DO5stjOXuM9NHSmitfTI7
	8wUaH8iiq0hlYpo6gdmy39cm+BbXcQ/KY7gnqHqhVa0IwfJOx5SJJiLXcv7d3Td+qOHASp0mR6Y
	tlnPmis/O485UK5qsCVUGxPRPl9IeMHI=
X-Received: by 2002:a05:6512:12cf:b0:5b8:f81b:dfea with SMTP id
 2adb3069b0e04-5bfd95892f8mr5387682e87.62.1793867644786; Thu, 05 Nov 2026
 00:34:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101100030.15744-1-surajsonawane0215@gmail.com>
In-Reply-To: <20261101100030.15744-1-surajsonawane0215@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:33:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>
X-Gm-Features: AclHuK9s22LU3ZgfcLC37072WMp1FnHaL0iX5l5vecmBSPJ2_rBODkzGQKAE7xo
Message-ID: <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 11:04=E2=80=AFAM Suraj Sonawane
<surajsonawane0215@gmail.com> wrote:

> LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
> unnamed, so a device tree cannot select it. SC8280XP already names the
> same slot ext_mclk1_c.
>
> Name the slot on SC7280 and assign it to gpio5. The third slot stays
> empty; on SC8280XP it is qua_mi2s_data.
>
> This file also provides the SM8350 LPASS LPI driver, which uses the
> same pin table, so the function becomes available on SM8350 as well.
>
> Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
> drives the codec master clock, and ES8388 playback and headset capture
> work. Not tested on SM8350.
>
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>

I'll wait for a v2 which comes with a DT binding patch.

Yours,
Linus Walleij
