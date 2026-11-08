Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169486;
	b=BLYb8n3bi5FxEA9PL/vjRBv21CFfxJ7MjgLmoz5JVtl2XyrIZkKQKh8EEPOZGfaOflCQ
	 UOYYvPbAcKGsczmsh3Fid2lWBXtIQGFeWSjn0kbX2mt1hlJUXQ0/kfWBmrlBFKWzyPIBl
	 gPFRD7Y/bdRmn5hy5mKsimVcs+L2J8rgPlsoOzqNXOSKjJimMrKfSzT+ejv/EErwfteuK
	 CwLzp5VqEgQSQqEudA5fNdSot4AmFzqtt9Upg7x4r1sk5RB7biDc3xNSB6IrqaNvjLm30
	 xG1X99PEVT4RlJN8pk5D3r2YnBY7zy/vrvmpkHL3waRpSzeKt07eAOms++1ski7rfmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169486;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2nBMxZwqdd1f1B/kOpNegYTZioo2Cjqjt64WbZTEwJ4=;
	b=uU5Rnfpo0xKC0vqu332sVzujJt5uNvTZSOUEi+kIuDY2gOwUSiBWEf+ATawH69NNTq57
	 4knEF0WzazN3ZH1DRZxUQcoZubjxlhTOxco2ebRac1/Wc3xFn3aL6lx2YcgYjVKvS6KAT
	 ygsCF6Srn9zhWaWbd2o2u5MqYLur+N+2KrllWXloDgCF3ap/6C8AxXxVsNPhNFy1gEMZf
	 /WZHzTtZilPPo7zuNBfZCGG0BFRGA4JD+JZYtOo60Lx+ZXtK9LWZL7fue0QW5LIg+WGrQ
	 Z3e4WLKp3vBSromtr9AJZeZdTwgFyQFPTcmSGMPgYE4iAxJmsgt+BlxYeGV2qptpIWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbawrZh0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F8D607ED73;
	Sun,  8 Nov 2026 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbawrZh0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA791F008A4;
	Sun,  8 Nov 2026 20:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169485;
	bh=2nBMxZwqdd1f1B/kOpNegYTZioo2Cjqjt64WbZTEwJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JbawrZh0AXEzqI2H9WC8vnceC20nwSAODf/y3xX+YFOV1opp6MUG2FjEbhXeKJfbG
	 OQ1F2OMA0yftdrkdp5O6aSltL4nGepDVDCBjF3hiA8EkrL5EtAZmt80LpLS04m4HH8
	 uzOPtoFZfize2IJ/IncsZiLe4sd1jxD8FUtlZbKcMUpfTVtqMJSyfLiqKDrg6SWwar
	 XrN6UnYjW/scteQ5X2cFT4JuqzNJyIp4NviYYnQa6RgvNl2aNvSelwwjPWIaDnAxP5
	 9+I08HqpjxVL2NlEFg7UqXTWONVYP0RZxR6g3EKNb6O6KUMGptM36zaO21P5A728a2
	 NVqVycg1VhEmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Sun,  8 Nov 2026 14:21:14 -0600
Message-ID: <179416929374.628393.2689107974188802151.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
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


On Wed, 14 Oct 2026 14:39:45 +0800, Shawn Guo wrote:
> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> initial device tree for the Nord Ride Embedded board.
> 
> It has a dependency on the commit e484a765f543
> ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index") from
> Ulf's immutable branch below.
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: qcom: Add initial support for Nord Ride Embedded board
      commit: d245cc39c0cf7c15af8007c3b30d1317626299de

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
