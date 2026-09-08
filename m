Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67881395AE4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852764; cv=none; b=lDnI9akCoX2d9rAHlesJNmj/Kx0aLdNvRE7VEs0rZuINb2Kp71x6CMHkzrNdlqefq7dUJt41mGbhk4+WSYUvalJdBbzkqX4YxGDUitAHc3DyiGFEFPxzFKSxnW3m+84p7v5P2o3O69tZP/KejeGZQl/U3Yv0bil0XDpGtLdxeoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852764; c=relaxed/simple;
	bh=ao+/s9eIaf8M01iar8WDrSuXAhedsd4RWg5xOwmssxs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3THo/NAeS2xZXWN6x7LihlKentq46O3NDQ5UfMsYKs+uML9l4BnyjNNtCuemzzUrUfo+x+ISzO1nwhX2UvvP8oRRQ5/vbEDQUMLsA3IkwtH7fncmUeneuFoxSGxzVgwhKTFb1881DyG9jimYhWkiejYLbJaj1yYRvUrfc5Zk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LadyelDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LadyelDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4061F00ACF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788852763;
	bh=BUVvKjrO5CilP0Dhdnmye4vxFJhvbGovkQ7n4BbuuAg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LadyelDWcNtzqn2pNDPzvE2ycihraLgBZJHb2jgVLHZZXzxgABvvuAdH7JVsF0ef7
	 hOCOsWfZgMq38Hw97bgA4s5aD6TcqNRa3uSb6utMDdvzy9wJ7f79H452uu5XmX32Lf
	 BsVMBAce4AwFBaI6PVcKTdCAwZd/MD2v0a+Blri6jINnKmNF0uTg6eiA59HZNt0sqd
	 pNULmwRPByHIr8/0We3MvslK0s5bWBbvgpsaV/RX8s67xpmG+NiDvPfGuJe+szXdD7
	 eB7t0Fyd46VQ/Pt0cnLJZJaHIdNmDjg6rmuK0nZx4Ckt63GBjxffjSD/6cVwmwVvxP
	 k4OW5NDiHLmbg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a151eda82dso36205561fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzMeVMlA8msV/g/iegxhZa84TpHLkaOAkD1tuqobXUrSUCHO7KoINpvxwcaRPiumRjECJeg9H//WkalEU4=@vger.kernel.org
X-Gm-Message-State: AFuF++mtT/epmelEdRux7GXAMn2WXaUxB1otYI6VmNDp/TtCFv/jc48Q
	82kNXn9qVqyL1Dg5j8PPVNT/sn5XyEhS8RT+Lt2qWungTOaHyW6ON0Lwe5xEIyo7zqpyTjEyrgH
	xLm04WFd2iOtGpAHIZ+Oz9T+yE9ZXwyhN9b6jhmk1IQ==
X-Received: by 2002:a05:651c:222c:b0:39f:ef09:bc55 with SMTP id
 38308e7fff4ca-3a371b30ee3mr58920061fa.3.1788852761641; Tue, 08 Sep 2026
 00:32:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 02:32:40 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 02:32:40 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 02:32:40 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me9AcVByS64-AwW08wPyHHnL=73E5N5srPzTSqusMHMTA@mail.gmail.com>
X-Gm-Features: AcwNN1XHgy9F2mNEObYLvFmWhv5aBUGsku_NoIXOHxOBjg8w5SFRiAiimbjLAiE
Message-ID: <CAMRc=Me9AcVByS64-AwW08wPyHHnL=73E5N5srPzTSqusMHMTA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sep 2026 03:38:58 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC, and constrain it to the single HLOS vote clock.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v2:
> - Add the missing HLOS vote clock constraint
> - Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/
>
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..214a9c051588 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,nord-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
