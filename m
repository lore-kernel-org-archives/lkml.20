Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCBA49B5DC;
	Fri,  9 Oct 2026 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539112; cv=none; b=pUDAbwTZmusKsG2Dh7j8oBFvJ31WkXM/YPZVstj2LflFDcRmlIR4bqAsc4J8vVgLA+3DIzTInhdN4WPTO0KIldtPuqKhve/hOKtVw5VJwHGZOmgdlMZYb9q7IWM0sI7At/xzQxcdrmmeLjkAFAOc3F/2bd7qbaskIJeapJd2H9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539112; c=relaxed/simple;
	bh=W+OpUYVaObeQvg2V1FcZRef5Mtxyekw/dfptGniFQ24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2+0fNmrGTba0wPRvuyY2eLHsteexGk0zhFdYP1UJOeiNs2rmA8i7wKIDE6qNkIOv6NwYUyoRTDTJ3+ONXEbjqxbK/cHWhg85l6h7MZIFrWrvDOUmnkDdb7gso6XHN2DuKhikwz4SauLGebXV3mhzOF4cqSgB3kUlAlKa4HzhoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLiGiXnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLiGiXnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9970F1F000FF;
	Fri,  9 Oct 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791539105;
	bh=Yy805cyGAP0RH2LKAc31ElB7Tdaflkp+eIqPuDPNnV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jLiGiXnpejmyRPlElDEVZoalnE/LCFki7V1fnGYVHZfAe4rMcb3oQIMRHZJiFa6KU
	 wSj7EYp8GC0xXHaF+Rg9/zpaH8qKcQPOoKyiS9NuKSGa2BS4VoQsSdwZifGtC6ppiK
	 6Z4cIZvP5g9kSlc4VyJs7M6neor8/3FoTtSbOMlp05ump/lQXWsGyd6SLThvK5JYNm
	 gpbQdpxAS/4YD7pGb6oYkK31kMK/mQDNIXhxqjPerG6Rnrr1V+Hoap/DVOCBFXPYI4
	 l2NPE7MOCbCV92d4iQfyUmTSJOzSxI4UpbWqDOZosjnu72hlPsA+qPYN3bNQ+spTez
	 fHr5m+nU256ZA==
Date: Fri, 9 Oct 2026 11:45:02 +0200
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
Subject: Re: [PATCH RESEND 02/45] dt-bindings: media: qcom,sm8250-camss: add
 pixel path variant
Message-ID: <20261009-curious-witty-numbat-6cce4c@quoll>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261007090041.3732717-3-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007090041.3732717-3-gjorgji.rosikopulos@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 11:59:58AM +0300, Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
> that use the IFE pixel path. It uses the existing CAMSS property
> layout without additional properties.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

I do not see improvements.

> ---
>  .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index a509d4bbcb4a..d561179be48c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -14,7 +14,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,sm8250-camss
> +    enum:
> +      - qcom,sm8250-camss
> +      - qcom,sm8250pix-camss

Same device, same compatible. You don't get a new one.

Best regards,
Krzysztof

