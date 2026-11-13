Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556653;
	b=r5ms/h51xK3v/wVY4EbHE3q3kwOlZ10yWNSog+rWhTWb2t/zlx+5gOLbSNFQ1EmZG1pU
	 B2kkVLl4DRcG9qVgi+IGgdfdqlKLb0c+hY1HUEmM6DdPBSHTyh2yRGngj2JqptJ8O5UhU
	 +xgQf6rT6CRWqG1PT5GSg7Bq16ArtEc2T7+4QzmNE5m/Dw0bBvpaOuTYg44WzxLN4LeuW
	 kSHTMBxPfpLBezI4nDQW4vV7KiP1uwywLv/HCCDFR5Twj/126IsngQn0LxoT9QQkxClDL
	 sD19GOejIY6bXhHotjNj7BUD+Pq+ZRYfso/cHAcLz0JZkhdUqBwPO6ZmPKxDoISlrZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556653;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=Sx8ltdFkWctbDT9gDtOPq/DsHmoCo1o5oSvWbEHEzMA=;
	b=HxpfyrtCNcfPHEcJGcHVBEoMV1K60WrVlpbUZCn6umR5p/rONLVRFyR8MYT/GvLWbLIc
	 2fW3qne7nfEa1G7EviPQut6eARVZWPep4HzXm50C6Kr1RYI2OR/dGHbg/vyA1gv6xICI3
	 2kydKEozRqbzqJUMS3wBgbeFUqLEpAUr2aLwIxQU+lU5wvpD3VATToSPJxrflrio4Z0XP
	 9lHEuy8OSTiFvMDILfab+9qi8k8N4Tz5kcRao25wS0tNcgoDRKm5UZxKs8jdXJMXbDrvR
	 iNJSiau76e9ayuDrNXABVxfGzR+vprSJ0rY9T3JSUsVWDK5p7eEESgbNc2amPsdAEJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kKLR479U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hGtIUQUL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DoR2jWDV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W74oxlA5;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE762606A323;
	Fri, 13 Nov 2026 07:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE762606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kKLR479U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hGtIUQUL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DoR2jWDV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W74oxlA5
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E987922011;
	Fri, 13 Nov 2026 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794556651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sx8ltdFkWctbDT9gDtOPq/DsHmoCo1o5oSvWbEHEzMA=;
	b=kKLR479UmNZnjU2iIUiW3opu92ZcS60oVVUcpNcyODwq8d78AMyqWoH9Ok/ye6i2a7H9MA
	Dp3uY0aNzl9zNWO7eer7q6x+W5W46b4yNAPGzKkAxSd3cl5IaDQNucLw1EOv87LQTznxGQ
	d/NI6AN4Tec65yfOe+7lJvmf6zecDJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794556651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sx8ltdFkWctbDT9gDtOPq/DsHmoCo1o5oSvWbEHEzMA=;
	b=hGtIUQULh3EDfhsFYJ0P5hDudMFSzgpqqH6XyTOU+Qgcukv2Uk+3blePI2juGF+tQBdm8a
	tKnyt+ASznJrGOAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794556650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sx8ltdFkWctbDT9gDtOPq/DsHmoCo1o5oSvWbEHEzMA=;
	b=DoR2jWDVaom8rTwkklZpEE08HcaFLqUFx8T5aJZSdzUobEdiu6JpdlEm2VooCevsA5SzOH
	+cBcqBCQQmjna+qDXn0gWQAwdrFbZ5J5RtqBmzqusNAeitscK4evHwMHsnVwUSOydtJoW7
	cvMepn0vgwjF5nf+sGIn6bmuJkykJwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794556650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sx8ltdFkWctbDT9gDtOPq/DsHmoCo1o5oSvWbEHEzMA=;
	b=W74oxlA5BRcsgDABYVg7CMs9p5A+F6OfVmdwXIOZPFPoaluB1LSN7RsIc6SWU77x2WrKOn
	v0zv3KHxXeB3LZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D2F31344A;
	Fri, 13 Nov 2026 07:57:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CsW0HOrC9mqwYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Nov 2026 07:57:30 +0000
Date: Fri, 13 Nov 2026 08:57:30 +0100
Message-ID: <87a4ndqi39.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jude Gyimah <jude.gyimah87@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aw2-alsa: select SND_PCM
In-Reply-To: <20261113064614.15045-1-jude.gyimah87@gmail.com>
References: <20261113064614.15045-1-jude.gyimah87@gmail.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 13 Nov 2026 07:46:14 +0100,
Jude Gyimah wrote:
> 
> Several stanzas in sound/pci/Kconfig select SND_PCM.
> SND_AW2 selects nothing at all.
> 
> aw2-alsa calls snd_pcm_new, which sound/core/pcm.c provides under SND_PCM.
> 
>   aw2-alsa.c:(.text+0x554): undefined reference to `snd_pcm_new'
> 
> 4 symbols are undefined in all.
> 
> The driver can be built into vmlinux while SND_PCM is a module, in which
> case the symbols are not there at link time.
> 
> Select rather than depend on: SND_PCM has no prompt of its own and is only
> ever enabled by a select, so a depends on would leave SND_AW2
> unselectable.
> 
> Reproduced on v7.3, arm64, with CONFIG_SND_AW2=y and CONFIG_SND_PCM=m.
> 
> Found with kreach, a static check that compares what Kconfig allows
> against the symbols the compiled objects actually reference.
> 
> Fixes: 98f2a97f207a ("[ALSA] Emagic Audiowerk 2 ALSA driver.")
> Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>

Applied now.  It's interesting why this wasn't caught by build tests
for long time...


thanks,

Takashi
