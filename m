Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917107;
	b=t2zXra2m/lu1XM/nvc0ce7rURvaPOiK7bdtIVos1HLZ3ct+oyTbiKQ6/iw/qeNy6/fP9
	 SfKj+ASnzJ1OgCr4sRlYRdX9aiWrNNP6+7DEwfOxC6E27iAhonnJtMzbjlHAFgoyjxwit
	 /r/op+P7OOKq2UUVB2xWz1c1M8X798rX/jFIF2Tqc3CVzJLXqFx/liWaZM7tY8ZCp3qpA
	 18ty0SqLS6iNBjEdiDqQiS6PTFgB4xki3C+QnGQhD9JgEncCPgKMmwDD7RcYI9Z9QYQaT
	 Lk9+4bW+cYkKaUhEi4dDxrAf8TeI2NApRxhE3rEzIJob0059NI3Flm80Y6B2iDjQ6jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
	b=LjN/cLXRkyfeamadU4joSRCeUYr8Lg6rolyuUjNaogukapcnOiJF5DRuvU5XvubWbPmh
	 7EUJimixkKjadciVt5EzLKRHDnb7dIG5khQKOx3eywosWfkoZVEBMmMzBYgh41n9zfzCT
	 jrgIjcMgjS00tF+wil14CW7IpHGn2wYMOWCMfdPB82rkwaVAk3CmXzUEfH8tQsnQXgcWC
	 wrBtD5OM+YBPonOYcKqwZGdwTWzhUF2rPD9TUYLlRbVUSPRqWA7XJQAHaUdIsnezt3M7N
	 6GzPrsfgugK7bi0BG7L3za8LVKCpQE2P+ssFpq3pW0TM19ESA/PVpbPeOnnkma4eyqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BE8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d21051042so273437866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917105; x=1795521905; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=ORxEYea6MFxGoUK0zCYHQMQ4RmiSZrwT7i9g46mYc6HzJwZYI6lz91n7MsJPSHP8L2
         VZgyKrSF81qlVHLJ87tuNd6qYCMfEm3kU+5hfW7eWUWEhoNOgJE3l6jJrMlMOPS5TnJg
         0p3rrr9O54Vmmq4wZXZ5jqs1z97LwcxxAAlZarRSVP1RgYMfRBjx/5PUjw4eRa8nH9qz
         56Bj2ghXjjD4cRETMZxMeK6F5BYd6JVmrmeDY8qcXqfRZqEosxGBHsCddrljWXR/OuM/
         tOWx2c7TEhSq9DR86A3bC3rjr1gVceVg4mDHCZoN5A1SWGE0B7Y0HcPOAkzSO/vs0NpX
         2VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917105; x=1795521905;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=BJo/5rz5ngnSbq6+W1ccw0OfIFDFE1yQ9VkLdHM1Cj34GX5gpl8M0zEK//vNocM3HO
         APPh0Nmtq+1Y1mH0fHaidWNCwaVdxb7i8ziyOj1/p7LwGDzvBzErfx6lSBqxrMBqUPBo
         JCbayfHnBjjSsCLuXh1eyXUF2JSomkI/SltzeXYRdvEYiKAO64UlayCUPW47gYHjIqUi
         OiI+ukR0wxnVl8wHaT5Fji0IYmAqeX54Zg1ozQW3cr+8ea5BarLJOJ4yePCFhgISwKhj
         mvQ3FzL3RYGvSfqI2318JmhlNR19p1HQLNFE/qVLx7ZHn4pOIBesMWvQnTJwgSUWgKZT
         ev3Q==
X-Gm-Message-State: APuU4Z+DnthtDSg3W5pD/HbcX3ZOlbEV1LWdc9XtMfN2rpIU8N+Tn6W3
	uSc45TfS9T76pqLaVC3/xyLETupfw7CB8qgpKNSpX0duek0GdHrRj7/4438ahQ34ky8=
X-Gm-Gg: AYBFou0+fulb5iDgpG9zt0u+s1UDBl2VG/D3mtc7PRWTspA+KTu2KKyz1HrzGS//i23
	OsgNw9AvtbFnepqhDf3g2jIYsCB5s4tOLBQTuUBMSfzmgZuCBMO4Ed6Xhk+mpH+Qd/E5zFazYHE
	ulfrNiKsj/Jb7TtTiHIrNb5L94ILV4Pi8T9T8/ASBoTxPoLlZGtpTtttBBQk8t8Bx3iQwUVDgFg
	ZZptUhEg/TwWme803vP6PbaspKDxkGNues3Nke2e1jhMLPMGGRBSFLHLcprBK4TgjZMd/8SDY8N
	avVuaKdeaYAzjd2FwZOxR7oZ/umVzMAjV6ldUp+HWMDHe8K0tvnGlD8RkanedoOXT5W956e0WTY
	enyzVQ6rehcjUe3KJ0bZFsfFj1vVOaoIF2olGaKseyhj8g8hFwe7hEPLOurWZ0oBlzQ/3wGULSA
	2pZ+kiL8M6jBqYSA4R/300ycy599obASu+xgL9oE+c63xCrpUH4LLG3ZZIV0C11L+TDbBuYK3Ye
	n/+YeiHfQ1G2mLybieqQ6feyVA47OsP8kbZ8D4ykZsyGEA3uPAP8sEHgOWt5IK6DBWuzp4Je1+L
	oMc9M5uyNoxuU0qZDypr5/sjQF4obzZQ9DxYZEzQYS2qyPtKcHOjfb1jUqBMLjup+9SsRUnpaMJ
	ta0jr0dK0TfZuy00b/V8=
X-Received: by 2002:a17:907:84b:b0:c35:3880:773b with SMTP id a640c23a62f3a-c50963f11f7mr1200537766b.45.1794917105150;
        Tue, 17 Nov 2026 04:05:05 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm473472666b.11.2026.11.17.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:05:04 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:05:03 +0100
Message-Id: <DMXH0E5U7WSG.W427836YQJIS@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
 <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 9d880f6baa531..697e1cfae72e0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,10 @@
>   */
>  /dts-v1/;
> =20
> +/* PM7250B is configured to use SID2/3 */
> +#define PM7250B_SID 2
> +#define PM7250B_SID1 3
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> @@ -11,6 +15,7 @@
>  #include "sm6350.dtsi"
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> +#include "pm7250b.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -372,6 +377,49 @@ &pm6350_resin {
>  	status =3D "okay";
>  };
> =20
> +&pm7250b_adc {
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		label =3D "charger_skin_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@4f {
> +		reg =3D <ADC5_AMUX_THM3_100K_PU>;
> +		label =3D "conn_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pm7250b_adc_tm {
> +	status =3D "okay";
> +
> +	charger-skin-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	conn-therm@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +};
> +
> +&pm7250b_vbus {
> +	regulator-min-microamp =3D <500000>;
> +	regulator-max-microamp =3D <1000000>;
> +
> +	status =3D "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


