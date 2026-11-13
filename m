Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566575;
	b=sv0qHppVmq8JZ3RROtBVp45878ejXybrSFMRmgIwt2Mz54n8a8VPpmfOImEhLKiEXTA2
	 fHfm8LClgU582o60Zrdf/LlW8Bh4fBOGD6SEvIj4Yp7UhGNOfgFpRmAKt7jtKvmA05N6N
	 J32WTMj4CmeHBEsBFWajaHa1DCdSAwOXH65nkK73DtzMrhp3bEwS1Fuc8LBbXcpdo9REN
	 o3kt5bwo5fsyGe3dFQUy5zs603SeQzgv/W2726dOKjdrv6dXjLVJ86p8T0h3zU0Envu3J
	 j0TAWSOHtgWQuuFX4TGx11E9IiSYN3re5vF6Thbz001pUz0zkfoAoR8ZUePMJ+bvhtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566575;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=u7WW7iP4sN/wF3RS+/Ap4tO0z7VMpUQdhoY2VfeZ9lk=;
	b=fT9v2cyps/bsVVbotvDX7QDMQT8+A+NQ7wU+FZbqcRlsWRhQ7OZZ6U984kbcNhN5LPF7
	 1jMCx81sNRtkFtSxOHm4rDRZ5l6qpB+ZuPqdkjF0V6MiogFY0gqoJ+X0dZoi2oVdlPULO
	 E/u3cvVIRkPs/X+eWFWtHtEf16v4PCA5U1+jKB+0j/OBLenPGTLWpEpJ/VEXct9KHcwzh
	 Oydem5zwpKGlFmwkja8EFege4kM0iihNleAo1jQ5guTn9tJhzhV1LQ+8/4V2AVY7Nvlkt
	 TmAZboBbnA9MriOzZpXh0oJ//+OUzh04wiPSaJpGrL3CRjVnzNdkHdW49cqmdMLfdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nO85NbcE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA9606A334;
	Fri, 13 Nov 2026 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nO85NbcE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55061F000C4;
	Fri, 13 Nov 2026 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566574;
	bh=u7WW7iP4sN/wF3RS+/Ap4tO0z7VMpUQdhoY2VfeZ9lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nO85NbcEEuqYfdzjPA9oiWvFS4bhNDhobhQUh7trZs6cJmy+JSN5DH6VpGMIDd5/k
	 KQoQ519FgjW/4NxFLsF3qgdt9T/yvsPe/L94Bh5nMJfBhmXQRbJhQoyMpkoEPTVtl+
	 b0b7MIt4LFWU8GSROUqKZlbqGRA/BR6pUzHsJcny2K4eXnF9+TwzAr9McsMJnav3Ym
	 TVre3lsdoBbwpugDBXoZnHP0L7x7OBmuPSF4qDbCqMEhX6+3mJWx8TsW06Ml57bsIl
	 8G4Oh5XNWptR+WfOf0EmFeKq78GW3bkG5K5ApqDPXZTivovAy9GcV6faaQafgQenV4
	 9uYdsqBO0ilIw==
Date: Fri, 13 Nov 2026 11:42:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Michael McAllister <me@michaelmcallister.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Play
Message-ID: <20261113-dainty-pastel-sawfly-75bcff@quoll>
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-2-val@packett.cool>
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
In-Reply-To: <20261109221453.658316-2-val@packett.cool>

On Mon, Nov 09, 2026 at 07:14:30PM -0300, Val Packett wrote:
> Add compatibles for the Moto G9 Play smartphone, codename "guamp".
> There are several display panel variants, start with the Holitech one
> which will be the first one to get an upstream device tree.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

