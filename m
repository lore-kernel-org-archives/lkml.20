Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573E349CF3D;
	Mon, 31 Aug 2026 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198865; cv=none; b=ruqjkb6a8nB9nDDNH1TReFEZi1/fe0kbAgL/eYMUr0RdjLqE/NE/yV9imVrLmZHOM4anKSMbheEG66dkxnIFWYOBdEVK1vc7eVivg1j0YKh15aDvL32uXCBnpuwZMqsprus5oMRzJjrfzaP5CmAQSKNMae/AOJoraOFcrjNerV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198865; c=relaxed/simple;
	bh=Du0hTBpGPu0qIMoDYxnqD2ikiq2FoLos1MQRR+owEmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDzaAruRg/oMrczolZj4QmbdzlDs1h9wT7h/e3Zzxg3zDlB3rQbVUp3hOfXEMxiJ5bsHcWKiw/8qMjQVV6sJTgo7L0hAwzC5hGfHNtx/BWHtfvBBWooZF3mefJgP0ulbR9jp7+JollREc7TdWOCW45KdXApwTrS+9wbxkt/A5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVxitDdN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVxitDdN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A3E1F000E9;
	Mon, 31 Aug 2026 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198864;
	bh=P707A7KP7LuPCWwPbvv2aUZXvyoZCjhR5We3Pm22s5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KVxitDdNZvL8WU259nv9jObfMQE0h6ym88aHVMVOUPxHFM4M9P2GTg5fn3bJA4gY3
	 85aEKebNxv9qehQy5MiJUea53uiMVKA4znmK5ZqiqGcRzRWRV6he9mGGt+1NL7VhJt
	 nMguN1zWBVoszIGb9yeWCAyXubvEmoeBeKUNefiBKkbsYkxsiDBEPFu16Sv7PjTnOH
	 s+HzHb4PHswK0NhcSebCEeuZQG+PSyCrzGQRFJiReQI7TonKHuCw8A6BBGhItlAFIU
	 ZOW2rq8aj5iJzXh8qm1C4feZ7JPWTKEFqpxsYUS0heHJAg386teXf9Kxj2HWnO8pFp
	 cZlJg3l7v+rjg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	quic_chezhou@quicinc.com,
	cheng.jiang@oss.qualcomm.com,
	shuai.zhang@oss.qualcomm.com,
	jinwang.li@oss.qualcomm.com,
	xiuzhuo.shang@oss.qualcomm.com,
	mengshi.wu@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: hamoa-iot-evk, purwa-iot-evk: Enable M.2 Key E connector
Date: Mon, 31 Aug 2026 12:53:53 -0500
Message-ID: <178819882971.1411250.15808484522519454230.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Aug 2026 18:02:24 +0530, Wei Deng wrote:
> Describe the PCIe M.2 Key E connector on the Hamoa and Purwa IoT EVKs.
> The two boards share the same M.2 wiring: PCIe for Wi-Fi (via
> pcie4_port0) and UART for Bluetooth (via uart14). Purwa inherits
> hamoa.dtsi through purwa.dtsi, so the endpoint stub labels and the
> PCIe root port compatible added in this series apply to both boards.
> 
> Only the UART BT path is described here. USB BT variants of the same
> M.2 slot need the USB core to acquire the M.2 pwrseq target, which is
> being added by Chen-Yu Tsai's "arm64: mediatek: Add M.2 E-key slot on
> Chromebooks" series:
> https://lore.kernel.org/all/20260724084328.3943997-1-wenst@chromium.org/
> A follow-up will wire usb_2 port@1 to the wifi-bt-connector node once
> that lands.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14
      commit: 014501d141ed5b94bff20b468f9da1110e4c7f7e
[2/4] arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      commit: 3991b7a78c8b4930140b61da6b0dd562126c6c6b
[3/4] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
      commit: 394a7a01c5faea0924207105ab0bf83b9d2f64f7
[4/4] arm64: dts: qcom: purwa-iot-evk: Describe the PCIe M.2 Key E connector
      commit: ced480bd5343cc17c1741792f2bca026f2825793

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
