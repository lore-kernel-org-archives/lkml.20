Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643514;
	b=pn1QhoeIUa1rwr/RXygaqB+yZCOMK0ErdOuzxuvzeGAM483qqPEGZCyPseni/yIz4lLO
	 lc/LVb+bY6AW2UEIYY8+riwuBgxN+H6KOjKwrSSiA8ZcZY0iZUzsnV58x9eB51CD3mkHo
	 shxzA6nLiZsbZ9++yb2gQ5Pz/r6FEs2pefrv3layiujMJbZLunwzCCx/g2Wr1JR1ueBjU
	 iq7Ci8vViv1R7K/erSEk+BjVuPFMWQDhLJyRQC8vfT85pN5h9O91vXSbq/faPwgUWYjv8
	 0mVskezFouSjXJH1G1gYAMOu/SyMF5t7wKOHo1gkg+TlkDAxyqrEUYmk7NPtXEG48Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643514;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pmADqantKKJ+lCbzXOd4rolz9NT0djZUcZtny+ZZ3UE=;
	b=n6uGxb0VkreXHhpiIMJSQvRvo5XtxGO5Mxg52G/76gWrdxDpjMEluHH7L7B/qHOSqhMw
	 l3ZiSetnXbKSjJ7UKIYIrsjDevNpLCDde/l8qzAgUQ67tPOi1i+A7o8j1hOWkh7YdWJ7g
	 cZDp70HSSVZoL3xjL/bWPhMN8uDIhKhiRVFPAK9pNOlgrEhr7tdMKlPDr887Cz32zKKjA
	 rJUrCF2A8qBAtVM6zJYD1ltr4c54VzECD4Otxqszj61qwqw3cgeTRGnSa8f7lOvg1n053
	 AIbmAJeEPJUjhjtqJI1kixxWX6OFFY9AlUQ4KliJR+uNNQjXcdFNdexN5lK1R2FhSNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=borr9l7p;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915BD606A336;
	Mon,  2 Nov 2026 18:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 915BD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=borr9l7p
X-Virus-Scanned: by amavisd-new using ClamAV (3)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793643504;
	bh=pmADqantKKJ+lCbzXOd4rolz9NT0djZUcZtny+ZZ3UE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=borr9l7p2DcretBQTXYOGOoNLcq5+eV5PxlXlQamc4Vu8CpDhHYcxga2CrYFoKq+p
	 EOqbH/fIvX6rwmSsKYcwho2L2/Hi4mpt//z19qS+TcycMzcE2d7J0zWmFIx590zyWn
	 8VrsnYUs0PDCqFzYiI1GHenYrmtlm8BAmEa1wJiv44Yq0ODcjpLD5mdp10Uen4ucXW
	 g1TcsQcrR6+/DlAmUYJQjSVBD/Y9A/W3T0PmBIpgMBoyvRKPtJgSryqrhf3vdROIMB
	 pnzSZwXAf2BAZG8VZJgYNmOCcSUKFOEiS6ClCSXTNMTG/Rngdz/GZHPRIbgicR3/8s
	 FOH5wCHo7FQlA==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id C0E671BE233;
	Mon, 02 Nov 2026 19:18:23 +0100 (CET)
Date: Mon, 2 Nov 2026 19:18:23 +0100
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 perex@perex.cz, linux-kernel@vger.kernel.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 vkoul@kernel.org
Subject: Re: [PATCH 6/7] ASoC: Intel: avs: Expose common PCM functions
Message-ID: <20261102191823.117f3a58@milkyway>
In-Reply-To: <20261102181042.1922005-7-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
	<20261102181042.1922005-7-cezary.rojewski@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  2 Nov 2026 19:10:41 +0100
Cezary Rojewski <cezary.rojewski@intel.com> wrote:

> diff --git a/sound/soc/intel/avs/pcm.h b/sound/soc/intel/avs/pcm.h
> index 0f3615c90398..ac127ade4ca1 100644
> --- a/sound/soc/intel/avs/pcm.h
> +++ b/sound/soc/intel/avs/pcm.h
> @@ -9,8 +9,57 @@
>  #ifndef __SOUND_SOC_INTEL_AVS_PCM_H
>  #define __SOUND_SOC_INTEL_AVS_PCM_H
>  
> +#include <linux/device.h>
> +#include <sound/hdaudio_ext.h>
>  #include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc-acpi-intel-match.h>
> +#include <sound/soc-component.h>
> +#include <sound/soc-dai.h>

Some headers are included twice?


