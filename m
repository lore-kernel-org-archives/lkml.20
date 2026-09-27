Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B5837F8AF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542813; cv=none; b=PLdrRwpuHD+hj065s9kBP1ubJ0sAQ2i662WAlU65grJHnmbE2vMOdEoqxrJrf62PChbXkGkGkuTls2EyU/+yVqFJI8eYGNfIgysgR3SoAUtDHTE5mQSN926uUIrHMvSQvYw+jf4h0HhBg3jLsA5VEeV5CVO6hkx7RUzQBxf7HO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542813; c=relaxed/simple;
	bh=G2oUcl4PFuECTL7Wrpefi90ylipzCMBA/vio+TVO4HQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=qJUKuP+JTW40YhkDz/2JbvbMIWPLu4Ieb+x4+rHmVCbSdv+Ykr/8bUCpnUh48/LvYo+iW/H4M27ULijieH8Ff8CGbfAOu7mt1wRDLVUpn5fTFNCrpXYe958FCBg27g+BQASXWrzbvOmkbEf9VcW/Myz0YYyokgoFPhKPvlxsL6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mvIk9pMc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mvIk9pMc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so7889595e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790542809; x=1791147609; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HdQLpvgoc2kmRQGNUAWswTV8bwgORG4pWTKI2Gc4aS0=;
        b=mvIk9pMcmF/eoSKyOQNUNXVRwuDcWeZMzIBthXsDBkf+q+dEkzkyD8+ch2buQsB0/T
         owvU5qY5AobLL5aHYwK58mA/NA2iPOddJOprjf/tVVN5gryy5yBCAOWtkxgPbP4ZnWSZ
         pb0NiEitsJt0Q7WUtLr/PR7ymVOWL1qQ5SZtvL92oruXlrRNaPc5npWURrKpfGS6bT0J
         wqf4MnTSmZtz2fjVkLl67Yjf/lRhpS9dfQZNXtpafrBCD5r0mS/Lcv7FbL6ONrk6bfh+
         ZqczdNFyfdYyn/pzVTYxPDjCj4lbwU2HNxrDCQd3iV6MUkRoUJdFeRfDlImDItCmFN5K
         2mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542809; x=1791147609;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdQLpvgoc2kmRQGNUAWswTV8bwgORG4pWTKI2Gc4aS0=;
        b=rkGs0bZ6QMwgovfjKfqP4RXFcGA7amMzPrlGiIZzHeMelWg3QpNX7sYCaDzTPqEQtS
         firDE4+ph/o7e+Ec0xdiFpfTUN9IivqaYCWtsKL70I7ScLV+5rR52opn5aG26XeQidoN
         0rLDVGDCvD0ol2QP/7UAKMWBRH9KfkZoc/SryUc0Ss6SdObUNR51J1Hfx/zVEzWshw9I
         n97CdmaH8FEelwMmv/RPTQQJv64NQq+ywAT+fgsYD++LKZ53O+OvTp0kB/UKyL4tZXam
         caHAX/aWf4ey3GFtLgvUpafghTkme4UaJGNX2/ZjU5nInsMOhAhS4k4rcs2NITDwPkfi
         1srA==
X-Gm-Message-State: AFuF++mCGOyXC3JEw5RaQSHBRng1KN442OSM508aaDHJmj0B1T83yW2G
	uYAkMXXlgTQFioxxdKGGVREBJT/NpvURry4wbrCB1j8RHvIj/1h8EbkAPcGXY8HjnSLKBOHCq5D
	DhhLK
X-Gm-Gg: AYBFou2cCiZPHotntrO1INOFh+KjRWUi+engE7NKiowJmgfquaa6XvgIJ0hvlPZZWZX
	Guyk8At1SOzN1PKAVKDUFpSyWP1a+Jz2Usb2wpyeouWfIP9tI5heT2jNrsac2kNXpsk6DfU7G/H
	w6+kZ+LdWx1ESgMnr3kHzHtZ4dPLRqUGiMsky1QTIAA99MMXSUqgjUGh5h6lGJSUKF7DbvJHmjG
	jssj8CKrMa2GBQJyPI7yBTomDQ/KVO1DQIOR6/2PrV94Qqt9CWHi78Hl1lefU1ZuPe4rQIgwFvy
	cr5H5q5EVJ8CLns4thk7JgcFDvFI07bDo8TJVWvKo0t5OGm2SHG8mQmX5VhOR2QyXyo5uaLa1NH
	pTAYa0m7NNwit+tYe0pB8wbG96rH5lpbgGXAV14Nautb9JVcvW4U8mTue9PvwwO61o66WEU+K7b
	WRs+3X++WOpg1kH64jBrSPHO/HZWlJ2dXjT93w0gATTwONVrAXgil0bnwfH42XM+FtnOjgd/g=
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr201327785e9.4.1790542809339;
        Sun, 27 Sep 2026 14:00:09 -0700 (PDT)
Received: from localhost ([62.217.52.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6ced69sm146468965e9.0.2026.09.27.14.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 14:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 23:00:07 +0200
Message-Id: <DLQEGA48W7X8.21N6R6EPU8C@fairphone.com>
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
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>

Hi erebion,

On Sat Sep 26, 2026 at 4:00 PM CEST, erebion wrote:
> Add a node for the camera flash LED found on the Xperia 10 III
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6e2bbf4f060ac..79aa2521aed40 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,9 +4,11 @@
>   */
>  /dts-v1/;
> =20
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm6350.dtsi"
> +#include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> =20
>  / {
> @@ -302,6 +304,19 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&pm6150l_flash {
> +	status =3D "okay";
> +
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>;
> +		led-max-microamp =3D <180000>;
> +		flash-max-microamp =3D <1000000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +};
> +
>  &pm6350_gpios {
>  	vol_down_n: vol-down-n-state {
>  		pins =3D "gpio2";


