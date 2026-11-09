Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225220;
	b=Oo0Fb4xtXs201WHSw2d75eD537qSaD7kzIRfCKH4krHbsJKltQOyzStYTAYD/EaHAkKI
	 MtQm6V8fl3RES8OECE1tYhTw1B7n/O+E+Ly/f836US2KJYKhIIdVIaSeEHJkJk25pLqxM
	 p5Ed5riBClJxyfZlrF8AFIanrgEUCiJ7MTbCMboqt2wJ4kBmPSp0DBWj1iRyayNIHVxeX
	 yzop1Zf50obX5qttZdbqxjR+m+gxfzLlWU44bo/IKXdVFfqetjLyuLpGtXTsUB51DXWlK
	 h45w5rD8di3UFUJXSaLem35XEpzVqtsnC1j/OtoPU6xvzwOBpotMQw+R4yG4KNJx8sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225220;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vsp1SwFHmD5OLXEoTZ7OTNSqKFn73bTxg7GL6w+8KjU=;
	b=u8H2LNGLETGpwzgjPNhkKMK+naQB9U+4nX4qdoAlVJCfEzALKAjgssOKBqmTIpYhR1xG
	 /j/u3CRSvMx3Ck4gIMwiWiZC9shFnLT/KeReKo1Si7Gzph74rDLFctkAheT9cmCyZvSPa
	 GHreuDc22HfCO9TXANiOqjT/Qmm3bh/lHiB+UmC8dGG0tqzyG+s9wfeVUApgLEso6eDKR
	 Mi+AbybNVFoQ1734kYt01PD0zJ321GxjGRDsHE4X/FjqZvYz1GtKxQ5qfUBDBDmWHAdnE
	 2vTRYf5pGyyurcKt74Bh8DwLyaOHz5p9s2oM8SYKOy+t/GyzTtTxLtjm+TyTiXpv5bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=sqI7wK3K;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DB606D802
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851DB606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=sqI7wK3K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=vsp1SwFHmD5OLXEoTZ7OTNSqKFn73bTxg7GL6w+8KjU=; t=1794225218; x=2109585218; 
	b=sqI7wK3K7xU7MWpidJhMNEZe0NN2Cytmnga2wFlOY4Ni2xkXY9YGa+fEYdy5qbN/wg4YDVQA98a
	D92lhq1qfPmaSd/RX4INNaN/uj8abqLS2uXQly/tIYk2/OyCEraNdz7+GNBFEA3TlawEHX59CRR5Y
	UkyIXLgOhfA94q4kT3rk0/5SHhkQS3n5qC6wdxYvZoeNG7Y4om6xkKxM21ZYWjWOB/6Dz0+a1+BDp
	uzKhJLjrknEt/01WP0A9c60XoIicQGWDgi4NPfOU1HwvUjOy1hViDn0w/xi52bx2D3sBm1cCDLnJq
	Tv/MQ9onKQW59ZktGu4AWBzSpuBD51mYCtGA==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQNwB-007Eep-5Q; Mon, 09 Nov 2026 12:53:23 +0100
Message-ID: <e532cc6a-21d0-4021-9854-08963331223e@igalia.com>
Date: Mon, 9 Nov 2026 08:53:19 -0300
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
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
 <b60a42bb-b48b-434a-a306-3ac9189027a5@collabora.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <b60a42bb-b48b-434a-a306-3ac9189027a5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Cristian,

On 04/11/26 17:08, Cristian Ciocaltea wrote:
> On 10/28/26 11:44 PM, Cristian Ciocaltea wrote:
>> Hi Maíra,
>>
>> On 10/27/26 3:35 PM, Maíra Canal wrote:
>>> Hi Cristian,
>>>
>>> On 13/10/26 22:03, Cristian Ciocaltea wrote:
>>>> Replace driver local scrambling logic with the newly introduced common
>>>> HDMI 2.0 scrambling support:
>>>>
>>>> - Advertise source-side scrambling capability by setting supported HDMI
>>>>     version based on the variant's max_pixel_clock.
>>>>
>>>> - Provide minimal .scrambler_{enable,disable} connector callbacks that
>>>>     only toggle the VC5 HDMI_SCRAMBLER_CTL register, while delegating
>>>>     sink-side SCDC programming and periodic status monitoring to
>>>>     drm_connector_hdmi_{enable,disable}_scrambling().
>>>>
>>>> - Drop vc4_hdmi_reset_link() and vc4_hdmi_handle_hotplug(), switching
>>>>     the .detect_ctx() path to drm_atomic_helper_connector_hdmi_hotplug()
>>>>     which internally calls drm_connector_hdmi_sync_scdc() to trigger a
>>>>     CRTC reset on reconnection.
>>>>
>>>> - Drop the local scrambling_work delayed workqueue and scdc_enabled
>>>>     flag, now tracked by the common drm_connector_hdmi layer, as well as
>>>>     the now unused output_{bpc,color_format} driver data members.
> 
> [...]
> 
>> I'm going to test both fixes and send them out as a separate series, so we're
>> not blocking on it.
> 
> I submitted the fixes earlier today:
> 
> https://lore.kernel.org/all/20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com/
> 
> I'm waiting for Lucas' scrambling patches to land in drm-misc-next so that I can
> rebase this series and send v4.
> 

I believe Lucas' patches landed today in drm-misc-next.

Best regards,
- Maíra

