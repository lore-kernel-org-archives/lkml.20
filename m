Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001801;
	b=G8z5X6WkPYON5HTDP990wPyuziTB9GoP02Fpba2krSUW2SejJsQfH/RrwQ0NfQojY4lq
	 SDLYZJNh2QKunIMMLsGGMDbMtATQmajDisnx7p0JIFbPIvCiUHPO5vcj4Bq6sAb8fBL3t
	 gwc4k4tWgfH99Katds68QcKxZh2nC3M2/C/xuj1xRgtmcNrIGCm5oxyFa+fnqWhANIJEU
	 8b3xKGRR9lRJvoeW8qMcDzImARbxvXLdSq6uVspQzXjR1ro6ZrrHRhlydq/30w8Dyg9Mi
	 so5oIxmXlpeqpFB+nyaANgn45KUVPKgyLEcmyVxGfYaEDvKoCJJuaioLVAi5dW7DdWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001801;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=08GxTs6QJ75ucw6ZNr+van8GqoMG6P/Nicxjpuzuefc=;
	b=K6B1s8orCCRSClYrtkiXloGumqjh8e1gsfskIMJnlT1otU6SMYVLj2oH013VCRU5mv4d
	 HTxMSdL4isJK+3N5uqeEyKL0JSgfY3LpW9KJf6hBcDBq+yxtf75do+fGCqN8+PPtfRUqk
	 +hY74r1GO2Qwh5AskXZaiapN3f0ZA9vyNOe+4CrjAarhBXxBtGQ/cK/ptkd31WcmSU0nW
	 2lhOKIW1R13PTAJH3fzqebd+kw4igP0zFrcKxn44BZIqR+1AxeO0B08MU8ezOv0VH6fUi
	 5wdeVLeawXBwuapBxo4S7W/GjsdXHjJ1E04KCfN3eP+e9VEDfbuz8tO5ZniBtk2CSBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rmzsycey;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xq749YGm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rmzsycey;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xq749YGm;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310D606A320;
	Mon, 26 Oct 2026 08:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A310D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rmzsycey;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xq749YGm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rmzsycey;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xq749YGm
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C53FF1F7B8;
	Mon, 26 Oct 2026 08:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08GxTs6QJ75ucw6ZNr+van8GqoMG6P/Nicxjpuzuefc=;
	b=RmzsyceyA0W8AZHBLQYawxaKBwLtjtTh05/Y1VTi2J0YNVzm1mtx+0/pBVcqw0Z7m6bdU7
	z/TVLf24F+q5AnX/CoroBfrL//fcvJqS5tGEkzppaDJvarXn92aXxUzjuwPwY1UTpB3+e3
	K2qFV2m/a2r7wYyOgchzoUI9LMcgOkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08GxTs6QJ75ucw6ZNr+van8GqoMG6P/Nicxjpuzuefc=;
	b=xq749YGmHSFXtREm8qNSHEVMul5DfEFZ5bVjIJ9uD5d22L3/S751F1ta8TV2a9c0jPOiIb
	tq7vmTmvlQigWQDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Rmzsycey;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xq749YGm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08GxTs6QJ75ucw6ZNr+van8GqoMG6P/Nicxjpuzuefc=;
	b=RmzsyceyA0W8AZHBLQYawxaKBwLtjtTh05/Y1VTi2J0YNVzm1mtx+0/pBVcqw0Z7m6bdU7
	z/TVLf24F+q5AnX/CoroBfrL//fcvJqS5tGEkzppaDJvarXn92aXxUzjuwPwY1UTpB3+e3
	K2qFV2m/a2r7wYyOgchzoUI9LMcgOkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08GxTs6QJ75ucw6ZNr+van8GqoMG6P/Nicxjpuzuefc=;
	b=xq749YGmHSFXtREm8qNSHEVMul5DfEFZ5bVjIJ9uD5d22L3/S751F1ta8TV2a9c0jPOiIb
	tq7vmTmvlQigWQDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D80313319;
	Mon, 26 Oct 2026 08:03:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UFdGFEYJ32odHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Oct 2026 08:03:18 +0000
Date: Mon, 26 Oct 2026 09:03:18 +0100
Message-ID: <87v76o6g8p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Denis Kulikov <dar1knessx@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Rate-limit URB submission error at stream start
In-Reply-To: <20261025231849.148149-1-dar1knessx@gmail.com>
References: <20261025231849.148149-1-dar1knessx@gmail.com>
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: C53FF1F7B8

On Mon, 26 Oct 2026 00:18:49 +0100,
Denis Kulikov wrote:
> 
> When two USB audio devices share a USB 2.0 hub (here a headset and a
> microphone), there may not be enough isochronous bandwidth to start the
> second stream, and usb_submit_urb() fails with -ENOSPC. PipeWire keeps
> retrying to start the stream every ~20 ms, and every attempt logs
> 
>   usb 2-1.1: cannot submit urb 0, error -28: not enough bandwidth
> 
> On my desktop this was printed up to 94 times per second and flooded
> the kernel log.
> 
> Use usb_audio_err_ratelimited() for this message, as commit
> 2db2be5607c4 ("ALSA: usb-audio: Rate limit usb_set_interface error
> reporting") already did for a neighbouring message in the same file.
> 
> Tested on that desktop (X79, Linux 7.3) with the headset and the
> microphone on one hub, starting playback and capture on both for 20
> seconds: the stock snd-usb-audio module printed the message 580 times,
> the patched one printed it 50 times and suppressed the rest.
> 
> Signed-off-by: Denis Kulikov <dar1knessx@gmail.com>

Applied now.  Thanks.


Takashi
