Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717597;
	b=s9LJPAtcEEqHABxx+16CFjqRjY9FoDoA6y/gFVKD6RbmTQSZJLhuKxmySfqp1rNcjxdu
	 7A3CF/CILhLHS9BcyJpuh8QuXVhymyAJDcssD73YxJbBwYI4nd/6ShvL4syaAwW1b5ZHs
	 ORpBIvxPJT3+ykRXTD+n6BV4DfFJSeLTdvX2MywDoyKhQakGNkf6DLvmmP1/4t2gXRVZ8
	 x1DWmrleoVup1r3TFA9WcEMjORuYTnydDj6UxH323NavY0vxtxsYFavBCkQdD0b1KZwts
	 61yNlHJiWL8z29dP3Rnm5l+C+8KaDy66IGtOq7sMyh9AyA03WceICWpQ1j7WXZ5Z7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717597;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=OfMp/OOfiqCUtByb0q286Rm+h03/84gfN+/uc9hS6YU=;
	b=Ps5HL9wTLQrs+RXx1Shc0GKj/0Oi4onMXTxwsoBv1KnXtnU6c/YM8diR5E9AWtVe2cbI
	 Mvh5HQGJ6R08sY5AQoWmCxf7dIP/gLa1WjANVlgUoq7WHEs2m5CsseR6g/ezzxYBwkNwL
	 AdvTtJqy29k5geD8Nr8yAepn0UWDb+RKcgVAxzqQrBvktGGeeHOgvBDLRWnpHEbQeY+WB
	 NmdkBFJ6EMMam451s4X480nt9R6KeiTSZy0CNn1Svdu2dnflW8JpnJISs/dbD5VFyWImf
	 4LrTR1f8a5FcRVyL3PPhuMpTp2uYWyJvRoARUXSDVvGF63FT4KMt+tw1ucGfOOvu77w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HDB4p23A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d7hF6qDq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HDB4p23A;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d7hF6qDq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F056071A05;
	Tue,  3 Nov 2026 14:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F056071A05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HDB4p23A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d7hF6qDq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HDB4p23A;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d7hF6qDq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 218E91F7C8;
	Tue,  3 Nov 2026 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfMp/OOfiqCUtByb0q286Rm+h03/84gfN+/uc9hS6YU=;
	b=HDB4p23ADS/JfJN8FUMlZjeEk+OmLqbhyRmQHJAuhURTn/a+elTSs5w08uIIkP/S9c4aoU
	NTXuNlxLaI8J6aylxqhMuY8C/MHuVv4I7XpYX6cU2TwgYlyGLvBfBT1VQKj+KSYYJHPh5O
	YJXPKVOZqxA1uEAAFZJriWQv0w8Jgko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfMp/OOfiqCUtByb0q286Rm+h03/84gfN+/uc9hS6YU=;
	b=d7hF6qDqHQ20h9U6v4zs7PL5MpMEq88lYPwGoOdEK2LYihKx3I26krK1thhuqiUnYBIP68
	hAj/HIqGIMNZ9/Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfMp/OOfiqCUtByb0q286Rm+h03/84gfN+/uc9hS6YU=;
	b=HDB4p23ADS/JfJN8FUMlZjeEk+OmLqbhyRmQHJAuhURTn/a+elTSs5w08uIIkP/S9c4aoU
	NTXuNlxLaI8J6aylxqhMuY8C/MHuVv4I7XpYX6cU2TwgYlyGLvBfBT1VQKj+KSYYJHPh5O
	YJXPKVOZqxA1uEAAFZJriWQv0w8Jgko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfMp/OOfiqCUtByb0q286Rm+h03/84gfN+/uc9hS6YU=;
	b=d7hF6qDqHQ20h9U6v4zs7PL5MpMEq88lYPwGoOdEK2LYihKx3I26krK1thhuqiUnYBIP68
	hAj/HIqGIMNZ9/Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE1E01350A;
	Tue,  3 Nov 2026 14:53:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9ENMKVr16WokGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 14:53:14 +0000
Date: Tue, 03 Nov 2026 15:53:10 +0100
Message-ID: <87v76evueh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	phucduc.bui@gmail.com,
	kees+treewide@kernel.org,
	cassiogabrielcontato@gmail.com,
	mstrozek@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Clear user-provided numid before adding a control
In-Reply-To: <20261102135034.2751-1-sreekuttan2156239@gmail.com>
References: <20261102135034.2751-1-sreekuttan2156239@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[treewide];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,intel.com,gmail.com,kernel.org,opensource.cirrus.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 02 Nov 2026 14:50:34 +0100,
Sreeraj S Kurup wrote:
> 
> Clear the user-provided numid before checking for duplicate controls.
> 
> A non-existing numid can cause the duplicate control ID check to be
> skipped, allowing a control with the same name and index to be added.
> 
> Since the kernel assigns the numid when adding a control,
> ignore the value provided by userspace.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied now.  Thanks.


Takashi
