Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684284;
	b=AxLcG2YRArceCj8hoKjU0te7+QaWAL4V6oE0z4jgKwNVqqIItEMyfLfKK1jTqTcpVX1x
	 LvlJ8mLIpxq86Qjza6bm56vyEPLTWbCLgIdizZfd+3KpXPx/7H8NyIVLnEi7REzYTZtEk
	 DWwqDQep419CgDWwyI7xA9tepgrmb7FFbFSxqP1rImtK8soO+s+TLI7/WcI4wBzpHAAb/
	 xCm6u25lpZg4dinEGjF/qYOEWOYYSmpbGn1l1XaWhe/Cks8D1RAQnzWZ2r0ba5YmrJaBm
	 wu1JoYqmriO64l3qCzUaY3X/b7DwV5+GaoMgFuPetZ+yFDrqAJ+b1ZYJZVdZPwz4DWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684284;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DKQqu+mzr8P4Njw19lrTInQy5OStEJKS8qeZmyL2MNM=;
	b=QFiIrzwdIqhiMgMFMXHb5e8x9EE/g2nDcK1yyfPyVaajZh3LDvYMHKdV4Z/ZRtDLO7uy
	 a2SHufJhf1SEdorNUcpPY1f9oU4HK6zNzsKrUOTlxqwg2RVvGGpvrIeT5V/bW/bBjQE74
	 BJPBUVOAc8Svj6NCxLdMltsTIgL1SQzToqkyFAB6leNV25L9CRphib+nYP+izb6vRycgJ
	 E3zdk84j2w5xcmyAfGxu3b4m7ildTHYHqjyyUYyJmf+eSLEqYDdBhmsXn4PG7WfFzrB86
	 Oh8nw0yLiGYFVVMweqs4l1vSb0QZM8VcIZ6ocIgS+3OHaDfLGnX4NzOfAWTXsQB/3MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9LN9gWC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC37606A329;
	Tue,  3 Nov 2026 05:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9LN9gWC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48A91F000C1;
	Tue,  3 Nov 2026 05:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793684283;
	bh=DKQqu+mzr8P4Njw19lrTInQy5OStEJKS8qeZmyL2MNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B9LN9gWCiRHEa0yN41Dp6ZFAIrfEN/fEyH01CdUyaEG0DjZmd/+WZKA51CTDVK/P/
	 n+gNGN7xmFtEzIflF/CHlkMjNQHPF+xgflDZAMaY2AE9yJuhQA/elyl7NQVXhm61PL
	 hXyu3TBgDpxBeEsGRTBRck97t8qI2Bjq08iaRuoO0mdy9Ixz9Ntn9X+MXCWVch/pIu
	 Tk7OaVNS8RzbRUllR062xF5lOrcHyjZdTx+6e6NYdnsqab22/oKl9eJhHTG8SqYUEs
	 3eiWKA4g3VYdS/h8Lp4okE6/nlKXHTkLaPZIsmoUHwqL5hNGUiks1GtuqbQ32aoyxz
	 R5Ph03y7hGjDw==
Date: Tue, 3 Nov 2026 11:07:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, linux-kernel@vger.kernel.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
Subject: Re: [PATCH 0/7] ASoC: Intel: avs: Soundwire support
Message-ID: <aulzN9MCl5CJB1Al@parshuram>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102181042.1922005-1-cezary.rojewski@intel.com>

On 02-11-26, 19:10, Cezary Rojewski wrote:
> The RaptorLake-P and RaptorLake-M based platform used in Automotive area
> do utilize SoundWire for streaming audio.  This patchset brings such
> support to the public domain.
> 
> If possible, I'd like the changes to go through Mark's tree.
> 
> As the patchset updates drivers/soundwire, I've decided to strip it off
> any machine-boards and have here just the changes done to the main
> soundwire driver and their user/usage.  Machine boards for RPL-P/M will
> follow in a separate set and do not touch drivers/soundwire stuff.
> 
> 
> The reasoning behind modyfing the soundwire code:
> 
> Typically dai->startup() is responsible for checking if all the required
> resources are available whereas dai->hw_params() is responsible for
> configuring such resources.  Existing code does the PDI assignment and
> its configuration within one function - intel_hw_params().  The logical
> split is not possible.  The change provides functions that represent
> such logical blocks: assign, release and config.  Such division exists
> already for the HDAudio interface, see sound/hda/core/stream.c

