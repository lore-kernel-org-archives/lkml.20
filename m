Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959454C6517;
	Wed, 30 Sep 2026 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769101; cv=none; b=jEZH/C9/z+QDY/b9cE8drQLF05umK+MY9IGQpCdkDznYyJfDRejwKV/IwdOm1SqO6fqsDtw02DpKauZ7Q7e57A9elec2Y1S4qi3iaEVk+GJUsyR5HetWcJki+zydrJWdem9QY/8Ib3tfeCQaiRBb3JnrW/SJGZW0yfAbUuDmVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769101; c=relaxed/simple;
	bh=RyJkjxj03OYYik/R7DEpTKKnsoCFfxjrU2d9d+MOTmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnOmyaO1fX7MzzftkzEAsEgYIwmVPRW1Mm44yTeglgZisWFNzHLHWAB/+DsvchH2NnfJb5JB+bbDAgP1o415zS1ghNnq/W9N0F92kxtLD8bWKQPyJigvi5gPjPMgDYBIVadmuiII9qH2cYHJoiUkCa8Dg8F8PPWUuQPfJXQCXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdbWBHOH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdbWBHOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5531F0089A;
	Wed, 30 Sep 2026 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769100;
	bh=5FnIwsTd9J8v/KNbdey0dWm3okoZNmXW2AFmd2MzMj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bdbWBHOHxafx4KBMkmYVnIvHGlw7Q+9tfZgO8KhSNkwHLoor/uZ5INupb8qBSsTHU
	 cDn2gJLtic39vqH+1xwTnwm3kgY2vNVWQ7dEqtN4t7nw/24lJ+0jDrWlwLmnyIKvYS
	 JpYPe/oHpExEjRSErKx5JNTb4aXdpUjeBwqO85EIC6XKS5mginwc5c0kbLfh5cF2rO
	 pVFdzAo90hH+jIIpvKbxPJwszH24xBzdm69TqCqufzuMUXcIyEZ6fFJ4MeOZvoRh7M
	 d/4AGWIkw0Av3SHTt/EuHXkGVdE8OZ3EVhx9jbYF8zNhcK3U9EN8ZB1ubOgtgPzSbA
	 y0YGn+lRWmcgA==
Date: Wed, 30 Sep 2026 13:51:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>

On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
> Document the Milk-V Meles board compatible with the TH1520 fallback.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a5915665c6bb83309fe53 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -21,6 +21,10 @@ properties:
>          items:
>            - const: beagle,beaglev-ahead
>            - const: thead,th1520
> +      - description: Milk-V Meles single board computer
> +        items:
> +          - const: milkv,meles

Why isn't this enum with the previous entry?

Best regards,
Krzysztof

