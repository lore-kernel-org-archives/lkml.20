Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629918;
	b=hVPc7PX1FU05a/vvW0qvsrpD0rsb8Rrc7srkXlEGpwNMdpawb0b4QJRSgmmf2LkUJ2nF
	 omK+yrcdS0+qp1A/7LaF3rvFBQt0fT2OX8ENXaSFtPGzqRwWsQZVijlGQlFAl0pjhBnE0
	 rjnSiL26rS8Oiyisw0OHqLxKtZ5ea1OvK7KnDtoJkmKE+5ds+Msh0PFz3K2i5k838Ez4S
	 YBG5L+B8xi7UpMan9xF88LE1KkvrAOpeOEtqduAbBhzozoF1LrH0YieWhTjlKtdJ5MtyE
	 gUkZ5ySUucfh4+Mne8dIJP0ZidwJIfYpaDvpUM75JY+Xj9+fVw3TVrPZxHip+nTepJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629918;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=8XtFno1LXK5ZcN8PjImjq2ZtTjAEbkVCsOnLFGjG/4E=;
	b=V0aULUIZHC16Io8SIrY+JAA0/e7NhJffZMx3iAOwGB9MGS2QA9ObYJM+awZjGdb0bUlM
	 8ENJSQktSv03if+zIRowFb5wPqHxn8Vznj07loS6myHtlBsCp+ACqdIXISFXHp7s0OCGn
	 YzzQHQdocwsSAb3hgJTJj2TZP6NgyfBHgF+iTj+zGSu/oJ5+5+fQc4Nclg59osuvplApL
	 sIejPYKJcD1o6ODh8i3tnYcnYokfwkxte6DeWrjeUXsGne2oBPf/Ed1Ud5FxoeqRRfMgm
	 13uuCdDwRRYiXx80XrWefZ24jas3QZXdYzSbu7bdddUpMlszSxc02j/rNDOVSyvUD5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="IU+2qlg/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LYWs6dN5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mXucFxGh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1eyvOfIB;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EF7606B0D5;
	Mon,  2 Nov 2026 14:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EF7606B0D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IU+2qlg/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LYWs6dN5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mXucFxGh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1eyvOfIB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC02022005;
	Mon,  2 Nov 2026 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793629916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8XtFno1LXK5ZcN8PjImjq2ZtTjAEbkVCsOnLFGjG/4E=;
	b=IU+2qlg/oI+7ghN1To12yfL/yVxBnbEJ+lKQZOJTYl/0H4otGGVh2UOLNTuMbvMcq1m9Dd
	U4SQFqn+NcxbKT2Do9a9ZWN42hkj146aQmr6O/hirrN5ZzyP+m02FuK+DwMRjX8iYkD2vH
	xVXnvvvvNl7esUZWS8o2GlkjpKlHd4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793629916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8XtFno1LXK5ZcN8PjImjq2ZtTjAEbkVCsOnLFGjG/4E=;
	b=LYWs6dN5GXG4pqU43/EGutk8ajlYkpdTzp3v2Y5YC4xspCVFIBeo2RFOU1QiLpLAFg1C0I
	knNsDc8vDBCCE6Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793629915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8XtFno1LXK5ZcN8PjImjq2ZtTjAEbkVCsOnLFGjG/4E=;
	b=mXucFxGhnJaIHY/QkSsM1so4lNb2+n7slVaY5d5jGgyHXKU7JK6f2NtVNvxmx/7Mwby5/Y
	l+VKegExqc+YN97hHmDqnFPwOc18QK0F7QeWMGfRb7Hq8kcrohHUNvLQ1+YZxFLLBq/y99
	KlyGzeLEmYNarwGIatkQaGYrlocapHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793629915;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8XtFno1LXK5ZcN8PjImjq2ZtTjAEbkVCsOnLFGjG/4E=;
	b=1eyvOfIB+Fx/UdE0+lkhkRI/2gqecZR0DMZIjpAzyEs3LGrEpBEy/zpMnJO6QKxdMjpxR7
	6BWpoNND/ikRlDDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C61D134B8;
	Mon,  2 Nov 2026 14:31:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qG8hGdue6GqYPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 14:31:55 +0000
Date: Mon, 02 Nov 2026 15:31:55 +0100
Message-ID: <87wlqv8ftw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	rosen@gmail.com,
	cezary.rojewski@intel.com,
	tim.bird@sony.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
In-Reply-To: <20261102141647.3133-1-sreekuttan2156239@gmail.com>
References: <20261102141647.3133-1-sreekuttan2156239@gmail.com>
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
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,sony.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 02 Nov 2026 15:16:47 +0100,
Sreeraj S Kurup wrote:
> 
> Pass the updated frame count to the "src_frames()" callback.
> 
> When the next plugin handles fewer frames than requested, use the
> actual frame count instead of the original requested count.
> 
> This ensures the correct number of source frames is calculated.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>  sound/core/oss/pcm_plugin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
> index acf5ca663ba8..3de713779993 100644
> --- a/sound/core/oss/pcm_plugin.c
> +++ b/sound/core/oss/pcm_plugin.c
> @@ -604,7 +604,7 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
>  			if (err != frames1) {
>  				frames = err;
>  				if (plugin->src_frames) {
> -					frames = plugin->src_frames(plugin, frames1);
> +					frames = plugin->src_frames(plugin, err);

Hm, do you really see actually hitting this code path?
As far as I see, the all client_channels() callbacks return the frame
back as given, so the condition (err != frames1) would be always
false.


Takashi
