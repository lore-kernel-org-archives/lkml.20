Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCA361943;
	Sun, 13 Sep 2026 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789317590; cv=none; b=VQsksxaSP4wZ0LmsmEhVNfwZ6qq4SVj7dn+tMKudKcEDrlFnE42xKBy5nyr+5H+iT1RTgCaZRaz+/bK6YzE39zGuGJYi0LBK67LvgQTB2B/WJbAvvDycGCxBGU/R+hwaGoI79mI6vZXySxtz1fVwnIg4wIEjposyXW3IqLYQtRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789317590; c=relaxed/simple;
	bh=FR1Waodsnm9aJknU2HJdjpQhZog1vRX2KBydHZhnSUw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILx4K5M126mKLgiYZRf1jnajJ1DjHKWwHPS1qwbpMb1pwhMoG0cXpwxZ9mRsSxGWgUmQO9R0XIyp62eK5kVx9MnALGPUj+x1vi9DXT4S/M2zexJ2RvQzifJA7X1IbfaNEbmMSmcGDgtUiHhMM5CfAv6daG7N5nO6zFtv+0XcwNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Iehiso1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dxi+8bSu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DHXpRi/7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jkVV9+gz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Iehiso1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dxi+8bSu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DHXpRi/7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jkVV9+gz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C904521989;
	Sun, 13 Sep 2026 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789317577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6kxZ//zgJtAFpHMYh5PV6GT39Zi0cv4xJwQ6Sr6yXbY=;
	b=0Iehiso1KjBNSSbISlbQKyH11hRMbltkhSONzWG7RTAEOq7FU6II4g6GbJix7tiPur7lZ+
	bP5Hvb1VBZ/BL5B6j4+UxoVE0umiCPR9tJLpI4EZjvADXD6jGg9M2nUXimd/IUP2h2W5qw
	LvQ02YKDkanh8VQ5G4O3U/o97QBFkUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789317577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6kxZ//zgJtAFpHMYh5PV6GT39Zi0cv4xJwQ6Sr6yXbY=;
	b=dxi+8bSua13Nbiig0RRL4qqv4z1bv4JcIJSNBjq0tKGAK+xdVkii+5x+OwO7RhPjYXgVtc
	w1nBRxThHSV/26Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="DHXpRi/7";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jkVV9+gz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789317572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6kxZ//zgJtAFpHMYh5PV6GT39Zi0cv4xJwQ6Sr6yXbY=;
	b=DHXpRi/73+of98nFqnO+gBD62vr1EVET1dv9AhuEcKWOPOBNMKpiH6NMFQSFX53dusD+rS
	D6BJjPAAXb/kT21U06bWqlcWw3LAkJ5DfyadCjIud4HmLWyfDuxglZF6JNrhuVpoTDk6Mh
	bHmCE7eTmkRVnSHyOp6uKhOy93hGBOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789317572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6kxZ//zgJtAFpHMYh5PV6GT39Zi0cv4xJwQ6Sr6yXbY=;
	b=jkVV9+gztqbXB//VtBXPJWH3KhNhpL4cwmA3J82Dk/7zlFJMsfzq9VujWkSyKLmMWGTIwO
	tIY+j7QzNHxap/CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5576C1368C;
	Sun, 13 Sep 2026 16:39:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FvH4EsTRpmqZYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 13 Sep 2026 16:39:32 +0000
Date: Sun, 13 Sep 2026 18:39:31 +0200
Message-ID: <8733vdrtq4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+19da64013c46df87f971@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: pcm: set timer->private_data before registering the PCM timer
In-Reply-To: <20260913134446.114724-1-ngocthang2710.1999@gmail.com>
References: <20260913134446.114724-1-ngocthang2710.1999@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C904521989
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[19da64013c46df87f971];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Sun, 13 Sep 2026 15:44:46 +0200,
Nguyen Ngoc Thang wrote:
> 
> snd_pcm_timer_init() calls snd_device_register() to link the new
> struct snd_timer into the global timer list while it still carries
> hw.c_resolution = snd_pcm_timer_resolution (and hw.start/hw.stop),
> and only afterwards sets timer->private_data = substream.
> 
> Once the timer is on the list under register_mutex, a concurrent
> reader can already reach it through the same mutex and invoke these
> callbacks. /proc/asound/timers does this via c_resolution(), and
> snd_timer_open()+snd_timer_start() reach start()/stop() the same way.
> All three dereference timer->private_data, which for this brief
> window is NULL, giving a NULL-pointer dereference:
> 
>   substream = timer->private_data;
>   return substream->runtime ? ...   // substream is NULL
> 
> Move the private_data/private_free assignment before
> snd_device_register() so the timer is never visible on the list
> without its private_data set. On the snd_device_register() failure
> path, private_free() (snd_pcm_timer_free()) can now run, but it only
> does substream->timer = NULL, which is already NULL at that point
> since substream->timer is set to the new timer just once, after a
> successful registration -- so the failure path stays safe.
> 
> Reported-by: syzbot+19da64013c46df87f971@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=19da64013c46df87f971
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

Applied now.  Thanks.


Takashi
