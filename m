Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568336;
	b=vvR4hNo7Jr27wdmAuiUznJpvwfZBSPb7tJDQEob+MxLrI2P3ZAigXUU0u/rVFz9PKAIT
	 PQipRqRcj3P1UxCtN6Yu0XYC/6D1j2I005NilJWztQ8Fy3fP5S2ovM9ifzX/39w1N8aZi
	 cuuUIfsy6noEaUZrEkjxzep4MGvTxhQD+TLG+qje8mpoN+pYZH+5YNTMkAGkdmgiVk0Vz
	 c8Yxvh4/a1LAUnJNRJyH6BK9fIEbe/8Hba6Qrn5adchOX/ZWtQvbJWYDnMLom7Sz8TRRt
	 nJxDoKn0zLuirBVD5WPvPJxerIgutO2oRd5luBUTByIdRK7CCq1siyeSevMsFH+ysKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568336;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1MudG6EhnjWN3b8vEqsH4RydXk8BVX8M1isKdnTFXec=;
	b=v32vLI2Ei/8epA3SVAVZMr4hQIfgu89Fzb77spLGItqBA4lcEejDJcaQdzUqjzLm/4o0
	 umqFaxeQOEdzns8Xf4itaG1AfIR8T0FYTZkAIbR+VvSCQu486niVF1ZTeS0nhApwjOL5U
	 qCi/sj6RPH9wNiXpqyfHpfjzis7Bk9PmvBFLgrmuCuilYKk9RP0rfnKHNv0r0dUeO+6Bi
	 Noiq3yImjAMlHyKJGkyuLn4ShLMJJgN9jpVeWYwUXjHnwi+eQVLZhyKcTw1uxBTpIT1XA
	 IB8CIwEky+yzuharDtf6hi27uxsjWDTsJEdFrg2W3F5MC4gWbnk7qKRdsUOXQt4J5/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xee1wWKf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5A1606A8AC;
	Fri, 13 Nov 2026 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xee1wWKf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD711F000C5;
	Fri, 13 Nov 2026 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568335;
	bh=1MudG6EhnjWN3b8vEqsH4RydXk8BVX8M1isKdnTFXec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xee1wWKf4RHIdGt0yenAsYu1dbGb7mgUKdgRVsgcHpG99pxKF9wrxw0d1F0s4ULCP
	 6nV4jqcv4VFBppasIYnsSrBIjEL12e+0Hsma/ri1UE8yDQnCL5ulxOZhcLAk3Q8gZC
	 p4SbnuNgNuLyFOUo6+hxOu3og1IDBkKG1bq+NUcnzMcuuAJE7WoM+mhpx15eEx9god
	 2vUFaeJnhCSt9XiXkf+LKz2Fj0tYFtXSYKZcO2sIdI20ffht3yKGbm5zkFr05E31fG
	 BeYsW5Tc/C3uFp0HbfR5lwjgaS17kGM/bk/XKzIQ5F39GO0S7kwCZk3dievyt50/mq
	 KuPOytF14WIhQ==
Date: Fri, 13 Nov 2026 12:12:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7Z
Message-ID: <20261113-tacky-unbeatable-pronghorn-74ed4e@quoll>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>
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
In-Reply-To: <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>

On Wed, Nov 11, 2026 at 10:49:15AM -0300, Vinicius Pedrosa wrote:
> Document the Radxa Cubie A7Z, an Allwinner A733-based board.
> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

