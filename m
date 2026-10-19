Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34048F83D;
	Mon, 19 Oct 2026 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397613; cv=none; b=ZVNPn483QkJ/8j1eFWBEHw1E0v0jD1g048dkLf8ZV8ELOx/3bdTPoIf4P+13L/vuE0nHbyL7waIJzuefv/RElJMtsVRIeUPbTXLyn2yPIAirixT1qInYQt+latGJo16turCi8tN9V2x/NgaDM/3ecVQ9mY4yQx7Clh7yRHSPd3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397613; c=relaxed/simple;
	bh=5uZm/5XqbMygn796jrUx0Y/7kDNB/GsvlYH16oWqEpU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MrbI/2o2m7kfyNlpymOxeK9PMtn+yxFfvwj4HqQ+B+iGeQs0gYSURq2S9rLb7CnXim0N1mdR0hBqRtcQK+AKz8qbRBF7fRUVuV0OD9f7esyXWHdB8VKwMNfC2iCUKthrcqctY4UWKAPv7YwxEi696Jm2h4UTEFw/0OGCAtKv9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L//Dli7c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gyH968Ap; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L//Dli7c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gyH968Ap; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L//Dli7c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gyH968Ap";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L//Dli7c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gyH968Ap"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7848F21E32;
	Mon, 19 Oct 2026 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792397609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUoL0IhxCStW/fLDtmLR2pk5NVVbkBeIIQVqubMlvcI=;
	b=L//Dli7cCw+SOKAx7DOIDGs351WbUWZ0UbIAPKGM7h7o4U0AdgqSjh8P9eeh6ygF5o9Wfg
	QELP2TUnKDODRo6hyXA0fINj0X+tVx5B02CducSmf8T7T1zgPwOgDlG1Yljj3kCBQpP9z7
	9nxHjrnc+EDdfMQ2nGlpvvomybC85r8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792397609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUoL0IhxCStW/fLDtmLR2pk5NVVbkBeIIQVqubMlvcI=;
	b=gyH968ApKwNji+PsRV/z/r4uV1g8WPat28akpY6ZpTy6NP9/X3VHPgDMsZMcXhtJ3XvQMw
	8OUmUo8xH7IaZmCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792397609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUoL0IhxCStW/fLDtmLR2pk5NVVbkBeIIQVqubMlvcI=;
	b=L//Dli7cCw+SOKAx7DOIDGs351WbUWZ0UbIAPKGM7h7o4U0AdgqSjh8P9eeh6ygF5o9Wfg
	QELP2TUnKDODRo6hyXA0fINj0X+tVx5B02CducSmf8T7T1zgPwOgDlG1Yljj3kCBQpP9z7
	9nxHjrnc+EDdfMQ2nGlpvvomybC85r8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792397609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUoL0IhxCStW/fLDtmLR2pk5NVVbkBeIIQVqubMlvcI=;
	b=gyH968ApKwNji+PsRV/z/r4uV1g8WPat28akpY6ZpTy6NP9/X3VHPgDMsZMcXhtJ3XvQMw
	8OUmUo8xH7IaZmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22100136CC;
	Mon, 19 Oct 2026 08:13:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Xo24OijR1WrwUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 08:13:29 +0000
Date: Mon, 19 Oct 2026 10:13:28 +0200
Message-ID: <87ld7uaz13.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v3 1/2] ALSA: pcm: Protect the unregister notifier traversal
In-Reply-To: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-1@gmail.com>
References: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
	<pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-1@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,suse.de,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sun, 18 Oct 2026 16:07:26 +0200,
Cen Zhang wrote:
> 
> snd_pcm_free() traverses snd_pcm_notify_list and calls n_unregister
> without register_mutex, although snd_pcm_notify() takes that mutex to
> add and remove notifiers. PCM disconnect releases the mutex before the
> free callback runs, so it does not protect this later traversal.
> 
> With no open OSS file, normal snd-pcm-oss removal can overlap PCM card
> teardown, for example when unbinding snd-dummy:
> 
>   PCM card teardown                     snd-pcm-oss unload
>   -----------------                     ------------------
>   snd_pcm_dev_disconnect()
>     remove PCM under register_mutex
>     unlock register_mutex
>   snd_pcm_free()
>     fetch notifier
>                                         snd_pcm_notify(..., 1)
>                                           unlink notifier under mutex
>                                         free module storage
>     read notifier->n_unregister
>     invoke callback
> 
> The free path can then read the notifier from released module storage
> or call its unloaded code.
> 
> Hold register_mutex across the unregister traversal and its callbacks.
> Notifier removal must wait until both have finished. This also protects
> the traversal if a callback releases the last module reference: module
> exit cannot unlink its notifier until the free path releases the mutex.
> Drop the mutex before private_free and the remaining stream cleanup.
> 
> Fixes: c461482c8072 ("[ALSA] Unregister device files at disconnection")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied both patches to for-next branch now.  Thanks.


Takashi
