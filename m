Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BF33D9DC3;
	Tue, 13 Oct 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882980; cv=none; b=sLve0tysGSoyWix14U9uXbnePa0KDmATmcFIYh4dMv9vnt/rvwnAbN010bSux6GukbAk38vrpA/wBZv/fGhaVycTH5zkKR7WHZttQ+lzOfpzaygwpK84EKibqaiZ+/6sSmZy3h1dfanjVfFpiKtzuogsihT96bZAiYcdyodeQ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882980; c=relaxed/simple;
	bh=bcKxVNeEK1sUyCA3U9VemjwGMlXiZJjpBNA/M70D90Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klEkNHfOmDgPkm0tO5LiLn5FeMCYZL48beltSebEUMBZ8Y1aZ9oBX9YEvw9j/e0vPBupU2viHsiYVEMZvFdQLF1lbyYkt0714Ny+aMe49LdbJVN9m2rIoc0xNFZoLNIdm9s4pBC0UGl4zGk1WNB9ZYPtoAkUVEuisCiEUbl1ow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6oM1hiG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6oM1hiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F0D1F000FF;
	Tue, 13 Oct 2026 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791882979;
	bh=lZvMFGFk2BKg0WNDKXe6n//sonG7CIXvfFamt7Y292Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O6oM1hiGjoiBibjV5aKt0CScEQb75jwjsTGG235Qakdc+ypA46jkRCnCOqXPt2PEL
	 PXC0gvdL4P1eVtEcArPM7KhjJ/cLiEG4VugyKJ4ih+GyRz+6gMAnSECMFOiJsQLfd3
	 C98UQhM2vEf/k0lwzs3X5GvqZ40TP78JLGFDotPK5JEdAe18AZiAu5PFKVTxn0vzPX
	 tpt2YJnDIH2sSTxN0HXpFTeglwumL7zORFkUTKJUBkmv3BUx1/EeDc8ZeDveBg89/v
	 UJ3uaV1XYrk+Ls+VtBR+rtu82i3efzQp73oLqxwg0cuirv6agwObhjiwmM0+5fZSFq
	 NuR6Ka+RRbqog==
Date: Tue, 13 Oct 2026 11:16:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Depeng Shao <quic_depengs@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-camss: Add the
 CSI TPG regions
Message-ID: <20261013-precise-grateful-heron-f6ddbf@quoll>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
 <20261012-sm8550-camss-tpg-v2-1-06dbbe36ecd2@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-sm8550-camss-tpg-v2-1-06dbbe36ecd2@imd-tec.com>

On Mon, Oct 12, 2026 at 02:52:00PM +0100, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs.
> Allow their register regions as optional trailing entries.
> 
> Assisted-by: Claude:claude-opus-5-5
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index 4b9ab1352e91..05101dc97711 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -17,7 +17,8 @@ properties:
>      const: qcom,sm8550-camss
>  
>    reg:
> -    maxItems: 19
> +    minItems: 19
> +    maxItems: 22
>  
>    reg-names:
>      items:
> @@ -40,6 +41,10 @@ properties:
>        - const: vfe2
>        - const: vfe_lite0
>        - const: vfe_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +    minItems: 19

Please update the example.

Best regards,
Krzysztof

