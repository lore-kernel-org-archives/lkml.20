Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207740;
	b=z3WTcfbwIm896buzpEmTRC8Klkf7lpIJHFUvmtltjiJcqt/CgNDKHHK3iwaCcPP7YzFZ
	 65e4i78S/eAoj5w6G3wQE9U5LZZYcTQr23i8+oIcTChV0mqWxr9vABBOLUufuV4vRqSD2
	 uBgeiZH+g8OzQOO3LYIGGPPW+y2ty50o/GJzGW9X9SMiJNMtqH5/ZDzJoKH1J1U/GjQq5
	 szemY23ZfToaN8WpuHcxtMeGZXo0Is0Ul62dmCG4u+7PQLEfCHjyEMyMgj80/AfIyNKvE
	 2o4KhElx1l/0m/mbx0dql6EbdvzBflTCh+HKg+XyAyzLKKpRMA4QgslLovb1kL3bfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207740;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LcyRuhzfqEmKZLcyNf1Ye82CQkHc3k/JCJKVVIHSFjw=;
	b=fr2/YM9urF3T3S48zkKGGdL1Svf5gBN/+JZ6YZOdXmQ+y6sOIMiCgZTW4CXMVYhAL5us
	 4JhYfDvJGP8Na8ku1GJGVufBwkgITOfo2O2weHdc0KptUIlH07CtC5VxrQZFujRVNcDlC
	 LpLcfrvMNejlpGKjxnsjjDonXvXfUIYENBCqPToatBu7HqFF30T7BmvT4X0Cr6tWe+Eh8
	 zDsjavHXNYUW/HnsFFa8tYCJQ2rSPAqL5M4zc7rRnh4L0YpZ0tp28RlXRMkKjoY0FNOby
	 mEYkVakKuO3dyp7win3SHvBZCr9yfK/B1/M2r7bHAAqJpGN4zIyMV0BQNgxM2KYrbdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvT0MJF0;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CA0606A31C;
	Mon,  9 Nov 2026 07:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvT0MJF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794207740; x=1825743740;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jqjYvSPZdN4womRIoUf+i5XWUpGSoi8nao30F9v+XSg=;
  b=kvT0MJF0sjQsgcM8YKfFAonASpt78uycKs/33jm2zJJgnJ0AR61NJWn0
   N6Z5yXmgXH4kxeBwptn/oG8+hCRp0GZ0x16k+0oWniGFTxiO0jzEYS1bE
   AO6GMv2u93vUGpQf1osByEWpVk/5g7clMadjoW0T+qY9l7Zjh4oicHE0+
   i7j10UQtRQM1sWAysdLAo9ky0hJvNBIl6ojcO5nUxNPsrQLxvQXYJpZML
   HdKM9cHMAO1x1Evw9vSX2gmBqjTVaAjiiOQW4FXoqv/+JOzCjPbBgv/+U
   Wn9QLCkrGLRb/46DNdNCYNvxEju4BxvOdMwX6IL1yzOLSHfMNWzp1t3et
   A==;
X-CSE-ConnectionGUID: A0ZEgw30QtmEeV5knMMubw==
X-CSE-MsgGUID: jryb9GPFT6GZLAKY/xbTLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2953411"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2953411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 23:02:19 -0800
X-CSE-ConnectionGUID: vIH1AQMfRqSt6uHHD23P0Q==
X-CSE-MsgGUID: Lu4bEVqtSwCNeuKtlIpwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8369481"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.244.60]) ([10.245.244.60])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 23:02:15 -0800
Message-ID: <883462b2-1060-4e1d-b344-1a2fe081bc9e@linux.intel.com>
Date: Mon, 9 Nov 2026 09:02:54 +0200
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
Subject: Re: [PATCH v2 3/6] ASoC: soc-acpi: move common function topology
 helpers
To: Syed Saba Kareem <syed.sabakareem@amd.com>, broonie@kernel.org
Cc: Sunil-kumar.Dommati@amd.com, vijendar.mukunda@amd.com,
 Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
 Siva Subramanian Ravi Saravanan <sravisar@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20261107192744.2027264-1-syed.sabakareem@amd.com>
 <20261107192744.2027264-4-syed.sabakareem@amd.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20261107192744.2027264-4-syed.sabakareem@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/11/2026 21:26, Syed Saba Kareem wrote:
> From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> 
> From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
> 
> Move the Intel function topology helpers and the topology device enum
> to soc-acpi so that they can be shared with other platforms too. The
> moved helpers are:
>  - get_platform_name() as snd_soc_acpi_get_platform_name()

This function is SOF specific (expetcts the string to be
sof-<platform>), the generic name after move did not reflect this fack.

>  - tplg_files_exist() as snd_soc_acpi_tplg_files_exist()

This only checks for existance of a topology file, probably better off
in soc-topology.c ?
and a comment inline for the moved function later.

>  - get_tplg_filename() as snd_soc_acpi_get_tplg_filename()
> 
> No functional change for Intel.

