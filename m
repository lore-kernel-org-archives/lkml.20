Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360064;
	b=Q+wJo+o64rwzF+foTTFN59+Vt9UmocSE3Q6jOzgitgbR4ggqUFpojBYtYX6Wx66X7ZIA
	 Sj7oLaM3/foDGgyk8L+bc+1GVUcYxq49T//bZZ3ZUVjVVH8WxMlpdVf1zM/6n9h52iPZS
	 SNTu8shTXB6N4haHnIO+c1qTIYUN5IN3WD04lFemxLd88JjfEvyIOOVQgH/YHMZWfPrzY
	 Ih2TLBBy9tUqu0edDwN9o1UErgppLrY6INQ8tssyGTyYnIvbWld3uOs8ML1mvhrdwkPB2
	 /AghWHKjN7hTj4fJkrb7DxnLgLHRmrl6+xwMUe7K50zxkT9tin8/yHv6MlCQ6B05VpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360064;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Z+3aaARNhJNSZx1sgj4z/xG7a50sQNkRuw0fkTaafrw=;
	b=Hbn8VBc4dX7B5iGNnr24TaOd0OuUagq3JY3aaClSqeej8H4YKPKpFqzurfnhwke7qZC8
	 xergW+QaE7M4go57CLiZv6hGXCPwHtsQ/eqzBdSay32Q6hQqhjFCsIW4FkVcFuq7uMdVG
	 QPOibKqTzJCq1miZ2MiQW7cwFS17dwMSezuZYGBKheshGA7c/Rq1M+L1mrRS/mrNZv8aZ
	 J6dmth16soHnhHX0m/ImVKl/1YJX7/M6KJ5Fg0HtiASCDwUAVSeIRjIZPJqLAVvPxzZ8K
	 7uRr4n/g4ro+R0d/lciIptoM6UYfqGSfpQ0RswtVFWnOfuuMG3zUVvdyPwlAYfRpZxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcWOAidH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E831606A321;
	Wed, 11 Nov 2026 01:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcWOAidH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E441F0089F;
	Wed, 11 Nov 2026 01:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794360063;
	bh=Z+3aaARNhJNSZx1sgj4z/xG7a50sQNkRuw0fkTaafrw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NcWOAidHCmXMLQmtTzlrOmZshCrz3VGShZl6JjKwWSD8Vp7FS45wtqkQGK2/wdwIP
	 1/QZFPHvzoMCc+BqkoFwxTG+VP1iZtlV9IuVLTjnKP2UIYXellitmT8bYXsy59N03y
	 /d+q3aDEYlV9i9waseR0pqA/gP9WWn/H6uHT+7gX430qD+OUEcmdcOWABTxIRs0fTd
	 VJXOjI3DfntAb5Yi1TPOhyEVDLnyJ8ULffPj46mtzNbkY0PfP45tQa9TelDoDsrHyE
	 sMoUcqvOyHCs5/QmfR2DUembrUryp0vFjr7ggtD/opv+YpXc/C6tB+0KOPDoLusNjn
	 HS96IqDXmBmIg==
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
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 01:20:55 +0000
Message-Id: <179436005594.790675.8837636459182556844.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bbk7fL7emhP9IstEXzcyzZztjki3vN2kbzdbzY3kklw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+H/r1SdRErVW1pn71qXgbtWIHxeqQiwcFhQyn8dX/j
 jqwOYm/o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABM5tJ/hn/LBluArTRen/vIN
 nTuZYxLTr3cKzasX/j7YsUr7yhr3viRGhrNin1MEdu2v3bMuWqTh4otzsa/Etreuq7l5lT3vtv+
 zI1wA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add shikra specific VA macro data and register programming needed by
> the LPASS codec v4.1 implementation.

> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
> +#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)

Is the enable mask really 8 bits wide?

> +static const struct reg_default va_4_1_defaults[] = {
> +	/* VA macro */
> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
> +	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
> +	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
> +	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
> +	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
> +	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
> +	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
> +	/* VA core */
> +	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},

Are we missing defaults for the mux registers?

-- 
Mark Brown <broonie@kernel.org>
