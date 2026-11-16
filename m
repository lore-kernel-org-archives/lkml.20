Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828663;
	b=Y1org4P+DFL7hTBd+S3D/P8NMM1uiyfd4Ex7TtnDq857mpeOfl+VEdx+i4HpPoVN7cBb
	 NRO4jmjoXV7iT5eGNpM/6Fmqpfivlzo1Z7B2Q+Q8xJmE4V+/AKWRS0zncE4+fVGszi+oE
	 eNiZViTXywpw/dH1k/YsDkVD1ZxhflugWQynKEvnDOcag3uJz/gz+3B8pObtbfEkAyDUp
	 LyO6G/8qp/WNFWVCuTfsuNkpJyPpOUr9L41Kpij2MwG6IKtDNRHua6J9sZWlc8CI7cvdm
	 F+1M9RVMYSFe4ZeJ/ZgZVo1TmWBHH44A94uoa/YAR8m+ZCaEsC+reXXli67UOM83wYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828663;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TCQ8ecxreSBLAPLj3e3BBQwSi7hEt4zC7CdPgs1P2Wk=;
	b=beD0x3WcppKI8baCgtLdgoSqL+3pWD54MJN9tvfcAznYQUwgKCZY4Y3Ley+BlGKCcqNY
	 GzYSkYNi0HIk2mCPfmUuJIq6xvqbl68ZA7bZvfOZeWSZJ1O67MLg8Yl10EmfG2CnPGPiX
	 7BJtwyJl0qsVwHa9N1gkrEGd1tJuc4AUxi4zgfqmu4OUKLBs59l8fg3ZfzMowLEuHnDWS
	 BTHllqpCI3LTwUOCnLQOh1OZld9Ma1HuZb1xrqLoQXgMz+8+E5NR2aH1inEo1XdwFbQYi
	 4K0+v90nspxd1E93vBBeSTookVfJ0KoebPfVTKfLt8gSxhvGD20wV9BNKAJjgpNbiyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThTP5WIj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EE3606A329;
	Mon, 16 Nov 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThTP5WIj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807E21F000C5;
	Mon, 16 Nov 2026 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828663;
	bh=TCQ8ecxreSBLAPLj3e3BBQwSi7hEt4zC7CdPgs1P2Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ThTP5WIjcY9uZGoNZFPog5y3a0MC5ffTuizyDiAFQ8whfMwq5q5aHJr0jq4AsSjiX
	 Jzh97RUuP7uVf9yPsb77M/G4Z9isB7llL6PaGFN/9nYJ9/CL7NKRhA9NathFK0UUrm
	 Qnrl1sVhMBASngsCJSyfH2YuhbCGKsheAEVz63+GG+dg6Cc9RnbtZk/QT75n/4OheD
	 p4Br3xTiGylQ97Ed0P1BkXRNk1NrvXcIW7WZeRcPge3+BytQMqlJOPMIeRF6ep6JZS
	 59R0Juocc6fQI7pz6oxtrlIJF3Sk7LTrcuj60EsYojKlegd8w+3cPyg9RgCTnOQVL9
	 ut64YKjtnNOEA==
Date: Mon, 16 Nov 2026 12:30:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Carter <yass27106@gmail.com>
Cc: andersson@kernel.org, broonie@kernel.org, srini@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com, 
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com, abelvesa@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <20261116-noble-quartz-loon-dca54f@quoll>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
 <ffa1da6790284f668c860bd21203014e@gmail.com>
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
In-Reply-To: <ffa1da6790284f668c860bd21203014e@gmail.com>

On Sat, Nov 14, 2026 at 12:30:20AM -0800, Daniel Carter wrote:
> Document the compatible for the Asus Vivobook 16 X1607QA laptop,
> based on the Qualcomm X1P42100 (Purwa) SoC.
> 
> Signed-off-by: Daniel Carter <yass27106@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

