Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307086;
	b=mJFdz5U0Dyvd1uVb+ulr64L8EcSDKE9D7rOoWpd0tOL+zoaUTDP6aWqM1Kx1ENqNvlca
	 9Fmy8zvTN6cNCEQnbAoQP+kGjCtHNtC/rJBKtf5pKleQw6noTLZagguxus++P/+BuNVY3
	 JuddgpzvWozealOW15hxTxxw+Kgx/0K/J/UUGCfQn2BnFmc7IeMZ+BwfAamlCq4+ysjdF
	 R6fVWG9nVrYvCi2KbGXTLc0IjStJnDF6RXHRyq2FPguULIisCRHIN7RdYHQd5mJGer9jN
	 iJiSM57lId4rPNeCr0K2CwJNhIYPE/EQTwO8zIWM5AxyBOEhSt6MP0FCOmSrfRkGx9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307086;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=aOc+2+AxSa/K+9V3Xgafch0lyGqrduHf8O4mo8k1R7E=;
	b=hTNk4aVonsbBaqwMYEMQlIlA5QnsfeIAPDHJR0o3u4ucklClxq+KhQevx3gEShXMmfxf
	 r5Hv3yQjBlWKaPEROGrAlzD94tRNdvvCSKhS7mAsOuuxyZiQTRHWQlWvs3FENARgYwdq6
	 FMq+G/nE37fK2ajWJkxOgNWsbHPglV+oekMG2d5Ymlrhblic6ymJwaVbiGRjvmKOYO8bb
	 TYZ/u5babvBwECOEoNWAxDkHpzqwrMl7f+eIvktSWIf+T8D7RUWr0Tqph9Al6jE5rtEFA
	 IYXsIu1xZ7ibOUSnUgMnzhLvftsBaerOspfZhAnUMM/dFeMt9o+mFMWVaK25n5SQy5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xng7AEHq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q8XUPgde;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cjUv6VbP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aAHNpq3w;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC8606A333;
	Tue, 10 Nov 2026 10:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9AC8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xng7AEHq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q8XUPgde;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cjUv6VbP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aAHNpq3w
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0026421E04;
	Tue, 10 Nov 2026 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794307084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aOc+2+AxSa/K+9V3Xgafch0lyGqrduHf8O4mo8k1R7E=;
	b=Xng7AEHqFLeYbEBGNDEo4LltTXuqHotTxmut/go1LQg0JmPll8BgajEwf6+KeDPC3J7kv2
	3Do9+9IZiQyso7Zgr/VHffkaD9pVRTKu+RGRiRw8ASOnipx5PE9M0SDasL3uaNyCv2c7Yc
	gs4WM+rg1PK5nILmCNSNqSM9xbQazuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794307084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aOc+2+AxSa/K+9V3Xgafch0lyGqrduHf8O4mo8k1R7E=;
	b=Q8XUPgdeyFkcRsD3bd8HM2XXcXx4tPCo7pWagOy2OgMFYkjuwtXeMxkwj6Fm4pEqG2hi8+
	xihMJIiAKv+41KAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794307083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aOc+2+AxSa/K+9V3Xgafch0lyGqrduHf8O4mo8k1R7E=;
	b=cjUv6VbPOzKDZbMAeGxjcR4BcnSAZ3s9Txrh4wOaFKrgvrjpbert+oUHmgg3ycR/EmvdzI
	sOrXAjUmQD8L89SFxNubniY2u/ZyIRQP5IzwK0shbj+hUl646yPV9jGD6ZM6jrUE0jwH/P
	+pdhc/t5TlVzo5Zm3Vadu0VdoXWaRAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794307083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aOc+2+AxSa/K+9V3Xgafch0lyGqrduHf8O4mo8k1R7E=;
	b=aAHNpq3wx7TZ868LHJwKhbn8YZd+NOycMQ4DcjsFHQhVSTaRuxB/jx30qDeWI4bdEMFhGf
	zcdqtWnUCT8W4VDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDDC71339F;
	Tue, 10 Nov 2026 10:38:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P/eFJQr08mokNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Nov 2026 10:38:02 +0000
Date: Tue, 10 Nov 2026 11:38:02 +0100
Message-ID: <87y0b1ug39.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v3] ALSA: control: Validate element info in compat ioctl
In-Reply-To: <20261108172501.2887-1-sreekuttan2156239@gmail.com>
References: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
	<20261108172501.2887-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 08 Nov 2026 18:25:01 +0100,
Sreeraj S Kurup wrote:
> 
> The compat ioctl code calls the control's info callback directly
> in get_ctl_type() to get the element type and count.
> 
> Unlike the normal control info path, it does not validate the
> information returned by the callback.
> 
> The compat read and write handlers use the returned type and
> count to access fixed-size value buffers and calculate copy
> sizes. Invalid values could cause these handlers to access
> memory outside the expected buffer boundaries.
> 
> Use __snd_ctl_elem_info() to get and validate the control
> information before using the type and count. This also applies
> the same element ID handling and access checks as the normal
> control info path.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
> v3:
>  - Use __snd_ctl_elem_info() instead of duplicating the
>    element ID handling, access checks, and validation.
> v2:
>  - Rebuild the element ID before validation
>  - Set the control access flags and respect
>    SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK
> 
>  sound/core/control_compat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
> index 87f7ad5ab739..a9ee5ef30c51 100644
> --- a/sound/core/control_compat.c
> +++ b/sound/core/control_compat.c
> @@ -181,7 +181,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
>  	if (info == NULL)
>  		return -ENOMEM;
>  	info->id = *id;
> -	err = kctl->info(kctl, info);
> +	err = __snd_ctl_elem_info(card, kctl, info, NULL);
>  	if (err >= 0) {
>  		err = info->type;
>  		*countp = info->count;

Isn't such a sanity check done in anyway at snd_ctl_elem_write() call?
The OOB copy from/to user-space would be just -EFAULT as expected.

It's not too bad to call __snd_ctl_elem_info(), but I'd like to be
sure whether it's really needed.


thanks,

Takashi
