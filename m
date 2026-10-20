Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491529;
	b=yxWRWYduxujUSvif6vk8oul6W2B4Z0xcT5gsUHr9jD5ZidecFpCEus3TePik4MISZOJV
	 ++HFQN9rRBzYAx3dXxB/LJwF6llJq4z1kGSQmVxrNDz/sz54JG8HiyqGKvJzPXALZ9dOs
	 KUv62fI8KyZndWVWk8CHuct1PTEL/aToAHYj71EuS/zngzJSiA99aRgFPiOJIp+sU1yml
	 WXWhutcgy08gx2wd7yf3KeccwGcs63ZwZB34yU6PULqfIBsbJOG2Vs4/eKHEdqAMTUZaE
	 D6Fk0iRR3ovePx2yw7fW7OIV4/f00JHPC/tDWdRgU+0dkgz/qSSW6O2YfaFcZQe/noQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
	b=dM9Wbl1RyNPukbiOobVK+GAhGybvZXXEzx7TXhU4I1tPYjz3M79QWlkCseH9GCcGFYzZ
	 9G1PJQa3YRMPdWwXCH1QKla0LH0ZUVdxPTmstboHFnEYnVzccJDzzuKsEu4h1F32LO4bh
	 /Vm+1sHckkZitF22UATrHXH52GJZv2hY0txaxYuTYXhz2CVSHUPiPWrz2Ajjd9WERJqPw
	 emabps2OPIAuBWtecXDsd0o9jy0LyHkGBfDALo5xeMk4XRBioun3R8co2aQSI7a0is7cG
	 sf+uIfSrxz/sjQJ9+hnhZRwxzP3/kjzBqckETpXDvH2QOpBAPoz5SnCU6vsFc3tgK7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I55feIN4;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED08606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED08606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I55feIN4
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso35538825e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792491527; x=1793096327; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=I55feIN4tyXGD9Ilk8kOCGKJvDvDZYrSBgvyREUAv+WEFGc9pL0orf7sqE3yL9MNfO
         R2VrpP5SEEvXpTFA9eYMpHEPDHdTlFswXPTsVj45R2gEamEu7POVA/leoyoyB/c5XukI
         2FfuL1w8av4tzC07CKSCGbNI+bExwzy+2zRaeGoonanLy/erO6S/KJnMnrZCWi6O08en
         5tHqGgy/FbguN6/0K5uWtCnmv816AnEER7UCpXMw780MT2isfUN+u2qNQZ3/T2ySqpst
         hp5dBxskeYDNMGJggdOS3fe1GzDte/bRvu1cbJeWi5iyAi30b+S4cO64QX1PQFVwobpB
         q+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491527; x=1793096327;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=E/NrwNBtwc/6p6vmXTY0sOwRXmOQZY4IUvXght3ELb8L949UbrNdGKTf+9uLHupiKU
         w0eHBW5tApmV9AJOY6cyH6XWeOR80AdQS/b/Ez4uUHTLLNIgycNH+X8fNRCk14/NpdCi
         SyqFZxA+iJ+EmuvDlgG3vgMHCnq648SwmKxdjMjqwBXtfW2YK2AGpwbLqpM/WuotzO47
         NdNH7t7BmWo5onQOwyy5jKARsRdatFO/fiUJix+zodcJ7mJ9O2xaMvwXrO0u37QL5DrH
         NeGLV/SSc6yPhB+R3ZDw8TLGkm5NCJsVdVBzXM1g4WypKNWg3AAFX+S8Ka9BgMw6cBag
         +IVg==
X-Forwarded-Encrypted: i=1; AKwUvBxkHjAfYYLtyMuwo17WGLowfyIHZHJNEYnDpA0tXJY/jvkSdJGPOcHHT7UnO9LkemR4IMk4GLcGzl72mKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlZqQvBtr9b8xuG8tlN3zOwVVu0rqmtDzzm9bJZDSjXIguj6E+
	jYrXYAA7r88Bsq6QGKUPiYw1cV/Rd+h1kXaZp0AyJodZ4ca9NZZ/BHJgW0De9KE7bmM=
