Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C654B1AE;
	Tue,  8 Sep 2026 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875929; cv=none; b=aMUhngUnGYhNfRC4iwh7ntotxslwIKHyBxkZmdG2JuDYEfvOK6TcNIfvWrJUJxalpt+gvO/RGs+c6qsKAHq86Zk1HdsC3Zi7RCK+boBf9HCA5Pb8d/4+ecfsY/LAr1HJRfelWZH+IbDvQ3rYgDqutDO3oO10oTMUdQY2+DWQqLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875929; c=relaxed/simple;
	bh=c8E2IVn1r4MHWePm284oMZk+m+NcPBxzbQe4UN8JzeA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=guVUXIjPUebUz46Ln/G2BET5nEYnjNm1id9LAWEPFLo5zf4Uz220EquM3Mz3ppzXAwtZwW4Swi6H48vkNE3YgdT3DMJhZgdY0oG3uLcBCipk7lIENPMp8jKr3y6YIVxbfSOc6uFbmz0ykY4IEpL8fjI4DixJOIe7Slzdsm74B9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DF91F00ACA;
	Tue,  8 Sep 2026 13:58:38 +0000 (UTC)
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
References: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/3] soundwire: bus: re-enable CLOCK_STOP_MODE1
 support
Message-Id: <178887591841.2104350.3095665702238521740.b4-ty@kernel.org>
Date: Tue, 08 Sep 2026 19:28:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 01 Sep 2026 11:03:08 +0800, Bard Liao wrote:
> Add CLOCK_STOP_MODE1 back to allow the peripheral to utilize it when
> the clock is stopped.
> This mode is designed for power-sensitive devices as it enables a deeper
> power-saving state, although it does not retain the peripheral's state
> during the clock stop.
> 
> v2:
>  - check slave->probed before looking at the driver to avoid NULL pointer
>    dereference.
>  - add wake_enable parameter to stop_bus ops to stop the clock but keep the
>    bus unwakeable during system suspend.
> 
> [...]

Applied, thanks!

[1/3] soundwire: bus: add CLOCK_STOP_MODE1 support back
      commit: 267665f8a3d7a17c5012f85b068d4e11f83432c1
[2/3] soundwire: Intel: add wake_enable parameter to stop_bus ops
      commit: 8c1e69e322a9757f596242bdd004e76e30181869
[3/3] soundwire: Intel: stop sdw clock in system suspend
      commit: 90b63b309fd6c0f192337659e73e3047a67df99f

Best regards,
-- 
~Vinod


