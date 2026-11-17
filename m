Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877513;
	b=pmFxJNeGfUH1MmNWCN7WOOn+zem79GjU1sLnKdvlEVzKYiGQgTIXq9ORSFypxnfd15wH
	 RtoYBZNv+tR6CKQJyJympPDImCCWq3Sm/Cl2Wtcr1De6wlphhjHZ46uJBwedAWhSvg1X3
	 Hbfmmo/gfQ/WExor1PG0EvZh8H55AGlmNM2CbSzy7fIGmyImS3GenGRaqEUCXFJl3X0D6
	 /TzPM6dEzOYrq9aY60qWgSuMYzf7yU/mZRZHWl60iH+27wXsJrpBWENUy9gO3tALqGp+b
	 xoo7e+MGNk/TUIX2PkTDhuLIolz+XSqOVPKnq08/PUERgSwRdvBhty4gJt5os0pkQaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877513;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2pg2wJ+EVC573gLuHPf/ocBzysflCBVjj0J1A9JkKWE=;
	b=3EdK0SzonuzJowuXc2c1onC+FdVwswM0WHZAPk3cGVNKWj7c/QjsyLZVOULSpL3a2Pcp
	 4EHPFnIFJedesIOGK9Ly2nDqg6zkISxJTmjnpb08W/VPR82D+pw595tXYgADNYTvgMBFu
	 rTiRA/uJW5aKAMnxln/DB1A2N3tQicc2fcfTreghGyIdXTppvNaJRxHwVTUUoomyOg9HU
	 sMtNTtlTOge3Tf2VDv30v3xYy27G5i9AHREikg7YNafh6EkG86wyolSnlOu46TaZbpt34
	 45onApQdEANG26OsFhNNMFAGMLayXHLV1VQAOqlR3MDEPCc8N0ed3TLHgZtablJiabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PQQOLOw/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6946E606A88E;
	Tue, 17 Nov 2026 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQQOLOw/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084AB1F000C8;
	Tue, 17 Nov 2026 01:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877512;
	bh=2pg2wJ+EVC573gLuHPf/ocBzysflCBVjj0J1A9JkKWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PQQOLOw/8VZmsxAfp3ektoFKJh7GRtUWT67p23ZvZECJSvYKcumqRWA6scKf5PF7z
	 Cpg62fgU1oS8y7Kjt/dAHAS/sRZ3piEj1iYmG5JrozoHqCcC4LgoC/MJEIny/5VB3I
	 f9ZeoR8FabIIDsZtRxlux4rXttg1V75hTTgYJhI0EWcxeup3OdqcX7/nD/g3GpkouM
	 jhHXQtv8Q4cg/eZBiUVeRzQwf15rMmZjU+om6iGBDu3pt3OJOfM/ea+PVoxGIs+dZU
	 0IusW1szg3fxZnBxkZchRTaTb66y12Z2fpYflxB91HVRzw2ICiGTgbjavRi61T4uFE
	 MvQ8LgoY9K4Ug==
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
Date: Mon, 16 Nov 2026 19:04:46 -0600
Message-ID: <179487749304.432567.468477216040055520.b4-ty@b4>
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

[2/5] arm64: dts: qcom: Add header file for IPCC physical client IDs for Maili platforms
      commit: 6cbedc3cf429c6204798e3be3b8656f715a1e222
[3/5] arm64: dts: qcom: Introduce Maili SoC
      commit: ba8ab2e12f9d1046862ed97256d9d33a58474456
[4/5] arm64: dts: qcom: Add PMIC support for Maili platforms
      commit: d7bac7e11908ddaae07d6c531a06311e65d34629
[5/5] arm64: dts: qcom: maili: Add base MTP board
      commit: f3f4200857b386dad64487aca359741965aedb10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
