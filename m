Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC4C3EDADC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510980; cv=none; b=K5QEsDEP+Py5o7kOejNo7Xdy2Oe/QZnd1uhohr/vgiKx932bxoXmNwLa5TNZ5n7GX1HlitTBMwmQnpGxQehnX6wkCLwJevuoAtXZOIZSDN9+hcmeC7LRFxY2oPwWbdPlp+oMxHyOG7oCJh9k90/5yopTs914CXMqbBAW3EqIkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510980; c=relaxed/simple;
	bh=Kg4/aqDRaXMqMIg8PKl30nMewyVqFQhXtA0OxCoMYYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oluZ2PBjK4W4nMmtqknzH1AxKkUXQv/mFuQ/nhZc0d66j/a2/JCHk/0CCfc3wDYwyI+ywRXZRPT9VjmpoPsrItLYXTDSMMRI6rlBL87eUlKt0KWpeFTfrOW4m4zB4Nn6RvytjGRCPdATffq1xXNPK3J/069SevDbXpco1TYS99Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cbRvvAP3; arc=none smtp.client-ip=91.218.175.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cbRvvAP3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Kg4/aqDRaXMqMIg8PKl30nMewyVqFQhXtA0OxCoMYYg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510977; v=1; x=1789115777;
 b=cbRvvAP3kMz6m5xPsAjF8QC4waC5MBum+p6eg6dvATxtk3CV2WpQpYjVZ3cSJf+lutx6Iea9
 6FrmSpElyD7HiMYDTKbaqip+Q6RGbRex82OF3digFFEDsZ1idkMgrg9tp5cRErtzXUpfBn3Ghx4
 L/c62QmiUVSEKV4jN57aTrrk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cf0016a16f4f442f;
	Fri, 04 Sep 2026 08:36:17 +0000
X-Mizu-Trace-ID: cf0016a16f4f442f
X-Migadu-Flow: FLOW_OUT
Message-ID: <60e6f5b1-eaee-4eff-9330-b87eb77abfd7@linux.dev>
Date: Fri, 4 Sep 2026 09:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] soundwire: bus: re-enable CLOCK_STOP_MODE1 support
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 05:03, Bard Liao wrote:
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
> Bard Liao (3):
>   soundwire: bus: add CLOCK_STOP_MODE1 support back
>   soundwire: Intel: add wake_enable parameter to stop_bus ops
>   soundwire: Intel: stop sdw clock in system suspend
> 
>  drivers/soundwire/bus.c              | 54 +++++++++++++++++-----------
>  drivers/soundwire/intel.h            |  6 ++--
>  drivers/soundwire/intel_auxdevice.c  |  7 ++--
>  drivers/soundwire/intel_bus_common.c |  8 ++---
>  include/linux/soundwire/sdw.h        |  4 +++
>  include/linux/soundwire/sdw_intel.h  |  2 +-
>  6 files changed, 50 insertions(+), 31 deletions(-)
> 

Thanks Bard, LGTM - this addresses my previous feedback.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
