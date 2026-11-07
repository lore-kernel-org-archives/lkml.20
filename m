Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042692;
	b=LxCTQQ/ZOmCi5jChIDVWyBsy6ZzdubrFB83atinhI2roUcN1iEK253nVi+zj1+i9SBBu
	 pNhSnOGg+0fcYDunjDyOE3w3/scBS3duqXd36FLUOGg14eIevptL2z683SKaBAHvlgiGz
	 dVoyBE+1knDZqYXm4ivbPryb1vCq+Jxolj9BeKRXEJa6FZpbxkLGQOh/ENb4O4j/gozm3
	 IQ2K82dSGR5hrLbztdR7MhJPNVFS29FK/c74R1Y1fEiuF7wlyqQVxIY1vGn9o0fYaN315
	 8uhAD/iRPrDObsuxuxnlNQzHPIVCYzLmTKM5KG9jBjtflNsyNlv+0+uaxNX5xxgGKeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042692;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=MeEH9YedT5rZOpolu00I7TXvsMkj9ue4IGkxWd5hSNI=;
	b=mYvKa8iDZLPQfwnd9reOWo+CIJRLmlrYdym5PBr6+OTE/z7Ape3biB6bF2Y8rYZkrLl6
	 Ly34xBCWKLmrPbkd3pIHHnQVp6e1j0lefiDH3ooudkQzcdYueDJqX2YhYQACzOhH4PP8B
	 g3MLjqRyb2/zToF2ezeKEjzK52yoTTXYoXjNP31jd6GzAgSmN7OUtL5MA8SqTSyDxVcEN
	 1FiQ9L18tIsUAN5HBNEAm9C0m63fcmdKopq465RVf2IxOQ+pNpgheCHCAsx55jNDP4EHi
	 OYClQc1FEa3ujDSzERK8V8y1iknMVxCJY10FsBTySyakRSfZbl7drUU9s3KIkEcPCkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Cr8CkB4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CS+UJimn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Cr8CkB4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CS+UJimn;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC8606A326;
	Sat,  7 Nov 2026 09:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FC8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Cr8CkB4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CS+UJimn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Cr8CkB4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CS+UJimn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 498511F7A0;
	Sat,  7 Nov 2026 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MeEH9YedT5rZOpolu00I7TXvsMkj9ue4IGkxWd5hSNI=;
	b=0Cr8CkB4xrUQJC2c2POMF/AkL5zKAXhIkyScEwzOlbcIEiGnPF/CwLo+S9stvfaowNoGER
	CmIhQzP5y166V6Wwscz3/6xpHWz8UxSwofWED/N0F5EyhT7x9SpkROHzDAbNRwdQu62C+1
	hA1tC/+OTJ+uLjLlfx9Qx7QmzX9e8rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MeEH9YedT5rZOpolu00I7TXvsMkj9ue4IGkxWd5hSNI=;
	b=CS+UJimn/RSCRQhxgf3pIXY/lPTvbIlAtIyDRDO7sQ+RJZNZOopGvwr96He1Wu3z6EvTAu
	xVU55xwwFaDkBLDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MeEH9YedT5rZOpolu00I7TXvsMkj9ue4IGkxWd5hSNI=;
	b=0Cr8CkB4xrUQJC2c2POMF/AkL5zKAXhIkyScEwzOlbcIEiGnPF/CwLo+S9stvfaowNoGER
	CmIhQzP5y166V6Wwscz3/6xpHWz8UxSwofWED/N0F5EyhT7x9SpkROHzDAbNRwdQu62C+1
	hA1tC/+OTJ+uLjLlfx9Qx7QmzX9e8rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MeEH9YedT5rZOpolu00I7TXvsMkj9ue4IGkxWd5hSNI=;
	b=CS+UJimn/RSCRQhxgf3pIXY/lPTvbIlAtIyDRDO7sQ+RJZNZOopGvwr96He1Wu3z6EvTAu
	xVU55xwwFaDkBLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01791132C9;
	Sat,  7 Nov 2026 09:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zOpYMkHr7mrDYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 09:11:29 +0000
Date: Sat, 07 Nov 2026 10:11:29 +0100
Message-ID: <87cxshypj2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yifei Gao <gyf161023@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: hdsp, hdspm: Fix unlocked control_register updates in MIDI paths
In-Reply-To: <20261106205050.8048-1-gyf161023@gmail.com>
References: <20261106205050.8048-1-gyf161023@gmail.com>
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 06 Nov 2026 21:50:45 +0100,
Yifei Gao wrote:
> 
> hdsp and hdspm keep a software copy of the card's control register and
> update it read-modify-write under the card lock, except in some MIDI
> input paths, where concurrent updates can be lost.
> 
> In 2011, commit c0da00145f9a ("ALSA: hdspm - Fix locking in
> snd_hdspm_midi_input_read") fixed the MIDI work side in hdspm. The
> interrupt handler side was left unlocked, and hdsp has both problems.
> Patch 1 fixes hdsp. Patch 2 fixes the remaining interrupt handler side
> in hdspm.
> 
> Both issues were found by static analysis. The patches are
> compile-tested only (W=1). I have no access to this hardware, so tests
> on a real card would be very welcome.
> 
> Yifei Gao (2):
>   ALSA: hdsp: Serialize control_register updates in MIDI input paths
>   ALSA: hdspm: Take hdspm->lock when masking MIDI interrupts in IRQ
>     handler

Applied both patches to for-next branch now.  Thanks.


Takashi
