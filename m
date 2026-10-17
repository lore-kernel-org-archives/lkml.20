Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12353D25CE;
	Sat, 17 Oct 2026 08:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225087; cv=none; b=F0QcyF8qq5N7i05FuHlWuWsKMcHGJrfOYBCwfdULiAeN49izy12KNMPKVZICsvdIyLM9kigP1isl2cSTG9vI1ikwIo4YE8a5MPn6owZh3mN7DlFV4NEaWln3fdIrClpt3EFX5USJZ5kioSlSdwajX3GTwt9EOBv82Sr+8jrpTp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225087; c=relaxed/simple;
	bh=fDO88bCw05f1orcdtw27JYYOk5K6FQc56hz0ZnADHsM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6VSz8Rqp4lVFjxB0lQc7PW2d88k6aq0gqY//wUYNAZ4YjN8ACmo18lLT/s5zLJZCoBUBEmHaWolK2/KajsO3Y0gNWHFOLZNYtidFZ1+64xOnvSTYiY3X2tPWPo/4lfQSqo4pegYUcsYSWoa+7rpFQlaRRMRjvO7JsbAIb2THzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YiMIcieR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tnlt96Uv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YiMIcieR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tnlt96Uv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YiMIcieR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tnlt96Uv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YiMIcieR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tnlt96Uv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3011021CAD;
	Sat, 17 Oct 2026 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pbRdnhOpuKXJprJNiD3GkoBoU8ZU4pyz9/XYMISs6rU=;
	b=YiMIcieRUIzVRSqKXgl/nh+zOZ4OiSPIkEy04MV1njwSPapf894COfHsJMJJ9NRg+bTv7p
	Ii7WMu8nX6dWzX7zgaDaK03tv9dVMgVp3j0xq4hQ12Aj6sJ4VgeJw7SZmCdRgVkjQtpNER
	UGioPIsFvYAvRyoZjHreOq6ehtN9O0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pbRdnhOpuKXJprJNiD3GkoBoU8ZU4pyz9/XYMISs6rU=;
	b=tnlt96UvQOmSXunj7ApWp8TQR2j6NVDWr3mSSEV9GyVKCbwxuoeBxG1FMA4g+Cy+SV3hAY
	V1u4PuecrKeqAHBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YiMIcieR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tnlt96Uv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pbRdnhOpuKXJprJNiD3GkoBoU8ZU4pyz9/XYMISs6rU=;
	b=YiMIcieRUIzVRSqKXgl/nh+zOZ4OiSPIkEy04MV1njwSPapf894COfHsJMJJ9NRg+bTv7p
	Ii7WMu8nX6dWzX7zgaDaK03tv9dVMgVp3j0xq4hQ12Aj6sJ4VgeJw7SZmCdRgVkjQtpNER
	UGioPIsFvYAvRyoZjHreOq6ehtN9O0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pbRdnhOpuKXJprJNiD3GkoBoU8ZU4pyz9/XYMISs6rU=;
	b=tnlt96UvQOmSXunj7ApWp8TQR2j6NVDWr3mSSEV9GyVKCbwxuoeBxG1FMA4g+Cy+SV3hAY
	V1u4PuecrKeqAHBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A94CC133A7;
	Sat, 17 Oct 2026 08:18:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J/dAHzkv02qBHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Oct 2026 08:18:01 +0000
Date: Sat, 17 Oct 2026 10:18:01 +0200
Message-ID: <87pkx8211i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: seq: oss: Initialize the timer before publishing the port
In-Reply-To: <pm-pmb-1295c9b521e15b3753d6-v2-d2f1fcf0f038e0776f7c@gmail.com>
References: <pm-pmb-1295c9b521e15b3753d6-v2-d2f1fcf0f038e0776f7c@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3011021CAD
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 17 Oct 2026 09:01:49 +0200,
Cen Zhang wrote:
> 
> An OSS sequencer port must have an initialized timer before MIDI input
> can reach send_midi_event(). snd_seq_oss_open() publishes the callback
> port and assigns dp->readq before allocating dp->timer.
> 
> A client owning a MIDI port that another OSS session has opened for
> reading can submit a direct event to the new OSS port. Direct delivery
> does not require a subscription to the destination, and
> snd_seq_oss_midi_input() checks the source alias's readable-open bit
> without requiring that alias to belong to the destination session.
> For a read-capable /dev/sequencer open, this permits the following order:
> 
>   OSS open                         Direct MIDI input
>   create_port(dp)
>   dp->readq = ...
>                                    snd_seq_write() to the new port
>                                    snd_seq_oss_midi_input()
>                                    send_midi_event()
>                                      dp->timer->running
>   dp->timer = snd_seq_oss_timer_new(dp)
> 
> The callback dereferences a NULL timer in this interval. The OSS
> register_mutex does not cover event callbacks, and the destination
> port's use reference only protects the session's lifetime.
> 
> Initialize the timer before creating the callback port, so the existing
> port publication also publishes the initialized timer. The timer
> constructor does not need a queue or a port. Use free_devinfo() when no
> port was created to release the timer on failures.
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

This issue should have been covered by my recent fix:
  https://patch.msgid.link/20261016161930.482309-1-tiwai@suse.de


thanks,

Takashi
