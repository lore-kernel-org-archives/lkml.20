Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776981;
	b=ZE1dv35woZ0gGYngDtrZTEh8CJCP871OYkpY9aaiRHu7q3AtWmW4E0XER+Lp9sDnW18W
	 YAwoDiFWMVijKb6O1+Vz9iT4UAMYxaDJM2n0d2418ROT7Pi5XMFk6hJ5Locdm91XwLC6m
	 5xE/s4iZrwLMZdESbWmDlRnvifu/EAgS2CqVqAqt9Sivu07nKj5xpDeSpCkCwJdGlBoVm
	 aXJpQ5E7VvjodnUY8TIgOiGp95AdnLuyPlloofCcjY3WVIyC4jFS+baPXKioBR1WpRUnn
	 kJ6zf8Pk1A/tZoUiDiyXz11VseyE2HuIfFDntgoVeUQ1i/InqWZOUFRxz4Tla+0tPAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
	b=N7JJ4JKhxAFiCTA4/16TAvLtRH+QXmhQ2JeqnCKLM2/Gs6L04XScsDnvHor3boekJxUI
	 ouRuOKGOR8sE/yD7+6KHmMbW672jWrBhC9NT/z2RFjyIGKw5jjcGF0UmH9+1AopQaKHrH
	 bh7Pc6oH5aeKEaDfTN1wiEPSNPaTkJUBOGN3ZB9SqZY1Umcg6jbAHkccM0laSt/ZnmB8J
	 BrDB4JCVOHFOuVJsKw1VpePnYU4Yh7i4orRqtBxg8W38BylJltxC7YM2uJC9uN8QTN6WK
	 UPLYGn1dDBLM909NuKRpLbf84QXlFpGXst9r8puhMvmOSpNpNXqWPcca9xH2Oq3bKTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rPwbjHBH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A24606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rPwbjHBH
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso173655566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776979; cv=none;
        d=google.com; s=arc-20260327;
        b=TwP3WRoY6CjgvYuS6Ux77lngcrIgJBYilazO/DB4U9khJ3JZSQY2EwhcZeM2+V/yB7
         zJ3j9N6fjrHKzZ8WesjUjjHV3uwZ1+zQB17t6rP7qgzDQBUQkSxQ7pfTI5Zh1teN4cPQ
         ljqfkM4sfBKEyU2iXbvAzjjGh1QflGTaXMTWlYVofheGiCGD1anlLRk9UZGryF0NVOQ+
         896khUC4yWlzHyIHtci5JAw4l8dx+kALg51WlbFZ/MbXsMhO19CkSSQSWvu+1CqvPZv/
         BaoDD+QM+yFeqS0kkRXAVlwG92U9CDQ9KbYc0GhSwVnJ3gaOw63wiHnOHGcNvtvILqEz
         2DMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        fh=8SuVQslsLWy8cuXXzvYX5SCh4Pjqwj46DQCxLytTuK8=;
        b=aNWWptnCHc4IfVy14fNSybTVehiNmS3QI4OSmRqzCN5fnPzaT3hr5vI3tg+kFSJmuM
         DeV56vx4qIdpShl6rznoX0kFqGqCFLBAp4M8TRIqi+gs+I+0Sr7vnf3Jqu9DxWfO1iJI
         op4ynD252XLcHAjRv3Gmwnr2zrpkg/beStnCS+UcRhx0ZVEmdkj8F5G7QxbqmVldJ4+H
         n4m6178tJVXTj8Mbs+adqbK4jtSB2mT+elatFNLMS+ugZ5rn5Ul9UN4o6UTEbavz6MlU
         Z87OB1th7LINkSECakA2XjNVj1dJNmq9kutRoqB6ZBYojSY8A3ZR1J1bVZBPh+eLGFb6
         gL4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792776979; x=1793381779; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=rPwbjHBH0HP2C0bMtsJOmjM0xJz8dkGbOzrImfDEBhvfVvxo4oi6BTMnynTl86WfVe
         tHFnQYjVPDO4cImnkMGI8H78rv2mxoUYrxiM7dl4wpJ6WB5b65ANTRBK3GKGQB4nX4MI
         6R0taHSx2qctLB2pSGrqvuEql5Mt/6hqC1e7kM5F5FQQaa6YHw2Y9MrPv//VzZwYAMb+
         VBTblEd+sl9M6yiKhbMZ8A7074jPOb1xuPMdEjJjNXWjBCAXU0mgobhdd4+R9EsGvJDt
         UnGGeuuIXWdUvG9FQeUILhQmVp9Za3k50Tlg5KNCzw4tJUCKz4HNf/Fh0S4At6GhClIe
         ztBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776979; x=1793381779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=EZtRmvxXxondUlCcG2wJQgLnW2gft4JWCnQvMqp7VGnsDqt17CB74cjkA/nwpWWdZD
         IcAaugqeDIcLCeKhW/S/amaxJKfjFBjYnINvzjdK+Zwc552bGHTH9C+mF1J+Be5OCS+r
         upGoJKM3YepLa7LeuYBYQlNtjmQhRUoJFRamjbh6cPNWJWgXQoiRgvmQAopyY0kY03H7
         +tEhoeBqlulHjbJo8B9kveuXPEFCeT9HsSMrs4qUBaBgMJo620UY4BZFEAOuPNAGS1Qf
         A7s8sFQByETVzNHzvBHbmhfWjUZZGgXZejcmkrysJjk2BvSv3wAQs91w1y0bM4uBtkD1
         DBZA==
