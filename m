Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083283515DC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720050; cv=none; b=nbToA63wXv2f8MKBWxf1MlPRDMfucTM4y8F8LrXR1i+MgUARqKCAa/TPAQz2Sle+UuOQwsF8fMaL3dQ93A5U5IzEcAB7MsisurbY0kWh4HUL2f3ff5Gd/8PckWDCPwa5CDL4j6THd+vyRXc2/ieDESYu4p7GPAZP6AnsI2zE26o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720050; c=relaxed/simple;
	bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dB1LtGac2WwrTfQDPJG9JyaYc0aHWE8zLbHutLlPtR8pBew6WcaD4D/RUCUDNzNQEhcDaHJ0E2rlONHxNvoPOhVQ1kAb1Q0Vxb7jn1zo9zXERIz9HC0oYndqo9gHFJUv6OPFzi9UKMe1omiTlJccUBdTkyKLkxGCJzwpZ3TFmrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dlBWdqDB; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dlBWdqDB"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe5so67212366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720047; x=1790324847; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=dlBWdqDB98VlAbFVyNLGHbECcRvQsOsIZQ3OuO2lBnzd3LAakvCtFxbX5dmkM7Dx6F
         lSl1v8Bc/++kOkn3YYItf0PhlICnUE/+69zvJ33u+w1kg4yKaWPPZ1XoHLQry17/Zeeh
         yYjQecRrwHo++gw3JEL7ZOQ+nzeHDuwKvkQDJ2ZgpMumZB45LHUUEJO1/6eGsMmTde3z
         7JLMhnZIB0uvs245H8pcU0Q2108PfY8HPN4tVi7RDQbep4b+0/ZSzRg7txalCC0YtUZN
         RjPiV2LENxGAJCS4G83ttbF1KyEGUDaOkKTJQgYBI2fq/oi9KLt62DAjiGppBOPCIGqV
         oonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720047; x=1790324847;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=A40c04CdgwT2vA/QTGbRF+TtwbmSSLexjc6naw81nlTjI2GiOO6be22a1hyqKuVXiR
         ntZIxsMKDurhIwO4c6No/66ymAggJkCqJY6uEzFkdYLMVDYoSPPUWSykAlbF5+MwCy/+
         iV/PyqBlDpgYyFeAoZz/aqYgEKqf4fRTRFvcwQWXWc2NW+F7NQW4cvkvnEsDTtXlCBiS
         fC5VDiCzsTirgyqxY6hRxwGhAawibyKdWbleHb/9RAhDKNur6n7J6HJm0B6jCLlp+lJC
         lA34WVEnNgVlHVr4VmHzR2MiwMnnMgOj457wwOe5PGI1r3d3zxthzJpLO8g4PmrU3upN
         iVrw==
X-Forwarded-Encrypted: i=1; AKwUvBwLTyte0XI24XHw0fe5CmAjTK0ndz1K2KGDtJYR5YRTyXdXfL+pdNXsQny+S1k4iI66EdR3bcAfvfumoNE=@vger.kernel.org
X-Gm-Message-State: AFuF++lwSG7OkbLGI2tShP+/R5TIBRxN1/6DKGdKGw3Ddpj06dJJY5LP
	BWrvTNrOAUEpUgn3dWJigho0xt9jm7PHqnvoH/m3pxptObxdEqEWinPuCeieKXesruM=
X-Gm-Gg: AYBFou0QpMUjZ931wDw/aszUzbnlwxpj3oau0FiR5iU0pAUd8/UEwFLhkxVJTqHoAWk
	juco/71smjplg39dMV19IvmpfvtughVspLhUnO+KSu4JWrHhr6BoKSWXKEEg8i9an+qm6IO8/Jf
	F4TfnkmQVPIA7rrnynvJ5GorMxAQOZU3rFgZBtpTDfcKOD+tGqvyLTjKWaTldm0199x47LLAm9Q
	s/07iBJPAEsGmEnhfBm9VSJWRgFtJ2EnLHZTVWX9AYB+IQYBeJGrn8tpM9g6gWXX4h+uYGUkxd9
	T0YZibonGxMEEbcoZNKu3+hTykjEK5rylkX6FvK4oULrokSbBNx7CCw67ylZw0eAHEqnJlzUmHD
	GkThOBOV/wxsBSFqPobiSFVZ5JE5559m/Hzhsj6WxK7donzYPyiN0NO82M9xrloAZ+u5Cc1YxLn
	ptziMg5GyPBeBR2gcvvD+/pCpq4IDjF12r2CcLtoLRmQ2KWxddqJvEnZlUABwChvL8s1FFg7qVL
	nM=
X-Received: by 2002:a17:907:d01:b0:c26:1691:b364 with SMTP id a640c23a62f3a-c2a157c2f4cmr178472466b.29.1789720047299;
        Fri, 18 Sep 2026 01:27:27 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb87e5dsm32871766b.36.2026.09.18.01.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:27:26 -0700 (PDT)
Message-ID: <6c762160b22cc801d26de2f2186717e41f7e640a.camel@linaro.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 18 Sep 2026 09:28:49 +0100
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
References: 
	<20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-16 at 19:06 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Do not reorder CPUs because cpu@4 must be the first one/boot.
> - Remove applied patches.
> - Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-st=
rict-continued-v1-0-9aa55051c42b@oss.qualcomm.com
>=20
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>=20
> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order nodes to =
match coding style
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order propertie=
s to match coding style
>=20
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 93 +++++++++---------
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 108 ++++++++++-----------
> =C2=A02 files changed, 102 insertions(+), 99 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
