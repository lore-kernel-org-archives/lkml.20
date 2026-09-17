Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152D34DE702;
	Thu, 17 Sep 2026 19:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672842; cv=none; b=aEb8Z7tOHHpS2UiYdtLqLxVZ58hHYUVX6JTf1e54rHNvYXMtnwuVDsCvG+lsdmuWkCLWj9Xbs3iVyJ0FUk1cBEKxwNepqgrJu38xhq+njiPWsP/1sfvQYCXEgrQOIPewpPSc4TRKq5AiC1gvjF1buS6y4AIsidnzdHL9tRGaWCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672842; c=relaxed/simple;
	bh=4aNjK+MY2PxCRMsLgrOBh3cFKTjhTtbEzktW14kcx4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdlqcK3zQM+vFF4ACMNX3ofRWiCvCIq2QOSQiR+Q87B7bOW4UBtnSMT2iOmZtxoKF41j5Ha2CVW8hTuV2JvwMCEYCkSGhvHneDQ0SXSqmXgnsScKUIutoc8sJ3Bq71pfaJIIIFoisopXtHJOf2Un3QUTPSigvF8jWBw3zAEhfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfVZ65pW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfVZ65pW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656371F000FF;
	Thu, 17 Sep 2026 19:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789672840;
	bh=RdZhIFKr+/ykZ/FXVmXK/8306iX+YBcrnZh2r2wTCXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EfVZ65pWur9fi33CkygIiRki2SOZEzY1iPWxCjDDtlKJOmlM0VZPLqCrtAaYuVEol
	 ZqZQov5JmvIB1DifixexnIELMSIGFJi5/HEjOW0u5/Vcg6E9dTu8JJwIwRTJtVjgw/
	 VVk85O+fZJ/GYdRLqMMZmygCzEF4I1QL9mv0pRkJN7tJ6mgisMsGs8x4lWOvD+HLTV
	 SOTeOVvl+nNCjUY2EbKRNmdlZGb8B3SjTuOAG2VEfJ5sD7VbEmx87hycde7Obg07G3
	 AlLsEt346A9QTgdj/0holY8CPJNsFuHutErTFqvI8+pMWzNFdyaz/6jq25Ij1hWlmh
	 PIIAIGcWlrKnA==
Date: Thu, 17 Sep 2026 14:20:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ci-hdrc-usb2: Disallow ULPI subnode
 for non-Qcom variants
Message-ID: <178967283749.3280807.647839980766180900.robh@kernel.org>
References: <20260820064651.69739-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820064651.69739-2-krzysztof.kozlowski@oss.qualcomm.com>


On Thu, 20 Aug 2026 08:46:52 +0200, Krzysztof Kozlowski wrote:
> Only Qualcomm variants can have "ulpi" subnode, because a specific
> qcom,usb-hs-phy.yaml schema is required for these, so disallow it for
> everyone else to make the binding stricter and more precise.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

