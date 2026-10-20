Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485791;
	b=4Mh1mCJP7BJrT3tMwKoSfkhOIGv4aU7eD4HOaD1BDUPkKN6majYJk7diu4qT1yW9wpyB
	 xM9xuyIt3qI2x9dl67IThjMOnD+l//YdudFXY7S+cdRl09xoeBbxcsBujhLvl0+rtJG4F
	 0W3GvqwpgBew5XQ9FYgsL4sdM6fpJWZ/W+wEeMACHIPvURSGLb0RgsVRKogjRKwzSlOs4
	 V96OvDCraIHq6WycMrGPLPTqsnNCwmPj6LpMLaPXh9uAsktHolNkP/lvOXP8X6TmYBfm2
	 fNbr7TjbI5+1/pATl1rNMuaIKH/CKVhU+yZrM0RmQdiK+xDZoEPViidVYy3ZvVNm91Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485791;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=Fh6C+O5y9m3ZaGQEF6LzFWdCAts54cVhEPtMLdPmQC8=;
	b=ZA8SvgNwS2qBpU3Y6pp+fGLuFBuGu1OaCNidmDan71616YVJJQV0ukEw2b1aLpWONRUi
	 +ZQNN1CDsIlIDcJoacVlNCpgi+BneSNMXHvdF/OeEa6ad57561lGdaGYArsMAdZwGbmYu
	 oAmyno263yDcLktp1OCDLqlLHve+YbAxpPUhhypc79fxTAvQ6kgKiB7xpMp4ezV10B4eE
	 ZjK67mqKt9MTVgFFc8XLw7mf14MjdQq32aJvNKVsaeyHWYRHJsh//JjyR1hi4NfWQBUi0
	 y7MtsPFlpqC8QI3JRMJxZiojlIipl/xv2X4PcZ14yx7748GS0iUp2KuZ7rYpMvBbOww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kKoUNqQl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wOjtgRbc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jf1c2uyg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="9/ZpUC1m";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F3606A319;
	Tue, 20 Oct 2026 08:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195F3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kKoUNqQl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wOjtgRbc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jf1c2uyg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9/ZpUC1m
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 333D721D81;
	Tue, 20 Oct 2026 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792485789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fh6C+O5y9m3ZaGQEF6LzFWdCAts54cVhEPtMLdPmQC8=;
	b=kKoUNqQlYVLuUyUgOV1iZxbzrXQo/3G9xsGE0WKjG6Fz+Rfn2w/IXxnawFCM9/S55uZttL
	RER8rhDxyJdEzZ48BL+hpWZZuPzdqwjrk4Cz/S7YUddRvsOWTskuznHDCzcHVK8ExG28iz
	P/tvz6JT21xth5myKvgHDCMDAjuGqpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792485789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fh6C+O5y9m3ZaGQEF6LzFWdCAts54cVhEPtMLdPmQC8=;
	b=wOjtgRbcU2Lp7kL8n3+Brv3ca52SARNz7oyRXMGusaqeqQQ1NeShKY9VEHI4QovCNya1de
	UyF7JHAG4KH0xpDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792485788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fh6C+O5y9m3ZaGQEF6LzFWdCAts54cVhEPtMLdPmQC8=;
	b=jf1c2uygMLmLXpQr/Q1dmMYxe6aDYSlQSXrVWIYIB5bQKXuVVlE7wY5bRshLujXhWUxNCI
	32vdMqeHUg6pbEYgMb6Z9sZHN28O/P1filFokvlADmDSNru8L2JpatcyYR4qiBl6MMsC3u
	3exf9o6VNCD9PZBmKWyFNS7Y/Ls1szs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792485788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fh6C+O5y9m3ZaGQEF6LzFWdCAts54cVhEPtMLdPmQC8=;
	b=9/ZpUC1m1rdXBsUMo15sgmFrJGlONRwYvZZl1Pl5ZvGJk73LshrzYcT3BS5bSJgg2c8OOG
	J1hMCwt91s82gIAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E40FC136CC;
	Tue, 20 Oct 2026 08:43:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7FKALpsp12pzTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 08:43:07 +0000
Date: Tue, 20 Oct 2026 10:43:07 +0200
Message-ID: <87cxt4iwys.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nika Sommer <nika.sommer@mailbox.org>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable jack detection on Minisforum AI X1
In-Reply-To: <20261019183226.64985-1-nika.sommer@mailbox.org>
References: <20261019183226.64985-1-nika.sommer@mailbox.org>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 19 Oct 2026 20:32:26 +0200,
Nika Sommer wrote:
> 
> The firmware of the Minisforum AI X1 leaves the headphone jack detector
> reset bit asserted on its ALC245 codec. As a result, pin sense on NID 0x21
> always reports the jack as absent.
> 
> Enable the existing fixup ALC245_FIXUP_MINISFORUM_JACK_DETECT from
> commit 6bd8a57c044f ("ALSA: hda/realtek: Enable jack detection on Minisforum AI X1 Pro")
> to the Minisforum AI X1, which requires the same workaround.
> 
> Tested on a Minisforum AI X1 (AMD Ryzen 7 255),
> using NixOS 26.11.20261014.55bfb4d and kernel 7.2.10.
> 
> Signed-off-by: Nika Sommer <nika.sommer@mailbox.org>

Applied now.  Thanks.


Takashi
