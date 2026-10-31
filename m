Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793470021;
	b=2yJ7DAjRklzH9UIOCXEdHbNSXJ1iX39+eGBbBUvVEGFMDgzuV2HfqXDe2k03MLBux1m4
	 c5t/X4hRtPz/P6tDTk5h8OTvuf+dPFs/HG0+TwWLPM50K4vGGb+vdHpq4HelhJpgDkdGK
	 93JbqEgXlvhrrWb4SfatkEGIYszQxCeQayup7CJSPRfaQbJIkqqlEvsV4avbnbkQQJGyP
	 XNo3huydtmw10aEy2pDe4SDFDdmLkXwidmw+sWC7pXMCf46kKLv4bqnEVBjKf9evl5cA3
	 AvH4qcmaERuVK4ChmiTCW7TKhCjPg7YtFLditZrM82ZMps82/zdz++s58+JGJLKtsTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470021;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=97IOB3KBTBB1Ps/2cLF9xPpHL4RwmRxv9hOhGLTCjyg=;
	b=Ipd+YBMfxvt0/O0rFgBDGmnrKC6kJbiUe40o5lUWTz+tECD/6kwxGmiAPKB27/8RM13J
	 2lnDDVJt1yaLjQ2GgZVm97P8O7g90VlSWqliCLbLjR4tJQ5aSafXuqp5YMcK7M6PFRyML
	 LjYOMM7qKQug/s57L8dnLrDrcWZ7G1y8DImtnMUxZCwd/PxSkm/c92jHP5Ks2IG9CzJYw
	 7HtsgaApBXdxdRD3K/FOGaDc0jKSGS/jbr1DeMQFnu19QvpnjSmfcXJHTYS6PiEh/Dmgx
	 s+Gv16nQYgqmCkWZSzt+rFtMYojuLS/cCuTAKjtWVlPiBgMkDqLNAj6BMEuTUghRPYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jo5nDAaT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="HxfRsX0/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rdH8j4qU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y3rkQQpE;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202E606A31A;
	Sat, 31 Oct 2026 18:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1202E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jo5nDAaT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HxfRsX0/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rdH8j4qU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y3rkQQpE
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC9F31F455;
	Sat, 31 Oct 2026 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793470018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=97IOB3KBTBB1Ps/2cLF9xPpHL4RwmRxv9hOhGLTCjyg=;
	b=jo5nDAaTyTWI6uwUrCeMqMhZ/hgiY2SNWwCnffGMhS6aJnFO+GtDa89vKSQt5/jrV8eF1H
	oIDjukkZtSRqO5OmAzfDdf5Dmwxbf0z9k78ONQHlydYmShAS961+6VOt4DekPjnDXbTL1s
	C2u2e9LhJDBXMxgQc3JyalLLwPof3o0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793470018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=97IOB3KBTBB1Ps/2cLF9xPpHL4RwmRxv9hOhGLTCjyg=;
	b=HxfRsX0/ov2IzgFPF32sXxXmFrzJrxw3qo21Uthrw12MMCEVcumHVGU/hYj6oU63DIdlAF
	i6dXwXbzJ/7RSkBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rdH8j4qU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y3rkQQpE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793470017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=97IOB3KBTBB1Ps/2cLF9xPpHL4RwmRxv9hOhGLTCjyg=;
	b=rdH8j4qUwi8yIGUAhg/XKg40NZZeCpwMQP7reyIcg5Hg1dM+Jrs8s6/G/CEp8KMePlD1t7
	BHGzduQaqG/EDuIQrRkQOYP4R7huc/ZmPoh4oNExha/VR0EGAxtSir7tODIhMpSjlUKewK
	9NtEa9heqjxx8tx46PtBnvC5u+VVmA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793470017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=97IOB3KBTBB1Ps/2cLF9xPpHL4RwmRxv9hOhGLTCjyg=;
	b=Y3rkQQpEzl3MOKhjWGO/FbcwkHBouWaOopxgu3R9vVvYYUm5RncxqpBJjZ6Hr9McvR54tX
	w15QZ+L+ad6QenDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D90113432;
	Sat, 31 Oct 2026 18:06:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QNYnFUEu5mrgKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 18:06:57 +0000
Date: Sat, 31 Oct 2026 19:06:57 +0100
Message-ID: <874ie1rbge.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] ALSA: bcd2000: fix use-after-free of MIDI URBs on disconnect
In-Reply-To: <20261030.pref-21.8c455f52f06f402f@stu.xidian.edu.cn>
References: <20260923103116.1666-1-25031212351@stu.xidian.edu.cn>
	<20261030.pref-21.8c455f52f06f402f@stu.xidian.edu.cn>
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
X-Rspamd-Queue-Id: CC9F31F455
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Fri, 30 Oct 2026 18:37:13 +0100,
YuanZhe Liu wrote:
> 
> Hi Takashi,
> 
> Could you please advise on the status of this series and whether any
> further work is needed, considering the related upstream fixes?
> 
>   [PATCH 0/1] ALSA: bcd2000: fix use-after-free of MIDI URBs on
>   disconnect
> 
> The series addresses MIDI URB lifetime on BCD2000 disconnect. I noticed
> the related upstream commit below and would appreciate your guidance on
> whether this series is still needed.
> 
> Related upstream fix:
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux/+/459d3a64766f5ca2f1886daeaf24582831a5f5ab
> 
> I am copying this address for visibility.
> 
> Original submission:
> https://lore.landau.one/lkml/20260923103116.1666-1-25031212351@stu.xidian.edu.cn/T/

The patch doesn't seem applied cleanly to the latest code.
If the fix is still valid to the latest code, could you rebase and
resubmit?


thanks,

Takashi
