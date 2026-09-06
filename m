Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4C37418C;
	Sun,  6 Sep 2026 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788681697; cv=none; b=H0mkmsxFah5z/mlfkNlb+hynzrpPxamvYXzxHtXvgN/VZYI7l3mSLJAsYAHUDl/YuWYb7zGVjGXyqHIRBORqFzgCCwXpB6w7vc7UUMskFg2ZTrVHEz/tSDDKZ7dtFEIMsOdTYSv9DZuVrFo3iepbG6+MMorMng6QGAjjc/7Xrz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788681697; c=relaxed/simple;
	bh=lispaYJXyvdYsvDoj+kW+PP2c4CzAetUpDeaeRiyTi4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTUWGx3pVMVHGRzWP+ZQrXuoj7gY3qP9SFs6ExIzCEHHS8uiD0oPp6Ot6gKv+89rWLtomIlbvWDHtSUBQpQdgJeL8OUSyijUehXrr4vugzoa/mmW9KmC9b2ciGtZBzGbQf3vKVTh0y+3U++rwxq9hpuhKXucTP1OOwRtd6O+DJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=urGshmDO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nwW7C1qH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lTmj1quW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7DEvy6Lj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="urGshmDO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nwW7C1qH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lTmj1quW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7DEvy6Lj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F4451F836;
	Sun,  6 Sep 2026 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788681690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E7bVrx7Y8l6Q0BtkNtIWmgbqwYSF3CebnyWsx+/Wj8Y=;
	b=urGshmDO5Rccb/BI4KI3fyGZ7Aybdip8L473cm5d+5FwL8Vn6GbeGCCCQbonV142+/T4qH
	7e4FxlNctuZPhCFzYkcTgEITqtDRpLLiFpXvCQuysJjYfnRsOU6u1kPC1lTL3C3lx8wDyq
	5WlRcsD7Pf2gzB69/BBLco5IdXI7SGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788681690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E7bVrx7Y8l6Q0BtkNtIWmgbqwYSF3CebnyWsx+/Wj8Y=;
	b=nwW7C1qH/gbfQNxCj2zZf4yCeVPo8T9btTk7NnFLAy5S9hmH4HkqsfG5fwsqnCMvS/nNTk
	ZbOKRkc9Rv4FlzCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788681685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E7bVrx7Y8l6Q0BtkNtIWmgbqwYSF3CebnyWsx+/Wj8Y=;
	b=lTmj1quWDk+3Bd9NH/EJpkYafqq22BasZsfDatMJ8+lbVZ0PB96sf+snoDVXLpP4eWjQDj
	ThAyfEb5nHnXH7oxKSIitza1LlTD6/pPrfgiTt1ulhJoACwRlLihHfduFsHuB8jm5RX1+U
	ln5bcOrfFBLVqnV/MzlWe4pDM0Tgz30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788681685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E7bVrx7Y8l6Q0BtkNtIWmgbqwYSF3CebnyWsx+/Wj8Y=;
	b=7DEvy6Lj5eCSiPMQgWRC/C1JPSal0D5+nRr5uKxAAfUMiatG9ZKqDVL507hZQfOMzumYeB
	RT7HXnaLYO7P0ECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8E2F13432;
	Sun,  6 Sep 2026 08:01:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id auB4N9QdnWpLaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Sep 2026 08:01:24 +0000
Date: Sun, 06 Sep 2026 10:01:24 +0200
Message-ID: <87mrtu4xm3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Adam Davis <eadavis@sina.com>
Cc: daniel@caiaq.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com,
	tiwai@suse.de,
	zonque@gmail.com
Subject: Re: [PATCH v4] ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
In-Reply-To: <20260903130521.554840-1-eadavis@sina.com>
References: <20260903115652.550250-1-eadavis@sina.com>
	<20260903130521.554840-1-eadavis@sina.com>
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
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[832ce9fa3face1b7d44d];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[caiaq.org,linuxfoundation.org,vger.kernel.org,perex.cz,syzkaller.appspotmail.com,googlegroups.com,suse.com,suse.de,gmail.com];
	FREEMAIL_TO(0.00)[sina.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 03 Sep 2026 15:05:21 +0200,
Edward Adam Davis wrote:
> 
> The epq_in_urb object belonging to the caiaq device is coupled within
> the struct snd_usb_caiaqdev. After usb_submit_urb(epq_in_urb, GFP_KERNEL)
> executes successfully, epq_in_urb is successfully added to the urbp_list
> queue of the dummy HCD driver (userspace specifies dummy_hcd as the HCD
> layer driver for the caiaq USB device).
> 
> When init_card() calls snd_usb_caiaq_send_command() which subsequently
> fails due to a timeout, and proceeds to call snd_card_free() to release
> the card, the embedded ep1_in_urb object is also freed. When the dummy
> HCD driver detects that the URB has been unlinked, it returns the URB
> (by usb_hcd_giveback_urb()), which triggers [1].
> 
> Decouple the ep1_in_urb object from the struct snd_usb_caiaqdev and switch
> to using a pointer instead. Separately allocate and manage the memory for
> ep1_in_urb to prevent the release of the snd_card memory object from
> interfering with it.
> 
> midi_out_urb has the same issue as ep1_in_urb and is handled in the same
> way.
> 
> [1]
> BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
> Call Trace:
>  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
>  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
>  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
>  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
>  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
> 
> Allocated by task 36:
>  snd_card_new+0x7b/0x110 sound/core/init.c:184
>  create_card sound/usb/caiaq/device.c:429 [inline]
>  snd_probe+0x236/0x1af0 sound/usb/caiaq/device.c:544
> 
> Freed by task 36:
>  snd_card_free_when_closed sound/core/init.c:630 [inline]
>  snd_card_free+0x138/0x1d0 sound/core/init.c:662
>  snd_probe+0x162b/0x1af0 sound/usb/caiaq/device.c:553
>  
> Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
> Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
> Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>

Applied now.  Thanks.


Takashi
