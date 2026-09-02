Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E7C388868
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329081; cv=none; b=kSLLgVmGO0XZeCB3Bj+owdSyQfwwO0a143Mw7V8iPMhvCqzvg7Yz1TdJ/jIJwDVmMiMxr5jyzCjiihhEZjH4L7IluM1K8+WpTP9oZORn1pQTwVEF8PkAErWhhIMMVF6gnicxPR0NTr1IxQlbJ1Cp7U8M1yelbAi+sGCQBOsOha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329081; c=relaxed/simple;
	bh=JEYGaopR0mbtGJbuuwqgW3XA3806Id+so1Oc7NMpqHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDpRbV9ai1/Ox7gMzqqHmp4dbZIZSvVPa9rEWMqXE3o34skr4daIRvzgmXZmnoTv9HJUKvW8MnCoOzh3wWEeC1iIBvG78gV7yE99e7OWenlVOiod0wKZTYsKnUk9Q2Un0C7u00wnnu6T7gKDnM2ZsrntzsRnX//CizCEQBGQbhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uoiGXDkv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=SHk1QzS9; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2sM9d+c1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+25nYob+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uoiGXDkv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="SHk1QzS9";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2sM9d+c1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+25nYob+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0DA981FB11;
	Wed,  2 Sep 2026 06:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788329073;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nmz2pz49ZaBdgp5pwI6OoVcBRVf7f8Ur24qeKc+PKN8=;
	b=uoiGXDkvz3Xz3x0iv4a97fZpv9UR0N+K6RbI1IuM7c58J4WCLNr76/7YIDNcLKeeNkWfvR
	f8mj1MwDidmn2X2g+JveanW+BtB5s8CKrkJ++TXf+bGTvTEuIC2d25j708cLK0auoVFPkb
	TAZ/SL26oQ92qFcrVJtnDjVmO2kxyKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788329073;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nmz2pz49ZaBdgp5pwI6OoVcBRVf7f8Ur24qeKc+PKN8=;
	b=SHk1QzS90F5Y/BdnjrJWqXg0lzk+nqRgIChoKvB1pPpynTP1jO0mSS9ndHqRUTxi6WjRDP
	updq8Avivq0ES/Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=2sM9d+c1;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=+25nYob+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788329069;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nmz2pz49ZaBdgp5pwI6OoVcBRVf7f8Ur24qeKc+PKN8=;
	b=2sM9d+c1DCcFAkjaQe1frFRtfsjwzXpgaV4/jfJX08J0oYIIFbHppbjP5Bu3VmHgsux6Lz
	rpWRgOAVhNd9Ow7lznaJqwV8uOSO55f05DHkqN4RuVDunTVvg/GIiD05UBqvh9zIQxOk/C
	Wnx1LzjvCzbLBgw81XP0cqJMfjmp1Dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788329069;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nmz2pz49ZaBdgp5pwI6OoVcBRVf7f8Ur24qeKc+PKN8=;
	b=+25nYob+SAA8D7LYV7qibSJ4EgMsb1xP67fqJnJP5y/kspxosXavIC7uCIFESklZxgVRNR
	50aqTkNqBmFsUCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A018B136E6;
	Wed,  2 Sep 2026 06:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fhHGJWy8l2qkagAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 02 Sep 2026 06:04:28 +0000
Date: Wed, 2 Sep 2026 08:04:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: Re: [PATCH v5 0/5] checkpatch: userspace improvements
Message-ID: <20260902060423.GA890950@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260901105642.851234-1-pvorel@suse.cz>
 <20260901104404.55d26e883e9917548025d3a9@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901104404.55d26e883e9917548025d3a9@linux-foundation.org>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0DA981FB11
X-Spamd-Result: default: False [-2.21 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,perches.com,gmail.com,uniontech.com];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:replyto];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.21

Hi Andrew,

> On Tue,  1 Sep 2026 12:56:37 +0200 Petr Vorel <pvorel@suse.cz> wrote:

> > Changes v4->v5 (all by sashiko):
> > * Explicitly match the directory separator in new entries for
> >   is_userspace()
> > * Allow --no-userspace to override setup in the config (using undef
> >   instead of 0, separate checks in is_userspace())
> > * 2 new commits:
> >   - checkpatch: Factor out the check for UAPI files
> >   - checkpatch: Skip kernel specific checks for userspace

> Please prepare a proper [0/N] overview for the series.

I'm sorry, what exactly is missing or wrong? (to do it correctly in v6)

> Sashiko still has much to say:
> 	https://lore.kernel.org/lkml/20260810164552.1049483-1-pvorel@suse.cz/

This is a link to v4, but I suppose you don't refer to v4 but to v5, right?

> In [4/5] changelog.  What does "DRY" mean?

https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
Using single abbreviation was probably not a good idea.

Kind regards,
Petr
