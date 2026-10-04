Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1E3EB815;
	Sun,  4 Oct 2026 06:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095231; cv=none; b=q2z4sbOWwAgHnHg0Irfg8I85hu0S89/tALtVvM3/vwYE7fRv+Iuuqat81q84hzGVn6IFTX3tjvCjyK8ANzbH7SWEL9Xc9ne9yZPcl/DNItq3lh9zUAl4U29nc7GkjtyfZNXCmvXtpP4g+laAQpWpVGOqi1ElPErC2vi1hggKSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095231; c=relaxed/simple;
	bh=iifNQlKrr6o06Lz2nZ9OjGNSWLH+t2Z1uqVr62m0sf4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D78810FIB4XSy5Dl1d4/8xXDf3nK+AjKMK2zdGzltEXgZ9apzHYfC6ePgosRyfWW5ft6J/TyhjNR6xgzmF2r1ZTX6JmB9fBWpctixVsNa4JjWzfo4H1+M7RGvMf8qDQsWtRpOXTQJZzzdOn0MHcHW4GtQJmPcVgxbQsGthkeqV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IRqt9fLb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CPI0JtOd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=le1+EEe5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lN9XYDHy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IRqt9fLb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CPI0JtOd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="le1+EEe5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lN9XYDHy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE84121D74;
	Sun,  4 Oct 2026 06:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791095224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RBN6ko9gcxqTueip19YvbBw7H7GG7AtFHQRHM9CzM9s=;
	b=IRqt9fLb90CSZwHsxAdjur5hivzE8CKKaXU2sudhRf3YAxXMXGMVCdhwy028F+63d0i5B6
	SmZyAR/xJV4kFzXRKikAjkzy/cFzj4x1pSneYLyCFy6L6YpfLcfRG50DrmIrsnQwfiuPBB
	dxrkZ2jHlgvPVF8bQIgWEPQmZegSWU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791095224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RBN6ko9gcxqTueip19YvbBw7H7GG7AtFHQRHM9CzM9s=;
	b=CPI0JtOdK8xhOxui0mDC9SFTBIuovRtujh2v2r98ORh9ci9KFrhpa2MahYJEVKwE73n0Ds
	ew8wFZ7soaglqDBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=le1+EEe5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lN9XYDHy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791095220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RBN6ko9gcxqTueip19YvbBw7H7GG7AtFHQRHM9CzM9s=;
	b=le1+EEe5+ZQiFgrsNV4Af4aqm5L4Jaqrzox3GsIelycklSDXWiJRzM/mQcCNmmIGKDqWcR
	e5JmC6VesdlB6kmn4l52VM0hNWAHgsJeVBL45DEMb8ryo+das5ccffy0MwT/cTSThAgExd
	w25eXyfFTBqNZG5wOVpknhvswF1r6qY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791095220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RBN6ko9gcxqTueip19YvbBw7H7GG7AtFHQRHM9CzM9s=;
	b=lN9XYDHyS4RXJ+V9eTFCObUqAR+auHS/yZvMzYob48u51pqn/b+0yO1AkACdI8XERjivk0
	m4q4Vz0jgwKDRfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AEB8138A7;
	Sun,  4 Oct 2026 06:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OCd0ELPxwWrnBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 06:26:59 +0000
Date: Sun, 04 Oct 2026 08:26:58 +0200
Message-ID: <87pkxqvv4d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Eckhart Mohr <e.mohr@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASRock NUC BOX-358H
In-Reply-To: <80121f8d-c272-46f8-ab8b-2479a70c0186@tuxedocomputers.com>
References: <20261001183403.103990-1-wse@tuxedocomputers.com>
	<87ld8fxi1j.wl-tiwai@suse.de>
	<80121f8d-c272-46f8-ab8b-2479a70c0186@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EE84121D74
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 03 Oct 2026 22:40:40 +0200,
Werner Sembach wrote:
> 
> Am 03.10.26 um 11:14 schrieb Takashi Iwai:
> > On Thu, 01 Oct 2026 20:34:00 +0200,
> > Werner Sembach wrote:
> >> From: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> >> 
> >> Fix headphone jack detection for some devices
> >> 
> >> Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > Applied now.  Thanks.
> 
> again i forgot to add cc stable
> 
> can you add that in your branch?

Just send a post again to stable once when the commit is merged to
Linus tree.


thanks,

Takashi
