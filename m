Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887380;
	b=sQy8YfYDndVmngAOT8kHAPOwkxj5+RpB6YJbUQCliOwMf0k3csdosfBFg/WQrxQH3knS
	 TIr3oR6jIF/lNjNYNcagMZTQDP83vuD8wJnJD+aLwsSiCXA7dIgf+go5EONtMoJj9izXJ
	 nZ5229G3eCREnCa8sMPkDslGHgHUAdnQ+6WdjzW0mJhQSxnHC9yFlbg2AX/ETvBfMzs5m
	 g3AZ1vh7clmBeZ/JS5GimWRMQXoPC6EpMvjAY9kilxI0qEFNqBxKyZPBeYm3RAn5iTeSH
	 0lm4+muGslQkzhRBfJSQl2q07FqlwHj6703Yn4R12fUbcJyog3qZ+j52bmubeKVC84A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887380;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GipgqX03fL8IJKeqP3aLpQTPOw8KdWrBwRjYq+Cf2RQ=;
	b=E7teJc1UNbMWvCd1ZygDJRUz2oxcwWNSN7VBwLNTv/GayVzYso3O2DMwTZ3XIGcw/hJC
	 c7ccCRTGdEHDJpYlU2hAVn941IwiXJRe9fZZrc58AG+1N/eESOQOJAW6aBeT+FEekZtVI
	 UI4mWlYd/NaODuc/ZIzv52SgDzxt3eLrOFPQA4ru53D7+Kf7OfonkcPvZQzGWrN4DgSgs
	 gne+++H/B+irOOlXR+yfSE1bGcVzVKJTt4rDICcPoox8GUa4J2qDguWqerjMYsqBWuq75
	 PuVCaXuqnpENtOwPG89DHOdzW6WK2G+jlm+uYXa7rB9bcsntc1YIdHaZj+NAA6tu0RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BYfVkqzq;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4C606A33A;
	Thu,  5 Nov 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A4C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BYfVkqzq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793887380; x=1825423380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a73n9FLUWOJRpJa4fCnhE/GuZsgtIoF6HVvMf7dbiMk=;
  b=BYfVkqzq3HosM2cAWu4Y2hCDYxUQrXBxzpmMrFHWEuSPgsMm3Zf3T3Zh
   +hGVrzOfPtZokk5q53qK6Kdkp9/UNz3XaLIMmczK7hvoExlFY8BABnSTz
   bDPiiLTD/F2/6LoPRC3j/WfMBFfpZNhB90ZNxiC+wMMvAz8zKQ5fDyD53
   6puLZf6HEGaF/qPknwx2WhEG3cTPa0VtsBIaJQUYFsmPTF/2UjR+g77eL
   9kKbjM466Wj7fOLA6OQ5vyC62xpcP45yIts0gxNm9yVjULy5xjboKM1KV
   TzdDbeccPF8wafO9u6hoPECIctYUyXbmzJ7qEauidVdPcCLhiyNFpexNi
   w==;
X-CSE-ConnectionGUID: 959j4PAhQ1yzhMn9ZoudZg==
X-CSE-MsgGUID: P8il7HpFTB2K18shEqVhRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2545659"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2545659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:02:59 -0800
X-CSE-ConnectionGUID: T/jJBSbPRY+9NdBGaETBGA==
X-CSE-MsgGUID: Y2DJbzq2RTyip52rS9JteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6920010"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.149]) ([10.245.244.149])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:02:55 -0800
Message-ID: <d98e6241-c3e1-4e18-a133-43fc7daefc2d@linux.intel.com>
Date: Thu, 5 Nov 2026 16:03:32 +0200
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
Subject: Re: [PATCH] ASoC: SOF: amd: Load alternatively signed firmware with
 an "_l" suffix
