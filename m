Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8503F54BD;
	Tue, 29 Sep 2026 03:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651802; cv=none; b=nZtSpjmBvcFZo8d6Wdu/WuMW4ZFKAD3r8DUAkVOyEKIzAjkTllOO3oKQJ6kZIVfKdjUNitD54q028ZbJnc4GcIk2ts0LfLM66U7d7D2Kn12kunbzSLMfhWYoVV2ZMKBZ55JwF5CGQGQHIpI1a1Af3hjeMw43ea0FWtWCCkSPssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651802; c=relaxed/simple;
	bh=F8x1QR623fwfOHBaQukXS5jKmBawD6Npifjq5PWLbDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFaEuMwjhuvx/l7zlo4ewqnfNXeUflSbBxJVxdExsmJVI8rpdSna58szXSGlETUv3qpd75Iamj0tINvZ2+iTbN8dYcT1PHH2pyBrk2syGy5LDyDLkC+B8VZCiRh+EgQ3ouw4OLcueP9VVba+j1UQmP3oKkWCnwtaQlSYe96tjxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVCgqHEx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVCgqHEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595D91F000FF;
	Tue, 29 Sep 2026 03:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651793;
	bh=RPZVeS/eZR/DZxa6Bb4dwwej3jfwxpSafcQWO1GbXMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bVCgqHEximZluECz62IcZd+KWxzTKfacWGnedcHevzMgAMARNuYlCzI25qFrDiygg
	 8H3f8jFhBQBfuW5or+i+jIr7nwdK48Na8GKp4y7itgz3RfCRiu0OJwzFNw85wcj+VL
	 OC4Mfq03TRH6wsO29kD6HWoeFw6MI3JFomROgtOuylkXt8iba0LDS5vQHojl8LlWpr
	 48A1S5bbTcFmr4P+OrZEH5kdjc33YL3nLPJuYwsl61xj0yAHcEkb9a9GpDCa/oQDa4
	 SBNmwEVGc7fSHBD27HVizTGjMe2OCOqMHG8S7tValN5QDvKlOK5KiETByJMM2XiLwl
	 rdwwZiTqNMNrg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD SPI frequency to 17MHz
Date: Mon, 28 Sep 2026 22:15:20 -0500
Message-ID: <179065170943.2673486.5373525839793896949.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
References: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Aug 2026 00:00:44 +0530, Viken Dadhaniya wrote:
> The MCP2518FD CAN controller is limited to 14MHz because higher SPI
> frequencies are unreliable with the current SPI3 pin drive strength.
> 
> Set the SPI3 data, clock and chip-select lines to 8mA drive strength and
> raise spi-max-frequency to 17MHz, the maximum allowed by the MCP2518FD
> errata:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD SPI frequency to 17MHz
      commit: 691767f7d313417a79c44f6e77318c0db83be5ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
