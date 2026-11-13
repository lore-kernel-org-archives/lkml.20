Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582052;
	b=rciLCSFYZpKtaCnd0YPawa89K21xAANlO8+Irh2nb6rn/7KkusU7Zvxd1+KAwB8n74zW
	 P292+b/5aT4/iFJIR2emYevelKdNVNStyZEhJJn0laIzPJIgAcAXD+Bek4lUq8vrlIxOo
	 YzYWYySw1VrPt/HW9MiKTJdBi93qkrGV6oyFANdg9tCN3bU9WqNuQy365zqCjB8imnJ1n
	 ZzQaT/Klhnx7yjVHkuaBkyT+1byay9qRZaGpvHcSDSLf0vyE9h6q0cKETHk5kyLxSKE8O
	 aRqLLtTI7s4/mlKtSqYNcaUWy5t/XTZB/9P5He2fDeUZFu2s1VLqE9Ynni6sKeiGsqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582052;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ECU2TElv91yxQnOvgc867H8L47o3wHkMu4XssOR6zp4=;
	b=lOWQ1DPoMY/sJJKOP8nXos5D00sLWP4Pd/WeRM1t3Ln/UwSofhKprzBSy4ha3VXjQ2zz
	 N8XnHxZqx4toZXJh23VOfbJQBsPJOETk9Zb1vRP3Gduf5J/EftX4YK6/64O2aaC6bwpJr
	 O6S+2bB2EW/EPwmT9EBpwiLdv9Mxy16jr1XNLlMCBz+7PsecMh5VTjKwnw2Ypps4zke6H
	 BrIuXNQY2QMlUt+Q+0NTKvUhiIRIz3r2JgedcM1pem5UDfMCTSQnErHbXxpjOFOTqwgMV
	 WNgZPYRqVlk8QKMu6RKcEUOVslXZul0AuXOEVN/G6NukCTq1BRE+iSZOdbB1CW097Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEcequ7l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47A606A333;
	Fri, 13 Nov 2026 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEcequ7l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657881F000C4;
	Fri, 13 Nov 2026 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582051;
	bh=ECU2TElv91yxQnOvgc867H8L47o3wHkMu4XssOR6zp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mEcequ7lJSY0QqmebgyYBL2GVsiv3FYw/JOKPUTDI5HDXixYS6ovbYXxqZvcL8N5k
	 aEOwBGO72ci2H9mHCLHcszDgGwxlpA32YyUN10eWL2aRs/N40CVeZM33qg6Sk9RZpk
	 X051Th5jZ37nOT/KqB1wOJwc+hT1nLCW/EZdePgikIwD1WZt79l57FhuoSrRcWguRl
	 JF9OZXYVNaVgIlrJa1m57hWfJ+CDdbo7upeHd2Q1aUQiR6woEX3/u12fsgOY5CBeDG
	 Ju9fHJ+XZ0vHCSr6gdPFK35z9GOmOvpIvzkvtkzK4SG3e05e4zgorUgxbkJ4jA9FO0
	 ys38v0vVQoqnQ==
Date: Fri, 13 Nov 2026 09:00:49 -0600
From: Rob Herring <robh@kernel.org>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: cache: l2c2x0: a disabled node is
 left to the firmware
Message-ID: <20261113150049.GA903773-robh@kernel.org>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
 <20261112072953.989664-2-isasmendi.agus@gmail.com>
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
In-Reply-To: <20261112072953.989664-2-isasmendi.agus@gmail.com>

On Thu, Nov 12, 2026 at 08:29:52AM +0100, Agustin Santiago Isasmendi wrote:
> l2x0_of_init() is about to honour status = "disabled" on the L2 cache
> node by leaving the controller alone.  Say that the firmware must then
> leave the cache disabled: the kernel does not check or change its state.
> 
> Assisted-by: LLM
> Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
> ---
>  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
> index ee604117ffb3..15b5d8c1ebdf 100644
> --- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
> +++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
> @@ -24,6 +24,9 @@ description: |+
>      early secure boot code. Thus no need to deal with their configuration
>      in the kernel at all.
>  
> +  Note 2: A node with status = "disabled" is not touched by the kernel at
> +    all: the firmware must leave the cache disabled.
> +

No need for this. That is the expectation of any disabled status. The OS 
should treat a disabled node like it is not there. CPU nodes are an 
exception.

Rob
