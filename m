Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B0B4A3D25;
	Wed, 14 Oct 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981449; cv=none; b=j4mRaiU+rQzZ1ChboucJYXvLcTst/CVFD7/FH6UVUbwmUTq2Z/QaJprRYA4G99SLjum/ZFVnURFReElpwj9jc3TPJQfOJxYh04ZeBg0M3087W/ByscJ/tD1p8xgzrZGoGIEtNiQRfIGNoUIVuTHjTvCIQ7jJU5YwExkPDLQtE6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981449; c=relaxed/simple;
	bh=r2T4MyL9bj7r9EDWOkfGcyk2HYxyhxDzQwHLOatpYwI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/Noo7vkfGmaJAXbDTeHOt8UQ8h5tLD5Bllc0G1QwNx8NP1lNncUJrmypFow5EfqCh/xre3uSgaPqiOYwNAODldKKLbsIB/dqZaTlrMv3kPlRcsl5G1vxQ0J4YNr9Y+m7KJItXrmUThPBFunM58LjmnAutSBB6nRJ3LGu7P+Zpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tS3ooci0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q58MftYO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tS3ooci0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q58MftYO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tS3ooci0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q58MftYO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tS3ooci0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q58MftYO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AB11722230;
	Wed, 14 Oct 2026 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791981445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bzaDsYNENJ+osjllAdsjiwG+Ur2RGTNFJvPQF9EMgrk=;
	b=tS3ooci0YdS3g5Lm/UdksKbNggVEyIdRod1P/792tPB/WhuSqjdHNGcv7onc+WoxWMf0QI
	uQ1oB0w+YC19rabhtvyqgpNHVMCKxC0AhkKGhlInEBml3LUfcmUqZZp9fowzNY3zmjF9iV
	bTST/xHZw2tnM4P5v6+q5eTM5ldlg80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791981445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bzaDsYNENJ+osjllAdsjiwG+Ur2RGTNFJvPQF9EMgrk=;
	b=Q58MftYO/OBgTKeo3EVaExEM6KzMfCD5j8sL24kscG3cV7ZR+ij5sFI0MGNi6jopOzUVl7
	IQE93qp/bIPzwkDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tS3ooci0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Q58MftYO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791981445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bzaDsYNENJ+osjllAdsjiwG+Ur2RGTNFJvPQF9EMgrk=;
	b=tS3ooci0YdS3g5Lm/UdksKbNggVEyIdRod1P/792tPB/WhuSqjdHNGcv7onc+WoxWMf0QI
	uQ1oB0w+YC19rabhtvyqgpNHVMCKxC0AhkKGhlInEBml3LUfcmUqZZp9fowzNY3zmjF9iV
	bTST/xHZw2tnM4P5v6+q5eTM5ldlg80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791981445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bzaDsYNENJ+osjllAdsjiwG+Ur2RGTNFJvPQF9EMgrk=;
	b=Q58MftYO/OBgTKeo3EVaExEM6KzMfCD5j8sL24kscG3cV7ZR+ij5sFI0MGNi6jopOzUVl7
	IQE93qp/bIPzwkDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34E551373D;
	Wed, 14 Oct 2026 12:37:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vQKuCnJ3z2pEBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 12:37:20 +0000
Date: Wed, 14 Oct 2026 14:36:51 +0200
Message-ID: <877bjke9wc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aayush Kumar <aayushkmx@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix speaker and mic mute LEDs on IdeaPad Pro 5 14IAH10
In-Reply-To: <20261014072505.60358-1-aayushkmx@gmail.com>
References: <20261014072505.60358-1-aayushkmx@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AB11722230
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 14 Oct 2026 09:25:05 +0200,
Aayush Kumar wrote:
> 
> The speaker and microphone mute LEDs on the IdeaPad Pro 5 14IAH10
> do not follow the ALSA mute state. This machine has an ALC287 codec
> with SSID 17aa:3914, but shares PCI SSID 17aa:3843 with the Yoga
> Book 9i and currently gets its fixup.
> 
> Add a codec SSID quirk that runs the IdeaPad ACPI LED fixup. Chain
> the existing bass speaker amp fixup so the audio setup is retained.
> 
> Tested on the IdeaPad Pro 5 14IAH10: muting and unmuting the
> headphone sink toggled the physical speaker mute LED. Muting both
> microphone controls changed the ALSA mic LED state from 0 to 1.
> 
> Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
