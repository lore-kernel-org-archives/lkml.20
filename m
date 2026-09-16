Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91235446BE2;
	Wed, 16 Sep 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544037; cv=none; b=N7v1WsrVxWJtWhFFguXRNN7BsYJZTezIPtvXOiwxr2UOdm5gBrdYygcYh4/+e0c3weu1F4i7YHm1DuIeMinQqL8nb8NHo9tAz/haeshKlNPo9KaFBb+qLixLAJkXsJjJd+dlRJ22M1bwD+Q7H/txxx3Kg3oY15EfNkdj37NyTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544037; c=relaxed/simple;
	bh=LvMw61dibRIW+4fVO1QJlzkWbSQ+bVE6zhZek3EDjEE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/lSrySb+iIH8zE7J5PLUvVgsG1+Rx+0LoZc2TIx8FPH3N1TrDegWvR8VjIQJwAvG6PATvkd7kR7M7idkRReAyvJJ97E8EkIVsz9IebQEHyd25GZLId+/dTfhLRrraqs+1a0CVUM5T+twSH66sch727Z3vW07qjyZMBVdFjYvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DLJ+aSQk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FfAVxjZG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q0cnmw4w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y7Pa3rsK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DLJ+aSQk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FfAVxjZG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q0cnmw4w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y7Pa3rsK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD8671FE4E;
	Wed, 16 Sep 2026 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789544019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0NbHjrngbuHOeHp1Az9Ca1YwjQzYzoNm/qMlYvRwsM=;
	b=DLJ+aSQkmKAIuo5EQtj63WVt9JGqKDm2+zkWtpeVWDmuoc1w+xaEpvGn+i746heJAyN0/T
	shDY0otlLT0ShqpAmIFhXbCEK/+v/3bwcEK3OQjItZodKAZQEhtRNHr09c3zISWV6U8a1i
	+Y+Qpo7L61HsTmPkCpSOAuezjk+MXFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789544019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0NbHjrngbuHOeHp1Az9Ca1YwjQzYzoNm/qMlYvRwsM=;
	b=FfAVxjZGFLc58i6fal+6Uu+hdTsONBMO1uP+gQLCrLBGPy9waU50DuWeo8/X7sQbP51bqm
	52bAboP1nLGqwkAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q0cnmw4w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y7Pa3rsK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789544014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0NbHjrngbuHOeHp1Az9Ca1YwjQzYzoNm/qMlYvRwsM=;
	b=Q0cnmw4w6AwLrZl5QrHnqgfBravVCUc/Ws9yvIQreTpUYjT5Dz/0RLG8hrl/ajoY95P690
	hi9HnITruSyQvI1dp8aiwe/4Ypg5tSxoha9BvAj5pas1XgRhm8GuENTEixOFfA5nCvTh6q
	Xmn4M8tcraSm3U+oRLiM2SanKbAUvjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789544014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0NbHjrngbuHOeHp1Az9Ca1YwjQzYzoNm/qMlYvRwsM=;
	b=y7Pa3rsKY3YrLUT0KxqAqGdbpwK27xawRRLRlsNX+aOBtph5WGvH3zTtDM3OamLvWH5y0W
	/i5SnUwdbi2mLbAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88E75136A5;
	Wed, 16 Sep 2026 07:33:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IWnmF05GqmrQEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 07:33:34 +0000
Date: Wed, 16 Sep 2026 09:33:34 +0200
Message-ID: <875x05lkfl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven 'Steve' Kendall <skend@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
In-Reply-To: <87fqzan7jp.wl-tiwai@suse.de>
References: <20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org>
	<87fqzan7jp.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CD8671FE4E
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,sashiko.dev:url];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 15 Sep 2026 12:16:42 +0200,
Takashi Iwai wrote:
> 
> On Tue, 15 Sep 2026 04:11:38 +0200,
> Steven 'Steve' Kendall wrote:
> > 
> > On some models like the Dell Inspiron 15 3520, jack
> > detection does not work. This patch switches to
> > delayed work to fix jack plug on Chrome OS.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
> 
> The code change looks acceptable, but the patch description gives too
> little information.
> 
> And, should we apply it unconditionally all models with this code?

... also please check sashiko's review
  https://sashiko.dev/#/patchset/20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61%40chromium.org

They aren't always correct but often give good hints.


thanks,

Takashi
