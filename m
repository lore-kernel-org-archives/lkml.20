Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CB44F3930;
	Tue, 29 Sep 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674753; cv=none; b=IxKPkKb/MOqHu4zPVSMjMR7ghzf7Pf+bTiVneLNDuhJyqgbznJJFEcw6z8iiRdF/NYnUgQUXqUEKC2jrJeHi2mqkx8TapOgR9tuhiH5fUkxh3LXUymi0rMsxGeWh8FoVuJ3A65rOuwdY0Cxx/HH7tSfhOXNDUUxMWX3DRj/Mj/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674753; c=relaxed/simple;
	bh=PtzkTGAvOI0IazmabP3E3ULK1qV+03AcrJ+zTw9BbaU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyRAMo6oksUoYt6iCm9Xn4yT2nKUrcltm67U5TaZ3fxh5FRRv1q4Ngb0u0I3rjlf6Ov9UzeukOpLDFinlXHaPRMhbzcwSshqY99KmxqkmnMEImRq6rY3G8bCcbyor5gaGSIxL/gky6fpc8U7Q/AurZ1p98EmYYbtcPT2ymURD50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DtG/z0tV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8XpFeiSX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SEcBcDOQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=djqBHkA+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DtG/z0tV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8XpFeiSX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEcBcDOQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="djqBHkA+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1F0F921BB7;
	Tue, 29 Sep 2026 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hI+8FO7BtRt3LbGE4e+3BUAdnGKLFhFu+dN08zLdTfM=;
	b=DtG/z0tVDKSVA4BSKmX/Ke4JYbtNE4vPvP1Eo20xaKJsxap+kyU09VwkuH5opcgVzycXS+
	Ix24mYczGnpbVe8fkw8C0xCdD8byJCLaYUXi06rDauQoNUFTPQyzCMNsHDsyRA6qWyXpas
	MPMEF2jvZ42oEfv/GPjRHRDNPrmQigk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hI+8FO7BtRt3LbGE4e+3BUAdnGKLFhFu+dN08zLdTfM=;
	b=8XpFeiSX1wlbISv8ZHiRcLweb6HK8U9hX17yjiCBNTFAgZXRbb1f7Hrfix8IoSIksSXGJt
	ti75/LBlQevMaSBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hI+8FO7BtRt3LbGE4e+3BUAdnGKLFhFu+dN08zLdTfM=;
	b=SEcBcDOQBJciQ1GvwJq1TqI9JEvbPStiehCqo5K89r/FU7PAYmNKIzrPS/LgEMO5+4QRku
	MJuUHeANWz70MCkvzi8jrBem/UvtwEbxHB8OqEbeFx/FoNAWuzTthC1cRfXVgfcwBc42+B
	uQqRCUYyGPSZh+f3fWaaHDo5lgekK4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hI+8FO7BtRt3LbGE4e+3BUAdnGKLFhFu+dN08zLdTfM=;
	b=djqBHkA+TUK9kCfr9KpXcaYjanifWQirtDlGIIVAe4eTZUwKwIalbGRVffz/+nx/2o2veQ
	u6VzdZxWewhEAvCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2DC2133F1;
	Tue, 29 Sep 2026 09:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L8I8KjSHu2rbHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 09:39:00 +0000
Date: Tue, 29 Sep 2026 11:39:00 +0200
Message-ID: <87cxtw2y8b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Georg Wenzel <g.wenzel@gmail.com>
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: Enable bass speakers support
In-Reply-To: <20260921181845.17923-1-g.wenzel@gmail.com>
References: <20260921181845.17923-1-g.wenzel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -0.80
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 21 Sep 2026 20:18:44 +0200,
Georg Wenzel wrote:
> 
> Configure the driver to correctly initialize and enable the bass speakers
> on devices utilizing the TAS2781 amplifier. Without this change, only the
> tweeters or main speakers are active, leading to thin audio output.
> 
> Set up the required register sequences and routing to ensure the bass
> channels are properly powered and mixed into the audio stream.
> 
> Signed-off-by: Georg Wenzel <g.wenzel@gmail.com>

The patch doesn't seem applicable to the latest code.
Could you rebase and resubmit?

Also, please avoid non-ASCII letters unless really needed (found in
comments).


thanks,

Takashi
