Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481641;
	b=HYbadZX/YjQZCrntQK7NDVtiXTA4NaIGWp5XeIBBN4+m4LuhrzfZOP6gnqzj7bRpBYv3
	 2K+9tzLMncqtSGWoS4ZxwGqNR51g67wE24R4Pb988A+Xt3kdmPIPKWrBDNEfY+lMrgySd
	 tyBhAsEjHIxuaOK1Vkd3Ze/HBDUyKAPWaseQ7hASQqqBrbVs/vGOOzcVwqJiUWzf58Oh9
	 pLOQmtQHcwMQ0DTo3kxKQHt8nl5JdVVcg3wWIlvspGLTMqMO/QNahO9mpGGcqp1ybjDZ9
	 ZThZoG5qO/hh7CsjwCOBZm52/tR7WOv/1wHc+PLIOf/Ksg5wtmqqeYXEiKGmg/a+Hgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481641;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qWeS0NgDvcKbIEpxfzf+p16AQC0TcpaMh9jlYpEYTd0=;
	b=GA09OXlDP1Cyqpd6ooxVlzAdU5oWzuIb4s+7e9kSsxe/7KicGe+dvIwGIjYKV0O0LZmP
	 jgK/5ZBhpLmogdSjYs01/kpH8y/ifT5PmD+GDKm90s14tWttY7RVnGsKs5ssw1FyC2vlk
	 5A+JT59yV2iVeuCmncFNVQXwkG+xPVJlb00DfEZQchHPL9VFwVijfWIDtiLY8IF3Lgr6f
	 TywYhWspzJ38wGh9bjHmz1zr9PYnOY+E4cj7Qqrr+e/cTJKx5MGC8KnQLGHNdmybK2AwD
	 NfeHiLkLbhiGxeE8ZE1znMuCDyRj5IMd2uyASnsOkCSyZwtnNjFwvQz339YwwjpIKxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QhaavtxU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518F7606A31C;
	Thu, 12 Nov 2026 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QhaavtxU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC4E1F00A05;
	Thu, 12 Nov 2026 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481641;
	bh=qWeS0NgDvcKbIEpxfzf+p16AQC0TcpaMh9jlYpEYTd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QhaavtxU3Cm/0IiltpMBMkzhBEsLePlMEHpQEmlftFSzjCYvqxNk9TxD40Qf6at8l
	 vvGgALTEByUzOh5Q807X8FoGvVGQZXcvQSgz/JmJwD00HwVV4o6w037ZqtM9wTgnK2
	 8qrMerHZhm9y2SKYwPHd8B58lzGTo5Nrkivt79K5kjw4LITM4bkyQYby1eZ7R6+dLy
	 GBBq+2xG3/ZRn94s7ylcfP672ZrT7Cz/BbD6B7EstjbKrV0C9wz60RPaOYNUKYNo4g
	 2ZAwZ7H2nvPgx7dLiFFYA98QE7yRzvswBu/sC++RX9cQcWg3JDfGUVxOyJwwRfooaV
	 0d2DxG1Yg0yUQ==
Date: Thu, 12 Nov 2026 12:07:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Message-ID: <20261112-hallowed-cerulean-viper-fe5d4b@quoll>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-2-cyan2254650260@gmail.com>
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
In-Reply-To: <20261111162917.97532-2-cyan2254650260@gmail.com>

On Wed, Nov 11, 2026 at 11:29:16AM -0500, Pufan Jin wrote:
> Document the ALINX AX7Z020B development board, built around the ALINX
> AC7Z020 system on module.
> 
> Link: https://www.alinx.com/

Drop link, pointless in this context.

> Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

