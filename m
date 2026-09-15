Received: from mta0.migadu.com (out-102.mta0.migadu.com [91.218.175.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD43496D31
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471512; cv=none; b=oOJVk9dOYVowkseq5//JzoMBXnsu09NJnlKkh0l42QwhgXFDglq5jugKBLFE0hWLlduVkmA9VpUFvgkhsRmmhfC2iEi3+YpOsvxM4GpZFwodyZ4iRAPOQD5DmLVzuMZoJVRYPuUVdbSigNbPxTJqG9D8VhmnGq7JKy69H0iEV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471512; c=relaxed/simple;
	bh=IFGcfCnV0Cgy+N8v4r2B8Kzt/wVJpYBHfR3s2l4nnhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+/2q/nKyMEk7deIjwpNAJN4E9E1QoSCkAyNZvG4V0Ptn/zM2qJ4IpdQy8mFukgk4PKuhaAf7IsQn3z5Q/Lej3vdcBHhPdp+0r28sszdzk/q6oPJesR5SCUw4xFaiq9Dh06YHECko6VdqmwqtFu68gTayowrXJtufhKiPLT4Af0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T5s8EUCZ; arc=none smtp.client-ip=91.218.175.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T5s8EUCZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IFGcfCnV0Cgy+N8v4r2B8Kzt/wVJpYBHfR3s2l4nnhI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789471507; v=1; x=1790076307;
 b=T5s8EUCZe06cMdhCCh3us20u+ipX6UQd3H2EoKKET6JQE/OWxj5Ny5X3XSvmyF/NMjbWrnZt
 uPipSYMYs74gMST2zJ0huc22pC9wXcE8nwdUGjG1j1Nm/T7r6d5vgtfCO1zf504oPL5Kee35vd/
 tbK44k2ZnnCoUDdqSYr1W0Kc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 18f7e600982674e0;
	Tue, 15 Sep 2026 11:24:57 +0000
X-Mizu-Trace-ID: 18f7e600982674e0
X-Migadu-Flow: FLOW_OUT
Message-ID: <aec77111-d07b-41b7-8d98-1519faa7f3f9@linux.dev>
Date: Tue, 15 Sep 2026 13:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] soundwire: amd: fix work drain ordering and
 pm_runtime guard in remove path
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-4-Vijendar.Mukunda@amd.com>
 <860a28bf-9c69-48da-9fa7-1cdb82761c35@linux.dev>
 <3abf2784-49ff-459c-9022-acd88bd767b4@amd.com>
 <029a18c3-f6f5-4971-8ee2-25a98dec416c@linux.dev>
 <47708252-2867-4b3d-a997-ef153b6eeb05@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <47708252-2867-4b3d-a997-ef153b6eeb05@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


> Thanks for the suggestion Pierre.  I considered moving pm_runtime_enable()
> into probe(), but I do not think that is safe given how the AMD SoundWire
> driver is structured.
> 
> The current placement in amd_sdw_manager_start() follows the same model
> used by the Intel SoundWire driver, where runtime PM is enabled only
> after the hardware has been powered up and fully initialized.
> 
> More importantly, pm_runtime_set_active() requires the hardware to be in
> a known operational state. For AMD, that is only true after
> acp_sdw_clk_init_ctrl(), acp_init_sdw_manager(),
> acp_enable_sdw_interrupts(), acp_enable_sdw_manager(), and
> acp_sdw_set_frameshape() have all completed successfully. Calling
> pm_runtime_set_active() from probe() would advertise the device as
> active before any of this initialization has occurred.
> 
> Enabling runtime PM in probe() would also create a race window between
> probe() and sdw_amd_startup(). During that window, the PM core could
> invoke the runtime suspend callback, which accesses SoundWire manager
> registers and performs clock-stop sequences. Since the hardware has not
> yet been initialized, those register accesses would occur on an
> uninitialized manager.
> 
> The failure path that motivated this change is also a real scenario.
> sdw_amd_startup() iterates over all manager instances. If one instance
> successfully completes startup and another fails later, the cleanup path
> must handle a mix of initialized and non-initialized managers. The
> pm_runtime_enabled() check added here ensures that
> pm_runtime_disable() is only called for instances that actually reached
> the point where runtime PM was enabled.
> 
> The probe/startup split is intentional and follows the existing
> SoundWire subsystem design. Hardware bring-up is deferred until startup,
> and runtime PM is enabled only after the manager is known to be fully
> operational. Since the runtime PM callbacks directly access hardware
> registers, allowing them to run before startup completes would be
> unsafe.
> 
> Finally, moving pm_runtime_enable() into probe() would separate it from
> pm_runtime_set_active(). The current ordering of
> pm_runtime_set_active() followed by pm_runtime_enable() is the standard
> runtime PM pattern and avoids additional synchronization requirements.
> 
> This design is not new. The placement of pm_runtime_enable() inside
> amd_sdw_manager_start() was introduced by commit 81ff58ff71ad
> ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
> and has been part of the upstream kernel since v6.4.
> 
> In summary, moving pm_runtime_enable() to probe() would expose runtime
> PM callbacks before the SoundWire manager is initialized, creating a
> real race between probe() and startup. Keeping it in
> amd_sdw_manager_start() satisfies the requirements of
> pm_runtime_set_active() and makes the pm_runtime_enabled() guard in the
> remove path both correct and necessary.
> 
> We will split the patch and push the pm_runtime guard change separately.

Sounds good, thanks for sharing the details.
My suggestion was based on what we did for SoundWire codecs, it may not
be 100% applicable on the host side - or it would create new problems.

