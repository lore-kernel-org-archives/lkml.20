Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975875;
	b=b16FpbNOE5f3vIP+mRkJFiuFwi+4NX5JkS0BWej/70nbHO33/CczPI0fqHLZwGdoy1IE
	 Clx558uyT7J9QtiajNdcrOopu1Ud3C9ROhLS7587uHmUeHLgyG7GmOAd4+/qRALG+aQC6
	 SloGVqsX3dTsR1P+YZkTLtTLjUn3jxHGUSvZxfvDJyY2kKgBORzZOp2XYf/S8OJP/SNeJ
	 KZsVDApUxKkyJpP8FUPcef2t92chqXXL3Pr9vtrxRcdCn3asHdnmlmYN/3nqHolxfy5LN
	 LBLxIP4OCmUkudQ9Gp2nvTOkQKH2SdmqPSLQCn3FyOnGT/NSQEZhSVL9e2vHQbkLLVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975875;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=d6+KqjzGNGhlu9omZdJhETF9JVgg7tU3WIeLoUlP4uU=;
	b=fyrLhfnlQsxU9hYY2I+bWXdx2KEudFqsQKb2bul1lCLSndqK/qukrHbJsDqNFgFHmIpj
	 Vg+uFoWLAxfLN1oUO5F8WxAved+6rVrxesLMPYhveANcdv5mu02lwo5UyUrAEt/sgBycp
	 6UbDvnYdnE+OkMnqyjv1miirH5o/g5mScnMlUFOorVZ+Gmpvfx/sXOeHUpegTCE4MFvbK
	 J7DxyNQQzYgWBkSHx1gmSCjI3ew0cQLCu7FlU036OJRTf2Rp30HsI2vSEGTq6zORo1R5C
	 chW1L70Cmunrm0oyFcsaPt+ocUMr6qlJ9f6ORBZVFkNXHnuK2nTKy791Af+ozoPTuLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l6VgaSSX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xKNedjWq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="p9zZNh/F";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hy9vOFIN;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1055A606D824;
	Fri,  6 Nov 2026 14:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1055A606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l6VgaSSX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xKNedjWq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=p9zZNh/F;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hy9vOFIN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8E871F78E;
	Fri,  6 Nov 2026 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793975873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6+KqjzGNGhlu9omZdJhETF9JVgg7tU3WIeLoUlP4uU=;
	b=l6VgaSSXN0pOdjWc03y9dW8ar12Hq8mR5fN4kp318nDQeZ5p1l8NyOb8tCFmJWh7AmGMwo
	Rg2h+UHyA0aFOZhE+wAIk//d7JAuMmIq9Or8h+KhdAO83Td/6FyHbExPsejpIqHi22J5ON
	UGNCliHVPWLza69wv0JoZFIIYLl54Qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793975873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6+KqjzGNGhlu9omZdJhETF9JVgg7tU3WIeLoUlP4uU=;
	b=xKNedjWqpix5mtgYqluonbCUJAAPUYdHSS3fBiOPvCGAoGhHDOr8PQxDH6OBnsXq3XRbBK
	YLVeYbnge1maGzDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="p9zZNh/F";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hy9vOFIN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793975872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6+KqjzGNGhlu9omZdJhETF9JVgg7tU3WIeLoUlP4uU=;
	b=p9zZNh/FalsqgijGxmxz6z22VYDca4YetgU88g96QJ8U3RYro7zCukbfVK6CavyFENc+gs
	If07PBsOjZSqlQiBqHP5aKCrHyHtuMnS9Qgk5t0Y4h3KpmlO86OH8wyTeYYfFGTWw1nfL9
	FEPAS1tiE2aNZsBEDuQWzcrakL15194=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793975872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6+KqjzGNGhlu9omZdJhETF9JVgg7tU3WIeLoUlP4uU=;
	b=Hy9vOFINaMjvLdgMxM/KjigQ42AaTJbRrjcAiPwIpHYaqoeJEWd+3tCaVTRM0CW3W/t0ZO
	Az3nwZuq3zQnlrCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 834CB132C9;
	Fri,  6 Nov 2026 14:37:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CS3VFkDm7WrQfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Nov 2026 14:37:52 +0000
Date: Fri, 06 Nov 2026 15:37:52 +0100
Message-ID: <87fqxeowjj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Deukjung Kim <mentalese@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Add Arturia AudioFuse 48V/Main mute mixer controls
In-Reply-To: <20261105112903.536150-1-mentalese@gmail.com>
References: <87ecd0tt6x.wl-tiwai@suse.de>
	<20261105112903.536150-1-mentalese@gmail.com>
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
X-Rspamd-Queue-Id: D8E871F78E
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Thu, 05 Nov 2026 12:29:03 +0100,
Deukjung Kim wrote:
> 
> Add mixer quirk controls for Arturia AudioFuse (0x1c75:0xaf02):
>  - Input1 48V LED Switch (wValue 0x0001)
>  - Main Speaker Mute LED Switch (wValue 0x0500)
> 
> Values are written with a class MEM request to entity 0x46 and the
> initial state is read from a 178-byte status block of entity 0x47.
> Protocol reverse engineered from Arturia AudioFuse Control Center.
> 
> Signed-off-by: Deukjung Kim <mentalese@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