To: Mario Limonciello <mario.limonciello@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104-superm1-lms-sound-v1-1-c50b9284bcc2@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20261104-superm1-lms-sound-v1-1-c50b9284bcc2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/11/2026 23:53, Mario Limonciello wrote:
> Platforms ship BIOS with either a default or an alternative trust
> authority. The PSP validates the signed DSP firmware image so it must
> be signed with the matching scheme. Firmware for the alternative scheme
> is named with an "_l" suffix before the extension
> (e.g. "sof-X-code.bin" becomes "sof-X-code_l.bin").
> 
> The PSP reports the signing type in bit 6 of C2PMSG_63
> (0 = default, 1 = alternative). Read it over SMN, as is already done
> for the other PSP mailbox registers, when building the signed code
> image name, and add the "_l" suffix for the alternative scheme.
> 
> Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  sound/soc/sof/amd/acp.c | 33 ++++++++++++++++++++++++++++++++-
>  sound/soc/sof/amd/acp.h |  2 ++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index 86e2402b8ffd2..2f1a8be8460d4 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -1212,6 +1212,31 @@ static int amd_sof_sdw_exit(struct snd_sof_dev *sdev)
>  }
>  #endif
>  
> +/*
> + * The PSP validates the signed DSP firmware, so it must be signed with the
> + * scheme the platform firmware uses: images for the alternative scheme are
> + * named with an "_l" suffix before the extension, the default ones have none.
> + */
> +static int amd_sof_acp_get_fw_suffix(struct snd_sof_dev *sdev, const char **suffix)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = amd_smn_read(0, MP0_C2PMSG_63_REG, &val);
> +	if (ret) {
> +		dev_err(sdev->dev, "failed to read PSP firmware signing type: %d\n", ret);

I would read this in case of error as the signing type is -22 (or
whatever the error code returned is)

> +		return ret;
> +	}
> +
> +	/* all ones means the register isn't accessible */
> +	if (val == 0xffffffff)
> +		return -EIO;

this would also merit an error print?

> +
> +	*suffix = (val & MP0_C2PMSG_63_FW_SIGN_ALT) ? "_l" : "";
> +
> +	return 0;
> +}
> +
>  int amd_sof_acp_probe(struct snd_sof_dev *sdev)
>  {
>  	struct pci_dev *pci = to_pci_dev(sdev->dev);
> @@ -1448,8 +1473,14 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>  	sdev->debug_box.size = BOX_SIZE_1024;
>  
>  	if (adata->acp_sof_signed_firmware_image) {
> +		const char *fw_suffix;
> +
> +		ret = amd_sof_acp_get_fw_suffix(sdev, &fw_suffix);
> +		if (ret)
> +			goto free_ipc_irq;
> +
>  		adata->fw_code_bin = devm_kasprintf(sdev->dev, GFP_KERNEL,
> -						    "sof-%s-code.bin", chip->name);
> +						    "sof-%s-code%s.bin", chip->name, fw_suffix);
>  		if (!adata->fw_code_bin) {
>  			ret = -ENOMEM;
>  			goto free_ipc_irq;
> diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
> index b17a36b31ee0d..81eeeabc5cf5c 100644
> --- a/sound/soc/sof/amd/acp.h
> +++ b/sound/soc/sof/amd/acp.h
> @@ -97,6 +97,8 @@
>  #define ACP_EXT_INTR_ERROR_STAT			0x20000000
>  #define MP0_C2PMSG_114_REG			0x3810AC8
>  #define MP0_C2PMSG_73_REG			0x3810A24
> +#define MP0_C2PMSG_63_REG			0x38109FC
> +#define MP0_C2PMSG_63_FW_SIGN_ALT		BIT(6)
>  #define MBOX_ACP_SHA_DMA_COMMAND		0x70000
>  #define MBOX_ACP_IRAM_DRAM_FENCE_COMMAND	0x80000
>  #define MBOX_DELAY_US				1000
> 
> ---
> base-commit: 68e9934bd17af558b62cac8a444de28d4d5cdb9f
> change-id: 20261104-superm1-lms-sound-c0f429351fc7
> 
> Best regards,
> --  
> Mario Limonciello <mario.limonciello@amd.com>

-- 
Péter

