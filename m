Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09587474274;
	Thu, 10 Sep 2026 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042125; cv=none; b=SmUUME57lf1HyeJHfZKe0++eEhRISQ4PD2BwJlpugg5DSSRzBO4qCPwNqs96f3lbiAZCft+epoofzxw7Kf9o7yMfYQ60Q+pGEDZ0cfUz+Wwsiza7WpUz5G4du420T/rj4+EZz+zrXca5MVAD//r64LJcogqgG3mrKYl333kf+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042125; c=relaxed/simple;
	bh=fyw1d0BE4SBGQVhtWNeTMEuezfuvo5db/GNMTmnH2Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3wi/RpLwJ99iW8QNzwjH440uj/Pry3RUHC03ePxi14C5skiDil1yEgIVizV84lCZ2QQAm8hlGutqHifFOImRo81xSpf+fo1pzs/Z5r+rzntizfruUj6YnSzmNAH51TA1bKBuFKs/1Yl0Dv/b8HDM/K1Uc3DG//rPDmxcL/lb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5Vk1kDw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5Vk1kDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789042125; x=1820578125;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fyw1d0BE4SBGQVhtWNeTMEuezfuvo5db/GNMTmnH2Zk=;
  b=M5Vk1kDwOsjhUQX6gtq83+wSJUIG0PeYhIEi55VLl7YWnjTVb+AZHmJP
   VWvHtKLz76UpKxXDiz6zepIBtPsKisfScq0uafnRroHlSC5Zf3NIR/mD8
   qgJfOfo8cb9XpwVu9zrxYmUvoBTpR6kJq0N7o6o0Y+cfOexiDDv+dmuRb
   NKaYn8bTE3d+UaHF8JqGGXxrXt00T+d+4F3PK5RiOoNh5J0rg7eOHLYPM
   OeUUgvxH8VuD2R68m1cdfdr3O/5M8rmjFwv6BcCUd3IoseoFni41hfr/y
   WxIki7rwXEhtk1PmwV1SvJUtNxNSa/VoWnfMB2i/ns69l1MKtgGwYLZFS
   A==;
X-CSE-ConnectionGUID: dUuF0mObRZq8jntv3Vj4lA==
X-CSE-MsgGUID: DK+PHdYiSu6TT/80GstTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99820436"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="99820436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:08:44 -0700
X-CSE-ConnectionGUID: 9qRxx2HiSrKiC+/xVKQgSg==
X-CSE-MsgGUID: TnZWZVq3RESYwuOENqHzCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269842994"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:08:40 -0700
Message-ID: <4aafba3a-d861-45de-9b44-7a7660c6eec0@linux.intel.com>
Date: Thu, 10 Sep 2026 15:08:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: ipc3: bound firmware-supplied ext header size
To: =?UTF-8?B?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260909212353.69599-1-stefanghetu9@gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20260909212353.69599-1-stefanghetu9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/09/2026 00:23, Ștefan Ghețu wrote:
> ext_hdr->hdr.size comes straight from firmware and is used unchecked
> as a read length: too large overflows the PAGE_SIZE heap allocation
> in ext_data, too small underflows the size_t subtraction (hdr.size -
> sizeof(*ext_hdr)), producing a read length near SIZE_MAX.
> 
> Bound hdr.size to [sizeof(*ext_hdr), PAGE_SIZE] before using it.

We tend to trust the firmware on this.
You would need to compromise the system in so many layers before you
could even boot a firmware which is malicious to send deliberately wrong
information that this is the least of the issue...

You need to sign the firmware with a key which is accepted by the system
(the signing key is secret, even we developers have no access to it).
You need root access to deploy the firmware to system.

At this point, there is not really a need to brother with this, you can
do anything as root...

And if we are this paranoid, we cannot trust the ext_hdr->hdr.size size
either, the attacker can deploy the firmware which would pass this check.

I know, agents flags this (and other similar cases), but we are trying
to be realistic.

> 
> Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
> ---
>  sound/soc/sof/ipc3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
> index 85bb22bbe18d..6188e43726e2 100644
> --- a/sound/soc/sof/ipc3.c
> +++ b/sound/soc/sof/ipc3.c
> @@ -598,6 +598,14 @@ static int ipc3_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 offset)
>  	ext_hdr = ext_data;
>  
>  	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
> +		/* bound hdr.size to avoid heap overflow/underflow */
> +		if (ext_hdr->hdr.size < sizeof(*ext_hdr) ||
> +		   ext_hdr->hdr.size > PAGE_SIZE) {
> +			dev_err(sdev->dev, "invalid ext data size 0x%x\n",
> +				ext_hdr->hdr.size);
> +			ret = -EINVAL;
> +			break;
> +		}
>  		/* read in ext structure */
>  		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM,
>  				       offset + sizeof(*ext_hdr),

-- 
Péter

