Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768344F93C1;
	Wed, 30 Sep 2026 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777866; cv=none; b=uxj/EyC/AHWLs4/45+F9TlTCVPh1fs6tOyJMmjz8opVJCSwHIVmSCPSi462Oi/1OHMD5gigyHrTWuVPtNzWWViGBhE4mXrky+Yb+y0IVJq6LvSBm4l8PWqAkRcETl5gSa8s36vVyRxF0HPWhj6rl8ingRJHTtakuct+eDtQuyCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777866; c=relaxed/simple;
	bh=I/Qn4U5o4bUA70NOy4F3KfOnQn+3e/G7xznvMcQz/b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhCDywVNz4urkSvKHzogJ864gl7J4rDlO6ZAnD3PuI4ynT7YbjXSzwZtdEcxbnebTAxYceYaJJd7fsW4ZfuirCertVAe8dATG97v6V/nbtAbK50uMnCuU39zQw+8lf/QWayNpqlCUZpnD9MDZeFwil3FMdXqkl2sVF7i868dtI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz17t1790777801t7e15313e
X-QQ-Originating-IP: TTVepZbroz9T+Fe2nw0Bi2zy63iXi7HxHGfbTrCgrqE=
Received: from [127.0.0.1] ( [180.159.160.209])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 22:16:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11752197069327383604
Message-ID: <660A9181C8AC6F3C+a6eb53f2-fe2e-4bc8-8fd6-282a212cb670@radxa.com>
Date: Wed, 30 Sep 2026 22:16:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: sophon@radxa.com
Subject: Re: [PATCH 01/13] drm/atomic: Handle max bpc properties before
 connector state allocation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-1-dbbf8b2b42bc@radxa.com>
 <quiwrspvimu5piokdswwqmaovv7arkr5swndnwjxhsgmipp6zc@itciwqnrilc4>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd
In-Reply-To: <quiwrspvimu5piokdswwqmaovv7arkr5swndnwjxhsgmipp6zc@itciwqnrilc4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mx/B3tE24dqu/242nbOXaippOeAz5fcCyapgxin0wEB6B5IZxdo1rquB
	qhD1Ziu8zURAAGP0uyN4KHrTvQpDNTnxunfVtkadxw7VZuX+mvIu7a/PY1wOfNwmEfVe09T
	CLv2jWQHGny7OjfsJcWgGegGSTNz5s0PoD42TwQ8/8VAl1A5EJz1k3IT2/pRHDwqpk6X/ze
	4xp2SofFqxwOAzwVtBUhji01Z/LnfXclWPxv83r1N1BtVAeXSTgSWXhS/hHD6Md6/XYS7Mn
	dBVaDadJjuwy2bJ1PJ/Yx0M0841KOfwo9w1znEBBnTUqYJiZH7+2/lb1Y+ESUWFmlAYd1j/
	NU53r/YAOxSoVVr+nYpmLhvJjGjytYdhUK5yi61+XUR6c9fgm29FKBhj153owgTJ8mea16N
	3yIdfFoEUPXR7GFK0Ucuzm/U2byWBuiwngNaeDP8N/z2GUG3/mox3oJXh+5RW0bViJMtjmL
	XO+JkKg8s1dUqj7rL3WnrpDmIeI5TdxJovTvpG854jN/hon87ksNzI1wo+BHsxWFlzJrpOl
	sB+f0MX82mGXBxo2uFs129j5cnH8tAq4Kp4STF2YMAdRPcFnoV1eRHRBc/6+Da+MB6YVej/
	7ht1hhXI6yCG8VjS2CJ/EPBvt7DI7VsYhIwxU5bEcIgEng6d4EVHRJ/AZBBMVk7gwxhMbqU
	755ZbigneCDRtntz/sTibjl7QwbyyRGvalcbAnwnkfOv/GIP7cnKu43Hp5RLasf+yUqz9jP
	dE+MFYR3Of1japeGC1fsKv8lyvpvG8EUuFLqztm8VqpzmkbGNZ4Z40hphLhhne1Iu5ZqLN5
	fG1dRmNnKkDdz9pUm2qP3LHEa4Sg9rAoLkrd8zx3ULzds8jzoRhWlApW51Iq/Djvs20jBSG
	F3y0HjwRTvP/3Jf6o6MQ9/8jtJe0KNKVUPdVmyHKU4YWvNl00EYaLP6V4LfoBJPZelj1mtv
	uCw6Lz0E4heQPOn/Ct+JES09GlqRc3zSDgVguAMaSKxubwtfKZRLELJRXJZ2ADrnkrPXjH8
	c4mZfKWirs+QPAuD/VJmFQHWxapVyqEwDtbJqH+aoV4dkjV4ZzRTJigzdDEEk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On 9/30/2026 9:26 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 30, 2026 at 08:41:45PM +0800, Xilin Wu wrote:
>> Bridge connectors can attach the max bpc property before their atomic
>> state is allocated by drm_mode_config_reset(). Unconditionally updating
>> connector->state in drm_connector_attach_max_bpc_property() dereferences
>> a NULL pointer in this case. Adding max bpc support to MSM DP and eDP
>> exposes this during display initialization, before a framebuffer console
>> is available.
>>
>> Only update an existing state when attaching the property. Initialize
>> max_requested_bpc and max_bpc from the property range when creating a
>> connector state so that deferred allocation and subsequent resets both
>> restore the default. Avoid leaving the bit depth at zero after reset,
>> which would otherwise cause valid display configurations to be rejected.
>>
>> With MSM DP max bpc support applied, this also restores boot on the Lenovo
>> Yoga Slim 7x.
> 
> Hmm?

The boot failure occurred with the later max bpc patch in this series 
applied. I'll drop the "restores boot" sentence and describe this as 
preparatory support instead.

> 
>>
>> Assisted-by: LLM
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
> 
> Can we rather update drm_bridge_connector_init() to register this
> property in non-HDMI cases if max_bpc is more than 8?
> 

Yes, that makes sense. I'll advertise the MSM DP/eDP capability through 
bridge->max_bpc and let drm_bridge_connector_init() attach the property 
for non-HDMI bridges with max_bpc > 8. I'll also handle state creation 
and bpc defaults there, following the HDMI path.

Thanks for the suggestion.


>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c | 5 +++++
>>   drivers/gpu/drm/drm_connector.c           | 6 ++++--
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>
