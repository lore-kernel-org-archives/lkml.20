Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C64E3F4DE9;
	Fri,  4 Sep 2026 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566149; cv=none; b=rJuE/SN93hkSiDPNT50OGeqxsu3FhUZ225WEsjI29o96xNU33USJLITjnwj1qwZlpAXLJdqKIt065+Emv6mqn/OLSdKnPHn9STeh2SO87/p/01G/402EI2ptslKn1uIvJrFvcHdv2K5nRB8q6hrU3ZYVvdh+gT0ElUNCCRsu/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566149; c=relaxed/simple;
	bh=e1Fvwee9ykkRm2BnUOXutmtcnfPVhT9qzu91xIfqvlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCqAP1bCA8cfOczNdpelAlS3FtCb0g0CFNGuqFT4zqJdZNINBhK/yiAUAWuQS+w3EmorfpWFGLdQb7tQuTq5zf3JI04ZP6CL9uX/HdsC/WZVhPlVqcaCGv86y9DQeJb+AQcI49MN8fGg/oE7mKJxBrCCXz8w3p/SI31W7uPAopU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9lUpTGQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9lUpTGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CF31F00A3D;
	Fri,  4 Sep 2026 23:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788566148;
	bh=0c3oGstG3xDxCXANdh3fAEvUFrpWDHb5nmqT1W/Ldvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l9lUpTGQg78X2IgeMY/eRTQmMCZ6ao7s1+afbEuxXWapwpHDJrA0jp/JvZnXsSeiJ
	 oS/l3ZJepGUQ/A9ARtwR89mGz1mbWu7+UiJnMmD3gtohKkwWSW1QaTDH0MFlQC7erw
	 cYbI25bTNd1ic3OFu8s5uHfMcq4zaR+rb5yA+/IJkDrrDLKmvXqjDL7Hu6fcZTR22U
	 P+9ibFxkOABgyDbXFEfu5uyiFKhRv7UtZj9AoCgcxqhjXHObMUuuZy5v44OnAgubPT
	 TB8dpYVq14yt98KsWXWWZl0cv4Pjci+PWJ94zdrlPq9K2npgf2jck/dySHPYhdcrui
	 AtB+7bK7kLNsw==
Date: Fri, 4 Sep 2026 18:55:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com, me@brighamcampbell.com, conor+dt@kernel.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert
 to DT schema
Message-ID: <178856614396.2615846.11646781132094655887.robh@kernel.org>
References: <20260822093829.46295-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822093829.46295-1-challauday369@gmail.com>


On Sat, 22 Aug 2026 15:08:29 +0530, Udaya Kiran Challa wrote:
> Convert the MediaTek G3D system controller devicetree binding
> from the legacy text format to DT schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> 
> Changes since v4:
> - Add Mediatek Soc maintainers in the send list
> 
> Link to v4:https://lore.kernel.org/all/20260326181726.64957-1-challauday369@gmail.com/
> 
> Changes since v3:
> - Fix $id path to match new location
> 
> Link to v3:https://lore.kernel.org/all/20260325181509.3430-1-challauday369@gmail.com/
> 
> Changes since v2:
> - Move binding to soc/mediatek directory
> - Rename file to mediatek,mt2701-g3dsys.yaml based on fallback compatible
> 
> Link to v2:https://lore.kernel.org/all/20260323180616.23333-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Drop redundant description for reg
> - Drop redundant description for provider properties
> 
> Link to v1:https://lore.kernel.org/all/20260315080302.454233-1-challauday369@gmail.com/
> ---
>  .../bindings/arm/mediatek/mediatek,g3dsys.txt | 30 ----------
>  .../soc/mediatek/mediatek,mt2701-g3dsys.yaml  | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
> 

Applied, thanks!

