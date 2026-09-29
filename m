Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C94E42046B;
	Tue, 29 Sep 2026 03:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651766; cv=none; b=HUvXEQq11ZsmYGWsJOMLuBMv9tm7VlSZLPiP8mK6BtyD35uXtlGE3f/XOwi0QiLdMPUDFEoiZdqqtV6U0qdFOnG02YPPLy5YWuKEOXBvR0vyokvmrPJEaZq1w31fN4aRHsV/lJoJeta3P03zpUp6q02inNBrT09YMMdMY5dH/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651766; c=relaxed/simple;
	bh=TA1JQ8wzMjMfuyEo2hbfluHq+n0sCq4h3PR2axP2Zn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGH/DI+m0dE/puGU7UmJHfLj4oiLQkIUQOvGmnv+TkNNmXhXEfaEgYxK2M8cs7N4JEjQeCsjptWXy8sLM+ylJ5vHs5b7BzV+v+bGj7LbIHtz33v/g0Vw5pgSpswQCGYaYE/cQxoAR/9qTOe2elJ6u3FgrGGRKc/SoNnnfzzCDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okXOhvFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okXOhvFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0221F00898;
	Tue, 29 Sep 2026 03:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651759;
	bh=1ARFZFe6mG9kYxqrPQPb+LxguMhG50ULj21/MHrU/G0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=okXOhvFOmTnyBIKivPOaVwasfg6B/8Exx+W4iI04xM+nkppnKocr3CxaUaS6rpKKA
	 4UaIDz0ikuzSMbgpo3OluhIQBmVN+qaoDsXFOCK8VWX/u5breE//l6rD1ehCzW7+hY
	 FRgyLaR2ALJnhNCfmREw4oKEVBtju5z+c3C8JT3Sjv+1e13QEwzWByYOPyuUVmW/q5
	 gRXjowbGdVYcJykw2g7icLw8+3beH5t+7S0LLEj+Z+5AsrUD2Irt+U/cyCs7piSdSC
	 7ea0PbSgN5lPkSK7ZSlRmn4hIGNdcJEL+IqAuKj1S0Eoyddj1BYrJVrVb+EyivgVp1
	 wK62AwNNx/x5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/15] arm64: dts: qcom: Move PCIe phy/GPIOs to root port nodes
Date: Mon, 28 Sep 2026 22:14:54 -0500
Message-ID: <179065171018.2673486.1615895752148178183.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Sep 2026 17:55:14 +0530, Krishna Chaitanya Chundru wrote:
> The PCIe PHY references and PERST/WAKE GPIO properties are defined on a
> per-root-port basis and do not belong to the PCIe controller (RC)
> node. Keeping these properties at the controller level makes the
> description less accurate and prevents clean per-port customization.
> 
> This series moves the PHY references (phys, phy-names) from the PCIe
> controller node to the corresponding root port nodes (pcie@0), namely
> pcie0_port0, pcie1_port0, and pcie2_port0. Labels are added to these
> port nodes to enable board-level overrides where required.
> 
> [...]

Applied, thanks!

[01/15] arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move PCIe phy and GPIOs to root port node
        commit: e1e7e255a164cf5c4ab80bb136a4fbdfbb72df3d
[02/15] arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port node
        commit: 9f614fc7197e56797fd8cd9d0e5dc0045e2905c1
[03/15] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to root port node
        commit: 1c8f96f67858fba43eb7356be26ccf5d4a019d55
[04/15] arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs to root port node
        commit: 0384f5b00e222a53ccb5f2e6b1ce246c3b11512c
[05/15] arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port node
        commit: dea048d7c7ce0f6e659824af6c760f8c82850f49
[06/15] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node
        commit: 6b4a3c676e28a92697570e0cd7593ad73eb7840f
[07/15] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root port node
        commit: 9e753907e6ba0190d2ccae8ad3efb21d467b4628
[08/15] arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to root port node
        commit: 69c776ac585d3124c68bd8e5c39a99cd7a90dcb3
[09/15] arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to root port node
        commit: 23658da80a4f40e0c8adb7c1214f4e6d7f29c20d
[10/15] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node
        commit: 2fd4f062b950e6f46a5f44965c02c14c194a034e
[11/15] arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node
        commit: 1518512ca05b3ad6c819026f09e932e99fba0ac6
[12/15] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node
        commit: c51818ded215b07e4fd6468cc28a1a4e7bd1231f
[13/15] arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port node
        commit: acb0ce210eed553242dc35795bf70abede7f35d0
[14/15] arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to root port node
        commit: e3a8a50e2a0416305c580121c7346520a4bf462d
[15/15] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node
        commit: bbc442a64823f1483177b387ca5fc06c563b2e2f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
