Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BF7396D14;
	Fri, 28 Aug 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909532; cv=none; b=dzp9L7s4pkdmURvSJns1/ZpU0BWEGoSBLZW+LwbQnIOWLgu3xFMVYjRfPhocju4Bae5Rv4Ili1ZQ05iX3woyJQB4ehslfgVDKpV24o+oB0PL8+yS6QfKrwt0HhBXdvpyqgU3zdpRSyO9HlC4DBSUypkqLJzoAg6DmLhhRN1xDxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909532; c=relaxed/simple;
	bh=q0ilHMrSoXKp5cHYP4jEq7MhLnwceqbNN8GivVnyddk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f40qXwCfK5DznNbvdWtqfj2dicJ3q7hPSOYJfVLYrjQkUxWACBOACsq4Ggex8T7yKXr+5AoULM4HUvTVCmVIqPyhJuZ8CqNsfdg3/lfXZxsRtw4xva0Cs2n+zBIxvHYglPhjfJEjwZuzQlaiA51BudVYwnTh1JX0hjNxt28f9e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgMCTpVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgMCTpVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE751F000E9;
	Fri, 28 Aug 2026 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787909524;
	bh=SWdFgHXgcO6u9mKiLK8HiS9oTMZunLS3Odf1SczKC9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DgMCTpVTqpZ5ORSUqJUt4fLSNxg1q+bxaD3HU/mipuCtR4wuV0zCQcYETfGHw0T1W
	 x1Dkrcsf6Z6lL5RcNdghVjbsXO3vbXmkCCGCWM/qnqsFX76etZXjI1W9MrBWhJtE1j
	 zi7QKAz77ryE22MBr/s4sXwIzFEj6yZHy9R8z+2LwoEmtsu9Dj/co/4QFUWkEsJU2H
	 KkEV1V5m0UjllgrmR7+91X2QqDPrVgBu1fEM9GRKaLLdLbi9HATPUDbMmFWdCe65y2
	 fXU2m+yxRqVbWwngJVOaAhSJq2bJ+dGKen4hblBtJawE+vTUvCXUWjuv5g5JflODPO
	 ygi2rIyLsoFrQ==
Date: Fri, 28 Aug 2026 11:32:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
Message-ID: <20260828-active-tourmaline-doberman-fc680b@quoll>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-1-257d68a3210b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824-phy-v1-1-257d68a3210b@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 12:07:41PM +0530, Varadarajan Narayanan wrote:
> Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.
> 
> Use a standalone compatible because the IPQ9650 PHY has register
> configuration data that differs from the currently supported SoCs and
> should not fall back to an existing definition.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

