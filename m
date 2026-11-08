Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169401;
	b=hgLQ2FdKL+rsKXnLqLFiKVTToNNlkU0h7TVK9seRZxgqgNoyIYbmlq6kfn8l5rbt4h9n
	 J1uuO+tDKOjMpd3w8Xe8zstDMw2u0WPfuILettUgAatJ1X6pLOwtsOsGul1jUP+YUR+Ur
	 P368pVTg5MMkBhsBhJTQzfJwPCYZLweFk9246mpK6MKjASl0K7AmH1pahfXsfnHU3e/IZ
	 jX2xjtJ6InwwUZz/Tl2RgW4XmthEc9edTexBzE8I+ku/bjJ6mD1dGiNODoXSPaHHkoj3e
	 hG23oiyJTttw5snqaw8LeYwp//u91Fcb9SL3AgE+QehFeIG6w2K+naTuhn0oYJAbddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169401;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PiUEWT3c1ApWIg5pncKYU+2d7QfWT4doVjjCkfoL3gA=;
	b=Ja9Jh/b9yrQK+FFxDiKS8rRHtjhQ4P8htg04xohQFK6/2+AkZNX05jqQbdjjRfbE50cv
	 lSzUAjjjhwI2COa0YmjnyEeen+UbyQLnPPCyyaaFJcuv6cTZeAD6TcWo/NwdAG94cy3H1
	 LTVpzzDL/5JF0bSwbijstWlEU0kvRK0k7ehLOtdwHAEnKAf9u3kBMpaJ9D1FlHCR8jS5U
	 3YJZv5m+YhdGRfwH5hWr0AZTrwkh9bZ1VZtVj8Adz//5ybAUEW5u+0Mxey9xQ0sPX2Dov
	 tkspUizBgmZ+T739KTEqincwoz3rvwaD5rbSh2QNkRhH2okQ4b2tTDOQUI2pwvzvJeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JeCXXRIl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586560702BB;
	Sun,  8 Nov 2026 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JeCXXRIl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35131F008A5;
	Sun,  8 Nov 2026 20:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169401;
	bh=PiUEWT3c1ApWIg5pncKYU+2d7QfWT4doVjjCkfoL3gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JeCXXRIl6Fts+yb7q4dGbOhGj0WJFQ0x7ypLXlvgSq9trRmPLC0Aoyhd1+5qHbxvm
	 wY8FRd9f6OOwD4FQuGG1myDx9YI28Sm3aTENV3Lh/9NHgEE5Krn3oshrmCrVNfy4Sc
	 ebq0aTZ1x/IuTCn81u+3ZCwtvK8KFMYw1b3/7ZjkXA0NJqVxvH1Tf/Lxl21Pb91QS6
	 2dPK2jpnDDW6XtdgKL3/ttRuBLgEeTEz/94dleS3ZLSU1LNQx7/ud2UulWwwc/m0R0
	 k9Gn173x/IHth0I+Am2psNd4of2xK/b52BsLvE/Dbhfk1xpbHpulKuv5OrCXFMP9b0
	 2+oh6RHqJV75Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/5] arm64: dts: qcom: Introduce Maili platform device tree
Date: Sun,  8 Nov 2026 14:20:07 -0600
Message-ID: <179416929363.628393.10259202408074659390.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 Oct 2026 01:32:29 -0700, Jingyi Wang wrote:
> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
> https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform
> 
> Add bindings and base Device Tree for the Maili SoC, MTP (Mobile Test Platform) which enables
> boot-to-shell with ufs, PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc.
> 
> Features added and enabled:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC/RPMHCC/videocc/gpucc
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with uart
> - SMMU
> - RPMHPD and regulator
> - UFS with inline crypto engine (ICE)
> - LLCC
> - Watchdog
> - cDSP, aDSP with SMP2P and fastrpc
> - BUS with I2C and SPI
> - USB2/USB3/type-C
> - Modem and SoCCP
> - SDHCI
> - random number generator (RNG)
> - tsens
> - PCIe
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: qcom: Document Maili SoC and its reference board
      commit: e36a49b011bf51f6c420387c2a3ad6a3e8de9d88

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
