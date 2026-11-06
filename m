Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969615;
	b=wEviLO7CjC6C7idT6P32a412t5iGT6hYP8koQ45pT1ykZzUOUZbdqc/PUNPKINz/Ahe/
	 peoHpVS3KtIggjsrL+wQ9W8lC7dFFtBiec2+YBJWLdT2h06OU/D+y/xu3/5Pc3y5GJj+Y
	 VcDDF1G2FRba/EzpdoSdkbJQ9UlQ2YejRfwPrEK0Jx2B4QFls0yqszl3CgORCraxkCYof
	 hmwR2S3YJA8/AybBFqosK36aSfTyZlCzTonJD1sCjLUNRdlvnwiYpCKZalipeD5kdyVND
	 ERRPrymVPrTBNYlZJld60pST+0NAWI1FWMy6yjswqqct4YD1hKcQkwP3DyNPVDElRGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969615;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xL1/WihhcC8/bfzXm5vvKtqWTdAQfad4oJWwAFgPAZc=;
	b=Eiyq/GdZrPkNoaLaqCloJO+Q9ZjxQnMmwbzQzrYgkQBxt6puXe7AWh8hHpksSKloaq3i
	 OnVGMPBKzM68HVKDUJBVyJGa19TtwIr/Ty/dqhyxWNHiPDeQSvvNmIU2RKLGEKwQ8kj7h
	 f1Y+NLMoug+Q6NTFFBX4KqONYlAnSiupD5mKCijWoV1/piO9DEkqPWYrYBAFJoiccChef
	 qkf+n8uVo1JW7x8Ake5SEz89VsV7IMi2BoSFH1eKXwK3kUTby2Jw3Nb9QQhhb4kbx8Hje
	 52/1YISvFXT1a2g/1VMIB88NJlLLQyEv0OtURKdqIiUiTx6nR1wYVzegIGia3yoIRxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWZCW1uA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C37606A32C;
	Fri,  6 Nov 2026 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWZCW1uA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181E51F0089F;
	Fri,  6 Nov 2026 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969614;
	bh=xL1/WihhcC8/bfzXm5vvKtqWTdAQfad4oJWwAFgPAZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AWZCW1uA2YEGa7lpWykb9ehRRaUudre15fyaGkb15MryhTmHOL6eUmfSt6mw00ock
	 8PNKcezQRU9qGP9WNT1j0qXqIf6nX2APZnU+e6H/lPFgj6T3DeNdw1A5scNCph7acC
	 aBxXvQOCQmbYE85mwFip7KL2w6c+xV5hwW9LerIOSZu86d/jd6Vw7s+3cKxw3xCl0T
	 qweqcMf6eEtQsoxcwBeDD9MX4EZ+2abXH9GoSRr3pIvaVrUTZ07FpUpqbqD5265ysd
	 4nN8BckQRvKA2Gsi8D/bPT0+6b9LVVOInouTaVZrmS2DFK92p9pjg3oxJbAGfkfylO
	 M1PJnQ45AYZDw==
Date: Fri, 6 Nov 2026 13:53:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	saravanak@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: xilinx: Remove description for USB
 host controller
Message-ID: <20261106-sensible-celadon-crayfish-643d18@quoll>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
 <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
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
In-Reply-To: <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>

On Fri, Nov 06, 2026 at 10:48:19AM +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller IP relies on Xilinx Platform Studio
> and the ISE Design Suite, both of which were discontinued years ago.
> 
> Driver support for the controller is removed by the preceding patch. Keep
> the bindings in sync by removing the corresponding Xilinx USB host
> controller description.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - New patch to sync binding document.
> ---
>  Documentation/devicetree/bindings/xilinx.txt | 12 ------------
>  1 file changed, 12 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

