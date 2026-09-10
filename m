Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F049352C5B;
	Thu, 10 Sep 2026 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046815; cv=none; b=p7PrPXSn/odjMd/MdibJ/KiEZpeVjrqicXHT+hvBSSNzrZjGDlmkd4+MSwzwQ5ihA6sRj/BSjHbCMpAuT0fcoGuEw32rrVooJiKa7vQPg9gsLsz8JimBow/FZHH/ZNW3o+5IX/AOPu8evhAld0dCqR66io6TczwWPp5Bn6DlcP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046815; c=relaxed/simple;
	bh=8LwohI+p8DDT76fk9A1VjUcstLsK4BTQ3LgFB0X08yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osMYuqS/CXBl1z1ua+pxlNC7LFG9rrcvHux5eK+E0Vr6UBLbDCiEnseIvriciykmCx9Dt0XRfs9g0PIDeGFfqPDYBozuOq2E6uo8l6m7LU9Q3K3dC7f7gqZtA2fQNuX+3Doxq+o2KwXbJu2Fe4LWwEmVZ1CuCE68eqp9w9rLLxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iany2Wqq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iany2Wqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789046814; x=1820582814;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8LwohI+p8DDT76fk9A1VjUcstLsK4BTQ3LgFB0X08yA=;
  b=Iany2Wqq8vJ8VCaadE32nwRNvdAyRR4ADsYnCGYWIQ/fzvBT2WOAhUem
   kvcNtp2zn7ktFBYmJleLha2VQHmHCKKgtEHAF86H111twfocCecOiy6eA
   A9OFmsN/7f5Qi9hj/1cq7zFlRcMTPCHlh3ZJzGMRSy1s9gcc8FDLFzqRh
   q5T1SiHxod0MvbWg2BE+xbo5gVKBrDjrjaycmRcWrTV5GoDa6tqHImyat
   /YxA/QajRT8tmW2f4Zn8OmBPSRM0jkVNtZSsc8cAl8Sb3k5ERRfF9kcvt
   JpnKF9Xkf/rAjVZ3RQc1blI5T8Vbg8IUw1cJHHULwxwJXal0Z4udpsiMr
   A==;
X-CSE-ConnectionGUID: O42fr/5LS/yuJMR2b6in8w==
X-CSE-MsgGUID: 5NBr0131QRuMEWi3cY5gig==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89368703"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89368703"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:26:53 -0700
X-CSE-ConnectionGUID: KQ5tpSHfQh2knyhfTWhoxw==
X-CSE-MsgGUID: iLCqQu/YT5SV3PoFAgxRCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271154595"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:26:48 -0700
Message-ID: <6b00b20f-a4ce-402b-bdad-9411499e6753@linux.intel.com>
Date: Thu, 10 Sep 2026 16:26:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
To: Mark Brown <broonie@kernel.org>, =?UTF-8?B?yJh0ZWZhbiBHaGXIm3U=?=
 <stefanghetu9@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
 <20260909204042.46656-2-stefanghetu9@gmail.com>
 <f64a008a-8bdd-4c06-aa12-a721cebc3a11@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <f64a008a-8bdd-4c06-aa12-a721cebc3a11@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/09/2026 16:17, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 11:40:42PM +0300, Ștefan Ghețu wrote:
>> Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
>> call stack") added a shared Xtensa helper that iterates over a flexible
>> array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.
> 
> You've sent multiple tengentially related patches in a single thread
> without anything indicating that it's a patch series.  This is really
> confusing tooling, please resend as either a coherent series or
> individual patches.

I'm not sure if these patches should be applied for few reasons:
- orchestrating the exploit or error case require access to secret
signing key
- deploying the signed firmware needs root access
- in these cases the firmware could be prepared to pass the defensive
checks and still cause problems.
- creates false sense of security through obfuscation

Stefan, sorry for nacking it and thank you for the patches, I hope you
understand my side of the argument.

-- 
Péter

