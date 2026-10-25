Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792962867;
	b=P0nKREr2+Hs+FQvM+zOdZxaOtnx5WM/VOHEuKmhTC72eFBOdsSZ9BcAObPNNJ3WuM6CV
	 U07cBZcJDidb0NzuNpVRqetu3c85BQFT35qrZ2Ks7/JkRBbRPGvogZyo7NkQTj7gkVLQ9
	 WjzfCGeuSieuja6kzt5XQp5JDWzFeUAiIxAmN+RNblmEsslk2ymz9a6qFkm04n5nqP4ll
	 D3MhvBkNissyhkMcSVXt32dui/XRIqh5UePRkwdeLAUkjWDDsGAeoYHjH7D63Tg5fav62
	 MK4lcZ0hxqcZzGgssuBJiJXzZ4cdV2j3TYYoGXRaR1M665EoviQ9aJyvzBbQ/f37TAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792962867;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0fDnmTgyC1Lfjzd5lNHuAW8LBK7VsCVWFrjnswBrxqA=;
	b=tj5jqa65UymH45pdwC0G4mJaBtOxDD8ymhrgXeEYo87DKqhRCfWCq3mEY9h7p7VHOKyk
	 e2rWBMRUokaGdWqRWv4OGDmvMW5H4iA3hon9ywMMUIzAzueT8twM45eFE1keQd5kddO7S
	 I8ztAqB1yOcORIMb1vGk1waPUXGV02Jjy/6bDRwjh2duyJYu+ZwB2V7hkgzusz3D217fM
	 RdZGtu2ywTP8vr/ZV1eBXf15kw0+O9jxPgERbhVKaEYRFMmKVCFQTJyMtMfmslir8pXkL
	 eUKPM0UQmqMVNDOQiUjGXMcCLyZG35027tusXv0wCcVq5DwH2cBrjIs226wxlG1wVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ESmTEjgU;
	arc=none smtp.remote-ip=95.215.58.104
Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BAF606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BAF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ESmTEjgU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gh1lvrCZ4Dnvyo1jnNWX0NLz7DAdsWWssUDqVY6DOzg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792962864; v=1; x=1793567664;
 b=ESmTEjgUJRI9q15hoEu9jRfamXMzWd1TaLDgiWpbhZ0Xq/KgCJ3TOG2mjH//AMiPmMA7xkhZ
 xLxvSRS1q2IHnKpGmfPz6JUBtOz7WVlXQP5fnbbryNfFlvveEMNqmZfrARuEeZ+8wsUZKnd5Pb5
 JGXpcsevPdnJYeN73xnifgNg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ffd748f1b1ce3b29;
	Sun, 25 Oct 2026 21:14:24 +0000
X-Mizu-Trace-ID: ffd748f1b1ce3b29
X-Migadu-Flow: FLOW_OUT
Message-ID: <f4a337e6-9ba4-4f52-be99-95d0d5ba11ff@linux.dev>
Date: Sun, 25 Oct 2026 22:11:11 +0100
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
Subject: Re: [PATCH v3 02/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI
 link support
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
 <20261023065216.3473883-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261023065216.3473883-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It'd be useful to comment/explain why this routine only relies on a
subset of IDS...

> +int get_acp7x_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev)
> +{
> +	switch (sdw_link_id) {
> +	case AMD_SDW0:
> +	case AMD_SDW1:
> +	case AMD_SDW2:
> +	case AMD_SDW3:
> +		switch (be_id) {
> +		case SOC_SDW_JACK_OUT_DAI_ID:
> +			*cpu_pin_id = ACP7X_SW_AUDIO0_TX;
> +			break;
> +		case SOC_SDW_JACK_IN_DAI_ID:
> +			*cpu_pin_id = ACP7X_SW_AUDIO0_RX;
> +			break;
> +		case SOC_SDW_AMP_OUT_DAI_ID:
> +			*cpu_pin_id = ACP7X_SW_AUDIO4_TX;
> +			break;
> +		case SOC_SDW_AMP_IN_DAI_ID:
> +			*cpu_pin_id = ACP7X_SW_AUDIO4_RX;
> +			break;
> +		case SOC_SDW_DMIC_DAI_ID:
> +			*cpu_pin_id = ACP7X_SW_AUDIO5_RX;
> +			break;
> +		default:
> +			dev_err(dev, "Invalid be id:%d\n", be_id);
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "sdw_link_id:%d, be_id:%d, cpu_pin_id:%d\n", sdw_link_id, be_id, *cpu_pin_id);
> +	return 0;
> +}

... defined here - I marked the NOT USED ones.

> +/* ACP7.B/7.F SoundWire CPU pin IDs */
> +#define ACP7X_SW_AUDIO0_TX	0
> +#define ACP7X_SW_AUDIO1_TX	1 << NOT USED
> +#define ACP7X_SW_AUDIO2_TX	2 << NOT USED
> +#define ACP7X_SW_AUDIO3_TX	3 << NOT USED
> +#define ACP7X_SW_AUDIO4_TX	4 
> +#define ACP7X_SW_AUDIO5_TX	5 << NOT USED
> +#define ACP7X_SW_AUDIO6_TX	6 << NOT USED
> +#define ACP7X_SW_AUDIO7_TX	7 << NOT USED
> +#define ACP7X_SW_AUDIO8_TX	8 << NOT USED
> +#define ACP7X_SW_AUDIO9_TX	9 << NOT USED
> +#define ACP7X_SW_AUDIO10_TX	10 << NOT USED
> +
> +#define ACP7X_SW_AUDIO0_RX	11
> +#define ACP7X_SW_AUDIO1_RX	12 << NOT USED
> +#define ACP7X_SW_AUDIO2_RX	13 << NOT USED
> +#define ACP7X_SW_AUDIO3_RX	14 << NOT USED
> +#define ACP7X_SW_AUDIO4_RX	15
> +#define ACP7X_SW_AUDIO5_RX	16
> +#define ACP7X_SW_AUDIO6_RX	17 << NOT USED
> +#define ACP7X_SW_AUDIO7_RX	18 << NOT USED
> +#define ACP7X_SW_AUDIO8_RX	19 << NOT USED
The IDs are different from what was used for ACP70