It looks like there is a build regression according to lkp@intel.com

> Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> ---
>  include/sound/soc-acpi.h                      | 25 +++++
>  .../intel/common/sof-function-topology-lib.c  | 93 ++-----------------
>  sound/soc/soc-acpi.c                          | 73 +++++++++++++++
>  3 files changed, 106 insertions(+), 85 deletions(-)
> 
> diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
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

this patch does a but  more than just move function which is not
mentioned in commit title, nor in the message..

> +	TPLG_DEVICE_MAX
> +};
> +
> +int snd_soc_acpi_get_platform_name(struct snd_soc_card *card,
> +				   const struct snd_soc_acpi_mach *mach, char *platform);
> +bool snd_soc_acpi_tplg_files_exist(struct device *dev, const char *tplg_files);
> +char *snd_soc_acpi_get_tplg_filename(struct device *dev, const char *prefix,
> +				     const char *platform, const char *tplg_dev_name,
> +				     int dai_link_id, int tplg_dev);
> +
>  #endif
> diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
> index 57e089f8e721..413d6f11a00e 100644
> --- a/sound/soc/intel/common/sof-function-topology-lib.c
> +++ b/sound/soc/intel/common/sof-function-topology-lib.c
> @@ -13,88 +13,11 @@
>  #include <sound/soc-acpi.h>
>  #include "sof-function-topology-lib.h"
>  
> -enum tplg_device_id {
> -	TPLG_DEVICE_SDCA_JACK,
> -	TPLG_DEVICE_SDCA_AMP,
> -	TPLG_DEVICE_SDCA_MIC,
> -	TPLG_DEVICE_INTEL_PCH_DMIC,
> -	TPLG_DEVICE_HDMI,
> -	TPLG_DEVICE_SSP_JACK,
> -	TPLG_DEVICE_SSP_AMP,
> -	TPLG_DEVICE_SSP_BT,
> -	TPLG_DEVICE_SSP_HDMI_IN,
> -	TPLG_DEVICE_LOOPBACK_VIRTUAL,
> -	TPLG_DEVICE_MAX
> -};
> -
>  #define SDCA_DEVICE_MASK (BIT(TPLG_DEVICE_SDCA_JACK) | BIT(TPLG_DEVICE_SDCA_AMP) | \
>  			  BIT(TPLG_DEVICE_SDCA_MIC))
>  
>  #define SOF_INTEL_PLATFORM_NAME_MAX 4
>  
> -static int get_platform_name(struct snd_soc_card *card,
> -			     const struct snd_soc_acpi_mach *mach, char *platform)
> -{
> -	int ret;
> -
> -	ret = sscanf(mach->sof_tplg_filename, "sof-%3s-*.tplg", platform);
> -	if (ret != 1) {
> -		dev_err(card->dev, "Invalid platform name of tplg %s\n",
> -			mach->sof_tplg_filename);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static bool tplg_files_exist(struct device *dev, const char *tplg_files)
> -{
> -	const struct firmware *fw;
> -	int ret;
> -
> -	ret = firmware_request_nowarn(&fw, tplg_files, dev);
> -	if (!ret) {
> -		release_firmware(fw);
> -		return true;
> -	}
> -
> -	dev_warn(dev,
> -		 "Failed to open topology file: %s, you might need to\n",
> -		 tplg_files);
> -	dev_warn(dev,
> -		 "download it from https://github.com/thesofproject/sof-bin/\n");
> -	return false;
> -}
> -
> -static char *get_tplg_filename(struct device *dev, const char *prefix,
> -			       const char *platform, const char *tplg_dev_name,
> -			       int dai_link_id, int tplg_dev)
> -{
> -	char *filename = NULL;
> -
> -	/*
> -	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
> -	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
> -	 * as the nhlt blob is platform dependent.
> -	 */
> -	switch (tplg_dev) {
> -	case TPLG_DEVICE_INTEL_PCH_DMIC:
> -	case TPLG_DEVICE_SSP_JACK:
> -	case TPLG_DEVICE_SSP_AMP:
> -	case TPLG_DEVICE_SSP_BT:
> -	case TPLG_DEVICE_SSP_HDMI_IN:
> -		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
> -					  prefix, platform, tplg_dev_name, dai_link_id);
> -		break;
> -	default:
> -		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-id%d.tplg",
> -					  prefix, tplg_dev_name, dai_link_id);
> -		break;
> -	}
> -
> -	return filename;
> -}
> -
>  static int get_dmic_tplg_dev(struct device *dev, int dmic_num,
>  			     int *tplg_dev, char **tplg_dev_name)
>  {
> @@ -182,7 +105,7 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
>  	int ret;
>  	int i;
>  
> -	ret = get_platform_name(card, mach, platform);
> +	ret = snd_soc_acpi_get_platform_name(card, mach, platform);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -235,13 +158,13 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
>  		if (tplg_mask & BIT(tplg_dev))
>  			continue;
>  
> -		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
> -					      dai_link->id, tplg_dev);
> +		tplg_file = snd_soc_acpi_get_tplg_filename(card->dev, prefix, platform,
> +							   tplg_dev_name, dai_link->id, tplg_dev);
>  		if (!tplg_file)
>  			return -ENOMEM;
>  
>  		/* Check presence of sub-topologies */
> -		if (!tplg_files_exist(card->dev, tplg_file)) {
> +		if (!snd_soc_acpi_tplg_files_exist(card->dev, tplg_file)) {
>  			devm_kfree(card->dev, tplg_file);
>  			if (best_effort)
>  				continue;
> @@ -275,7 +198,7 @@ int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
>  	int ret;
>  	int i;
>  
> -	ret = get_platform_name(card, mach, platform);
> +	ret = snd_soc_acpi_get_platform_name(card, mach, platform);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -307,13 +230,13 @@ int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
>  		if (tplg_mask & BIT(tplg_dev))
>  			continue;
>  
> -		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
> -					      dai_link->id, tplg_dev);
> +		tplg_file = snd_soc_acpi_get_tplg_filename(card->dev, prefix, platform,
> +							   tplg_dev_name, dai_link->id, tplg_dev);
>  		if (!tplg_file)
>  			return -ENOMEM;
>  
>  		/* Check presence of sub-topologies */
> -		if (!tplg_files_exist(card->dev, tplg_file)) {
> +		if (!snd_soc_acpi_tplg_files_exist(card->dev, tplg_file)) {
>  			devm_kfree(card->dev, tplg_file);
>  			if (best_effort)
>  				continue;
> diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
> index 270f9777942f..7e9d7b3c6b32 100644
> --- a/sound/soc/soc-acpi.c
> +++ b/sound/soc/soc-acpi.c
> @@ -4,7 +4,9 @@
>  //
>  // Copyright (c) 2013-15, Intel Corporation.
>  
> +#include <linux/device.h>
>  #include <linux/export.h>
> +#include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <sound/soc-acpi.h>
>  
> @@ -200,5 +202,76 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_sdw_link_slaves_found);
>  
> +int snd_soc_acpi_get_platform_name(struct snd_soc_card *card,
> +				   const struct snd_soc_acpi_mach *mach, char *platform)
> +{
> +	int ret;
> +
> +	/* platform must hold at least 8 bytes */
> +	ret = sscanf(mach->sof_tplg_filename, "sof-%7[^-]-*.tplg", platform);
> +	if (ret != 1) {
> +		dev_err(card->dev, "Invalid platform name of tplg %s\n",
> +			mach->sof_tplg_filename);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_acpi_get_platform_name);
> +
> +bool snd_soc_acpi_tplg_files_exist(struct device *dev, const char *tplg_files)
> +{
> +	const struct firmware *fw;
> +	int ret;
> +
> +	ret = firmware_request_nowarn(&fw, tplg_files, dev);
> +	if (!ret) {
> +		release_firmware(fw);
> +		return true;
> +	}
> +
> +	dev_warn(dev,
> +		 "Failed to open topology file: %s, you might need to\n",
> +		 tplg_files);
> +	dev_warn(dev,
> +		 "download it from https://github.com/thesofproject/sof-bin/\n");

This is certainly true for Intel platforms but the print makes this also
SOF specific which is not reflected in the function name.

> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_acpi_tplg_files_exist);
> +
> +char *snd_soc_acpi_get_tplg_filename(struct device *dev, const char *prefix,
> +				     const char *platform, const char *tplg_dev_name,
> +				     int dai_link_id, int tplg_dev)
> +{
> +	char *filename = NULL;
> +
> +	/*
> +	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
> +	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
> +	 * as the nhlt blob is platform dependent.
> +	 */
> +	switch (tplg_dev) {
> +	case TPLG_DEVICE_INTEL_PCH_DMIC:
> +	case TPLG_DEVICE_SSP_JACK:
> +	case TPLG_DEVICE_SSP_AMP:
> +	case TPLG_DEVICE_SSP_BT:
> +	case TPLG_DEVICE_SSP_HDMI_IN:
> +	case TPLG_DEVICE_ACP_SDW_JACK:
> +	case TPLG_DEVICE_ACP_SDW_AMP:
> +	case TPLG_DEVICE_ACP_SDW_MIC:
> +	case TPLG_DEVICE_ACP_DMIC:
> +		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
> +					  prefix, platform, tplg_dev_name, dai_link_id);
> +		break;
> +	default:
> +		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-id%d.tplg",
> +					  prefix, tplg_dev_name, dai_link_id);
> +		break;
> +	}
> +
> +	return filename;

This will also sonstruct a SOF specific file name, yet the name reads
generic.

> +}
> +EXPORT_SYMBOL_GPL(snd_soc_acpi_get_tplg_filename);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("ALSA SoC ACPI module");

-- 
Péter

