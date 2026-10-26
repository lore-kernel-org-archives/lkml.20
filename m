Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003965;
	b=CrsNskHl+rwg6KJlqEYxEz941D9d8/TvzHAiKY/DMvBvqrkTTYNvg1QLb+F+AHJZy1tL
	 WcXf/0qmVeTYmPpbvvk2VFmonmzZzGoWYVH8jNg3EjYN/Dzkji6XUrkkJyN1YDUE3caWr
	 9iEJ6lUHR/ZKM7Px1Dy3wtiyQ54eYC8k1kECjzrMURk7nAHvtvLkNGVKQjULq/EsWpQ5g
	 0ICSTk5oyOrYKmM4tqzTQSFV3WtZf13wk/ZxXF1p7/Gmnjpv/6YYvF8GU68pmfW1XfBGu
	 qVZ65o+xtAtpnRkixQv25VlfJYhh5vOCwzNMFi5yHY/BtSAM6j34RC0CYg+2W+STHFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003965;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=0TZbHuh80Bj5m3x/gNTKudugZ7ai4sfUOWmlpeiDhg8=;
	b=H990QWLOjJsHrWddOLCHN6m30mJbCnjcDiKfU9NFNOBs494cDYBrKezLqR1SBid5ieON
	 wakZ5fIV1GUMA0dUPpz5TpCWU5dP43XpSXbjIrh8/54VF7OKKOUkZqcw5YX/bo9T3GFJI
	 tl09ccIusWj8M9Ejr3svuG7+HVfS+AbZ4S63iaAtRoWz6SlfHnY9fs6qQE2UH05X1aHc0
	 C8/aVlcKchCpRQZHMGHfGdZneWw60yqnoClBKjIFqdA97yp7+eYc0CMWc88z5lYXVP9dM
	 KQWQ0fuQdzYhp8cDjTxY9b/c7ns53lCy+95HFr4v80zimTP6J6MoMdYMq9hpWx5I66w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TSHzDaJn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qP1fjrcU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TSHzDaJn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qP1fjrcU;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067D1606A31A;
	Mon, 26 Oct 2026 08:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 067D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TSHzDaJn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qP1fjrcU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TSHzDaJn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qP1fjrcU
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 62AE81F7B9;
	Mon, 26 Oct 2026 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793003962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TZbHuh80Bj5m3x/gNTKudugZ7ai4sfUOWmlpeiDhg8=;
	b=TSHzDaJnWFeEN405zcnodmSkaxpq9pMSBWN7lDMbj6qBCXR1K67cHRj0tt+jz7GgQG2+Rt
	esg8kB0EMC0lUO/+guHDmW6tf+ISe7IZy5P41f3jmOIFYEbkYMcro9cjAli3yn3XJDmnUF
	LcCPv3aF3qmSMDWnSWfDoADZ7WUUwRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793003962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TZbHuh80Bj5m3x/gNTKudugZ7ai4sfUOWmlpeiDhg8=;
	b=qP1fjrcUhZE5dDQvqaxpppOcNkr0SZ0NLZsIjEx2b8Fs6e0rOoSO5Q7WR1fcYFhjuICzXE
	WNrsWacfQqOHOfDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TSHzDaJn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qP1fjrcU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793003962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TZbHuh80Bj5m3x/gNTKudugZ7ai4sfUOWmlpeiDhg8=;
	b=TSHzDaJnWFeEN405zcnodmSkaxpq9pMSBWN7lDMbj6qBCXR1K67cHRj0tt+jz7GgQG2+Rt
	esg8kB0EMC0lUO/+guHDmW6tf+ISe7IZy5P41f3jmOIFYEbkYMcro9cjAli3yn3XJDmnUF
	LcCPv3aF3qmSMDWnSWfDoADZ7WUUwRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793003962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TZbHuh80Bj5m3x/gNTKudugZ7ai4sfUOWmlpeiDhg8=;
	b=qP1fjrcUhZE5dDQvqaxpppOcNkr0SZ0NLZsIjEx2b8Fs6e0rOoSO5Q7WR1fcYFhjuICzXE
	WNrsWacfQqOHOfDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7B5613319;
	Mon, 26 Oct 2026 08:39:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9O9kHbkR32pdQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Oct 2026 08:39:21 +0000
Date: Mon, 26 Oct 2026 09:39:21 +0100
Message-ID: <87o6cg6ekm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v2 0/3] ALSA: pcm: Retain components across codec teardown
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,suse.de,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 62AE81F7B9

On Sat, 24 Oct 2026 13:41:13 +0200,
Cen Zhang wrote:
> 
> A pending PCM opener can retain the card without retaining a PCM removed
> by codec-only unbind. A late codec probe can also publish PCM devices
> before a subsequent registration failure starts cleanup.
> 
> Retain native and OSS PCM lookups through file release, close admission
> at component disconnect, and drain codec users before probe-error cleanup.
> Keep the existing proc rundown outside open_mutex at disconnect, and wait
> for PCM references in final cleanup after the lookup gate is closed.
> 
> ---
> Cen Zhang (3):
>   ALSA: pcm: Retain components across native minor lookups
>   ALSA: pcm: oss: Retain the PCM from minor lookup through release
>   ALSA: hda: Drain PCM users before cleaning up a failed codec probe

I guess fixing in lower layer would become a whack-a-mole game.

My current thought is to rather plug on the upper layer, that is:

- Serialize concurrent probe and remove calls for the same HD-audio
  bus

- At remove, synchronize the all opened fds on the card; you can check
  list_empty(&card->files_list) and notify from snd_card_file_remove()
  call.

The proc files are removed and synced at disconnection, so the above
should cover most of corner cases, I suppose.


thanks,

Takashi
