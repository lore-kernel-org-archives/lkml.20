Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794134867;
	b=uK48LYxftBSgFvx5XCX7ErXrTCQb/cz/sznEhpQdKKDq//h4bgd/217IX0HzYuTNH0M4
	 OecTVg9jlK/srUWwpjfL9rlj2Ljj85k75br2IzFjCHxDcTJoksUcOcH5ilK/5Eg/hrXJ0
	 /KqhwXqIUzmR8MyFh0QExQGInPhPzzQCRv+/QIbtsMSwU9DXLQR2yLJiy3u6h5xS0J56R
	 QFKkPYSNB6pZ3/Vg8+AImg0Nh6DQOsUzZi4/mh9bNS7d1oYIoDgwaNjI8DGBrgRN796zC
	 4ccjtnP3Mq/6rjWX6lPOOvM2AEXk5abSxpG+z97y31ejZpvYk8y4HG4jgFCwPrFLenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134867;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=AakKaGbPYpxwT61bjk2Z7U2sybxRQC9at/Cxx1QT/9k=;
	b=4MWv6ui0XDIdzY2L3qyUTMy+voeTXqhcpgW6A/B6gFAYnMY5brCxFP9p3bhJ9Br7ii/o
	 ED02OB/dWLSpg46KpJhBrvouq9qCRh0K1xTFFk0TH7w6v0A39MCvVsfibx2owuxxbUuWM
	 y4EtaBM7tX/NS3uJt0kSa819Av9Kl88QD6Xsmv/WVbu/XTjRnVMumXDsCqvyQ8WLYLBZF
	 ZSnYc15uEk1Qvu+3ilQC6PQvpYaZ62KLAusPR3aH3V4C8UUzh/yq6JeZjZpu1hfFDmg91
	 wl3WL3KO1Ohrt4BkeeE03E8mOX4p6Csq2W37itCNGco7zRePgxTqsZ0nG//dwuzLjLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ggJsqzxw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aWPngGeI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ggJsqzxw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aWPngGeI;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1776606A31C;
	Sun,  8 Nov 2026 10:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1776606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ggJsqzxw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aWPngGeI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ggJsqzxw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aWPngGeI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FB941F74C;
	Sun,  8 Nov 2026 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794134864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AakKaGbPYpxwT61bjk2Z7U2sybxRQC9at/Cxx1QT/9k=;
	b=ggJsqzxwG4veQ7dc6bEDfukQX3AKKghWpCcFd6mxAzlwv4f9PpEs/UZ9K42hFqsgPEagy9
	EeabVXbMJRXeNTvjICYqZc2yNXpzpLbq5qtSaki8A3gjeLxDFHh99/VUFPGz0++MCbHnW8
	REUvb0L9DK5+dNKYp6hGHp3//UQg8dM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794134864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AakKaGbPYpxwT61bjk2Z7U2sybxRQC9at/Cxx1QT/9k=;
	b=aWPngGeItmIPCCMGAW8e5JhMy+M5ZYrmdkN8dGlAUXaOavXwHeJZgUVojXrsVr5Oa09bq0
	EBDgDDgBAkQmUYAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ggJsqzxw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aWPngGeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794134864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AakKaGbPYpxwT61bjk2Z7U2sybxRQC9at/Cxx1QT/9k=;
	b=ggJsqzxwG4veQ7dc6bEDfukQX3AKKghWpCcFd6mxAzlwv4f9PpEs/UZ9K42hFqsgPEagy9
	EeabVXbMJRXeNTvjICYqZc2yNXpzpLbq5qtSaki8A3gjeLxDFHh99/VUFPGz0++MCbHnW8
	REUvb0L9DK5+dNKYp6hGHp3//UQg8dM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794134864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AakKaGbPYpxwT61bjk2Z7U2sybxRQC9at/Cxx1QT/9k=;
	b=aWPngGeItmIPCCMGAW8e5JhMy+M5ZYrmdkN8dGlAUXaOavXwHeJZgUVojXrsVr5Oa09bq0
	EBDgDDgBAkQmUYAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19ED01339B;
	Sun,  8 Nov 2026 10:47:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4HcyN09T8GpRWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Nov 2026 10:47:44 +0000
Date: Sun, 08 Nov 2026 11:47:43 +0100
Message-ID: <878q33y4z4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alyandra SigmabetJir <alyandra5b@gmail.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
In-Reply-To: <CAJYQYHxrpmBPiyMiS2oK8eugUMR=KFmf9D5jwLdoYUYQgKkXjw@mail.gmail.com>
References: <20261107111056.667-1-alyandra5b@gmail.com>
	<87pkwgyck9.wl-tiwai@suse.de>
	<20261107142950.125901-1-sammiee5311@gmail.com>
	<CAJYQYHxrpmBPiyMiS2oK8eugUMR=KFmf9D5jwLdoYUYQgKkXjw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 8FB941F74C
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
	FREEMAIL_CC(0.00)[gmail.com,suse.de,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Sun, 08 Nov 2026 07:07:08 +0100,
Alyandra SigmabetJir wrote:
> 
> 
> Hi HyeongJun,
> 
> Thank you for bringing up these related cases in the earlier discussion. I
> also appreciate you taking the time to work on the additional patches.
> 
> Thank you for clarifying the situation and sharing the details.I appreciate
> your help and the work you've already put into this.

Could you guys cooperate and organize a single fix series?  That'd be
nicer at merge.

Also, about the unit test: I'm not much against kunit, but my gut
feeling is that selftest would be more flexible (and less changes in
the core code itself).  If that's feasible, let's go in that way.
Otherwise we can take the kunit change.  But maybe it's cleaner to
move the test code into another file.


thanks,

Takashi

> 
> Sincerely,
> Alyandra
> 
> Pada Sab, 7 Nov 2026 21.29, HyeongJun An <sammiee5311@gmail.com> menulis:
> 
>     Hello Takashi,
>    
>     Thanks for adding me, and thanks Alyandra for the patches. Yes, this is
>     one of the cases from that thread.
>    
>     I have patches for the other cases discussed there. They keep the
>     RPN/NRPN selection after a send and clear only the data, drop data when
>     nothing is selected, and handle a Null NRPN like a Null RPN. They also
>     need the same selector change as this patch.
>    
>     I can send them on top of Alyandra's patches, or as one series that
>     includes the selector change, whichever you prefer.
>    
>     Best regards,
>     HyeongJun An
> 
