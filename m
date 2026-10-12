Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2914AA1EB;
	Mon, 12 Oct 2026 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820565; cv=none; b=pLnd7e+ThPztHbgtZlQtDtdDbpWda1FRcLfe4S4612aqH2kdTia2lQplQSJbVR+emRXid1i8TNsdZIGmuf55dR6/xzEL6OgQDgv5HjLFROMwPxuOTZpXSHO0ngRutMXydr1Myl9isd4MR+GHAzqIK5qALNAbD8uXgNJp437Z0Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820565; c=relaxed/simple;
	bh=b0XKFcwxPXoheG5vZ6kVIkZHetEjyzcldENTlm/sZ8k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d3eeLcAFaTd9EHzxOjRn7Eymes7k71S4yr1uxnu7qOri5E7TFH745MrhZCRmzhFX1ithuQHi6/nOX74VWDMkiNWyBFdqRWKW6Nx3EJ7qbNVY0PprgtG1JE+P6Z7zbSO2Yv/P8tYyyIMTV1xpBNgEpxOuc1L43mIo1jOlQc2xoZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OZ/7OUTd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tssyn4EC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OZ/7OUTd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tssyn4EC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OZ/7OUTd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tssyn4EC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OZ/7OUTd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tssyn4EC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC31A21E37;
	Mon, 12 Oct 2026 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791820561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trxIJ6g8YDuoBjr9o+264MF/tcKAtAK/xFK7YqbRuZA=;
	b=OZ/7OUTdGoeXbmyAqD3VUDt+QtZnbh0msi1mS9S2RtgQFDWEOQN751iLBGZDv5KuIYi8Iz
	QklgBu7awPCEKZerzVH+4prIwI8OC/UALrx9Z5r5WPEeq5XlvHwA9X72QFVFXL6RJI9gIG
	RZdSxI8mUI2tLGwiTfw5H1siU0vEHN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791820561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trxIJ6g8YDuoBjr9o+264MF/tcKAtAK/xFK7YqbRuZA=;
	b=Tssyn4ECBazzwQBZSrZbOXnuS0IutOD6Py1cTGNIUD7I9PViQ+M3ufQRToKzdObwlg7r0I
	JyCR61967mySf6CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="OZ/7OUTd";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Tssyn4EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791820561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trxIJ6g8YDuoBjr9o+264MF/tcKAtAK/xFK7YqbRuZA=;
	b=OZ/7OUTdGoeXbmyAqD3VUDt+QtZnbh0msi1mS9S2RtgQFDWEOQN751iLBGZDv5KuIYi8Iz
	QklgBu7awPCEKZerzVH+4prIwI8OC/UALrx9Z5r5WPEeq5XlvHwA9X72QFVFXL6RJI9gIG
	RZdSxI8mUI2tLGwiTfw5H1siU0vEHN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791820561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trxIJ6g8YDuoBjr9o+264MF/tcKAtAK/xFK7YqbRuZA=;
	b=Tssyn4ECBazzwQBZSrZbOXnuS0IutOD6Py1cTGNIUD7I9PViQ+M3ufQRToKzdObwlg7r0I
	JyCR61967mySf6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 543ED13408;
	Mon, 12 Oct 2026 15:56:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5sv1ChEDzWrGEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 15:56:01 +0000
Date: Mon, 12 Oct 2026 17:56:00 +0200
Message-ID: <878q42hq0f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: hda: intel: Don't free card in the probe work
In-Reply-To: <20261012150949.1840175-1-aliamemis@disroot.org>
References: <20261011200648.1662935-1-aliamemis@disroot.org>
	<875wz7idx3.wl-tiwai@suse.de>
	<20261012143508.1830791-1-aliamemis@disroot.org>
	<87fqybge5a.wl-tiwai@suse.de>
	<20261012150949.1840175-1-aliamemis@disroot.org>
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
X-Rspamd-Queue-Id: AC31A21E37
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
	TAGGED_RCPT(0.00)[40b06a86af225236fdb4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Mon, 12 Oct 2026 17:09:41 +0200,
Ali Ahmet Memiº wrote:
> 
> On Mon, 12 Oct 2026 16:57:37 +0200, Takashi Iwai wrote:
> > OK, that's a problem, indeed.  How about replacing snd_card_free()
> > with *_when_closed() version that doesn't block in addition?
> 
> The work doesn't hang anymore but removing the device while the probe
> work is running hits the same UAF on the first try.  azx_remove() still
> gets the card before cancel_delayed_work_sync() and the put_device() in
> the work frees it:
> 
> BUG: KASAN: slab-use-after-free in snd_card_free+0x148/0x160
> Read of size 1 at addr ffff888007724852 by task sh/97
> Call Trace:
>  snd_card_free+0x148/0x160
>  pci_device_remove+0xb6/0x1d0
>  device_release_driver_internal+0x38d/0x540
>  pci_stop_bus_device+0x122/0x170
>  ...
> Freed by task 30:
>  kfree+0x1e8/0x5e0
>  device_release+0xcf/0x3c0
>  kobject_put+0x169/0x320
>  azx_probe_work+0x495/0x1fa0
>  process_one_work+0x937/0x1800
> 
> > Staying the card means that the card slot will be kept, then if you
> > probe another card afterwards, it'll end up with assignment on another
> > card slot.
> 
> What about calling snd_card_disconnect() in the work on failure?  It
> releases the slot right away and the card is still freed only in
> azx_remove():
> 
> 	if (azx_probe_continue(&hda->chip, false) < 0) {
> 		hda->init_failed = 1;
> 		complete_all(&hda->probe_wait);
> 		snd_card_disconnect(hda->chip.card);
> 	}
> 
> With that, snd-dummy loaded after a failed probe gets card 0 and 20
> rounds of the remove race were clean with KASAN.  I can send v2 if this
> looks fine.

Yeah, that sounds like a plan.
Care to resubmit a fix with that approach?


thanks,

Takashi
