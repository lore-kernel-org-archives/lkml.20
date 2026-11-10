Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310681;
	b=3MIeB/Jxj8TEosgHeo6zdEfvmYCnAGq1+j+XAVnqDeWXB4TDEx3LbmtA73KxypYrNgie
	 smuAvOcbKkmW5kyMgqItbHaj33h089DaDDXW1Dcys/D/CbDf0mG3I0HoyeZFFpB/PqVd/
	 VN7Q1unhE0MiKSue49rf/iya9/qO6ivG1a552z2JU2rUlVCwox3NA690rLETLW+NXt0GG
	 mAQfV0cj5UUMT1fBPmnSxpX78txBK0cUAxQl+V1bSElcBLWEg/RwoTyLq1lcR/DVywiEQ
	 iMeUcQU8fpQjz9/KoqGEcsgNjBZcFJR2aPqrfBlvG0mIQYKJLUCLf40piSlr/bhfNqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310681;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=d9v/Gp9iWIrqKOTJ5tYiU4Rd2P+nxR1EUTXeLPGgruo=;
	b=FOwnkC8XoWQCTvziVry62d/j4LOL+KUTrkjzffce4FjCxLPpGnrxVERlw9++AZdAMa3i
	 EjPFYeGGfF8YI1TyYjJje8r7hHyVuwkZrotT6bW4fgPCNThlGKNLZaMa2wsYXxPww27XB
	 S7n6elyBzmB+Hri9p2W5gBWtLkvapRvNKbdt8YXYqyAXf6yg8c4fbT33fOwZsdj0qtW/Q
	 hzBbWc/qNp9WVPYihzJfeXJdhnNqWHsF3mR4kDG0Q/pZvbhqTDqQ1DLPKoqgvYaRVeINw
	 dhjukWgrPKl3LjNJbJgmOKrROJpmc5NgyAMOJdsD5hEb7TGgzVZnyvZt1VfVOJzqvrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+Ceox3x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBB606A31C;
	Tue, 10 Nov 2026 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+Ceox3x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DD91F0089F;
	Tue, 10 Nov 2026 11:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310681;
	bh=d9v/Gp9iWIrqKOTJ5tYiU4Rd2P+nxR1EUTXeLPGgruo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+Ceox3xvxd9BAP+TDL4GvUKrokCM1KfN702TcZ5bpUWBjpOTnYO92VxkzqEV/8YR
	 SxTqszpgwt6oRFwhOoW6K24nYKt+wEsqMGto+/4iUjGzcuHAq65gMB5wBUSxp6vkWk
	 lOEezS3teSHHE3+pMRZP6z2YSmby5iD3suXx10EYfT8yv8gT+Z4fq8eU1kacC9TO56
	 7f/pzkhYj6vzc82TP/xVh5d/SsYyMnIXi0K3Zdoxu4Vvix+d8t5MSiNR0+SmZmQrG+
	 m3uDifWhyjeb20vca4iKpQInUj5fvgycW12voIMMiHo2+PF84CmpF1u/NkZ5hekMCF
	 CMB1ulfaLT5DA==
Date: Tue, 10 Nov 2026 12:37:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v2] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Message-ID: <20261110-colossal-piquant-narwhal-6487f4@quoll>
References: <20261106101935.46816-1-christian.koever-draxl@student.uibk.ac.at>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261106101935.46816-1-christian.koever-draxl@student.uibk.ac.at>

On Fri, Nov 06, 2026 at 11:19:35AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> Add a compatible for the S4 GE2D and allow a power domain, which the S4
> block sits in.
>=20
> The AXG GE2D is a special version that does not use the canvas to read
> and write buffers, so the S4 one is not strictly compatible with it and
> gets no fallback.
>=20
> Only the S4 block sits in a power domain of its own, so require one
> there and disallow it for AXG.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

I still see no user of this. Since device is not compatible with
anything (no fallback) this makes no sense alone and cannot be used
alone. Also, DT bindings submitting patches explicitly forbids sending
this alone.


> ---
> Changes in v2:
> - Separate compatible, no amlogic,axg-ge2d fallback: the AXG GE2D does
>   not use the canvas, so the two are not compatible (Neil).
> - power-domains is required for amlogic,s4-ge2d and not allowed for
>   AXG, which has none (Krzysztof).
> - Link to v1: https://lore.kernel.org/r/20261025192302.209354-1-christian=
=2Ekoever-draxl@student.uibk.ac.at
>=20
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a larg

Then ask your Claude to actually READ submitting patches document. If
you want to use AI, it's fine, but it has to be both proper one and
properly prompted to read existing, well documented project rules.

Best regards,
Krzysztof

