Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8947B492531;
	Mon, 12 Oct 2026 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817309; cv=none; b=RGFBgX3xLi1qy9yZ/oJsW8NvvaHM4lY9Iqh/+82wevlfvl+30+ss9/tggBORFfq4XRvbMehEgXO+hvre6lq3BN4h/9hg0YtZchKm99JnIYl/gRmARQStQwjZJzAd10q2PawSF1HvrqaZy6f/CDGzojEQdWJPXL/HfKrqMem38Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817309; c=relaxed/simple;
	bh=d6EUfW9YuRkEoNTzLopylymRzAUXYSqIkTdmmeiW1bY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RQZeP+VFHF1Q4z4iYPP0d9A16JRMrrwVQizmBuFmNtnfDHA9Tw5Jr4/waLLYM8n4M2OiLsQpJfoD/baxOwTV5WAvzNvLKsyrcsyph7F6/50cGQf1Jbtk9JkBEc7Xcb5pHXQSpjoKao+uXFeZcScme8r8UWadvi1+It+OQrJ/Xh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uF46/Fwy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oeD8g0Z0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uF46/Fwy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oeD8g0Z0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uF46/Fwy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oeD8g0Z0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uF46/Fwy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oeD8g0Z0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B2981F452;
	Mon, 12 Oct 2026 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791817306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nkmaj33bio23VdpI4rFV858UDMNsicRdMOtdg0fyWas=;
	b=uF46/FwyIfSAR7dMWMPNocYdsbbnlPiGxtMArqGT3lOx+iZBrW8BN2UP+136ZY70D77BCB
	xzugKRWAvUx8BE9mtKZDjAf9wEiFpIe+kQji7H625k50mbUGowyj5k2ced/OL/aAUkaoph
	VNZXmuScvmUkszVb8JlmLocTybelNu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791817306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nkmaj33bio23VdpI4rFV858UDMNsicRdMOtdg0fyWas=;
	b=oeD8g0Z0zzQ9Uz3+pmT58ZSsKu5tzq1mV40gInp6W0qtsUtq3M6ezjxfwc/0oruaWm8BaG
	Zt4dns95NCOYZnDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791817306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nkmaj33bio23VdpI4rFV858UDMNsicRdMOtdg0fyWas=;
	b=uF46/FwyIfSAR7dMWMPNocYdsbbnlPiGxtMArqGT3lOx+iZBrW8BN2UP+136ZY70D77BCB
	xzugKRWAvUx8BE9mtKZDjAf9wEiFpIe+kQji7H625k50mbUGowyj5k2ced/OL/aAUkaoph
	VNZXmuScvmUkszVb8JlmLocTybelNu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791817306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nkmaj33bio23VdpI4rFV858UDMNsicRdMOtdg0fyWas=;
	b=oeD8g0Z0zzQ9Uz3+pmT58ZSsKu5tzq1mV40gInp6W0qtsUtq3M6ezjxfwc/0oruaWm8BaG
	Zt4dns95NCOYZnDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BF2913408;
	Mon, 12 Oct 2026 15:01:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I1UnAVr2zGp9VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 15:01:46 +0000
Date: Mon, 12 Oct 2026 17:01:45 +0200
Message-ID: <87ecdvgdye.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sandro Pischinger <kernel@sandropischinger.de>
Cc: tiwai@suse.com,
	perex@perex.cz,
	john@metanate.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset quirk for TASCAM US-16x08
In-Reply-To: <20261012124255.10485-1-kernel@sandropischinger.de>
References: <20261012124255.10485-1-kernel@sandropischinger.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Mon, 12 Oct 2026 14:42:55 +0200,
Sandro Pischinger wrote:
> 
> When suspending and resuming the playback stream, audible
> glitching/chirping appears on the audio interface's output for several
> seconds.
> 
> On playback stream resumption, I observed an increase in feedback rate
> up to 48,038Hz. This stabilized back to 48,000Hz after ~20s.
> 
> This is mitigated by applying an interface reset on stream resumption,
> as introduced by John Keeping on the TASCAM Model 12.
> 
> Link: https://lore.kernel.org/20221129130100.1257904-1-john@metanate.com
> 
> Signed-off-by: Sandro Pischinger <kernel@sandropischinger.de>

Applied to for-next branch now.  Thanks.


Takashi
