Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491964;
	b=mv+kRTRiDtNofDEcK05qcuK1yIki5VESaQhRmn6hd6EkgEM7aOwVnOXaMmFIud1PHPIV
	 /uxsEnMMa+Eg0kr+se1A8Ywsrx0j5+JoLXfGi//zVxrmcY2F7hTQB4BGw2uyYT15Wc4Nw
	 lxmrsPrqaPvZS3mGzXavcetsfHYPTNoUXg8kGWQQQNLLVNMP2KV2iiKHDBXwXrygSCJBy
	 f/VEHZXRfuhfgHOVyJ3DdW4RNuGPblZHOjH4s8wMtuUlcIllxiyyLf4djEb1OQw2aV5HW
	 ARWcjqrjIC/7jd4KKzYH5w8JtskJceCZLEKUUBBcqqOHHcLIjPOL4nJB28JExXCKyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491964;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MSdOh3wWr5sEcBlfoBA7IeLDEYWG921LNEXwJOfhaAM=;
	b=1NKU4idX213HiNdENF+3rHRHiZifV8KpIujIZ3RiHkaZ6mzeORBkksmBzTuSkXLE/8ic
	 /E2IXcva4YpplGlr6dSED/mF7adC0U4aNzE1TjuyUYT4Fcjovy62jhIkILDvsVUfGLZu4
	 uyC/affKlNRtrjMC38kIJiN4zLGxovrufeUdCqbAaarg5MH4QDsKZOeZ0b6hbTQsVVd7X
	 bpj+KApvn1CPMphzq3RZy8DicOgqFxEsUzTxDK+MvAKiOLo6RMEaKAydo3VNHCmFATpFP
	 pl+nVdF4bmKixLhg28+svJ8a4A9ql401Fjm20bnLnzl3/a66ZxbiLaC5d5y5UyHohrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQNlFTZd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84561606C70D;
	Thu, 12 Nov 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQNlFTZd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2F21F00A08;
	Thu, 12 Nov 2026 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491964;
	bh=MSdOh3wWr5sEcBlfoBA7IeLDEYWG921LNEXwJOfhaAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQNlFTZdXuIoj1MzviluZHyjVA7dfuxIy+5koRqkv0gJWrfMQ/n06eohTgQrzP+k1
	 LDDIoJFJ/KGoMdNNVucHdsoFd9Ac2IZsDKCONek+vlzOVkjVdFVft3Qpo6ds77An8F
	 SBIx2FAvvydwO0OBXiuSjgTUpv1dMjGbxbKapW3Ka5UFd0n0LEI0oBQCug5pGUe/r4
	 KXusqSQTJjpBB7ixtRN435k9Q78gPnRKLHys3kPaXLHGKHpLbddKptNgpQts+oE1L3
	 Ex1gXiTIOLg62Jgl3ofsyFFOoqTrTTdkJDUiY/cZ7SPHn+wQhl6qws0gQwR5dN1fWp
	 2FZPjq5Yo55Kw==
Date: Thu, 12 Nov 2026 07:59:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Vaibhav Hiremath <hvaibhav@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: i2c: ti,tvp514x: Convert to DT schema
Message-ID: <179449196091.359704.1222472038664247368.robh@kernel.org>
References: <20261109-ti-tvp514x-v1-1-151cc74f67bd@gmail.com>
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
In-Reply-To: <20261109-ti-tvp514x-v1-1-151cc74f67bd@gmail.com>


On Mon, 09 Nov 2026 01:10:06 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments TVP514x video decoder from text to DT schema.
> The legacy text binding marked the port endpoint as required, but
> in-tree DTS files omit it. Make the endpoint optional.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/ti,tvp514x.txt   | 44 -------------
>  .../devicetree/bindings/media/i2c/ti,tvp514x.yaml  | 72 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 44 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

