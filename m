Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717385;
	b=0ksuEXUM8cxjSBxBswjTVZBqSwozrF8mYDZMndp8+GEUCFc1nM/HN7+OR8I0gHCTkXNv
	 ezBTQWxq5DMYP5hIBzDrewkLN9e2Y5gCi7dLWowyRwDJn0qnXMy8HzTEE2YhzewBSFkvX
	 xdJVV4Vo7dvrqYTHeKSrJpBFyVBAqgkythUNTCVw48YwBC6aC/eo+eIHzxkvNu55KbYVe
	 F6eqJpgoViwYBRLqbJJUBHnl6gsr5Zl3Anm44Jiz11uyoa6GEJnYbNEsr/WfbmA05bcQp
	 szEqfQ+HoT0aOccDCQiv9M1y0Vj/e5C+UMIdhgu1Yky6f3rAHB8zFdiLaRB7bgpIwBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717385;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=hnY0hiNXYP1RpvRjHx/f25QO+Lf5qDmxzoSNgMRKLL0=;
	b=utKR4I8XEkUnPZJiJphLet+6w5TIsDvQc0xuD3f9CDOhocLsUbvefip4psBorQg9zTHQ
	 4Sk+uZ7PTo74oipnYVuDJsZW5pD57W3By1vxLRpM0M78Mjzmm/hbfEyf4ikGBO9ebmviM
	 FqWnhxVDAov/CDASgRfxZLj+vN27UVsZKRz6UuuOlTqd0oZbEjxYw1xSFd3cHZymDlrG4
	 4oYgHrc/gmDbkfGGK7WJjh2jk8RuglJsNLys5tepYGHE3FTGJ8XVRo0nvChC0n+h8XZSb
	 xDQwA3RIxdrzmyZDHKT4n4DpF09/dg4bHp/ycf9+nBu6Vh4H1Ghtg0Yve6wbqc8nTZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YVGs+cHR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4585Kcrk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1i8IEp2S;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2UUtNLJI;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5E606D83D;
	Tue,  3 Nov 2026 14:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B5E606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YVGs+cHR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4585Kcrk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1i8IEp2S;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2UUtNLJI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23D432225C;
	Tue,  3 Nov 2026 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnY0hiNXYP1RpvRjHx/f25QO+Lf5qDmxzoSNgMRKLL0=;
	b=YVGs+cHRQ1IjB4Pwm0AmnrJKF0+BkGwTrBnW92HFKGzRT5MzwM2QSq/qOPswGUVJ+C5/H3
	hILL/1oMLYp26X3VeQpAwCtJom8pZFzINqgkCM/ZtP9MMn78m45EIN70is3a2MjBr97rzU
	dlE6hb7zArySRuc/ktMz7tGMQ3WyRHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnY0hiNXYP1RpvRjHx/f25QO+Lf5qDmxzoSNgMRKLL0=;
	b=4585KcrkM2QPf2iCd2DE0baYD5Hn0f/L/8/xyrg4UESdzGXEBDPJpbCh0mcjyJeGlj4f3c
	ARvHPbZhi09KbQDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1i8IEp2S;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2UUtNLJI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnY0hiNXYP1RpvRjHx/f25QO+Lf5qDmxzoSNgMRKLL0=;
	b=1i8IEp2SFk+Q2bgmBqTj4Tnp6qDJKvY5BzkB95JrQVgFAAiQ4uP1SijiMbV0eF/Ldsu5t6
	j7n55UuEb+E/jPn5qjg6rvipCuph2BGVYuBVLqVRdlIVbjIjSotEqiduGk3KoUyjwSNcU+
	lQeI8lMJILZs5EoZ5IvZa2G8EqMOl+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnY0hiNXYP1RpvRjHx/f25QO+Lf5qDmxzoSNgMRKLL0=;
	b=2UUtNLJIaVCEFXMGRyZvVvaHxt16P1GApx9kyXDLWKpv6VRDS3RtyJSbBHKmxegM4UMlcR
	Htg+/TGgE59RbKDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0BA11350A;
	Tue,  3 Nov 2026 14:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3lQ+LYX06WqLFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 14:49:41 +0000
Date: Tue, 03 Nov 2026 15:49:41 +0100
Message-ID: <87wlquvuka.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Razvan Dinculescu <razvandinculescu@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs
In-Reply-To: <20261102190417.2661176-1-razvandinculescu@gmail.com>
References: <20261102190417.2661176-1-razvandinculescu@gmail.com>
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
X-Rspamd-Queue-Id: 23D432225C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Mon, 02 Nov 2026 20:04:17 +0100,
Razvan Dinculescu wrote:
> 
> All pins of the NVIDIA HDMI/DP codecs share one connection list, so a
> converter can be selected by several pins at once. Unlike the Intel
> codecs (intel_not_share_assigned_cvt()), the NVIDIA ones never move an
> idle pin off the converter that another pin streams on, and the display
> that should play stays silent.
> 
> Seen on an RTX 5090 (codec 0x10de00aa) with a DP monitor on pin 0x04
> and an HDMI TV on pin 0x05. PipeWire probes every PCM at start-up: the
> monitor's PCM got converter 0x08 and kept it selected after closing,
> then the TV's PCM got 0x08 as well when it was opened. With both pins
> on 0x08 the TV played nothing, although its PCM was running and its
> ELD was valid. Opening the monitor's PCM while the TV's was running
> moved the monitor to 0x09 and the TV played at once. Restarting
> PipeWire put both pins back on 0x08.
> 
> Implement pin_cvt_fixup for the generic NVIDIA model as Intel does:
> restore the pin's own converter selection, which
> snd_hda_hdmi_generic_pcm_prepare() relies on after the hardware drops
> it, then move every other connected pin that selects the assigned
> converter to an unassigned one. Look the converter up in each pin's
> own connection list instead of assuming the same order on every pin.
> 
> Tested on that system with the TV's PCM on 0x08 and the monitor's on
> 0x09, both pins then forced onto 0x08 with hda-verb: a prepare on the
> TV's PCM moved the monitor off 0x08, and a prepare on the monitor's
> PCM put it back on 0x09.
> 
> Signed-off-by: Razvan Dinculescu <razvandinculescu@gmail.com>

Applied now.  Thanks.


Takashi
