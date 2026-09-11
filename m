Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D228F46D573;
	Fri, 11 Sep 2026 17:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149156; cv=none; b=PCqjfMCqoDa0PtZfKGWktdjzyPXiGaJFcoQs/8FIDVKUJQ8uu9CGjVPbOmgP1cIjGTZEdehKEMgluXl8X6dW0/6wfST5rdLf/6Ah7rO3YOfnT/8MJe1FXWFdnMFDMMrH7Pi5ZXjM6Vm0a8uTY4AWmkZpKJHuJO+JEwgpLLk3Zxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149156; c=relaxed/simple;
	bh=i4b1F550PpCySaT71xBmolUmbmF9GGfkwfUsfQ3BHDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUubEPgj6TWKUFiSpC5gmudGP1uXmWhiZ9u+E7FE9gHtXoLJJSWTDxaZ36+14KQcQ6oSK1P5iHNj3BFCpE94cbdL7SjH8X/TAY4AmE4hfCZ4uZYY6R7DONmAhsYqOV7DSg3TVqeEMm8h9gsV6w9y4X4SF4iUJfFt1+856epy9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQXONF6n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQXONF6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF28A1F0089A;
	Fri, 11 Sep 2026 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789149154;
	bh=Oc9x+QoinRMrwVUGGsxxeWc8hJ0c7qkvS5/RoKyI3TA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UQXONF6nq+aTYhUWN9SodyudovcypiE+se/USO9GXO8g207UBvg9mry+79TiOSWv/
	 KvMMFHsQRJQmHa9TZ/M8+aX6WPss0Tdpd6BrcC2YIYw2gL8eumf0K9rruOv7ypeKPG
	 5DK4/X5BIewCsJLNyYK4wTCMGxYW2h+6QEv01yUYJvNn+6mnMCwHxATAF1+Fpy1e9s
	 C4f7nECpeX2YMcfEVClD54vf54JhtrEFRgjSQo+mCZmgWcGVi/+tneK4ZApYhfvV7O
	 APDPGsxKmybLRUX6aSdPscDMEPzPHAXbSaH9SZeN+RK1WfQU0OGxz5dI5jU5KR9AqN
	 dG5zYlKThPh1A==
Message-ID: <21231b76-e21f-448b-bc6c-25f54e7cad36@kernel.org>
Date: Fri, 11 Sep 2026 12:52:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 0/8] soundwire: amd: SoundWire manager driver bug fixes
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Richard.Gong@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/26 14:00, Vijendar Mukunda wrote:
> This series collects eight bug fixes for the AMD SoundWire manager
> driver (ACP6.3/7.0/7.1/7.2). The patches address correctness issues
> in command response handling, slave status caching, work-queue teardown
> ordering, resource cleanup on probe failure, and power-management
> suspend/resume sequences.
> 
> Patch 1 fixes a silent type widening in amd_sdw_send_cmd_get_resp()
> where -ETIMEDOUT was returned through a u64, producing a large positive
> value instead of an error.
> 
> Patch 2 caches the last successful ping slave status so that a command
> timeout during sdw_show_ping_status() does not report a spurious
> "no peripherals attached" warning.
> 
> Patch 3 fixes the work-drain sequence in amd_sdw_manager_remove(): the
> interrupt delivery gate must be closed before cancel_work_sync() to
> prevent an in-flight IRQ handler from re-queuing work after the cancel
> returns. A pm_runtime_disable() imbalance on partially-started managers
> is also corrected.
> 
> Patch 4 adds the missing sdw_amd_exit() call and ctx pointer clear on
> the sdw_amd_startup() failure path in sdw_amd_probe().
> 
> Patch 5 propagates the amd_init_sdw_manager() return value in
> amd_resume_runtime() instead of ignoring it.
> 
> Patch 6 removes the amd_deinit_sdw_manager() helper and expands its
> two call sites in the POWER_OFF suspend path to direct calls, making
> the sequence explicit with no functional change.
> 
> Patch 7 replaces open-ended acp_rev >= ACP70_PCI_REV_ID comparisons
> in the PM callbacks with explicit per-revision handling covering
> ACP63, ACP70, ACP71 and ACP72, with a dev_err + -EINVAL default. The
> repeated host-wake-by-revision block is factored into a helper,
> amd_sdw_host_wake_enable_by_rev().
> 
> Patch 8 fixes the interrupt gate and work drain ordering in all four
> suspend mode/path combinations: the ACP_EXTERNAL_INTR_CNTL gate must
> be closed before cancel_work_sync() calls to prevent a racing ISR from
> re-queuing work after the drain completes.
> 
> Vijendar Mukunda (8):
>    soundwire: amd: fix SDW command timeout return value handling
>    soundwire: amd: cache ping slave status to avoid spurious disconnect
>      on timeout
>    soundwire: amd: fix work drain ordering and pm_runtime guard in remove
>      path
>    soundwire: amd: fix ctx leak when sdw_amd_startup() fails
>    soundwire: amd: propagate amd_init_sdw_manager() error on resume
>    soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
>    soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
>    soundwire: amd: fix interrupt gate and work drain ordering in PM ops
> 
>   drivers/soundwire/amd_init.c      |   9 +-
>   drivers/soundwire/amd_manager.c   | 204 ++++++++++++++++++++----------
>   include/linux/soundwire/sdw_amd.h |   3 +
>   3 files changed, 148 insertions(+), 68 deletions(-)
> 
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
