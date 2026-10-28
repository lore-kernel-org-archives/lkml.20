Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195409;
	b=IYgoSYKxDeNnkmSYWQVe+UT8BcK0REU2EjbaCGwv0FM7zOXS64k37wfShOigKqZ1Sb5p
	 xJmWerukzxVpYz7/lWxpL7N6OitFeYkg38oYyASsybWFmugDVrJMUJfRIGocGfYSA4Fgd
	 g/ik59ZiPaAqeaHMO7d6ybIEsJXGYu7eqlhK4XmTdYHhuqZHk+sZx+1AFudBDgKUd21Vc
	 H/YkpSHci8XWJ3lR16w9ed0pbz2/kfSXTHdQXjMHeH8I9sl6mnD6P20pTcjHnEh7/Z4ac
	 xeZpJ3m9v7eRReRPDyrbSjDgDFd4NB0pIVF8X8AEZVfrHgD8/uJfxhLWwSKK+bh/PjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195409;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JdWNP8JpkypifgTIvG1V7ARGk/pgBkZ3PALw6mjNWMY=;
	b=D+fhbubuw99jWVg8RY9CU7ggPFCtb1/VJpOcYBfppi2RoSZFUs65xQJOi83f4uQ5lviv
	 fyNY/DxkzcmA59RiiQV7uwvZIjcmsvE5FMrWRBSoNJRDqYfRRH6NPlDVeUOivTTy/4HlR
	 J4J+Uz7vtO4SyQeUCtFEGpkfuus7MOdEU+GogFi3GnFoOrXOM6OOiQzS5pnUU8Ycd3zcJ
	 xWnhlE2j+9/vIEpwQma3bVh93EGLqQUvGG8C4U4g523qCjGA/wx+O7ZxHach5CyH2tktQ
	 WK0/v72pAR5K4gEoTxtGh0y+VkJsPbhuyLI60Bh38sr2xZyE1A7TrZdRpJUh4Nra8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfZBBmss;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D00606A31A;
	Wed, 28 Oct 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfZBBmss
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0F91F01825;
	Wed, 28 Oct 2026 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195408;
	bh=JdWNP8JpkypifgTIvG1V7ARGk/pgBkZ3PALw6mjNWMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lfZBBmssFuY5GIeH/+TA0vjEn/RvC3hK32p0OtU44e7VVztf2H/TVIKTl7n/IkTMP
	 MIQNE9vhYFOibv8O6tYh3unfpZUeHugTk8zIEc1GmralXr6pPWl2kRV7TW7xNmqEXh
	 zB/f4e3p4vhhrHu2xO3WuRwbqunNRYoBSNfuJ1DR8lZJnu3PnaM5khvwTgtOGGZWsr
	 xMN8JKQi1KYSOAP3qYsHXLycqAylILTRm2jL+3Ak8Nu+5nP2QKgWOiNUJVVyfNtrpz
	 dMspbLdB7bcQvrBg60cilk1c0xVCxYXtnckuDCs1rw5+nubANVKNVdx4ZO18l3MUzS
	 jrxPdk/slN7yQ==
Date: Wed, 28 Oct 2026 14:50:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add Mahua QCB
Message-ID: <20261028-satisfied-strange-bullfrog-f3c1fd@quoll>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-2-sivansh.gupta@oss.qualcomm.com>
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
In-Reply-To: <20261027114955.1266499-2-sivansh.gupta@oss.qualcomm.com>

On Tue, Oct 27, 2026 at 05:19:52PM +0530, Sivansh Gupta wrote:
> From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> Document the Mahua QCB (Qualcomm Compute Board) board id, an open
> form-factor Mahua board intended for compute bring-up and power/signal
> measurement.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

