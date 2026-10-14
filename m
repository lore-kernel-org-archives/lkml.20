Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB435028C;
	Wed, 14 Oct 2026 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958434; cv=none; b=OeHa4tMXUhS+upbhZKlMre8KbrwM7glVK9QDlhPkloE0gGaW3BNtfruJijovX72+q1nHTpzbLwXseBeVABGLF40BYHUNQ9WTgn4BMSuIMgnfUX4gmCL1AK+o97CnUSLbcdpwBGhhxXzNtpdxZnOHrHaGmcnZ4aAQ+ZjQP5lfsu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958434; c=relaxed/simple;
	bh=KSSqLvH9WSuL8Unh0gxKrZgVUBw8RKEXwsvUjnzY130=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FI9LVn7Ps4u1zznzBG9iKyaXRVanjVs56lwQLFsMbhvHZgLfNxoHS46M903y8xC6IiXY2RaXVX8yAxcTxqMIRFGC5jcciN0aAxrNHQKFHGBA/6s1MZGhZhyJsaC+iGIOVcLWvO7H9eDNC9Swgp314nWj8RqohUM7nxaDWAikSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=STSmBkhu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Znv+NkLQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=STSmBkhu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Znv+NkLQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="STSmBkhu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Znv+NkLQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="STSmBkhu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Znv+NkLQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D3381F7A9;
	Wed, 14 Oct 2026 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Liujq5LLPhQjPz5ukR3AWNUuIC3Zrdas/i2V5vOgBLo=;
	b=STSmBkhuV0TNC/UP6nAZxY07uXZkEiWs0o/I5snBpW27yqZVDNMBNOa7tOBRbdDKECYhzb
	ur+mG+qXcOVBcNOT9N5geMZGQMpxZYJYktJy242HLBYA0DU4v2ho6TfqZenI8N+pKjpNN1
	Ap5TIsD3SMLtXQ8YIM5v9GP0qJUEsW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Liujq5LLPhQjPz5ukR3AWNUuIC3Zrdas/i2V5vOgBLo=;
	b=Znv+NkLQUa+gyYAQ1yUqwzCeJ4VnvTO715TZq27wT2AKxHigO02pWo/ShO9rW6m/vwUro5
	hjYwCtbeOxkBKFDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=STSmBkhu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Znv+NkLQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Liujq5LLPhQjPz5ukR3AWNUuIC3Zrdas/i2V5vOgBLo=;
	b=STSmBkhuV0TNC/UP6nAZxY07uXZkEiWs0o/I5snBpW27yqZVDNMBNOa7tOBRbdDKECYhzb
	ur+mG+qXcOVBcNOT9N5geMZGQMpxZYJYktJy242HLBYA0DU4v2ho6TfqZenI8N+pKjpNN1
	Ap5TIsD3SMLtXQ8YIM5v9GP0qJUEsW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Liujq5LLPhQjPz5ukR3AWNUuIC3Zrdas/i2V5vOgBLo=;
	b=Znv+NkLQUa+gyYAQ1yUqwzCeJ4VnvTO715TZq27wT2AKxHigO02pWo/ShO9rW6m/vwUro5
	hjYwCtbeOxkBKFDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 123EC1368E;
	Wed, 14 Oct 2026 06:13:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4pi7Np4dz2q8JgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 06:13:51 +0000
Date: Wed, 14 Oct 2026 08:13:50 +0200
Message-ID: <87ecdsg675.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ALSA: usb-audio: Use fixed control index for us16x08 mixer elements
In-Reply-To: <20261013120528.52586-3-tiwai@suse.de>
References: <20261013120528.52586-1-tiwai@suse.de>
	<20261013120528.52586-3-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 4D3381F7A9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 13 Oct 2026 14:05:23 +0200,
Takashi Iwai wrote:
> 
> The callbacks for us16x08 mixer elements assume that id.index points
> to the channel to be operated, and the assumption is correct for now.
> However, since the kctls are added via snd_usb_mixer_add_control() and
> it looks for the empty slot if the same control name is already
> present, in theory, the index can become more than the channel numbers
> (if a conflicting name really happens).
> 
> Since the mixer code in us16x08 doesn't need the search for an empty
> slot but requires the fixed index, this patch changes slightly how to
> assign the kcontrols.  Now, a new argument is added to
> snd_usb_mixer_add_list() in order to disable the empty slot search,
> and use it in us16x08's add_new_ctl() helper function, instead.
> 
> Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Obviously the main part to skip the empty-slot search was missing in
the patch :-<

Will resubmit v2 patch.


Takashi
