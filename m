Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87E457E65;
	Mon,  5 Oct 2026 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196096; cv=none; b=fx+8SNir3FmCy3lMpBQtjogvXnCAo9ZUrMluGNM6Bq985zDTAmLsXl4sv/EY2wZ1uAGGBwJvjWFkklYUFVDRNIVEtMQRdE8F660Wxd6Z6121ofChd2YtXCfM+kdR3u6h4EG71MJIGh3U+GeYX9Mg7czz+pWc/ZeR1bXIdtHIsKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196096; c=relaxed/simple;
	bh=RUGabXB01WVBYscIOh3a6k+U6RGIgCxG0UI9tqZtglM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s35Ee4ZVj7clVTJDxTHaOKD37RqaUz1q4KAjbfMerE19pUTap+VNx9HWEb/0QCB8CnIGVZZBWrqBLFlzDP0zwG3hMVMQtNH5Tn4n2Gr7S4GYclXL5XemrIkT7nhAM/LnoIE4FI64rb8Lrh3X5H8+az7VhZv13AZ97/3Q49o0+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QvZ8tg/N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=avvF+c2J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rHUkIc/I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dwbDSzd7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QvZ8tg/N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="avvF+c2J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rHUkIc/I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dwbDSzd7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F89221E85;
	Mon,  5 Oct 2026 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791196089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpnyF9kWu5HUOFuoMW2EGXX3vg3/k1B3QaCRnwhKEdQ=;
	b=QvZ8tg/NB3JXdFbwzNd9PjuXAYegvaBBJrv87lRqof8u1TbRCwuB4S+9NX2CEikuZSnlVT
	0RdCh853IS9q8OeUdztLnNb0oZ+zsN88ctKmkonancy80HPz8ISAEr6U02vSUUDwJkZsO2
	S1K/PTFUFlKCkZ6JzAdzZRUnZSK4hp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791196089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpnyF9kWu5HUOFuoMW2EGXX3vg3/k1B3QaCRnwhKEdQ=;
	b=avvF+c2Jeff/ifyMvbfyqB1oJdLiIpkejk2DmGj4oUuFJI/otfSiTPb/3uwDBqslEvcWts
	YuzPCtXqdNd08yCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791196085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpnyF9kWu5HUOFuoMW2EGXX3vg3/k1B3QaCRnwhKEdQ=;
	b=rHUkIc/I+3ZlhfqGdI39tRm0SYAmIH8AYuWuCaiG/5M8lqtmv1SSzIw7DFvUJao9sZf42R
	UoSMSl+nqLIqgcPHgFDBVJUx/rd0N9RVMPupDFytXlg4fZeusftXiSxTYGMnNLS6e2rBT2
	XW70JRvYjPxShTC9dwq2opo/4FytcNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791196085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpnyF9kWu5HUOFuoMW2EGXX3vg3/k1B3QaCRnwhKEdQ=;
	b=dwbDSzd7f3x+TP5glNT7rNmM4Lr5PR3uVZitQwOQNqtr0cChDqh6cSUdIVr+29E3lTPYLf
	D1Dnnxyp9DQJT/Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC9C2132D3;
	Mon,  5 Oct 2026 10:28:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7b0vKbR7w2rlJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Oct 2026 10:28:04 +0000
Date: Mon, 05 Oct 2026 12:27:56 +0200
Message-ID: <87se2ksaqb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Scott Gauche <scott-dev@scottgauche.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda/realtek: Fix audio after Windows reboot on ASUS Q423SA
In-Reply-To: <20261004212623.1098793-1-scott-dev@scottgauche.com>
References: <20261004212623.1098793-1-scott-dev@scottgauche.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 04 Oct 2026 23:26:23 +0200,
Scott Gauche wrote:
> 
> The ASUS Vivobook S 14 Q423SA-U5512 (DMI family S5406SA) with the
> ALC294 codec has working analog audio when booted directly after a full
> shutdown. After a warm reboot from Windows 11, audio works briefly during
> Linux startup, then both the internal speakers and headphones become
> silent. PCM playback continues without errors.
> 
> Coefficient 0x1b is 0x4e4b on a direct cold boot, but 0x4a4b after the
> Windows warm reboot. Restoring bit 10 changes it back to 0x4e4b and
> immediately enables both analog outputs. Speaker playback, headphone
> playback, jack switching, cold boot, and suspend/resume were tested
> successfully. The same 0x4a4b state and immediate recovery with 0x4e4b
> were independently confirmed on another S5406SA with subsystem 1043:10c4.
> 
> The same coefficient write is already used by
> ALC294_FIXUP_ASUS_COEF_1B for the ASUS UX431DA. That fixup cannot be
> reused here because it chains to ALC289_FIXUP_ASUS_GA401 and applies
> unrelated DAC routing and microphone pin configuration.
> 
> Add a model-specific fixup for subsystem 1043:10c4 and chain it to the
> existing ALC2XX_FIXUP_HEADSET_MIC fixup instead.
> 
> Link: https://github.com/thesofproject/sof/issues/11051
> Signed-off-by: Scott Gauche <scott-dev@scottgauche.com>

As this looks like correcting an existing quirk, could you point to
the commit introducing the original quirk via Fixes tag?
At best, please resubmit v2 with it.


thanks,

Takashi
