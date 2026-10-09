Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BF47206A;
	Fri,  9 Oct 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539297; cv=none; b=aZMhmOHHA2YHjE2UykzEVKBtc1yGCo+FEDVrTqR5NwBvjQy24L9Pue532AP7W4Lzcd1Q2X9VVgxzdG8hqxLhhedpZhzm0dp2GoVYOyiSqp+KJqRzTJwUbcUemNM1F035ZuE3vrfm2ZgBnIycY75jOip/ZiVbm8UYbP7XfOZ3OTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539297; c=relaxed/simple;
	bh=gfEPROF6FaM3ERcpvy9TR34icGdTIQB2rVjhJsjHZNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B88CgC+rtmisiMcB21ubfBnyC8zF7NwLK/TQq91HQ/7Rpe/bkDBFL46NzGw2m5Sx77eyp2/AEQUiNL+uyS44sIXtUp4bnr13T+ifq6uqeRXMsgR4XSE/Qtr3rRa/918szbaVp7N9iJrJGbfSctL4l7neRlmCjflat8rJ05BHSfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LI8lH4zB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LI8lH4zB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3CF1F000FF;
	Fri,  9 Oct 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791539295;
	bh=JXtlX5hG95mG5lTIoT3TYQ8tfcWfZ8/oiEVQ0P2zHBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LI8lH4zB6RNEp4VnHe3Q9j6YqKvwT8rdL3KS2YbEHKoK+U2j+dKfZ0ukdoVyP068H
	 M3sNhzr6at4bKcOu/hL3KcfB5WgEmVnq1QUQ08+QBELcUnMDRp5jek4MZobX6H2hM2
	 aBtbFsypg75OCKF/+hyYNl0yiesW0Vz+vhb303zXZPtCbgOuAdvFr+vBTWJT5lL+9D
	 5sTY5MlzOZFC5YCjgFJB91nAiiv3k7WzLCs8d4n5l/0WDCgxVFlKeQBKhakkzYED/q
	 s47LX+OKYx6RipXe+++CPw491G3oehXPLhVkqLg2VWyAQ1s50yFPbTAYCC6V1ONPjv
	 XPsHKgUfgnykg==
Date: Fri, 9 Oct 2026 11:48:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>, Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>, 
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Yuchan Nam <entropy1110@gmail.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Robert Foss <rfoss@kernel.org>, 
	hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 24/45] arm64: dts: qcom: use SM8250 IFE resources
Message-ID: <20261009-wisteria-hare-of-realization-6cc5ac@quoll>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261007090041.3732717-25-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007090041.3732717-25-gjorgji.rosikopulos@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 12:00:20PM +0300, Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

This patchset is horrible. You did not even run checkpatch on this.


> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 90f8b091634e..21550d25ebe8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4487,7 +4487,7 @@ cci1_i2c1: i2c-bus@1 {
>  		};
>  
>  		camss: camss@ac6a000 {
> -			compatible = "qcom,sm8250-camss";
> +			compatible = "qcom,sm8250pix-camss";

NAK


Best regards,
Krzysztof

