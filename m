Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306552;
	b=Z6HT4etf0u/cexp9hCMBZLsOk1NswquTC/w/iQopB55XCvSEGs/Ih1RfIkXHKatsEa7t
	 sMEqJ1Z/9GfB3LPLtvOHUXJ18wZlIULlcfWBPfPpJE8aXC6xcoz8cmW3+5wMcOC3QGIHj
	 9SKCTRaibCpm+clzuBn/mOA3/NQNF4SMkzUpVGrFPaw3fAmGrsBvL/mo0zzYLPoPuGSd2
	 CGzDATQaGRjKd/hbQpBbVGpq/7Nq1L2J+/xaxW36G2cPa0Vuoh8Fk/z1tfDup5z0gbPSr
	 dNIupt4TyYch++Cc3yV4kNrdAN5i0NZmOjo4ea/DcAVqBEsPCrhj93tJ+zCFOvbwaDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306552;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=1w7nhoGP5cDBEBDIojcBKZ5WVNLxVydoqz2uszDTDI4=;
	b=ZanOj7c8ZCvq6jOomYSyX0gfdOh25OuR7KTVpTJqrN4sFEAM7R2ur4XSZFwA8EHYdtkx
	 X8QeBnWHPh2duH+0SPSoDPZFRI/WO2L6gRwo+rCffg+AZ6a8xVNjSSsX66DQXiKxrE9ku
	 BFhwTAH/A0TKDnYrn64BFGpAiXVsyghomybIqqYrB7VY+07x+xv/Y64yZCvKQ/wIH8ufx
	 UC0QiuK4DAlq3b/9TS8u/qw+u1r+WGltA5WWLBbdp5V1N4b/MCmp3nvSC78QdNGLvMJeJ
	 JyTbuHKqC3WrFJUwIvYwiSm9BWeP0gT4oyAKCAtESTTS0Kd7uzIZBGBGKUfTJPXspWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="kjv7JmQ/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="C2raIa/a";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="kjv7JmQ/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="C2raIa/a";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2321E606A325;
	Tue, 10 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2321E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kjv7JmQ/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C2raIa/a;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kjv7JmQ/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C2raIa/a
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 701F31F7D9;
	Tue, 10 Nov 2026 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794306550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1w7nhoGP5cDBEBDIojcBKZ5WVNLxVydoqz2uszDTDI4=;
	b=kjv7JmQ/KTXB7BssAKTKF6S1mm4PnyF0Sw3WPcb8F8l7piev9aYyuktb40mrSxu2a38bfW
	BnGkSa7GDsrjCqv+D9RJZoiDSY7dpAbDXtpblVwOsU40wLC+NKmUPao2o9+WbOAftP7/oH
	CNfaQcHgy6LBDo3u5KJ+KZQLnH21weA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794306550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1w7nhoGP5cDBEBDIojcBKZ5WVNLxVydoqz2uszDTDI4=;
	b=C2raIa/afEv84dNWH4+tqQGdRrhHdx6VvQKMl71AKlU/QgjR42n0cVVIIWIFAKI8oSE65d
	pQV0agRBziFYPHDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="kjv7JmQ/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="C2raIa/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794306550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1w7nhoGP5cDBEBDIojcBKZ5WVNLxVydoqz2uszDTDI4=;
	b=kjv7JmQ/KTXB7BssAKTKF6S1mm4PnyF0Sw3WPcb8F8l7piev9aYyuktb40mrSxu2a38bfW
	BnGkSa7GDsrjCqv+D9RJZoiDSY7dpAbDXtpblVwOsU40wLC+NKmUPao2o9+WbOAftP7/oH
	CNfaQcHgy6LBDo3u5KJ+KZQLnH21weA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794306550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1w7nhoGP5cDBEBDIojcBKZ5WVNLxVydoqz2uszDTDI4=;
	b=C2raIa/afEv84dNWH4+tqQGdRrhHdx6VvQKMl71AKlU/QgjR42n0cVVIIWIFAKI8oSE65d
	pQV0agRBziFYPHDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C0651339F;
	Tue, 10 Nov 2026 10:29:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C1EVB/bx8mr2KwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Nov 2026 10:29:10 +0000
Date: Tue, 10 Nov 2026 11:29:05 +0100
Message-ID: <87zevhugi6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: ump: Fix RPN/NRPN handling at MIDI 1.0 CC conversion
In-Reply-To: <cover.1794141913.git.sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
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
X-Rspamd-Queue-Id: 701F31F7D9
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Sun, 08 Nov 2026 13:47:47 +0100,
HyeongJun An wrote:
> 
> Hello Takashi,
> 
> As you asked in [1], this puts Alyandra's selector fix and my fixes for
> the other RPN/NRPN cases into one series, for both the UMP core
> converter and the sequencer.
> 
> Patches 1 and 2 are Alyandra's [2], without the KUnit test. Selecting
> an RPN now clears the NRPN selection and vice versa. Patches 3 and 4
> keep the selection after a send and clear only the data, drop data when
> nothing is selected, and handle a Null NRPN like a Null RPN.
> 
> What a MIDI 2.0 receiver gets, before and after the series:
> 
>   Input                                    Before             After
>   Null RPN, Data Entry, select RPN 0/1     RPN 0/0 = 0x40     nothing
>   Data Entry, select RPN 0/1               RPN 0/0 = 0x40     nothing
>   RPN 0/2 + data, data again, RPN 0/1      0/2, then 0/0      0/2, 0/2
>   Null RPN, Data Entry, select NRPN 0/5    NRPN 0/0 = 0x40    nothing
>   select RPN 0/0, NRPN 1/2 + data          RPN 0/0            NRPN 1/2
>   Null NRPN, Data Entry                    NRPN 127/127       nothing
>   select RPN 0/127, Null RPN, data         RPN 0/127          nothing
>   RPN 0/1 + data, CC 38, select RPN 0/2    0/1, then 0/0      0/1, 0/1
>   RPN 1/1 + data, RPN LSB 2, data          1/1, then 0/2      1/1, 1/2
>   Null RPN, RPN MSB 5, data                RPN 5/0            RPN 5/127
>   RPN 0/1 + data (unchanged)               RPN 0/1            RPN 0/1
> 
> The 0/127 row and the last two changes come from holding the RPN/NRPN
> numbers, as a MIDI 1.0 receiver does.
> 
> I checked the core converter with a local KUnit test over 35 input
> sequences. The 17 that changed are all of the kinds above, and the
> others give the same packets as before. The sequencer side was run
> with a legacy client sending CC and CONTROL14 events to a MIDI 2.0
> client on a patched kernel under qemu. That test will become the
> selftest, with Alyandra's cases added, as a separate patch.
> 
> Two cases are left as they were. A CC 6 alone waits for a CC 38 or
> the next CC 98 to 101, so a second CC 6 replaces the first instead of
> sending it. A CC 38 alone after a send waits the same way, and when
> the next CC 98 to 101 flushes it, it still goes out with MSB 0, now
> under the kept selection. Changing those would be a separate patch.
> 
> [1] https://lore.kernel.org/all/878q33y4z4.wl-tiwai@suse.de/
> [2] https://lore.kernel.org/all/20261107111056.667-1-alyandra5b@gmail.com/
> 
> Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.
> 
> Best regards,
> HyeongJun An
> 
> Alyandra Zahran Nadhir (2):
>   ALSA: ump: Clear stale RPN selector on NRPN change
>   ALSA: seq: ump: Clear stale selectors in sequencer conversion
> 
> HyeongJun An (2):
>   ALSA: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion
>   ALSA: seq: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion

Applied all patches to for-next branch now.  Thanks.


Takashi
