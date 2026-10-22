Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678593;
	b=SWQ9xSfwLDs72Fpp12XuKyternKuQeiKItEUftdtOU00oECFYNL5vkL8eCnIR4KVbfKl
	 UaPX6HXk9Tew78d3yoKxSyM2aC5reILFFn8lJ4Ig9zx8mXD88giBgLXA+h+BDy8vAJAft
	 Q6/dgshmKe1m5nP6HpzlhCaCtFeG7J2V6AU+mYfh8OUniWzUWVedr2syTFdMkPtYa3ovb
	 RW6GRRrrV/rWb069FG15v2VVXzIJqRNcIlbDenPHsg5W6lA6/A5bCvVC0EA6e6E6xprUu
	 yTaZjnR0Mkw3x2iUfvldhfaFCIBpvlD0S8M3xBGU/2mEM5qvZ/3ftPqTp+tVvBbBtnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678593;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Qo2LeBxv5OkAJSNgBlJ5JOD4tGRiFhNDOXoyP7LP9nA=;
	b=ZPKGKNycVrLPytBZZbOUbE61ZtNd/xcFvJrqCTd9zM5WqwhvCif2kDlZU4FWm/QwFvvV
	 swyp/lgN7DexIlOX0hiSw4AKIIsFCh2mGlh432+17nRDRQHdnb3wJ6vQl83TDxOzn+7jD
	 rL2uG8k1+grwjcpojbW6UoXZ9Y1EJo3yFYZoHf2UfG51M8CY4F3l7XpBDhulGP5IPb1jg
	 Igx0NEaTsRFoSZYXaVVf9WKNpO0DunMthwBpcrj0biVPOPovz8Z+6FBDQaL1rp9UJ6vk4
	 X1nCFwiLbi74AAMmh1l+liCth8yWtAh0LCZOiGl5dKIUjW/JjrXbElrtIwQrWLI6HIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eajDPUQj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C076606A319;
	Thu, 22 Oct 2026 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eajDPUQj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F041F000C1;
	Thu, 22 Oct 2026 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792678593;
	bh=Qo2LeBxv5OkAJSNgBlJ5JOD4tGRiFhNDOXoyP7LP9nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eajDPUQjIGygbgk43cbknX0e23miJGV9zhPJGGV+gqyljbY3VrHytwqTOHttWZ9vi
	 e+K90MbFepLEzGXJFIX6mI+gvvpgcPhZ8A+j81Fj0rEEtrq9FpdLug0thuIw8KQ+4k
	 n2E+RLj7ZOBNcN/eO9SiM75MPx/y4pjb4YzdonMvOQerFP4OxH7vW0mj3X8BLmEO7y
	 oMcD4qCYn6F9Tc/d9KTVjjs9Lqy9Nb2Rddtd23LdyWEDG6OAea5mSZ67svnrIXnGLz
	 wkKlgzAYRGqmmyEEeZeVOPQQLgFzECaDsQ13P+3UAvt9+vPuG7MswnfYmrov7Y0opT
	 ixPUqr1FEGBdQ==
Date: Thu, 22 Oct 2026 09:16:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: daniel.lezcano@linaro.org, geert+renesas@glider.be,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Add SH7305 support
Message-ID: <179267859148.1090186.14465037186984905301.robh@kernel.org>
References: <20261022044135.275485-1-artem122novak@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022044135.275485-1-artem122novak@gmail.com>


On Wed, 21 Oct 2026 22:41:35 -0600, Artem Novak wrote:
> Add the SH7305 compatible string to the Renesas TMU Device Tree
> binding.
> 
> Exclude SH7305 from the mandatory resets property, following
> the convention used for older SuperH TMU implementations.
> 
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
> Changes in v2:
> - Rename the compatible string to renesas,tmu-sh7305.
> - Sort the compatible string alphabetically.
> - Exempt SH7305 from the mandatory resets property.
> 
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

