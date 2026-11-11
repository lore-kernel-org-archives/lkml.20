Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398580;
	b=XPp2sgo/8M8Si6qCqn3MfkR19wB1fh6SaPH9K6ASFGpOBkK6wOVD7JcvYyoOoILw4rk/
	 5B54rPnV8Levvb0GdElW4/BXtVcYwWVpRRxgxMdZOh2nGBWGzpugtUe/gS2+E6/5LP362
	 5gWb+A8aWHgXcL+f74OtbkDUUP5GuV8UDXPpiVtBUAKIkR8Q9QrrZ3szrzoLTkYw/k2Vz
	 ihFex9fVDJ+3WB/XmyDZSowIixbbL0hrR/k0s7/RyWUvDcNUPesC8PKNF5AsBfMgcL+3h
	 l1L6EOPEKeYBdXApJwNphJAkC6rKDvKLnQoGV3kHV7RCLhX14nMwJ1vPy9/DV8/RQjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398580;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PKdWylG8CRgvWsNdWKgk0KFKlCoBfTUxKT1sRIJuRJ4=;
	b=Kenjv4B+z2GnA66ROayWKJiJE6Nhu+GEOv7d8Orfd97pBqmtGQdF78n+deVPFRlzqOmm
	 Hh82u+tg+FVjcPR3964g7psaaCEmVPgQsUeejn3Tg1uZBHGZ6QlUc1X6ygqDbIcLDJoT+
	 WU0Ww2yN8d4XMKRsjVy//6w6DN95DwgEvuo5fCOLG3AAei1cgLbhzUl9O2Qcml8F7ePY2
	 ox4L7pjmaqb0Qcb6vxUmwetRKV/jwZTp6MUc9WVtqD0g6NGZS4Juc8xrVPc/RF6po0AUB
	 MsELJ/gQDM75wdpvX0EMsE+GnimP0CuIwpaqPvM857QlF/h0bXNpTfrsXoXBzyJEzGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Chj9EU6S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E795606A89E;
	Wed, 11 Nov 2026 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Chj9EU6S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FB61F00A06;
	Wed, 11 Nov 2026 12:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794398580;
	bh=PKdWylG8CRgvWsNdWKgk0KFKlCoBfTUxKT1sRIJuRJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Chj9EU6Ssji+85SFufWOQHWNPR1jsxSTpZ6tUuFe1l2SEo84uC/aOs7PfxCErwa6Y
	 ES2MdNKae8q9jK6n3KpyOog9Jo3cH0PmUZbtF7Kw8bLiVPSpuJXkMIHGk7iW6QehLF
	 /zSb3YZnf+J/XDKcg+LmjCG0rf38AFJiRfHc2FdFaf/LfBF2IC5Mq6qXGayIVz4+nr
	 aznMz/HhGC7s7tw5VYdxAJt8XgRo2CG4o1666v+EHzNC8Iu+YbL0+/4dNhVAaMRANy
	 r2QVTV5aWJSPyJlwQ45ExWcZZ4cob6FkmUOsBApXLcpIvNOiqn/DrdmKY+UvFiUxbc
	 EP/8PCMKo6btw==
Date: Wed, 11 Nov 2026 13:02:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com, 
	niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv2 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Message-ID: <20261111-tunneling-elated-grouse-1f8bf7@quoll>
References: <20261109162523.1698129-1-dinguyen@kernel.org>
 <20261109162523.1698129-2-dinguyen@kernel.org>
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
In-Reply-To: <20261109162523.1698129-2-dinguyen@kernel.org>

On Mon, Nov 09, 2026 at 10:25:21AM -0600, Dinh Nguyen wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-agilex5-ecc-manager
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 7

minItems

Also, missing constraint for interrupt-names.

> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 2

interrupt-names: false

Best regards,
Krzysztof

