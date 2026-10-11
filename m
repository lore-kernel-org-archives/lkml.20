Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67400285058;
	Sun, 11 Oct 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708879; cv=none; b=TgikSC6C2o6MfD5yCI6zR7Jx5JTt9+0MYCmDO+hTak59sAGt89MDGGjvNTBxJD9M1zJcQAyOnXDRl0i9a7uco16mrqD/mHhjuTgJOovBjY6YBg/rsIn4tRNfJntHszvhkgwhecm8LJtiJxA/ifKJapNxQW7zzODLJTBHjbdEsVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708879; c=relaxed/simple;
	bh=lY7kJdsZfizVwIre8E04zdZEnx3zl6cpYLp9Y+wbCVI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxR48XOyxAnc3I9Oju+IIYXi1OOrp7j1ktYhIf1Xo+pqIACAIaX3xPihK6Uw7GS/6U13dKUsz7xSppBAMLOfE2RRBkdUA8pEF6K23tJuVSM1FCEJdUiRvqevz9zSPJNhaQ14DOrzg8h9g6HAvZVln6FTkohyn5o9QhHL5G6WJis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V9p08Y7x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XPzNdnbk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V9p08Y7x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XPzNdnbk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V9p08Y7x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XPzNdnbk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V9p08Y7x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XPzNdnbk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FF551F750;
	Sun, 11 Oct 2026 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791708876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w1pxr9MTsHHFTXYtgacQY33kCH0QBqncqtGZsBJ94rw=;
	b=V9p08Y7xmMMlt9fcN1RIIZy3gWLsO5vJuwtRLcXGYQnX5UWzEh5RUvi6TztHqiHKwGrJm7
	nuNDmbYsR3GXZb6zyVVvSInR2AnnbUhf8BuNMFnC8/odBbsFIEMGi5bEJdKvV9zFm2WDCD
	erUkHH7/ujUpuepdgHI4vUu3+ZAvIfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791708876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w1pxr9MTsHHFTXYtgacQY33kCH0QBqncqtGZsBJ94rw=;
	b=XPzNdnbkmbMug+vazO8+YniEmcqXLeKUL0ygoqeH9IyQDQ39ULRM2SU74UFcRBkpjMVMXQ
	E6czpHBFuHJLuICw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V9p08Y7x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XPzNdnbk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791708876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w1pxr9MTsHHFTXYtgacQY33kCH0QBqncqtGZsBJ94rw=;
	b=V9p08Y7xmMMlt9fcN1RIIZy3gWLsO5vJuwtRLcXGYQnX5UWzEh5RUvi6TztHqiHKwGrJm7
	nuNDmbYsR3GXZb6zyVVvSInR2AnnbUhf8BuNMFnC8/odBbsFIEMGi5bEJdKvV9zFm2WDCD
	erUkHH7/ujUpuepdgHI4vUu3+ZAvIfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791708876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w1pxr9MTsHHFTXYtgacQY33kCH0QBqncqtGZsBJ94rw=;
	b=XPzNdnbkmbMug+vazO8+YniEmcqXLeKUL0ygoqeH9IyQDQ39ULRM2SU74UFcRBkpjMVMXQ
	E6czpHBFuHJLuICw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA77F13408;
	Sun, 11 Oct 2026 08:54:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pzqQH8tOy2riFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 Oct 2026 08:54:35 +0000
Date: Sun, 11 Oct 2026 10:54:35 +0200
Message-ID: <87h5isipmc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven 'Steve' Kendall <skend@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
In-Reply-To: <20261007-fix-headphone-plug-cirrus-dell-v5-1-c28146b18d5c@chromium.org>
References: <20261007-fix-headphone-plug-cirrus-dell-v5-1-c28146b18d5c@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1FF551F750
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 07 Oct 2026 02:31:24 +0200,
Steven 'Steve' Kendall wrote:
> 
> On some models like the Dell Inspiron 15 3520, jack
> detection does not work. This patch switches to
> delayed work to fix jack plug on Chrome OS for this model.
> 
> Assisted-by: LLM
> Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>

Applied now to for-next branch.

The UAF issue reported by Sashiko can be ignored, as we now disable
the unsol event globally in the HD-audio core side at the removal.

The race condition about the hardware state might be true, but it's
rather a minor issue and can be fixed later if it really matters, too.


thanks,

Takashi
