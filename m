Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6E344DB5;
	Mon, 12 Oct 2026 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788980; cv=none; b=FwMoYGk93d0Nop/yggAj4qVOE2D3JuKPhB0LkQfY6MF9eC5V9zoBR1lTl0b3V5LX3IY4E0q9vgKyrGvW2ixKOD8GZ4vW3WxxIB7JtxMJVxAIb4E+ViEgxXva/IucGpqDoLrc8wUBMEUG6A5c5hCW2FkUX51wYb6rKQWNgERn3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788980; c=relaxed/simple;
	bh=G8/2m8HcDkzvwnQpwSmjVqiWNhB3PJysmfZoDjw4H6A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVnzRp2eR4ibwdIHWZgX6jmpDY85cui7q+1lxxeof2ZODgZ0lBQpWmDE/Jqw5q8++0C5MW4ECkf/qZlD8x0kCPZC09iY3ZcwIWLcit2baXrCIIgBEflk22ATRoVE3fVJxqSAnd8+e5Z09yhyk2wVb+GqVLg71DnQihAigG0o4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dAAUErpC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cynu4viO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dAAUErpC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cynu4viO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dAAUErpC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cynu4viO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dAAUErpC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cynu4viO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 053B821E71;
	Mon, 12 Oct 2026 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791788977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn/mQNjc1pWtPSQdT4/uMncvR8ogSnlywwtuhjqwtlQ=;
	b=dAAUErpCj++hJN+aOQn4OxPY8M54LkXDLSvxSj86Qh5Vm1piEMPgBJ3MKbbw0QvDrJ1acY
	N1OfTR3X6KO2xSJHHmMLOVPU2Kz9nCF39sH2/J3G54Ua92pdZBuFyO2GDn1YwcbvyHsoJD
	uM9yTfJJ87JXOtGr0B5dVtnZZNrAvOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791788977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn/mQNjc1pWtPSQdT4/uMncvR8ogSnlywwtuhjqwtlQ=;
	b=Cynu4viOLr48Hri9ut4X9SGHRw0Giq8xtfEeaJSTtdE0wujIVHcq0KUGlaCijxTuhE6Ha9
	q7PQFXXkqqehCzCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791788977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn/mQNjc1pWtPSQdT4/uMncvR8ogSnlywwtuhjqwtlQ=;
	b=dAAUErpCj++hJN+aOQn4OxPY8M54LkXDLSvxSj86Qh5Vm1piEMPgBJ3MKbbw0QvDrJ1acY
	N1OfTR3X6KO2xSJHHmMLOVPU2Kz9nCF39sH2/J3G54Ua92pdZBuFyO2GDn1YwcbvyHsoJD
	uM9yTfJJ87JXOtGr0B5dVtnZZNrAvOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791788977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn/mQNjc1pWtPSQdT4/uMncvR8ogSnlywwtuhjqwtlQ=;
	b=Cynu4viOLr48Hri9ut4X9SGHRw0Giq8xtfEeaJSTtdE0wujIVHcq0KUGlaCijxTuhE6Ha9
	q7PQFXXkqqehCzCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7C2813408;
	Mon, 12 Oct 2026 07:09:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eBQnH7CHzGr/TAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 07:09:36 +0000
Date: Mon, 12 Oct 2026 09:09:36 +0200
Message-ID: <877bjniedr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>,	Takashi Iwai
 <tiwai@suse.com>,	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Use the allocated major number with major=0
In-Reply-To: <CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com>
References: <20261011221350.1690703-1-aliamemis@disroot.org>
	<CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 12 Oct 2026 06:32:47 +0200,
Bui Duc Phuc wrote:
> 
> Hi Ali , Takashi-san,
> 
> >
> > Since commit bd8f21876189 ("ALSA: core: propagate actual error code from
> > register_chrdev"), alsa_sound_init() only treats negative values from
> > register_chrdev() as errors. With the major=0 module option
> > register_chrdev() allocates a major number dynamically and returns it
> > but snd_major and the devices still use 0. The devices are then
> > created without device numbers so no /dev/snd nodes appear and sound
> > is unusable.
> 
> 
> Note that major=0 has never worked, even before bd8f21876189: the old
> code treated the positive return value of register_chrdev() as an
> error and failed with -EIO. bd8f21876189 only changed the symptom.
> 
> So this patch adds support for a dynamic major rather than fixing a
> regression. Takashi-san, is a dynamic major something ALSA wants to
> support?

No, it's supposed to be only the fixed one.

If there is a real demand, we can extend the implementation, but I
don't know of such a request.


Takashi

>  If not, rejecting major=0 with -EINVAL might be simpler.
> If it is kept, the Fixes tag is fine since the patch depends on
> bd8f21876189, but please mention in the changelog that major=0
> never worked before.
> 
> Best regards,
> Phuc
