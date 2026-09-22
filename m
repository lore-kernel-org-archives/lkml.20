Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682D4F7CC2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061095; cv=none; b=Ivg44Vp1tkPwGc0vqkY3j/LfFDqjMeHgvEUTC+UV6Lf16+TeuS97vh/+jzFBnzM1pI0DKDu3SGtbUOJ6f7vfA9+5lr96pLieN40Q9YCRj7UbVvPL/nEMb/D2fHvgTjuYny/8QITPUoeuUvV3/QwzU96guBVfloC7JOFqKXY+mLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061095; c=relaxed/simple;
	bh=1DQEnJFVllHwbW40pTjtz3mCOVWOR/ZxQR6GILf0wtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anwqEiiBWC5R+461oh6uhSj2rDOVddKMt3ytypvUy6xuimDBknKIo8tLa6HKIhYRE+Jo05CrJNON/e9S7oUISnjiArQ7QOy3pm2mZ/kbOyvsW828d5J3K39nsyUJ8EzWzGVftyHPgpJyuH4634KYGvk41owLfJVIRvbZSxpsiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTsr5Lb5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTsr5Lb5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FC81F00899
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061092;
	bh=1DQEnJFVllHwbW40pTjtz3mCOVWOR/ZxQR6GILf0wtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OTsr5Lb5UHx/VDj8Clip1MTlSxBYM87CBUMbskz7I7Oiw7CDR1llqetobjCTmA15c
	 3+Sq7hijVT+wX9xDkfISYHvTXD9BHzYQ4/yrGGg/0H3oU1PJ5h5qw3naLK7dmrXObm
	 sFYpyhm97n6JE7iNGr9Lbu77EoCVs21anHVLRMfvA3mJ413vV+ih8/y8aEy1pbsJ9w
	 KTcp7ISZnV8RmwxbAKZPlx42z3g2Wjmtt2FT3InlqxFceDkdZ2alxWRW/ZVUQzcnL2
	 7C5JRr8VPsadZrq7cQmkrCXgvn5Rabm/EDEolTrEKykL3lZ5YU5TkPDst25KpptWlg
	 2/ISdcKTGqmZQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so1393361e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPOaO0DjJrDatC3BP2L9hyxZbYvisb2qZuzc/CrA88NMQeg4D88n46NXF7D20QfDlctSoe35SSi8HljFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lCJdkbNU8dRBHtQ02QTIqtJTmf3JGjX4lwPh8rXz0OJomB0u5e
	p12mXvN/9h0OEJNiY04by/ehQPGeIgIYDmMzOqrIwfn8umEtYDhL0T9teDlvbUbhZo8dBtSq0mi
	kNhptWFqMoz3M/NHObHX/CD5SwBCb7Xg=
X-Received: by 2002:a05:6512:669a:20b0:5b7:5cbb:661a with SMTP id
 2adb3069b0e04-5b8d28a2bd4mr380020e87.0.1790061091499; Tue, 22 Sep 2026
 00:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:11:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUVOAtq-h_qDdWpEhZFZehFKo4qqgcTHD9zDQTdF4yhg@mail.gmail.com>
X-Gm-Features: AclHuK8Ptv8BXFdyCOuHHolcneppaQqVWDApnFcw2pV5vhsl1672OQ5Dk_LeJfk
Message-ID: <CAD++jLnUVOAtq-h_qDdWpEhZFZehFKo4qqgcTHD9zDQTdF4yhg@mail.gmail.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Long,

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the CV75 pin controller binding using generic function and
> groups properties for pinmux configuration.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Is this something I should just apply to the pinctrl tree?

Same question about the driver.

I'm not sure you'll get all of the Ambarella in for v7.4 anyway
so what about putting some pieces in place to begin with?

Yours,
Linus Walleij
