Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1603299A82;
	Tue,  8 Sep 2026 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851615; cv=none; b=Y3ooDUbjDxW0X+OrU31bOH39iVTgQuiGYbFLrJJ7GsvtC4617bcfLwHwth8EZ78E9fhBsTCqxyGLDD4H4BAAtGXhyG46ollB/KvSRSiEZzp3cTNB8NhYyvC7Zk5t9gcuVsueFV1jvZykx+ACQnd7418azWaq7stO3GL8TFyCejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851615; c=relaxed/simple;
	bh=ObccZqKbynwQWHDkMWOyFYQ4vcSpvHaG0r9vaGS8SGg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C667e3fZU6njDWCMJ7FTIMuAxtchucpcE8DArX1cYxYpWs8++oVXCyXDEBM3r2SuL58EYhA61Utu9I0vbGkQpnfM9iJjYDVQ+UwOIoPSKg57DVVWiHyj8lbxfNBspmPeXqtZ/hNnYclP0EG5TI7E5WNpfLrX7st1U+b3frcUyxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OyyUcL8M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PTVdRJOP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NkP8oO6W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p+gM8Yni; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OyyUcL8M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PTVdRJOP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NkP8oO6W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p+gM8Yni"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE649219DC;
	Tue,  8 Sep 2026 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788851607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/SJGR6WtcRxTvrW5Po/VoKri6nAJbVkJgkS0XpLwQU=;
	b=OyyUcL8Mh5orld1n/RYQfWstojQY4AyDRQgB1Cs5pCQpxrLPXkm80yj7KRVwhC9Cawid/3
	IHsZwgygoD44VpWx0tq+FDNVx6cSg2GGgTIGUdYGwxG8vN8r4MLu5K/zMfLMBNKQuHOxog
	mQeNwfT4q8A1yeFhToNjAuRFG0bazWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788851607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/SJGR6WtcRxTvrW5Po/VoKri6nAJbVkJgkS0XpLwQU=;
	b=PTVdRJOPrt/L+HE7n25CHnH6kyTpLY/FWON7YHm/Cy6BrqihS+9hAZoSAXXBf6T1AdN3RI
	2H/imHJP6El8xVBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NkP8oO6W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p+gM8Yni
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788851603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/SJGR6WtcRxTvrW5Po/VoKri6nAJbVkJgkS0XpLwQU=;
	b=NkP8oO6WVeI/rgOrjTi3SDDS28+kp0KzMpFAPdZWGmoEZMrzCc5IH3gmKr7rwA/bLZNiW+
	98e9IBnrRrsvEi+dLlv6Y108o6yh8jqVEqJTTR9MFMd+mVYjk15zh2OitsWyk03rtyUcaX
	jwLFQydPWUBAJechEuU3nu5lnelZ/bY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788851603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/SJGR6WtcRxTvrW5Po/VoKri6nAJbVkJgkS0XpLwQU=;
	b=p+gM8YniQr44jNtn2rDHXfrBkauM7e7AqthCeKGV3cIEtiq/8glgk+R0Oj2dEh4Pg0K5tS
	3ICmaEqVvZ23byBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68E811364A;
	Tue,  8 Sep 2026 07:13:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zxFsGJO1n2rLUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Sep 2026 07:13:23 +0000
Date: Tue, 08 Sep 2026 09:13:22 +0200
Message-ID: <87bja8qkq5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruairi Anthony <ruairi@ruairi.uk>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Elite Dragonfly Max G2 speaker
In-Reply-To: <20260907115942.19286-1-ruairi@ruairi.uk>
References: <20260907115942.19286-1-ruairi@ruairi.uk>
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
X-Rspamd-Queue-Id: AE649219DC
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,ruairi.uk:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 07 Sep 2026 13:59:42 +0200,
Ruairi Anthony wrote:
> 
> The HP Elite Dragonfly Max G2 Notebook PC (SSID 103c:8890) uses an
> ALC285 codec but is missing from the existing HP quirk table, unlike
> the related "HP Elite Dragonfly G2" entry (SSID 103c:8716). Without
> the quirk the right speaker amplifier's GPIO is never initialized,
> leaving it silent while the left speaker plays normally.
> 
> Apply the existing ALC285_FIXUP_HP_GPIO_AMP_INIT fixup used by the
> 103c:8716 entry, which resolves the issue. Verified with speaker-test
> on both channels and confirmed correct routing to both the downward-
> firing woofer and upward-firing tweeter on each side via the board's
> passive crossover.
> 
> Signed-off-by: Ruairi Anthony <ruairi@ruairi.uk>

Applied now.  Thanks.


Takashi
