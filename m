Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822918;
	b=I9oJ9zrHc2EO8Vz1Z735bIGrkh5LKSLsVt9FmCG67vhsVacn48/3QONHT8sUJFU1Q3ro
	 OJ87bpo8Oqk09knWVxDvf2AYSRXUbsNe6mmM/b3WelKsM1DfEkH2/hlGYJyOUFsa7lPaH
	 lBGEAsy1geO7B9P96ofZLyExvHC0ArTCgAZi1rF7vTUYJnmGzE7ilmUiYXufHEnSjDV7W
	 y+L1U/slfd1PRH8rL9Xk/2dHkGFczz9fUHNS9Wh6ZBoNPr3QDuTYNVMxblWr0u5dd5zpI
	 USFWd01OHFsLIYndr3Y3TmFiPc/wWM4QlbRcZaUiY/t1lBtck83pCAlG1wtb3BeAPkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822918;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wsNUod5vNqhEN6yvuZWIIkNaCHcsLbqXqDofNYkOXuE=;
	b=c6OSTxtw/HHjpAE7ctBglcjWsSGRm3sA8g8EK86DIru/9y8OKmWXTfuJuCDpAQbiEX8p
	 et6mpxlUVnBqBmIqYRr8+PufLmkUZYkxqDhJLuvaqbo94wXyvW4MOScnTwOaMez8XBetd
	 ul+O4sbT+oWmlsq10Go2LNUN6Ebd5NXSA7EjwBMNgDVMEmphQNYFmLgxUTcc9bnjfBVKS
	 PrrqTgjeXm1976EXiMQPVPMDwdUaImt45UAVcFsbrTRJm3I3gAAbxa+NmW1M9ZMnJWOdj
	 DMYmrbUGuQjDuc0TJuQUiOsUCAZlMT596KgqBwBrqQFUtrcUjYX5qW0t97rVibzd9yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OoIw7+Pz;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA30606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA30606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OoIw7+Pz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793822915;
	bh=7v1zr+wYMpLmokLSxZ4bHQ6V9WqnMuecCHhPxyBMIZ4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=OoIw7+Pz1YFLOtCSQQE9PbWW27kWVuBVWH5wyx6wbESOAwjlik6xUsRZRJfaIIlJM
	 JqnC74Dke93c28AyZJGJy4SW9L8IHXtxbjriyGwzT8+6HBYMBaTSBUt9gjtZr+VqfQ
	 s9+3v48vKkCCscN9tAyO1zIea7rkh03Rd9ne9kEfmdAOYKyfaPiHlUflxmZ3hUKRoQ
	 ymsZL4B594XEl0k9PDWfb0xtk4JoRlkITflTghxtMaHg2qpdfKVSmNz8CkOoOhurDG
	 y2qc7wUi16cWxlZAGdbuk4VEf8HOetYVjFlYjTN2w1IrvvTRiGivcvNw5woLHL2YPf
	 YLbWSMZagCzPQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E597A17E066C;
	Wed, 04 Nov 2026 21:08:34 +0100 (CET)
Message-ID: <b60a42bb-b48b-434a-a306-3ac9189027a5@collabora.com>
Date: Wed, 4 Nov 2026 22:08:34 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] drm/vc4: hdmi: Convert to common HDMI 2.0
 scrambling infrastructure
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
 <20261014-vc4-common-scramb-v3-6-c68d58d959a2@collabora.com>
 <45ea1610-360f-4f6b-9ea6-30b28fbe8514@igalia.com>
 <8b1b7d8d-9656-4b3b-9f83-1526c8110ab7@collabora.com>
Content-Language: en-US
In-Reply-To: <8b1b7d8d-9656-4b3b-9f83-1526c8110ab7@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/28/26 11:44 PM, Cristian Ciocaltea wrote:
> Hi Maíra,
> 
> On 10/27/26 3:35 PM, Maíra Canal wrote:
>> Hi Cristian,
>>
>> On 13/10/26 22:03, Cristian Ciocaltea wrote:
>>> Replace driver local scrambling logic with the newly introduced common
>>> HDMI 2.0 scrambling support:
>>>
>>> - Advertise source-side scrambling capability by setting supported HDMI
>>>    version based on the variant's max_pixel_clock.
>>>
>>> - Provide minimal .scrambler_{enable,disable} connector callbacks that
>>>    only toggle the VC5 HDMI_SCRAMBLER_CTL register, while delegating
>>>    sink-side SCDC programming and periodic status monitoring to
>>>    drm_connector_hdmi_{enable,disable}_scrambling().
>>>
>>> - Drop vc4_hdmi_reset_link() and vc4_hdmi_handle_hotplug(), switching
>>>    the .detect_ctx() path to drm_atomic_helper_connector_hdmi_hotplug()
>>>    which internally calls drm_connector_hdmi_sync_scdc() to trigger a
>>>    CRTC reset on reconnection.
>>>
>>> - Drop the local scrambling_work delayed workqueue and scdc_enabled
>>>    flag, now tracked by the common drm_connector_hdmi layer, as well as
>>>    the now unused output_{bpc,color_format} driver data members.

[...] 

> I'm going to test both fixes and send them out as a separate series, so we're
> not blocking on it.

I submitted the fixes earlier today:

https://lore.kernel.org/all/20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com/

I'm waiting for Lucas' scrambling patches to land in drm-misc-next so that I can
rebase this series and send v4.

Regards,
Cristian
