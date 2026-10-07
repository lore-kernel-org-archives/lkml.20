Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08144BA1D2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391175; cv=none; b=OuLwai7ynR4vuJu+5YG/fxY1DUxFT2INSW+GoSIdCZXh2hvHJgfC2ElJ/NkZo9LmB2ULj1xaOpM2yrhzsFLIqghr94VBCTZ/2axbMelqdty//Q/OwsGUTRcpaqugwWRruQgnsNh6pCO8zTpRiyi/dR017ry7YehXfUDXMlC5Q34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391175; c=relaxed/simple;
	bh=VwNTSvb0ND2zjC7ZuMjeI6p/DkZoYvxzCl5KhQg1scE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOH4SKSX+KkAb3aisvMIbEuTDcPPfKzRt7/leZ0dY8rkTMcHPgip3Sra13AG+g1Ytib/sAZtkHQaJF3QS8Dmz6peYyl8hvVRCKgPrYHKI5XhqAR5u/D9oe4F3pcbBtzDhYlo8SFx+ld01CHh/iWDxnDXp+45vRBEzKtoNs0HdDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jt48a++1; arc=none smtp.client-ip=91.218.175.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jt48a++1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VwNTSvb0ND2zjC7ZuMjeI6p/DkZoYvxzCl5KhQg1scE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791391171; v=1; x=1791995971;
 b=Jt48a++1yb0EseCuKYdLjdjISl3CCv4zUzS7oJciN4o4Gdo93WHxztJOV9qMBpDMYfo7h8AX
 gZPGaigeTnCbXgQBS/Vxrcoo/VR2tUg3g/qWyaMVIl4I1B7JA7rAPBU51HSs82x2hmdrTReu9t/
 fOPL+XK8pK2Owj45n5SSha80=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bd0d67ce533b2e72;
	Wed, 07 Oct 2026 16:39:31 +0000
X-Mizu-Trace-ID: bd0d67ce533b2e72
X-Migadu-Flow: FLOW_OUT
Message-ID: <aebd9a8b-8b82-4278-85c8-6286180defa7@linux.dev>
Date: Wed, 7 Oct 2026 17:57:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: cs35l56/57/62/63: Use the correct SoundWire DP
 for feedback
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261005155235.1386525-1-rf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261005155235.1386525-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/26 17:52, Richard Fitzgerald wrote:
> The amp feedback path (AEC) was incorrectly using SoundWire DP3.
> The firmware outputs SDCA OT25 feedback on DP4. DP3 is reserved for
> SDCA companion amp.
> 
> This series adds a DAI for OT25 and switches the sdw machine driver
> to use the new DAI for the feedback path.
> 
> Richard Fitzgerald (2):
>   ASoC: cs35l56: Add DAI for SDCA OT25 stream
>   ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> 
>  include/sound/cs35l56.h             |  1 +
>  sound/soc/codecs/cs35l56-sdw.c      |  9 +++--
>  sound/soc/codecs/cs35l56.c          | 54 +++++++++++++++++++++++++++++
>  sound/soc/sdw_utils/soc_sdw_utils.c |  8 ++---
>  4 files changed, 66 insertions(+), 6 deletions(-)
> 

