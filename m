Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9140E28E0;
	Sat, 12 Sep 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230677; cv=none; b=T9TUoChrzCfF7+nxgHQgnyrYUJ7uAKmaF3kQ2A3MI+l/X7NVzkIqgyM201BZX0BqXSTxQnMtYX2Z07LzCErFRdaubMfNfuA05m8QnO/3w6XRdbQaESCs2Vefs6Vq+Moz7NXX3EGnipQVCE0XXRXbogIV+g/pAA5F/ZwjbFrX9gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230677; c=relaxed/simple;
	bh=I33hDMolsTYHOsOLYh3cBoC2Pc3VcSeinlvAeJtE4RE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A983htg6iiv3+ZhlzXT5sOcWeB0r81x6ffEU9IGzTwamh+npMM8LgcjEpc5oOtR6TM0cMt2coz2siRLWzHpLoyd9yubt1EzizaLKwA8Wogl9e1yCERmE81LNrBLHTlbAd9a96VQ5pGYNqx2Y/BoLVuVP1bpAnB2sQp0R7mM4ScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cLPgnPHu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i6vqle7c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qqr8B32B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MmhBjLli; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cLPgnPHu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i6vqle7c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qqr8B32B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MmhBjLli"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3102521C5A;
	Sat, 12 Sep 2026 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789230670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AE/xlNX4WrC7Uvn0Bu2PGQKLK9izSheIlgZ384504g=;
	b=cLPgnPHuGMkz48U3TELjAw/4sZz8j1U1SkW57TTx7t46HF4xjpz5c3wCksFHle5lbCAmba
	RP4fTSnqHsGThdoutClMwJPX5qOfLpVMmVc79ODKk+/ZGAnv8QEOgat+23saVAnm2758Dg
	6ii9Upfrb4vlxq89cTLmUiCPzYGqWyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789230670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AE/xlNX4WrC7Uvn0Bu2PGQKLK9izSheIlgZ384504g=;
	b=i6vqle7ci+FFMaFY03NyYP+wQx/aefBpOCjCjuhhDv6MKfLRb5BTIiVvn9XSHhE0oLeFb8
	9qYKQVt+Icdj6OAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qqr8B32B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MmhBjLli
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789230666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AE/xlNX4WrC7Uvn0Bu2PGQKLK9izSheIlgZ384504g=;
	b=qqr8B32Bbn0QeYPtHdwH6EXtXz2n+KMXAYphMjB2iJRZ7bXK1iNaI3Smc4xP44lpG+eYc4
	++N9w+x+ghd7AznAT6bRjN0j4OnxOREzBz4Vv3t1oWZOnxeXRkJIUlmDevmvTcN9O66CJe
	WopY61ysoNphiysew2aZN8BXyozilJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789230666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AE/xlNX4WrC7Uvn0Bu2PGQKLK9izSheIlgZ384504g=;
	b=MmhBjLliGEERinTUIPoutpfeasc/A6jT5s9/gbTkLf4QMiBprdzIAydgvWnRWcCx4Gon9P
	nSj09GVUmuEHXYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A937913687;
	Sat, 12 Sep 2026 16:31:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jZXCJkl+pWrkbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 16:31:05 +0000
Date: Sat, 12 Sep 2026 18:31:05 +0200
Message-ID: <87wlsq1lfa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: cedalion@bugs.sh
Cc: linux-sound@vger.kernel.org,
	"Jaroslav Kysela" <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] sound/usb: out-of-bounds in prepare_playback_urb()
In-Reply-To: <22xPn8drvIUtYgVeQnBiNqXuevOTpBAjepLz@bugs.sh>
References: <22xPn8drvIUtYgVeQnBiNqXuevOTpBAjepLz@bugs.sh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 3102521C5A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Sat, 12 Sep 2026 04:09:23 +0200,
co wrote:
> 
> This is a bug report, not a patch submission.
> 
> We found a bug reachable in:
> 
>     path    sound/usb/endpoint.c` (the overwrite) and `sound/usb
>     crash   out-of-bounds in prepare_playback_urb()
>     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> 
> Config, environment, the sanitizer report and a C reproducer follow.
> 
> == Notes ===============================================================
>     If you fix this bug, this tag credits the report and lets us
>     close it on our side:
> 
> Reported-by: co+8eacd4fa193b1b28@bugs.sh
> 
>     Everything in this mail is validated by the reproducer below.
> 
>     We also hold an unreviewed LLM-generated analysis and candidate
>     patch. The same reproducer panics the unpatched kernel and runs
>     clean with that patch applied. Use it as a starting point, or ignore
>     it and write your own:
> 
>         patch.diff  https://bugs.sh/b/8eacd4fa193b1b28/patch.diff
>         report.md   https://bugs.sh/b/8eacd4fa193b1b28/report.md
> 
>     A guide to taking it from here to a sendable patch, including the
>     trailers to add: https://bugs.sh/patch.html
> 
>     Happy to test patches. Complaints and suggestions about our work
>     are welcome at:
> 
>         cedalion@bugs.sh

The suggested patch looks reasonable.  Could you just submit it in a
proper format for upstream (after verifying that the issue still
happens in the latest upstream)?


thanks,

Takashi
