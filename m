Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C022C15AB;
	Fri, 11 Sep 2026 07:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111956; cv=none; b=Jb5hyVX8v514fqVs0hDOVJ+JSFX86dKn3EywjZQjixWvO+g7uD9fxAVoPQOhOVDYlqwYO3Vb6QxUpVkjO0dZjOKeCNUqXU1lLwTV878wCc94B/MazgqK5n6QO7EsBEKTV48K1IB9rMRg15pYt1pJ3evdc0VIak/vB76LrHvJjKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111956; c=relaxed/simple;
	bh=w44TdE/4Ruy1y5q8d/rYBXLRyq+uivaVMMlW54veDtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geA+A7/icVwuYTxjGfyJrzsvn1NwyDmWJc1NRbfSvGiVnnzN+KDFwBOXMGRBmCcg1GYL0T6DAwP5i+BpbYX+/NciGCeTy/rjRf2SCG7jcOuecjwHVJIKp+P2E6dXWmGJfVrHfMNqPhIgW4mK+qiPQKeckW9MQlVwskNcc2ZlNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlKgjykT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlKgjykT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2411F000FF;
	Fri, 11 Sep 2026 07:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111955;
	bh=ZdBRWhexXolLx9DvgVpP9EDlgW3sq+myZ2NLPsbIFQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mlKgjykTcQQAdbrc/459mbo2yqVFVB9GmvYVR5eaFYvAcHQItYrTgJWW90JZd8k+T
	 pTbPI2QeZVBaLDaWQmzmiurCITD3bA+2tyYwcrFdKXmQzH80eg4KbaOIZCAsJvSlbr
	 uJniBPHiLBMxP4VXuWANlItaASwDmQaerqXEsSPc2Rb1Xoy7jW/zVjTt/PAfKBCPlO
	 o0+yCBue2lywIoion9lOgdMSHGyWe4Jizr2mDT/7yBWAmVCqmMQVbpU6K1dC855tda
	 LkaXI5Vopf3gD0vqwdgtLeOMJPwIHbaC4yLZSlBPdq7iJDR4WOjWsMY3zODOqscnxB
	 BqYZqFShr73qA==
Date: Fri, 11 Sep 2026 09:32:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
Message-ID: <20260911-weightless-slick-ostrich-cb88ca@quoll>
References: <20260909182641.165383-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909182641.165383-1-marex@nabladev.com>

On Wed, Sep 09, 2026 at 08:26:04PM +0200, Marek Vasut wrote:
> Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
> The board is populated with four ethernet ports, QSPI NOR,
> eMMC, UART and USB host interfaces.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

