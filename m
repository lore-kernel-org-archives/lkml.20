Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430AD3A7F4C;
	Sat, 17 Oct 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792254855; cv=none; b=syjE2Jw5WFP+m1ryCmJ6WJUihCrvPjbr4wsffaByjIQHye/W3f0QTAB0MqtQCrSgcMReK9400uB4J9cexBhoJeoQpBFT5qujO1taHN6KjhwyipXRBReoElG0XyM/70QRwJXEMcGuEEBdfKfNhfThageLa83f4gaAN6YoFymnzYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792254855; c=relaxed/simple;
	bh=PUEXNhy4n2LM66wFYYg6smFJyNCWcyp4xHfwE6f/wHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtU1FUxmWcpuIHbbICgUAG0TeuPt0LP4tFs6cE6/NZE/Afc5cMhu4WiOCi2qvcDTfoTms6s3fNoovBiEjtyfyolAsgmuQbkrOZvWijoCYLTtiHUvSI7niuW0jXHEte8ogS6LLbP9nE+XJDtVed38rcRWo1fZzgdjHUO7TM8/HtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpN8eQV+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpN8eQV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C1F1F000C4;
	Sat, 17 Oct 2026 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792254854;
	bh=ld1hUUocv0WaNfVPFHXGr4MOEBJvEfTH8tj24BhfG7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gpN8eQV+2kgPwd3q1OngaUWF4vZdF4No9pqPQMr1bbTh0LVbFurCzronbZSAWDK3D
	 4hbyD49dakXcd50/HRpIWbZRZ312u+PFVMb7SeLU9cTMFypiZyqm4OaOWRDDMUtX67
	 0iWRbRjH7T/0kXgzdX7a0GsCKu1LT5W3kJdOabV4C7SuSS7cKZhF+80UyuX99hZtKV
	 OezFL6fQUzfZCOt44QGKfcxs5hj6DYr6imsUipUVRK1g/MgUkgTzytLjAqpaNr7zfE
	 jpFuRYEd4r/DBIK2V00qVQKAp9Wqs0DZlcd+wcYsaaN36Yz9HdCsNd+Dk6UVUTIZrU
	 VADVBmD/2J47A==
Date: Sat, 17 Oct 2026 18:34:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
Message-ID: <20261017-shaggy-funny-pogona-69fe36@quoll>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 09:26:16PM +0530, Faiyaz Mohammed wrote:
> QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
> on a dedicated interrupt line separate from the existing TRP/DRP cache
> ECC interrupt.
> 
> Allow an optional second interrupt in the LLCC binding, add
> interrupt-names with "llcc-ecc" and "llcc-lcp-ecc", and enforce both
> are present when compatible is qcom,shikra-llcc.
> 
> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> index 2141e5d4de63..3546cf7c2519 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -64,7 +64,17 @@ properties:
>      maxItems: 18
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
> +      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
> +          on platforms with an LCP/SRP block such as QCM2390
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: llcc-ecc

ecc

> +      - const: llcc-lcp-ecc

lcp

>  
>    memory-region:
>      maxItems: 1
> @@ -234,6 +244,20 @@ allOf:
>              - const: llcc1_base
>              - const: llcc_broadcast_base
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-llcc
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
> +        - interrupt-names

Please address other comments/emails.

Best regards,
Krzysztof

