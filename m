Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445833;
	b=4Z6pzzcAyg7fFi1q3hhq6cvnKMiW4ks0lPyG+B00jcWkhyocpkvCfoscrJN2ZMsnGkYf
	 dkA5mZrvtWDplzEGnWJuzcI6b3fUAEqwU6DRJlmxQHAKd95Yh1ls/Qgr3wb5NKhSrb8+K
	 Ekv3Ys2bQctioOw4FUa1IW7sMicB6ssORwE1T5Do4OokqfPLIJ87Jx/eWkKH4/+OOJ8ZX
	 ++Lo6HZTZHVBiZSwXdxDiNSM5+3Lj3jD3Y6BITQ3X1ExFjaeFSUqkwiPDR3gbjPTsUKpp
	 qXpryI1wLZ1/iLe5l84K6DtbhO6TpivZnwHj9StQbndE6qDOCpjofgqbsauijqaueDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445833;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LOGn5Hkm4oNfQbQHfCnr/PfN/HGa0IknyXzP4W+xabA=;
	b=BxmKn6iTuMEQpZPtcJ6Z5Cw7XUwfxIsv5a3E3bd51hgElmWUt8ari6enztTohTl9U/ZP
	 CIOaCyGbgLvuWEJDwvotuhq1ionLU8coQtVV1Yxi2B2vFRMCeTZc2AAz7uL0LzSqTjLrP
	 wgdAA5LZ/bq8GTqPnNYJJdUkPO4GCAz9M4uOHzdO1wX9NZKxU4Rzd8MhsDL///yJjdfHt
	 9/UuTwpEbPcH4Oj1ooqlKAvZgTGpGZL7DmYhdMQryz/IsR6yAoKh31uy0rbD9gV533Sn5
	 WovQmJBaxr1L//WXPTkhtPZw8hl2F+DSH0Wqt2a2mDrMAPrlJtibYtVPQ2jJ5dA50zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OO2jI9/z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295E606A326;
	Thu, 12 Nov 2026 01:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OO2jI9/z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECDF1F00A05;
	Thu, 12 Nov 2026 01:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794445832;
	bh=LOGn5Hkm4oNfQbQHfCnr/PfN/HGa0IknyXzP4W+xabA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OO2jI9/zBN4s0/OJdjn9J9bQqET5iN9EEJF6RQUkrqjusoLZCa5biQULtNpjO5UvB
	 ZAVVoOE167Bvwn5CKjYGn/vBpxIAwHnSkWk/lOajmYN3pUDIzPc86U/GUiAMrIKoOQ
	 yiP9w/e5VtUSBXT1lF61IItVsQoS8isqEMgMNtK87a+yzaM0t7cmbiAZgBQxFhFeXl
	 YHDtLz8LJ8djSf3jTYE1ZcOCMrEmMkqJl6q4LwtOhZ6tobc2Vrx3vKutNSB1mj5PwF
	 KZzPnbCLl4keoXaucf3HFCpukuu2Yk/0fCxS7U8GoJ0RxyARXl2NXJMRelahY9bw3T
	 gIvxEjQs5+r1g==
Date: Wed, 11 Nov 2026 19:10:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: example-schema: Show example of
 dependentRequired and dependentSchemas
Message-ID: <179444583029.3920685.4716587685949707412.robh@kernel.org>
References: <20261111184139.205114-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261111184139.205114-2-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 11 Nov 2026 19:41:40 +0100, Krzysztof Kozlowski wrote:
> Document example usage of dependentRequired, a shorter and preferred
> form of conditional property requirement over dependencies and
> if:then: block, and dependentSchemas replacing the if:required:then:.
> 
> Place both after the "required:" list.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v3:
> 1. Replace existing dependencies and add dependentSchemas
> 
> Changes in v2:
> 1. Use clocks/clock-names in the dependentRequired, to avoid conflict
>    with existing foo-supply constraint.
> ---
>  .../devicetree/bindings/example-schema.yaml   | 33 ++++++++++---------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 

Applied, thanks!

