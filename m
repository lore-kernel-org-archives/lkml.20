Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC98E330D29;
	Mon, 28 Sep 2026 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598373; cv=none; b=gQv8UCs31mBnv+Lo80CU+1q7wOYPGq2e3AeWmsZoq44RorHoPXtXHle1CYO9yr3d/jv29StXJru250JCkgK3nS71yXvYjTO1ECQJqJxsWOlMWmxVhrhfS00caokyEd5isq2ikBnMTBpOeFTNrIvfoHyMauoUwibL9MRXa+W8vFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598373; c=relaxed/simple;
	bh=PsRS7lbjhGZsnuQ+kIBFx7G/+ambGWMhbQ76SU1fVaA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fljKdDbW6CS0HPaCf5njPRRj8rcsJnpkkSqqnGxT0H8tmrGzBYO417185F792hU6l+BD+vXpiFL2dCM7G1PGqQ+4J4l/yX6ktPcB2NCPEnPGCtuy68JtAlAMMBEELZznnNyleBfc/3p17Og5oc1DCO2UajccTmWDuMlJVU8WlIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0CzaZzBq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ThP1e33O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eec2ZnTy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IAXN4Y6O; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0CzaZzBq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ThP1e33O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eec2ZnTy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IAXN4Y6O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9421A22333;
	Mon, 28 Sep 2026 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NwL/ChBojr86+9jhZ+jJKgCkYqRWcLVX74aSOtziWVU=;
	b=0CzaZzBqW0zKjH/3lFO/6++Qh7rb0hGxkU8nokJ8bNDGNTvdbZy54Ct6Sl6fKA/Cirp1Gx
	n9SBqNjm1BmWZbxnSIvA5nbjMwx1iDduyimfRyVxExA6EPt2+aQx+eeEndHPxcKoMwsjnL
	MDUwI00aIZGg6zvLwNKc3m2G/1WutHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NwL/ChBojr86+9jhZ+jJKgCkYqRWcLVX74aSOtziWVU=;
	b=ThP1e33OnDJMFx3h0OxZXCmPlwmBqUNnfNrHiV4fTNmR364Km9JwZc71mnokylmXbgfXWx
	zfU1pOpEKR2qRwCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NwL/ChBojr86+9jhZ+jJKgCkYqRWcLVX74aSOtziWVU=;
	b=eec2ZnTySJNeim7AWUtTm57VbnKaUe8pSEiOFQHYbcSCd/KgeHWLxaFdvH0ssDWtLvACre
	fAI09rpKyrw9HIo49Whhzo9mdHAEdPTvz6V5E6BUB1SYXyfKkbZxq+Fgp7R5PjnWmy7bb4
	jCvq3y+ZFGQfTz21TIw0SmLBjNiaFL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NwL/ChBojr86+9jhZ+jJKgCkYqRWcLVX74aSOtziWVU=;
	b=IAXN4Y6Ox1EVpFMrQ4PTr1CwIl0psCPpv3UGPEgVMPQ0zVSyebcZ1V3UX3p09uJG7IT1U/
	D3Y20kQVh1W3efCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40B05133F1;
	Mon, 28 Sep 2026 12:26:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rbDKBtlcumoBeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:26:01 +0000
Date: Mon, 28 Sep 2026 14:26:00 +0200
Message-ID: <87ik3p5zqf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: oxygen: use helper to activate the SPDIF PCM control
In-Reply-To: <20260927121709.742840-1-runyu.xiao@seu.edu.cn>
References: <20260927121709.742840-1-runyu.xiao@seu.edu.cn>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,seu.edu.cn:email,suse.de:mid]
X-Spam-Flag: NO

On Sun, 27 Sep 2026 14:17:09 +0200,
Runyu Xiao wrote:
> 
> oxygen_open() and oxygen_close() modify the SPDIF PCM control access
> flags while holding chip->mutex. Direct access changes bypass the control
> core locking and notification path.
> 
> Move the access transition outside the driver mutex and use
> snd_ctl_activate_id(), which serializes the control update with the control
> core.
> 
> Fixes: d0ce9946c52e ("[ALSA] add CMI8788 driver")
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Applied to for-next branch.  Thanks.


Takashi
