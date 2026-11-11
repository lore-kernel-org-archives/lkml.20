Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360067;
	b=QWuNA1TAwGuqGHyRX6kINfShqxPiyMZqxA9S43QriK9lb60K+x2PM1Zq6OI5I9NVKuhK
	 YLwogbXi7X4CTRjkuyj3k/0NccECEmmIFJsHWMlWpYSvzSc8dF8hla9PnNvxi71oWza4+
	 TFzxkSalfWB6njUo5ScM3h8WjJXI3FTgqd1GV7xPbkqOy1xqjtNcnk98tsbRLievB6qb5
	 A4/d+/fpOPKYwWCt65Gy8iqgJGuEnCujcTmm/6IfffnrZne2l1G55YGh6OvNCi7SCnEr2
	 Sq0YPMUs31AAMSrmv9+tqVJ11k0tdD/KyoaOaltCUAqhj8X0od3GEWg+R3jJ1ysceNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360067;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9PdW2qZNM0zgKDWJvNFVaOJuierqcXBXgcILWk0beKo=;
	b=niGgtQno8JMgDxnjUsRDWbAorb8Mbq3nDR2QgiafKLVgjDf+vYk6AZtTtSBaRfSiSeQ5
	 ccub8mYcsoEgjI7/Ds2THEZ2P0i2L0mIKCoS4l3L4vMQPMSxFW6s0dSl/UrXHhAZpD4Im
	 6XmNr91JllcK2QnsWfYrDbCKzSukwZJfP7yAIeOenQsj+JiEHdCYdFJMJ6ZMwNDJ2euj7
	 wPqRxpRuossCtITV/55P3c9yAPG4Iy1+ppx2llR8+0doZcMJJfLZn9XJkWB594VZ+ySul
	 jKnDzXw1BBz7nM1NM+7vMZY2rrBhsjR2lVF/2zDq8dHeJxe5GQWU1ByLQ5EoJo1G1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMFTQM0j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3360A260B;
	Wed, 11 Nov 2026 01:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMFTQM0j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58431F0093C;
	Wed, 11 Nov 2026 01:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794360066;
	bh=9PdW2qZNM0zgKDWJvNFVaOJuierqcXBXgcILWk0beKo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VMFTQM0jBz3KyIUXgr7mYzDX0MwWWNIhiAaBqCcS1vYWLIBfWUiOS7Mj5aCsa6l9V
	 bGt6+ZvbnE3VXxw6nAdM269vf7aAeeqYIKmVJ8yLGcJGK6vJCaeN4uyYNKURSqAIKr
	 ebFbGT1TGDLdJVzInSL0CjcBNnzmf4h6KA2DPUPrzvBOg0gQJcbPhJ7Twze5Wyps5P
	 9uv5dpqBGjRbfukG/CsxaMv3e8Ago6w15MFXyFJ0GRJEvlHxUghSbymuX/F/KjCBbN
	 UMJznFZ9fHEaFe8DGupqDvPsTf7aQcMuRFL+sGsxYpG5vKK0rHhA6FWiZqhuznXGD6
	 iWLv45Yq8sEQA==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 v6 8/9] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-8-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-8-2cda302237cc@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 01:20:55 +0000
Message-Id: <179436005595.790675.2243536196647069749.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7qNHHZhOhrbmnfpGW8NoaPUenIjbgEoEl5MF48SRX7U=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+H/ol69tjLcXgs0jw5EK+vjsWxQZ7jeXF90Xnl6oti
 LbhOP28o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABMxn8TIsDD40rI3iVMyVc6c
 Xq/cpFkf/fvrav6YF/MdXkhnB7gt2crwz1yl4ufCgy9MN9sodrxlTd0Ws4ev4+vZ7OzVF9dJaWS
 H8gIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Hawi integrates the Bolero v4.0 TX macro. This version extends the
> existing TX macro register layout with CFG2 port-select registers,
> per-path CFG2 registers and an ADPT control block.

