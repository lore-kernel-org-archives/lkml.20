Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877531;
	b=z3AezKMYPXiW8lfUrMg1PmSl7Tp0AqbabMSoIQgxZd5W6W3ruv/ribhcOlNA0Oer3LuT
	 uwdbSCn79L6xHBwiFviLTe1Q+SnuqmLR/zM9dB+8/B2KrBOQ+th8SsTvyxqJTyH/eY4J/
	 PyDcJ1A2S5eaoW1ln/NS7ZOYvr/OQA7ExTOQWQlx/7aWE3Pb2+saIKTGHdOeKelKYu9W3
	 nrsajLUZLbiTow+t+/YwQZ6/UTz5P+iU2Ix0DmF42N7unzOkdtaSPBKZd3saxTOK3MuZo
	 HL6h9PsrY/PweHHFLhxLuwHfgyy8a2PZG7WzfZoWkyYmHBVX83CQAQgX1lJpdN58QVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877531;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yORlEJfFiuD0G1BfawAWzgWyXl067Uig3kmhAW3hIOI=;
	b=JQNEQjq9o2wawKyl/Yh0YL5bBU6lIaZkrn610ng2ggydhY7ew96QB8qiRkv9UzXwO9D6
	 Gn7NUfGPqNPMQHzXxylhQNLzHUtd4UzvJVMsysnbj2fmDRhe3SRtCnA/Egz99f4e90GjN
	 aFqwD7u8Cqa5q0RN+t4pHKPRkEspDnz49dGusmCtr0q3ODEeZmXMHF3JeAfz6UPUTM2bj
	 8hWnCVmPWC1+SIrEnqSKMaUa51pJtJsXtGEssItBFej2cLgSz5+atbjhnn/aWVuy0nItA
	 9nr82ZCvyMI4vzwLiqy7kwV7kzfLBewSJt/Wt1QDz2u4qPYNcVDVtxfjAJNKbVIk7gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHGr6j3V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6AB60A5BD5;
	Tue, 17 Nov 2026 01:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHGr6j3V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B951F00931;
	Tue, 17 Nov 2026 01:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877530;
	bh=yORlEJfFiuD0G1BfawAWzgWyXl067Uig3kmhAW3hIOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VHGr6j3VQDek8hXQDmswRX/Ew5gie3gw1k7bYp7jn4vPQTP3EvSdf6cu1HjC9A6BW
	 NCSeCVfcCsFDNfjIZXGJcXe1VP0+WX2ewUG/eR3IVYFMi6dAA7x3gwMhozkc2dx5+q
	 1AbvoVfhOzS0q0FC6ikVAZQ2nwXaWPo48GPTsTMo2KHF526CmFJPPIHZUnuFt+NzBt
	 Ug9gkJlDnlLuE5OMCb5Kpp/lr1fhS3hVxivEkO3ktF1/fGWwtWmHik/pShz4PZcLVD
	 nt7LVVpXir8jmvPrEf7MMwZHz96YXTi+ISaMi6FN6djSD6C8Z278LiQY3YLZkJvm73
	 nKHZMsmHoTi0g==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Yu Zhang <yu.zhang@oss.qualcomm.com>,
	Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Mon, 16 Nov 2026 19:04:56 -0600
Message-ID: <179487749350.432567.14067004682370840525.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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


On Wed, 11 Nov 2026 15:51:34 +0800, Shawn Guo wrote:
> This series enables PCIe on the Qualcomm Nord SoC and brings up the
> WLAN/BT modules on Ride and RRD board.
> 
> Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
> multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
> selected by firmware through a TCSR register that the PHY driver reads at
> probe time, so the DT only describes the PHY ports and hands the driver
> the TCSR handle.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
      commit: 1e1139747959611400023a4226902cdeab07a53b
[2/7] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
      commit: 5088c1c7dbfa63aa9cc97d5b2cb59d13318e5ed9
[3/7] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
      commit: 752b8c57d9382926f3b360c9bc65b9640a72e021
[4/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
      commit: b09eab861d000b4a60aa1dee549d1a51296617e5
[5/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
      commit: 1c440c8a96038b7c34cc734242ab6e8ee047b88b
[6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
      commit: 3bef9aecc88520734130f700d518df2742499b0e
[7/7] arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support
      commit: a06fafdfaf70232c2709a6c5402c3d86bf73ab75

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
