Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832261;
	b=BNk/CLpBYwmTlaC6ZaFNOpjjjfrZaW8d4Bbpew74dx+HmWqrl2evOa9r/1oGXe6MwSTx
	 sQ2mGSX6xCRmD4qdy/faIPVH/weXTEyAI74HebNawv/P82vnsRq5vMrk1OQMUOdKS+/8u
	 Z0TY8W9zXls3ijD6t6sptL9uNx9m28a2XaDvcJburQ4geXZT+46vSobgkhag2usBfRQHP
	 NabeszDB5sspaA81yWTjMrpEY9ZkH+h54gbnBiynpXkSTCcBrFSmGIJdNDFliuoo8y4ew
	 lcCpfyPqQx+KJ9qgmzsSF3eVQDDSIx/PK+5SesZBe/DpnsdWjbBZdAMW6rfNJQxfDzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832261;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=knADILq5PgI4KuorUbpvDWBdF7yfkOwdnlZ7YCzAKbI=;
	b=z/deU7R9dQxrZaSXdJMYR+gH3YRjKzS1yFfOgeqGPElfGQ8j3+yZjye3a9zn8OoYo7IK
	 CjokzbwXJPNEDx5ezPf5jEge4J5Lec01FmPkSInHF+lEzQ/1UVps6mokFAika19S3EGq8
	 tVnC+bti3d5aBv6cSrQsuKQGpu7NxLq9D6wKcnd4PtZanDwObWk3A0z5ka31DUR8DAWKK
	 srCutRruR1fYM0lIgOEitQkjbIWOWp8DetbggcW8tHbRbXXk6purLnzjYNOS+bi/cRgTI
	 3j7CYW1yCq0DOf9ax97aTZaNDxGPhY4rPp7qmdoF3R7R/BN0tmwor66PO/ZNaFFPHYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tZTfbG7T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5wfT1DGo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AsjTXVYm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qUtY3QDY;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A4606A323;
	Mon, 16 Nov 2026 12:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32A4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tZTfbG7T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5wfT1DGo;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AsjTXVYm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qUtY3QDY
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E139E221D9;
	Mon, 16 Nov 2026 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794832259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=knADILq5PgI4KuorUbpvDWBdF7yfkOwdnlZ7YCzAKbI=;
	b=tZTfbG7TmWN/aqYe2MXVQPaC2xjqHfGA6pVyaYZqATGptR544p23JDVcopw0TJp6fDNz4a
	157pPsYg+8uZhqykFEt8/RnJNMpwtXIlJJDexjdfq2kO+9sJS+Y2HqIflEt0O6qpSOUAvc
	CyzcSY3R0Vj8zXyXOVBvTHxivyctPqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794832259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=knADILq5PgI4KuorUbpvDWBdF7yfkOwdnlZ7YCzAKbI=;
	b=5wfT1DGoXn7BgmBfyy5tfUkImCITvYXkkiENIWTO4k4trYrfHfKzNbUvRgjcCBVcRCv48G
	/Vl28q9hSEa3uODA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794832258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=knADILq5PgI4KuorUbpvDWBdF7yfkOwdnlZ7YCzAKbI=;
	b=AsjTXVYmhqfbvc7E/XBao7JVlknoQCjPGoTmw2gWxmYUvRzWzt4YsWdQ4GAvOYkkpRjHoY
	wmzBx3iMerg+4n/D4dVSx0PTlY8UQ61SAHgiUwnezAapjljoWG2HvXb7wNJi6GHcsbWu7o
	Oa7gfdhVSisWfP2UTIwXaYx7m/oI0cg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794832258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=knADILq5PgI4KuorUbpvDWBdF7yfkOwdnlZ7YCzAKbI=;
	b=qUtY3QDYRBlTR2mENVIOLSl1X/x9jC4DJAJd6kyqA1FxdY9STvEafMLLv9EurmLfi77Ql+
	h7tHHUMuACUhOjCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 773FE1334C;
	Mon, 16 Nov 2026 12:30:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D6KHE4L3+mpdagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 12:30:58 +0000
Date: Mon, 16 Nov 2026 13:30:58 +0100
Message-ID: <87zev9x8jh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	David Rhodes <david.rhodes@cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: doc: cs35l56: Point to kernel.org firmware repository
In-Reply-To: <575412a7-9f7d-47af-83b8-a0933b4c729a@opensource.cirrus.com>
References: <20260914031252.98932-1-marek.vasut+renesas@mailbox.org>
	<fd865483-1485-4042-b938-2012eaa65043@mailbox.org>
	<3b620222-ba1c-4c6c-a06b-2dd5fb391fb6@opensource.cirrus.com>
	<49f749ff-8d34-4806-bca7-403005600c0d@mailbox.org>
	<575412a7-9f7d-47af-83b8-a0933b4c729a@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,lwn.net:email,suse.com:email,infradead.org:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 16 Nov 2026 12:26:32 +0100,
Richard Fitzgerald wrote:
> 
> On 16/11/2026 10:57 am, Marek Vasut wrote:
> > On 11/16/26 11:14 AM, Richard Fitzgerald wrote:
> >> On 16/11/2026 9:22 am, Marek Vasut wrote:
> >>> On 9/14/26 5:12 AM, Marek Vasut wrote:
> >>>> Use the primary mirror of linux-firmware at kernel.org.
> >>>> No functional change.
> >>>> 
> >>>> Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about
> >>>> Cirrus Logic CS35L54/56/57")
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>> ---
> >>>> Cc: David Rhodes <david.rhodes@cirrus.com>
> >>>> Cc: Jaroslav Kysela <perex@perex.cz>
> >>>> Cc: Jonathan Corbet <corbet@lwn.net>
> >>>> Cc: Randy Dunlap <rdunlap@infradead.org>
> >>>> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> >>>> Cc: Shuah Khan <skhan@linuxfoundation.org>
> >>>> Cc: Takashi Iwai <tiwai@suse.com>
> >> ...
> >> 
> >> 
> >>> Is there anything left over to do with this change ?
> >> You should send patches To: a maintainter if you want them to merge it.
> >> They are not guaranteed to see it if you only CC them.
> > 
> > Who is the maintainer in this case ?
> > 
> > I used the get_maintainer.pl script which should have done the right thing.
> 
> You have the correct people but you sent it to them CC: instead of TO:
> Takashi would be the best person for this.

It seems that the patch fell into a crack during my vacation, sorry!
Now applied.


thanks,

Takashi
