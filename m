Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B639CD0A;
	Sat,  3 Oct 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020969; cv=none; b=J7epl1gwiZeblyWUN5DFA7Nx1hgFmMm1Dt8XHUVarkYiYXpSxkCa1szKleLFYUEmBSPVcKsC+Ifi3P/YHgypuCTB1tNPqlY9FeN3LrKWxEwcMIaboALsUHGMWGWPgrUbR8R3PXW33sdHOzgF12izqZ2TZHqfKW2lJbEbI+lQA2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020969; c=relaxed/simple;
	bh=iII8R7tpWh/7WFMOKhzJaEff54s6Nxo7GFkrXXzL5HE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbglpNjr/rl3xzis/Ep1vIOMdYz9AiqfTTswwT8p/KogZxJb3wAIC7DrSrVTUZPytDOA1bjZBgxIVJvhW8qgyFQq5VwL+Cym58GRUYRyj8dgkUoexqc+jJ2o2AUN4I+WgtT14oKR+TYCTeCeLoAeNe957kuUtzjUCtlGuRrZWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wRmfUwgM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0CryZx9f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hFS4WmHW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3D7WBUOR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wRmfUwgM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0CryZx9f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hFS4WmHW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3D7WBUOR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E40BC1FECE;
	Sat,  3 Oct 2026 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791020962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSgUBfwGRCnHnXNCv79NzwMi5Ac2rhcvaYM07gQrHIE=;
	b=wRmfUwgM9wLsS14yRkInisFhkHlOCXClvT3N2nvFPRM6gZiMcyFqmNQXURz7TjYIbDJWEq
	hCMgcyF3BMGcfunz474IwuM2MaUcLwMEz9arDeL6smZiKvbo3JijbfGNIIJv3ASxfrF7f9
	Qd7vhc5Q2HL/AdQsVMH7vMnyYZNPaJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791020962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSgUBfwGRCnHnXNCv79NzwMi5Ac2rhcvaYM07gQrHIE=;
	b=0CryZx9fSqBIYes4VXFCiqDhadcGUEQ1IVRNT3iOGq9vqyyHeNPTvZFqLMjJpUy1WWwfNN
	cA3yWXareZJMvfCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hFS4WmHW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3D7WBUOR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791020957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSgUBfwGRCnHnXNCv79NzwMi5Ac2rhcvaYM07gQrHIE=;
	b=hFS4WmHWBA7WxaZ4fHPpO/ioGiqtbcUVMgeVB02qprF42Oa6cAnP6hb61+VQdzbCdpYoj/
	8h61Ab2pkgySkdusrfxsjYqUnFpH4jaCDDsgXp7Ty2t2iZciLL1hok7O9L7ECjxfu9nWrR
	4cyNI0ib3SOtoegm68jX30ejc9mOa2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791020957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSgUBfwGRCnHnXNCv79NzwMi5Ac2rhcvaYM07gQrHIE=;
	b=3D7WBUORdLy0LBCY0u1P600Ip4pHRoC4o3FEdJPPrCQ2x3XxU1Gi3gcDzNANbSjQR8dz13
	dmKnB2BFPxUu35DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CE0513712;
	Sat,  3 Oct 2026 09:49:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XNQ+HZ3PwGpoRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:49:17 +0000
Date: Sat, 03 Oct 2026 11:49:17 +0200
Message-ID: <87bj9bxgf6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yejung Kim <catcake43@meowing.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flag for Creative Stage SE
In-Reply-To: <20261002185035.9040-1-catcake43@meowing.net>
References: <20261002185035.9040-1-catcake43@meowing.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E40BC1FECE
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 02 Oct 2026 20:50:35 +0200,
Yejung Kim wrote:
> 
> The UAC mixer on Creative Stage SE (041e:3289) returns invalid/constant
> GET_CUR volume values, causing ALSA to treat it as a sticky mixer and
> to disable it.
> 
> Add a quirk table entry applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN to
> allow volume controls to function correctly.
> 
> Signed-off-by: Yejung Kim <catcake43@meowing.net>

Applied now.  Thanks.


Takashi