I understand that you want to split things up which helps your avs
driver but I fail to understand why should we add one more layer in
soundwire intel driver to handle one more driver from Intel.

Why not modify soundwire intel driver to do both startup and hw_params.
This way the driver does not care if it is calling sof driver, avs
driver or somenew team driver! I would like to avoid a new driver
specific handling please..

> 
> For the user i.e.: avs-driver (sound/soc/intel/avs) it also makes the
> code very cohesive - aligns with that's done on the HDAudio side as all
> the HDAudio streams are assignment during dai->startup() and configured
> with dai->hw_params().  
> 
> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
> That's not the case for the avs-driver.  It simply asks: "is any PDI
> free?" and assigns it for the substream if one is found.

That makes sense, we can have pdis dynamically done, that is an
improvement..

> No predefining.  Again, this aligns with how HDAudio streaming is done.
> 
> avs-driver -only patches follow the three soundwire ones.  First, they
> extend the existing code so it can accommodate SDW interface.  With that
> done, laverage existing PCM code (sound/soc/intel/avs/pcm.c) and
> soundwire-intel to implement DAI operations.
> 
> Cezary Rojewski (7):
>   soundwire: intel: Define stubs when library is disabled
>   soundwire: intel: Allow for dynamic assignment of PDIs
>   soundwire: intel: Split PDIs and DAIs initialization
>   ASoC: Intel: avs: Pass irq to dsp_interrupt callback
>   ASoC: Intel: avs: SoundWire support
>   ASoC: Intel: avs: Expose common PCM functions
>   ASoC: Intel: avs: SoundWire PCM BE operations
> 
>  drivers/soundwire/cadence_master.c    |  64 ++++++
>  drivers/soundwire/cadence_master.h    |  24 +--
>  drivers/soundwire/intel.c             |  40 +++-
>  drivers/soundwire/intel.h             |   3 +-
>  drivers/soundwire/intel_auxdevice.c   |   4 +
>  include/linux/soundwire/sdw_cadence.h |  35 ++++
>  include/linux/soundwire/sdw_intel.h   |  41 ++++
>  sound/hda/core/Kconfig                |   2 +-
>  sound/hda/core/Makefile               |   3 +
>  sound/soc/intel/Kconfig               |   1 +
>  sound/soc/intel/avs/Makefile          |   4 +
>  sound/soc/intel/avs/apl.c             |   2 +-
>  sound/soc/intel/avs/avs.h             |  15 +-
>  sound/soc/intel/avs/cnl.c             |  25 ++-
>  sound/soc/intel/avs/core.c            |  24 ++-
>  sound/soc/intel/avs/loader.c          |   3 +
>  sound/soc/intel/avs/messages.h        |   2 +
>  sound/soc/intel/avs/mtl.c             |   2 +-
>  sound/soc/intel/avs/path.c            |   2 +
>  sound/soc/intel/avs/pcm.c             |  42 +---
>  sound/soc/intel/avs/pcm.h             |  51 +++++
>  sound/soc/intel/avs/pcm_sdw.c         | 276 ++++++++++++++++++++++++++
>  sound/soc/intel/avs/registers.h       |   4 +
>  sound/soc/intel/avs/skl.c             |   2 +-
>  sound/soc/intel/avs/soundwire.c       | 112 +++++++++++
>  sound/soc/intel/avs/soundwire.h       |  63 ++++++
>  26 files changed, 765 insertions(+), 81 deletions(-)
>  create mode 100644 include/linux/soundwire/sdw_cadence.h
>  create mode 100644 sound/soc/intel/avs/pcm_sdw.c
>  create mode 100644 sound/soc/intel/avs/soundwire.c
>  create mode 100644 sound/soc/intel/avs/soundwire.h
> 
> -- 
> 2.34.1

-- 
~Vinod
