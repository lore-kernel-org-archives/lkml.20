Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CE525C818;
	Fri, 18 Sep 2026 21:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766575; cv=none; b=f5sdaH3Kpmy5VtgAieDQRvUlwF54vjkU0A3EOkx58IFR3QDZ0RZGV9RJ/AQTNyslz1UCSf/CBPnamQ7BuGDreZG6rRfCoE13av1t8deSckEpwUr3ibaNCx1e/EKWwoUMmIGxxGnBy4BN9kdgNtUAvsHOej0xS5Mz1fbGHnGmYAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766575; c=relaxed/simple;
	bh=krTl9gy5WAWQ2E0Ab2wQOTrZCi5f+MXRi+LzOKMWU94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pp7/TIxbLJLuY5lWUJQFsN2KoAr/WjpiPhioG0uHF1dnrAo8k9iR4HFSkS36m2Opt3o5rBX7bn6XUYil1f+BwcHB+Gt+z7/QTajk6lEIAWEZk5h9ECs0zAfWesSqRSw/XcH9E4kLOVDwP7t68o+6WSjrnf3tNt5vi5pFJKHNZtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObNJCzNx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObNJCzNx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80B71F000FF;
	Fri, 18 Sep 2026 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789766574;
	bh=s4bY/lwMBPYFBKAC6dm6oIbJefCADIz69WJC7Hc6mg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ObNJCzNxtIoISUL+7iKZWeuy7/awVKJ37kCAQbFyqR8Hj0H+6e3/MYkCZ+smzZMBD
	 yYJpixbKavYzU2tzBkGxVdVrCzYPgwMww7CNwYYkQXRjoQjafdL4J1gW/R9JEV5Yyi
	 Rn4+YczuZDyZiN2Y4eot0Qd3ShUSPYHvr+6GneY3nrAE9RqktQ8IuRSkgIMLWblj6W
	 PjilhkzUGI1GfiJ3jlqwfIAgRMK5XwX7L/OLlHP8I7qSsWD+XQPb/XusJB28bHZt4P
	 Bbm4oa0eISRIGo+bBbwHO1wvZOK6km4pQuirYwDAM3SqYJqVudK70Cm/GU5f+9/T5c
	 1J+c0m+/5S8XQ==
Date: Fri, 18 Sep 2026 16:22:52 -0500
From: Rob Herring <robh@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Message-ID: <20260918212252.GA2258003-robh@kernel.org>
References: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
 <20260918-vmid-v3-v3-3-f1cbf47bf173@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-vmid-v3-v3-3-f1cbf47bf173@oss.qualcomm.com>

On Fri, Sep 18, 2026 at 07:19:37PM +0530, Ajay Kumar Nandam wrote:
> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
> reach the PCM buffers unless they are explicitly SCM-assigned to the
> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
> does not function on these platforms.
> 
> At probe time, the driver reads the GPR domain_id from the parent APM
> device to determine which DSP serves audio. When domain_id matches
> GPR_DOMAIN_ID_ADSP the existing SMMU/iommus path is taken and no new
> code is exercised. When domain_id matches GPR_DOMAIN_ID_MODEM, the
> driver verifies that qcom_scm is available (deferring otherwise) and
> that iommus is absent (the two mechanisms are mutually exclusive), then
> enables the SCM assignment path.
> 
> In the SCM path the driver parses the optional memory-region entries in
> DT. The first entry (memory-region[0] / audio_heap_mem) is the
> control-path carveout used by the DSP firmware for command traffic; since
> the mDSP operates on stage-2 protected memory, this carveout must be
> SCM-assigned at probe time itself for the firmware to function. It is
> SCM-assigned to HLOS (retained as source owner, RW) plus MSS_MSA and
> LPASS (consumer VMIDs, both RW) and restored to HLOS-only ownership via
> devm_add_action_or_reset() at device removal. The second entry
> (memory-region[1]) is the data-path buffer pool from which per-stream
> DMA buffers are carved out. This pool is attached via
> of_reserved_mem_device_init_by_idx() so that PCM buffers allocate
> directly from the carveout instead of system RAM. Individual buffer
> slices are SCM-assigned in pcm_new() after allocation and unassigned in
> pcm_free(), so only the actively used slices are shared with the modem
> and unused carveout memory remains HLOS-owned.
> 
> The VMIDs are static per SoC and hardcoded in the driver (HLOS, MSS_MSA,
> LPASS) rather than read from DT, following the upstream pattern used by
> rmtfs_mem and qcom_q6v5_pas. Buffer constraints are capped at
> reserved_buf_size when the data-path pool is present, and
> snd_pcm_set_fixed_buffer_all() is used for both paths so the carveout is
> not subject to the preallocate_dma module parameter.
> 
> The DT binding is updated to add an optional memory-region property (1-2
> entries) and to make iommus optional (removed from the required list),
> since mDSP platforms have neither IOMMU nor VMID DT properties.
> 
> All new code paths are gated on use_scm_assign (false when domain_id is
> not GPR_DOMAIN_ID_MODEM), ensuring existing ADSP/iommus targets are
> completely unaffected.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |  12 +-

Bindings are separate patches. Run checkpatch.pl, it will tell you this.

>  sound/soc/qcom/Kconfig                             |   1 +
>  sound/soc/qcom/qdsp6/q6apm-dai.c                   | 260 +++++++++++++++++++--
>  3 files changed, 252 insertions(+), 21 deletions(-)
