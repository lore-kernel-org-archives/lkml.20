Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ED6371880;
	Fri,  9 Oct 2026 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539248; cv=none; b=SXirmAQhZc9CuPhKsQ/wmai1hgUL1hbMa6WPoijq7iagBUIg2evRT0qupaWsKxUPMdE9+ixA+IkMnrYqPaXN46DxthqRSVqxxIfbwbvVDxHPAhF/ww7h7Z1G5lSSJ0S9rnI0de5ESss3+gOGmp7cz12Y2rDVUqWteNAIomqMudo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539248; c=relaxed/simple;
	bh=e1uXav1EwUmKji2iRJ29Cygl3vDU4Uox90s/s1vgdi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGK9zResp4reCVG1cb1YEggGHpWDegm2dUPONOq20vVoriq0LDlyKPpZQyLdsWZJOKqPURpC208AQgyku6G1KGE60seTPs+d3XmRJUjBQwh09ZiYDD4tOk3zkgLIg9anb8v0o7xYbBQlAr5p3gv4QNNcdPC4g2fCDmqXU+gPQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/x4hUjB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/x4hUjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F881F00893;
	Fri,  9 Oct 2026 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791539247;
	bh=uhRizd0o+PnCVixQYm8CJ8gvja9E9qBms3hA8LsYwaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/x4hUjB+wQPUktIRW9uVTnatO1uPlEqYv7cPYcYAbkxjteDcgGJjacVDBz/Db/ET
	 JKEIIX/zXGnyPNvGP7FxITi9QwB4xPr56xTLqti0rAgeIsHbyYcGdrHc2UzSTSjJqe
	 L0JWx14aClZLwQtbs+jS1v8uEzNqk+btFwYfWMJnHokdF/EamKFUIbrKG1kyQQyYb5
	 KhACpe7VcKWGw1oW7J6h1sB2oEPeCbgJONW1Ovd6RnTA/fkkKfP5VYMbaZXQPs6dgF
	 +hN9J6mI8/iU8crf71Q3udNbvSHWfZZtNRzRUWOnMPJmdPPLr+NkeCptg28Lkfl0vz
	 nZvTnL8WsdOSw==
Date: Fri, 9 Oct 2026 11:47:25 +0200
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
	linux-kernel@vger.kernel.org, Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 35/45] arm64: dts: qcom: use SA8775P IFE resources
Message-ID: <20261009-perfect-magic-snake-9e93b3@quoll>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261007090041.3732717-36-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007090041.3732717-36-gjorgji.rosikopulos@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 12:00:31PM +0300, Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Select the local SA8775P CAMSS pixel-path compatible for hardware
> validation. This commit is not part of the upstream series.

What? You just sent it, so how can it be not part of it?

> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
> Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 695eae1b7256..59be841b89ec 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5167,7 +5167,7 @@ cci3_i2c1: i2c-bus@1 {
>  		};
>  
>  		camss: isp@ac78000 {
> -			compatible = "qcom,sa8775p-camss";
> +			compatible = "qcom,sa8775p-camss-pix";

NAK, you break users.

Best regards,
Krzysztof

