Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABEA1E8826;
	Sat,  3 Oct 2026 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014187; cv=none; b=HE0rZj0BxRt1bjLOy21bw8Mu0OCJrKZqQcFel+26oXzmy6FqZVpL4qGjXyoT2Bk7DAf33N56lo2viaPl4JMVLO1gu7CiYfegs45DjBAkK26PlKylvDpKGMdfwmdlXqxNZirJPiWJCWFkk+7QXCX+bbo0EYWt2gWIj8cPd6KdZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014187; c=relaxed/simple;
	bh=MfUVCVTVyqAyWWMciWYVlMIITc7gEW1gx50qars9mvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAzdxRgcmZFLGe74EqyxnmiU+ytLuCsWWHCjdNQeXidDt6UhvjX70NSmxwE4i5cg5XHTCdTPIa4ITTSHWPKIJUaBz4MVzPYrBXKj/rdhwIXL4OXPXYLx03ZlKMmEX4yYBgMiPfep5SFph4fJlwXmBwmm0wafD31VnMipiLyEVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSDO3b1W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSDO3b1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED021F0089B;
	Sat,  3 Oct 2026 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791014186;
	bh=ekxDdhOJckVynJQYk+c3362Q9E9XNDxkI9BNBdgVOuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RSDO3b1WehYIXguH/T1Bm0GIc6mzcRHjxW14VlSyV2rxXtE1ZdOq8SsKYci4PFmL0
	 76WiiuBQG4qcUYbnUOQh/kK/MxYxqfr2Lg/Q3L7cR11yHa43dSACvA7teGaQ9QzCQC
	 Ff77V2i99iHR3RTLBx7MnIqP0JaALXEetFnEBwdlptjrCaBU2JJm6Q5OxLuyFQpNZ1
	 t0BtN8zgplfOY3QY2puCn0FYFGVcwmMcsiDHYivxGELqkWIYYfE8MN0I/oIu0pKyeu
	 0XdAEr26yJiuNhvAl2g4upxHLfLYaZlupScDphpMfkiDhTtqpVEJCJC9uzkQqOL33S
	 zboeJwCuYnqFA==
Date: Sat, 3 Oct 2026 09:56:23 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] soundwire: amd: introduce struct amd_sdw_hw_ops
 dispatch framework
Message-ID: <asC1JwByZaJ8B2Pr@parshuram>
References: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
 <20260917090407.3828816-7-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917090407.3828816-7-Vijendar.Mukunda@amd.com>

On 17-09-26, 14:32, Vijendar Mukunda wrote:
> Add struct amd_sdw_hw_ops, a function-pointer dispatch table for
> hardware-revision-specific SoundWire manager operations. Add inline
> dispatch helpers for each callback and a const hw_ops pointer in
> struct amd_sdw_manager.
> 
> The irq_thread and update_slave_status_work slots take
> struct amd_sdw_manager * so that different ACP revisions can register
> different handler logic. hw_ops is populated and call sites are wired
> through the dispatch helpers in subsequent patches.

Lets solve with one more level! Do you really need this...

> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.h   | 193 ++++++++++++++++++++++++++++++
>  include/linux/soundwire/sdw_amd.h |   4 +
>  2 files changed, 197 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
> index 63fecff62079..2d08c6edd018 100644
> --- a/drivers/soundwire/amd_manager.h
> +++ b/drivers/soundwire/amd_manager.h
> @@ -274,4 +274,197 @@ static u32 sdw_manager_reg_mask_array[AMD_ACP63_SDW_MAX_MANAGER_COUNT] =  {
>  		AMD_SDW0_EXT_INTR_MASK,
>  		AMD_SDW1_EXT_INTR_MASK
>  };
> +
> +#define AMD_SDW_HW_OPS(amd_manager, cb)	((amd_manager)->hw_ops->cb)
> +
> +/**
> + * struct amd_sdw_hw_ops - hardware-revision-specific SoundWire manager ops
> + *
> + * @init_sdw_manager: enable the SoundWire manager hardware and perform bus reset
> + * @enable_sdw_manager: set the manager enable bit and wait for it to assert
> + * @disable_sdw_manager: clear the manager enable bit and wait for it to deassert
> + * @enable_sdw_interrupts: unmask ACP-level and per-manager interrupt bits
> + * @disable_sdw_interrupts: mask ACP-level and per-manager interrupt bits
> + * @set_frameshape: write the row/column frame-shape register
> + * @send_cmd_get_resp: issue an immediate command and return the response;
> + *   returns 0 on success with the raw u64 response in @response,
> + *   or negative on hardware timeout
> + * @wake_enable: enable or disable the in-band SoundWire wake interrupt
> + * @host_wake_enable: enable or disable the host-side wake interrupt
> + * @set_device_state: write the D0/D3 device power state for the manager instance
> + * @read_and_process_ping_status: issue a PING command and process the slave
> + *   attach/detach status; called from the IRQ work path
> + * @process_wake_event: handle an in-band wake notification from a slave
> + * @irq_thread: hw_ops callback invoked by the thin work_struct wrapper on
> + *   each interrupt; reads status registers and dispatches slave events
> + * @update_slave_status_work: hw_ops callback invoked by the status-update
> + *   work item; reads slave status and updates the SoundWire core
> + * @clk_init_ctrl: set the clock divider and update the frame shape registers
> + *   based on the current bus clock frequency
> + * @clock_stop_exit: restart the SoundWire bus clock after a CLK_STOP_MODE
> + *   suspend; implementation differs across ACP revisions
> + * @suspend: system-suspend hook; stops the bus and powers down the manager
> + * @suspend_runtime: runtime-suspend hook; same sequence as @suspend
> + * @resume_runtime: runtime-resume hook; reinitialises the manager and restarts
> + *   the bus after a POWER_OFF_MODE or CLK_STOP_MODE suspend
> + */
> +struct amd_sdw_hw_ops {
> +	int (*init_sdw_manager)(struct amd_sdw_manager *amd_manager);
> +	int (*enable_sdw_manager)(struct amd_sdw_manager *amd_manager);
> +	int (*disable_sdw_manager)(struct amd_sdw_manager *amd_manager);
> +	void (*enable_sdw_interrupts)(struct amd_sdw_manager *amd_manager);
> +	void (*disable_sdw_interrupts)(struct amd_sdw_manager *amd_manager);
> +	void (*set_frameshape)(struct amd_sdw_manager *amd_manager);
> +	int (*send_cmd_get_resp)(struct amd_sdw_manager *amd_manager, u32 lower_data,
> +				 u32 upper_data, u64 *response);
> +	void (*wake_enable)(struct amd_sdw_manager *amd_manager, bool enable);
> +	int (*host_wake_enable)(struct amd_sdw_manager *amd_manager, bool enable);
> +	int (*set_device_state)(struct amd_sdw_manager *amd_manager, u32 target_device_state);
> +	void (*read_and_process_ping_status)(struct amd_sdw_manager *amd_manager);
> +	void (*process_wake_event)(struct amd_sdw_manager *amd_manager);
> +	void (*irq_thread)(struct amd_sdw_manager *amd_manager);
> +	void (*update_slave_status_work)(struct amd_sdw_manager *amd_manager);
> +	int (*clk_init_ctrl)(struct amd_sdw_manager *amd_manager);
> +	int (*clock_stop_exit)(struct amd_sdw_manager *amd_manager);
> +	int (*suspend)(struct amd_sdw_manager *amd_manager);
> +	int (*suspend_runtime)(struct amd_sdw_manager *amd_manager);
> +	int (*resume_runtime)(struct amd_sdw_manager *amd_manager);

I would suggest splitting the driver and add common code to a lib and
have specific drivers for older and new gen platforms...

-- 
~Vinod
