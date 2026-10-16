Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA44D2EE4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163259; cv=none; b=PLol7OkAOecpg8E4kFeSMbgRFIM8yfc9C2DKuKIHqzVJHhJJDIjBMBFpkwT2PnzbHrjxLKlnVFdCVtLLb6HtY57lmgzqFbu0+r4Zets+xu8YfViQlC6xuFmYMPn11mZ6qH6NXdhmCnVSYXuiO8kiEYmON7Og2GwkP+oGvdnUYVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163259; c=relaxed/simple;
	bh=7RGIO54fyE/iVl2rO+u+MlOK+PQfzNFmJNUDEqLEwwo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=b3MQLdirGxcuURCAeXJaN1bRE5xsol+27UeDAtM3KcUyrCLJxEvHBVSa3j3ondiNHzHrRZhOUg4UIJNrkEk2Dyjfiwc4HsuzXFgFVUyxLu4kisRB0NUwHIjCcdLpeu0MZdgTHteEwLwidYJ2lX4wn4ptR/ekWnFYedatUCKpCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yndv2wP7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yndv2wP7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso508415e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792163256; x=1792768056; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQBXFtSQf7WJJHzyT6nR2Bw3zqoZgRsxsOc7UBU3Xv4=;
        b=yndv2wP7MWTiybgyyrOBReyhGNHx49iRnEb+3zNzGIHs07eYYbaYRhdrvWOiPRT/TM
         KcEhzRNuTy7NkEy9IVcdEslLC8FL1BBIYctMxB9YXrwVTGP8+ZIZeQd38MNqXa7NXf7C
         gEkzNQLiFMKOJg44Isl+q/hRNPWXHG2uRi+eybMAXJYPIQX8NksosrXBy8rTK5QOavuh
         ylT3LlP1PEXJuuz0fhN11p6igTB8mGEVVIDezhrHXNVU4ClSfrdBx1FsitX9/Bw/kW5r
         EGss6n/KewYKM+IFJWMSKgLWmb/K4lIU/G5cFbLl9pBZondtkkRyjuO93Q3pkRROoh3u
         l+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163256; x=1792768056;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQBXFtSQf7WJJHzyT6nR2Bw3zqoZgRsxsOc7UBU3Xv4=;
        b=pxmAgk8U2SL4+IrpCHO9YxmxoIwKpFqAL7BDG4ITQBDebOQgi/xyqLS1r+oYaKhjZ3
         pTQN2AR1u8r9b0nTWZKISP3n+bBsPuEUNEcE6zGW/91VDTPp2lNMm+azL61uo8hGC86R
         5bZ+Df5tsLCJiAx8txQrk7UH+zPHAzH2Ae3Ai1FKUKK0L6Y/n9UgpR4pWYhn/TPL1gKT
         QZ4OyVyv54mD/efOG7rF6mfJ00E0jUImLLOV9LzGviC3ka/8Pw1QLC9uKhQsmPcZsW8Q
         acdEyUNhKYTwhkIe6BC1a8X77sErWlwDjdC5/c+ARAOgiKJjCWfKtnflMWapu3p884hy
         iOYw==
X-Forwarded-Encrypted: i=1; AKwUvBxWU7ASVx49x7Tre7TQzTq9BBC4pkgR2JpXtXMI8Uv+lPlq4rQBW5wsNF8wSL1VZpX9nZ2v8VNhZ1CMnyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3X8URC6eHPlqwuHUxXrJkHO/gGYn//pCQwNWY1JAxP1C7VSmf
	AjTbWJbihRVOaMeOv8VB6qjnd9B7FpxorgunESBZ9vrYmxf8YWDUUj6U5zg6pH3AH94=
X-Gm-Gg: AYBFou297yAzArDUJuV8NSmOZtqNa8FETeVrzwzt/U1ZeE5PLTHf/S0/3jvCMiYzMcM
	2h4axOrJayfowIcBwNBO55d5sh0kP0MZNXU+xrtlAFznin/yTqHBCgdtcAtPVBRz1zdgGeBNw8i
	Kk70hREukecWYFr4G7lEC9I1XXZVyWNE8bWZ9+Onnthrd5IiFdgrp4dlNNRSfZ+ixPDz3YKMcVc
	Q2ECizK5wHQzxQZ9IQqjyB9Vqzouyy0nPQz6iQ1yAlMypgxH+ty6BX7eAeFT14VRBfVtwBJMZBE
	3etI6IDYGnLJAAcrvNW0AAZTf41vdv2vCk00XsZJCop3T+nEalLFIpb6YFYWwxbYKC6+xCgEeY1
	syp0F7ZFt3fz+Rda4j5RWPbvSThJ+nYtMbZMk67PiN4j0LZFrBuBwWzTls57JFireTvCj21KuyI
	YajUF7bDNNln5rdyAN0AFS83En2TIqoC1j5v60QBkqemnwISxGKcP0nlovgsG+Hd43ku45J1boX
	Duh5oBsGBcMSQ0F0AcfvgXPFRCfELi0mG5H8Vp2z0sVqO2DrqDdMJq0lWqQysB0
X-Received: by 2002:a05:600d:644f:20b0:4a1:d307:d56f with SMTP id 5b1f17b1804b1-4a1d75fa37fmr1458705e9.15.1792163255733;
        Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510ba3sm5544284f8f.56.2026.10.16.08.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 17:07:34 +0200
Message-Id: <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Christopher
 Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
In-Reply-To: <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>

Hi Krzyszrof,

On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
> On 16/10/2026 16:41, Ettore Chimenti wrote:
>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>> Using same definition as OMAP2/3 except pullup/down enable macros, which
>> are inverted in this SoC.
>>=20
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>=20
>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindings/=
pinctrl/dm816x.h
>> new file mode 100644
>> index 000000000000..15aa15bca9bd
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * This header provides constants specific to DM816X pinctrl bindings.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>> +
>> +#include <dt-bindings/pinctrl/omap.h>
>
> I do not see this being used here, IWYU.
>
>> +
>> +#undef PULL_UP
>> +#undef PULL_ENA
>
> Why are you undefining other macros? That's not a easy to follow code.

Do you prefer to duplicate `omap.h` defines? Only the defines above do not
apply to DM816x.

>
>
>> +
>> +/* DM81xx mux bit defines */
>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>> +#define PULL_DN			(0 << 4)
>> +#define PULL_UP			(1 << 4)
>
> I do not see this used by drivers, so why do we need one more header?
> What part of SW are you binding here?
>

I added those (DN/UP) because they are not defined in `omap.h`. It may be
convenient for future board upstreaming. I can drop those if undesired.

>
> Best regards,
> Krzysztof

Best regards,
Ettore

