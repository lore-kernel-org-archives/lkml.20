Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828588;
	b=Ngnn1GeRApvWRTwJIh8zqea/PMQ+w6TA7V2himDYnQ5SBoBhpx7Z9pKYrXJsDk97RrUW
	 wYSgTAcRYBVoTk3dD5mXVOVovwp5e83GVWAo5EmYXwwNvOalr0ReugapgkY15BioM0fDw
	 IGn6+Cms1qyvtF2r7UrUjhwyfdu28RMM9EMi1EAvnj46Wym4sdcZHMiVS1a4YgM1AJFKl
	 IZ5P3XKhAY/aOuG6nBd8k9qDhNQQb/JBd6sLwc0jaHNdAkLu6WFr/bN3ZvjAkbhvBysGw
	 aRar0hyM/SYe4hHftfrni3kpARgH3m0FkEEU1MD6QKBRqzO7wmxryI8BpCFCV97/yMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828588;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=zNyDTONLGtmGU1FR0ScXi+fy1go3+Ut51Bp4WaQhnbs=;
	b=sgM9wghsP72oMn681g1EOgvR2Ff5ITpZ6gLsOmZTuK0CzdF+87zD1XfXpGkmVHnm5EQg
	 NH8jE3avDYdEn8aGcr++qY767kiJxiExLTXOnvS453I6IxoORWJQCB5oLHpaoP47BHTn1
	 U6iGI4Yu1tdQqrfOaMijGOXRS01pC50VChv2zhG6QiZqo1/BBOBGgq71cc16dAeESNCW9
	 elRUqyGLtw0uYgQ9FXOPp/Zz1jU4pNUxlpel6Ube62Q/KiX3mBkhnryVbl7ik+KbNG2p8
	 5d/hEj+98+GpDvfEuBSU07UhD9PVEh9RgWAOZCk1VBpTWoZSMgN41ApWrECGxJh1qTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gKPZrewp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ASoy9K23;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gKPZrewp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ASoy9K23;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BE606A323;
	Mon, 16 Nov 2026 11:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C3BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gKPZrewp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ASoy9K23;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gKPZrewp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ASoy9K23
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E14322215;
	Mon, 16 Nov 2026 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794828586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNyDTONLGtmGU1FR0ScXi+fy1go3+Ut51Bp4WaQhnbs=;
	b=gKPZrewpfDKrrCXOZTvUnBbXDszHlgTpTgNbvx9EHBInVPUvLY0c4PNhlrH4bifHkt1LZP
	KZbjDS+WAJ2e2298KbeRB49BDvENm9P2Uafy1QfcDkdx95SuA6UV/JBqLhFIsbdUUwNJl3
	yrBgOqBtk3k46uVdENsXWmYEwDrxHNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794828586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNyDTONLGtmGU1FR0ScXi+fy1go3+Ut51Bp4WaQhnbs=;
	b=ASoy9K23VQY1ZLAZHOkkV5uZm90uu8FIRQi1Y1GJKRUVOo69WgqR8Nb4R2y+x6Xp4+Gjf0
	RxGISg0cDQmdEHAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794828586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNyDTONLGtmGU1FR0ScXi+fy1go3+Ut51Bp4WaQhnbs=;
	b=gKPZrewpfDKrrCXOZTvUnBbXDszHlgTpTgNbvx9EHBInVPUvLY0c4PNhlrH4bifHkt1LZP
	KZbjDS+WAJ2e2298KbeRB49BDvENm9P2Uafy1QfcDkdx95SuA6UV/JBqLhFIsbdUUwNJl3
	yrBgOqBtk3k46uVdENsXWmYEwDrxHNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794828586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNyDTONLGtmGU1FR0ScXi+fy1go3+Ut51Bp4WaQhnbs=;
	b=ASoy9K23VQY1ZLAZHOkkV5uZm90uu8FIRQi1Y1GJKRUVOo69WgqR8Nb4R2y+x6Xp4+Gjf0
	RxGISg0cDQmdEHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 444F513408;
	Mon, 16 Nov 2026 11:29:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZOz3BSrp+mqeKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 11:29:46 +0000
Date: Mon, 16 Nov 2026 12:29:45 +0100
Message-ID: <87ecclypxy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: compress: Set metadata_set only after successful callback
In-Reply-To: <20261113092559.3283-1-sreekuttan2156239@gmail.com>
References: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
	<20261113092559.3283-1-sreekuttan2156239@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
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

On Fri, 13 Nov 2026 10:25:59 +0100,
Sreeraj S Kurup wrote:
> 
> Set the metadata_set flag only when the driver's set_metadata()
> callback completes successfully.
> 
> Previously, the flag was set even when the callback returned an
> error. This incorrectly indicated that metadata had been applied
> successfully, potentially causing later operations to skip metadata
> setup.
> 
> Update the flag only when the callback returns zero so that its
> state accurately reflects successful metadata submission.
> 
> Fixes: 9727b490e543 ("ALSA: compress: add support for gapless playback")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied now.  Thanks.


Takashi
