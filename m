Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580516;
	b=cy7SJQIgsivzpwHVeQbZxIkFHaCCCNNwuwYfuHXHv3eVl9ezYPE4pxkfx3f7DEwOubcU
	 pigyUe0zUdWV2U2zYyxcZuVlwenGrJjM9PgqQXetTcSr9h97Yww2DulrcKjvbsULy+P33
	 qeCLTynuZUTk7Se3Pc+Ds/gkGkR/8Hyds4/uu9igQCi3ynvD3bcug3Ic/3C11mtl/Qf+H
	 lshg8copdTK5RZo6EzIpw//b89bbcHZ1e3TtnTxnv3MLOrvWdaP1c3IeEVbyYfVATJU8B
	 hsESE76tE8tlPRx6410QAB1lZONo11NTvCJAriyq/HqdFQGkQB3djWWSERHEz5LbscA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580516;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=/biTTKcUHka3zKSQUOs5KZPMEwsKgo7eo4PgO2SJ3W4=;
	b=JSM8Mfnwed56Y1r/AG5d9iyFtLUJgGFeLpqJdZ7gN+sErCZjN1aqkPBp05mVnEuwWAWB
	 hCumItZ+7x5RMtSYWoLCY1XmY09q50QKk9ZGAmQxMBzShQWM/q6azp++IUkQREyMZUGnV
	 vO9T5Lm5gKYL+e/TCJtjUxcu2Peh1E4zMOD/mAWXzlGkKqBkboGAYpC/kEaPkO8XhVvJa
	 zlxNz7lOnjebScyjs9IOmwFcl9tnS+Ci0skDcCbkdRDx31n6aS1AJo8QGPbdRLbJ/MQH0
	 cdsNCdCUZcFMnPDuuMj2mZInYwUtcW9IFS/XjXVYIK26GuDa+KGqaHdgxR9Wp8dbEKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLrk6pis;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD02606A330;
	Fri, 13 Nov 2026 14:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLrk6pis
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6611E1F000C4;
	Fri, 13 Nov 2026 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580516;
	bh=/biTTKcUHka3zKSQUOs5KZPMEwsKgo7eo4PgO2SJ3W4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dLrk6piseWNXVCCEMXUmRWhuQTY7B3NDnooOYqsYrMeWFqk6cw2zSeujPwK0DKCMk
	 IzaauRblFwvlBQ4UKUGJzWJIi4QnDFL47bR7zsF9E84861HQ59m8oZ0yoaampCToAZ
	 YgMqdx8fb/hcmCr20SocNtg4u3o83WHmVs6TH++t+opSgfVJ0UUp17qgOssYgCOVYS
	 BC7es+LgO0Afy+6DfnYKwA6mbC0oZjNmZkBXz5JBminFpFwMs4oqqoIPjqQL0WR/s0
	 2ODGlvp1OxC/PF8vTsZe+LEFqxKuzrqI8cpXTvkN+XXsqBxZ0BfOtTY3wXp33R1MER
	 9Bmw4WAl0oEyw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Message-Id: <179458051215.67128.2369418349432820499.b4-ty@b4>
Date: Fri, 13 Nov 2026 14:35:12 +0000
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
X-Mailer: b4 0.16-dev-ad80c

On Fri, 30 Oct 2026 15:02:41 +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

Applied, thanks!

[1/2] mfd: Constify mfd_cell arrays
      commit: acf1fcf6862f960de957e6cf5fd0977475f6be55
[2/2] mfd: cgbc: Allow compile testing
      commit: 82d717c9c8956f5894e08e112f4aae72023cec86

--
Lee Jones [李琼斯]

