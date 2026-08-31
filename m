Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26D3CB55E;
	Mon, 31 Aug 2026 08:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163482; cv=none; b=GvIQ39rIcQtg4ddTKI/p1XCeY0qJ/ySzq4cgLJXfpKBZ6Sp3Gndlu7iJH1HRR5/iD5g0M4jqG9ZJSbbFYDQ8j6Q0x4eSoQwDD8PnMhQl0BYJgNwo9PBVeHpLK4OC0UU+Noyw1Ejba9bdGNL22ly0YCOVxDWXlmKa6e6H3jCQO38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163482; c=relaxed/simple;
	bh=GwtANNND55W6eP6eX71g8mL2LKhcEeq1I1nuJbKpjO4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJyIPxA5v4FZJClV3scMEeZtyvMGT7btnv/xMbyAgM26DDw1C7Y98yDoN3SnH7sFigIYlk4v5ot6vB3Qy9q0NQxiF97e+fHMz44dci/RNhklpF0ei244MXleClwH0fvb8iyFdhjb6FEjAToGmREaP1u7MOJVZPlY2FQKDEVta5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KuC7ATox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HbSNE5QT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w5PldHDK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoMkYxUV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KuC7ATox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HbSNE5QT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w5PldHDK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoMkYxUV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2569622340;
	Mon, 31 Aug 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788163469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoovuQsKKNnZGQBlkft9L3Qj3EdU2+dn0FyPc+EXekY=;
	b=KuC7AToxUCc5hMx8h0RdC3u7BOMpJ1tBea4hvbTH1pJmPfSh3IFEb5W6OaEma3mhUbqVKO
	tGaE7c/9aaAfOZLzcOofH/joFtXaNYXxtUaCZY70vL1qXlQswBGm4x+oXGmhB6EnZYR1iR
	ye2GT0t61UOg4yZA8qC3aOkiItMeDPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788163469;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoovuQsKKNnZGQBlkft9L3Qj3EdU2+dn0FyPc+EXekY=;
	b=HbSNE5QTBK7wgqsLnD2exNqU+WFoFjoFDQS8BtQpv4eHFz6PlaEBlrH3xcyeQ9tO1H9LWy
	lxEs9Aeik18X59BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w5PldHDK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HoMkYxUV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788163465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoovuQsKKNnZGQBlkft9L3Qj3EdU2+dn0FyPc+EXekY=;
	b=w5PldHDKO+/zGsD1OwjWpvQ7HuVT21pZmZhdnBWjRgZL4aUHtilIh+iAY/bBcQFaz2kS/h
	EOFUIhwwLU/9EYfkCaG+qJHTKnzRKazesFs2wuFje49VtKu7NzhsXYxHezxBAs1GrkDHo3
	XMBynPjrWYgs1FrINjl8zna+ahoWAyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788163465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoovuQsKKNnZGQBlkft9L3Qj3EdU2+dn0FyPc+EXekY=;
	b=HoMkYxUVubB/MmPDOdd6qPNeDY95pIZUsVBKr+Xc+5bFzAEvzht84Zoecj8w0ygFekq/AW
	8j+xAHbW1I3rT4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A154D13515;
	Mon, 31 Aug 2026 08:04:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 79oiJog1lWqveQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Aug 2026 08:04:24 +0000
Date: Mon, 31 Aug 2026 10:04:24 +0200
Message-ID: <87h5kasol3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,	Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,	Asahi Lina <lina@asahilina.net>,	Chris J
 Arges <chris.j.arges@canonical.com>,	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,	Roy Vegard Ovesen
 <roy.vegard.ovesen@gmail.com>,	fenugrec <fenugrec@mail.com>,	Frederic Popp
 <frederic.l.popp@t-online.de>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] ALSA: usb-audio: guard device-specific control transfers
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
	<20260827232143.149197-1-mrwillporter@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2569622340
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
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,mail.com,t-online.de];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,b4.vu,asahilina.net,canonical.com,gmail.com,paraair.de,mail.com,t-online.de,darknavy.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Fri, 28 Aug 2026 01:21:37 +0200,
Will Porter wrote:
> 
> Takashi confirmed that hardware access through usb_ctl_msg() should hold
> snd_usb_lock, and suggested guarding scarlett2_usb() as the central point
> for Scarlett2. This series adds that protection to the six device-specific
> paths identified by the RFC audit.
> 
> Each guard covers a complete synchronous USB transaction. The guards are
> outside private data and USB mutexes when a resume callback could affect
> lock ordering.
> 
> FCP holds one reference across its complete initialization sequence so
> runtime suspend cannot intervene between step zero, notification-URB setup,
> and the two initialization commands.
> 
> Scarlett2 uses a dedicated unguarded helper only for the suspend-time config
> save. That call already runs inside the USB suspend callback. The guarded
> path covers normal controls and hwdep operations. The series does not claim
> to hold a PM reference across Scarlett2's asynchronous flash-erase interval.
> 
> The affected devices were unavailable for runtime testing. I reproduced the
> failure mechanism with an Audient iD14 MkI mixer path before the RFC. I then
> built the complete sound/usb/ directory with the configuration from the
> running x86-64 distribution kernel (7.2.0-ogc4.1.fc44.x86_64):
> 
>   make olddefconfig
>   make -j4 W=1 sound/usb/
> 
> All six changed objects compiled without warnings, and the build linked
> sound/usb/snd-usb-audio.o. The series also passes scripts/checkpatch.pl
> --strict with no errors, warnings, or checks.
> 
> Link: https://lore.kernel.org/r/20260824230302.27965-1-mrwillporter@gmail.com
> 
> Will Porter (6):
>   ALSA: usb-audio: Add PM guard to Studio 1810c controls
>   ALSA: usb-audio: Add PM guards to US-16x08 transfers
>   ALSA: usb-audio: Add PM guard to Scarlett meter reads
>   ALSA: usb-audio: Guard Scarlett2 protocol transfers
>   ALSA: usb-audio: Add PM guards to RME Digiface controls
>   ALSA: usb-audio: Guard FCP protocol transfers

Applied all patches now.  Thanks.


Takashi
