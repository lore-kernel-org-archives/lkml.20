Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788227;
	b=dL0YrwXI17T6gQOpJOl8eSCboYzrhRUF+IgYbp+dpAAjRJmq7tBBb3MUugZN1rbHEdhN
	 AXgAt9kb8EG9djz9CEfGnSFiaqmSyKrxuXEwXH2XPv/V2pKmHW2mr1/RurqUu67a/c+y3
	 EzJ8M0ce6tTzbnPeueUnb7LlXnBuSpqOJIKo1/BkFgXKqdLSCGIsSw0RHrh3QTL5j/reZ
	 usF/WfWdOJj0prDbCTpeEdTkKCPhz91Abol3nj/i0WD8w5FGECQQ6BbYTrfOB3Y5npQds
	 K+nbMYQ6tqUUrpnklzqXpHMwFee/pWpXj6hisDkXoIheJ/HjoWNRw7+wGkaJIyhDekA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788227;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6XQw3zibaKqqpkbbYpdr8M7vZmcUn7VXCPtT1zKpVLI=;
	b=j1H1sEatiqb2Cin4A2JFKw9nUG7gaDgccKZICPHrTL5wgQVasi2ow62l7+yP4pb3bRaP
	 IEzHZOCuyk0FZQqnbGd63RCgaMThssDP9duJooP0cnv+uXe49oalMBi3TgjUWfbHU3IkH
	 /gazDRarQUHtawgA8ioZK32A4AHjQ0bpiiOhI2MyDIvj3cSidC5+gNlcfZv6uofp6/PhA
	 2lcfHbty6e/ZsVIaZYxWMyvFAiez9FhqtZfdp5nDV2883NuM/GFp5Pf1CAIcCuRBt5uMD
	 8jYNFL05gu3hgkwNhmiWkHWIjdK97uss3aBuEmzhtlFiSIZKecq9O4j9/urIylFZT4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XhU8l6DV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4D8606A326;
	Wed,  4 Nov 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XhU8l6DV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55991F000C1;
	Wed,  4 Nov 2026 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788226;
	bh=6XQw3zibaKqqpkbbYpdr8M7vZmcUn7VXCPtT1zKpVLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XhU8l6DVgoXFDCGpA9dD5djco7w48DvID9LijKPUQT7Qg1HYZAYBe/gbxb5ziquVK
	 615Ekjw6fa69msxvRHwG9DgI11fUDd1unnN+l7iPCyLS3+1hFMKLDNhOWn+j14owsA
	 8J1iLGIa/6FwKXUHFpeG/2MMkDOTRS1H5b/m2ycTWUlZndgeg6HJrJMH4Go5jkahpY
	 uaDJYn8DXHNnuQU7cJzpldjK5y5E3l1vQW0U2gtwV658lBtR6GnqsaidSPH/yIZW1P
	 WVzetxP2BO/8zmq2a6T6ryH+iRogvDqu0mJzWXCyCUaVJODSuzGxJnG8UMUiSE2N61
	 JzYYF4aaA5jjQ==
Date: Wed, 4 Nov 2026 11:30:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
Message-ID: <20261104-elfish-booby-of-awe-27d2b6@quoll>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032648.209747-6-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261104032648.209747-6-xiaqinghuan@mail.ustc.edu.cn>

On Wed, Nov 04, 2026 at 11:26:48AM +0800, Qianhui Xu wrote:
> The camera devices of the Lenovo Legion Y700 Gen4 are powered by a
> WL2868C camera PMIC on i2c10: LDO1 feeds the rear sensor DVDD, LDO2 the
> front sensor DVDD, LDO3 the front sensor AVDD, LDO4 the rear sensor
> AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of both sensors and the VCM
> VDDIO, all at fixed voltages including the offsets programmed by the
> stock firmware. LDO6 is not wired out on this board.
> 
> i2c10 is a GENI I2C controller inside the qupv3_2 wrapper, so both
> qupv3_2 and its gpi_dma2 parent are enabled alongside, otherwise i2c10
> never populates and the regulators would never register.
> 
> The VSYS input of the PMIC is the always-on system rail of the tablet
> and is described as a fixed regulator. The VIN12, VIN34, VIN5 and VIN7
> inputs are fed by SPMI PMIC rails that are not described yet, so they
> are left out and follow with the board series that adds the PMICs.
> 
> The consumers of these regulators (the rear sensor and its VCM on
> cci0) are not described here: the CCI controllers are being added by
> Hangxiang Ma's SM8750 series, and the sensor nodes follow with the
> camera series that depends on it.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)

I do not understand why this is a separate patch. You add new hardware,
so the commit is "add new hardware". One logical action, one commit.

Best regards,
Krzysztof

