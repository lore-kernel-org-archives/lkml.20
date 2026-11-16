Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836253;
	b=aNZAL1vFWfIKf7tn/BqEx6crMv9t8NK6TpwkSPwnd9BbexLlAerSBXysr4a6X1+Z6lgj
	 3VIUANTomtwzEsMjwvvHeeBpM41FAFfB2XET2FLNz7jUnIx6j3i25AuEMew7RMc9UY7F7
	 4uFRv6sDnhSG1FDs2ho7PbGmPKFWSBbs+d2MAmseUBuhDy2nWedsjf7vUbwTIdgKY32Zq
	 0NvY6jmNSUo+3npsR5g1K6hmOSWH742ST3IzkuokeN7kcntANnCzU7KR2wETNx+N2vZAT
	 QJ4ZZw7xoBjyMM1J1rmBiMG7HLMU0IhD4mvlqGMF4x8ly1EDhumL8YvKuhOcf6A1z0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836253;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=kSW8d4aGIb2Mz5RrdnL8ItR5RWa9tMlRytufeMOKQ4Y=;
	b=W++rblgDinc4FmhMJ7GIrbIC6nZ1Ihsu4XhnfmebAuOzTevJjiUrcjH59XzJ6UKmEnzU
	 iMJeg7zRDdQtMrNDgtpdR4NjyH4DxUd/cabskaYbT+VWypbPtzBABegsxMPaJKrBsfJei
	 TckFznJ1Tp9Pdh28biOLdYyTw6dvrwyfB8tVwmR/esVY12qMh+0KqtFguP0yyNQ76+Mss
	 brev6VE9Aei9nG3gEvImJBCev0kWoC4GY+TSJ9D+Vs6w/KaxvUR+flTKaZ4lfBUGCe7ME
	 YNTdZSHqmSHDe3lKEzsaajTIz4jPnW9jzWst8dv8cmatTMbldJ1ZJI20REg7VqjWxlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M7R4WWt5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="8UQ8/9xZ";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fb6paCtE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5TcceDFu;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB465606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB465606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M7R4WWt5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8UQ8/9xZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fb6paCtE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5TcceDFu
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E441E1F7D2;
	Mon, 16 Nov 2026 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794836251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kSW8d4aGIb2Mz5RrdnL8ItR5RWa9tMlRytufeMOKQ4Y=;
	b=M7R4WWt5LhsdS41dnDd4HMOc/fmHcW0VDy8Dp3caaSk4SjL0Sri9wf5lkKdRoqwN80+l8H
	PyCyLPTxMKcsTyXpiD1CuljQTZYPKeeGroRI7vZQkEVFuh+zQVd1NWCRCe/dyyY4IZuiOS
	aGK52uMqkdtnnJGW1FFNpgDhjP01QzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794836251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kSW8d4aGIb2Mz5RrdnL8ItR5RWa9tMlRytufeMOKQ4Y=;
	b=8UQ8/9xZYYuu/L8l/llRqaaMbAFRk2agTIk0HU9zTiz4fKSZBf5UBtr3z1QZKwDQuzkHXV
	/SwsPJB+Pwa1U3AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794836250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kSW8d4aGIb2Mz5RrdnL8ItR5RWa9tMlRytufeMOKQ4Y=;
	b=Fb6paCtE9178ACVH4zobcgzuOeVBwFkEEyvhlPRxNk8mFe3u+5+b4GmDSxeONP0o31fMBS
	xjr3J+4Qkjlo4KDDdxBlb4Pr2Tt3NkX57UsX8kRxB6e62v1zgrhOCL+26W7Uk9Sx44Sc+2
	bZ0OnbCtkFy6qtiJoJqUoq/qFqljuQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794836250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kSW8d4aGIb2Mz5RrdnL8ItR5RWa9tMlRytufeMOKQ4Y=;
	b=5TcceDFuRNodefzbrG4V12wXrAoRGZ3JXLkkhH93BzsOby5+H0jCPGkuyFVdSqpwrcQuLd
	Lqnc6bvBttBASRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 733DD1334C;
	Mon, 16 Nov 2026 13:37:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Fi12EBoH+2pkMQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 16 Nov 2026 13:37:30 +0000
Message-ID: <8e3b36c6-e2d8-4746-aefe-462bba1a4b05@suse.de>
Date: Mon, 16 Nov 2026 14:37:29 +0100
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
Subject: Re: [PATCH v2 2/4] drm/verisilicon: nuke planes' atomic_enable hooks
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Joey Lu <a0987203069@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
References: <20261102075710.1286456-1-zhengxingda@iscas.ac.cn>
 <20261102075710.1286456-3-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20261102075710.1286456-3-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,oss.qualcomm.com,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org,icenowy.me];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

