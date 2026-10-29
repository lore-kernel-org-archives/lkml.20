Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259974;
	b=PxakuuDZr1tJTVYJ+zFudSJDQgBNAk+bRpf1yZ3jn34d7si2XlnSzNX5oz01s4I7k1BL
	 0sNWycgl8THNxomSQ+zn4lVO7meTsmZaswD3zFSKAxePOkJU9HAoWtIFyWM+wLtbyZE4J
	 LlNwjE/pe1OqDWaZmi2m6D2COkw6sAZJAQyRrJ6Poad5Gl/5UeSIpY4DKiTA5Rw3dzUOQ
	 4AnV2kSkOYroIDewkH7O51ajIlATnCC+nAiCuAH3RsAAb8i7FW/Ce9JNJZYFdFeWfMGJ0
	 vOBryMJMkC+FX6+NxKMWb+JokJpmvdANY9rACQhAEoIGNWsDKmX701BjgAzbIL5b0Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259974;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hDPcx0zS9C4uw8gDkeYaMVywK+rChCE62DCbks73waY=;
	b=Pgx0zrdy/j7m0o+6o9nafPHZtrTHRTHQ/rzjZL2/NloGHwlIAfnCbht3gTu/G6H9xdGq
	 mz7kHWX/86Ib7sIFV7L8hFPsWNiJ7NAi3biHLIgo6he4KqnbMoSSm8er4P4DOX8UzSxnW
	 sEeHQr4OEsRrMD+Hqxsp1/LuCH7tvdqD0ezGDpQJ1+C5SoMlB6lEwhOOqpgHYrXtWoDPU
	 rsnF45D1sUkE2R+tWtRcWvncvSf1jNxkbuW0qd9Fhoz4vzBBfvcdztyutqLxKW0ltEeoD
	 Vybnjl+SiuAzh9Zehwdlt9lcmEiCfx3Zo3+QHFgmbxz0fBYPys5hKIyU/cdAWnCeWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gkgeZMka;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3C606A31A;
	Thu, 29 Oct 2026 07:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gkgeZMka
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793259975; x=1824795975;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7nM3qfG5zpENM3bUedHWCR7ahkBU2tOxlJw8SAC78uc=;
  b=gkgeZMkaK77DVMF9T7IPTUl9gayB79KmY9hbZc+ybxx4Cps6et+8TC7w
   POrId6Qhjz2+q8opKxQxi/eJ8SniOotULsYADIfWbhCeqiilA2mrlfTsk
   y0QiX+TLWL9MCpBIORsgVSfkom9WJSkI6gUwdiXhul7IbY3p/3/CgOQy/
   sX5adh6QnaXdf196rHM6U8dIT6brqom7J5JmAhS48/dIgx0cfgQKra6Ne
   42Fid5JiRfwms0z906LsrvTn8f/lEHKeRHDNhDnRisnbHcDFx0S+U0te8
   NOCBGZR+8TWKKqYXl56SXgXXgYFB0kXloLfmsbUuofeRc1fpK6U1MDrXD
   Q==;
X-CSE-ConnectionGUID: 9iQC4CMHTm6DgXPSiX6Icg==
X-CSE-MsgGUID: 4ry5soaoRxS5yiujBTufPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1891709"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1891709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:46:14 -0700
X-CSE-ConnectionGUID: MIFK3LTMRL2003gE9JEPAQ==
X-CSE-MsgGUID: IYYn6DcrR1u62vNbhHPEPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4953506"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.57]) ([10.245.245.57])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:46:10 -0700
Message-ID: <3d074141-2360-4a63-9fcb-ac8f86a8cbb0@linux.intel.com>
Date: Thu, 29 Oct 2026 09:46:45 +0200
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
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before freeing
 its DMA buffers
To: Sasha Levin <sashal@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 yifan2.li@intel.com
References: <20261028144446.992948-1-sashal@kernel.org>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20261028144446.992948-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/10/2026 16:44, Sasha Levin wrote:
> hda_dsp_probe() starts the CORB/RIRB DMA engines through
> hda_dsp_ctrl_init_chip(), but neither hda_dsp_remove() nor the error
> path of hda_dsp_probe() stops them before hda_dsp_stream_free() frees
> the CORB/RIRB ring buffer and the position buffer.  Unsolicited
> responses also stay enabled, so the controller can keep writing RIRB
> entries into the freed page.
> 
> Until commit 9e6966f70404 ("ASoC: SOF: Intel: hda: Keep non-alt mlinks
> powered at probe on ACE2+"), hda_init_caps() dropped the initial
> references to the non-alternate links, and dropping the last one
> stopped the command DMA, so a probe that failed later, e.g. because
> the firmware is missing, did not leave it running.  Now it does, and
> as the probe runs from a work item, the device stays bound after the
> failure, with bus mastering enabled and the DMA engines pointed at
> freed memory.
> 
> Normal removal resumes the device first, which restarts the command
> DMA, so there the ring buffer is freed while the DMA is running until
> pci_disable_device() clears bus mastering.
> 
> Stop the controller with hda_dsp_ctrl_stop_chip() before freeing the
> buffers, as is done on suspend, and export it for use from hda.c.
> 
> This was reproduced by binding SOF in DSPless mode to a QEMU
> ich9-intel-hda: after the probe fails with "SOF firmware and/or
> topology file not found", CORB and RIRB DMA are still running with
> unsolicited responses and bus mastering enabled, and the page they use
> is soon reused as a page table.

This is indeed a possibility which I have overlooked.
FWIW, Li Yifan spotted the same issue earlier:
https://github.com/thesofproject/linux/pull/5976

but using hda_dsp_ctrl_stop_chip() is the better way.
> Fixes: dd96daca6c83 ("ASoC: SOF: Intel: Add APL/CNL HW DSP support")

Can you drop this Fixes tag, the hda-ctrl.c hunk will not apply nicely
to older stable kernels
With the removed tag:
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: 9e6966f70404 ("ASoC: SOF: Intel: hda: Keep non-alt mlinks powered at probe on ACE2+")
> Signed-off-by: Sasha Levin <sashal@kernel.org>



> ---
>  sound/soc/sof/intel/hda-ctrl.c | 1 +
>  sound/soc/sof/intel/hda.c      | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
> index aeb34310eebd6..333f6bbea7539 100644
> --- a/sound/soc/sof/intel/hda-ctrl.c
> +++ b/sound/soc/sof/intel/hda-ctrl.c
> @@ -349,6 +349,7 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
>  
>  	bus->chip_init = false;
>  }
> +EXPORT_SYMBOL_NS(hda_dsp_ctrl_stop_chip, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_DESCRIPTION("SOF helpers for HDaudio platforms");
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 4dbba9186b29d..2a40cb9bf24d9 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -939,6 +939,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  		hda_dsp_ctrl_ppcap_enable(sdev, false);
>  	}
>  free_ipc_irq:
> +	hda_dsp_ctrl_stop_chip(sdev);
>  	free_irq(sdev->ipc_irq, sdev);
>  free_irq_vector:
>  	if (sdev->msi_enabled)
> @@ -1006,6 +1007,9 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
>  		snd_dma_free_pages(&hda->iccmax_dmab);
>  
>  skip_disable_dsp:
> +	/* stop CORB/RIRB and position buffer DMA before the buffers are freed */
> +	hda_dsp_ctrl_stop_chip(sdev);
> +
>  	free_irq(sdev->ipc_irq, sdev);
>  	if (sdev->msi_enabled)
>  		pci_free_irq_vectors(pci);

-- 
Péter

