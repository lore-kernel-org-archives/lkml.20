Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6329C2DCF67;
	Sun, 13 Sep 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285922; cv=none; b=HvYoHxORoNC4RB1qAAo0LpkKwYekFN6Qi10p1mGuLcTF2mowJNbmiwn2KCvccjcaQeT1qXrmqZEuYOgW3HE1IO4h05PFWM8iyFBFj/yGqBrjecwVNeFjHIcmQNN9yupZp/MLH8NXF6kV0mEUEgKN+NwEqHx3GhD/WBulEnXkbbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285922; c=relaxed/simple;
	bh=IVekAj++bUi+B7wWtLu+mTvpyd9ujD4feaUeEJvKcEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctOEpesv2aBeRTirTJRr14bUQ0PhJXOUybkYWf8MBObju3kq7Pmh5dTqfA9v+aYNghs+JucvhynKbDmH+C4fdiDHZ60qoVaxsWonwswuk78ELCtOLRE9g7iJNBxPgwiYTTjgc9kJ7XGlqkIgYbzUafm8xP0o7j4r+GThkjTUZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6dxjmQc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6dxjmQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14BD1F000FF;
	Sun, 13 Sep 2026 07:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789285921;
	bh=W7ulLVjk7cOY33gnZun4ugyjMQD5mY2Ry3w5xH7Coxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j6dxjmQc3YMBeHrLbUkwTd3ofR1hF/doqzXmsBffsIi0yR0LkyQXkS1KkuSJEeSPz
	 wxaLhmK+KHdWyDJ7E5IN6QPoAJ2f5+VHr3l+edjMQuRLIqztJ+Ez57Yz238l/5qD4M
	 9JBCDAYpI6BY5QMvmGDKyQYky8H8QVrqBnGXzJ3GcTi0JPi6Rtz8pNOGXS+GccV2Fr
	 vBt/Q0ioAKJzCNySLTnrqeVgCCUjz9dScdaxa/QpNTukN1PuPES6JT7pyxqjj26niW
	 WrVNjqIh7ji6a/rJxZFlMMBjjGaP2jhOdDScGgCSsH/rY1S2LD6aM4xvvQu7L+BGvC
	 yj4Zg+kpKH7gQ==
Date: Sun, 13 Sep 2026 09:51:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 02/17] dt-bindings: display/msm: dp-controller: Document
 Nord DP
Message-ID: <20260913-idealistic-perky-mule-f4e3bb@quoll>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 09:06:33PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the compatible for the DisplayPort controller found on the
> Qualcomm Nord SoC.

Same comment to other Qualcomm patches... say something useful instead.
See also writing bindings.


> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 094a6383bb77..8d980acb1a16 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp
> +          - qcom,nord-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp

Not complete.

Best regards,
Krzysztof