Hi

Am 02.11.26 um 08:57 schrieb Icenowy Zheng:
> The atomic_update hooks of both planes are just bailing out early when
> the planes are invisible, so it's reasonable to just remove these hooks
> and update the enabled state in atomic_update.
>
> This fixes the problem that invisible but enabled planes won't be
> shown when made visible, as pointed by Sashiko.
>
> Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
> Fixes: 8c4ae2189125 ("drm: verisilicon: add support for cursor planes")
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   drivers/gpu/drm/verisilicon/vs_cursor_plane.c | 22 +++-------------
>   .../gpu/drm/verisilicon/vs_primary_plane.c    | 26 +++++--------------
>   2 files changed, 10 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
> index da456dced88aa..5295dc2f9ee2e 100644
> --- a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
> @@ -98,23 +98,6 @@ static void vs_cursor_plane_commit(struct vs_dc *dc, unsigned int output)
>   			VSDC_CURSOR_CONFIG_IMG_UPDATE);
>   }
>   
> -static void vs_cursor_plane_atomic_enable(struct drm_plane *plane,
> -					   struct drm_atomic_commit *atomic_state)
> -{
> -	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
> -								       plane);
> -	struct drm_crtc *crtc = state->crtc;
> -	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> -	unsigned int output = vcrtc->id;
> -	struct vs_dc *dc = vcrtc->dc;
> -
> -	regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
> -			   VSDC_CURSOR_CONFIG_FMT_MASK,
> -			   VSDC_CURSOR_CONFIG_FMT_ARGB8888);
> -
> -	vs_cursor_plane_commit(dc, output);
> -}
> -
>   static void vs_cursor_plane_atomic_disable(struct drm_plane *plane,
>   					    struct drm_atomic_commit *atomic_state)
>   {
> @@ -153,6 +136,10 @@ static void vs_cursor_plane_atomic_update(struct drm_plane *plane,
>   	output = vcrtc->id;
>   	dc = vcrtc->dc;
>   
> +	regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
> +			   VSDC_CURSOR_CONFIG_FMT_MASK,
> +			   VSDC_CURSOR_CONFIG_FMT_ARGB8888);
> +
>   	/* Other sizes should be rejected by atomic_check */
>   	switch (state->crtc_w) {
>   	case 32:
> @@ -225,7 +212,6 @@ static void vs_cursor_plane_atomic_update(struct drm_plane *plane,
>   static const struct drm_plane_helper_funcs vs_cursor_plane_helper_funcs = {
>   	.atomic_check	= vs_cursor_plane_atomic_check,
>   	.atomic_update	= vs_cursor_plane_atomic_update,
> -	.atomic_enable	= vs_cursor_plane_atomic_enable,
>   	.atomic_disable	= vs_cursor_plane_atomic_disable,

But now you have the worst of both worlds: atomic_disable is still 
around but also done by atomic_update. And atomic_update always sets 
these registers even if the plane is already visible.

I'd instead remove the disable calls from atomic_update [1] . I think 
you should never reach this is you have an atomic_disable installed. See 
[1] for the logic.

[1] 
https://elixir.bootlin.com/linux/v7.3.1/source/drivers/gpu/drm/drm_atomic_helper.c#L3030

Best regards
Thomas

>   };
>   
> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> index 8e94491693019..fca692f4f7d5c 100644
> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> @@ -59,25 +59,6 @@ static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int output)
>   			VSDC_FB_CONFIG_EX_COMMIT);
>   }
>   
> -static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
> -					   struct drm_atomic_commit *atomic_state)
> -{
> -	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
> -								       plane);
> -	struct drm_crtc *crtc = state->crtc;
> -	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> -	unsigned int output = vcrtc->id;
> -	struct vs_dc *dc = vcrtc->dc;
> -
> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> -			VSDC_FB_CONFIG_EX_FB_EN);
> -	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
> -
> -	vs_primary_plane_commit(dc, output);
> -}
> -
>   static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
>   					    struct drm_atomic_commit *atomic_state)
>   {
> @@ -144,13 +125,18 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
>   	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>   		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>   
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> +			VSDC_FB_CONFIG_EX_FB_EN);
> +	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> +			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
> +			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
> +
>   	vs_primary_plane_commit(dc, output);
>   }
>   
>   static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
>   	.atomic_check	= vs_primary_plane_atomic_check,
>   	.atomic_update	= vs_primary_plane_atomic_update,
> -	.atomic_enable	= vs_primary_plane_atomic_enable,
>   	.atomic_disable	= vs_primary_plane_atomic_disable,
>   };
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG Nürnberg)


