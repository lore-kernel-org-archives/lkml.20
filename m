Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422057;
	b=o3zTPjq7ZvRaQz1yFDmLZAcpolQuBQDDBglmZvTpYQRz+qgn/1/HqbE+WO6qwWMvbS3x
	 +vxoG4dTIjbI4mkcdp2DKuMKPJmmRikjZhN4wupOZ1aoo1bCyOpq5jp/ikgWVi0sYy8vR
	 zEiNtH5ijrQWw2UMT1NZPLeQbWwZSDxcZiPhNuZtIwsfXeqfBuP8i4wb2trUsIyoPE6tz
	 aKPNcvIanDBV5b24JVP+9PhJfO6fxMOHNLfUMx6aRt26TZoUDe6ZK6bvaq5WOnq5Qwnx/
	 OCJwRk887Fe6/Oit2Ujwz5XCbkufCF4jnBMw+hvbeRTPZxsY3M5lEZmbSA85ZCDIsGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422057;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YMc/YldEbzl8PQxcS39NWhbEp7wlqnxUy5n/VNFbcwc=;
	b=hpRKbVr8q4VOuyiN7r+w27sRGmP5B1CLxqbMRRYbKGUuN4U6hJ8nFwjIpUR80cvDG3vM
	 ca/qCCjRSBLOGLz4dwGBTMDELhylNQEMjhvG19gMhfFrF2R+gVNY7T5uoNCM009VVaDAK
	 WAdEvLiGkH3XpiyxH5RKBxQGt6gfCL6eb72Nng0zcaOoJYA8ShrsjKzg7zAicF6c9PyDL
	 L+4/oQ26Bz45p/pgBsw+0H3aUm6BDavWLufuVZ2y2BMoPSKEwpeUM4N9Zrfx9VW7XpN+4
	 hViToqCmlLHhMVLB9ZMpnOA7cnNX2IDWpqwxAUThDPlwqEA3DUDfRehk5oz5Iaw43rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eV9Twa93;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F73606A31C;
	Wed, 11 Nov 2026 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eV9Twa93
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091541F00A05;
	Wed, 11 Nov 2026 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794422057;
	bh=YMc/YldEbzl8PQxcS39NWhbEp7wlqnxUy5n/VNFbcwc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eV9Twa93jLQr/9/0MI2C860TI2Kqzoo1cD2Oi2LBLlVl357/8yWYAXuRf6qEHvzTM
	 Syxf9ZFS+/KhtkjlDwhjsZ984SAQOKhtOIKG19a1Edm54X18lxwTIH3tICNj/MiX2D
	 lBabGOgt/eH8GHHJF07UsUpMqpVk+zVAVYjlRETjscKb/razQO0SsEKcDz3du+aXAU
	 rQb6qRKQIoVDq0JVR/e9cizVlYM6sUvpW3/7KJC4Qjgw3xp2KYFYZJduOL1lsIIY/Q
	 TkjWSNwNiUoPH4txvTR5GVJCvCS7Q9ePagG12dlehU390Qe4sqtASA4F4ayW+nId+O
	 XyP9NTxMHg18g==
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
Subject: Re: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology
 helpers
From: Mark Brown <broonie@kernel.org>
To: Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: broonie@kernel.org, Sunil-kumar.Dommati@amd.com, 
 vijendar.mukunda@amd.com, Mario.Limonciello@amd.com, 
 venkataprasad.potturu@amd.com, 
 Siva Subramanian Ravi Saravanan <sravisar@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20261108193119.2308421-4-syed.sabakareem@amd.com>
References: <20261108193119.2308421-1-syed.sabakareem@amd.com>
 <20261108193119.2308421-4-syed.sabakareem@amd.com>
Date: Wed, 11 Nov 2026 18:34:11 +0000
Message-Id: <179442205142.484483.13609312009662203150.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xc2X2TKpMwnE88lVaAv6UGKfYzk19cda0V2IvGrdEpU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+bFV5uulRYpx93nIZpg2qSgb7LA3q446FrJJcHBuqX
 bRWSyaoo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABPZuYuRYRe79eawKUmsft9M
 9vk8397EbxCe/jVfZK6tQqJav3b1FYZ/pqsmvBBfxJs7JepOsfGCuapnDbpSqpqP/T2cx/wv/M5
 JRgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Move the Intel function topology helpers and the topology device enum
> to soc-acpi so that they can be shared with other platforms too. The
> moved helpers are:

> index 2ee303b791dc..aea47a42f43d 100644
> --- a/include/sound/soc-acpi.h
> +++ b/include/sound/soc-acpi.h
> @@ -257,4 +257,29 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
>  					const struct snd_soc_acpi_link_adr *link,
>  					struct sdw_peripherals *peripherals);
>  
> +enum tplg_device_id {
> +	TPLG_DEVICE_SDCA_JACK,
> +	TPLG_DEVICE_SDCA_AMP,
> +	TPLG_DEVICE_SDCA_MIC,
> +	TPLG_DEVICE_INTEL_PCH_DMIC,
> +	TPLG_DEVICE_HDMI,
> +	TPLG_DEVICE_SSP_JACK,
> +	TPLG_DEVICE_SSP_AMP,
> +	TPLG_DEVICE_SSP_BT,
> +	TPLG_DEVICE_SSP_HDMI_IN,
> +	TPLG_DEVICE_LOOPBACK_VIRTUAL,
> +	TPLG_DEVICE_ACP_SDW_JACK,
> +	TPLG_DEVICE_ACP_SDW_AMP,
> +	TPLG_DEVICE_ACP_SDW_MIC,
> +	TPLG_DEVICE_ACP_DMIC,
> +	TPLG_DEVICE_MAX
> +};

Might be sensible to have some namespacing as part of this move (eg,
adding an ACPI prefix).

>  config SND_SOC_ACPI_INTEL_MATCH
>  	tristate
> -	select SND_SOC_ACPI if ACPI
> +	select SND_SOC_ACPI

This seems likely to cause issues on systems without ACPI, perhaps this
should just depend on ACPI?  !ACPI builds are pure coverage testing for
x86, they're not practical.

-- 
Mark Brown <broonie@kernel.org>
