Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4541B342CB0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031480; cv=none; b=OIHCwJ7ChwccMi8jhpfVN8hyPb4VFm7XQ6CQQlJ1eNCXToUN/lK6z/vJI5kNV9j1zqnku7TqkcOG7E01NZUQC/oZcqOiCzVOppwedGcE4Z4h6/OGySCTe2UbOJoYv5PfcqKmtFH0PqhzevRVwhtC5VtUSFx7g7iCvxczD59CYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031480; c=relaxed/simple;
	bh=kMEHw+Y3oxJLN5/a3m5XLxvsK4JfTnqmaIt3Wohnmgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skUqy5XghegDQZwFra2Iu4vLpZQOz9euAZdFyO+y2j2+ALWdkr2ZDoahWJPO/1doEnm34WNJfcNX7m8L4PMSzUUIXNy5FnBvT9KpTDWZSIa4q1zxQH/8zRHEgbAKojnhcqdUD1mmN/hLqULrxNOiA9N5L99fcUSA8g1P8LyVsGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Plu+9tRM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HR+wu/55; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xb2igSyS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5rnmJToy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Plu+9tRM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HR+wu/55";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xb2igSyS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5rnmJToy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04CFB21BC3;
	Thu, 10 Sep 2026 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789031472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NnEMHNqY8E0v8UjNtFeQvZzmCm7Z3QTfHoi6Ew4qBBg=;
	b=Plu+9tRMSFQ4ytBwTiLeITnqBf8bIKtJ1j+nCuPQHs8VF5uSbkn2FYjgNPJssXdsepKOwT
	MzQFFLu7ksfaSGmMd+YY+alyGCCWfwkrKIGlvj/Bqby5dyC021CtlsW0OxFunNA1nNijxw
	4KCL52+9CfGCWjTTaWauGeRXg8RhSHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789031472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NnEMHNqY8E0v8UjNtFeQvZzmCm7Z3QTfHoi6Ew4qBBg=;
	b=HR+wu/55XYmJBdwcSiCyb6Zp6d3A6wy9QZcrIGnZ2yZdknfWoa4NMn3DtTdcWBn+T0YiGy
	n78cwg6Gi9pVu0Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xb2igSyS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5rnmJToy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789031467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NnEMHNqY8E0v8UjNtFeQvZzmCm7Z3QTfHoi6Ew4qBBg=;
	b=xb2igSySTwiwKpELmIynGQLq5ncK6ia3QH+RZPZdN/QOXwZmCYOv6WiXhQ8OO4qX4Z4JPr
	8SmQiBy7CN1rNbyiIpzdWv55oeIuYNWSzqk/HfgF+xiLcVrb4WwSO30UGw34ojRCQAjf0g
	RTt7RlqP8kmhUEC2S6Ugq8j9KsbtTGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789031467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NnEMHNqY8E0v8UjNtFeQvZzmCm7Z3QTfHoi6Ew4qBBg=;
	b=5rnmJToyjIBSDojUMbRobyVtbPshtYv9jUvmHumnRCCICjEZpcC8DV3MCtjhKFG3Fgqhj+
	TrlzJaHviAn+NOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21FC71321C;
	Thu, 10 Sep 2026 09:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LsKKNyl0omo3AQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 10 Sep 2026 09:11:05 +0000
Message-ID: <de6b8deb-090c-4950-8b6d-33f6dca5a999@suse.de>
Date: Thu, 10 Sep 2026 11:11:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/verisilicon: set blend mode for the primary plane
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
 <35cf76a67f7473d5ef86d01c812d680abc41687e.camel@iscas.ac.cn>
 <e2a2f02f-13c4-4919-9344-db7afcd3368b@suse.de>
 <d36bc08a7f954be25b0d3e0fe649698b3944f98a.camel@iscas.ac.cn>
 <e61e51fb-9e29-46c9-888d-5ad377a89311@suse.de>
 <0f79f3bd5175285de4b2112e6419a8f373b0ff81.camel@iscas.ac.cn>
 <924e1372-6fe2-42ae-a57a-d44d3cf08f5a@suse.de>
 <76f48282eb5deb217dd1c8b6dc547e4a058580ad.camel@iscas.ac.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <76f48282eb5deb217dd1c8b6dc547e4a058580ad.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 04CFB21BC3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,iscas.ac.cn:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

Hi

Am 10.09.26 um 11:02 schrieb Icenowy Zheng:
[...]
> As the DC8000 support is being developed (a new revision of that
> patchset just appeared on this Tuesday), and on that hardware the A
> channel has no meaning except for being ignored (no blend configuration
> register for the primary plane), maybe I still need to remove alpha
> formats (at least for DC8000)?
>
> Although in such case, when the overlay support is going to be
> introduced, two format tables need to be present -- one with alpha and
> one without.

Sure. In my opinion, there should be a dedicated format table for each 
type of plane. These "super tables" that sometimes try to catch all 
cases in a single place are not great.

Best regards
Thomas

>
> Thanks,
> Icenowy
>
>> Best regards
>> Thomas
>>
>>
>>> Thanks,
>>> Icenowy
>>>
>>>> In pl111, we now remove the ARGB foramts because the hardware
>>>> does
>>>> not
>>>> handle them at all. The situation seems less clear in
>>>> verisilicon.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>
>>>>> Thanks,
>>>>> Icenowy
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>> Thanks,
>>>>>>> Icenowy
>>>>>>>
>>>>>>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/verisilicon/vs_primary_plane.c | 3
>>>>>>>> +++
>>>>>>>>      1 file changed, 3 insertions(+)
>>>>>>>>
>>>>>>>> diff --git
>>>>>>>> a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>>>>>> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>>>>>> index 1f2be41ae496c..8d58682d88ef8 100644
>>>>>>>> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>>>>>> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>>>>>> @@ -7,6 +7,7 @@
>>>>>>>>      
>>>>>>>>      #include <drm/drm_atomic.h>
>>>>>>>>      #include <drm/drm_atomic_helper.h>
>>>>>>>> +#include <drm/drm_blend.h>
>>>>>>>>      #include <drm/drm_crtc.h>
>>>>>>>>      #include <drm/drm_fourcc.h>
>>>>>>>>      #include <drm/drm_framebuffer.h>
>>>>>>>> @@ -179,5 +180,7 @@ struct drm_plane
>>>>>>>> *vs_primary_plane_init(struct
>>>>>>>> drm_device *drm_dev, struct vs_dc
>>>>>>>>      
>>>>>>>>      	drm_plane_helper_add(plane,
>>>>>>>> &vs_primary_plane_helper_funcs);
>>>>>>>>      
>>>>>>>> +	drm_plane_create_blend_mode_property(plane,
>>>>>>>> +					
>>>>>>>> BIT(DRM_MODE_BLEND_PIXEL_NONE));
>>>>>>>>      	return plane;
>>>>>>>>      }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)


