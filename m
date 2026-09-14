Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3933A9DA;
	Mon, 14 Sep 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366739; cv=none; b=Z7c2CnPbhPJXse2gm33UQ65k+eWo2q2c9yKUMizWOY2P4kjJv/XtYgSD77oNEIPuaFidWxZpiQWp4K6LY/K9oI/WfkE+8danCmi2xaBBb9DKhebT6pfLjVX7O17PxLuLsaasx0W/6tcAShvskGF8dsya0Tn9GYVYoJw0fTkjcqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366739; c=relaxed/simple;
	bh=m2PW9f08I8Cu6oA63ICxXggNLlKtBNbpdY/lIEtGxKM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pRjN9ScWljwHFyOFPkf24x4zOZINeYboFbtXLm54xkw/sQyx7aNvcSLY/o5HEpnMvgjW1i7HPGRUtHLu8a4/L1iPS1jJAYTqW9Qlnt1jtfKphTBF/g2HvrSgIrIVc4WBOcv01/7mp1sZ7FyMpDp49EAcBISGtTZCCh+cfQ1IUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BY9RqkbX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Of+GPmO7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A5VMkhH0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CSmxQcv2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BY9RqkbX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Of+GPmO7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A5VMkhH0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CSmxQcv2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7AB911F836;
	Mon, 14 Sep 2026 06:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789366731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZme78kNXZgDxFQ2xY8OCjMvaXH+aom+uvlM9QLK0XU=;
	b=BY9RqkbX4uwC6bkFq0DM3hHCk69MbZ+PWWL4gnTML8JxE9Z8QjN/gpCj7e+gkglykZGaWj
	Ip3aQhRtUvLDEMBg4yQ7m1POruDM3KD6aeTAZtaMNG5cQsfc46bggQMChRqRCAQbICXutj
	e2VSyxXapmYhNK7PArIh0KHXIA1UO7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789366731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZme78kNXZgDxFQ2xY8OCjMvaXH+aom+uvlM9QLK0XU=;
	b=Of+GPmO7pLoJlCS18w1zEyXUhYLKOWq5qtSyibLGHdeAnDndUtmxBDR35jXWcThu6msSZr
	cVrH0zFRAsyRyXDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A5VMkhH0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CSmxQcv2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789366727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZme78kNXZgDxFQ2xY8OCjMvaXH+aom+uvlM9QLK0XU=;
	b=A5VMkhH0OQKa5R2q/9PpXPq74v68+0NZgqIhQB1DuB0gHp1Ney99nkZu4moYAs7l+v0UUI
	XU0ZbIxOfJKM7TIL5mxPQIM0LsS13chDGXiC+SNv0b5MQ77Kd0d5GwYco2/EVxfxx9hbZO
	gFg7geiuljsISYl50+cKaYN+A9WUHik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789366727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZme78kNXZgDxFQ2xY8OCjMvaXH+aom+uvlM9QLK0XU=;
	b=CSmxQcv2AkdA+S9vYcOE+UAArRyAukPIROvXn0eKRCI5/hyrwJymInfyVPouRL85lnis+6
	UCVUXkt9XbD3PpBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B74613515;
	Mon, 14 Sep 2026 06:18:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tvBOCceRp2pABAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 06:18:47 +0000
Date: Mon, 14 Sep 2026 08:18:46 +0200
Message-ID: <87se3cqrsp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kitty Makin <autumnull@posteo.net>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add capture quirk for Behringer FCA1616
In-Reply-To: <20260914002334.12691-1-autumnull@posteo.net>
References: <20260914002334.12691-1-autumnull@posteo.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7AB911F836
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,posteo.net:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 14 Sep 2026 02:24:24 +0200,
Kitty Makin wrote:
> 
> The Behringer FCA1616 (1397:0004) returns silent capture samples unless its
> playback endpoint is active.
> 
> Use the existing fixed implicit-feedback mechanism to keep playback endpoint
> 0x01 on interface 1 active during capture.
> 
> Tested with 16-channel S32_LE capture at 44.1 and 48 kHz.
> 
> Signed-off-by: Kitty Makin <autumnull@posteo.net>

It's interesting that this capture implicit quirk is still needed.
Maybe we can work around in a different way, but this addition would
be likely simpler.  Let's see whether any other devices need to follow
this pattern, then we can rethink.

In anyway, applied now.  Thanks.


Takashi
