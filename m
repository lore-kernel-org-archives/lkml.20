Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575572;
	b=UNHt0omh9w5oqlVs+x/t4Vi9Wsy5553FRLY7ePdwJgxe52ICcJYSpl2bYx1Ce9k6+cl2
	 xYX0Lj/bmASqjwN4ynGLcRn3tNVS1CDQdrPOg1Znxdi4ChPm/NKlyUw7rPUQrIwWnOQQ8
	 bRqzQcHq7sw94bzhth4Mavv7TGGJdi/ytp8JRoeyFMuZ+hEAO4/nPvYoCZN2U0Nl8vB2G
	 W5mgueCvbSzpVPup7lW23ednLV1Q1KjCSHnJZZYFRYkKiJLdRflbgQ06UwWHSlbyBSpSI
	 Ke3DD/DHnWxgbujxYGVWjwdoEbahDyYwEf6VUv4UaFuhqbAqrlT7Y6wYIvnIOJKrG6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575572;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=70XoP1PPly+GjGagYXdlQ+dXmkE7+Msm/jKOrxVn7O4=;
	b=I1xdplttpkgpthwb1F2uOiYvd6ILzDXji1uTcMsSTahuq/qvjobXO/JA22daP1TANpho
	 FIKSY4hW7oySNT81xN0xP2rECQZM/+90TOqDX7g2VE34U6K4hw9GBm14QG0gazqNTyVnT
	 Sm7iXQRW/J2hneof51Icibr90EjFEMmOLNCUmwFUL9/bm9RopAnKvKeQqBK+Dg/lzV3h/
	 dPTcKl/TtSyF5LEtuZBNpltP9hSS1vkRVTVYzxqxtzMDwR1mtGmHZBTtV3ZqbbQLjoSBC
	 hbe2PCDqsD97YxUaNYfBqI3N10CT8GbYtpujSTp9rREnKohAPaxut4M8Nw5wvIbvJDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYrMRrXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBAF606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYrMRrXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51621F000CD
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575571;
	bh=70XoP1PPly+GjGagYXdlQ+dXmkE7+Msm/jKOrxVn7O4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dYrMRrXOZVPwE87XkUPFnPIL4zmTNwGQTmXPTW1tGLjj5zzr/JSEZi9/JeI5ucKDS
	 +3hxNVxIymcCknzQICkVDEGBJyq/CxOzkShV0eu9eH+67dguFCjW0XJMyy9xb25Zgh
	 8P+8LNu4JL29pzGpphMN8Dl8RxsjFJyYGdv8mylCzqyyfaA7NjutYmOSntu8NTut51
	 Ak4aQYFHnHrbuXSiK/CRqS7jdeXM2OmB89fB4UpJq4DP7Cdq7uL5gMs1Ycwj3HfcFE
	 8qulKn4mhHeVYQw7OZxua1Kaa8AsAyNrCnPLpCRIYhhAKUUJoOSjTuDtkf0UkrI3hd
	 RY/msqjehUlmA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso3966681fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzk62NoAZRUm4+W/bxCJ/e1IkMBw9NeI8z7U91aR6lECt37coJwOYY+sWo6Fhlopar06+aCSRr9EpT0ruU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyf7SOk8MS+tZQ3cjNlx+lOBKFxTf/a1a8pkciNeOFo7lCiGEg
	dON1dC8JLYzVEOxM2JfMpWUINHMTCEnwMP4WksolCDwPnIQzAvEGw6q7VrBeEgb/pFHu6kZY14A
	hCYVRwqnH24dIXRKwLMb0kKLKazdKOY1z8r+QRE0rmg==
X-Received: by 2002:a05:651c:1986:b0:3a9:f130:aaa8 with SMTP id
 38308e7fff4ca-3ac441c09e6mr4586711fa.8.1792575570271; Wed, 21 Oct 2026
 02:39:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 10:39:28 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 10:39:28 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021022921.2053957-6-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com> <20261021022921.2053957-6-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:39:28 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc=to49PpyCf0Lj=07uuv0CirRcTSYbUHvHyQy0SgKe6g@mail.gmail.com>
X-Gm-Features: AclHuK8rSP_D9_qUQP4SAxDy4Yr9zguQHwEm5ilA5D5ZiTUzh7Xtkyk4UtmqBsg
Message-ID: <CAMRc=Mc=to49PpyCf0Lj=07uuv0CirRcTSYbUHvHyQy0SgKe6g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 5/5] arm64: dts: qcom: nord-ride-embedded: Add
 WCN7850 Bluetooth support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 04:29:20 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>
> The WCN7850 module on the connectivity adapter card exposes its HCI
> interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.
>
> Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
> describe the Bluetooth controller consuming the PMU outputs.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 916f583b882a..6dc405ed7ef5 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -18,6 +18,7 @@ / {
>
>  	aliases {
>  		serial0 = &uart15;
> +		serial1 = &uart17;
>  	};
>
>  	chosen {
> @@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
>  	wcn7850-pmu {
>  		compatible = "qcom,wcn7850-pmu";
>
> +		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
>  		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
>
>  		vdd-supply = <&vreg_wcn_3p3>;
> @@ -583,6 +585,23 @@ &uart15 {
>  	status = "okay";
>  };
>
> +&uart17 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		max-speed = <3200000>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +	};
> +};
> +
>  &ufs_mem_hc {
>  	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
>
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
