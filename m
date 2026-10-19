Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433171;
	b=KDfnuvSCivLnfo7Fi9SIN1PsncVBRVDXpQa+Lm8wf5ujEYjKsJJz8mI0Ws8SvlOUXwtW
	 wvfHy4Hu0xvo+cMCvb5UYYKBkYpBv+mUuKES+h/izZ8zIOUPZ2M7WaIU0bWBwIAEcWRVV
	 Y+gmasMJWzi4oNqUDefaEg12tjdJrhdcaOM0Vs9rfIbiNX/zjuHexD15RWGbWBQHRPkZL
	 ZglcBPHkDNkPM1a9wb7K2WLoX0QHkOyczjI4vYt2NRMGtHJ6KyBL1OrGQoZmozZpv7D6n
	 GmCX3hlwGjZN6j1Z+2IEXAGvAmbX3ErVbEvcFt6+kr+G7WTbPE21pytQAfJBjDfzjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433171;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=gXIn7mOx8lQFJOZv6+aZd7tjcADd8riKeZnfoyKCLwo=;
	b=MJ/4g2Fz0B4Uvklqa8E3dS6b83RqbmEjcJ+DizFa++umstKVKzULlgtZVJjbjpzbXwfU
	 L2cxMVplWFU2mMAPDPb0hTMkfnHxvhSxR8sT1QFmXoh9NilFq7VnA7feaUoM1DXKefBtZ
	 PuTlZrTPyFD/DiVrle/3ri9H7gaDuMPNcJPTr0lXNM3GQgfeP211C9Gf+O4STGjAAbgwf
	 loY07bEqCUywx/FYS0fqEWweq5BdVKpjKTbT0WwtIw+V+gzhe9KsclxUa2b3qPECJ1Ko7
	 ILS1Mes7VHGRywb6B54+pn7ONYxkfnFa3lrupUkzRGz3IDmX+/c5ZLmM124B4x0zlBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HD1Xwkmr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MsGzkU8k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HD1Xwkmr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MsGzkU8k;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1089606A31B;
	Mon, 19 Oct 2026 18:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1089606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HD1Xwkmr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MsGzkU8k;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HD1Xwkmr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MsGzkU8k
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C5DD41F44E;
	Mon, 19 Oct 2026 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792433168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gXIn7mOx8lQFJOZv6+aZd7tjcADd8riKeZnfoyKCLwo=;
	b=HD1XwkmrquAw2Yja2WBdhZEnb0r4/aI1RzgJLDD9UOzkmVqNNc/IqmDySwlol1G7SNSHa0
	DTuQGspLyyCv3FkH1Is0mtDS+XDo+oK/WGVOD1sWERmb1rf6wDYx0QDLWdOJQqaKfmTzHI
	D7s9+IeZjpS1l56pnBO9FKcYhzA95yQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792433168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gXIn7mOx8lQFJOZv6+aZd7tjcADd8riKeZnfoyKCLwo=;
	b=MsGzkU8k/VYU8FQ8Z6QR5rTah/g9aogfHY9/7GyD6KVYNhIzzj+rs4b0HgP4w+8xvg6/c6
	YbFbSmsHU7HvHXAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HD1Xwkmr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MsGzkU8k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792433168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gXIn7mOx8lQFJOZv6+aZd7tjcADd8riKeZnfoyKCLwo=;
	b=HD1XwkmrquAw2Yja2WBdhZEnb0r4/aI1RzgJLDD9UOzkmVqNNc/IqmDySwlol1G7SNSHa0
	DTuQGspLyyCv3FkH1Is0mtDS+XDo+oK/WGVOD1sWERmb1rf6wDYx0QDLWdOJQqaKfmTzHI
	D7s9+IeZjpS1l56pnBO9FKcYhzA95yQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792433168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gXIn7mOx8lQFJOZv6+aZd7tjcADd8riKeZnfoyKCLwo=;
	b=MsGzkU8k/VYU8FQ8Z6QR5rTah/g9aogfHY9/7GyD6KVYNhIzzj+rs4b0HgP4w+8xvg6/c6
	YbFbSmsHU7HvHXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77878136CC;
	Mon, 19 Oct 2026 18:06:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ibkgFBBc1mrqTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 18:06:08 +0000
Date: Mon, 19 Oct 2026 20:06:08 +0200
Message-ID: <87tsmhimzz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: aloop: Keep the timer source alive until card release
In-Reply-To: <pm-pmb-71a33a26d68356e3ade7-v1-108d86919c5c92fe1ea8@gmail.com>
References: <pm-pmb-71a33a26d68356e3ade7-v1-108d86919c5c92fe1ea8@gmail.com>
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
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: C5DD41F44E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, 19 Oct 2026 11:06:13 +0200,
Cen Zhang wrote:
> 
> The timer_source string must remain valid while PCM opens can select
> and parse it. loopback_set_timer_source() allocates the string with
> parent-device devres, which can release it while the card is still
> registered.
> 
> A successful nonempty proc replacement after snd_card_register() adds
> the string allocation after trigger_card_free. Unbinding the platform
> device while snd_aloop remains loaded releases devres in reverse order.
> An open for an unused cable can run after the string is freed and before
> the card-free action disconnects the card:
> 
>   Device unbind                      PCM open
>   devres_release_all()
>     free replacement string
>                                      snd_pcm_open()
>                                        snd_card_file_add()
>                                        loopback_open()
>                                          loopback_snd_timer_open()
>                                            loopback_parse_timer_id()
>     trigger_card_free()
>       snd_card_free()
>         snd_card_disconnect()
> 
> The parser can then read freed memory. KASAN has reported a one-byte
> use-after-free read in strchr() from loopback_snd_timer_open(). The
> cable_lock mutex serializes explicit replacements with opens, but
> implicit devres release does not take it. The card and module references
> held by PCM open do not retain this separate devres allocation.
> 
> Use kstrdup() and release the current string from card->private_free.
> PCM admission already retains the card until each file is removed, and
> card disconnect drains proc callbacks before final card release. This
> keeps the string alive across admitted PCM opens and preserves the
> cable_lock serialization of replacements. Install the callback before
> the initial allocation so probe failures also release the string.
> 
> Fixes: b072e65aadd6 ("ALSA: aloop: Allocate resources with device-managed APIs")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

Applied now.  Thanks.


Takashi
