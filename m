Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908742;
	b=3roEDiwktp7go51m4nB3eD86mMTGDDGoQ/1VGPs5e7b5PhCXxWAKAAW9clqBXgw46dRo
	 J7bjjI/M6ileC4553qISBaqRhu1g28YfeawVOFihyzN16AM1unBza7iiqi+t/HXYgO6Vr
	 OL9k3IoQfU0iXzMHzSCNUwWrr6SwBU1Qhd0LShhhN89X0XnOVrT+gb7NeXlqpnJSJRIAM
	 fWod4D0Qa5wu91WjCsM+XiSXsQmL5DnYthrHJoRb1Rsnzgm5T20kwV67c7/Mu6Ju/Dkko
	 2iWB4M+5kqS+WmV2H7SHm2dwRWSdPdUUBcrsBX9vZpyIYpLKa0yOHwYoB/bYAwcL+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908742;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:Organization:MIME-Version:
	 Content-Type:Content-ID;
	bh=XVOLc8lsb6qY90foRQo1hmcRdepqZtalNBhvqMfPf7o=;
	b=277cVmNUzmKl6EFchN2yb08A5HdIoicpvbE9H96B8wP+c8nX5WYDiuv256auVL2wwalp
	 rL9P113SRWuRkrat3gTCoSJk5jDbCM5Mql2BivjsMXbG3zt5mzdUHVCFcKGC7bjqHXF6K
	 PYtdHKdbgitOXzdiZAnlBYbY161BuIdieGau0COf4u1VuEs/bp3bGQHTiJkMgzdCuRXuh
	 cDLOGZHn+oVOxA9gNDlPlFcHM9HqdWtOz3zW9gwktaYV4w7e2gKYytN4VHM/dgJ3obF0s
	 RNXj6V9HebHTH4PvwpHdHc/uqZAhYy0AqhnunMIaVDhBu9qXOeWOT4xp0AJ07jbLfvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BL4Ax1IY;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3836606A330;
	Tue, 17 Nov 2026 09:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3836606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BL4Ax1IY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908742; x=1826444742;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=jXY1nxpVykfYhsV5vIMVxF0y5E9OhVFRg6ErvosjZCE=;
  b=BL4Ax1IYZhShmDOrsfioBUhQ65SHBVQKOqLW9ajzLKdluqAhHzyrVQrb
   mEpRM0QydH8TaalMpEwnHDzxSzJTbZ6ypKKbkg2NCAmAOF9W4LiZlAeM9
   36UhaASA67VQ2O4ZfOC294IZ3CoE+9ud9Rp+IoAPqjSxu1o++h+iWGxF9
   h+4h4bmoLBTNu656NnikHdjBjuuOhIg5hMgkbEBriBIGHoS5NvFjPQizi
   e7jxU8i+z/hkU9Vcy55q3w2EWTXQExk1SRXqujb1khtsVpvqK5OClo450
   yJePHXJCJzH21bWmkcuz8sNS4sqUs8hizJbZRSFuA3c/UFnfelbHnLJVy
   A==;
X-CSE-ConnectionGUID: I02DMf+DS1WcGq1R62p6pw==
X-CSE-MsgGUID: WG7ZvXo/QLC0P+vKZzJvDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3525623"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3525623"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:45:41 -0800
X-CSE-ConnectionGUID: 5jpc0Bh6SlGssZEjq6hxDw==
X-CSE-MsgGUID: MMfgBkhiRYK7LwCUEdkpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9926805"
Received: from conormcd-mobl2.ger.corp.intel.com ([10.245.244.15])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:45:38 -0800
Date: Tue, 17 Nov 2026 11:45:28 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: =?ISO-8859-15?Q?Germ=E1n_Poo-Caama=F1o?= <gpoo@igalia.com>
cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
    Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
    =?ISO-8859-15?Q?Germ=E1n_Poo-Caama=F1o?= <gpoo@igalia.com>
Subject: Re: [PATCH 0/3] ASoC: hdac_hda/soc-pcm: fix NULL ops.open() call
 and failed BE open cleanup
In-Reply-To: <20261114024706.2659774-1-gpoo@igalia.com>
Message-ID: <e98302a0-faf1-7912-47b6-f8d9c0637716@linux.intel.com>
References: <20261114024706.2659774-1-gpoo@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1499736629-1794908640=:4809"
Content-ID: <420ae183-b66b-139f-ee15-3fe906b8fb4d@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1499736629-1794908640=:4809
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <6ff3272f-569e-45cb-a07b-857b9f6b7ee1@linux.intel.com>

Hello,

On Fri, 13 Nov 2026, Germán Poo-Caamaño wrote:

> From: Germán Poo-Caamaño <gpoo@igalia.com>
> 
> On a ThinkPad X1 Carbon Gen 10 (ALC287, SOF with skl_hda_dsp_generic),
> the codec sometimes comes up without pin configuration and the
> analog PCM has no playback stream. Opening the SOF analog playback
> PCM then calls a NULL ops.open() in hdac_hda_dai_open(). The task
> dies holding the card's DPCM mutex and system suspend can no longer
> freeze tasks.

thank you, for the series:
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Covering the history with commit 06f07e236537 ("ASoC: hdac_hda: fix
deadlock after PCM open error") and commit 00a0b46c99e2 ("ASoC: soc-dai: 
add mark for snd_soc_dai_startup/shutdown()") in third patch is very 
helpful. And looks good.

Br, Kai

--8323329-1499736629-1794908640=:4809--
