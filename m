Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDBE3B9D9A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561656; cv=none; b=QKQuRzC7seegBr8XO/2rWHEAKD5kgEaLSti/rQDlVf9tuc8mgaN1cEobbpikaEwUF5E0agKAM7LCy7hmjsknqt2F9mt77vDw4JCOonNfpeMdX8vpcJef5ZlpP1FGa3pqx2bIzMoXATqiwkKQ4+8WpHe8OF1jHtpPvPxxijLcsRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561656; c=relaxed/simple;
	bh=T9NTVrwlm0T6q5xmXlu/Zj9XfefDzx/FrPXJ+Bp5H3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNPh5op6C0sxgrLka1xOjqXik+MWSFYeQfZx0teDCuVU9TLN6pVeVCrGxKpFN15XRsGOSzbqXkP0tSJaMG8cEULLxdKiMD2+QrWrd1Q5mv4nvU+tVtUZeowyPgeqtgq9nPllDLlZlG+fGLhzU4899a0WNY3g6jknPqXWEmbhGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJ61hFWd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJ61hFWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C2E1F0155E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561655;
	bh=T9NTVrwlm0T6q5xmXlu/Zj9XfefDzx/FrPXJ+Bp5H3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jJ61hFWdmGdAZt3iISMIPITZqY4gxZC3mfJ6sEZet37Mo9rzg9diBibR0s2PjNTCW
	 0MnxYR2cjA3wpMkcSUSNRIfBtWqT22oCAJczafxHUfqpDsfK3EFw6zV9kEIGlXqG0l
	 G4F5F25SFoaKA4tiwurpisUO6Un2GRUjjE12QhB6IYLkYPnr8Smgli9czcH3gwYtzv
	 +5ZgUob8KFI8Qq68HIhw8Atmh5VtcAjc/eRJQoIXoiRxoUcDV0GA/JW1oe1+Ye0I+0
	 fc5muqsh+s+QV0bcaPffCtNpMmLstM9wcBL1ImobvUU8oJoO+fz5Nj9GWTgAqna2Yo
	 g38RLP4vOC8bw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso1325223e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAf9JpRzl/2BsvNywCzZ6eGQ51OX2cjb0CztqnkPfyowRuixAs02hf1+2nSs2Mf6UiJT0kSFOBR+fkSHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mMoelZtLPsZxvdnHWY44FAtQSXTKkwF9SvvGJJZFNt8/KEVxZg
	tUzNmjZjjRsvzVa2hXzPUVvs3ydOVp7+nlo9h9u9edLBXio62la7JpPOS1MBRyDUGdwnwKyJp8j
	bD3A+Ja5da69j+T1wHuC58kTUt/JN2C4=
X-Received: by 2002:a05:6512:3f16:b0:5b6:1a7c:59e6 with SMTP id
 2adb3069b0e04-5b61a7c5b4amr952304e87.64.1788561654360; Fri, 04 Sep 2026
 15:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-4-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-4-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:40:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLmVKRobxDb1_U8xCKaH6d5CzLDAn0qe8W=voSUoTtduTA@mail.gmail.com>
X-Gm-Features: AcwNN1Um3dJHBV2YivCN_BFI8Mitw2Ry9tj9isgsluqoUCSueU7CVUJmlqo5JrE
Message-ID: <CAD++jLmVKRobxDb1_U8xCKaH6d5CzLDAn0qe8W=voSUoTtduTA@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the CV75 pin controller binding using generic function and
> groups properties for pinmux configuration.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

I think this looks great!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
