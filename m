Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B4405C2F;
	Thu, 27 Aug 2026 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837107; cv=none; b=W/76nbIL2eknvxWNbzvKm9Nyv2C2Od3j+otQW7kKoomDf1Qt/TowcwERyHUOhZ3J0nx8PKiQeqU01t6q9CkUiDELFhFQJ2DlyDBEdnjPn7OKH3E2RsmqYFbwZXZanI3O4TZUdmp3PMc/eJfk2dNSjSSLcJpAW7eDgZlsnxDSEkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837107; c=relaxed/simple;
	bh=KWrz/2iQPsQ4HYxGk2rAwCOSoqJ13qPQ+mvu/nh9kLg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlOmzrCPG9UGB/KEyuVQsGnqR9U5CqRqniJpeGDE6boz9sRnEcjKCZ1qw/tb1oioWXH0RGAow0gQ+Z7jqaliXdeMk2syj8WPiYTRyklgF0f60AHEVeN/mDu1ScgOkwCNwnFBbwcE1r/ueyAwiVZd4ezwGG5DetCBA6dCbBSZ3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A8dryX7d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XgAUMGQM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C2GWj+Kg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lCjdcWQm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A8dryX7d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XgAUMGQM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C2GWj+Kg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lCjdcWQm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DC0A21B7B;
	Thu, 27 Aug 2026 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787837085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OgTzyndZaNJwogmIdukKPE2hSwM61hUS1kXw4HUTZOM=;
	b=A8dryX7dDpGXA8o5x7fiyOYliVzfQrPrlHOjBLHGjzk4x6HBYrTqpCMiQ8ZueWceRRb8Y+
	W6wxRwUoRfgcA98q6rHCTPN4xMYLZJGNfvKuBiR1bdxFvsH6vCcjiWQNe+vFOQEPqu1IK9
	vGgSMM3fXXazUIqxOmFdWkyDlNGxlSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787837085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OgTzyndZaNJwogmIdukKPE2hSwM61hUS1kXw4HUTZOM=;
	b=XgAUMGQMw0ixyEjne6FUasy44WLA4V6e5H3vfR9rcTEigKBOfrnIBH09n3sz2W56MjdHo6
	O//PgUZZ944YrwBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787837081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OgTzyndZaNJwogmIdukKPE2hSwM61hUS1kXw4HUTZOM=;
	b=C2GWj+KgjCzdYrGksA7oOtkvrfogM3CxkGzluhVfGyYLCJLShGfnefvqdXhtEL6h4WeIPe
	33EnuY2Om9+1gK7LD6JLenOpNUloGUJVMT5Lmr4vw9g2tf2GHHI7Am4ypoapc/1BMTTnND
	iZogQlPBR8GaLOBIHvaXESZft+MCj9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787837081;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OgTzyndZaNJwogmIdukKPE2hSwM61hUS1kXw4HUTZOM=;
	b=lCjdcWQmP2XiCz0hOS7b5mOF2xiuHxKfvI3lUwcnQYpGs3tp05YAE+9yMjDt2piLO6lvSb
	buUYON5agN+frUDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 622A513354;
	Thu, 27 Aug 2026 13:24:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kc+7Fpk6kGo6aQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Aug 2026 13:24:41 +0000
Date: Thu, 27 Aug 2026 15:24:40 +0200
Message-ID: <8733vzg0h3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Don't add invalid kcontrols to LED layer
In-Reply-To: <20260827131211.11946-1-jeffinphilip14@gmail.com>
References: <20260827113951.893291-1-tiwai@suse.de>
	<20260827131211.11946-1-jeffinphilip14@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Thu, 27 Aug 2026 15:12:11 +0200,
Jeffin Philip wrote:
> 
> On 8/27/26 13:39, Takashi Iwai wrote:
> 
> >The kcontrol LED state layer tries to track the all associated
> >kcontrol elements with naive assumptions that they are readable.
> >But one can create a write-only element that has no get callback (even
> >a user element can do it), and this may lead to a NULL dereference at
> >the call chain of snd_ctl_led_notify(), as found by syzkaller.
> >
> >For avoiding the Oops, add a sanity check of the kcontrol's info and
> >get callbacks, and just skip the invalid kcontrols before assigning
> >the kctl to the LED layer.
> 
> I don't think a user can attach a device via sysfs without root permissions,
> (correct me if I am wrong).

The kcontrol can be added without root privilege.  But the
reassignment of LED-control via sysfs is only for root, so the
specific trigger pattern by syzbot is only for root.

However, in theory, it could be without root if a driver has some
built-in patterns to bind LED controls and if one would add user
elements manually later to match with it.


thanks,

Takashi
