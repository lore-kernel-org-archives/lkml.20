Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1EE331EAB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243460; cv=none; b=IASA/NreeytC5v2y5dEoj2rMxy2tZPKef+m60Ab4F5uii6ZyePSbLrpyMhturgyEpkq2v5/d13HwQ/y4FQH2nhx/dl7IxgSKyiqUvXwEh/wby4F2ipNDLfjB0fUReOzeLItT7dMkgI/KCq1ZQWTmZlb5+aXZ+sL2pCwIZ2N2ye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243460; c=relaxed/simple;
	bh=iHA10m/E+HUMup5UeOQf2H5L2PhsCrebk41nq5d/bGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH90+9mp0maEhy2smw+bLJb9/LLL5UqFYOfFWcrcgXfmJ842k2CSpFA8QFHnxC4LAuBL5MQUpAtGwW+I1457fkt58sr8e30EwFtFwU5vNk8MlviF7cvzPiZEgTB52mqhNRSpF/ye7qp+3Dnc0rxDIAr+QQrtMmn47JkezjXy8ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=w6/1A0I4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=wLy5SaN0; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=d1gEGkwM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Of3dTsWu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="w6/1A0I4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="wLy5SaN0";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="d1gEGkwM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Of3dTsWu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 85F9722501;
	Tue,  1 Sep 2026 06:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788243452;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mM+OqUO/mYnl3HaW/g370k7TZPmS4IbA7nmNlM6QmE=;
	b=w6/1A0I4ovXL7uyQS6Y6fwm4Op4INqVe1DHuSE53N7DrvMF3QstmJwnlPSd3bRwGeKVuhS
	DSD0qBt0W1cSd1uGQlTGrmS2RErrA/MZAVwjTPJ+MOis1haA+eKIu0PVIS+C6UuudXAW+0
	rMg66OWw3441V+fcwKBtUXKj+uDZCYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788243452;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mM+OqUO/mYnl3HaW/g370k7TZPmS4IbA7nmNlM6QmE=;
	b=wLy5SaN06HWIm2eY4sI73Zlr5mArJ31KuWVX6aEvpXA5ySnOLvHcOI5BH/FaSZMHpErVWh
	cPCs+tqzZa6gj4BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=d1gEGkwM;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Of3dTsWu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788243448;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mM+OqUO/mYnl3HaW/g370k7TZPmS4IbA7nmNlM6QmE=;
	b=d1gEGkwMc+TEHtLMzPLTTPhvQmmvXuhSoPqACySvmKfqLXglyHVLgQ24LAWtC5i5EzZ+cN
	VqakAANH0pZXrTlZITRd5mJY4ncNvOaZ4KgruLCvJHfAmiB3XvksPdbNilGMGr/D5+5KHs
	CXFSSdkXPPwfB+NxmEdizoO04RN0FFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788243448;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mM+OqUO/mYnl3HaW/g370k7TZPmS4IbA7nmNlM6QmE=;
	b=Of3dTsWuUBUlYLqTZlA7qctF/1/tbd3F1QbIjC5uNx99swJctO2mL6zsEK7jZVig0QxjUZ
	m8qbceo+r9HqUGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0643E13515;
	Tue,  1 Sep 2026 06:17:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id njgKO/dtlmptAwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 01 Sep 2026 06:17:27 +0000
Date: Tue, 1 Sep 2026 08:17:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: Re: [PATCH v4 0/3] checkpatch: userspace improvements
Message-ID: <20260901061722.GA804595@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260810164552.1049483-1-pvorel@suse.cz>
 <20260831205511.9bf609fc3d8c5ab98df2a1a5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831205511.9bf609fc3d8c5ab98df2a1a5@linux-foundation.org>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 85F9722501
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
	URIBL_BLOCKED(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:replyto,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,sashiko.dev:url];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:replyto,sashiko.dev:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,perches.com,gmail.com,uniontech.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.21

Hi Andrew,

> On Mon, 10 Aug 2026 18:45:49 +0200 Petr Vorel <pvorel@suse.cz> wrote:

> > Changes v3->v4:
> > * Change test for directory to be more more generic (Joe)
> > * Allow to use --no-userspace (sashiko)

> Sashiko had a few more questions?
> 	https://sashiko.dev/#/patchset/20260810164552.1049483-1-pvorel@suse.cz

Thanks for a reminder. All are about kernel code being wrongly considered as user space.
At the beginning I was not sure if we need --no-userspace at all, but we
probably do for non-kernel projects which pass --userspace permanently via
configuration file.

1) The original regex was suggested by Joe and should mostly work, but using /
is indeed safer.
-m@^arch/.*\btools\b@
+m@^arch/.*/tools/@

2) my $userspace = 0 will indeed prevent --no-userspace from working as an
override. I did not considered this as important, but let's fix that.

3) return ($userspace || path based detection: dtto

=> v5

Kind regards,
Petr