> +#define CDC_ADPT0_ADPT_CTRL		(0x0800)
> +#define CDC_TX_ADPT_CTRL_EN_MASK	GENMASK(7, 0)

This is also 8 bits wide.

> +	SND_SOC_DAPM_MUX("TX WSA MUX0", SND_SOC_NOPM, 0, 0, &tx_wsa_mux0_mux),
> +	SND_SOC_DAPM_MUX("TX WSA MUX1", SND_SOC_NOPM, 0, 0, &tx_wsa_mux1_mux),
> +	SND_SOC_DAPM_MUX("TX WSA MUX2", SND_SOC_NOPM, 0, 0, &tx_wsa_mux2_mux),
> +	SND_SOC_DAPM_MUX("TX WSA MUX3", SND_SOC_NOPM, 0, 0, &tx_wsa_mux3_mux),
> +	SND_SOC_DAPM_MUX("TX WSA MUX4", SND_SOC_NOPM, 0, 0, &tx_wsa_mux4_mux),
> +	SND_SOC_DAPM_MUX("TX WSA MUX5", SND_SOC_NOPM, 0, 0, &tx_wsa_mux5_mux),
> +	SND_SOC_DAPM_MUX("TX WSA MUX6", SND_SOC_NOPM, 0, 0, &tx_wsa_mux6_mux),
> +	SND_SOC_DAPM_MUX("TX WSA MUX7", SND_SOC_NOPM, 0, 0, &tx_wsa_mux7_mux),
> +
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX0", SND_SOC_NOPM, 0, 0, &tx_psel_mux0_mux),
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX1", SND_SOC_NOPM, 0, 0, &tx_psel_mux1_mux),
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX2", SND_SOC_NOPM, 0, 0, &tx_psel_mux2_mux),
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX3", SND_SOC_NOPM, 0, 0, &tx_psel_mux3_mux),
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX4", SND_SOC_NOPM, 0, 0, &tx_psel_mux4_mux),
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX5", SND_SOC_NOPM, 0, 0, &tx_psel_mux5_mux),
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX6", SND_SOC_NOPM, 0, 0, &tx_psel_mux6_mux),
> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX7", SND_SOC_NOPM, 0, 0, &tx_psel_mux7_mux),

> +	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
> +	{"TX SMIC MUX0", "SWR_MIC0", "TX WSA MUX0"},
> +	{"TX SMIC MUX0", "SWR_MIC1", "TX WSA MUX0"},
> +	{"TX SMIC MUX0", "SWR_MIC2", "TX WSA MUX0"},
> +	{"TX SMIC MUX0", "SWR_MIC3", "TX WSA MUX0"},
> +	{"TX SMIC MUX0", "SWR_MIC4", "TX WSA MUX0"},
> +	{"TX SMIC MUX0", "SWR_MIC5", "TX WSA MUX0"},
> +	{"TX SMIC MUX0", "SWR_MIC6", "TX WSA MUX0"},
> +	{"TX SMIC MUX0", "SWR_MIC7", "TX WSA MUX0"},
> +	{"TX WSA MUX0", "NO_WSA", "TX PORT SEL MUX0"},
> +	{"TX WSA MUX0", "WSA1",   "TX PORT SEL MUX0"},
> +	{"TX WSA MUX0", "WSA2",   "TX PORT SEL MUX0"},
> +	{"TX WSA MUX0", "WSA3",   "TX PORT SEL MUX0"},
> +	{"TX WSA MUX0", "WSA4",   "TX PORT SEL MUX0"},
> +	{"TX PORT SEL MUX0", "PORT0", "TX SWR_INPUT"},
> +	{"TX PORT SEL MUX0", "PORT1", "TX SWR_INPUT"},
> +	{"TX PORT SEL MUX0", "PORT2", "TX SWR_INPUT"},
> +	{"TX PORT SEL MUX0", "PORT3", "TX SWR_INPUT"},
> +	{"TX PORT SEL MUX0", "PORT4", "TX SWR_INPUT"},

These muxes look weird, the different settings don't seem to change
anything?

-- 
Mark Brown <broonie@kernel.org>
