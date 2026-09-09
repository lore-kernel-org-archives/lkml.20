Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1DB44E03B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941789; cv=none; b=CR8dOLONU3ZMEnjjp6+GQQ8dbXxgy0Y/q/riU16bB0SMq3E0lwwm2zkmNpz5H59xahf80cvQzqpH18JUAifnkXjIjPIV7WCOEi7MzVNREBjHsyy+L5fGl25on5hs8BW4pgeSUWaA1EuTbYiWPtE+uTsBf+EAgIE8UV74sVdvUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941789; c=relaxed/simple;
	bh=KZeAnxLtToOSD0t1llvqrXGNQNmwVCsr8+T84DspU70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=om7ECeJ2kTzF6hDN2e18n6f3gLv/yyyXohjmPMAD3ydmecd3SmHJuedWFXuJ3VqivDz6YreccnKYA/jSEccd9oqIej2pmP072HJAbnSZW9MpGulD3uFfPhkNkpeItOs7/AwQFbvEyNoN/fA2qturTn7xZ2xJatYETgTDQ6FAalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oVwRmv0S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kf3y/ux6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rIJLgowA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bvjT9HbX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oVwRmv0S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kf3y/ux6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rIJLgowA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bvjT9HbX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 552CF1F80A;
	Wed,  9 Sep 2026 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788941781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jVpw8R+AUhJQTb64v2vSJKHIqReb6M+pWJta9F+vcns=;
	b=oVwRmv0Soo1OCi9BDyWiFkHwR83fmUjkvnIUmiKUKFIIjGo3rkVEGTxBybD4ALsy8w1EoY
	CSVgeHod1gfdxRvu4mUalCqbzSfWBSKYyMAJ7laXz12lLiI75cRQDZ5Y32Ff47qDv/thc2
	YpekK3a1gQnScycauIIdBCgYHQdD/D4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788941781;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jVpw8R+AUhJQTb64v2vSJKHIqReb6M+pWJta9F+vcns=;
	b=kf3y/ux6Bu55COlzJMejl44kGTejunv1S/AFtEADzgwGZSR4DZ2SzBaQdssic7923WYfBq
	oNVpNs16/N62aqAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rIJLgowA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bvjT9HbX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788941777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jVpw8R+AUhJQTb64v2vSJKHIqReb6M+pWJta9F+vcns=;
	b=rIJLgowAuOF/MQAbviF9cGfwwW6UQBq3JYkwyVnbBiQgFF9Pu7ELxAwFMisWd9be/ae4eC
	pzgJi/7uAprPNo/OBSZiKPRG+v1H3L50hmv4BSofXlEmLh8IWvjrPwEYBxUq+SkfiNllRG
	Po0DIif8uNmJZMIBrL7UKxjiFf40LcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788941777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jVpw8R+AUhJQTb64v2vSJKHIqReb6M+pWJta9F+vcns=;
	b=bvjT9HbXjVIuCX0BQpjpqOEakYaDOgOH4nqbn3R/2k2e5MQko4AEew7G+dcy2XajL7S1mx
	79+Wdh2CsJKQU+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7FDB13354;
	Wed,  9 Sep 2026 08:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id khCaLtAVoWo3KAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 09 Sep 2026 08:16:16 +0000
Message-ID: <d3a928e0-6faa-4cd4-9d2e-cb9be4cf84c0@suse.de>
Date: Wed, 9 Sep 2026 10:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/pl111: Advertise no pixel blending
To: Roshan Kumar <roshaen09@gmail.com>, linusw@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: leandro.ribeiro@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, pimyn@google.com,
 linux-kernel@vger.kernel.org
References: <20260825105427.686619-1-roshaen09@gmail.com>
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
In-Reply-To: <20260825105427.686619-1-roshaen09@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 552CF1F80A
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,google.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,bootlin.com:url,suse.com:url];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

Hi

Am 25.08.26 um 12:54 schrieb Roshan Kumar:
> Commit 860e748bddcc ("drm: ensure blend mode supported if
> pixel format with alpha exposed") added validation that warns when a
> plane exposes an alpha format without a pixel blend mode property. PL111
> exposes several such formats but does not attach the property.
>
> The PL110/PL111 controller scans out a single framebuffer and does not
> blend its alpha channel with a background. Advertise
> DRM_MODE_BLEND_PIXEL_NONE to match the existing hardware behavior.

Why does the driver report ARGB formats in the first place. I'm looking 
at the code at [1] and I don't see any difference to XRGB. Unless I'm 
missing something, please remove ARGB formats from this driver instead. 
Drivers should not report formats they don't support.

[1] 
https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/pl111/pl111_display.c#L259

Best regards
Thomas

>
> With panic_on_warn enabled, this warning prevents the syzkaller
> vexpress-a15 manager from booting. The change was tested on current
> master with QEMU 10 and the existing production DTB; the guest reached
> sshd and returned an SSH banner.
>
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
> Link: https://github.com/google/syzkaller/issues/7805
> Signed-off-by: Roshan Kumar <roshaen09@gmail.com>
> ---
>   drivers/gpu/drm/pl111/pl111_display.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> index 5d10bc5..758b297 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -15,6 +15,7 @@
>   #include <linux/media-bus-format.h>
>   #include <linux/of_graph.h>
>   
> +#include <drm/drm_blend.h>
>   #include <drm/drm_fb_dma_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
> @@ -596,5 +597,10 @@ int pl111_display_init(struct drm_device *drm)
>   	if (ret)
>   		return ret;
>   
> +	ret = drm_plane_create_blend_mode_property(&priv->pipe.plane,
> +						   BIT(DRM_MODE_BLEND_PIXEL_NONE));
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)


