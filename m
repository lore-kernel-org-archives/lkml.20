Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969610;
	b=N+m7ZubZ8F1LRdefavOZEvzqGAtCMZfgUmG1ovqtp2XJzy602IJEI3UUURKiUIKehqch
	 Jy5kab/SwvKJwlBBIY9Du02nkiF811MxFBFeniHJzqiarW5ltNX7z3u/nAIXt0Zofcoou
	 RCy3VfotoUoLC+7HkIhT9ThS7lYFUDod965++qjYWmIdh8D8iOlo8RKvITI78bOtaV5LG
	 0X2f+TXMw+Hb7WPdz4RQbB/k68LJPx5u2DJtnlWOR3d3BAMOLILrQhN+Tusp0DZJPNt2D
	 KEnLV4ANDci3C2E7x8dCiWwctqHOA1B6xpti99wz80HGZtluTnmCSaY2Ztqu7Xx1KLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969610;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=WeeiiLxgI9wqxSiWZdfjy2k0QNgDJEt42uFprQoiODo=;
	b=R7zdJxtgDKPcszKX5UJ3DzToTuuU29gQ2McbMImreDb1j/fL2KK07nC9AawtRZXGvNfl
	 gP0V/hWSpP4gD0ug46wWtQexsy7G5tpcue6p/pfyM3WtsG3l55zpX7rziEtk4ZBH3GoIv
	 nDl3ySTa7kJu5ODpBXv/5jm21pN/j0a0nVVpG1YIeL3lZrRoWo56kgg3SLwEeif7+0X4r
	 VST/tCEPzKXeaXkRfOne1oSyQz7P3VsDIEDrl6hsSxPhE0qCARTCT6HBaQ+tAcZv4N5aC
	 Sa9Mjh02/UIvyV455BFcFzbKemmMOO/JZoMXljq32fW8nQgrabYQUgkH0kXPl+zOSzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cgspkxMt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JUCsSYZV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cgspkxMt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JUCsSYZV;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0E606A326;
	Fri,  6 Nov 2026 12:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cgspkxMt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JUCsSYZV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cgspkxMt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JUCsSYZV
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B05791F7B6;
	Fri,  6 Nov 2026 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793969607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeeiiLxgI9wqxSiWZdfjy2k0QNgDJEt42uFprQoiODo=;
	b=cgspkxMtr84onlBYXfV5vpo48jz/D5JJ7KrfiCnMFUJM3+6uFjDLdgZ4J6YBKwocXmsDhH
	L5nBXqzVMVllFdkSNGr4NeC1MgOmfY8EGcaK0qumNm6F+P1kfMF5Zs5fXLCFFKhuD35GGc
	LwpoZ3Xk4F84bKPrmmAg0Qqy0aYT7qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793969607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeeiiLxgI9wqxSiWZdfjy2k0QNgDJEt42uFprQoiODo=;
	b=JUCsSYZVeMZOe9nGdM9B5FmuN8qa//UA5h3PzSyCrYrg6qNkU26sZbDER+VVn5X33yyHnW
	/NK6m/e0P8Eik4Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793969607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeeiiLxgI9wqxSiWZdfjy2k0QNgDJEt42uFprQoiODo=;
	b=cgspkxMtr84onlBYXfV5vpo48jz/D5JJ7KrfiCnMFUJM3+6uFjDLdgZ4J6YBKwocXmsDhH
	L5nBXqzVMVllFdkSNGr4NeC1MgOmfY8EGcaK0qumNm6F+P1kfMF5Zs5fXLCFFKhuD35GGc
	LwpoZ3Xk4F84bKPrmmAg0Qqy0aYT7qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793969607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeeiiLxgI9wqxSiWZdfjy2k0QNgDJEt42uFprQoiODo=;
	b=JUCsSYZVeMZOe9nGdM9B5FmuN8qa//UA5h3PzSyCrYrg6qNkU26sZbDER+VVn5X33yyHnW
	/NK6m/e0P8Eik4Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62471132C9;
	Fri,  6 Nov 2026 12:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1faYDcfN7WqzDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Nov 2026 12:53:27 +0000
Date: Fri, 06 Nov 2026 13:53:26 +0100
Message-ID: <87qzgyp1dl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: linear: Check frame count for all channels
In-Reply-To: <20261106123750.2981-1-sreekuttan2156239@gmail.com>
References: <8733tfs4cg.wl-tiwai@suse.de>
	<20261106123750.2981-1-sreekuttan2156239@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 06 Nov 2026 13:37:50 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> Thanks for reviewing.
> 
> I added this check because I thought the available frame count could potentially 
> differ between channels, similar to how the alignment is checked separately for 
> each channel under CONFIG_SND_DEBUG.

Those alignment checks are with snd_BUG_ON(), so it'll give kernel
warning with stack trace, i.e. the code shouldn't be triggered.
I believe the checks are superfluous, but it's a sanity check for
debugging, after all.

> I understand that the ALSA plugin framework normally keeps the processed frame count 
> identical across all channels.
> 
> Is there any condition or exceptional case where the available frame count could differ 
> between channels? Or is it guaranteed to be identical by the plugin framework?

The frame count must be identical.  So, if any, such a check should be
conditionally enabled and trigger a kernel WARNING.  It means, if it
happens, something must be completely wrong.


thanks,

Takashi

> If it is guaranteed, I agree that this additional check is unnecessary.
> 
> Thanks for your guidance.
> 
> Best regards,
> Sreeraj
