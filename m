Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD39737A843;
	Mon, 28 Sep 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600135; cv=none; b=ppX608H6uUdvBiswuEVj/cAvHjwmwV94/hhiLH1rUIQxB1V6a+YdVkdeO91XbPvN0WfCaLKw0esa21fviUwaFLuzOTJ+hpsSOKuGdBsJPWSzVEBtx7oLdD1lDswt8QE0Z7uQRjhys9cafXxAwymgc9cgCF0TNFSfCcmCqadcnFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600135; c=relaxed/simple;
	bh=KIsrf5tQrc5J8EeNBp5u8Vt49z8vK2oBgmv/oSZ7UhU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lc/B/lU0gmGKYa3WsG2HKf+KZUmuefBKH9U1OHdMF5narwMHTV5oD7ShjcluYyGGDUM0NKQgwjkZEw9u6YWS1NnwTKDFmsHfPG30rmG/Pg8XnoH287nQvTmawJwSvU0YeQf3TvDzslNUzodLgsdw+4TPJEKIRxYhvDeREQcgUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BOfkaicq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p6/P4QXd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ovmtIi+E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VeGbKw1y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BOfkaicq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p6/P4QXd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ovmtIi+E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VeGbKw1y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5316321A53;
	Mon, 28 Sep 2026 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790600127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8X2DCyySJQA5qL3lQi/zqWmdHVTWCmxTEPZ4QEHcqwE=;
	b=BOfkaicq5Y655T/DtJ9899mJrO2LvWVxyemD5nUaPjg3k8Ht3GBq0zlv2Sa2gHK0Mlef5v
	+8xlogg1LEHGIpSYqFLoYsTHwMSuJzDzW/49f+AqmKffaOi4js3i0CclPInZCeMA4va3N1
	eDFTI7UGEyrIFovZgzxgSkfQKv/TYpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790600127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8X2DCyySJQA5qL3lQi/zqWmdHVTWCmxTEPZ4QEHcqwE=;
	b=p6/P4QXdau7x/rAtZ4Cj6zy0FZ8Mlt5sC1lA8HQSh+yjZ6nC9FEjx2IJ3guLpDMu6kPEls
	7pgD2CPYW3NV9SBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ovmtIi+E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VeGbKw1y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790600123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8X2DCyySJQA5qL3lQi/zqWmdHVTWCmxTEPZ4QEHcqwE=;
	b=ovmtIi+EfvRBTbx2tZUUdbOKPN82ceUpRzQVH9e6Eu4KhpJAHp3001KDrSTyaDk4dV7uPj
	GGACGYC0DX5JWC+59M98afNKRIRfX1hj+wUOEKWebEI6i0BsZG/XUG7Uo1q6Dk6G7W0+ei
	zbDfSOFQ08lJcugbS9Q2rW5/VVWv7VA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790600123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8X2DCyySJQA5qL3lQi/zqWmdHVTWCmxTEPZ4QEHcqwE=;
	b=VeGbKw1yU4hK6cHuD2KHZtYUlbg601ixWprP8xdEFsS6qZYuSTHOkg9W/PMFO4dNqgr7Ml
	GbSZYMkuiTjUmrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 030FC133F1;
	Mon, 28 Sep 2026 12:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Bx8FMrpjumpvGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:55:22 +0000
Date: Mon, 28 Sep 2026 14:55:22 +0200
Message-ID: <87zex14jt1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Denis Yakovlev <mfthesun@vivaldi.net>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable bass speakers on HONOR MagicBook Pro 16 2024
In-Reply-To: <20260927210455.13938-1-mfthesun@vivaldi.net>
References: <20260927210455.13938-1-mfthesun@vivaldi.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 5316321A53
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Sun, 27 Sep 2026 23:04:55 +0200,
Denis Yakovlev wrote:
> 
> The HONOR MagicBook Pro 16 2024 (DRA-XX, board M1020, ALC256, SSID
> 1ee7:204e) has two tweeters and four woofers. The BIOS only configures
> the tweeter pin 0x1b; the woofer pin 0x14 is left at 0x411111f0, so the
> woofers stay silent.
> 
> Pin 0x14 can only be connected to DAC 0x02, while the parser puts the
> tweeters on DAC 0x03, which turns the second speaker pair into channels
> 3/4 that a stereo stream never reaches (and SOF on Meteor Lake only
> exposes a 2-channel HDA analog PCM). Configure 0x14 as an internal
> speaker and restrict 0x1b to DAC 0x02, so both speaker pairs play the
> stereo stream with a shared volume control, as on Windows.
> 
> Tested on DRA-XX with SOF (sof-hda-generic-2ch.tplg): woofers and
> tweeters play together, headphone auto-mute and the DMICs keep
> working.
> 
> Assisted-by: LLM
> Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>

Applied to for-next branch now.  Thanks.


Takashi
