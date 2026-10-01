Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC9531AE6;
	Thu,  1 Oct 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868038; cv=none; b=klPsL6cOlY5UenFXHEmmMcqLKtqP7o2pfH8EImK8VK7Nx3F2OlfZIw0M/vmvJMAO1iLiY4C2mQPh0w6wbx6X2+jVa1zEXV8NIv+jZBt8eq3nSdZooLe29MfEAWop0mCysWd/45dBX8BOhaM0fC88Penm5QH+MlyG7wnOq1YJalM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868038; c=relaxed/simple;
	bh=78yNeHB58q99vx2v1kF/fBirmQ8KIdI0e9A0mQ0vZ/U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6H4zt9E7IjYAgu8t2T6ufiPq/yE0SOkaeRhFjPhk6vnIDgAMR06Uvv+pFX/5allHoXWMwd5MoDBHdq7ZvYHwe6nvurY8jkD39/sJ9MpnODMXWEa+WwPxYgtm/T6+wVvneu0gIsgO4MaUk5D4sg/dQi2/fCWqZUGobKiDUx7tLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pzvt0Dgc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gIPFKH6K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MQSG4Wej; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8KJnqatC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pzvt0Dgc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gIPFKH6K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MQSG4Wej";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8KJnqatC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B304E1FD04;
	Thu,  1 Oct 2026 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790868030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjtqkUq7SI0M01/7Cb90z3i51OFWZf6Uy2zt1XoQ220=;
	b=Pzvt0DgcW10rSQf81wpHWFnlpZg8c+ute7IDRUTF4VvUh19D6BSiHteGVcHWbMTooTABIC
	QlqnO+9WYxRBPdEO0xUZ7TBOS/RknnRkmr/G6kE1dGITCiAPZ3mRVDZu8xNWmLvHFlszgr
	LQY1z5V9UaPJJ45OTAD+Xnia3GUsLX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790868030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjtqkUq7SI0M01/7Cb90z3i51OFWZf6Uy2zt1XoQ220=;
	b=gIPFKH6KMwPgH5kbeFJwi7vjbVnF6V3gqb4HcuB+3wkqPMuKINWOLSk1Ojo0e7ixCbXq8+
	DiWdkVRk7f/koACw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MQSG4Wej;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8KJnqatC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790868026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjtqkUq7SI0M01/7Cb90z3i51OFWZf6Uy2zt1XoQ220=;
	b=MQSG4WejpeGYd1DoAfV0rZSLFYv1A0bM4u5ESD+mDv5HVSoKnbnw3dTKTs2vjpTRMemQ3g
	f48Ag6kAkCdv4nVxDUBhOUEf4ik3ayZGMehQCWEoXAqaVOe1NAlowxokGwCw+zcFG0gnAz
	VjdSi0HqgeKpoBx9d+paKJ5CZ4eVNhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790868026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjtqkUq7SI0M01/7Cb90z3i51OFWZf6Uy2zt1XoQ220=;
	b=8KJnqatC8m5d7Hm8B2Nr7FKibzeSFKPNeMfBTEfYNxIdWAJJK5aeeTHafPN69BXJ4nd8aD
	cUacAASDth6l9pCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60A1013B80;
	Thu,  1 Oct 2026 15:20:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /UTPDTp6vmouKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 15:20:26 +0000
Date: Thu, 01 Oct 2026 17:20:25 +0200
Message-ID: <87v77l1m86.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: dchristensen8 <dchristensen8@proton.me>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support
In-Reply-To: <0zWxXXeew_rreqULhlodJWrfM8Ew1UwF-6S7mK25YzO6_w574QYRYOlTNbInKVbIWGVZ0ZnVPhyXchVsbgQnh6dOmle--tPNROUu6MAuhHk=@proton.me>
References: <eFYfxKMV2ei__fURd-elssegCIVmOuRDne6lj9PMaM2bEgnYkz7Tzf6JLrgEaPZtvrUC_wHnmnwaUZAOdg0uh24nt73FQqi6T65qvJebHJA=@proton.me>
	<87fqys19vt.wl-tiwai@suse.de>
	<0UViNKefxgxrLggTEzDgzIe9-kh2EqU2Pnip6zuyJl1sthZtgJ-OIai3KBgkltft587c-ryvum1IqQZt-awOQTdrohMWKh79F3X8u6JOjuo=@proton.me>
	<87jyo24zu5.wl-tiwai@suse.de>
	<0zWxXXeew_rreqULhlodJWrfM8Ew1UwF-6S7mK25YzO6_w574QYRYOlTNbInKVbIWGVZ0ZnVPhyXchVsbgQnh6dOmle--tPNROUu6MAuhHk=@proton.me>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B304E1FD04
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 30 Sep 2026 18:09:54 +0200,
dchristensen8 wrote:
> 
> Thats genius. I reworked it with an ALSA byte control instead of sysfs and rolled in all your code cleanups for v2.
> 
> I set up two controls using IFACE_CARD and volatile:
> -AE-5 LED Strip": 300 bytes of RGB
> -AE-5 LED Strip Count: integer for setting the active strip length
> 
> Attached the v2 patch file. If you'd prefer anything named or laid out differently, just let me know.

I'm fine with those names.  Feel free to submit a proper patch for
upstreaming.

BTW, one more optimization: snd_hda_power_up() / _down() pair can be
replaced with a single call of
	CLASS(snd_hda_power_pm, pm)(codec);

Then snd_hda_power_down() will be automatically called upon its end of
code block.


thanks,

Takashi
