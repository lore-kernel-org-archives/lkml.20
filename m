Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C684A1396
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157113; cv=none; b=WVTu8F/NlcRrRJG8zbixOcH9BTDD1LnWUDctfRcv3pDxs5FlEAFAPbqhn0dgMeosld7OFZOEphM62NB0b1u6Fd/pJ0a+RIJy/XlvZE7Up/iqcpOMULRm5yKVsC5mBtlmAkql+UERsJbNk/zT1KEB5bUUVH1BPUghD/PKfb/1xnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157113; c=relaxed/simple;
	bh=Tlea2Q0EBAFRXRjsYugk9moCyLboTuSNrsPj5Wr+sks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8VGgnLnrCwc9Wgp086a/9stjJquEhkCZKUG+7kCqT/wEHwvkrN9uxtSvNu8JvOsDExbkxO+sGv5izBGPkIkyr4AGrs7I/iHDzOW3ugxYtFhwYDKgvQqcqBPHXgPB0uChUXTTVF8Ba+gKGwZgf7ilaDKslQqn7LylbMJwGve4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcSTbCFg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcSTbCFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E441F000CE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792157112;
	bh=Tlea2Q0EBAFRXRjsYugk9moCyLboTuSNrsPj5Wr+sks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YcSTbCFgpmB3xrRWnOgIIhOE+92oRwATWlKOqVXB/zN+qk49KA2jUXS7TXZkWo/RS
	 //I0YBf5qvuwRkEshrHv+LgL81kcJc2XFk5REexXzN98MsHuJ4phvic2DvKWBjl8cl
	 Hhs3eO//fdgJ3MBGBR73dqHptfpHrYPTLS7aI3PvfRsn0rS9GT1wIysHX761M27HVm
	 oq9h56a//xG4tvzvGJepNWoU+A0tleguX7Jl+Q6LOlEHUvU5hZP3AEyNUMyI+NPJlD
	 227XrfNMi+YXxQ75y8hNwiG7Ju/Y4kuZtFh8Huq+rlPFWUhqkq+zMjAfNIcj+K4R7K
	 ImtZV32oq5/ZQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3aae7df0971so12887021fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwruJaLYNgCaiyx8c30C4nGXQ5dUAKkVGWem1GgCIFukLZYK11jXA1rDKFkyBLzO2UdA8uCRkHqHfUSF8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX+xD2VfejZQYGX92PEuUaCrkZvpGPVtRDFGDjmDFDi5PbQAY2
	ceuJEK/BtD9S25bHzq8kbfuX4g92Xnh18vJHI0fB1R5mamU8bgMlISibRtS8j11WqnLdOKmyCez
	fyZQkGhmO1aa/540gxDuvScngNKNkVR8=
X-Received: by 2002:a05:651c:b27:b0:3a9:9b67:25f7 with SMTP id
 38308e7fff4ca-3a9c53b0b19mr55217301fa.4.1792157111400; Fri, 16 Oct 2026
 06:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com> <20261015-cv75-gpio-v10-1-3fe3eb315a55@ambarella.com>
In-Reply-To: <20261015-cv75-gpio-v10-1-3fe3eb315a55@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:24:59 +0200
X-Gmail-Original-Message-ID: <CAD++jL=aNubwbmLSj0EMg01BcUcd5MyWpYwmWi283US6oPJ9+A@mail.gmail.com>
X-Gm-Features: AclHuK-MGWqO6jqIhu5ZLp0uRJgIH1bUuwjVAvxYHrfT6dMzuZatQfpnFO72h3Y
Message-ID: <CAD++jL=aNubwbmLSj0EMg01BcUcd5MyWpYwmWi283US6oPJ9+A@mail.gmail.com>
Subject: Re: [PATCH v10 1/8] dt-bindings: gpio: pl061: add Ambarella CV75 variant
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:54=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> The CV75 GPIO is a modified PL061. The basic registers have the same
> names and roles (DAT/DIR/IS/IBE/IEV/IE/MIS/IC). Each bank is 32-bit
> and 32 lines and adds MASK and ENABLE, so it is not
> register-compatible with the ARM PL061 and arm,pl061 must not be
> used as a fallback.
>
> The AMBA core matches the PL061 driver by PrimeCell ID, not by the DT
> compatible string. These blocks do not implement the standard PL061 ID
> (0x00041061) in the ID registers, so arm,primecell-periphid is required
> and is fixed to 0x000e8061; the driver uses that ID to select the
> Ambarella layout. gpio-ranges is required because each bank is a slice
> of the SoC pinctrl pin space.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
