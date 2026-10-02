Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FD36C9D0;
	Fri,  2 Oct 2026 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934079; cv=none; b=c5LQU1UudDXCu4Xa2nfSdvNvDcKbPe8Fxyqh2p14x/WvdfORT0iQbiPI0RaaQpGaamH0qWmQAR3DaqbhnbrSW5V3Zh1IOTWZVffW6mDXqI02se4nNeuhRZwBAGKydVA49bW061WW1U9GA24y+mMyXfuQ9d//i/5SpN6jjXDoiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934079; c=relaxed/simple;
	bh=D0c5mDx5J+mbMD9WUM5PFYnUviOUOaZbvw3b1QKxU/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuRHXcgnmUfdsNDZWK1qGrjaE6eL+/qqca0lvjrN994SOrpX0p45sPU6lVQ7vVFTu5WtHrrK5aYVonLbT9TfejPC/hAP0/rPL2KJrYoQmVKSYSn/QH2ZLIQhCn4prd66y5AJ4Cwyjlrl100+x7hzQiQz67CPj0vPjMNrDcHXMj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPpFLWps; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPpFLWps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C5F1F00893;
	Fri,  2 Oct 2026 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934078;
	bh=yCtsKn11+tZUhdfF73xRQg9FkDoqN/1o3LgHdM3e3po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPpFLWpsL39VDxle9EbxkUTn8NfuCMN47gWMakDE0D6Vwzrv2hY69IjwXPJ9JUsR7
	 kDuS3lIPfS2pdtBMCa70hiayQtmflIJwW32hTyfAIwDW8CvZ18iFu685QY9+8IGMha
	 bGr3ClDN1rDZaM7NdLtj4sib3wGUBMTdAzFJGJf3YeJgsbGl4nR1z2o2ktSJXvPfi4
	 N2ovDb9cKKRAqYzAeVMXyhnX2TEHsoDptyJYSdeoQR68zRes5g47w9B1HqyuhD+Zm/
	 DeMv6fXLQOyPld2igfgQwUETdrvEgBzD1N3/4X3BO4jrbYeCa5E1EgE0oXrrMC/i9/
	 k6C9CAkONRxFQ==
Date: Fri, 2 Oct 2026 11:41:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: sram: Document IMEM found in Qualcomm's
 IPQ9574 and IPQ5332
Message-ID: <20261002-expensive-boisterous-nyala-4d8bad@quoll>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>

On Thu, Oct 01, 2026 at 08:41:11PM +0530, Kathiravan Thirumoorthy wrote:
> Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
> and IPQ5332 SoCs.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index 6ee0b1464722..d65696885e6a 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -37,6 +37,8 @@ properties:
>          - qcom,eliza-imem
>          - qcom,glymur-imem
>          - qcom,hawi-imem
> +        - qcom,ipq9574-imem

Why reversed order?

> +        - qcom,ipq5332-imem

Best regards,
Krzysztof

