Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757127;
	b=KQyHbbJM9gWBLwI3LHkwMvNRFWj+wt8Qy9z8Fo0q+ZHlzYJws7z53kymL8hktimnpfcM
	 kcjuWIRtKhcHoq9/nXwjunr5gobsdM/CtB8sxKwhuDCrXfVmHFPtTiAQU61oMkXEZvUev
	 v2bZN0x4ZUQGjwdnLlPitV2e26pL4a7duA7uOERurqQyHipvX4ldTJqsjHGiwUIxCDOYE
	 Rx7RjxmBKG2ymJyWHFEKHIz6TEaBnSQyF1gUEH6luVAVF1RUGJAFHdSOcu1obW40CdLZZ
	 uQG95jgBUKfLvGl7EFRexEyv3Cw63pVp+StCfzRy+XY2lZfK/eYv58m3izkaEsNM8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
	b=uoCpwrtyQPoaoAG7tuTy21GZbFSyVY9tAR00+AKAbAE4nSt9mKlt/nczIecFLCo8HYxo
	 /PtdPq0n3EhURpEx9DDnBFi0XL4E7XMcwL5txgYUL0toh+6W+v8xG76ZqqDBOkJcxY/Ml
	 9PHkCO0vF4r3mBkwWLIkN/xsVipUfT3Szc7QgY2Wgd3zx0mIGNy6jKYit5XjoqBa7BEB0
	 ehe+GcXql3sfW7lVscZZ9Qy6G9ckRE4XnUw6THwHqNsAO23wJ9FJtEh7DuuHWYDT0/5YY
	 svKYN8GFzbGC2eDqXR6yvVM5T3xHk24TO2yLxp77gXFJ2jgp2rfzKBMlG3DijmNEWyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="k1/9Upg9";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7EB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D7EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=k1/9Upg9
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso6402995e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792757125; x=1793361925; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
        b=k1/9Upg9OMvsI0X2Fuy/4v0AkHqITUFT5daTMELi4Zwjw72wGWcz0z9FO2Va9/UV/R
         +Ddwew7njKOL33BXKFygaXgek1OeO8qXu/pSMmBfhBlCWHBshfFos1M4mFvkGELkrWiY
         SaO2feErS/9QyPuqKTrswnqiKm2DBJf/Qb/QRrilYyBvI142O0hiR9w+u9xPa/bYz+ur
         ZbdorFMzHoK91jfZSgLS58P0HXQ1CFCKhpMo2DMzZyfuBsO1AmGpopssAuy+U1q6sEiw
         akhv/JdsMJY6oFQjZf9YPcpLZzZ9pSn2XjyKDTRciY+ZJv/C5b4LXaakuSh1fyb1j1vO
         ehzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757125; x=1793361925;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
        b=aTpWLIgcB+1MfNdM/6ekWb2L4988DqFxNL3txrVhjHpdFQbAGnNBEq9FUJKEl2qXML
         8B28bdF3agp/ZyBEjD8Knqp2ZHZMB7ZwpMqfrJm0r4w1eIs2qKF/ZXzEGu7lNMecoXmU
         aNv89aI4l/oAHJnIGBjgo/lBcj4UCnRuC1IEKJEnAhq5pNbDIPfs8UWj6BW9BEJO4hCJ
         ho6uzFycwtZCFqts89Fdke/3BiL+lRbG01NbN1ekndn6uOmXuj4ktweEEnN0OShjnFLz
         q8dgn0rZo1k3xgU2II0p8tR/2yLDhSRhF7RcAr2EKQ28RGyFZNjXYrUqZutU1o3nb0lt
         Ukjg==
X-Gm-Message-State: AFq9FYJJMpJ/Z00kMAedijwGHWfg1OkPHW7jA5htEtG2Jxzyf0eczNb4
	kAncapDuZ4esitNGXmKrsaVO5xI63eAJcC9Qph+95IGAHI+L/QLA3s6v5pHqHEm21Es=
X-Gm-Gg: AYBFou0SKJSpPbC6rpF82Ctrce+4EcUb4q2NpeD7BM9rBOIqq6RmPReDbmYzjZgaQK1
	hiuMm/WPZYz26X/4eDBq0yP/90MQfD34jGGgVQ2GP3GjzoQMMYcik48m8e+GAePLLnKaogXjQJu
	pu6f2OtEHkcCz3mvwRf3pNYmeRTfc/FXrilTNxbFWS6wT5bhRv8BbugWt9Rw+DacHebe6EjYVJ6
	mIdfSxcbJfLatC0UxPEb3s0bFKCB4J4vtacytngspxCC7SmDrWE8TY4N4Ap2JRDMhRjtMavE9Zs
	fwK3eEXd3FGZD02kW/MOuOvmTGVjjaDdiC96edybbfzJh0cX0Mk37+81AQyidqwt4wuubcrcyE3
	3N2BfFryMjm3Mu1ge2ku1MnzP23+U9vJRccKFJE8vU9xmhFerjxlbR9TStINkEpFdtmO++9L5gG
	KHzqxiuQML1Xpng32XScOubRCQHot3et+adQq4T1n3vTiqz4iaM6RW3bQXlFI8kEftnVFEPw4Hh
	gKB5qnw4elo3wHdtYWaz1Bx/KH4yqkrRv/dL4f8/2s+yL63xedPvrQzTA==
X-Received: by 2002:a05:600c:1c08:b0:4a2:16c0:f4f with SMTP id 5b1f17b1804b1-4a216c010e4mr22298145e9.30.1792757124684;
        Fri, 23 Oct 2026 05:05:24 -0700 (PDT)
Received: from localhost ([93.123.20.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21544dc5csm28563925e9.3.2026.10.23.05.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:05:23 -0700 (PDT)
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
Date: Fri, 23 Oct 2026 17:35:06 +0530
Message-Id: <DMC7CT2C3AZ5.2SEL62SMKTXEQ@fairphone.com>
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
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>

(re-posting my mail from Sep 28 because apparently I forgot Reply-all)

On Sat Sep 26, 2026 at 7:30 PM IST, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 79aa2521aed40..0ef3e9e239786 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,7 @@
>   */
>  /dts-v1/;
> =20
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -54,6 +55,22 @@ touch_en_vreg: touch-en-regulator {
> =20
>  		vin-supply =3D <&pm6350_l6>;
>  	};
> +
> +	reserved-memory {

r (reserved-memory) < t (touch-en-regulator)

But it'd probably make more sense to actually rename touch-en-regulator
to regulator-touch-en (to keep any future fixed-regulator sorted
together as well), then the current sorting makes sense. Maybe add this
as a patch before this one?

With that fixed:

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +		/*
> +		 * The rmtfs memory region in downstream is 'dynamically allocated'
> +		 * but given the same address every time. Hard code it as this address=
 is
> +		 * where the modem firmware expects it to be.
> +		 */
> +		rmtfs@fe901000 {
> +			compatible =3D "qcom,rmtfs-mem";
> +			reg =3D <0x0 0xfe901000 0x0 0x280000>;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> +		};
> +	};
>  };
> =20
>  &apps_rsc {


