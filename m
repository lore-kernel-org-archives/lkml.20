Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86A447A86E;
	Sat, 12 Sep 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789215408; cv=none; b=kHDsb9wBwCyCdb4lnwAm0nIV36Q9uG8zc0D/8XohwVz5MPgW5ot483BeIgqXkqqeacMGK/ji0INI0sPhQFPzEe5NShOwglGFA7dEfGpe8WmpOQ+M47+uV9eY6riyq0wIaKHnYEgB8EtlRXRbP1dQfEVy0AvO1FP9GYJjoQroojY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789215408; c=relaxed/simple;
	bh=QZoGsKopM7ewTBuQY2NBlXw66yV6I/mIQgzwpksTyvo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZXsGw+kDGy8BM0ODY8xFhhEp2mbQKQt2Bwb9DXr6hsX9WHFSqZ2UVlwBBkp/SFOoIaJMilTc8NDmGOEWu+YDHprMYUR/iLpfi14XoAxqLdrfIJ0myNOqoA2P9rug2E/n7qZGUjj/vzuTJwVJNkYTyOnqYjp3xumi05h9Fh2yAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f7TAKEKV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ce4SFl1e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LeQ1zLnc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WCadrL9Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f7TAKEKV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ce4SFl1e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LeQ1zLnc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WCadrL9Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A36F91F38E;
	Sat, 12 Sep 2026 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789215395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQ8h5Ns38rfVqn2AQ/ZhzA82QksiAUDDanFc4ajmf10=;
	b=f7TAKEKV0kyxENBZDdVOhHSpTa4OY8d7FllUmcBxw0efdXWTmOGd78nYWeas/ikHBDtDrv
	uQZCDilV0fpf0SM7cjIerGo6pH0BDA1WEqkQzg9Dv2NBZgHo8aeOB8UfGYEKopv50DZDrl
	BHT3Th4euAn8pZulEB0HxGz968qP4rU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789215395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQ8h5Ns38rfVqn2AQ/ZhzA82QksiAUDDanFc4ajmf10=;
	b=ce4SFl1eL1fwkPcZE1/NE3+wn88YvZk8FpqjCCJ3ye87IdSJ6iuY/M0vuSXeBw8kSyu/2u
	GfiOMbI5LjYRPbBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LeQ1zLnc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WCadrL9Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789215391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQ8h5Ns38rfVqn2AQ/ZhzA82QksiAUDDanFc4ajmf10=;
	b=LeQ1zLncMFMXDvVECGX8QKF8By6HRkKzLRLApoJcYR317vkyvrklfHT9LGXB9IfD500Vxg
	o79kuZYsfjapG0aT96z/TcXWgFIILEbpH/hQovgWEwjBLbYdkDuuukQWz6cwt6c4RwDDmL
	1mpZUaybkBXZO+U880DCW2vqmGSMTw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789215391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQ8h5Ns38rfVqn2AQ/ZhzA82QksiAUDDanFc4ajmf10=;
	b=WCadrL9ZYFNJjV0Uk3h/HeysxPS3foqEBcII8S4grYX0g2flxm3PViltDm38Hp9DyJLnSg
	lClpQvWrt9fdSlAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4585713687;
	Sat, 12 Sep 2026 12:16:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l120D59CpWpeegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 12:16:31 +0000
Date: Sat, 12 Sep 2026 14:16:30 +0200
Message-ID: <87a4pm3bs1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Krish Gulati <krishgulati7@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mazen001.ahmed001@gmail.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Victus 15-fa1xxx (MB 8BB1) mute LED
In-Reply-To: <20260912070618.21272-1-krishgulati7@gmail.com>
References: <20260912070618.21272-1-krishgulati7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: A36F91F38E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO

On Sat, 12 Sep 2026 09:06:13 +0200,
Krish Gulati wrote:
> 
> The mute LED on this board does not respond to mute state changes
> because no fixup is matched for SSID 103c:8bb1. The reporter
> verified the LED can be toggled manually via COEF index 0x0B.
> 
> Reported-by: Mazen Ahmed <mazen001.ahmed001@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221982
> Tested-by: Mazen Ahmed <mazen001.ahmed001@gmail.com>
> Signed-off-by: Krish Gulati <krishgulati7@gmail.com>

Applied now.  Thanks.


Takashi
