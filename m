Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A60932D0E3;
	Mon, 28 Sep 2026 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600085; cv=none; b=FgjTUVUVFOV1HDtnLShg5kzzc0GFVBfdT7YfV7j+qjxsirGXL3JHv5sKLwDDLCrxT5JwwlNbyGKDoK5Kgt54/StEvxz3LccI8tFg/g7pN8Up02dDEgFY/d/iQcFw6s3/LQZGMNSiEhGHD+lRKw+n2jjPB3pOMwb21zu2mtEtLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600085; c=relaxed/simple;
	bh=FtPF0jlK7n5A8uvjWk+8XDvBVmKogvhDJviTeXC5RkY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BHpLvM5uju9wN7pdUNFYsB9AskJePsenjcjoJV4h/xglhkVyaeqHKPQIQqQSLzTfxDRJLnP8KSGrjPYW/nSpSEqnntPTx2jyUUufjoSrp/WzIu7tPIbNTREOWOLQRLDd4tgLtYO6OkEzDy8ZICtcAsun/BTH/peewLeQvqflnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x27Iwipx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BU7j299S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HYGvz1l9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uznDgfIm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x27Iwipx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BU7j299S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HYGvz1l9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uznDgfIm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F285B1FB9C;
	Mon, 28 Sep 2026 12:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790600077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcO2BcnU/F0JYKbCua2H+EdObpPHo/snveE2sZvh2A8=;
	b=x27IwipxcA8rcmw9dIqSlmMYFBzyqoeSdwDbzgIYc3DY+C1Rov8PwypYNxMzg1TThCd49G
	1nK8Yl13LytdXa3fmPK89Hy02uNZVra0de1iqbW1v+uEtaXvdv0u7+/npPuF/kHZUexME4
	4cgO0pN+MzKZyBR0u65h9dDtXtz6Mfw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790600077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcO2BcnU/F0JYKbCua2H+EdObpPHo/snveE2sZvh2A8=;
	b=BU7j299SaZhTyLdcxERGw8tgaJ67FOsZZzOlON2vm4Ly0t9pRrtQaGzK+W9V/8tvnO90Rs
	W+3z/u2iX//wP9BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HYGvz1l9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uznDgfIm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790600072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcO2BcnU/F0JYKbCua2H+EdObpPHo/snveE2sZvh2A8=;
	b=HYGvz1l9wOW80yvaXD3Z33qCQMK2P0cCLOXvrl5HJXF+yTwfCv363Fr2dAZgsCp5Pve8p3
	EpDRfwfQSr6L+MbX5brKmQ/Dh4WMIZMWmcQhiajevazr6b/D9/7pbbJWhecB7xys0sx+LQ
	Si7K4FeAYTWFPMLzaLjSHreWdtytMbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790600072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcO2BcnU/F0JYKbCua2H+EdObpPHo/snveE2sZvh2A8=;
	b=uznDgfImZx/E6r5e0f8iJRrEHZuzVxE3ydOjfB+St8XdmvncFuxrwt4XmQ7or80/qQh9cO
	FzIa0mC6AyiBonCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99B27133F1;
	Mon, 28 Sep 2026 12:54:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dWPFG4hjumpHFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:54:32 +0000
Date: Mon, 28 Sep 2026 14:54:32 +0200
Message-ID: <871pad5yev.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ymfpci: avoid changing control access under spinlock
In-Reply-To: <20260927135301.777475-1-runyu.xiao@seu.edu.cn>
References: <20260927135301.777475-1-runyu.xiao@seu.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: F285B1FB9C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,seu.edu.cn:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Sun, 27 Sep 2026 15:53:01 +0200,
Runyu Xiao wrote:
> 
> The YMFPCI playback trigger changes a mixer control's access flags while
> holding reg_lock. Direct access changes are not serialized with the control
> core, and snd_ctl_activate_id() cannot be called under the spinlock because
> it may sleep.
> 
> Track the desired control state under reg_lock and update it from a work
> item. Use a generation counter to serialize prepare with a pending stop.
> Cancel the work before the PCM private data is released.
> 
> Assisted-by: LLM
> Fixes: 177a7cdbd1d8 ("[ALSA] ymfpci: fix volume handling of the 44.1 kHz slot")
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Although the intention is clear, this is just an overkill.  There is
no real race, and introducing the offloading work just for using
snd_ctl_activate_id() makes little sense for this old code.

If any, we should rather make snd_ctl_activate_id() to be callable
from the irq context, instead.  But this would need a redesign of the
control-led layer implementation -- that's the very reason of being
sleepable context.


thanks,

Takashi
