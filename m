Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895423;
	b=uhdkyYVG2mLllr3pKoqKmcuY6ws32YFtnomxBRzm2bclgA/+u+WvKCQZI4QGkT5BIfyd
	 XAiZgWxgexy1RQlLTfnzorCpLVPmVJmigYEGXeLayeJmQeEyPFwSBTmpU+pwKaRTXL7JW
	 tEwWru/sYKkKoqHcBl/vf9pdobR4C6oM1zUsdovG3wFJS0mv513+YrCZK2FjPPP9UkiPR
	 g7I2OyVVZI6+56xaRUmtHQ+/QnvpIY0DvazTiASQ8gxSwC+eDQoHLcP5OQagqKYT8qEPO
	 tstVKJvHuHTV+ES4vbfJi+1oo+3o/ND/5mI2RbOqxiKpm36k+f8IBkfB046gKuTbUYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895423;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=F9GcNTDieh7QxkZrb/eoI09mZxtvLJXvzF3NFjQWsTM=;
	b=SMXmY9NK12QbideekzBuUwiFK9GYFfPFUtSG7JYPlbx9qmq/ky4IpL6bUqxN+kHq94PE
	 77BGWnHVjgpy0E1mWjNruwCOZuUmNL8hvu8c+ANO+MMG5GzqsX24GaYnArOkJ/QbXmpp/
	 qwn3+QC1y6sqDZXYH1iPptBVG/6F8/gJrX2gDZYHTG2geBf0uwCfWsw1uSxXH0RYVF6M9
	 GYpUDZIQ4MB12g+CUpdXWxBzxj+6jbT3xKGPxUvidCzl3BPd1Syd55PZGmWLrjHaU7EXn
	 Gl365cSNbn/GyVJbFLJ9mBBMegaj6LUTWJKayNOruoS8zaziJdBRJiyUnHtt0cjHPYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqS68onA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B802606A31B;
	Thu,  5 Nov 2026 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqS68onA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AE51F00A02;
	Thu,  5 Nov 2026 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895422;
	bh=F9GcNTDieh7QxkZrb/eoI09mZxtvLJXvzF3NFjQWsTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MqS68onAEUCKLcBvYVt5QBRjA/8e9X/XYU5cabedf1Ungg9ErA00cRtuvD/IRALK9
	 8Fan7/i7wd/knDNt7dPpATW0Bb2YI1oU6LpxhUUoLA6RiQeNLYQMxLkBknljJxuim0
	 HIXYdD6JNDj2c2fNmhWQIcPTJp8NIahTrGDaTdDCwpTUbCuL9Bcn3+5i9yklBAmCbf
	 mTJpCmFnfO55/mbfaa61I9EKQxYYYCcmPs1Bv+rC5TSqwweLeLfim4mQMn+PqI03Hs
	 PQtX+ba7+F6pL/ISGWfnXxhlF5vKlZD6QKmjykd0+fz+kowAUNFMiRHuxnKWhjMEhn
	 GZYmLwTg2XIcQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sven Peter <sven@kernel.org>
Cc: Joshua Peisach <jpeisach@ubuntu.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Date: Thu,  5 Nov 2026 17:16:47 +0100
Message-ID: <179389539199.15122.3605196731930502187.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
References: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
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

On Sat, 03 Oct 2026 22:50:59 +0200, Sven Peter wrote:
> The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
> reset inside the power manager that has to be deasserted before their
> co-processor can be booted. On t8103 and t8112 each port comes with a
> dedicated register page while t600x and t602x use a single register
> with one request bit per port shared by all ports of a die in the
> middle of the PMGR MMIO region.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[3/3] arm64: dts: apple: Add CIO reset controllers
      https://github.com/AsahiLinux/linux/commit/9055977102a4

Best regards,
-- 
Sven Peter <sven@kernel.org>

