Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762401;
	b=srrP7AtsNBU5SshEPPKj0SRJ3PQxDslJZ3tMo3Ajfs5VZeh9+1OKXZTh6Eu9wdwzTTBd
	 O1zp8pAa0h7XCxO7jeE2xp/NBhZmZI9aLYv6SAPSynP/kZHxraKl2yIStW6dhda8gPl/d
	 KxGckrvRUD8FSbQCtMDunR8Vv4u5wx2jp0PVjCe4vUgamBH8hFEbnxH8tqvp45leFZllT
	 uGarEuQlIzzxLOCsRAiN2ZS1k6Pvg49+nSWm+9jZo46Xy5Kai1WtFiKpa2dI9/9YGe+2D
	 DR98qiZ8DZQ9fpjmvshl3kqmcFgn4ov1ghlrm5K4/tLjuGU7Q8RAur3vR7ZPmtJhIww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762401;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=KDDCaaxPHS/Efh5JcDKgT5MzEg/qgy9Yl9aAtgi8bpI=;
	b=pMxbSxFGyWBF4PtzNhO5JY+GsbP+WepgctH9g2TriNKMKdOCVBgNeumWevD5y+AB3Msc
	 IYPh+RGSCGbrPKvkrLf4AWdOE5nS+YsutYooEDj6r+LZyFXpAX/emiv9o3lPtRjfC6Jp5
	 0Beyj08caCzmP8EA8yjnOtHVG6wHP8wA34fe1haCRDXEkX3MCJL8vGVE2eHkfU7f4fXFz
	 x/OTSWV/FIOqpm0mG0EzYLmMq0RhcZ+NjRA2XJGFezLN98Z8joZ0TA23+6ohQz1AMzXcK
	 gzHWEVKzqpIohxo3t+EjSVyOh3D01zaOHsDsub+GQOtzBCcAC4SMYW2yMarmAuSXP3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mKTKEBxY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EfIGc1Pf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mKTKEBxY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EfIGc1Pf;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FCF606A31A;
	Fri, 23 Oct 2026 13:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FCF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mKTKEBxY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EfIGc1Pf;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mKTKEBxY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EfIGc1Pf
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3496A1F76C;
	Fri, 23 Oct 2026 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDDCaaxPHS/Efh5JcDKgT5MzEg/qgy9Yl9aAtgi8bpI=;
	b=mKTKEBxYo2QynfeOnn3A066A6LXyPcbgOZCv7+X50EW9nRFVeCyAWGJoEZlRYRv0S3HTje
	R62LwBF6uxXWWIBS5ZJHmJvfNviaoHOWRdesJx9j9TUlKtAbQXCa6VJt+tfYz2VRBF2ORW
	AbaPAm3tiLFaJFTYORVeTrp1gEOuORs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDDCaaxPHS/Efh5JcDKgT5MzEg/qgy9Yl9aAtgi8bpI=;
	b=EfIGc1PfY6wTKSiplIUpTPlAuiJoTlfxNDWgCHWr7tuvSWMrlp6J7qvrxzfNAYu2TAqvL1
	5sAFBcBKJzLLWbBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mKTKEBxY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EfIGc1Pf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDDCaaxPHS/Efh5JcDKgT5MzEg/qgy9Yl9aAtgi8bpI=;
	b=mKTKEBxYo2QynfeOnn3A066A6LXyPcbgOZCv7+X50EW9nRFVeCyAWGJoEZlRYRv0S3HTje
	R62LwBF6uxXWWIBS5ZJHmJvfNviaoHOWRdesJx9j9TUlKtAbQXCa6VJt+tfYz2VRBF2ORW
	AbaPAm3tiLFaJFTYORVeTrp1gEOuORs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDDCaaxPHS/Efh5JcDKgT5MzEg/qgy9Yl9aAtgi8bpI=;
	b=EfIGc1PfY6wTKSiplIUpTPlAuiJoTlfxNDWgCHWr7tuvSWMrlp6J7qvrxzfNAYu2TAqvL1
	5sAFBcBKJzLLWbBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEB56133F6;
	Fri, 23 Oct 2026 13:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +AG6LB1i22oTTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:33:17 +0000
Date: Fri, 23 Oct 2026 15:33:17 +0200
Message-ID: <87ld7oa6ea.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lianqin Hu <hulianqin@vivo.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for RYDZ Technology USB Headphone
In-Reply-To: <20261022071456.14256-1-hulianqin@vivo.com>
References: <20261022071456.14256-1-hulianqin@vivo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 3496A1F76C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Thu, 22 Oct 2026 09:14:56 +0200,
Lianqin Hu wrote:
> 
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=0124, idProduct=0c36
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: USB Headphone
> usb 1-1: Manufacturer: RYDZ Technology
> usb 1-1: SerialNumber: 202601131108
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
