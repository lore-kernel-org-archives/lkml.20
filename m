Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9A30CD81;
	Sun,  6 Sep 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682009; cv=none; b=NYvN+FzeS9mM/7mXrf09ew3gfplljoauy8k5AKG0zm0nUSAqTNmUlFvh3VngCFZiHmVPdzMXrIqWYC+QyoRJ7gFP29ce4MxOTdD3bvxbhK6IMCzoCRToHvHdSaD5j50eqwK5Ti61qcbfohYyiqMdbjNyULSmtwRhbaW/GFIMCpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682009; c=relaxed/simple;
	bh=qBLo63qLpDU752yVf2VSzE5r7uMBMKLlHqDXlxVhIkQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XaXTO8v2Qlvc9Wkgg8WV0cnJJSimx3z2rZj7dWbD7rNQ5FRTWdIoJIok/VmfdaZM+wk157i2w6zJnxBd/rSJ5a6ERpnux7hmgLeJ1E0WI9hqT7lBnPfIM8ED+bJdGF71SuEbfZWzzryLdJsVzNQAR2CGV0HN9B2Go+pXBnPuC5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=plAHdqVv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TntGLIrw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mYVdYoGc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uISPrOB1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="plAHdqVv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TntGLIrw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mYVdYoGc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uISPrOB1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 749DC22653;
	Sun,  6 Sep 2026 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788682001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eGSBYbKQ0X7U2dwkUHuXNPfjfmG7dNGpVNQvlQcg1z0=;
	b=plAHdqVvIF83usC1oWJl9UJoaCSSAAaGUVf99iSURsimSsvITzGKJxeIUrDUQT1fkXtxv0
	eU3UMaNiUziv9E0abQL17d/pK6ADNCJETy6bnNPSp74hkQV9uaPZjajtyjGYzyeSvBMKMY
	n85lDx6eND/TEwGB582XRqyx1INb+Z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788682001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eGSBYbKQ0X7U2dwkUHuXNPfjfmG7dNGpVNQvlQcg1z0=;
	b=TntGLIrw6UnBdvpsIG7UJHStgQqpyacNqjuLowWwOmkuSrvKnNlINzI/2ciL9b6PFUoGkc
	FLYOiUnG7Xp+QbAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788681997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eGSBYbKQ0X7U2dwkUHuXNPfjfmG7dNGpVNQvlQcg1z0=;
	b=mYVdYoGcjvVyGV7pKH+t7RjyeQl23FYNtoqotrhIkNncFnJH0NcSyYhrAWObNnjcK9Gu60
	zuVBjMjvQmcHZBJ3tQ7rHKChixcOs2LpJC7R2do3LjIxJLqzoqghFt1NJpDcQhTQTyMjqF
	mZskRuGLjmbAyhTbeBqjcqoMcVWak6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788681997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eGSBYbKQ0X7U2dwkUHuXNPfjfmG7dNGpVNQvlQcg1z0=;
	b=uISPrOB1XY0WpNsanoC4Qc6r96CHa0LxedU0/OmIJedVrVGY8vcqw9sP9dnnPKfYhgRWjX
	pib/616Ij5V0+8Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CCEF13432;
	Sun,  6 Sep 2026 08:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id whLuAA0fnWopbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Sep 2026 08:06:37 +0000
Date: Sun, 06 Sep 2026 10:06:36 +0200
Message-ID: <87jyoy4xdf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Nick Pegg" <nick@nickpegg.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flags for Behringer UV1
In-Reply-To: <42486ae6-a634-4897-ae70-338dfca68bd9@app.fastmail.com>
References: <42486ae6-a634-4897-ae70-338dfca68bd9@app.fastmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Fri, 04 Sep 2026 19:23:15 +0200,
Nick Pegg wrote:
> 
> The Behringer UV1 is a microphone audio processor with a USB audio
> interface, which experiences periodic stutters unless implicit_fb is used.
> 
> This seems to be a similar device to the Behringer UMC series, so I
> copied the quirks from those. I've confirmed that my own UV1 works great
> with these flags set.
> 
> Signed-off-by: Nick Pegg <nick@nickpegg.com>

The patch can't be cleanly applied, likely due to your mailer breaking
tabs and spaces.  Could you fix your mailer setup and resubmit?
At best submit via git-send-email.


thanks,

Takashi
