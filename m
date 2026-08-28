Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE093AAF76;
	Fri, 28 Aug 2026 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909800; cv=none; b=sfdM63kcyd4vPfzhnk+nu7sa09kLodC/RnRzrLeleJ2y4Y5//T33y5nEWnz5pOIFA9M8FZLu54UrEk+prgGA/qeBepUHCKeCmUHo78/w5qsLdub7mDhFayU4fhAJJWyU5bmGSLwGzGXj0xBgxD2XXMDy60SXhCMQ66CtqHWBwMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909800; c=relaxed/simple;
	bh=ra7B/CRlCkfTGO18ujJxPnwd+JnlEiwTGId3F5w9AWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLUNpzk3LC43dF+8Dy7N0AwiI1AOZ9ES33XGE7iQthZzeYaaFNOcjIN7RdJu6WI9XfrRpbw0fz0IKQ256wr1E/wcbH+loed7Ti28ARzrYsbsfLwfV93scXOdkC/fOrX7xZC3k8mtR6rhrTqCgALKRFuNK0EkpzRgnn47MjhMCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJEvjfWq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJEvjfWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584221F000E9;
	Fri, 28 Aug 2026 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787909787;
	bh=MwjUAXNUUvz4D6ldzo7m5AsPVasm7oVJK4lkRaOM9Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJEvjfWqdXlStH93ycQd1tqLvl+vtd1gRjU9Xt0UMNq98BolvrQ3O7MqHpoqqJFH1
	 xQg2NPYkhkijl3LzoMhXFEnkgPvEoaYo7FeZ5k9qngwtt7x0Liz9AO0FjRZpo6UF7r
	 5yExlEtCBu6C02mbJ6s10cZ+qxv3lGvE/NfVj4QVbmUktAm89wWDrEZDXg2/+40tqG
	 u6uqr4PnFIPJ5JfX3T/vOkWWaVw2Vc3P86zNPNYnTWg62I8ubjnR/hynb0Ej/PggNa
	 rMDiPWlfSeHKaWB0YrDB+Wx9m2WhLSiAdz+nA2VlDI3ByFA5dN7XKpoWzJqhgq/+Yl
	 tlfmpXuIvDzNw==
Date: Fri, 28 Aug 2026 11:36:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Message-ID: <20260828-encouraging-cricket-of-energy-1b96c1@quoll>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-2-257d68a3210b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824-phy-v1-2-257d68a3210b@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 12:07:42PM +0530, Varadarajan Narayanan wrote:
> Document the IPQ9650 USB high-speed PHY compatible. The PHY uses the SNPS
> HS 6 nm PHY fallback, so allow it in the binding.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> index 661759b25064..405bfad2080e 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> @@ -20,6 +20,10 @@ properties:
>                - qcom,sa8775p-usb-hs-phy
>                - qcom,sc8280xp-usb-hs-phy
>            - const: qcom,usb-snps-hs-5nm-phy
> +      - items:
> +          - enum:
> +              - qcom,ipq9650-usb-hs-phy
> +          - const: qcom,usb-snps-hs-6nm-phy

I would prefer if we stop adding more generic nm-process-based
compatibles and use SoC based ones. Both as front and fallbacks, for new
devices. I know it will be inconsistent, but OTOH each of such pattern
encourages people to replicate it in new bindings.

Therefore, add simple enum at the beginning of the oneOf like:

oneOf:
  - enum:
      - qcom,ipq9650-usb-hs-phy
  - items:
       ....
     - const: qcom,usb-snps-hs-5nm-phy

>        - items:
>            - enum:
>                - qcom,qcs8300-usb-hs-phy
> 

Best regards,
Krzysztof