X-Forwarded-Encrypted: i=1; AKwUvBxQYnm/kePGBZfcafovYaiDy1BbzssNHNLE+3qr7UKSpU+GsUmwrJYSJ2CTALkBKiDu6DnCnzeArqaWgaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlxQ0le8k6deTABsLyffZAQJw39UGLesPtf5jgUFdKeqdDadsa
	Yi2zeFvDk3tv7+Rw1uaXAb66oJa3iMPf0FWdCVEtlfRp+O0o+F9isBBA2FQTBvOClgtSQKcdNbW
	cTO49+2N2mLRcCb0E/xo5jrCsqDDy2ULDql8aRi8YzQ==
X-Gm-Gg: AYBFou2/lBIs/tzkO/A1Tat5R+dp3BnWHYTQVKJgIzoJhsZewyA+YUbaeYewNwojad1
	xJAKlcsEfWGh5rb8vDwXmhZJGUI9TGcKC5TLwKA9atbgFM92jIcxzudn/pzon4+W3CTghxehaRM
	k1MAaN3gWdoytD5NUJ+2UOZBJe3zj29n/m5W/vsp44FE6QPJc27Lpf4ePmm++eF4IGIb7nU2sXy
	EjOVzBeCSra+voGt+Bw9mTVRcN3+nFLQVkrVZJSmfjOeX2bYFKG2TSmvElCTos9pSUlm05vxgja
	z4Tmq6QNW+VEu98olj8MJ0j/6hAXVn2qkoxh5Y31Y3wxvKCD9ZoDIqbPMUU1cnV13fm/SDZafOy
	DBfSgLkdVMNOvHfY7veaClFZcFQ6PArbTfwOAqh3kciGLdRD9Wi3rUqxzjxP/keQNJlvt0/M=
X-Received: by 2002:a17:906:f595:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c46a8fd5c3amr423797666b.14.1792776978822; Fri, 23 Oct 2026
 10:36:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
In-Reply-To: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 23 Oct 2026 11:36:06 -0600
X-Gm-Features: AclHuK9m_F_bGO076TSrsT-kULx7SuWcQOcLAgoXUR-ZcTiSb4Ix0VHIuC5OZJE
Message-ID: <CANLsYkwTaeuoKWvCuK-4ctLa9n+7xCJe_yo_E9mDZL8ddY83DQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Francesco Valla <francesco@valla.it>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 13:05, <Frank.Li@oss.nxp.com> wrote:
>
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
>
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {       ret  = <0x90000000>;
>         no-map;
> }
>
> m4 {
>         ...
>         memory-region = <&rsc_table>;
> }
>
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
>
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
>
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
>
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
>
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
>
> ---
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
>

You have ignored my comment from [PATCH v7 0/3] so I'm ignoring your patchset.

> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
>
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
>
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
>
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
