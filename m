Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917473;
	b=er5aqqa3+v8GTw5GHDmvG9pzahd1wsTVD97ZVi7648BKrYHZ7UJU71WFz2vk63TTCGrl
	 APpaJb0Q1au1zuZW5Z1KrqpJNMEauGnxqNJH27HbmP4zZYtcrYWAXkTet1cQJBfziUAHe
	 hYLHMLlLHEw0QK98uX8qTW5Tz/5Ah2FO8WnPJGFduw9arNjvSmm8m2DaRw4uAxmoSAjIM
	 vAS04B3JuYyQrQftWRKta/ZSbo/WFI0oIDN1ZUj+5623ByLQlxOLNKPBVXJkNj3dX1rAk
	 ua/OG7lyaQKCllk2rttTKHM1L+X90B9ZunlNgF2kY4kvhOMVK0AUM5QH1hs+Mp/HIbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
	b=zCSV220D28+O7oneDDcUeAtzu630jOOnzlAUfMpe2pm8KkpxTTue4Aizwiq4w+syag4p
	 O8s5pYlwaJ4gf5E9cWd/2/PwIH7rxhcbVhd+UXS74KI8A+uGVdRWDrAty/9lFGVuZhLur
	 GoVhFeZD1VIVZ3su2m7nZ20ocUMhS1SzC9Y1aaJ34xoU3nJm6wuyR7FNyGkzm1hVtcH9b
	 vneZ6UvpURP520qgvEwnpplCKpYaL1tnzy9AWRNwTt28SIHag9XC8x/n9dP6H/BqpaWkc
	 uzG8d7Ucp4+sOnGFcCFcLvRODL7H3D3fIl3UH2HEJx+wl3b/vc+EgHcvkAgmo+ai3jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56728606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56728606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50cc7540b7so368564366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917472; x=1795522272; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=03gGhD1oXvzdNQ6GMOGFyWvweh+BeNUIH1kjQoSj5t5WVt6fEShCorX5Ah2vxim8jl
         HZaxxotQyQi12H9UafUZsOniourPI+skSJUdnXsxuxLgXXTgKNDvqDylE6HEaWDIL6/L
         FYZ2ES5zcAVUbYujkR8v6B5sdVmJR7LNi+9jbHBYjytKkGzh2eVmTI2hmUlmXjMlN7aN
         4uVGgaJb0pn1E7+Kn//5pEJi3l1fvxcASfG87z7AjBqx2uiS2WbdDl/+d1o5mro4aMv7
         sOR9ro+k/qlVfbs9479IMojiXwNER+sdygJQwu8tMzKsAsNf231XkXmmq1u6qrDUGtgP
         f/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917472; x=1795522272;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=lnFniS4qlogHDFUOT2K71DM+UBRHhfpd3DWnP69OtbgZmaH1wrS7EPfntZOIV9SMR7
         Z28exoK7qkyyb/GP+2/H5BjTfUaGNBYeRDOnwJtNvfdWfye7QleUuoqGTjiG8i+zu1c1
         G33CfxMRyfKD6xKEHqD+bov3VTbONJg6Eg7oM5Dn/j1ZzqmypIGIIfjgwnuhQnoBwov+
         8pKeEGeBR/uLvyu44WeDPzI2DUWN36OSlj56TzjFvgKlzrziYHlgYXnPz1r9ujaSpz3U
         Ot3vPRuAOrj7CtJ1RivmBgC0V/FPcjnW8YEkxHdgVE61H8lh/BTWhdE5VPtw8pyFYHsJ
         SgmA==
X-Gm-Message-State: APuU4Z/RZ1JltIBqRxR2KNs8uLS4cKbO6HTsg4eNT9LeA4G+7UKd6WmZ
	wP7p/hn72KznvF6vNke++K9QICdAwM7XdBElIIyy/C+gGfYZxQtV6kAwJ6YeJwdGi2w=
X-Gm-Gg: AYBFou0yH6MEof3ePGEfNsi/bjh9OXp0ShL+Cd3ZOnmRieYbskutXon83HlPlAQbfXF
	WIVyvVTdvBpXQDKP1TdcTlt+C7lzfgxqPJd9yJcbhYDdkyv+ySW4wBBcHqj3+nG66L88ug5Kzxo
	U4kCV+3DtfnLpa6Rgc1omtFa80LdqpXP95rCGIL3Y7NHpKNPER1Rg1qNFHCY+x55er9idy+9Bs5
	6Vu4lfjtc9WzelNDOBf5NWMbdHEdNAT/964xo8qeSb772aIj3nvzQk/0Dg7bPhiR2ftOSmRIwMk
	PitNqmEF9pu2DsDsWa3AKOUAZ7Nvecxh1b7F1kkrTgeREPU59lW6E/WO1SpjRjOOBrqUja0lVMv
	v5k4MUr+g+62bTmmupKzhzYOStMYxPhda/0DKND5H2QxcNuMLUA1c6oBG/Qokqdp9Hm/xd8oO4a
	quJXkeQDJJruvud3s0TOBuL9/Bivxn8Uj9Hh9s1w1Dnj4gCeWAnJ1DVCS7JTFLplRnsLqS45e75
	VhmEazkR5UknJIU2BHevXCVTIFfsSkFIj69XVoADvq9u5kbx9HR/af4sAuQ7yiCzwto9rNyBgDa
	PDZLYQ4qVNFT/Xy3uGFLzAk+CdgRUuLcswQZVmNBnFPbRuQ9FBzW7ut+Iis5m5du2/PajV8y5+2
	uEpPGTKT5WgamYYQtQbs=
X-Received: by 2002:a17:907:1b06:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c509633f436mr1276035066b.21.1794917471802;
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c00fsm532002066b.3.2026.11.17.04.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:11:10 +0100
Message-Id: <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable
 remaining i2c busses
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts   | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index b19e76b3c1a75..08647584af0ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -438,6 +438,13 @@ &gpi_dma1 {
>  	status =3D "okay";
>  };
> =20
> +&i2c0 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";

If you resend, add a newline before 'status', also with i2c10

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +
> +	/* PN553 NFC @ 28 */
> +};
> +
>  &i2c8 {
>  	clock-frequency =3D <400000>;
>  	status =3D "okay";
> @@ -455,6 +462,17 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&i2c10 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	/* PM8008 PMIC @ 8 and 9 */
> +	/* SMB1395 PMIC @ 34 and 35 */
> +	/* AW882xx amplifier @ 34 */
> +	/* Foursemi FS16xx amplifier @ 35 */
> +	/* FSA4480 Analog Audio Switch @ 42 */
> +};
> +
>  &ipa {
>  	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> =20


