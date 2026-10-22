Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682972;
	b=XaKh4TZ+fmfnBkebKhid7qvn5z+V1h3gHFdNA2fFogxAsnUe9fbvGoj4TpePcJbV8DZa
	 SYqF7dRB9MVaQWO3lZdllO/IZxHYE3oFSsGF/FiF3BSKp3x5Uv8XvNlladwRwnwDuFHuX
	 hMy7O5UwVrdBQqiFnML7elCuFy6sIHRMeluxhmc+UJ9oWCBQ/0xvYiV3jADnyoGMZ+SqS
	 01jVKJB+B/IC5GJj0iBcrwzqXu8mjr5S7cWiRWo4bZhs0NQjp3Hyrkhg+hyY5BFx6u1Wa
	 Q+gPdKmkCserBHhfLkn8P0pcdpgPjmXNpa5hbW7vWAZ3JzxMfBzFiHDUAhcjjbByw4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
	b=ylO7jfxOFBaUFu0fBaEpXVSjy+U+BcSR3X1+m2j2ul5aGdsSwxrLW1zAVCzVXECjDHam
	 +vWbLk8njDO9K1DF/McnTPQOFBQXLm3NWF1cn76hv1Dyvwi0uxQoLP1yBb96Mn9W9XvGe
	 RmJ1ncCTg2Tq2oRk3+A8UYw3/AvAi7TpSaKQkUGuT/Jt5vF5oeaJHLC+NJ1v1OddWpmhy
	 mMEINI75yLUxKOJSxlaioanYQ/SKneMHmPolHp0E6/cgmeDMGjaL4FWQqAaglAOeuaFYN
	 r5nKlqNDUS8wAbczCMxuyXHC0IcftM0ybKbJVWOs4H0Xqc18RScZBgxwKc61DBt9MPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QpJis2sL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FA1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FA1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QpJis2sL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so6003375e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792682970; x=1793287770; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=QpJis2sLxK5hhv2ZYmKxn0Z9+ZS5AS6kmVGUr9nC5CC1eoXNJouRCPyReQA0DRNM5o
         POTICEpdU36CEbd9PNahL2LQbmDQsD9jCOHEQwYyJvq5532A22K/WFaUkqVeBCUk7tSH
         sl9tVjNA9B8F/8UhHYYFXE1d8i/yP5uGWRZuihO4B1JGZ4pPnflpvFB0yFkhFw87IPzm
         qmqvnMZsEd8UCKYGVEN7K6RVEHA8wUkGILf/Gv6S6zaXsAsAd0kIUNdEtFM+XKqvD7jf
         qJ9KY73vEkgLeP1V9SjhnQuwoZNvv1rySfnr/PnBPNrm4rWMEyxwgflEW3u/Z1zWjhJO
         RzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682970; x=1793287770;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=rW59lP2TJFP0wHk2jyxLap+F3XuhPFRH8SW7KWkQk0tvoRbTk9EdzcAkg9toHVft8l
         9Ss1gWfKdSJwjdnyr43P+TWTiOa2EIT2jGjRZ1/WabmZ4eeSslo7IJfeUo26Mt2V3LAU
         j07Ldt+Uw/Js8Pl87qLmQnFdHw/kzAVUsNc95lf9alp2iGp3mh4vJ4PtdQLxjXAdlEp1
         9h/0bmQSYVKw4DRY2zqAPRTNhSn56TQ8JX/04NiWONmtuizO2i/BLCJWa+oixcymb/fg
         JuRZiWoYWHGhaPVqbUOgS3URkvr6wb6SV+A2Ddfd3XB0KI8+pQ6SwPJTzO7RaoLjWEf0
         wiog==
X-Forwarded-Encrypted: i=1; AKwUvBzX/vMZOQE9Xtc3RtpSMLCFv8YqxFDJZ0DG4Ya3Uk9j0Kv6twR7tpvM59fOfQx1+GIzFmyQNJ9TTG4lC6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0FeMDXqlgirJId3ROCHLFTMr7wNCbNE7yD3kv/uYXaK8MTEcK
	gAKSy1+VizMcOG6K6w5rhCEUAGRilqx/VMPihhpB3wzN1mh+6I7RfU/5A8xd52pqmSU=
X-Gm-Gg: AYBFou2pCzOfqYZ65sIdqbi1jGLjtGgG8+MiGsxjlaL+7dFipmohWkKU11kN1lSkAOD
	F2mJ/cRRRq+RAGrIpcwhbh9JPChvdAPE1f5/Iy/d0vO683v8SKm78ao01SOn3WSUMixfrcQvIKc
	xdMLBve4dkBOV3f8sd7uZMSizct+8FpdlHrAUNJahPaRIiWRfGRc0d/30EJt03C/PV4gRlAO8FI
	OKwuR+kyc1KgyX7YI8kpF4ldHJ4BmkGOiPxSNtdoJaLfeAHbfeFVC/D6uFNLjYPVt23m2fHxeci
	MFOj99f10LgBGDHvsPnEJWTGsKhJzIPgTc1aLE0xQ76AhhvjMn9ZH0a+Z6eR8h+9sjDSLmjO+9A
	ew6gPUjL+TJgDYzP0QcRhiDOZcs5eMVi63m7lPfXhQqy3CGHlfw/TcVjDNtmbNbVJMEHw5Y/GFC
	Ed+bTju7Cg9XpbfTpS0kqReMdpUkiO1wvjVJ70cJIgxVL41e3mq81B6VzGHR7wAsNyOgxzysxJM
	bTRpgNMtW8uIeJBw74EJk5gWpvOvykp6DnuuW7mZ1oWtNq/i3gc6ywLiCXl4Twb8GTkEfQuN5ZV
	EjPuUpJSgX+ZNzgoLpHniHCUUJ4Wm37C1bmTgrw/D+vG9Q==
X-Received: by 2002:a05:600c:1d0e:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1fdd44ff6mr114656205e9.24.1792682970343;
        Thu, 22 Oct 2026 08:29:30 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:41d2:e95a:b320:711e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm3270335e9.7.2026.10.22.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:29:28 -0700 (PDT)
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
Date: Thu, 22 Oct 2026 16:29:27 +0100
Message-Id: <DMBH2Q4ZU6KI.18MV6V6TMVBNN@linaro.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot
 node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261015040601.30049-1-semen.protsenko@linaro.org>
In-Reply-To: <20261015040601.30049-1-semen.protsenko@linaro.org>

On Thu Oct 15, 2026 at 5:06 AM BST, Sam Protsenko wrote:
> The 'regmap' property was deprecated in "syscon-reboot" compatible and
> not needed. Remove it to keep the device tree clean.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..30ae952083cc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -236,7 +236,6 @@ poweroff: syscon-poweroff {
> =20
>  			reboot: syscon-reboot {
>  				compatible =3D "syscon-reboot";
> -				regmap =3D <&pmu_system_controller>;

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

BR,
Alexey
