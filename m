Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236550;
	b=xgBUUSalO+GqP8kPgIuSHUfjV/0/PpUOlQT3UDMRSyn5a4YBo7C3b1oyHGa0tGaGHcLL
	 sAAbVnP0U919/YpPMx3Wiel5Do+HDGCFHW0dQMPqoh3rDiWuHU2ip1+khZi93xv+jaLV6
	 zX050PvbaTb8E2PZxnfHx4Ys27rApcXgyazW1TI92cwAKKItIRzGryZDY2Bq15leK3wwf
	 gZ0YniO6HSqnnBHMUzlcZPrHQv1FvxxUCAZH1Akh3JYM85Hw7mbfVMoQ34JQQCZIBfHCw
	 oKrOOFppcUw+NNnadwujkwJ0min4Grv4enj4edJr1b0+U4BrG7pfHz1XSGBINvcYimw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236550;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z0f33/RGDiqSVBaOo9ecmeOuijZrcM5p//7NGBqsdU0=;
	b=sINhSWQs6jiEPAGDTv5fqkZTY1Bo7ZFdtDvUDS27UJ9w6PpgbUyiyzf2rYJ+AMAlBc6s
	 sIPnP4oeEmMm7NGxTYVDaoTDq8DpB9kCzJAcKbScvUVag5XRYm2B/b/dt60sMOJC85k+v
	 0VyIFH6XHvgnpMbZaQ9M/rc37biNaKp7n51YtS7WJFl88S5VV6+QzRhiIQr2lksdrTJF2
	 qa1hdzIi2U15yP8IRdSn6moP3XyXT7qCTjkdvwxEJe2LocaIoyEw/WMSVJVVENZVYUWam
	 9FkH9BrxE5uF8o1pmrnLJ2R2K3+RSR2EzXoh3pvftWp7FEs1jZ5ifM0crt7Z7wGL2bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A1vlJJ/+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A3606A31C;
	Mon,  9 Nov 2026 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1vlJJ/+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EF91F0089F;
	Mon,  9 Nov 2026 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236550;
	bh=z0f33/RGDiqSVBaOo9ecmeOuijZrcM5p//7NGBqsdU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A1vlJJ/+kzlot0S7VkV597/eQZDZvTgqle73tJyjhXwVSYRaIfHVxmXltnJny0NyN
	 /PYl6Dg/cW6KikGyripjKzQDs0DmrqHlehGAUaJvkY6LbpsZaA5yMOJW5UhXbdTuDf
	 Ott1R9kDTlJ2j89YH6UkXAEPlFajId2dE4EwI6pRWNZwEKwHwr7ZXSFo5PmCgQI4ED
	 w5GzfaNQeTNLLepHPG6bVmG5NAD/d1r3sjybMs0FOCMN3tD4qH0l0+By7C9ggoyrQs
	 5PFSczoxHmDK8Lc5BOx+ZBKQtiNL2FrRYT61QqLwt4TVsh8tE6QbQxPPF0s6OWSDl/
	 WtQ4W6TUAotyg==
Message-ID: <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Date: Mon, 9 Nov 2026 15:02:25 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 v6 9/9] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
> version = LPASS_CODEC_VERSION_4_1; break; @@ -2175,6 +2178,7 @@ static
> const struct of_device_id va_macro_dt_match[] = { { .compatible =
> "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data }, { .compatible =
> "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data }, { .compatible =
> "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data }, + { .compatible
> = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data }, { .compatible =

Why do you need this change if hawi is compatible with sm8550?

--srini
> "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data }, { .compatible
> = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data }, {}
> -- 

