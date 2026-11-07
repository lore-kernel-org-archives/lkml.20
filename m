Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059956;
	b=io3Dne3MXZRkKNZXHMN+eSfV0R0zhhg6SB7dbSMT0qyU2jM75Oba0a/RSo4QsZ1dx2tj
	 Kiq6McuRGnfSG1PY4lhjU09av57BDmyEKOPq8i1ZY9UK28To6FIL9K2ph8op1MBhORw8b
	 6YTpAVIkSPBEjjlcVoq9N1QdKXUvZ2jU7Ydqz7AB95tNLYoQWacJk+LzxVWbGK1wsNPM9
	 y3aYV4CkKVPxmcxM9A+QhenBhgQ6l5mzGgrJGeaKL3y3s5I8/+YkOWJ7SZ7LingUeQpWC
	 NsAll1+PCFRcR9g4pnJAUCHjXTv0lJ0j6asY3gkcWS9ql1/NGNKJH1bTMpslzM7X5wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059956;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=B/P9PptDjKw7R7Z87m2CRyLisWnCULsW73IEfQr17vI=;
	b=dpSXdxhf/7yCA+vDmNcH5IvUZr3rLrP99WSXRPmApmASBRHp+DMtz9On3iS+ollY2+Kj
	 M1le7C5WQsQ6szVp/Y2R3Ca2exIVcI5a4eFVgjXs0vK0xtQrLc4YE/uAZ6jKS5qDr8kJW
	 HIR7M2KXeTNns1QHdQBPBEAJiKvnjKJkWgbUN91vq1rillvguOGEdClwJBrj/xPubndR1
	 Rt4MyrzFodJjOtoV3vniUm0W7EMvg4x5iaTrg2A4RW5vV+m2q86YRLZHhJ5K+6gk3A6xw
	 dHcOkd8jFlwFwwYkcHSkPeJTcviLVpLusRiZ6mkqNsDa8KPlTJIVxmb2xc22vp4K75g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8w+cRRm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yCITR+tN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8w+cRRm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yCITR+tN;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB8606A32C;
	Sat,  7 Nov 2026 13:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EECB8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8w+cRRm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yCITR+tN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8w+cRRm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yCITR+tN
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 018E121DB5;
	Sat,  7 Nov 2026 13:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794059954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/P9PptDjKw7R7Z87m2CRyLisWnCULsW73IEfQr17vI=;
	b=y8w+cRRms67or7hHKu8Lj9AU6PdL4rAg3ZkN6nx/XUIVrLFf/HGV69opTklkn0NjhJqFMi
	+nEYIlhOplf1CVwDA2+wCpMVmEckr9tMm2Agy2xwTesLHdTUB2HWHOUtfqxP/b+gus9wKN
	6PgjIcadNjlhu7EGjuQCXGREycpxyKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794059954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/P9PptDjKw7R7Z87m2CRyLisWnCULsW73IEfQr17vI=;
	b=yCITR+tNkVQ6rDcMEjjCAYJe6I1umJ+e4OqkyGj86svNHSzjWrGlP2bYF7DGjWGGZY1iwD
	PVEJXbo7y6Wk29CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794059954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/P9PptDjKw7R7Z87m2CRyLisWnCULsW73IEfQr17vI=;
	b=y8w+cRRms67or7hHKu8Lj9AU6PdL4rAg3ZkN6nx/XUIVrLFf/HGV69opTklkn0NjhJqFMi
	+nEYIlhOplf1CVwDA2+wCpMVmEckr9tMm2Agy2xwTesLHdTUB2HWHOUtfqxP/b+gus9wKN
	6PgjIcadNjlhu7EGjuQCXGREycpxyKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794059954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/P9PptDjKw7R7Z87m2CRyLisWnCULsW73IEfQr17vI=;
	b=yCITR+tNkVQ6rDcMEjjCAYJe6I1umJ+e4OqkyGj86svNHSzjWrGlP2bYF7DGjWGGZY1iwD
	PVEJXbo7y6Wk29CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA8CC133F1;
	Sat,  7 Nov 2026 13:59:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UPFKILEu72oqAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 13:59:13 +0000
Date: Sat, 07 Nov 2026 14:59:13 +0100
Message-ID: <87mrrkyc7i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
In-Reply-To: <20261107121235.3521-1-sreekuttan2156239@gmail.com>
References: <87eccxyplk.wl-tiwai@suse.de>
	<20261107121235.3521-1-sreekuttan2156239@gmail.com>
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
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 07 Nov 2026 13:12:35 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> I would like to kindly follow up on my first patch.
> 
> Could you please let me know if you have had a chance to review it?
> 
> For reference, here is the patch link:
> https://lore.kernel.org/all/20261106162357.3616-1-sreekuttan2156239@gmail.com/

I'm still considering what's the best way.

Your patch replaces and adds some open-code, which isn't nice.
OTOH, it's a small change, so it's acceptable.

An alternative would be to use simple_strtoul() that can return the
end pointer.  Or, we may reorganize the whole code a bit, so that to
get the delimiter at first (instead of the head of the next word),
then clear and parse.  But not sure whether it'd be worth.


Takashi
