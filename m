Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBB5255F52;
	Sat, 10 Oct 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626148; cv=none; b=qv2hk/x8DITnjmHSSJfnZ4oHxR049OlH0kxWStvmmvi7VmYvMVwhUYtZw/kf+aisylGvU3hilqGXU86ss7sVHFLnAjTCHrwEtJsF91rEKrfZbM+RSsgx6N28+lPK1kyrs4I7//zh0uPDDsz7NGkxPi6GiJrhGzuQIiYkym5dsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626148; c=relaxed/simple;
	bh=YO2iWgGv9xGeb7MX6PZ+w6lhEFWOYyw+TF/AXOlQQxU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcINta+2gnN1R/1Q0tlRkf8z7yC+rKmlkR9+H8yn4uRaUM3CfKAzsX6W3LtfnFa2bbwsfepPuciKdijiPtQ2t8NfkH28xoGP94ktTw7qqEwaJDYqZrdbd0X/ld2ZRrIZ90d9FIICglA6kdHiCnTWfYk05flarPtZAzOMqPAqroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sNX3xsjh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jjg63zoe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sNX3xsjh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jjg63zoe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sNX3xsjh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jjg63zoe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sNX3xsjh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jjg63zoe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1CD7021B41;
	Sat, 10 Oct 2026 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791626145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cfLi3/Ixvg49fGLvP1JGCdWOqsFHDt7ZuWMxu5AN9bI=;
	b=sNX3xsjhegX2cdN9SLBmGyh+aIwSetB80SUDe2SzkGNCzbwu4Q/pT7hfUFgrMaFB9CQtii
	vp4yjV7pr1B7DIgzqCGA3c0B1IbKmrERvuyZtO9+CnUN3V9yXvX/6k5SBpvbk51XTwGrkK
	NJb+Uhxt/7XYi0Za83FFdoAjHBbnGi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791626145;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cfLi3/Ixvg49fGLvP1JGCdWOqsFHDt7ZuWMxu5AN9bI=;
	b=Jjg63zoeAavEOvwaSqzJ+D3c+7/4z9oHJ3nwSd5jF8OHiAIeWlG6OAHszgN5CPxVV2H4sa
	H03pz9uR7MpUBUBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sNX3xsjh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jjg63zoe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791626145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cfLi3/Ixvg49fGLvP1JGCdWOqsFHDt7ZuWMxu5AN9bI=;
	b=sNX3xsjhegX2cdN9SLBmGyh+aIwSetB80SUDe2SzkGNCzbwu4Q/pT7hfUFgrMaFB9CQtii
	vp4yjV7pr1B7DIgzqCGA3c0B1IbKmrERvuyZtO9+CnUN3V9yXvX/6k5SBpvbk51XTwGrkK
	NJb+Uhxt/7XYi0Za83FFdoAjHBbnGi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791626145;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cfLi3/Ixvg49fGLvP1JGCdWOqsFHDt7ZuWMxu5AN9bI=;
	b=Jjg63zoeAavEOvwaSqzJ+D3c+7/4z9oHJ3nwSd5jF8OHiAIeWlG6OAHszgN5CPxVV2H4sa
	H03pz9uR7MpUBUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E853133F6;
	Sat, 10 Oct 2026 09:55:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L+G+G6ALymrGPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 09:55:44 +0000
Date: Sat, 10 Oct 2026 11:55:44 +0200
Message-ID: <878q45khgf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda: Reset response counter when a verb times out
In-Reply-To: <20261010082724.1653199-1-songxiebing@kylinos.cn>
References: <20261009034040.379171-1-songxiebing@kylinos.cn>
	<20261010082724.1653199-1-songxiebing@kylinos.cn>
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,kylinos.cn:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 1CD7021B41
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Sat, 10 Oct 2026 10:27:24 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> On some controllers the HDA link reports a verb timeout and the driver
> falls back to polling mode.  After that, every subsequent verb sent to
> that codec address keeps timing out (roughly one second per verb), while
> the hardware itself looks perfectly healthy: the RIRB write pointer keeps
> advancing, interrupts are still delivered, and verbs that carry no reply
> payload -- notably writes -- still take effect on the codec.
> 
> The reason is that bus->rirb.cmds[addr] is incremented for every verb and
> only decremented in snd_hdac_bus_update_rirb() when a matching RIRB
> response is read, without any rollback for a response that never arrives.
> A controller that cannot fall back to the single-command mode
> (chip->fallback_to_single_cmd == 0, e.g. the ACPI platform, Tegra and CIX
> controllers) returns an error right away and never performs the bus reset
> that would reinitialize CORB/RIRB and clear the counter, so a single lost
> response leaves bus->rirb.cmds[addr] non-zero forever.  Each following
> verb then still gets one response that only brings the count back to the
> stale baseline of 1, and snd_hdac_bus_get_response() keeps timing out even
> though the codec answers normally.
> 
> Handle it in the core helper snd_hdac_bus_exec_verb_unlocked(): whenever
> get_response() reports an error, reset the pending counter for the codec
> address, so a late response is simply treated as a spurious response and
> the following verbs recover.  Doing it here covers all HD-audio
> controllers instead of relying on each controller's fallback setting.
> 
> Add a small helper snd_hdac_bus_reset_response_counter() for this.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

Applied now to for-next branch.  Thanks.


Takashi
