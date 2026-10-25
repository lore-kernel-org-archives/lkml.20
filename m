Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792962866;
	b=HuuWdvfmC/19aFPTEpgaEtx+eQBly6HUKbFM0nq3tKcyz1p7ZI05NbnXV3KP10u2wzsX
	 6KH13K7O3C1h3XhWlWW/QIrKfr7axTqO82vJUO6Ac3MkA80PsUsBf0CD5wMG5YqsguTk7
	 73rUstQjzDts/D5D4pi56fQKnNH9HNLw/jMbRBQhXVTdLWg0Yj5Csrs5HZnFxFJjvga/X
	 MQGAuFDiCSGc4lN5qSIR26Py1LJXewRWGwopDPBH7UKoqEzlx7pW+M9oA0yRqrQqB5oaN
	 gIhGls1/5jGhF99eR5+7DyXdh5YcEMcQSJJ6T9hWp/Vigvz6P3z4hvbKYoMuXT86ShA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792962866;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gcUfA9iGnFUWXyqWY5MkrEDyi9pGvOL5toI0k0Nn8MU=;
	b=IRCUSfIKFXW5ZUZKuByU5yXfdWpoSaqEVgbLAsZXyU2aTGnJlgOReS82QpSTlt8mwH3d
	 xnCeOcRMGCAAXu169HNOYs/awwLiiPgfzTXoLRIs5TuymEaYc8yRUm8Q+ct1KpztVTQ3t
	 Z7zcXr3Cv5JauBQV/3kOrJxzQbVK6ML18a98Rj4AxqhbgwiZt0hmD/oy5YTQqAj1u9+N4
	 cZ9bLb7zqcUmir9vlUyinUz/qx3BsgcNKP7ipJ4oszp9SqaP00Jgnxds7FshgNmsVn/bs
	 TbY5lqkRH46eUuK918RIVkBz+8jiPPx40ZVDKS55FtLcUpB3yOXs1qkRaKOvWDx/0ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZqvpJs9E;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E76606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E76606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZqvpJs9E
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kJsZBeygNHB6PvRn0UMymP5SkogydR5UK4xPArVrVmw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792962863; v=1; x=1793567663;
 b=ZqvpJs9E+axZm3V2rAiPWMY4c5b/fQMaY+wy7GQfkY9pb4vZnl6YUTXGo+3WoivtW4Y0VGl4
 fQujNLCDrzXzySNic0/7NhtH1uD6mvR+yQ4+dtv49hvMJ1WyX2LGkLqwqaOl4ME0ajKJsq634zK
 Qlke7OLferhPNJ8Avt4scls0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6d19947223e70f34;
	Sun, 25 Oct 2026 21:14:22 +0000
X-Mizu-Trace-ID: 6d19947223e70f34
X-Migadu-Flow: FLOW_OUT
Message-ID: <7942f795-9473-45b1-8c36-309b9121df17@linux.dev>
Date: Sun, 25 Oct 2026 21:59:23 +0100
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
Subject: Re: [PATCH v3 01/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire link
 count for machine driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
 <20261023065216.3473883-2-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261023065216.3473883-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
> index 034c9ab6e4ea6..5b9410eff56eb 100644
> --- a/sound/soc/amd/acp/soc_amd_sdw_common.h
> +++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
> @@ -17,12 +17,15 @@
>  
>  #define ACP63_SDW_MAX_CPU_DAIS		8

do you still need this define? I was wondering why there's no ACP7X
equivalent but I can't see anyone using this ACP63 definition?

>  #define ACP63_SDW_MAX_LINKS		2
> +#define ACP7X_SDW_MAX_LINKS		4
>  
>  #define AMD_SDW_MAX_GROUPS		9
>  #define ACP63_PCI_REV			0x63
>  #define ACP70_PCI_REV			0x70
>  #define ACP71_PCI_REV			0x71
>  #define ACP72_PCI_REV			0x72
> +#define ACP7B_PCI_REV			0x7b
> +#define ACP7F_PCI_REV			0x7f
>  
>  #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
>  #define ASOC_SDW_FOUR_SPK		BIT(4)

