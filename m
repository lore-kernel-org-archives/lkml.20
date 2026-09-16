Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A964718DC;
	Wed, 16 Sep 2026 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560442; cv=none; b=r3TU8t1gMblrWURHkI3vXbpEWaCBN/bacb0JA716qC24zjE3r4D5b6U4wNJPQWZCQ9bgjOHaR9/5oRF2mxR6gGz78o3GhmB1amZ6y4dP1IAuGn8ol1nleEoQZoVOk1pSVifEO4AJKgi5cdpd1zXVhrJY8v+lusW5Vhx6Uenv0DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560442; c=relaxed/simple;
	bh=PNRAk987V0a41382WuED48cFT2Uq+Yw379j0Eft2v+I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qqvokgp367Gcyj7wyA8dlz/Q0EaRfGb0zLoo3aNLEnSAg9151/u+cT/FQ2SBNGmNDauVkRH7H50YCAAqVwcxuxDt2fgjN9jG+U8N+nswiJivoObanSnMiD/YwRuMwGfqhMUgluyLlr1QaEAjjwOOMFDtwSNe8r4y0vCuXKaxOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l9fPRdds; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KBTH1pX9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NVyCj7eB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HuUMd/h+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l9fPRdds";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KBTH1pX9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NVyCj7eB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HuUMd/h+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A4D6321BDE;
	Wed, 16 Sep 2026 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789560425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIkdHuvhYcFKQDO092qbt/BCYCXyCcCSeupVTxMXLvE=;
	b=l9fPRddsZ5OeFihDkUh3NW517xbh20E4XipzUITj6bImrnNmzmFbgEO4HsuFg0okrWaFrL
	2hmbFiItdPla95HJP21104XBj2l12GN2bdnx+inu2rM2hAOSwDIAOjFE+vUZLXD1iXPVw5
	4Gw/mYg+zCngINXWtNgJVS0uYairrwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789560425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIkdHuvhYcFKQDO092qbt/BCYCXyCcCSeupVTxMXLvE=;
	b=KBTH1pX9je7FsoaYb5RKBEB+veScSadY1mWpP2z5HUs3gbHtGnw9AmRHOIjQle6eNq0nfK
	GBvxm6I/NVpQpPBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789560421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIkdHuvhYcFKQDO092qbt/BCYCXyCcCSeupVTxMXLvE=;
	b=NVyCj7eBPMNSoH80EpydSzu8DWwTQ4QzQA0j/x3eekyUnToEcJNq96polV33hPykIBf84P
	Gt+QKKdcTd+zL+OownagOY9BC79MZRzh/BDjxvVHUjx7VMY+B8WskJ8h6NdQ0H/qalCfCq
	FYHfcXCnTrSZ5jq+5MvycFmxSvmXBHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789560421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIkdHuvhYcFKQDO092qbt/BCYCXyCcCSeupVTxMXLvE=;
	b=HuUMd/h+XLTK9/nuKXTVw6tUsZ1NKU/V8RRYymiIQRnU7bUWv1WXLXawUqKbVkPJ8j33kG
	eiIO5d8hqNc+7NAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49F221348F;
	Wed, 16 Sep 2026 12:07:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MN38BmWGqmrwRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 12:07:01 +0000
Date: Wed, 16 Sep 2026 14:07:00 +0200
Message-ID: <87se39jt7f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Yilin Zhang <yilinzhang@moonshot.ai>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Propagate snd_pcm_stop() errors in snd_pcm_drop()
In-Reply-To: <20260916094014.33609-1-phucduc.bui@gmail.com>
References: <20260916094014.33609-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,moonshot.ai,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 16 Sep 2026 11:40:14 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_drop() currently ignores the return value of
> snd_pcm_stop() and returns a pre-initialized zero instead.
> 
> Store the return value of snd_pcm_stop() in 'result' so that any
> error is propagated to the caller.
> 
> Found by manual code inspection.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
