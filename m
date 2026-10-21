Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587511;
	b=0lukWtWZPY10gK6TRyqilphBWfMiRCmQXSto9uQ7V0dGoZYch8KimQ3IA5ZaU50AygG0
	 bZaVdCZYok34LdIBHmdFBm7CCyvG55SUgmeWd8w/L/Jxt+7/rteARK3HNEjLYn/qHy7Wf
	 UOXTcAzlDw5/W7mKhorn4qgj5lsYmOVQCEf3yE1NMCdTptcUrB9KatyGVmgSJPHTwLsrz
	 /lL9R+RAt5NYw52DA6/evvHw1SWpJoXg1bPh50ERpOEveuWcEZ+u0rA5sXS2fyJVmBSeH
	 iRYPkAjve53ekHV8BMB5+B6Op2/bB3aLERij/DWEU787763Poz9lvSDb0VzonjI3kfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587511;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=R8j8pLv/w77jECDjNwXmkTccZBEPUOnkGIbbKOqxGgo=;
	b=o4b/CQtDa/XiT6FFChhutjq9k0fgZuDXiZaw+DyRDY8ORN00TTT9erxxox9gC85/wE0H
	 9mfxIR/IBJKdXLHRgRMkZTHFDGJviA+P129LL4go8xLsevBhdGSU4uxsFaOcwLE/U5f9Q
	 sxFCbeCpE6OkBS8y+TLHMf+bwllQ0ehpru4GEJVx+Oy1SDllM8aUq2nreRUmulgond8dW
	 S8oARjWT6mjLETY2nFS7ApaGXhDqbDo1Frzs/I+ZnKcz4Zjir4tCyJu0Bq0vNqYOeVB5a
	 8KKe3DrSrWYjmbh6ak+L/h7zQ7T8nrzzf1Tx4kAJ918GAe4aeoCE8yaq+ym2saswyrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z4cSejP3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SD9Tsfpu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z4cSejP3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SD9Tsfpu;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79688606A31A;
	Wed, 21 Oct 2026 12:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79688606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z4cSejP3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SD9Tsfpu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z4cSejP3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SD9Tsfpu
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9BB7621E34;
	Wed, 21 Oct 2026 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792587508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R8j8pLv/w77jECDjNwXmkTccZBEPUOnkGIbbKOqxGgo=;
	b=Z4cSejP32GJCl5a+7O8RTd/VGzZi2XvAg6WEQ8JDW30gRlHd7DOxMsCGTAyDtoA3dYaqpq
	wZVTe2cO1jROa7OObNU4QyA2UafIJd9sDsH185UvMeTXKicpAo6SgBRRuPis2H1mTdJVl6
	MSMEQItJe6gWJmfM9TU53TvMf8QQiUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792587508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R8j8pLv/w77jECDjNwXmkTccZBEPUOnkGIbbKOqxGgo=;
	b=SD9Tsfpu7SiDJP6yVd1AA4kdSfDPb8b7KOCW7s5tI58xd2QnQRyB1fxpY1lEGswDwP1v6M
	ZN76GWw5i5XF+lDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z4cSejP3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SD9Tsfpu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792587508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R8j8pLv/w77jECDjNwXmkTccZBEPUOnkGIbbKOqxGgo=;
	b=Z4cSejP32GJCl5a+7O8RTd/VGzZi2XvAg6WEQ8JDW30gRlHd7DOxMsCGTAyDtoA3dYaqpq
	wZVTe2cO1jROa7OObNU4QyA2UafIJd9sDsH185UvMeTXKicpAo6SgBRRuPis2H1mTdJVl6
	MSMEQItJe6gWJmfM9TU53TvMf8QQiUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792587508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R8j8pLv/w77jECDjNwXmkTccZBEPUOnkGIbbKOqxGgo=;
	b=SD9Tsfpu7SiDJP6yVd1AA4kdSfDPb8b7KOCW7s5tI58xd2QnQRyB1fxpY1lEGswDwP1v6M
	ZN76GWw5i5XF+lDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6326B134A5;
	Wed, 21 Oct 2026 12:58:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J4M2D/S22GqVcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 12:58:28 +0000
Date: Wed, 21 Oct 2026 14:58:28 +0200
Message-ID: <87se1zdxcb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: caiaq: Use strscpy() in snd_usb_caiaq_input_init()
In-Reply-To: <20261021103928.131918-2-blum@kernel.org>
References: <20261021103928.131918-2-blum@kernel.org>
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
X-Rspamd-Queue-Id: 9BB7621E34
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
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
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Wed, 21 Oct 2026 12:39:29 +0200,
Thorsten Blum wrote:
> 
> To prepare for removing strlcat() from the kernel [1], use strscpy()
> instead with the length returned by usb_make_path() as the append
> offset.
> 
> No functional change.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied now.  Thanks.


Takashi
