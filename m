Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562783B2FCC;
	Fri, 18 Sep 2026 01:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696208; cv=none; b=cXtsU8o1EK1Wu7tFtyNEniXw+RgMf2M1BNQllD2bIer/l9knumsop66TyhlExpoA+v/9I5KeHoKM7oOWHIZpvbUQNFVdg3vb6yq8NjUijyoad28O7XI/O/v4IUAXEKKBh3hIRl4Zmq6j02yqGPejYo3zwZy2uyRZsO7mZU/ui48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696208; c=relaxed/simple;
	bh=x+1tVwXpSU7bYwCOlibIFALsDLth7WpIMQl9PJhDdFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8ZR43KPsfKYH+UmUEAqF4ps699GrGR2OCYwqgNX4JOrrFVZgUfeq2Xu8VhcCsnLqlXWqyok51HCqBxrRhMo7vUtcXQt/i3CZYJhrBAvmcpPQvLcijr8qZhmOoCQviaNYm83rdkGJ/u8LThN47KXYrS1G2jTaO0+qWT0Cb93vKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2O1UsLK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2O1UsLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8507F1F008A3;
	Fri, 18 Sep 2026 01:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696202;
	bh=gEUVOrbpBu1dM5VeWAospmgxWNDwIPpTDlXrM9WjyNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O2O1UsLKdNLUFOforAPxQ4Wu5uFgVSdTTqf7pRRB0BUTHdpAmsoH6Q9t8J21/mh+v
	 /pSvB0k4D6d9F2ngOhfxC7jqbTbgi8rndWSgn+vw1Gn+Z8/z+0Y9rvyC5LrVrobljv
	 NORI7hCoBgrWf/BSo2KO67qOyamaoOTtlIaq/JdbmFjJDUDIsYQI++OZTGQb9uwCSp
	 0uUQo21PxBiaFg84YWeXolC9zrwtXGwpOc1Smd+gIV9t8x2k91+8/cBFe0pyLTYaXA
	 hohxs/GxF58dnUl6GsJcUPccNad0e4q47CXRdN244veQbsCNQP0KiPwL2mjhOnFmlB
	 PiS6Wddk+Ku5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as dma-coherent
Date: Thu, 17 Sep 2026 20:49:50 -0500
Message-ID: <178969618826.1582337.6658511312541652648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909-sc8280xp-fastrpc-dma-coherent-v3-1-d38184e8cf9d@radxa.com>
References: <20260909-sc8280xp-fastrpc-dma-coherent-v3-1-d38184e8cf9d@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Sep 2026 16:08:53 +0800, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on SC8280XP. Describe this in
> the device tree so that the DMA API uses the appropriate coherency
> attributes for their mappings.
> 
> When FastRPC allocates shared buffers from the system DMA heap, the
> missing property can cause intermittent failures while loading DSP
> libraries. Both fastrpc_test and the QAIRT platform validator can fail
> with DSP loader errors such as "mmap hdrs failed" and "bad address".
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as dma-coherent
      commit: 3ca6796122d931ed3923884b019b0a32c26cade6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
