Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481985;
	b=CQj1tS8+up7Fwvpi7xwAsMuP8ejVJu5pnsQf4n87mPN8Lp3PTBgYz8ux+Yui+otpUQyn
	 678m48WncgVW9u7MR9at8zNPfXsZSgXtcgx936KmctYeB1g9yC14QHd/YDQpZHX3y3ALt
	 lhb7fQmjvaSlYa6SJk6r9ZaLZ40GjIfCFyal8gK2qbin/0UogQkNUKeKkqt7WmnXkWQqB
	 DirrcDTH+Maqo1TBrDMOyOHIou/HLexoGpHoJYgamgGG81i1xVrV/fjUCz+x0jycZ4kkc
	 MWoOn13pRe6U61rW5r6vWUJnfaWJ/S9clj9vI9Qd2ov7CbjTpgmYnVWnGBA6opcdWEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481985;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qMu+N9r3Xot+kTxIucoon+Oru0ztTe+vlF5OzFensu0=;
	b=PvtjGn8ZXzym+JMXf7Qc4nkRZdYwAQ6W+ViTP1V8n4t9lglzBTSfltNbUGEmKfCi6QUu
	 BVm0YKstfk1kScNPr45m/ZzGTu8/+lxDC2+ccJSB4ii8lu/l5HWLv8vyY+HCOcfCcdJOZ
	 AtohMtGCza9fQF0OxdzNHGEP/X4dp3eyJj4IrNVxkthmzkugrV3WZT3QN/QYxJG+Ar1uw
	 cp2YWizfTWnSWawuhnz/MIdoTdQKMjQHjvcW+0vFPqgMUA+LPMJXKmG08GQ/tqCOJsaK8
	 9CYKYn+jR/bRvGwCSL+A9SmYQoXT0krydkS24mqcNk0nLF7kTF3VZwomBqnIx2n+BuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7Fgswh2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2D606A327;
	Tue, 20 Oct 2026 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7Fgswh2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AE11F000C4;
	Tue, 20 Oct 2026 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792481984;
	bh=qMu+N9r3Xot+kTxIucoon+Oru0ztTe+vlF5OzFensu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a7Fgswh2jNY4OJgZAVBmt88I8d1G9mvJZLOmTqdTwJGO5HTvhnymjCPlaYwWEBTdm
	 Ml8DosmLgh6GR2hzgEyJ1avK63GLF4N6Fd0EBdJtWBuC6na9+EoLqZOZWFg0OYNMZ9
	 hmulhOsNy3h1/3eBm7x+7VseCU2tvGfgM3U2zBkdU2ZusyknyU70EI+FarGOyRZHpT
	 JRrEAnTbph4dmva6XXgLAg3oeX6/ECb2NLkY/pXo3NY5w/Jnk1cYYWu1KUp6maJX/E
	 aodPeSbaWTcgmdYcEA/zI92jmKZiszyktu0SANvBGUOU4tEX1JJI7bjAnFRGkQG0hp
	 4MIC51euPAu4g==
Date: Tue, 20 Oct 2026 09:39:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph
 properties
Message-ID: <20261020-astute-ermine-of-adventure-ce4f0d@quoll>
References: <20261018231244.1266926-1-val@packett.cool>
 <20261018231244.1266926-2-val@packett.cool>
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
In-Reply-To: <20261018231244.1266926-2-val@packett.cool>

On Sun, Oct 18, 2026 at 08:12:29PM -0300, Val Packett wrote:
> This codec can be used with a USB-C SBU mux to support analog headphone
> adapters. Describe the mode-switch, orientation-switch and port
> properties similarly to wcd939x.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  .../devicetree/bindings/sound/qcom,wcd937x.yaml   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

