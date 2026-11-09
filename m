Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224426;
	b=gWHwuY1GOed+mrfXRPreiqqakTWKNEknInMF5I7rF95LzpCylYzEJPYRjcBTNoHW5II8
	 fNdAV3DeZCGB3FoUIYNs6hUdbvHP9VV9TEig9/wLPJjjLQrk9iUCpx7Zfp2/3ZqwicLkj
	 L+K03RDV6L9UDklQfv1etQeBAOZYBp4JbKosTIDYSnRm5EOlV2qTW1u9t9GalUnSGRsa+
	 dxJg1V5iKZbxGTlfRJuVAWUSloVaqLA/ov5nwLmYpzLzgVM4FmHyZWfagDiw812VzZIzW
	 5R1qQ7KlT3H3C3TSD4Jqo75cRKpR/Vbe8OIH++AB98/KL30jXW1am76koLRbjzyu32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PZd9FKX7vK0V/X1JqUfs3UN2tmowH9MdlPVTC8nK3VI=;
	b=q+ODJzFJKXQfr7JXaU5pNtFrH/Cf+1ur4bbAMKrgbT60GQxy1S5Y+A/JzlVj0yGV+R+H
	 w+f1e1nL5r9iQs8dCPSDuPGCjnGo60/dVlqTclu8U0HmNrDiWV3mzmdwQzsdWpspbkw+V
	 j9FEvZmz7/CNff9kYIDgUfL3BkYvUgbqYlGwF/Q4+dYa3EpsYlkb7Nw49ZafBq+FauRns
	 Y2qHoZQZcVgtEK7G4Tn9r83EpRJbbnhHe8mUExBLUox31tXED3eQ42gqZfQIfhLIuS1q5
	 MO8Cmy0kf4SeutUQcQ61VX61KSkWA4LHhZdLAwcSyu8fNw7h1+HzLEM5130va/SPaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CDk8P3f0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0F606A322;
	Mon,  9 Nov 2026 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CDk8P3f0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C8E1F0089F;
	Mon,  9 Nov 2026 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794224426;
	bh=PZd9FKX7vK0V/X1JqUfs3UN2tmowH9MdlPVTC8nK3VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CDk8P3f0wEf/F6G6ZwOZt8hj85M8kfcAPfECkb1/VY7Onl22LpUVwfKR5fYI+epAl
	 6y9yTdOvwOoXMhGwX7gm3q1hvgBMdGbuSkq5Uinw1XHYDFL6CpbiloJHys7M3zn+Ao
	 XrF26loT/WAHOOLMKZQI0N7/B2CqJ6cOPKi9BJ4KrKB+gh2xTXOQRp1Pleqgfhia33
	 uoj7GDPdSYcIlG1KORb2E80VNJQ7JQN9LtbWDl8A/IDCEG3PoRe1s08jJb0RmWWxwH
	 pobcrLNwCPPDjh+3M0sIJpS/RPDuRruS7toz3o9XXFyAfeyYOmbBGBYNX+0oQWgYKy
	 /66Ln7bQCYzyA==
Date: Mon, 9 Nov 2026 12:40:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v6 v6 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
Message-ID: <20261109-elated-dormouse-of-inquire-dfa259@quoll>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-7-2cda302237cc@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_shikra_support-v6-7-2cda302237cc@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 06:03:06PM +0530, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add compatibles for the RX, TX and VA macro codecs found in the Low
> Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.
> 
> The Maili RX, TX and VA macros are identical to their Hawi counterparts,
> so document them with the corresponding Hawi compatible as fallback.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
>  3 files changed, 12 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

