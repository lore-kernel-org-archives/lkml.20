Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262522;
	b=ChdxuouVW19ha7I+eC+mfCkmKGYaNs5HLXz6vu0mgTwKJbq8ixelJ6X9WpsnS1IDbdGd
	 2xjFiRUH+Jc9fpWsy+g67WpXgFjc3k91e90n72TxkcBBx5mAA8/DeylUVkd3vBg6HHgUT
	 DFrwDGXHsb6ed9Ybn6CuOIaGeECVLMbZr3h4TWDz8ZuS5y/cB1/G0e5ELgMY4keKfXmKZ
	 JEnk10qeELW8cb+7SiH7hd3P4iURbS9JFPERAM//54rLlmVz2eYLQbzZKK388ZPqI7rGT
	 APCoStc42tdt2RCNY+NNV0CTcP3CyMnoDkngl67wfsWTaKJXiAUWEn6He34YawBD7Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262522;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r4ARuiayoGmnb3gobGgT6ycbMUSvczq2GaGID26XOPc=;
	b=u7Ng75joa/fffOWhctm3xc85mqhEy72PpQyIb0E+56OZZhgpsBS+iP3q+H+ZTmqz4PqB
	 yOE8ZeBECEC2Ss6vpzBP10zE9K7L3U84g4zNmZVrdNPzgICLVAfoue6nIhBnmXqF24vZr
	 D+ZurOIcsj3K9pP+g1b55KtF3nrujjku+ss2gIZogSvE/SfNBGew7IcKB05bC1AEgil/g
	 R8zc1tX3UbJn4bBlFUaTofuvCGuU0spPmItDF3+WEz7wrZzNqt+qIzxjOw2xvq+D2awfW
	 LqtGJxoCP2wYQ1Yy5sK6bjJU4I2Mp5Yo7fVfyjFOFZPk/2ikcor83Sp6+JWqJFy9vdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ZSljuwdH;
	arc=none smtp.remote-ip=91.218.175.111
Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0C606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E0C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ZSljuwdH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q8GRugxCN0NxT2mKf+lhcXEmhEoypzxpW7nD5nFeee8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262519; v=1; x=1794867319;
 b=ZSljuwdHdZ2QQkNrbGO019qqxfRoUdP22jVio1D3C+4gNbKVyH5DRZfSNtxEMVEgAG10rZEi
 vMNd/ypwN7k46sOWQbUU4vd6eXAGhRfVTzdf6b5oskiqu29UzwLNdpvwu2jNfDta5iFNfeykhj5
 sppleSrDUvh5S8RKy0Zn0ofZyQRoupHCEnfeytU988SeHm+G81aAIxvSXsr3Wc2+aI2i6ASpE3O
 TKPdeZHRHngWoVkfrrfPsoLJXOm6Ezet/q3VeMGa1ZRKdwlBVP0SLjY2fOQZh9fDDTlm0zBVtdn
 mDbhRqR+/tqPQLypfSsb+bmSbdUDJB5af+fwivlYzae2A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ae3d32ff97ae3f5;
	Mon, 09 Nov 2026 22:15:17 +0000
X-Mizu-Trace-ID: 5ae3d32ff97ae3f5
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: Add Moto G9 Play (guamp) / Power (cebu)
Date: Mon,  9 Nov 2026 19:14:29 -0300
Message-ID: <20261109221453.658316-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this series introduces a common dtsi for the Qualcomm SM6115/SM4250
("bengal/kamorta" platform) Motorola devices, basically the ones
listed at: https://github.com/moto-sm6115/kernel_devicetree

and two concrete .dts files for the two phones I've tested,
the G9 Play (guamp) with the Holitech/Himax display panel (which I've
previously upstreamed support for [1]) and the G9 Power (cebu) with
the Tianma/Novatek panel (will send the driver once this lands,
also waiting for the AW99703 series [2] for backlight adjustment).

+cc Michael wrt the G10 (capri) series [3], sorry to bother you
about a series that already has R-b and all :) but your device
is very much one of the "clones" on the same platform so please
consider rebasing it on top of the common dtsi. I've deliberately
left the SoC dtsi include out of the common one to allow for
sm4250 as well as sm6115.

[1]: https://lore.kernel.org/all/177451576040.103892.16399746050578598756.b4-ty@linaro.org/
[2]: https://lore.kernel.org/all/20261016162912.64581-1-lukapanio@gmail.com/
[3]: https://lore.kernel.org/all/cover.1792840208.git.me@michaelmcallister.org/

Thanks,
~val

Val Packett (6):
  dt-bindings: arm: qcom: Add Motorola Moto G9 Play
  dt-bindings: arm: qcom: Add Motorola Moto G9 Power
  arm64: dts: qcom: pmi632: Add LCDB regulator node
  arm64: dts: qcom: Add sm6115-motorola-common
  arm64: dts: qcom: sm6115: Add Motorola Moto G9 Play (guamp)
  arm64: dts: qcom: sm6115: Add Motorola Moto G9 Power (cebu)

 .../devicetree/bindings/arm/qcom.yaml         |  12 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 arch/arm64/boot/dts/qcom/pmi632.dtsi          |  14 +
 .../dts/qcom/sm6115-motorola-cebu-tianma.dts  |  18 +
 .../boot/dts/qcom/sm6115-motorola-cebu.dtsi   |  43 ++
 .../boot/dts/qcom/sm6115-motorola-common.dtsi | 541 ++++++++++++++++++
 .../qcom/sm6115-motorola-guamp-holitech.dts   |  36 ++
 .../boot/dts/qcom/sm6115-motorola-guamp.dtsi  | 127 ++++
 8 files changed, 793 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi

-- 
2.56.0

