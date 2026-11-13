Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611089;
	b=Ere0KFcjZzAC7F+VJzbY7m2oQH8kFmz9ZqgNevPHpXq7gZxnQGPvgOdNLHteDHvaj1/D
	 63Lg3vNpi55AXZGA1mi/5TxppDNi7o1AkIVFyNwrqJNnh3XOzzTc6r1y6K6TYI8K6+eYS
	 XxWb+ADPK9iVZnNKyWYDOnFtr3rHPMFTPjqtTMQgSAfJ2Nv9uGumPy3sVnMsl7/iR1VnH
	 ofgQ9zXuiKL7zkvoPzooxHga4QuubpjvfqWU4YsDBjIS6q+NGAGNNfFSQ/H2aHJmQ+THi
	 AXX4gREZAgA7/w+o9/3/x83/fVZU7MH6dCSs0BNR3f9lldXbbjwn2vZ8exT6eclzFqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611089;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Krx13oDhrRUsMiTIZ62Zs/3Dq6U/Cu5IlVxvdunMvxk=;
	b=lpioSKyuWMZeMmiaXrd6l/PvuIc00XNrH6Q8o8HPV68c76EQm9qStce8J67VG3kT6bAL
	 ++sADdgaTk6qSZ4Lm7YtJztwseY/cm5bA4PJmF4EPpHRepTPKlVJytp1ofrgcuQHb+wez
	 /KBo7qmZ6fG9yElZgWyo3D90sp2km1Vr2d1qchI0EKmUJkC06/IlicGDe49ZllNIBiYp6
	 eJZ6YR2zhszS0g8TS/+HpSbM5SAT3MiOZisRurbMXCYt0JtGnDFitTue9eslheGAw1QvI
	 eplsyq47GvoHQ7o6DS3vkDNfNOKsEzI5df+apsXfUJkcANv8NA9t9PT8vYkO3NkB7zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asub0Id8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95555606A335;
	Fri, 13 Nov 2026 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asub0Id8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10F31F000C4;
	Fri, 13 Nov 2026 23:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794611089;
	bh=Krx13oDhrRUsMiTIZ62Zs/3Dq6U/Cu5IlVxvdunMvxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asub0Id8uKMir4Sbcs1fqGd5cRgvs415DyEMt8ueIxeyAQm4hoQXX/auX2Tljs0Ca
	 rvedxqjQ9YCTY0jMhe54wXZAPVQvzX8d5vhvdi+ySKZi19dLCkxBXTwDClZzGoYlQk
	 20Z3lBw1+2z0KkLN7Kk7J9XUiYAtd/mEeKZV8gTdBJgHiou+saGr2PapavicypGw9r
	 BrjGCZman0b8Nvk4p7Gu9rVgXs2FfrwMzxGq2bCIZU+/E3EJUjV20RxbTtbYQe+dN1
	 X1RLNiu8XOeL9zs9/KB7ZmQrJOojCl8BEnPpp8wkl8z+LfOeIyAVISOVRbswT/y8hm
	 AcakntsBaFm8A==
Date: Fri, 13 Nov 2026 23:04:46 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Message-ID: <20261113230446-GKA67791@kernel.org>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

On 19:52 Fri 13 Nov     , Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 542bfc0d19f5..5d5f7f8a393d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
>  				resets = <&syscon_apmu RESET_DMA>;
>  				interrupts = <72>;
>  				dma-channels = <16>;
> -				#dma-cells= <1>;
> +				#dma-cells = <1>;
>  				status = "disabled";
>  			};
>  
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
