Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179B4B66EF;
	Thu,  3 Sep 2026 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446289; cv=none; b=GEuLqV031HQT5z29MHWJ+Bo7YjROHCbk5LPg100jfgOQnKBpf3MkneTSygcJas+dSM8NZdplJkjo57Mzirs8264SestCsgXXJ1Ya2Eqtqng0pRJvfUhRIGJ7SqM2CZF1g2exUJoXNIGm1HjEu8qmjR6GV6Q4ADEdNDu/2GPlu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446289; c=relaxed/simple;
	bh=5IDUCm3/c6KrZ9HpzncmlBCcPtf0jMBAVY/kGndV6SA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tWJsxNk9d9Bgr2hjmupWp6FHK4E12OLES70D1xjycoFPTdflfdNQ0lO/4fKD14CKLAUOrqt8IIrNd5YsY2LHyWZizuOSA/ZwWBKo07uAYqSNivQZq/I1U/i9qjCzm/PBIQ9Dg4fkpyc7bNbN0EpR+XWIBGfluKxekeYoj6dULJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EABflAnv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y4vw+3Of; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TlwseHHX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MofL51L+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EABflAnv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y4vw+3Of";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TlwseHHX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MofL51L+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 89ADE21EC1;
	Thu,  3 Sep 2026 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788446276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NoIe1+StESLxiqdohgf6Gkohhov5f/zGPRJzVWWUMJY=;
	b=EABflAnv+VzsI1PsdtEcrQGKurUXloXp7tNnDfpZaapOYIR0BSsTWRZIJpjZbXlXuxzFBV
	oeN6oclLrlMxb7uwl4LwbAqBujD8+5uClI9+8afyw8HGDInlD3NeldC87S6MDo24PxV4u8
	3Yb5gBEk0F8yQ/B2zf5dbhpMNa36V+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788446276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NoIe1+StESLxiqdohgf6Gkohhov5f/zGPRJzVWWUMJY=;
	b=y4vw+3OfKFIPm3CnR1ywuxb59vLvGO0HEpeiluTzzPQE6IXnuW/ZwnZUXqhnVBjH1WaK7v
	Im8OjTx3vH03rNCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TlwseHHX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MofL51L+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788446272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NoIe1+StESLxiqdohgf6Gkohhov5f/zGPRJzVWWUMJY=;
	b=TlwseHHX+lOPF6cuL3NY30UdiIDoTf34mV5ltvcl8gKFOFl8ZHyk2SbYi/Un0QnY5ky6rP
	5pKDqGeEuurUJ7jQyUfKGj1e6aNrB46s0pgeFFcfpwI2fCE7QFhnv/J6BzmBVTV9XwRXZQ
	ZwciWya1dKN8N/4DqFy5GoQpo6y6MMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788446272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NoIe1+StESLxiqdohgf6Gkohhov5f/zGPRJzVWWUMJY=;
	b=MofL51L+lkYsgVobSaJbS99No+p0rRBs8MgY5BlLojIlkD8uxw0CUPis8ibqdRnC2oU+Sz
	wg9cDhtLrD2W3pCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFFAF13738;
	Thu,  3 Sep 2026 14:37:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6cpkMT+GmWpuHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 14:37:51 +0000
Date: Thu, 03 Sep 2026 16:37:51 +0200
Message-ID: <87y0di764g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>,
	bolewara@gmail.com,
	devnull@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com,
	Daniel Mack <zonque@gmail.com>,
	Takashi
 Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: DIY allocation or embedding of URBs in larger structures
In-Reply-To: <20260903130757.0668310a.michal.pecio@gmail.com>
References: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
	<6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
	<20260903112417.21b76017.michal.pecio@gmail.com>
	<87o6ee8y9e.wl-tiwai@suse.de>
	<20260903130757.0668310a.michal.pecio@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 89ADE21EC1
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,syzkaller.appspotmail.com,gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,suse.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[832ce9fa3face1b7d44d];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO

On Thu, 03 Sep 2026 13:07:57 +0200,
Michal Pecio wrote:
> 
> On Thu, 03 Sep 2026 11:44:45 +0200, Takashi Iwai wrote:
> > On Thu, 03 Sep 2026 11:24:17 +0200,
> > Michal Pecio wrote:
> > > So what happens here is that USB core continues to use a URB after
> > > completion to implement things like usb_kill_urb(), so URBs are
> > > reference counted. Then core decrements the count - one more use.
> > > 
> > > If a driver waits for completion or even usb_kill_urb() to return
> > > and then proceeds to free the URB's storage, this becomes a UAF.
> > > This driver embeds 2 URBs in its priv and does just that.
> > > 
> > > A URB can only exist as an independent allocation, core will free
> > > it if upon finding zero reference count in such case.
> >
> > So, IIUC, now the URB *must* be always allocated via usb_alloc_urb()
> > and an embedded URB isn't allowed?  If so, we'd need to address other
> > drivers, too.
> 
> Yes, that's basically the case and actually has been for a long time.
> 
> The only thing that works is for both USB and the driver to call
> usb_free_urb() and whoever does last will actually free the storage.
> This means URB can't share storage with anything else.
> 
> Some drivers got away with making URB the first member of a struct
> which is freed together with it. AFAIK this pattern doesn't crash, but
> it's deprecated too because it puts a flexible member (in the URB) in
> the middle of (the outer) struct.
> 
> This pattern here in caiaq has always been one race away from UAF.
> Maybe it wasn't very likely to happen, but stuff like PREEMPT_RT and
> hypervisors can insert unexpected delays anywhere these days.
> 
> Greg KH puts it thusly:
> https://lore.kernel.org/linux-usb/2025120716-sway-hypnotic-8cb6@gregkh/

OK, I'll send the fix patches for the rest of sound drivers.


thanks,

Takashi


