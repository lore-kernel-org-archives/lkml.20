Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F243C7DF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758263; cv=none; b=Pp15W60yhwDchQ+YNUyks2dhbyhz5mcN42RqhAICn+I8TJYxQrduUwjw+5Cxsn2aFoJT5LMCDnPj/D3jNnmUkRDa8evZDZgWFJMrIhVTe1HCsq0OlsDGFSl2OuSZmL9l3fBnOmVp9XL55HKAm2beuW5dGKQpjQfMmTMruhTXLeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758263; c=relaxed/simple;
	bh=yB+P3+/nYC+7gTfmyeZSpiiQf5zENdGqZvAwrKbqy3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbmwMYBLVZO+XzkOkonVaDO3OR7t1So38/sFuRgjpaV16MhgGr5Cx+bcsGEARpGfYEqB4M9+A1GY0/zF0WBQD49MOr+/IYNseC/9Fe8gfwb+QaTePgrw9AXTcVnSNOPrMl7+c987FhdBZ/a18UWLdUFm35bq2bLmP2ieJcXa6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGC6QK0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGC6QK0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED16A1F000FF;
	Wed, 30 Sep 2026 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790758262;
	bh=vNLolCCSprjS9gDFysHmR4iYUAVzMebm4KKYm3+MJFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gGC6QK0STaiFiNQXPAxH+ZqdSjcVchiBvSUAD8WlEpL9rg7ILudOYTJl3G97KXhrB
	 JuZfGgTeNpXIfelVXlrRVxGiv36A35caWFBHfbRDpYKm691r462r8Aws14vQam3h69
	 YlD5UDeS+0PhjEmrjmSzZxo/pd0Dr1CerJBlULyQcvnKxiQmwjoXeocPQNYLZeZyPz
	 RVDAxc+v9K3nTwc+FS3AVLS9t1G/SYt5HhRk/CUgCnIsbupYyu0gRrGOUkbPsBkEoO
	 jO27YsHrQbwa6/cXGNa4NzZ8PqFaMryvcGBvh22BZldUecSEpr4W1gS7m8yuREdjvT
	 ssH78JMe/v1BQ==
Date: Wed, 30 Sep 2026 09:50:58 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/1] mailbox: arm_mhuv3: Keep the combined IRQ
 enabled during system suspend
Message-ID: <20260930-excellent-hallowed-cheetah-bfcde2@sudeepholla>
References: <20260930033657.312266-1-finley.xiao@rock-chips.com>
 <20260930033657.312266-2-finley.xiao@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930033657.312266-2-finley.xiao@rock-chips.com>

On Wed, Sep 30, 2026 at 11:36:57AM +0800, Finley Xiao wrote:
> When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
> SCMI clock and power-domain operations still need to work in the noirq
> phase of system suspend: genpd may power off a device's parent domain
> from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
> scmi_power_state_set() and waits for the firmware reply via the mailbox
> RX IRQ.
> 
> However, dpm_suspend_noirq() calls suspend_device_irqs() before running
> the suspend_noirq callbacks, so the combined interrupts are already
> masked at that point and the SCMI transfer times out while waiting for
> the reply.
> 
> Both the PBX and MBX combined interrupts are requested as threaded
> IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
> that firmware replies are delivered, and the PBX combined IRQ, used
> for txdone by IRQ when not in polling mode, needs the same treatment.
> 
> IRQ threads are not frozen during system suspend, so with
> IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
> noirq phase.
> 
> Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
> SCMI remains functional throughout the suspend/resume cycle.
>

Looks good to me. Just to confirm, the expectation is to just have the
IRQs functional during suspend/resume cycle only and *not to wake up* the
system right ? If you need wakeup, you need to do more work.

For this change,

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Jassi,

Please pick this up for next cycle when you are at it. Thanks!

-- 
Regards,
Sudeep
