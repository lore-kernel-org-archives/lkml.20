Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A05484255;
	Mon, 31 Aug 2026 17:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198848; cv=none; b=cNLSPvIR1kbMTPTJLtG8nMw+VKnlp19nAGjLZJK351UdQiDNw6UrAhcvTEJ6OIDPEJlFtbA6JrcDS49XAIHnX0UAYoyM2I0IkTOZHiBwNXJ0n5OPSdiLRdk79FyC6GU9EDpH55yMOCn0HxekbxW9Z29DxR12DKtBbwTLoiOpaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198848; c=relaxed/simple;
	bh=p7IPgAH3FqWbyOGx8GmPhTYb1a7S3+B4dSO7UD8vOXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=icAe+98gBHMbX8FTiySyMa2IGN90vZRCcTgS7ABVcwFyj57WTQaCK4GOWtSHlkTcOYUfQmT7Xj4ehnBYrhbNYsSyTFtjaShqguYcq/mufbxhjqF/ZY/Rq5UH2Tmws8xCm5+9ZDveWBWkfE2TTthBPMlZbeku7tI3JCajbjqw2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auKlPgFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auKlPgFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595A71F00A3F;
	Mon, 31 Aug 2026 17:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198847;
	bh=FCiJjNASPfC7nHO1dIVjLeinNlfDfPHkOG7oc+b74Bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=auKlPgFFlshtATijbmANWtUaZv3DKZM82nUWI/nK3pEj0HCtMBaJRCx57fjPMR0FM
	 C/Tr3Vyg61QkHzwpNXGxjAaFU+j8tmJcy/JMBC92E5f52OyhtMe7jeTzj1pOjZVBqC
	 dtLB0Af2/5X3a6T8g49fsrTRfNsvDZCYAlPQAkcdLOuP1VVyf+z5Z86F+mQ7V08M/D
	 /phHFX+fkkOmtciV1zvlClkFnKyozqk4ZOeAASidkOsQm14L3nTAkAbBL/5WfjgVdN
	 mCtJD0RDWa1QZ0X8PnXFXMAuP5jPjpteQoK3bi6DOSApW7GuDAK7LfMPhwhPg+fpkM
	 hOBfxek2fpeiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Roger Shimizu <rosh@debian.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
Date: Mon, 31 Aug 2026 12:53:34 -0500
Message-ID: <178819882984.1411250.4839706998234671556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Aug 2026 10:22:37 +0800, Hongyang Zhao wrote:
> RUBIK Pi 3 provides two camera connectors but ships without camera
> modules, and each connector can be used with different sensors. Describe
> only the board-level 3.3 V output rail in the base DTS and add optional,
> per-connector overlays for Raspberry Pi Camera Module V2 IMX219 sensors.
> 
> CAM1 is connected to CCI1 and CSIPHY1, while CAM2 is connected to CCI0
> and CSIPHY4. The overlays can be used independently or combined, and the
> Makefile provides composed DTBs for both single-camera configurations and
> the dual-IMX219 configuration.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
      commit: 4e40ef9973f7807599c86e390502f078cebeda37
[2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
      commit: f3b8fb4fbe7bb040df6d6e21e19dfa72f7d8ccc3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
