Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233313;
	b=3GZRohvBLuZ5ohcdvt0RCBTuGcgDATCBMHI07KFJUslk+y9Nke8HlNH0mWnr2h2XJihf
	 yJ+zrJcpx9oQeSo4Od9r4CItxLSlQsgUAR05Q8P0RlpImyo6+UbHFYPMX2VGFYeORH4o7
	 drQ9HhELL2f9jImVKpbq6/voqIh4JjkyQ4QyV9HsSCZLCdOXk91rMsrUUxOrvy+2iD/Gl
	 /lEBFnUNzN03Kq9MMNiWoppd8BL4zELhkVJ7O3desissm3jAG4UCQyU8evyNBVlooP74q
	 u0i9NqkTZ7M9BkS/9COgO/Akas438hj1fnR5efQ2D7g8zRQhR5ps6Z0Nrz7gfBpV0Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233313;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=bacdCYtnQUpZ1/0JMZdWgYStFT574V+jxaVY3ezPRZg=;
	b=oiBJenIBzRd536/TauBlXi9Xh4K6UidozFnAiugOke3abPl9B1pdKYVn3rQqKLId2RoQ
	 RtdIGF/JhTC05TfpvpT8TeqnJ1jcK64ymI5ow/K+ZSGRmX+EGVeqqv+wBFMZfu3NzVG+Z
	 ImvO1HT90gxMy295hwJNmPpB6uOszdnqtalxjkFYvg8Mzw6sD841eGyStA2laUkIRgn6p
	 aT+GvhxaqxVWH9tVOYiP4fyL3Wok5T14z/w8e6klTsIdcUyq0Iiq8rGIeoG0KyFaihv6c
	 7lzYeFBQ5woCeGXECinKRbeLbAZhZqFMK/IfA1wK1iJXA2zF9TrXjgFukzV0xOdYh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pZua0Jiz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GkfmUw18;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pZua0Jiz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GkfmUw18;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE5D606A339;
	Mon,  9 Nov 2026 14:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE5D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pZua0Jiz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GkfmUw18;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pZua0Jiz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GkfmUw18
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 005AC1F7BE;
	Mon,  9 Nov 2026 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794233311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bacdCYtnQUpZ1/0JMZdWgYStFT574V+jxaVY3ezPRZg=;
	b=pZua0JizBIbsoux05MFBXEw0dVYumxr5G+spF7QkUkLGNWE3c2Qs2P/7/tyhfMm9jcpyKv
	wyiNVnU8SRNGJuAiEAboMLLqyelECKmdmwxvMlGG/hi+NqU5c8Rym2q6FzvojUW6NQpSTx
	j/vYqic8mpRXWAaVYQCqQslSP5SVUnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794233311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bacdCYtnQUpZ1/0JMZdWgYStFT574V+jxaVY3ezPRZg=;
	b=GkfmUw18N7DcrfyARgy+IQqLlZ/P5omFsM7R9ASlmRFTYXdzUxeLCIdwjOsO1JxNP+ueWY
	DATNkpHpnbbfhgAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pZua0Jiz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GkfmUw18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794233311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bacdCYtnQUpZ1/0JMZdWgYStFT574V+jxaVY3ezPRZg=;
	b=pZua0JizBIbsoux05MFBXEw0dVYumxr5G+spF7QkUkLGNWE3c2Qs2P/7/tyhfMm9jcpyKv
	wyiNVnU8SRNGJuAiEAboMLLqyelECKmdmwxvMlGG/hi+NqU5c8Rym2q6FzvojUW6NQpSTx
	j/vYqic8mpRXWAaVYQCqQslSP5SVUnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794233311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bacdCYtnQUpZ1/0JMZdWgYStFT574V+jxaVY3ezPRZg=;
	b=GkfmUw18N7DcrfyARgy+IQqLlZ/P5omFsM7R9ASlmRFTYXdzUxeLCIdwjOsO1JxNP+ueWY
	DATNkpHpnbbfhgAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC5A513319;
	Mon,  9 Nov 2026 14:08:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q9G6It7T8WojVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Nov 2026 14:08:30 +0000
Date: Mon, 09 Nov 2026 15:08:30 +0100
Message-ID: <87se1aumg1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xinyu Wei <xinyuwei1024@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 0/2] ALSA: usb-audio: second configuration of the Steinberg UR22C
In-Reply-To: <20261108130303.387288-1-xinyuwei1024@gmail.com>
References: <20261108130303.387288-1-xinyuwei1024@gmail.com>
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 005AC1F7BE

On Sun, 08 Nov 2026 14:03:01 +0100,
Xinyu Wei wrote:
> 
> The Steinberg UR22C exposes two USB configurations: configuration 1 is
> class-compliant (2 playback / 4 capture channels), while configuration 2
> is UAC2 behind bInterfaceClass 0xFF (6 playback / 8 capture channels and
> two MIDI interfaces).  Selecting configuration 2 on a stock kernel leaves
> interfaces 0-2 unbound and registers no PCM.
> 
> Patch 1 adds a composite quirk entry for configuration 2's vendor-class
> interfaces.  Patch 2 fixes a bogus bmFormats (0xffffffff) in
> configuration 2's capture descriptor so opening capture as FLOAT_LE does
> not lock out playback via implicit feedback sync.
> 
> Xinyu Wei (2):
>   ALSA: usb-audio: name the interfaces of the Steinberg UR22C
>   ALSA: usb-audio: fix the format bits of the Steinberg UR22C

Applied both to for-next branch now.  Thanks.


Takashi
