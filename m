Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915083;
	b=xXjaip+a9l5mGWwvdumknq9BqFbhV02f09HA8GxLEUMUchrwIOfJv7Qyv3dJk3kNppz/
	 RM+H1GbaSCosJNWm8H6uskJSddbmp9JrHPq73KxbZhAwJGYYZJyI+1PPtTrjKvy+NQXp4
	 FRSntuR2SOfQ+gjRGxI8pvKmXJcAm17lriBS1vbsOtUvRckKnjTFqHSOjCUQ+vExFhfkM
	 ET2YRggU+rvipfTomB2zU/8RP1gQhvn0NJu0Wjtw4krIk6dq5oT3D+OrJgga+mIzq8KsX
	 YDccHQUPXMucYlriyWxeg3CU6SLqzBSshQ9JiwekTzyNwX3wPhab37pr8YVKppeAPUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To;
	bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
	b=ZnzvjXoTb5a8sTSiHgynxV6WCiaK3NUVjK9XsyWAD8R5Yinnba3z+32Q9r4KRXbBr61m
	 aErz9+wiylMreqBZ96LAfxhRfxhThFUEHZQUFfPtKW21uwQyOzEEdLWW/qbQVpsmxaPSV
	 nodNuwovOV/llV/QmJotpKbA7AFIFqTEo4OKn18DV14dHPfV24tYRTVnyHkeHaLVdKBod
	 kzEdnbt2nE765p7NkEsRJzodMATbq7WK2AnfHNb3ou07sTSOQS8gGHcr8Ltz2s6h9JoXk
	 E5FXD+5JTOHaiF/o2lPQDDCPjtcJsZrm9R1RCewzQb6Ejyku7jvRXwGl1M86khtMItw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335EF606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c45551fa84eso845816666b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794915081; x=1795519881; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=m8IY2WoyLPfitWWglS6wqI0ATW3+TpbTj9ibHg8nvn1/DrViKj9QNxHqEYqIRERZ6F
         Na+e3jdV/rVSS7ALdanwyCzuGzZMhejKsuMydwP3XJOnpEbcc+xXa3/9+apBe6B1fg5h
         2iQKAF0w4njd1P7NsCgck4NNFKfkXExe6AZDyOVw1TUYD2WyHFbAPW3+D4/kMjokiOT7
         dxU3ryPxLIHk4mx7uofmiAXMiGS+qWMD29OWpTpQ5WOWCCX8Op/qJbTPkfTkC1kkgTmX
         RfVSoXsgINXsUIVSdH0RXqA6RxIHK/tWBUitp0NFP+nnnn1+OPuPqeuomXE8YN2MV1/R
         GFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915081; x=1795519881;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=zIZKKQMF5E/qZXBN7XzWWzQwzwcxuJ84SweQLZrIAX8XnyCx9Ka44NlARwdDFrApvV
         C3oaaCMU5a1xoRmDFJ9PIBbeXkgSgRW7m06FktVcQIDDxOWGVPFgBZA7f/edmJo6gB07
         Ctn1A+HoyqQoU8HZWV/fQe2uK4RUeTlqLd3wMo8YPlYaeK7Ssyu6dpMj5M2DPUWm7HPz
         08tgfxWc0Z+BY1ySgfFqQHlESi1WMPIYFnp9V6RMtftb5ryCn6et9wOr1X4MUtgKUQXW
         opOqR3mS437L7FiPCm6RJ+qxscs0vZe3sMCddvxJSqTelnLoFokk2TkkpDYUVD030kpa
         k9lA==
X-Gm-Message-State: APuU4Z8ESVhjxB2dX/5OB4v8iv7NtWdclePhXCDRTIGQctZl8PekDLCt
	Tph7lr/JAglythx6ossnMPRx0S6CNgQq13Gga41MPPYaBG9UZ2Fq4BS9iuWef+B/owY=
X-Gm-Gg: AYBFou0+5QM+g1+RPw06Oumv/QSj3l8A+EwOL09zuQ4i5LVYBkfMKO86CKn24+KXyTF
	sdaheCOPWirpC2ECnf3YKFbfviEMnUZxbyDqMVGv0Bzg5SZdk7MOr7/pv0lYuTxsjhFZzFjvhwo
	3jsUiQYNQc6GrJ6mVHRwZjV0QovjEWdINR1XhL+aUNH/D1eYANMZ47uU8aLR2sitmlU7anhUOGV
	c3LOqX87Y3qpJi98rqfysv/di6rUHJu9TSP5vbp+YQs/ZJ55+Qg16MXKUZ1uXDRN3APHsJN2enN
	QSt51WhhOhVQUFQNtVeXKK+dYT9398lHd0oGt47c6CO7tdrNngy6LpFT965nD37430cLd/3g/y5
	cyHpSr4vWw0BlgqJhPjgx3toTRM68mMAzyPNfimxnjMvb8Aa3ZmnJWVOnKx7G/Juyb/ml5h6G26
	5PBuXrmKvYZshRpZ0CJNxOEwZRLgPJX3BgVs9ZD64jOB9yCth7xAmJfSW45EbHLATbrWMaJ/hw9
	3WjpmqC3CrR4saxmC8mLrifukbjuvDLbEniz05r5eFK3KwC7eNqkj3TXyTxvzmNE26JVamAd7mr
	uRArg3A29K1cT1UTwpulN+KuBcqcjql09eNsAxg4Jl8SzrBlYDdcHWQEjEbxN810WFePr5dPjQ=
	=
X-Received: by 2002:a17:906:dc89:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c509642fa78mr1153445566b.38.1794915081033;
        Tue, 17 Nov 2026 03:31:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79146sm519632666b.68.2026.11.17.03.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:31:20 -0800 (PST)
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
Date: Tue, 17 Nov 2026 12:31:19 +0100
Message-Id: <DMXGAKCZ1Y9L.3IO6O895BMH6@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index a393b7533ccbf..e8808865bf6fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -68,6 +68,12 @@ memory@fe901000 {
>  	};
>  };
> =20
> +&adsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/adsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible =3D "qcom,pm6350-rpmh-regulators";
> @@ -291,6 +297,12 @@ pm6150l_bob: bob {
>  	};
>  };
> =20
> +&cdsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/cdsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &gpi_dma0 {
>  	status =3D "okay";
>  };
> @@ -316,6 +328,18 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&mpss {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/modem.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &pm6150l_flash {
>  	status =3D "okay";
> =20


