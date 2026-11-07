Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042881;
	b=QV3NqUbQ22SYHk6UOK2XXkwV3i5RFHX+5dUjRduCpU8LtCFDh4DhDPqVVx9F0YmhOi0s
	 ImgSO9Fsdc0BKaF7FGQoq6CZqdc9OsFnSXudSDEk/ph3SJXwrr9PbefDyLBQ/0HeqpR/7
	 aW3Sp6uCNWeyxnyGKUpRimj6SGB9QyXd5SuZ3gzU3hIVgN2QOlMKdt84Z6HAI8wCxEXIE
	 v/L/XLkRZ1ZxuBVg8fTZAd373+zsh7qd/CPms8HDm7vfnwBFnDStRY/XZyotaDBZPeWDH
	 ZBtXzCc+VvOJCBo6quu/uVap6lA5W+UYjqPIfKQAr9cJFlQsTjSsz91UsyCQB2ck8Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042881;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=TSV/+U/KjsFDX5ZRIGFZMHLItdtNr8eTvVpZmDA0/4o=;
	b=yZMx2AironWB4w558IoWzBzP3xwgi4HP/fsCbnDMn/nNABU8dKwXNyYNWjSzuQanEPiQ
	 vGU351975C6InJEr606SaIL5PQ9Yha/pYAGchrNWnD+9lyhIj5cX6gDLNVwQEnBbdN89N
	 kc4QN2f92KBVeJKw45kmKGz0HToafSlr34kpjkWgVOGlpmAxeu06+Xb7l3CipotwS3ICC
	 b+f+FStRoXwrq/F7I1hne9p4B2gi3Wbif4xDE7IidS9dKMXL/iSc1oJe1kNprc+RQGWOZ
	 hM9Bh4KqhLnHmr4qmA8k+xIWFb6SU1XLA+4D36bhEgaJTryRxPyO2XJnVm4FCsv5HuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jKl7JDB5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=s0G3rWF0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jKl7JDB5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=s0G3rWF0;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9997606A326;
	Sat,  7 Nov 2026 09:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9997606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jKl7JDB5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=s0G3rWF0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jKl7JDB5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=s0G3rWF0
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2CDA421DA3;
	Sat,  7 Nov 2026 09:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSV/+U/KjsFDX5ZRIGFZMHLItdtNr8eTvVpZmDA0/4o=;
	b=jKl7JDB5Yf2gPpI5LneeLwnevzLKXfive4l54LT5666U9Jh+CIKAZKVxAHJLeOp0djbhWI
	YBEkCWkayH49lsx23cnfBGMQioyH04izcPehfFMvUd4Z0Tq9uMZS3V1F6pVqI6mE+3wIpw
	V1hlrQeSXLvhwR/WIaIUpwVjiAJSdKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSV/+U/KjsFDX5ZRIGFZMHLItdtNr8eTvVpZmDA0/4o=;
	b=s0G3rWF0muSOm6TFgP+WW4zHqgzpELhpTgaKon4KoImMNDAX9p0h/xbmPPxjX4hlnHllRI
	D+yVdt5vo1CDFvAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSV/+U/KjsFDX5ZRIGFZMHLItdtNr8eTvVpZmDA0/4o=;
	b=jKl7JDB5Yf2gPpI5LneeLwnevzLKXfive4l54LT5666U9Jh+CIKAZKVxAHJLeOp0djbhWI
	YBEkCWkayH49lsx23cnfBGMQioyH04izcPehfFMvUd4Z0Tq9uMZS3V1F6pVqI6mE+3wIpw
	V1hlrQeSXLvhwR/WIaIUpwVjiAJSdKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSV/+U/KjsFDX5ZRIGFZMHLItdtNr8eTvVpZmDA0/4o=;
	b=s0G3rWF0muSOm6TFgP+WW4zHqgzpELhpTgaKon4KoImMNDAX9p0h/xbmPPxjX4hlnHllRI
	D+yVdt5vo1CDFvAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F002132C9;
	Sat,  7 Nov 2026 09:14:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V1wlHP7r7mqzZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 09:14:38 +0000
Date: Sat, 07 Nov 2026 10:14:38 +0100
Message-ID: <87a4nlypdt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
In-Reply-To: <20261107004338.323417-2-blum@kernel.org>
References: <20261107004338.323417-2-blum@kernel.org>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,suse.de,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 07 Nov 2026 01:43:37 +0100,
Thorsten Blum wrote:
> 
> While the current code works correctly, replace the unbounded sprintf()
> with snprintf() to bound the formatted string to the str buffer.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Shouldn't we use scnprintf() instead?  Otherwise it may lead to a
compiler warning.


thanks,

Takashi

> ---
>  sound/core/info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/info.c b/sound/core/info.c
> index 023b4736aa6d..b0ed66d0336d 100644
> --- a/sound/core/info.c
> +++ b/sound/core/info.c
> @@ -484,7 +484,7 @@ int snd_info_card_create(struct snd_card *card)
>  	if (snd_BUG_ON(!card))
>  		return -ENXIO;
>  
> -	sprintf(str, "card%i", card->number);
> +	snprintf(str, sizeof(str), "card%i", card->number);
>  	entry = create_subdir(card->module, str);
>  	if (!entry)
>  		return -ENOMEM;
