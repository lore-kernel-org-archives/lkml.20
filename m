Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492436;
	b=eeXJJY1sbMOqyCQalo4IP1jySJd/3IfqmrT7n5OEu9yxbVPt4lJwh99tOkP7Z4yk3wuz
	 SK5jcguuWbSZfgyA+9B/Q/ip9/m+N/STuCNnJpaekkd++avqXgpAsdGyRNr11+xDbLYyO
	 Y+kOB1x2KVPZXg1893PoiTGbLQN+7XA5ufMIm5VW57GY0T9i4i1sJtmhSCyv0rM2y15uR
	 pn2h3jB0uJN2Ieua6WcjeGdrHcGboAI1Vp3pi+3yENQGvctQLu8Pk5TfPEHG96VvmHZRq
	 Q2Hy70Fbm2V4EuwQqbzxpddDKfsosj9Wqpvd8bqNVTAYgPt3F6vslhTD51JrTrWv37A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492436;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=FYJDrRFwCUrUwn3Z1Ki9ra13LhNmNSsrJXAYnjDVh3w=;
	b=z9UMo47kpN0edAH4/dRH05XtBtGjgz6tFIyL7MzZyaCgWpor8SwdAFLyzzdoEHmPoKym
	 QenSpNzxwXIRA9kBdVj5T2yP9idBfapaiWNGvy/6uCIYsp2hrt6q1QH4IZRK49d2+AZ+M
	 Ob90186xf3EL6quDpb+njPcDRqLwuV/dNPOOer06wqg/l3sL6JuQ3hpKBBdb2O94LyMT4
	 jGkICgppT2YegvTHcNoQp5zqRR9mYLixYPD+r0lAippR0seJQA6A7Ch/CcLHr8Z7epElI
	 M/HeoSCs/Q5F4Jq9XZgEneYlsyGhQSlsqLtcakvDFAdzKcf5nNeP8unplTpYqWFbHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zUsZlzER;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uddQ8XR9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sAeQ3c3h;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6IRHJA+j;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C6606A319;
	Tue, 20 Oct 2026 10:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36C6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zUsZlzER;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uddQ8XR9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sAeQ3c3h;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6IRHJA+j
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6D7521DB7;
	Tue, 20 Oct 2026 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792492433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYJDrRFwCUrUwn3Z1Ki9ra13LhNmNSsrJXAYnjDVh3w=;
	b=zUsZlzERRRRUe8DI8ztPT7AUUgIhGPWoAq5CTkroSrln2QqoObq9DUXrxBf6mBzRtgMiDE
	/qKCGS7itIZcXDbpahiujtjjuOQV+LC6GiqlttAOhaUHwd3mJp/Cf/Mc3TRZcmbD2ycamU
	OfyWfV57Lxg3G51A/R2xwvtnUgwkfIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792492433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYJDrRFwCUrUwn3Z1Ki9ra13LhNmNSsrJXAYnjDVh3w=;
	b=uddQ8XR94yDhvHaTxM3fBY6TPW4ReIrVzdOEh9v0FKXWwET/BKVg5uLeYl1YVvHgG5qcsk
	OCn7x8CuQUZ1oHAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sAeQ3c3h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6IRHJA+j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792492432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYJDrRFwCUrUwn3Z1Ki9ra13LhNmNSsrJXAYnjDVh3w=;
	b=sAeQ3c3hc2SnlHSX2S2TmjGuyRD4mXolzyTa9xYIITz1PBnQfftrY8S7bgvNBgNYbG/l54
	wuL9/r2Jr2az87D1XsFypyvJ3o40+IqXnggoByCmgqOs/DQj2utaWnD3myu0LoScymXCsv
	8ziRcPnXcBztrPGCPQ20bg7WrwGXHk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792492432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYJDrRFwCUrUwn3Z1Ki9ra13LhNmNSsrJXAYnjDVh3w=;
	b=6IRHJA+jWi5Tlpg9w9gXjg+bqdKBQ+yYFqEtKRzKYWg2vluvgRT/b3b7PtRx1paaKw7+fT
	TdDOf8Qa0aUOXxCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45393136CC;
	Tue, 20 Oct 2026 10:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LQGlBpBD12qQRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 10:33:52 +0000
Date: Tue, 20 Oct 2026 12:33:51 +0200
Message-ID: <874iegiru8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: opl3: Stop delayed note-offs before freeing the channel set
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,sashiko.dev:url]
X-Spam-Level: 
X-Rspamd-Queue-Id: A6D7521DB7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, 19 Oct 2026 12:15:12 +0200,
Cen Zhang wrote:
> 
> An in-tree OPL3 device accepts FM instruments through its hwdep write
> interface. Loading a bank-127 instrument with nonzero fix_dur and sending
> a direct NOTEON without a subscription leaves the device in its initial
> SYNTH mode. snd_opl3_note_on() sets the note_off deadline, starts tlist
> at the next jiffy and stores the channel pointer in a voice.
> 
> Unbinding the OPL3 sequencer device can then free the port's channel set
> while the card-owned OPL3 object and its timer remain alive. Port removal
> drains event_input users, but the timer is independent. Without a
> subscription, no unuse callback runs to perform its timer cleanup:
> 
>   NOTEON / sequencer-device unbind      Delayed-note timer
>   -------------------------------      ------------------
>   snd_opl3_note_on()
>     lock(voice_lock)
>     set voice->note_off deadline
>     snd_opl3_start_timer()
>       mod_timer(tlist, jiffies + 1)
>     voice->note_off_check = 1
>     voice->chan = channel
>     unlock(voice_lock)
>   NOTEON returns
>   sysfs driver unbind
>     snd_opl3_seq_remove()
>       snd_seq_delete_kernel_client()
>         port_free(): drain input
>           snd_opl3_synth_free_port()
>             free opl3->chset
>                                        snd_opl3_timer_func()
>                                          lock(voice_lock)
>                                          note_off == jiffies
>                                          snd_opl3_note_off_unsafe()
>                                            read voice->chan->number
> 
> The timer can thus read a channel from the freed set. Shut it down
> synchronously before freeing chset, outside voice_lock and
> sys_timer_lock, which the callback needs. Shutdown also prevents a
> callback from rearming the timer during teardown. Clear the delayed-note
> flags under voice_lock so the timer reinitialization on rebind cannot
> revive old channel accesses.
> 
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> 
> ---
> 
> diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
> index b77d8e8f12fb9f90ac72b9209f4f59373eadf6f4..86bf2680a3b5e2ffee73b59a9056f93fb2bec891 100644
> --- a/sound/drivers/opl3/opl3_seq.c
> +++ b/sound/drivers/opl3/opl3_seq.c
> @@ -151,7 +151,14 @@ static int snd_opl3_synth_event_input(struct snd_seq_event * ev, int direct,
>  static void snd_opl3_synth_free_port(void *private_data)
>  {
>  	struct snd_opl3 *opl3 = private_data;
> +	int i;
>  
> +	timer_shutdown_sync(&opl3->tlist);
> +	/* Discard delayed notes before reusing the timer on rebind. */
> +	scoped_guard(spinlock_irqsave, &opl3->voice_lock) {
> +		for (i = 0; i < MAX_OPL3_VOICES; i++)
> +			opl3->voices[i].note_off_check = 0;
> +	}
>  	snd_midi_channel_free_set(opl3->chset);
>  }
>  

Some issues have been reported by Sashiko.  Could you check them?
  https://sashiko.dev/#/patchset/pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff%40gmail.com


thanks,

Takashi
