Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760623;
	b=3WXrgkxAJPSc8NeNTgHklW/CuDBckfatbUL9YpdYJDJKykAsL2mg7vWy2eRiqtoDJYO9
	 /xItlY3/ddbxWGTDQPyts7fOeHmsjDtS1oMbUShb1ZCsbFQbfK7T9kH+ZlQc/0/m3jOJs
	 WgPl+eq9Ys4ISrizv9M+CKBPMXGNk7Gi/1HKbk1fVi91pHR/U+uM+ROmaa54mVupImvxN
	 gHBEaeacTYetvjCtvV44Ax+oofaDWrui4xHBimXMYRYAmhQE4wsAFw9VHz5sTQRVRokn+
	 YuUY9Suw6A+iXKIsINXoJhURa6SkW2FI9TeA9FPmesMvukwMwl9ERPBdFpcF0JqFG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760623;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1Qd8+/zcaU6lUIWBoHhrtf6NHTiDvscHf2rquHPumkQ=;
	b=A8n+K/INampppBjU2k3f6+fpKitX20Z/k7lJDxVqgmZnzFpqZHQpgh8d5WJsZvwKN/ap
	 lgxwyYl4teu0PWI3304ZNXuiLyVY2l+6/WwAm2C76F/xNnm/PhzbzT1kOPQz9Tf4bPFuA
	 IZ/w8JTfiVKtY5WrRD169WKfcMJWPqKr5M75h+Nxn9UucqIXMTqCcnmSv8+gZnVhm2w/B
	 Ggt1eF2VQz6QvN9VAszqRWuNOO/5LwX1z8pWofQdWhI6wI593gcKJDBgWR9wXQXtGpIcc
	 FnA79napYIUTiLKdRQtmcjjPum4GzOdl+wUj2UnHRq303iYTs7QlQ7142tnWEvvSblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JSZkJ2uz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9241606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JSZkJ2uz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F05B1F01828
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760622;
	bh=1Qd8+/zcaU6lUIWBoHhrtf6NHTiDvscHf2rquHPumkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JSZkJ2uzIuTfEaBGTLvPIL/dl1pbZDbWZAezlVdRtlZY2vKnlxtf0ZejrbBO+2jyu
	 c2R+nfzfUf3E5MWKxHV2JhD4Zs9/KepBo58GPoB6K9cLpynB5YLu2qKzxHJKmP9w9t
	 c5PJa1ptlZ3GiEYhQ54EZU/0zIs9msBP/bD96QjPequ6ZNdF6sw79Mu/PJ7IP+zas/
	 MmvcApFa9LDhANT8A8yOV6VNrRC5VP1fF2G0rXDIGUhVGtUz1A1C2EYw4bJHqEnA1b
	 IscvcWfUwzNNlOFtdHTMfpJdr9Wvkr1E2748lT5p20xqp29wtCBAYe95mM7ubENtsI
	 uRulAKwh7xibw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so541738e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:03:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRHgyLChq1c3IaAAHENRtn6hL6R3lqtLDTZXpVHjm2rkDHBv8C+emlpt1Eul+9Mv7kEGdXeix/8Bj7HcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL84trergqNi4kcAuhLeaJfk/oC74GUSYZibDVUVw/6JOKNpL/S
	eNZW7dUrqHE8BmGYv3jJ6Um0vxRgoTOJqL1X/IZN0lgs0v8ai+SLzmrH0Zl4389rt1TL5nvgiTo
	o/rqYjIwwnwl5PEIl8RpV5xwhCKAY6IQ=
X-Received: by 2002:a05:6512:3da4:b0:5bf:b5cf:6729 with SMTP id
 2adb3069b0e04-5bfb5cf6cffmr41829e87.0.1792760621193; Fri, 23 Oct 2026
 06:03:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com> <20261017052534.115203-6-changhuang.liang@starfivetech.com>
In-Reply-To: <20261017052534.115203-6-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 23 Oct 2026 15:03:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
X-Gm-Features: AclHuK8P-whVEy-AVwIMg7ybsCadTVl7aUKiOhmVqu3jLuo_uv6iO1uHmuCl03c
Message-ID: <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] dt-bindings: pinctrl: Add starfive,jhb100-emmc-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 7:26=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0,=
 per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "emmc" pinctrl domain.

I noticed in the pull request to Torvalds that this is a first, usually
the SoCs have one pin controller, or two (like Qualcomms TLMM
and LPASS).

But this one has 13...

Your silicon people are obviously thinking differently from everyone
else with this distributed pin controller model. If you know something
about the thinking going on here I'd be curious.

Yours,
Linus Walleij
