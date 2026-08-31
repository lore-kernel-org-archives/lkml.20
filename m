Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941438237F;
	Mon, 31 Aug 2026 06:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159112; cv=none; b=SHiijNeQQprp9dWR8OSI2P3U2zqb17kLj2sPjeJRt3FLxokiCLqG3WYfqQ6RyZSSMchczth4gdBSNjNlm9qa5d7rwikNoBR001y2D2aS0bCKLzN3fUFp2Q+z5anRt9F8f3JYy11/m999tomtcZ46h+id8ri4jZ5p7gRs1hsQnf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159112; c=relaxed/simple;
	bh=xuCBqul439Twlk323djjdnmcBJzEb+URxdEwPmrCVcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rT2UYqcSbRKaBKgqgAab6VIl+vhrp8M40HEsGHEa/DpRRv0d2DY8yVjQjm/tgSjAqVtyNufqO8v1mO+VGZzW4p27zVFzxpvWa0N9Z4Pnen+GAdR5Qag5MeRXoRDxPZcbR6UfS+IjTeP6owmcQ1115yiWFrr3m61+6VFzILuxpEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrfCzTmL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrfCzTmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489971F000E9;
	Mon, 31 Aug 2026 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159110;
	bh=P2PM5a+UZWdJ+WhQDBOum09NcVM/9sTxmNiXpKbmfKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GrfCzTmLRK/rsL/k2jvm2HUYovq/c1GNWmqevw5OxuJVfi4pGmIo5FBWfrOTlFlKl
	 Xiren5WGynHp951w6f7iWfuC0KZMsggLkqQRVsPUgUMdlNC0ArHvw9l5xeXKS36+Q2
	 xMJ29REWyGB2YcPS4HbYz72EmvnOwR6oMPbNK42XdKKus59mm+g/Gm12DbUGPTNyRl
	 5YjNPcxL1vhW5lTlisgw19t4o300liF+y2TiRwpiPBFzudIfnC1qz50+0JAtprzAN6
	 4DeNtWZjBjRkBkkJ4rYlHkd4FixCwX5mkzbnPx25M2WXl/EIh7zJJqMTJCRhCw8Z9U
	 fplQKdUVjqdJQ==
Date: Mon, 31 Aug 2026 08:51:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Message-ID: <20260831-elastic-turquoise-puma-f032fc@quoll>
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
 <20260827122127.18874-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827122127.18874-2-ansuelsmth@gmail.com>

On Thu, Aug 27, 2026 at 02:21:20PM +0200, Christian Marangi wrote:
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    phy@1fc7f000 {
> +        compatible = "airoha,an7583-pcie-gen3-phy";
> +        reg = <0x1fc7f000 0xfff>,
> +              <0x1fc7e000 0xfff>,

Sashiko has a valid point here.

This should reflect real hardware, not current driver. It is very, very
unlikely that hardware designers designed a block of 0xfff size or 0x4

> +              <0x1fc30044 0x4>,
> +              <0x1fc35030 0x4>;

Best regards,
Krzysztof

