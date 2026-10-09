Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4F3A2572;
	Fri,  9 Oct 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539201; cv=none; b=AIykYzRKMeBpmkR0C9PlVJVAiS1PjCRLhjpVFcnGqyR4sp5Xqa4rZ1O4MYX64v8auc0iMuFrXqbs2RrdFvHGygF0SL8jMYev+8fAD38iVBbEwBQcrqN9KD/mIgyZKrf5fG7YL6ue/0Z5GVaVEyshfDS8+Zo1GgaRGQahgBEBiHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539201; c=relaxed/simple;
	bh=1njo2TJtWy+BvJe0zwGCEK+mas3Hn8jAsrwNaSuqVn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGd5eErOLD9an2zUzAGALz2ysUo4jmBQ+hnnZmeGV085aXDrr0jEMwuUH6Dcrg3njXWJTC2PYm0Tq+q0A8E7YchGytvS6wOMicNiqvY0M+h0tkFxq2aPfLvSI/41W5lsLoRB+ptX0BPU4+7XueWY7tTtylU9zNgd33E0/K+5ANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1zK0Zsx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1zK0Zsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF091F00893;
	Fri,  9 Oct 2026 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791539196;
	bh=SfUliCtvkX/s0890PejxBlK3+HjZuFrnVJ8DjoIrU/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a1zK0Zsx7ZXb8d6gZbaaeN2GDdXoNvpTmhx3ruZrW2/wTXpnNNSYskxUliqNa+KSA
	 cdiLwp67xRkq/juybDXEjPH4KtywsiXhiAjl0xAQd9s5ixejNCC0mOFFFXhIyVcEZh
	 28+dzn9b7WG/joBBY5pw3MFtDGZyAh12NzRFfjgwJiSXyedRY5qD7ETXtgO69s+7bf
	 e0Js+kthH5d3BrIiWz5LIJvzr9WJeqVAyZeufeKMefD8h9Gvo0I/UNhUjOwyWdKgw1
	 NkckqdI6rL9yjhPPIDeFpiXPSk9FnIN28W5ngz3mVWG98QT6U0IoU+ws8mJDI8iKrh
	 pDR4dNwHIVZwQ==
Date: Fri, 9 Oct 2026 11:46:33 +0200
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
Subject: Re: [PATCH RESEND 25/45] dt-bindings: media: qcom,sa8775p-camss: add
 pixel path variant
Message-ID: <20261009-imposing-spaniel-of-tempering-e32e30@quoll>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261007090041.3732717-26-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007090041.3732717-26-gjorgji.rosikopulos@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 12:00:21PM +0300, Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
> pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
> Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>


No improvements.

> ---
>  .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 48f280e99809..9206c7cfe197 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -14,7 +14,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,sa8775p-camss
> +    enum:
> +      - qcom,sa8775p-camss-pix

No, same reason.

> +      - qcom,sa8775p-camss
>  
>    reg:
>      maxItems: 22
> -- 
> 2.34.1
> 
