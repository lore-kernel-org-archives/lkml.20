Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169448;
	b=M1I+AOd65PyQGkeIOcG+p2z2B9wjMnfV0o173LxRnn6VkCoQpXD1e7tfpMqJhCQEuTfr
	 W2R1UwGe5MXDxdhBChzhl/nSB+/cXhURt3wEjWkNzq2GBLHUV4cWuI98+g6e43GYKybZn
	 JHgC4nT7ERz8aZVJ/GOd8yUrHMNl2jFNqpcAedhTpoDca80V8cE/mZWYZGIb96nZem2WY
	 ZVR4UJSHIO8jH1X5n5x4ZCtNeXVBp5z5DzfifzOAl5tTKy5R9Wt59RaaNgktEYjxIKIam
	 lp0VeFpsgtW1yr+QLfeDngzM4bthmSEZdkaEbEHpKMr5gArhUNWMbH9KogkHu7oiBTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169448;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qBxnxqrYNuh8w5s2rZnr1aNYVJiy6M9IU64HveYhduU=;
	b=VclXg3Jo8dmUu+EVAP7aej0d9S1svEsGRsBfNS2SQLq8ymmNf0E+TedW086Qm+TqSGoT
	 6BHsDWJjj3DP4jnRU7YNs08LcG434y/H2MM2OzDAFZ2gZXJBIlBgryRGjbBw7VWCY45jQ
	 lWx1yp1cOhAameuuMcxUFY9Qrt9sS/mU9smjpczcCzCPc337NIJ3ZyaGno4qANEF+SIky
	 lIY/GcZ3JoPA60NOHl36e9peqME0VfZK6NDtjY7Wg3ShAoU05qfX2fr9WGqeEwhyqkZD+
	 qxTPmte1vA8C9Fwwx8Cta9RMDlS66XuzoKovp/nhjUYqdYsXq7/dzvSg/2NZD9AZ8+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNNyv2sk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDFE607761C;
	Sun,  8 Nov 2026 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNNyv2sk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08ACC1F0089F;
	Sun,  8 Nov 2026 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169447;
	bh=qBxnxqrYNuh8w5s2rZnr1aNYVJiy6M9IU64HveYhduU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZNNyv2skyLZX9fgzltd//fEhgGfmjfgctfnnXPrnYb+VyLNbzHBCD8Wbzfew4YSG9
	 jlWYaxMLsceoSUPZC02BP2TjRXlJOQXESF5rLZ7S96od2yTx5yc9Q2t86DNnaqD1y0
	 4pxbGhTHBYit/a98LnDlnlXVxmJq4j2E8duh8c9CU/Psmu9ngQabTdenPK6046g495
	 mQcZn1VExYWzxWXjEqjyMHGe5AVEkogxogZ3bUAwkxJvdNVOVScAVHeY/2AiHFnrpV
	 J8gGexVIWChYe5uoW+iG0wwiePDgb539NChvY+J9hGXETNpN2OxwMYVfEnUbZBBMmX
	 XFsUF5N8ujbAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	yoxcu <mick@yoxcu.de>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt through the PDC
Date: Sun,  8 Nov 2026 14:20:45 -0600
Message-ID: <179416929376.628393.7828578139046822165.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013203749.3078262-1-mick@yoxcu.de>
References: <20261013203749.3078262-1-mick@yoxcu.de>
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


On Tue, 13 Oct 2026 22:37:49 +0200, yoxcu wrote:
> The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
> directly to GIC SPI 481. In CX collapse the GIC does not detect
> interrupts, so only interrupts routed through the PDC can wake the SoC.
> 
> SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
> sm8250 and sc8280xp already do.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: Route the SPMI interrupt through the PDC
      commit: a1a11f5f5e9b9dbc7048810b837d7d1fecebad34

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
