Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793558081;
	b=qiHrKRfIUNIj6gsCknsMO+myDVwTrO5sHQrRWjSr6f+0JIWkv0kDxBWSH+9Q15ru372t
	 1B0y73akh1tLTkHoC5tTn3y8yzlu9gP2cxswKRiMrYmuZw5Azo8YuanEFMcnM9aakdgR2
	 XzfBX1jTt6qnsbz0eI9iT+WENKfK/9VQK/rQqUnPZ+Lqp7yS2YgVPLxiD3Hdj77jR83g2
	 UBZyhrMSh5eNLzlaSfyrWA93r+JugEZIVfdgU1l34IcRATFZzn3wITbAMaFzb6pbzrouC
	 emnL5AY4aVAt2AwsXilKL5CtLrbVq/shFy67rxGurGcJjTgx6paca0ZcKDETUm//07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793558081;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2BDtWG0A86UxDWkm7wyWbWGXJK4ISAAXVZmqeVGUULI=;
	b=Yx7G4FtUJa6vQ286ENm9/QZ62fWPhHVIhpA5NzqUIycc4/FlWOmqueMXtdDoPwybmil3
	 0myml+kZRKQlXhjJnS4Y2xDTUEJIxiDBjWWiAVspHEFQIVxxGRweZfb4HGiokd2gkAfo6
	 zzKSaU5kCE2reEKOuCLTWOFWg4nqXJpXqMlOWQ54dGZ746h19fj/oia85iExB046LYmkn
	 O8ROkDLxN0HnsM5gvKrMaHk8n+GG4N7iRatNiheZDQnN3XXoYw7AZ4LYUTtQIMzbFe7uM
	 gpRalPzLliDirQ68h8Z+l7hxiIRDDZoPm19Mo/jUfDrfQKpd3AsjkbsXLJhG4Fb85eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n6tI8NAz;
	arc=none smtp.remote-ip=95.215.58.165
Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E14606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E14606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n6tI8NAz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mx5lXE61FEtyxVjZYvYVCCXsLI55yMipYdYQ5PE+OQ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793558077; v=1; x=1794162877;
 b=n6tI8NAzrCrhlJJ8BIyFOwlj1dhqVVmGfYolwSkHjxJBAytsOdIsEzJ2E0g/btcbU8X3nDSm
 mcxim5dl+mtwsjyxXI5UTWj75UGXWgFV7hoI0cyLjtdueoD2YFv7um9sRXD7x/E01tBVluIBbGC
 8dDi3N/U88+Q0YQzGHQ4Qnt8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id be63853a791001dd;
	Sun, 01 Nov 2026 18:34:37 +0000
X-Mizu-Trace-ID: be63853a791001dd
X-Migadu-Flow: FLOW_OUT
Message-ID: <15653bef-65b0-486f-aecd-ad7618d99cbd@linux.dev>
Date: Sun, 1 Nov 2026 19:28:00 +0100
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
Subject: Re: [PATCH v4 06/16] ASoC: amd: acp: add PDM controller selection for
 ACP7.B/7.F SoundWire machine driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
 <20261030094714.1123396-7-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261030094714.1123396-7-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 10:45, Vijendar Mukunda wrote:
> Add ASOC_SDW_ACP_DMIC1 quirk bit (BIT(6)) and pdm_sel field to
> amd_mc_ctx to support per-controller DMIC DAI selection on ACP7.B/7.F
> platforms.
> 
> In mc_probe(), read the active PDM controller from mach->pdata
> (populated via ACPI acp-audio-ep-port _DSD). When ACPI does not set
> pdm_sel, derive it from the quirk bits after dmi_check_system() and
> quirk_override are applied: ASOC_SDW_ACP_DMIC1 selects DMIC1;
> ASOC_SDW_ACP_DMIC selects DMIC0. Since only one PDM controller is
> active at a time, DMIC1 is checked first.

nit-pick: it'd be useful to explain the mapping between PDM controllers
and PDM microphones. Is this one controller:2mics?

Also does anything prevent DMIC and DMIC1 from being active simultaneously?

