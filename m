Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877510;
	b=XHGZoFV0e/YZHNeuWfk6tXeQ31y2M/tiMa6VFxt3qwxylNM6mHL/LqaJpTc6UDmKwrRS
	 HI/k2LjOT4P0Z1NQM7kwyTig7zuj0XYbNCMq22pZz87DIfABUR8w0WCx8iPLufZyjpw36
	 0PbLCzaUbXpVWx7nfOLhi5OX1fBzzQWvKJVreS7Bkv7Sw0JRqooYGusu/AKEwHgCTgXT0
	 bfhcxPe8YB+HfeqjEzoy68+623ajaiOatn97Njm+eQwzYe7KhVZtMGMHCCLq7/7wbBzIo
	 62OMTisdON3voFCcZ2Z59seAhCoUX4DwOZsK+yknIiOOnm3XMYcB6mJrAzDhLSj2GBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877510;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XeumyvQCd4S7fdZQ7muXokPzHhKB+s9W6ReNA6vfRRU=;
	b=D793VnoZQejOY6rZuwCnusI0UU6g+1EcCt/tKRESUFD3lYn1oHKuyTujQLAn6eBqKxGo
	 4TzYUe4M9MmEA1sCqtPbSk7fkAwHVm/gJAQX4o8JOPToS/UFx3VWljYvHI9XnY/R7wUqx
	 QYgNs151EJ9JYIuB/QwFE0WtdEY08ABsWXRGNSLdHU/2Vt807kp+LmK3ErmNRRgHVXWav
	 0IOSi5nC0lPTMMmzFEOjQ6sOpya8isd0vuWxZBBNUOLWf1YEcY8twUCfIVJZhpNbbH1/A
	 GBEUyrBPZVq7BKZVYOyX3oA28hNwFpR7fpeVeUFjwzVQY2unjbmE3EbpwIHTkZ+92Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2UqY+RG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F31606A88E;
	Tue, 17 Nov 2026 01:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2UqY+RG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961731F00927;
	Tue, 17 Nov 2026 01:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877509;
	bh=XeumyvQCd4S7fdZQ7muXokPzHhKB+s9W6ReNA6vfRRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o2UqY+RGiTi36xq1ul6k5AVgFFAbbS5+trAbtVFgiFgHWbwvHHI23/ZjzsUIeKj7g
	 8ZrsmoEcr8lWqdS0xhGetz3edCbDYaae9UqVfRG+rFfYJr/szWvXKlOMyj+Q+CZEv2
	 R3WpPyGmcJsOgozeF6+S8iv8Tr3m6Kye85h0JtxO4pWeT7+eKSPx+5bLuQ1DYb35se
	 qC0UlKHBE1jpAE8DWDCfF7Zrje7xwcqiZUnDETvjND/4a5Jb0VorIGh82PwOT1S2ws
	 aXCqxEcNaDjKsBq5SB14RUxO48qz95aD//1bB10lADj2AycmiQVXcWvWKnOSNQ9WuL
	 U7SxiZ/srNYog==
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
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: qcom: Introduce Maili platform device tree
Date: Mon, 16 Nov 2026 19:04:45 -0600
Message-ID: <179487749292.432567.1836788904518743298.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
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


On Tue, 22 Sep 2026 16:19:57 -0700, Jingyi Wang wrote:
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

[5/5] arm64: dts: qcom: maili: Add base MTP board
      commit: f3f4200857b386dad64487aca359741965aedb10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
