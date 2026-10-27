Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083113;
	b=FuswfKl0O84/Q0goQMIv1/sNngBuzEKMXi+xQlGwzCcyFFpw/7HDR6x8LWDCDROvomZ5
	 yZLUJWktOZZpFNtvuaCvbowiZzo1ZiFhQ6XxgpTQqwmGd9o+zYAmAyHjpgDS/7QEllQfX
	 xhFyjDTr5T6iYcGqe4YoVrDN2diE3Lw/FhSZkkIbwz5ul+WJBWZke4rTTc5yc6PMeKe+o
	 E+xuP9qBhBkq/OOc5YD6Z/y2Qxqh+zDCXFRiHtlI6xhWbwRtVrp6YDyl0h10wn1RDWEL5
	 sY7FeXJ0pnNgEZ+e5lZ4kgZlxQlUTFCodlNcafk+U+wbf00S+KQApcCa7n3rwMtsB1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083113;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=LNdNuDd/oPjC1rmg1EIQm9AgW2Y2PWUNPm6TKi6mySY=;
	b=cqts5d05uPlUXnfoxCNAT5ksDKI4fmtoWf2sqjI5hiGnzG7Eb1eiOuGQtUNTacwZzScw
	 scYsNQP/AdBFPSc8xXe8HRjLCDhO/q8wsiSGtz9a3cSJie4XlRXmJ7bf4kfkUdfaP1IS8
	 055YfLoIYNWkmv6djLjOhhBuAPrbbvlPA7jtvrY9MpbSEr7kFUroXL+IaYomxxcdjrJJe
	 rBT68Kf1otnDVTLyIS4zmLTwVw9t9G3Apfqpl5Qv7o0l6TlBpvnA2axotE143pO9W8QTG
	 2nyTPGx77a8jhJms+IlvHwTMLP+lC3C1MXntGyFZU2bgjaul4QuIF3CjxAByYS2C9Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gR3IHcXU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="2WgJd1/f";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lKGwlyDA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vwB7Nq1W;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552C606A31A;
	Tue, 27 Oct 2026 06:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B552C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gR3IHcXU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2WgJd1/f;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lKGwlyDA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vwB7Nq1W
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D23AC1F791;
	Tue, 27 Oct 2026 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793083111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNdNuDd/oPjC1rmg1EIQm9AgW2Y2PWUNPm6TKi6mySY=;
	b=gR3IHcXUWHeaP/xFKw34bYfOReosh+gGEOh0DCLE4WYvXspTo5Gke0IcDPXHsTjB/e1kcJ
	oKmjr2g26aUagCRy5N1oT2XQM6smeWd8O73zukF8HBsFy5cZNe2+g5clzIhhP3k3dzNY+M
	2aTZZUrQnIP3Qv6oACF0ZMeNF0TuPwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793083111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNdNuDd/oPjC1rmg1EIQm9AgW2Y2PWUNPm6TKi6mySY=;
	b=2WgJd1/fWGkOGnCmuFgMwDfMzyGnb/GsyvNnv9m3oKvFF34I147Q/+G5AuVvSqZAZlPAeP
	SYDqF0pvR/NIblBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lKGwlyDA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vwB7Nq1W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793083110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNdNuDd/oPjC1rmg1EIQm9AgW2Y2PWUNPm6TKi6mySY=;
	b=lKGwlyDA58rRicJ5ad1MmsQAzFC2Iqoa+ngNvvoME00bmlJpJIYLmvV/kr7JIdsx4PqYdw
	tkKqF7fVTxHhklEAiwWr2c94IcCMrwrxj7mRKNS+fRXKrsQybHd+884R7gJS4DW7T5y6ea
	T1SLhnPpw+wyLPF16teOH63wG41rWj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793083110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNdNuDd/oPjC1rmg1EIQm9AgW2Y2PWUNPm6TKi6mySY=;
	b=vwB7Nq1WEf08U1EpHqIKaKXE7l3jf3u0CEwC6qwA0oYIhCiKi+c599UUL6Zdk35wkrDn93
	IsulHNGUExr5u7Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 847481321C;
	Tue, 27 Oct 2026 06:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aU3QFuZG4GqqHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 06:38:30 +0000
Date: Tue, 27 Oct 2026 07:38:30 +0100
Message-ID: <878q3j4pi1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: tiwai@suse.com,
	ivan.orlov0322@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcmtest: Honor the enable parameter
In-Reply-To: <20261027012228.3797565-1-sammiee5311@gmail.com>
References: <20261027012228.3797565-1-sammiee5311@gmail.com>
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
X-Rspamd-Queue-Id: D23AC1F791
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,perex.cz,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Tue, 27 Oct 2026 02:22:27 +0100,
HyeongJun An wrote:
> 
> The enable module parameter is declared and documented as "Enable
> pcmtest soundcard.", but nothing reads it. Loading the module with
> enable=0 still creates the card.
> 
> Return -ENODEV from mod_init() when enable is false, as the pcsp driver
> does.
> 
> Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied now.  Thanks.


Takashi
