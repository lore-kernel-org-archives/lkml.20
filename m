Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376F435AAB;
	Mon,  5 Oct 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195660; cv=none; b=ZjKeBswuwwxsa20jXZ02TOBtApv980HsvXBiTShe4WQ2ZInnuLa+SKBWk/BvGcKIQ/pggFUaaV1WmOvplaNLKpfoOVllEDXa3wvNtogThGGTEbN7UmmkJP6tCT1AGIa80eic3bL/a6FaZNz9JkCn8RB/UTLTWRyY8Jxq2PTLYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195660; c=relaxed/simple;
	bh=Sdy2faMcswE89bhwNaAz57VFre8mSdGP4IbIjpj7mlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KvtbRAJ4F/d6gweegV+ooooj4HtzS95hmuerNO3pfiYJv5PQBQHhJ3O5ktjoSnSc4R0z3n1C/NTD48nzeKy2k4dETQtKZoQdYCMTIsWbRnInMCib7Uzd+3hev4YEbA0RfaLNq9OYzg7UrXuSS8HCxTJa31v0w6z1Yv/tI79wM4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eMISnwWY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eMISnwWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AEB1F00899;
	Mon,  5 Oct 2026 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195659;
	bh=wjjeW5yegDf0KDKbY7d9B07KRu5nvSc+73Tk90wGuNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eMISnwWYbwAjJzdqTp1EndL/6YzWzvZJSug5EJGr2jtZNIZCGvgQUtOo/AsJAiCYr
	 +E1hnYT4xvJiCYwADhkmpjBg6fl+Ja7L26Nq440OorctF3IyVDx4uQpKqf8bQXiEX8
	 zUoCno7H9tIc0pwRXCIX1Nzzqd6u2NnwYfMMOw75ynXo84/V7vrrjui9gQmfz6ZbHT
	 BzibSNnRobFRMCWdHNiODMLdDg+pYWFhco2mWIfJWroxsstHwYsPgNEG3VobYxdy+B
	 CeWOQJudndNmaZjWZC//p4aa08U/ZkdhTQYUX90ZddAQSIbmCpFUPDAGGpfXUEzmdb
	 1ZSePukef936Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260916-upstream_usb3phy-v4-0-812e76037d01@aspeedtech.com>
References: <20260916-upstream_usb3phy-v4-0-812e76037d01@aspeedtech.com>
Subject: Re: [PATCH v4 0/3] Add AST2700 USB3.2 PHY driver
Message-Id: <179119565537.316652.120525327400272705.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 16 Sep 2026 08:38:00 +0800, Ryan Chen wrote:
> Add AST2700 USB3.2 PHY support.
>  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
>    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
> 
> 

Applied, thanks!

[1/3] dt-bindings: phy: aspeed: Document AST2700 USB3.2 PHY
      commit: e22b112f2fa565fd7d2715ac9d1bc3ba1a3c2427
[2/3] phy: aspeed: Add AST2700 USB3.2 PHY driver
      commit: ad72aff5b4b5396a2a443a8f838fcfb8067dc603
[3/3] MAINTAINERS: Add ASPEED USB3 PHY driver
      commit: ea01f446f0682a5e7bd7a275889a890b7e0c6e02

Best regards,
-- 
~Vinod