X-Gm-Gg: AYBFou2k9sS+hTN5j0P5IOT8BA90Y+dFXcXPK/YohUkP+WATzYnbw10IXQj0Cjrgr+k
	NK/6E/30+m6D+pxHC4mDB4MkJF+qM1uEhRRR+FtgpZC86r3xZfoiOrDuaNjrnU82FRoFdAfyBt9
	H6rUOcmGlfAbxtpyo8XbyOHp15xC7PTEihxo+bEo0dx2MCTOSHaBCv+BlIqNMIzWRBO+CfRrY7n
	5xRtUy9B//BF8wYl5V4WbPkMzQD0uCUUpH/dBkvNLU6bFEebTEiqEfl00Aj+lXVl8kxZIGRDDMR
	PvPQOudwSPTk3WWrO8qDXFcHYj43wHNfyVeSNhf9zb/nOnc57kHdLWPzyt64VA8t/Qb0bozaeXV
	DvEkwRzhssJbAWVGNf3VVSbUKzuFYjoJD7qG3cv7guqhZJ/WVw+6EFuv0A5BWuhJDOlmbkF+z8h
	Ve0gOP09uO1AlUL7Q4F8Y4USzN0FbFuTdZq7gDsxqVYC47mJTiYcgfIBWHWISubeFrNSiJhYzyB
	XQmq/SUZdU7unT2VQXRunCHr0pl0QPbXdHqrZPlGq2VT46ja88g92r0SX6P4CYc
X-Received: by 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr141959155e9.18.1792491526824;
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm63088925e9.8.2026.10.20.03.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:18:45 +0200
Message-Id: <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
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
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
In-Reply-To: <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>

Hi Krzyszrof,

On Mon Oct 19, 2026 at 8:46 AM CEST, Krzysztof Kozlowski wrote:
> On 16/10/2026 17:07, Ettore Chimenti wrote:
>> Hi Krzyszrof,
>>=20
>> On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
>>> On 16/10/2026 16:41, Ettore Chimenti wrote:
>>>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>>>> Using same definition as OMAP2/3 except pullup/down enable macros, whi=
ch
>>>> are inverted in this SoC.
>>>>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-binding=
s/pinctrl/dm816x.h
>>>> new file mode 100644
>>>> index 000000000000..15aa15bca9bd
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>>>> @@ -0,0 +1,20 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * This header provides constants specific to DM816X pinctrl bindings=
.
>>>> + */
>>>> +
>>>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +
>>>> +#include <dt-bindings/pinctrl/omap.h>
>>>
>>> I do not see this being used here, IWYU.
>>>
>>>> +
>>>> +#undef PULL_UP
>>>> +#undef PULL_ENA
>>>
>>> Why are you undefining other macros? That's not a easy to follow code.
>>=20
>> Do you prefer to duplicate `omap.h` defines? Only the defines above do n=
ot
>> apply to DM816x.
>
> Not sure what you need to duplicate, but if you add header with bindings
> for this device, then you should not include headers for other devices.

I basically used dm814x.h as a template which does that, is that not
correct?

>
>>=20
>>>
>>>
>>>> +
>>>> +/* DM81xx mux bit defines */
>>>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>>>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>>>> +#define PULL_DN			(0 << 4)
>>>> +#define PULL_UP			(1 << 4)
>>>
>>> I do not see this used by drivers, so why do we need one more header?
>>> What part of SW are you binding here?
>>>
>>=20
>> I added those (DN/UP) because they are not defined in `omap.h`. It may b=
e
>> convenient for future board upstreaming. I can drop those if undesired.
>
> Just add the header to proper place - DTS. These are just not looking as
> bindings.

Sorry, does dm814x.h not look as bindings? I'm a bit confused.
FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
Following=20

Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20

For a better solution, you would prefer:
- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
- Replace defines in dm8168-evm.dts
- Add the header in dm8168-evm.dts

or:

- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
- Replace defines in dm8168-evm.dts

Thanks for your review,=20
Ettore

>
> Best regards,
> Krzysztof


