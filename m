Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299958;
	b=nImh769efBms6R4pEAFmC/g2xm2skEIL5P5NlPtQUh7KvOAOlNinmh0ZGSobWbpbHlwg
	 SBHbMsR5xwn2+otlG6FhKKBPOkGkgJAngmv+jgn7zMdZUYGAgO78w4/CA07jtVxGqpWyA
	 lDuhkjK2NKFz5QSw5nJtb3QzS34XoVWQgPS81loYchr7sViZDtpzqOGtMD33E1fzr3gE8
	 bunG6ININNeZ0dxveViWyW0yW0dW8ciMwT9M146uzdgUEa+bEyTuLoEyXKEMnm2bXx8JR
	 EY+PJm16Bw+UEyIBDGbc59VizS+RqU1wiWjpOa8IcR96tGPyxTkCu4a2TreU4o3EQ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299958;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cGLfp2Oo7jonoRZPpo/0vOfvr83+I/K1RuTCFA42kQI=;
	b=y84EOIpMDHnl1OAsjRh/hW5/kjRM4OZeLFWOtinXDP9WzQCp/qtSY6UpOaeKHwQI8479
	 QXgZXUjb1PWT7ikf6s4elzywCDRFzc/O1bQ2Ct6hW9ZwJdqWqJCaVnOA25ELbx3H6ni9X
	 nexIwUPbcGUXo7ZAsyXsLJe6xzyZF9hnETaBDaVuQI9llV7z45i7ui4Mjco/pJoQiy3aR
	 nO0msoDM1gQgwu6v0+WDDPir2sdyfsG1swzEuNnnOdo3X4w5bdoZlQwU792IXJA1Me19g
	 GjDL8Hs5fuPPzGoJ2IFO29e9vmxI6vTyBFqwJO75Tw39ekMpswdGKn0BbnznO/wRAaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqJgl6tz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9433B606A31C;
	Tue, 10 Nov 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqJgl6tz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D241F0089F;
	Tue, 10 Nov 2026 08:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299958;
	bh=cGLfp2Oo7jonoRZPpo/0vOfvr83+I/K1RuTCFA42kQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bqJgl6tzWCDjSjmcySv22VJcThNQTlZSx69qxVkO/jrGAx0Y/8buoLm3gKv1fv87r
	 q1wTyLdHqKi4IPXo4OXpSaU1T7f5xg8j0MeqSrJ5jMXBB56Y5dKf96rH1poFQkyu/u
	 7Tih7mmpTPKsGwkO9wv1f7ojv9H237yhTm25FXPL+hhIBE+CJYSUJ2qpDfKz5ljbvN
	 FYE+7luHosDawV+HzLvD9bPaLfAXd/C6HXgKe7Wc/W7GLiD/tTRo3nKYMP1r4Z4tnq
	 C/OH3V3TkmvbWQGJingUtHFD91m5/G+qVmzG7er9cTFQjML2kl38AJLuEfBjfTQa8C
	 vI2FhIafdsmtQ==
Date: Tue, 10 Nov 2026 09:39:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v6 v6 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Message-ID: <20261110-flying-labradoodle-of-enterprise-ad8f77@quoll>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-6-2cda302237cc@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_shikra_support-v6-6-2cda302237cc@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 06:03:05PM +0530, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Document the RX, TX and VA macro codecs on the Qualcomm Hawi SoC as
> standalone compatibles rather than using the SM8550 fallback, as their
> clock inputs differ.
> 
> On Hawi, all three macros use an "lpr" vote instead of SM8550's
> "macro" vote. "lpr" is the consumer-side vote name for the
> LPASS_HW_LPR_VOTE and is distinct from the LPASS_HW_MACRO_VOTE used
> by SM8550. The LPR vote is shared by all LPASS macros on Hawi and
> Maili. LPR is the vote to put the LPASS block into sleep-disable
> before accessing the LPAIF registers
> 
> The VA macro takes an additional "heartbeatpulse" clock sourced
> from the LPASS VA CSR rate generator.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

