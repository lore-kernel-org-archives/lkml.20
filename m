Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAD2EF653;
	Sun,  4 Oct 2026 19:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791140686; cv=none; b=M8aTS5ZZjytkDFeDVR6q49D02Y39LIC/t0m8Z+vNiNX9XM42WRdz0WR3CpG+mQzcnLrUcFYRbrI1MAdJ+KZng9b1DxSCLxZpEQDdZl5ZN9ykiST5gB/djA4FA15v0GWSu+knMFzHOJXuXy8IOATz/XKbroK7B/HGO4LBoQYPcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791140686; c=relaxed/simple;
	bh=yixnaR0CUW/QO7jph5ccbRkHlSmwH47GxT4/sf7D7sk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwIXFVJ6TgU3x8aJJgoukzc57fZf1NEa+AnYb/bVAEhY29pk7VpEo6SjeKVPKKx8repKL2XO5XYVj55rLWl6VS5BavFC37DisUyMduQ4mmR1kjyDOEMkPO6GLC+bIUBkNeSJ4CgphhimBOB6TAd7UgyGP3zTIvcynGQhdDLivQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cgU61oW7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=apqWm+sn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cgU61oW7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=apqWm+sn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cgU61oW7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="apqWm+sn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cgU61oW7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="apqWm+sn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0909A1F387;
	Sun,  4 Oct 2026 19:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791140683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a5WwL6qwPkTRDwE0ueJLBr2QJBk5SlWBHq8as84kMXk=;
	b=cgU61oW7hQMPbAgCHUtaBNGgUa9o93M/mdWn8Ju5N9/py5YdQRaLhwg9UkpfI+k8ZxZTrb
	M40waHBbhrOdH0AbneYopMXpMi7eaSDUMNU25JSlElWicLvhT0dJKzjAuYtx3wT0cQgUMr
	2jP7cGCCeyFCWie0zedXOFm+Y69W2go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791140683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a5WwL6qwPkTRDwE0ueJLBr2QJBk5SlWBHq8as84kMXk=;
	b=apqWm+snbQwKTGgf64qFI29FHezJUknC0sENVnfePRKfOzSgDgwYnRd+HuwyByTzA5Oa7u
	o99NS/A2mH+8uDAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cgU61oW7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=apqWm+sn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791140683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a5WwL6qwPkTRDwE0ueJLBr2QJBk5SlWBHq8as84kMXk=;
	b=cgU61oW7hQMPbAgCHUtaBNGgUa9o93M/mdWn8Ju5N9/py5YdQRaLhwg9UkpfI+k8ZxZTrb
	M40waHBbhrOdH0AbneYopMXpMi7eaSDUMNU25JSlElWicLvhT0dJKzjAuYtx3wT0cQgUMr
	2jP7cGCCeyFCWie0zedXOFm+Y69W2go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791140683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a5WwL6qwPkTRDwE0ueJLBr2QJBk5SlWBHq8as84kMXk=;
	b=apqWm+snbQwKTGgf64qFI29FHezJUknC0sENVnfePRKfOzSgDgwYnRd+HuwyByTzA5Oa7u
	o99NS/A2mH+8uDAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CD26133CF;
	Sun,  4 Oct 2026 19:04:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 50XDGkqjwmpdeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 19:04:42 +0000
Date: Sun, 04 Oct 2026 21:04:27 +0200
Message-ID: <87tsn1gudg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Justin Bacle <justin.bacle@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add sample-rate quirk for Yamaha 01V96i
In-Reply-To: <20261004184618.56779-1-justin.bacle@gmail.com>
References: <20261004184618.56779-1-justin.bacle@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0909A1F387
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sun, 04 Oct 2026 20:44:45 +0200,
Justin Bacle wrote:
> 
> Signed-off-by: Justin Bacle <justin.bacle@gmail.com>

Please fill a proper patch description and resubmit.


thanks,

Takashi
