Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640004D2ED3;
	Mon,  7 Sep 2026 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789810; cv=none; b=OVMh8I0ACj2Drj37JdIG5dvebI62ZVO75fiiuEMDtE9tzopu3h0mYdIfke4+ZljnP0D2w3huJGQKHc9tHGP4KTbz+Q7mqHF6cLbQ35J+LpJf20kDNVq1qUJVAhALYFCca9v7Mt4EC4yYau7CBwUist1VldLCfIisOnVGfv7vMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789810; c=relaxed/simple;
	bh=OrL2hM5MGp5RzTrgCz4IxlWP+lbXPPigUyPR3/geJyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/007kt/4F4UbSdVcig7oP63r2645UBcqapUWlEUluWVZeIOQrGNYV/LL4bhVUecFw7y7BUAbc9Y19j1iqmOslaUq4Nn6zoGF4+NHk3D+ma219jADzORqIMgHKK5mAo0O1ZnP/LZp/viEANrFmLHQtAg91w0Qwdh3DoTvUPCUy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ajLKzX2V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ajLKzX2V"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97564BE;
	Mon,  7 Sep 2026 16:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788789712;
	bh=OrL2hM5MGp5RzTrgCz4IxlWP+lbXPPigUyPR3/geJyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ajLKzX2VAy1Lp0BsfqtggVm8osJkPGkD+kfd7xq2K7J208/9N9ZbNehrafRogac6c
	 0Lv+pGUJCBVUrdWT+hK6pVvfMOPvD6uKnFd4TypXI+Z2I5ZaTPlQTBNveDeuqgjc7f
	 ++8MtdPxAzlMK/8D0egehhGrZQ5q2ruOlfFpK8+8=
Message-ID: <72674692-9c3e-4f7b-a3d0-00df85ef938f@ideasonboard.com>
Date: Mon, 7 Sep 2026 17:03:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <apbbvQSfUbzYRFaw@sirena.org.uk>
 <3076b44f-b499-42cc-92cf-f4a7a470fb2f@sirena.org.uk>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <3076b44f-b499-42cc-92cf-f4a7a470fb2f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/09/2026 17:01, Mark Brown wrote:
> On Tue, Sep 01, 2026 at 03:05:49PM +0100, Mark Brown wrote:
>> Hi all,
>>
>> After merging the drm-misc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> /tmp/next/build/sound/soc/ti/omap-hdmi.c:408:6: error: no member named 'card' in 'struct hdmi_audio_data'
>>    408 |         ad->card = card;
>>        |         ~~  ^
> 
> This issue is still present today.

I have sent "[PATCH] ASoC: ti: omap-hdmi: Fix build error from a merge 
commit" (20260903-omap-hdmi-fix-v1-1-b0447a1d35d5@ideasonboard.com). 
Waiting for a R-b so I can push it via drm-misc.

  Tomi

