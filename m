Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916940;
	b=RHhMjlPn4vn21NrIqtb6LvuI38J154GkarQRiuJpPj5Gr78ovHiC7at8qBonpATtJY4d
	 1SxDRhOvFAlhg6svaBTssSWBiswtEIv2IL/cFoLp+MB6u4NcSvM/VttOkU+lKSr4Ojq8x
	 7oYX3fmZ8nMQrjH66QWl7UiOQOlaCmw97a5bOFqkQ9lhHpG2EF+bf07OGn6kwJtT7mcAY
	 A8JbjRZC4JzijQwaMnrvvG7o0E8osoHxE6RnPW8Y1JEa+AlXbB1N/QqZGHAkqooAtA14q
	 6fHnd39fgFCa3+m36yrzI4945iOYU8dA6guzEkTDtegHNQjKuU/+2/m01DD3W3SCWqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
	b=dx/CQUNnxN7H3DMJ0TlpeMUpfFT0aUzz911G4fztCWPbcWD/TVqcX8AMYCXDK7xvEWnZ
	 I1TZJt1M8/oMWwUzlayPKakl68YhTzp4LtpMsL4+8gqEAuKKSqiLjHA0D5WQMT1lhp5XL
	 VRgaDXeFu2zR5u5mPMBuaM+RvrFIOb/+2UWy8AeUZIHKoly3/O6UL3yJBAx91D+ukApZg
	 Gv5h5+UX6t72TYSb3azoZ3cT+uRBdphjemZAUgpHW6+KYrEhbocXfY6fuAeXEBa1YbP9V
	 8U5q+j9ZXASdxVoQ0Sc7C/QTcvdg+Kcp8EfAT+DYEHb2lqQxs64fr73Gr5sDPDZXPOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16D9606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E16D9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c45551fa84eso850721366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794916938; x=1795521738; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=Th827p32i0l9D3dCfJvt6t8pdkgOWmCvul17AhFFjNuJukCtmYruARt4sMdL3QUntk
         /xQ0yKa8WdJnizBI8kqOWfBgMNq6peVRv+Xyu1951YpaUa3jZkxEew2xfVNuL/MfPQq6
         kRRmIVNCcxJzMVkB1BkWWZNvwVkCe6IJ8PsgAm2g54nH9NV60iMV4OcOzq9MZAwtncHP
         d0vXcrnAVqWEOqsmcrHftcwvPrz6P64ycSu9vSt1IWtiKjIMRDEcaHlSk9zfNQ4Rdyo5
         uRHppU4E6d3q2a2sG4Ggn+5uc/Ex9NqQld4G8hPB2xtYg+21jWoFWz3bMq/gLBal5A7I
         ZhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916938; x=1795521738;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=pbtTqkFisLbqqcWv9xiOPymbEiYZhB2ou+Rx4rFbaxvgdMVReBzQhpxw6IA3jZRBxs
         ucVKfQ856OvKNjJWf+TR9aIoQ7wYLYNRe1iqU1Wj89CR4S9TkfGWSF4RakQHXEt3ZqFa
         Pw7VD/Eck4DoCPGVBO078sPNq49Tl5LVwLqs+PIxtc16ewyjNgaTQe6yCt/XYMfoxSwq
         cnxXzL6v7oCV8EDtdPbUmyA7U+EomZ0QE6zcx6Mn50/VNP3cIID0twd16CIV10cPh4E3
         Ml9PF0V+8XIayQo8SoBnEbNOjieGqrbZFoBPFzhibXCZoqzzGsB8wdXmuiCQqi2ZUsjl
         2FtQ==
X-Gm-Message-State: APuU4Z/bW264O2htRcC3Inq37e0doiKPTsMBpO+altAd6uMMHLIUvnbc
	9Iuukpf499r/wN5jUr8JW52EGIifesjSzGc6LAt63X56NfOFE+ePAHhisOAOd9xGyuY=
X-Gm-Gg: AYBFou3jL0URo1yblrs25e5S/BtsJzy3FjnaGWVnSCaSzFtRBhKOAZlDw0sBmos5ght
	iDh2r0As5USjjKfj2QOWDgZdQR0DSsEBLbs9HYn1XiI6IXolq5TC6OS9WweRhUVKlyFxqKP2A8h
	ep4pyysQaSeDMLOUXeu8cGfkXu63UO1HOGBIbVuwFtTX+j+Mb6K7is6G8Tb7N41IWn27Nu5fLVV
	J7AZatQhAP9+XrjEVgWQ6I29ORTwD0M69EdAIqNiSKF1Bh14UM5wnJDzvJbgK38IpNq2tZQN62n
	QTzP/Xy8ZR6za2oafLTljkHg5YoKdwQSG/OC/C9mJ30+me7ebUDMtSubM4zqXNBMLgOkWbQpTVj
	1gT4tFAPbStcHLY3GZEwUILWdNfovwIx3Jclt9Xx4Fra3wtmWDOZt7Io2rGVMN6O/0t05QsvNeT
	CVcajPIIfStKNiFULAYABtVplIaaHBxYEO7TGuXs7lBEVB+zzhybVxPHGM4MUr0WDcsPh0N3bco
	J+verpRheONZCAJ2NTyKcJvasntkXoNwfghuwI8kn1h+DwYvwQP/ZEGZpM0DzrZlO9erFo4yoAl
	1aiDz2UQSaK/lRm26g9RNVuerjNkKjiOxrirEwrO387B2yEcdjNRQfAAB0Xu17qRPGQJbbnRgg=
	=
X-Received: by 2002:a17:907:c06:b0:c50:8d2b:4392 with SMTP id a640c23a62f3a-c509674081amr1060134066b.49.1794916937935;
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50efdb3471sm115816066b.87.2026.11.17.04.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:02:16 +0100
Message-Id: <DMXGY98BB06A.KWBSBPSFMXJ9@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
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
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
>
> The phone has two PMICs which have a PON block, disable the PMK8350
>  PON and keep the PM6350 PON, as only one should be enabled.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 697e1cfae72e0..50a235d6fb6df 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -8,7 +8,11 @@
>  #define PM7250B_SID 2
>  #define PM7250B_SID1 3
> =20
> +/* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0=
 */
> +#define PMK8350_SID 6
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -16,6 +20,7 @@
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
>  #include "pm7250b.dtsi"
> +#include "pmk8350.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -420,6 +425,35 @@ &pm7250b_vbus {
>  	status =3D "okay";
>  };
> =20
> +&pmk8350_adc_tm {
> +	status =3D "okay";
> +
> +	xo-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pmk8350_pon {
> +	status =3D "disabled";
> +};
> +
> +&pmk8350_rtc {
> +	status =3D "okay";
> +};
> +
> +&pmk8350_vadc {
> +	channel@644 {
> +		reg =3D <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label =3D "xo_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


