Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192366;
	b=1WLN3IQkQlSmHKB/06XoKpn0xoe03IhTyYmF/BOamqqbbjygvvx7XO/X+ylfyudDL9FJ
	 7XwKrzm56CvFek5NiNBMxamgVBP3GylL0NjsfuKuOk1Mr6yglQ9BcW4BhuizSofpAzPxh
	 HdrUE8ux1ugTkknNyLnegNme+s2Wz/EXkFpTT7WuOVUGt/smgXVw8lDlADAT1Dytut4dF
	 Oq3XAyfRSqLExEU45HOx97LCDuPPvKmgk/Yeuz5feG/AvKVPGZF7xhkcf85F17Iua8w5O
	 OGqt0/dtDZlDZzKiaT/QNLove0TzB/HLVCvlq8ez/qBAODIfy+Yk5eQLkQmbfzDg6aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192366;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AVsMoMAioRRg3QgeW2n061GklGCfmXx55YHt1OOF0Rc=;
	b=ffPRAPl+72xCkH+CpeEkkdnnb4781k0arsu3T70FsH7EfEzUPZpXw1gWfZAQ0Qvo2HGv
	 Z9JW25cwIUsADXW/1BtKuLULoxpxN1COg90Z6MuA9pNcZARPRYeimwlP22LSjzQgVCdYa
	 nlJX+3+iLQIhxzNN0zGv3ezxvDOGI+gJMXkXpaTb1zhIR/wt+3y0wJa4XjLJoCQo9SyC/
	 u+jf5zbfnBuvnQAu/24PoHw8VBCUNBrLIH3A66NyCfE7YocaOayhyVVY/+P/sNjr2mVmf
	 lLXwmWROlxz1SdIXHAeqmR4ldnDT//AOxZs9TNU0QQoWqk+hblhxWVlS1YJwBWqh4/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmbrrQyG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF909606A31A;
	Wed, 28 Oct 2026 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmbrrQyG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5783D1F01825;
	Wed, 28 Oct 2026 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192365;
	bh=AVsMoMAioRRg3QgeW2n061GklGCfmXx55YHt1OOF0Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NmbrrQyGGM05k158KvD50ijX7lp00MtT703y6fmg+avBX75Z0V6nDlF/CSamSSeKX
	 1GGHCanq67ZdgNt0VjwUU4WaRVNSXdxTVBKEeBYNIsztxKoLC9WKMyJDrOeSarB2bj
	 lb7xm7ERMQWSdACDCPmOu8UPes4u6OBbGQumLyNe59+niAXsOELKkATLMNGj5eB33/
	 XGr7CWIdcTbj7l/dvTctND36891R+LPKfKH2k+sqZfMr2tmA1O1dKZsMK/14n/4osw
	 taMWfVX2oI6cjH+poj1UfuTdQzRgUSmd+FJ0XyOZOYopSyMv4C6GaeiGcB6Sr8BETx
	 4eqYyX+q9RHtQ==
Date: Wed, 28 Oct 2026 13:59:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
Message-ID: <20261028-nice-infallible-mongoose-3befcc@quoll>
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
 <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>

On Mon, Oct 26, 2026 at 03:11:17PM +0530, Hiren Gohel wrote:
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        phy@88e3000 {
> +            compatible = "qcom,sa8797p-snps-eusb2-phy";
> +            reg = <0x0 0x088e3000 0x0 0x154>;
> +            #phy-cells = <0>;
> +
> +            power-domains = <&scmi12_pd 1>, <&scmi12_pd 0>;
> +            power-domain-names = "core", "transfer";

Please make the example complete - also phys property.

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

