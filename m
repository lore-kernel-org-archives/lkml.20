Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912621;
	b=H5PIfRwe3JvYFWklBIel3l3c75LLthT3z+bi+GmT9fAuGV8lL7/o+MoWgFS8/qB1lAtI
	 01+c/qHHJsftrQVCODafSUoe3mkgRrBwQbS2B29gK20lG3LWx6IWKXVMUTpy28hZXvz8A
	 ubgRZb0q6AsYD0DTabVHho7i8cQ4pjNLjs+TxSAkVOdpcajHSGY/b16E6kQwfuCNBEG7l
	 ijjGGQ5z3OliVgMXFrMuczel1hGwYZ0ckFfyuXbG5X4VEPtVdGw7rte2AbAzx+NG/orKN
	 9JB4w6yoFrMEnH4MWusrlDzDYx/1Mr16a6juuGhCc66R0r6O/hIuT96KG7CAjF9mUfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912621;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=m4rdrBSIK5+Jn0CMVPbEMOtoJM4NoTF4AGa49Ys5cDw=;
	b=sS3IW4IN4CpCkmTzNupnBDx5Dt6YIwGTcKjKJ28gDs+gTLIJ3osJG3F9CrZ81624Cfe8
	 iLCVOjvtd8VgSggKpXRn6UAVBjjw33cZXVLv7gqVxkUZp9tUuiS2XWRTs5YGyKiBVTnYs
	 jLdlFy+Nw16aiXkGIZNm7nhIi7aPIgDOTJmqwuOoUka9zsjphAHdF5UXbTDKQA5/fj63r
	 3Q1ilEcwdXDwwf0vDcZqSqjwOfHYU9t5J8hZi/e7lgar9fHqhYneopBsyPUhOW6Almzh4
	 YTuQl5kQJnV+93qm9laGg0jdN0JoZaAK+HxE+1GNSI5TTHPLIspwbX/lggbpiJferIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPgAWa8E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84607606A31C;
	Tue, 17 Nov 2026 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPgAWa8E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C7D1F000C4;
	Tue, 17 Nov 2026 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794912621;
	bh=m4rdrBSIK5+Jn0CMVPbEMOtoJM4NoTF4AGa49Ys5cDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UPgAWa8EVraDFmXKia+MNpcJm7dKUfMu6QQQFWQmMdRdpY2K2pzrrMU2jKlkBLzPM
	 p5FDQzaBhOuZWGePiMGImcrqnuk9Umao+KPsf7TfwVRw1FnpBkUXxLOx6uneM3WcOI
	 mt+dSxwNXHoi+ZmnbYCvbUKLvDi1Poi6znoAanV/Tf9ChNR6c+L+HWUTqzcH/gx4n3
	 jOXJvD6F43vS66JVc2Fr8OQPD1+8yUqZ8xOJoAGoA7JwUFXw0eu2k7s+tDoZEYOh6x
	 p8ZGZNjRr+aBrWIDTWdOFlj3Dr6D+ayv16mmEf9mfg0V6fv0osExp++JWdKCoRbMxi
	 TDy2/1P2cbOCw==
Message-ID: <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Date: Tue, 17 Nov 2026 11:50:14 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: talos-lyra-evk: enable audio
 support
To: Karthik S <karthik.s@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
 <20261117104303.435294-2-karthik.s@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261117104303.435294-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2026 11:43, Karthik S wrote:
> enable playback and capture over max98091 codec interfaces
> for talos-lyra-evk platform.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |   1 +
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 271 +++++++++++++-----

Please order your patches as documented in submitting patches or just
look how people do it.


>  2 files changed, 202 insertions(+), 70 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> index d254a32760df..7cc1ebec9903 100644
> --- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  #include "talos.dtsi"
>  #include "pm8150.dtsi"
>  / {
> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> index dffe64475ded..f3db271517b5 100644
> --- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> @@ -7,109 +7,240 @@
>  #include "talos-lyra-evk-som.dtsi"
>  
>  / {
> -    model = "Qualcomm Technologies, Inc. QCS615 Talos Lyra EVK";
> -    compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
> -    chassis-type = "embedded";

What is happening here?



Best regards,
Krzysztof
