Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16747988B;
	Wed,  2 Sep 2026 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354688; cv=none; b=KaqFZYXvfjqYe+TmsHN/sWgD8kcdVzP4yvZ2tRgM+ckFislpDkFAYji2kxLWGVBdwW0FNDos31J7qJGh4OK7cqG76PZEgKJpLNxxp8wSwHqIg4UPRWYSZWHBGpo2ZdIms5Tbk2oPBPHjoJ0S852paYwtJBHsalImXUIWx4q2ImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354688; c=relaxed/simple;
	bh=laBufeDfUKVlcUtOt70XztqXseNEuZLpL6vmLx/iFuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BE9L9/U8gxogrcbGRKb57vDGFcc9QYrdrzhYOTQWx0I/TrqWGR6e4xs+/p2+Uum0Joopj6lU+SQubwoU1GBiF3Zo/xL/FqcQwJgGs+cTjvdu/F9cAm+bW+kXcgxiPVoHq+qHPFU18lKFXA2d6ZBwlxNJFNVQi076qxlCGfH1q7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UJDd6b+u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UJDd6b+u"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64F5CBE;
	Wed,  2 Sep 2026 15:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788354593;
	bh=laBufeDfUKVlcUtOt70XztqXseNEuZLpL6vmLx/iFuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UJDd6b+upWu0WPOwmOLLUPCAsF8vPJ0LVvE92tOvDmdPWmm8wOGbaJjC6XoXl1aOa
	 //ssimM3VjWLMTZkZURBWupBrGMF+Pt05BPg4+iWAghdFjO5dOEvev4AMfyjWFSP4r
	 IwLKYopaTh3yj4EFw0rEg69sJ/QrAxrc2X0rTusU=
Message-ID: <d1a594e7-7393-4f2f-b11d-bfff720de743@ideasonboard.com>
Date: Wed, 2 Sep 2026 16:11:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <apbbvQSfUbzYRFaw@sirena.org.uk>
 <3cd2c640-3ce8-4163-9f7b-3abba46ae072@gmail.com>
 <64bdb5bc-ced6-490c-b4c8-fd3dcabbbd4c@sirena.org.uk>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <64bdb5bc-ced6-490c-b4c8-fd3dcabbbd4c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/09/2026 15:11, Mark Brown wrote:
> On Wed, Sep 02, 2026 at 09:52:24AM +0300, Ivaylo Dimitrov wrote:
>> On 1.09.26 г. 17:05 ч., Mark Brown wrote:
> 
>>> /tmp/next/build/sound/soc/ti/omap-hdmi.c:408:6: error: no member named 'card' in 'struct hdmi_audio_data'
>>>     408 |         ad->card = card;
>>>         |         ~~  ^
> 
>> This seems to be due to an interaction between two patches:
>> 1. 9af2c1d4f847 (ASoC: ti: omap-hdmi: remove unused *card) / 875e906efdc4
>> (ASoC: ti: preparation for Card capsuling)
> 
> Those are in -rc1...
> 
>> 2. 699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI
>> codec)
> 
> ...which the drm-misc tree has now merged so I don't expect it to build
> independently of any other tree.  I'm a bit surprised this wasn't caught
> when merging up -rc1.

So the fix is just to remove that line. Any preference, should this go 
via drm or sound?

  Tomi

