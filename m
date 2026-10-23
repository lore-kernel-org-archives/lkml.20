Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754971;
	b=4Txn6Xxx/G//mi6cYp+1pURqYtvx0VK3+mb0eWXH8+AMOLrfLO77kNhFWst5PeAntpPl
	 0v/gPBLNnAm2rm20qjnwXqKJsEYlNiZ8CUfOikLOluwnpICaQHFg5gU3pBtFqW+5lls+g
	 d3P1k42Es3HUDfNW3m7Zmo8uPo02NjIMCBWe1SwEyqqi6dTGM4vOtgaMAGG0ZdWAWl+ga
	 kXA4V9ONxkhaUv9WxduKyjsZfl8t52B7eS1SlBRea5zNcC15PGfgRrwXW2UISJu1gCIBN
	 Vzy+hLNPL6h35mNOK4yyY0wPFN+anezBF6ucAKA/vqS7Bl+FYz91H3ecotXrcp9SWsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754971;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=1gG0a133iGc8zFfdyo2jxZF1xre0H2z1C4HkfId5Zgc=;
	b=Ec59cTNyZxsG7trfw1V4I1YSdLnzJ7Ow/KRbpKoq+egSuN/6WnuZhrSrOEFaXAbip5qu
	 cx/CKXsq9r/ppfaLmbvQbdlZ9iBiEA6KFVPmZPgIVQ6IMI/WDm1FgFXw9hYIsnqD8nL3x
	 chGIa8PoOKNFIN0mXXFfcSwdX+84e8LHh8u861GgYy6zBydymEjEOnz0/hhnrzgKbBefk
	 zth+8QgLodN6tCofH3nbB1yulLi2sIShSUiMJVbQSCTsLopfEIborHaIc5hw7Kb5Fk5iA
	 iAurRvO2i0NG7O1MWT8bj3hPlV26uL7+3TWoWWwDDcBelsPzw1G0tPATvgYE3k0SU8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNRxSh76;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aGbXnqtK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNRxSh76;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aGbXnqtK;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNRxSh76;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aGbXnqtK;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNRxSh76;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aGbXnqtK
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E4FF2213D;
	Fri, 23 Oct 2026 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792754969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gG0a133iGc8zFfdyo2jxZF1xre0H2z1C4HkfId5Zgc=;
	b=JNRxSh76GW9bKDJ33J1M42I3VomGqt1YtAlWzDfVWLL0hDxONx40PtwOZgjagvuzoYG9ZF
	aPPqBHqLyuF0Y7PMPAolqF6pNwqYMZT6b85sfh5eVr8WFr1PKvWGx0TGNx6Ja6zq3eHjeF
	70qRrNOwBpUT82fE3WTqdUehawkGBoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792754969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gG0a133iGc8zFfdyo2jxZF1xre0H2z1C4HkfId5Zgc=;
	b=aGbXnqtK8DDV9ywXnOUr9OTP+9b0SXe2DETvY8RsHUiH/YFESh2vR6un0X5DH0bkiYzLBl
	YwgU+XecFfnVLkBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JNRxSh76;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aGbXnqtK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792754969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gG0a133iGc8zFfdyo2jxZF1xre0H2z1C4HkfId5Zgc=;
	b=JNRxSh76GW9bKDJ33J1M42I3VomGqt1YtAlWzDfVWLL0hDxONx40PtwOZgjagvuzoYG9ZF
	aPPqBHqLyuF0Y7PMPAolqF6pNwqYMZT6b85sfh5eVr8WFr1PKvWGx0TGNx6Ja6zq3eHjeF
	70qRrNOwBpUT82fE3WTqdUehawkGBoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792754969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gG0a133iGc8zFfdyo2jxZF1xre0H2z1C4HkfId5Zgc=;
	b=aGbXnqtK8DDV9ywXnOUr9OTP+9b0SXe2DETvY8RsHUiH/YFESh2vR6un0X5DH0bkiYzLBl
	YwgU+XecFfnVLkBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDE5D133F6;
	Fri, 23 Oct 2026 11:29:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ukrMKBhF22r7SAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 23 Oct 2026 11:29:28 +0000
Message-ID: <04b3e1d0-3e01-4953-a53c-0f9354e6cae4@suse.de>
Date: Fri, 23 Oct 2026 13:29:28 +0200
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
Subject: Re: [PATCH v2] drm/client: Don't print a NULL firmware config mode
To: Hugo Sales <hugo@hsal.es>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
References: <20261023112125.2855499-1-hugo@hsal.es>
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
In-Reply-To: <20261023112125.2855499-1-hugo@hsal.es>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,hsal.es:email,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 2E4FF2213D

Hi

Am 23.10.26 um 13:21 schrieb Hugo Sales:
> When some tiles of a tiled display are missing,
> drm_client_firmware_config() replaces the connector's mode with
> drm_connector_fallback_non_tiled_mode(). That returns NULL when
> connector->modes has no mode other than the tile size, but the debug
> message after it still reads modes[i]->name. Accessing a member through
> a NULL pointer is undefined behaviour. Today printk happens to get an
> address below PAGE_SIZE and prints "(efault)"
>
> Print "(none)" as the mode name instead. A connector whose mode is NULL
> is skipped by drm_client_modeset_probe(), so it is left off, as before
>
> While at it, drop the extra colon in "[CONNECTOR::%d:%s]". Every other
> DRM debug message prints [CONNECTOR:%d:%s], and the double colon breaks
> grepping the log for a connector id
>
> Sashiko found this while reviewing a series that makes the fallback
> return NULL more often, by also skipping modes larger than the client
>
> Fixes: cf1d0180f571 ("drm/fbdev: Fallback to non tiled mode if all tiles not present")
> Link: https://lore.kernel.org/all/sashiko-outbox-173425@kernel.org/
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Hugo Sales <hugo@hsal.es>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>


> ---
> Changes in v2:
> - Use modes[i] ? modes[i]->name : "(none)" in the existing message
>    instead of a second drm_dbg_kms() (Thomas)
> - Drop the extra colon in "[CONNECTOR::%d:%s]" on the same line
> - v1: https://lore.kernel.org/r/20261022114356.669988-1-hugo@hsal.es
>
> I ran checkpatch and built drm_client_modeset.o with W=1
>
>   drivers/gpu/drm/drm_client_modeset.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 0080a8e9556a..67f90e5d1512 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -754,10 +754,10 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   		}
>   		crtcs[i] = crtc;
>   
> -		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
>   			    connector->base.id, connector->name,
>   			    crtc->base.id, crtc->name,
> -			    mode_type, modes[i]->name);
> +			    mode_type, modes[i] ? modes[i]->name : "(none)");
>   
>   		fallback = false;
>   		conn_configured |= BIT(i);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG Nürnberg)


