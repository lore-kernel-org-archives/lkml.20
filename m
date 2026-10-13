Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5751DAE9;
	Tue, 13 Oct 2026 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909897; cv=none; b=KzEDL6qiUXvyYF5Ow0PqA4sNk+t5ybYR7l4J17Djxni3TRbwwnWor1ZYc4Sg7Eix2DrgQhmCyf5kELQIOW1CgBqOj8fflfF+wFkH9odgbnpc2qoixQa7ZwVtOtlipxwzYE9GpNha5/SBJbJch8gGbJBnwbBEfIHmVpI2dyI2gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909897; c=relaxed/simple;
	bh=pjiXZcfH0vX2UrE5Egz1b3TahHzVYJoDOAAYUpAEQhM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7slDo4o9u6IQcGdJoBXVohZROD7wU/cIHzE/qJgRKQiv9SBXCJCu1uRzp+ztzKwk6wXV7H5PpC1FencL0DLdipHtbfgM0h3Z5lfA6C5k0sQOr6WAYme9my5imujxqtZ4IdWPBuHRRn0UczVE1f6o8n7u3sxDzXJwPLPNsnyc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2U/syucD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V93Tm5pO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2U/syucD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V93Tm5pO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2U/syucD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V93Tm5pO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2U/syucD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V93Tm5pO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1CDB521E2E;
	Tue, 13 Oct 2026 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791909894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IonQPWehnZPl6amED8BDj3j1/dcAJzFM3LAToUW8U5Q=;
	b=2U/syucDoac15k/7lF939cUycZlwA9ZmOLT3/5bRN+r+etkz8Q4YGVGHuHwEvT7hw7OGb0
	VPY3nmImP5CNImvBJoEUEu8CZi9+wlQYLqef1rC6xu0kheHfyCEc5ctiJcG0wl1MubJCy0
	BbLh3cwZx9y/qOmXAfp2ZFLnSAcQx5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791909894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IonQPWehnZPl6amED8BDj3j1/dcAJzFM3LAToUW8U5Q=;
	b=V93Tm5pOFSFzSqUCTkwRsjrzeoHUGwWFfmoSBux9ZQOoiMWoFiq1vFBFtQJqdq9QkWT4bf
	cmVbgQP67CF1s/BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="2U/syucD";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V93Tm5pO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791909894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IonQPWehnZPl6amED8BDj3j1/dcAJzFM3LAToUW8U5Q=;
	b=2U/syucDoac15k/7lF939cUycZlwA9ZmOLT3/5bRN+r+etkz8Q4YGVGHuHwEvT7hw7OGb0
	VPY3nmImP5CNImvBJoEUEu8CZi9+wlQYLqef1rC6xu0kheHfyCEc5ctiJcG0wl1MubJCy0
	BbLh3cwZx9y/qOmXAfp2ZFLnSAcQx5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791909894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IonQPWehnZPl6amED8BDj3j1/dcAJzFM3LAToUW8U5Q=;
	b=V93Tm5pOFSFzSqUCTkwRsjrzeoHUGwWFfmoSBux9ZQOoiMWoFiq1vFBFtQJqdq9QkWT4bf
	cmVbgQP67CF1s/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD78F134B8;
	Tue, 13 Oct 2026 16:44:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HDMuIgVgzmpXVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 16:44:53 +0000
Date: Tue, 13 Oct 2026 18:44:53 +0200
Message-ID: <87pkxdft2y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/intel: Power down GPU at error on azx_probe_continue()
In-Reply-To: <20261013133153.78225-1-tiwai@suse.de>
References: <20261013133153.78225-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1CDB521E2E
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 13 Oct 2026 15:31:50 +0200,
Takashi Iwai wrote:
> 
> Since the recent fix commit fbaccb1b19c7 ("ALSA: hda: intel: Don't
> free card in the probe work"), we don't release the card but just
> toggles the init_failed flag to stop the operation in the case of
> error at probing in azx_probe_continue().  This leaves, however,
> display_power() true, which may block powering down the GPU.
> 
> Put display_power(false) at the error path for avoiding the potential
> blockage.
> 
> Fixes: fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe work")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/hda/controllers/intel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 6b80b59b8743..b67d569fc859 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -2453,6 +2453,7 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
>  	if (err < 0) {
>  		if (hda->vga_switcheroo_registered)
>  			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
> +		display_power(chip, false);
>  		if (free_on_error) {
>  			pci_set_drvdata(pci, NULL);
>  			snd_card_free(chip->card);

On the second thought, turning off the display power here alone would
be problematic; the rest hardware cleanup procedure will run anyway in
azx_free() and with the display_power() off, it may lead to something
unexpected.

We can power up again temporarily in azx_free(), too.  But I'm not
sure whether it's a good idea.  Going back to calling azx_free() can
still work, but then we'll hit the old issue again about the already
bound codecs (that aren't detached by azx_free() itself).

Hmm.  Maybe better to leave in the current state for now until someone
sees a real problem on an actual hardware.


Takashi
