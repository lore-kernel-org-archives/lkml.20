Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBE5424D46;
	Mon,  7 Sep 2026 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779346; cv=none; b=njIPotEYtHhz/y0kduXr+s2d4Wsk8RUr72jaeydMqowhe7iEuhWRCoAzAVoPxWJZrHxKOBO2F4GQCKbb2W6M15YUm94P/SnceQxKevJEMy7bx3LMUNtvX07bUXbQku4VqT3WYu6U9dT9E9ZLvztCAMXbBsUyZX2BWu0BMcbDwXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779346; c=relaxed/simple;
	bh=ZSVTuPs4tOQ6MilLZ/YlpwF9UnTmn1TqPf1+uC0eVrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fO208fhJOiihainGRbwFmxw23SumHzG7H0QjJS3EaZuuKa+ePYBXa+/dDJ4uXj5VGtHNMb31uzpCMiqOfjZs+85ae5T17sDcg0H+lRNiTa512lsc9Mz1ahzvKnfFxAi4y+fLZCz5kTHxLQMdV/Y7NHNa5watYmiPeCoELyn48xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFRA5riB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFRA5riB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168EA1F00AC4;
	Mon,  7 Sep 2026 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788779344;
	bh=MKOffp+QRUepLWRx3cEKj7QDgchxuXLg4xrZKZeAQ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QFRA5riBpCuv+vbNl+CkpgU7Oa5X4VL7v9uTgFdKCsZE/uRkdgQ3Xchga9OTq1Wac
	 YtiFJ2aLjhWoWSpxJe1p+HuSMe64AiMJdr5UYfe5taeKhqkFCTr8NYZ3l8EbjIgieI
	 UKRM5G447uSAfGKO5u7Vknv3OzaY9BoPPzSDXhqs/87j5yu2OOyPTonxZ1tAjdoseK
	 lp+qd5YdoqFJTo5mkQGrlRPG7iZdm96qK5N07Zd0mnEab/NNYUCcZ5XgmfuX/bID1Z
	 ANOIT+jvFy2SbnggH+HKeVdecXy86Vxptl34doTAGx/RbrLBWbzmU0PY3kbhbw5/ER
	 VkXRpyZvpaQzg==
Date: Mon, 7 Sep 2026 13:08:55 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 02/12] dt-bindings: phy:
 qcom,ipq5332-uniphy-pcie-usb3: Document the IPQ5018 USB3 PHY
Message-ID: <fkbmx5yyp65mp2qknnd2lbde5scfmr5dpbox5x4j4fu6uahtnl@mxx45aqojrg6>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-2-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825-ipq5018-usb3-v3-2-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:19PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Describe the USB3 PHY found in the IPQ5018 SoC so add the compatible
> string for it as well as the required resources (clocks and resets).
> 
> The PCIe and USB physical pads are muxed and selection is done via a
> control register in TCSR. By default, PCIe mode is selected, hence make
> the property for USB mux selection required.
> 
> In addition, the PHY requires a 5V supply for USB3 mode operation.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml     | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
> index 0d9d0fb405b6..1cd5392a1a0f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,ipq5018-uniphy-pcie-phy
> +      - qcom,ipq5018-uniphy-usb3-phy
>        - qcom,ipq5332-uniphy-pcie-phy
>  
>    reg:
> @@ -93,6 +94,29 @@ allOf:
>        required:
>          - num-lanes
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5018-uniphy-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: usb3 pipe clock
> +            - description: usb3 cfg ahb clock
> +        resets:
> +          items:
> +            - description: usb3 phy reset
> +        "#clock-cells":
> +          const: 0
> +        "#phy-cells":
> +          const: 0

clock-cells and phy-cells are already part of the top level 'required'
constraint.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
