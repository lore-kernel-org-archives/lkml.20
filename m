Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F78B3603DD;
	Mon, 12 Oct 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791333; cv=none; b=aJSyxK1XBVflWXf1sMHKauD4ECOLCDvLIsF0CNwxVgFnpFyKiWoCmMWzXGESAA86YooZw57OT3D4HQcdfF2hG+wgIKyvqyKjNsl3U8WplsVWPtsiFcumFxfzGRQ4FJWcl/L/rLDo+5mwh2MoBLTBYM7qbstB913fpzfnvHs+Neo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791333; c=relaxed/simple;
	bh=bhvo4jLqmhbCHLsw/2yZB5kmDvqxj/aPZ04I8H0ab1M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TMb+vQXxkfQJtf7TaGfK4SX6pjz5XsxnPe4RDiGCKfmdRMFXBXGI/voGa1XotKdHXuPCme53Zj6DtcxG+ccSBP3mKg1FZOOdAsz7z6Youw/VJ4QZOOtjASskn8+vbhlnuw/UiBgr0mdy9IF9eV9fWR4IjcxGe3EK1iSZTH/fL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IPozq+54; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OTvvl0O9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M1m1ceoo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1zvqEq/g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IPozq+54";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OTvvl0O9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M1m1ceoo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1zvqEq/g"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 804D221DFF;
	Mon, 12 Oct 2026 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791791330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5gPL5DauRt/E0tu9bLjOqXghfuPBSqzWduvG6VSfng=;
	b=IPozq+546eOYC+MKVTf+iUvEUYtGrYxjdJ4n6ymbEomb+i+S/rn5AwK0ZSDPSeMZRyH7Hr
	rbkvK+aJ+g/Bpi3EidPpDM2sNlPvaBXl8h1qNQZqv65AQr8k3cqcW0JQwrSJzAKsR29Q1P
	r7GIJwHCNOe7FdoxVGBXqPuMZNHGvNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791791330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5gPL5DauRt/E0tu9bLjOqXghfuPBSqzWduvG6VSfng=;
	b=OTvvl0O9dtuYyTlmD9Qi+6VqKje03PlOLdQGBGhjDv9/bn5G1EAuVchb1nGhRFQT6JXHYk
	F4P6KMRCMPv8QFAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M1m1ceoo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1zvqEq/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791791328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5gPL5DauRt/E0tu9bLjOqXghfuPBSqzWduvG6VSfng=;
	b=M1m1ceoojpBkyo/dMLzWfZUx/rPsysmuoM5rOTAypyOa8Pv2GR/f3eon+Vp+vjnz4Yjh4D
	b+hIwhUIa/vzwO8Y37y7JeXQWfMWB/Hl28C0LebaWS9Cp9QJgzLpGx3vL+IiaRPdsKmPjC
	PN9M0iN+J/kjYtIoU6OYWjzvGDnXD04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791791328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5gPL5DauRt/E0tu9bLjOqXghfuPBSqzWduvG6VSfng=;
	b=1zvqEq/g8PbmxRk3C1vhFIQYMomdbQRnjNntGdcaVcOtHN0S7fr4nnJHaL+y4gFGOZhFJg
	EyCj+dbEmLWOyiAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36F3113314;
	Mon, 12 Oct 2026 07:48:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c49VBOCQzGrhdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 07:48:48 +0000
Date: Mon, 12 Oct 2026 09:48:47 +0200
Message-ID: <87v777gy00.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for rongyuan GS20
In-Reply-To: <TYUPR06MB62171DFA33D7E17FD3F73D24D29F2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB62171DFA33D7E17FD3F73D24D29F2@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,vivo.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,vivo.com:email]
X-Spam-Level: 
X-Rspamd-Queue-Id: 804D221DFF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, 12 Oct 2026 08:55:03 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=1237, idProduct=17b8
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: GS20
> usb 1-1: Manufacturer: rongyuan
> usb 1-1: SerialNumber: 20250228
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied to for-next branch.  Thanks.


Takashi
