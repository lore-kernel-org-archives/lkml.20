Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C33C197C;
	Fri,  9 Oct 2026 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539225; cv=none; b=aBhqhkJoiBZ6E6T2v8NO/pOUgJQWGY4A/1Vlf/N0rIb1/J56c2iAQCGl1+usBp+7Vmd2WBcuR45vXKt32hFWka+lPjR6iuVi+iWDpIyN/YlKK1tnYoknvkX+UYQvO4la95Lw0IjZH16xrqkEFO8IcC/1Slysg7Ckt8XcUoMkUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539225; c=relaxed/simple;
	bh=GEIfX+BQYpaQlX/6rgUusq9CL5U3AwRZ9Rrv4TMoPnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG5TusG2bAST5gIix+y0Q9im2wSscP1zc6DGRUJjttL8GvkADDPesxKPPPVwkneG807MikE+xpXTeaR6cV6Mz/jGDH3ySUJEeYWSRgda0gHGuOoR6QB/0iI+HCeQx2eD7huZ1lYjoPkrz3mwU2bf4i375OcZOK+a7XQIo5WBrjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwmYFb8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwmYFb8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FA01F000FF;
	Fri,  9 Oct 2026 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791539217;
	bh=ygxuvGKsg0m5/6FRQTcctXVWIZ2UWASa0ZpYNse6b1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cwmYFb8aMfKPzqaTBlfE9ims0H4G6LyLsdSTwI2RmzqbIQnzIt50nkd6j05TJT/Sw
	 MKgAeeOQpyxjXB1s5FUmw0wZGLH+qC6iikXX/ZcLmRsUdoaanWzQytUK0LePxadGM0
	 znzL3netPmXho7bQsnqMSOQLlGcHokDEqvpXV1HmVSF4ftHIozSZqkVzsBItd0Xr9q
	 bSKLrwsNt4ePgL/GoRhLqBqSKtuoq2/l9RtgoxD/dceEQ+tDtCTN6DK4DE0/x3oRkN
	 7NLSxrZPtZ4ALF2pD4AuY0/i9fDHygcB6WP+ShIPXEVguuHunfqCK6aoeSqmrOm9zO
	 Hg1L05o1LBolA==
Date: Fri, 9 Oct 2026 11:46:55 +0200
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
Subject: Re: [PATCH RESEND 44/45] dt-bindings: media: qcom,qcs8300-camss: add
 pixel path variant
Message-ID: <20261009-ancient-capable-tanuki-446ea0@quoll>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261007090041.3732717-45-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007090041.3732717-45-gjorgji.rosikopulos@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 12:00:40PM +0300, Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
> 
> Document qcom,qcs8300-camss-pix for CAMSS configurations that use IFE
> pixel paths. Keep qcom,qcs8300-camss for the legacy VFE resources.
> 
> Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,qcs8300-camss.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index e5f170aa4d9e..f85104682e52 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -14,7 +14,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,qcs8300-camss
> +    enum:
> +      - qcom,qcs8300-camss
> +      - qcom,qcs8300-camss-pix

Same comments.

Best regards,
Krzysztof

