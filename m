Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556604;
	b=p2yn+WHik3y9YatAaGL9o/5/688XwAnI78jsJq//wUR5IA3wi+IhP1/kq6veDr57LWvv
	 K9vmsvFGcz4h7Y7qDH9s3Zkj3gyFIOmbbSESyQujk/Lfb0DM8j0FhRPyJslNboD5eCdkh
	 ZWxzyEbHlSJvfcihSWunkmWSqT4lCxjBJyYQAE8ZudSqxHkADzxF4N/GluX9bwe/QOXSb
	 hFFwncRgjsswaD2d0CrjzUNx58PP55+fj5C8SShGKVRbWVMpXj0ZwvezvoTEagTTTHuhf
	 1/t1zG2lDBvZ9vtnK6uXatv4S3H0BZrgjXQ6HTfE4RCWVoW5NEbTyNCYQyGVjnD1uTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NtbrLJPcPp2H5QaCnDkh2crwBlw+qLqEnBmAmeqQoz8=;
	b=RXO8hBTiplRA48g/r8hSCuJD/tUcLWUv3J+TkUo0kf40kakVhkxKfD2+x6wC9uCjkPvh
	 8oiFzFqIUJfbf7hgcimWYBdBp8MQ9UMqr2/4wme01PIci5FoyTQlaMGMhWiczKfVscY6x
	 xAwpQ9tdaVzgF2H+ENuWEd+2/uQU0WhTFvVCO+2zxSqbKgEuYcqb0BRR5lK0f/Cy+N60K
	 TlI9GARHesn3CQiGFtZ/q7B13fwJmI7gS3R5M7Zw5ZApgxZQZR3vsrb3ZGprFrEiIPPj9
	 +Jgb9gdpIC0OapFVuAXxUzOva9EauJnnHeNwWxx/Xo/oeK0CAPNLuZ3KhiKoQBMSHLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMjRFSFx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE6B606A321;
	Fri, 13 Nov 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMjRFSFx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290721F000C4;
	Fri, 13 Nov 2026 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556604;
	bh=NtbrLJPcPp2H5QaCnDkh2crwBlw+qLqEnBmAmeqQoz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VMjRFSFxrzUdI6yCYK5e7k/E8bL5z65KLjdaNGr2znOSpEgTiHk0DItaQEFyzCVhX
	 Y2rQxS1VQogYTo5/OA/j+UqAigXjqdKCWRMk+phDqzCxDhzCzTpuT5HgNFrZ62yWMu
	 RUWre0oMDVxazY9dvM15NmpzV4v0pr2+Q4rNa/1kJg71HcdjonTn+v6xEj3XzvPMJ+
	 34xEdXgxvb1RdKwUCvVNKECwtFjPcI3MOrmhn9BrdyQ3GorQ3MrfdiSlje/cUDgAbX
	 C9cTjKShbwk6zfPSmnEq5rNk+De1gx51++KPDRBEZVIHGz/diHnc2HjpbFMCGnz3BD
	 KJjlxoMh4OV1Q==
Date: Fri, 13 Nov 2026 08:56:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, nm@ti.com, 
	ssantosh@kernel.org, u-kumar1@ti.com, gehariprasath@ti.com, vigneshr@ti.com, 
	afd@ti.com, a-limaye@ti.com, y-abhilashchandra@ti.com, johan@kernel.org, 
	kees@kernel.org, jm@ti.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf
Message-ID: <20261113-fancy-trogon-of-saturation-16fc66@quoll>
References: <20261112091027.1601122-1-m-shah@ti.com>
 <20261112091027.1601122-2-m-shah@ti.com>
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
In-Reply-To: <20261112091027.1601122-2-m-shah@ti.com>

On Thu, Nov 12, 2026 at 02:40:24PM +0530, Moteen Shah wrote:
> +  reg:
> +    maxItems: 1
> +
> +  ti,proxy-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Proxy region (0-7) through which this node's clients access
> +      claimable registers and their fault status registers.

Partially continuing discussion from v2, IOW, device cannot access
entire address space and you need to limit the address space to specific
window of it? At least this is how it looks in driver code.

This looks like the MMIO space is wrong. Listen, if you claim that the
DTB represents the host (or VM) view on hardware and based on that you
add proxy-id property to restrict the MMIO, then why do you claim that
entire MMIO is correct for this host (or VM) in the first place?


Best regards,
Krzysztof

