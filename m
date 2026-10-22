Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657762;
	b=zkYGAzTyW+Vv0gAHMKhVWaXegCQY0e71kt9x+zJQZ0OkGQ1adg6G1HTn+4xsjyYMymE2
	 Ci0o8cvNQQCGDKT8M5Xjrmd/AGGFPhxlJuAiq3O3nvD0JLyMjwgZPjKOxzx0Z6OlQgrMm
	 jpfM416qmljN2a1fQ5juRnFShmQIRI8VXWnW4fniXM4zOiNYOLyWZk6dHpSSmzzre/WQ3
	 TWFjJSapOyTLNX/Vw6vvTcvOZxSYIkPwSr/e6bqSo3t5RmknYTF+INMEXPL8HJgvW8ECJ
	 wDXFT3gf5sxI9su6cziUEYiHJQpaYNgtRbzHohabP86t51VuxY+G7Km9HY7Vts8zQbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657762;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=AweYBayPZNWOkLOXG91ofBMSZSAcZuPxGyGqj1NCK1M=;
	b=L9qeYj+2N+EV1zd1NRh/3tHlOyvHtTcth8oBOMu5zIhrsR8mb7TtHQW51vTqE6m822qj
	 xfDoXj73tSNcMpl3LNcMU7hwxYPx2YWFQJ+Fh7tHQiRiLiKUX5h3yJqxUizRtf3DLy4Mn
	 QVIEgS3ZNtoNcIxrmOVufSaeZ9xWmTseDBPtvaJLLchTxGlaFvFs/SnQ3I+E0Pu1nnLEv
	 +dTwMYg6yO8NhsjBihjbiEhGPvVWQabfhOCXn0h3ZMV1ElFIlHBOZJ4TtRUWTyJSVE03q
	 Bd1uOss+s28fUSmCcwnVQaP8iAxKVTaU2PyrRk31XBEQwbwKvdev3GRNVhiiJ504ouw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sTpcUNRc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=G6fgFST3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sTpcUNRc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=G6fgFST3;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102B606A319;
	Thu, 22 Oct 2026 08:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8102B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sTpcUNRc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=G6fgFST3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sTpcUNRc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=G6fgFST3
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 896DF1F830;
	Thu, 22 Oct 2026 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792657759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AweYBayPZNWOkLOXG91ofBMSZSAcZuPxGyGqj1NCK1M=;
	b=sTpcUNRccOMTPmE2FZz4su04pHP2Kk0bw0GJfcNtTHPSIvsaJADpxRJkgOsSBcUPvRHcZs
	CmZTM7ZG3SJjZQIE1DbX05GmGHyM9YCLXFvwtuH1EqWgCtfydg8qmOiuvdHD3IfBzsCvRg
	kHXq8SGB5M+dLow0IfZculTqHD1tEAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792657759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AweYBayPZNWOkLOXG91ofBMSZSAcZuPxGyGqj1NCK1M=;
	b=G6fgFST3Uu0u6934OlunVlIK82IeDqzyO9FAdjc4uIn07Mt9Ccrcr5yaBXiREgsI2bQygw
	CC7iHpML9zXnqoDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792657759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AweYBayPZNWOkLOXG91ofBMSZSAcZuPxGyGqj1NCK1M=;
	b=sTpcUNRccOMTPmE2FZz4su04pHP2Kk0bw0GJfcNtTHPSIvsaJADpxRJkgOsSBcUPvRHcZs
	CmZTM7ZG3SJjZQIE1DbX05GmGHyM9YCLXFvwtuH1EqWgCtfydg8qmOiuvdHD3IfBzsCvRg
	kHXq8SGB5M+dLow0IfZculTqHD1tEAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792657759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AweYBayPZNWOkLOXG91ofBMSZSAcZuPxGyGqj1NCK1M=;
	b=G6fgFST3Uu0u6934OlunVlIK82IeDqzyO9FAdjc4uIn07Mt9Ccrcr5yaBXiREgsI2bQygw
	CC7iHpML9zXnqoDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40F82134E6;
	Thu, 22 Oct 2026 08:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1SmDBl/J2Wo3KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Oct 2026 08:29:19 +0000
Date: Thu, 22 Oct 2026 10:29:18 +0200
Message-ID: <87y0bqcf4x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
In-Reply-To: <20261022080904.1740256-1-songxiebing@kylinos.cn>
References: <20261022025743.520258-1-songxiebing@kylinos.cn>
	<20261022080904.1740256-1-songxiebing@kylinos.cn>
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
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 22 Oct 2026 10:09:04 +0200,
songxiebing wrote:
> 
> >It must be rather a problem of PulseAudio, and it should be able to
> >handle Capture Source, as it's been used for most of old AC97-based
> >cards.
> >
> >Reverting this old behavior change (since 14 years ago!) is just
> >no-go.
> >
> >
> >thanks,
> >
> >Takashi
> 
> Thank you for reply.  You are right -- changing the name
> unconditionally was not well thought out, and I agree that reverting the
> long-standing behavior is not acceptable.
> 
> Would it be acceptable if I add a flag to hda_gen_spec (e.g.
> use_input_source) that decides whether to use "Input Source" for the
> capture source selector?  A codec driver could set it when needed, while
> the default behavior stays unchanged.

That can work, but I'd rather check further why PA doesn't work with
Capture Source.  If it's something like an element that doesn't match
with the actual input, it's a driver's problem and we may work around
it somehow.  But before figuring it out, it's not wise to blindly
work around something just because it looks as if working.


thanks,

Takashi