> 
> In create_dmic_dailinks(), select the SOF CPU DAI name based on
> pdm_sel: "acp-sof-dmic1" for ACP7X_PDM_DMIC1, "acp-sof-dmic0"
> otherwise on ACP7.B/7.F; all other platforms use "acp-sof-dmic".
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/acp/acp-sdw-sof-mach.c   | 44 +++++++++++++++++++++++++-
>  sound/soc/amd/acp/soc_amd_sdw_common.h |  3 ++
>  2 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> index 97b2e224492f..34a71f7a8c54 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> @@ -265,11 +265,31 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
>  				struct snd_soc_dai_link **dai_links, int *be_id, int no_pcm)
>  {
>  	struct device *dev = card->dev;
> +	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
> +	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
> +	const char *cpu_dai_name;
>  	int ret;
>  
> +	/*
> +	 * For ACP7.B/7.F platforms the PDM controller is selected from ACPI
> +	 * acp-audio-ep-port and stored in amd_ctx->pdm_sel. Use the
> +	 * matching SOF DAI name ("acp-sof-dmic0" or "acp-sof-dmic1").
> +	 * All other platforms use the generic "acp-sof-dmic" DAI.
> +	 */
> +	switch (amd_ctx->acp_rev) {
> +	case ACP7B_PCI_REV:
> +	case ACP7F_PCI_REV:
> +		cpu_dai_name = (amd_ctx->pdm_sel == ACP7X_PDM_DMIC1) ?
> +				"acp-sof-dmic1" : "acp-sof-dmic0";
> +		break;
> +	default:
> +		cpu_dai_name = "acp-sof-dmic";
> +		break;
> +	}
> +
>  	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
>  					    0, 1, // DMIC only supports capture
> -					    "acp-sof-dmic", platform_component->name,
> +					    cpu_dai_name, platform_component->name,
>  					    "dmic-codec", "dmic-hifi", no_pcm,
>  					    asoc_sdw_dmic_init, NULL);
>  	if (ret)
> @@ -378,6 +398,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>  static int mc_probe(struct platform_device *pdev)
>  {
>  	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
> +	struct amd_pdm_pdata *pdm_pdata;
>  	struct snd_soc_card *card;
>  	struct amd_mc_ctx *amd_ctx;
>  	struct asoc_sdw_mc_private *ctx;
> @@ -398,6 +419,10 @@ static int mc_probe(struct platform_device *pdev)
>  		amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
>  		break;
>  	}
> +	if (mach->pdata) {
> +		pdm_pdata = mach->pdata;
> +		amd_ctx->pdm_sel = pdm_pdata->pdm_sel;
> +	}
>  	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return -ENOMEM;
> @@ -419,6 +444,23 @@ static int mc_probe(struct platform_device *pdev)
>  		sof_sdw_quirk = quirk_override;
>  	}
>  
> +	/*
> +	 * If ACPI did not set pdm_sel (no acp-audio-ep-port in _DSD), derive
> +	 * it from the quirk bits. ACPI takes priority: quirks are only
> +	 * consulted when pdm_sel is still zero. PDM controller selection is
> +	 * only meaningful on ACP7B/7F platforms.
> +	 * ASOC_SDW_ACP_DMIC selects DMIC0 (default); ASOC_SDW_ACP_DMIC1
> +	 * overrides to DMIC1.
> +	 */
> +	if (!amd_ctx->pdm_sel &&
> +	    (amd_ctx->acp_rev == ACP7B_PCI_REV ||
> +	     amd_ctx->acp_rev == ACP7F_PCI_REV)) {
> +		if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC1)
> +			amd_ctx->pdm_sel = ACP7X_PDM_DMIC1;
> +		else if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC)
> +			amd_ctx->pdm_sel = ACP7X_PDM_DMIC0;
> +	}
> +
>  	log_quirks(&pdev->dev);
>  
>  	ctx->mc_quirk = sof_sdw_quirk;
> diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
> index c979adf4e978..07837a2cfa54 100644
> --- a/sound/soc/amd/acp/soc_amd_sdw_common.h
> +++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
> @@ -29,6 +29,7 @@
>  #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
>  #define ASOC_SDW_FOUR_SPK		BIT(4)
>  #define ASOC_SDW_ACP_DMIC		BIT(5)
> +#define ASOC_SDW_ACP_DMIC1		BIT(6)	/* select DMIC1 controller for ACP7.B/7.F */
>  #define ASOC_SDW_CODEC_SPKR		BIT(15)
>  
>  #define AMD_SDW0	0
> @@ -94,6 +95,8 @@
>  struct amd_mc_ctx {
>  	unsigned int acp_rev;
>  	unsigned int max_sdw_links;
> +	/* PDM controller selection, copied from amd_pdm_pdata at probe time */
> +	unsigned int pdm_sel;
>  };
>  
>  int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);

