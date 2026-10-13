Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D523C51D;
	Tue, 13 Oct 2026 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874910; cv=none; b=ACbljryHri+iThSc8hB1MzYpsuhVp3UFMW6nwBWWD7tYFaA8vxhQg7z2bztfl58oIhPV5XibsfXdrOvPcms/QRq9mH1fNt4CLenfrMFSFsLbPdEJw/uy2yXk7qJ294RakMLsHnks9LMZap/HzU9xUGORWnqLOz2paD1Gm2If8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874910; c=relaxed/simple;
	bh=+UPy/6krrTstZIJcIRr+67NPGDaB4I5n1hfTassAHUA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJnmPoNDG87B1YnAcrGAz/Tg/uZ1hoeDalHqYzg4qBm0ivC8mfP793YJdilc5Tz1fTzrZzoHXE4cNFHXLhoJejis/uiE5/rqbGsOTDSqDdgH8cYd3HFIRmOj/tLge5UBQjCOq44hfrwFQskqeMLvCMGe+wlzM4MNcroa1bkh6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UD079zL6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mwnM5NZr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UD079zL6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mwnM5NZr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UD079zL6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mwnM5NZr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UD079zL6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mwnM5NZr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 904B721F74;
	Tue, 13 Oct 2026 07:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791874906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIBB+mMs3l3hO4ztZ2Dclh+qECMa9VM5UD8OyPCvaq4=;
	b=UD079zL62yuhyqQHDySMvwBs+cXXkiFXrRFPYtCkNTywO6zg4VXZVavh2ICMmXDGNOd8/e
	k1vhkVAYdfNdRWGsTu1hHh8LXokehf7Tvx0BwsNDqClQlx5SJXApjPZD4mPQ9AHK3EhrBx
	hsBRwyOy6+5tQoocB5G3uziCJg3/g/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791874906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIBB+mMs3l3hO4ztZ2Dclh+qECMa9VM5UD8OyPCvaq4=;
	b=mwnM5NZr9sxCZDLV1IzJy5871X08ZQDtxBz8NSbxDSYRrB3jUQUalslOoTxL6ds/0buaM2
	4u9zZS/SBgQbijCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UD079zL6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mwnM5NZr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791874906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIBB+mMs3l3hO4ztZ2Dclh+qECMa9VM5UD8OyPCvaq4=;
	b=UD079zL62yuhyqQHDySMvwBs+cXXkiFXrRFPYtCkNTywO6zg4VXZVavh2ICMmXDGNOd8/e
	k1vhkVAYdfNdRWGsTu1hHh8LXokehf7Tvx0BwsNDqClQlx5SJXApjPZD4mPQ9AHK3EhrBx
	hsBRwyOy6+5tQoocB5G3uziCJg3/g/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791874906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIBB+mMs3l3hO4ztZ2Dclh+qECMa9VM5UD8OyPCvaq4=;
	b=mwnM5NZr9sxCZDLV1IzJy5871X08ZQDtxBz8NSbxDSYRrB3jUQUalslOoTxL6ds/0buaM2
	4u9zZS/SBgQbijCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21B831349D;
	Tue, 13 Oct 2026 07:01:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eseHOVnXzWrERAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 07:01:46 +0000
Date: Tue, 13 Oct 2026 09:01:45 +0200
Message-ID: <87ecduozhi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] ALSA: hda: intel: Don't free card in the probe work
In-Reply-To: <20261012162841.1879278-1-aliamemis@disroot.org>
References: <20261012162841.1879278-1-aliamemis@disroot.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 904B721F74
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[40b06a86af225236fdb4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Mon, 12 Oct 2026 18:28:16 +0200,
Ali Ahmet Memiº wrote:
> 
> If the delayed probe fails, azx_probe_work() frees the card and clears
> the drvdata. azx_remove() reads the card before it waits for the probe
> work with cancel_delayed_work_sync() so when the device is removed while
> the probe work is running, it frees the card again after the work has
> already freed it.
> 
> Only disconnect the card in the work so that its slot is released right
> away and leave freeing it to azx_remove().
> 
> Fixes: 39173303c838 ("ALSA: hda: Free card instance properly at probe errors")
> Reported-by: syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=40b06a86af225236fdb4
> Signed-off-by: Ali Ahmet Memiº <aliamemis@disroot.org>

Applied to for-next branch now.  Thanks.


Takashi
