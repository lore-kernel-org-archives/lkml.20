Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D61949A3CC;
	Mon, 28 Sep 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592988; cv=none; b=CN//rAeBc2q/1NVAsIg6C+uXxdpl9Jngy1Hr397mB0cX/IEqkCbEJ4X3iXcx9/sXATcOuHhzlFpEIq0I+0TMA4TDRFl/+MChOQJ1Yxw++bCDvGa8U4Zi9pARohM6IBL9zmKO17Wy7zNfDdIp+GvliWr9SLHFDUIAK38SCnf2Ioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592988; c=relaxed/simple;
	bh=n5qCbEXulhnzKpIIeOqPBoOTno0U1+oSB2fFl8KmI4A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjG2eNTZjamDQcJwIbko4NxRYa2wmSQsPWDS24HszkxVAg8/AoL1wveMg1ri2lEqYMVO92v/yxZ8X9euq+m4YMu72+0oxn+xNJ1AGqEOgCkf6S//tgu4YxMIBk5XKbt4VPZrgk/wjN/N7si7dNUCXgyJKMnNUCpOWUaa9YCm6kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VK+T/3DB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6CL9FF/Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XILyU7VO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HUgP4LBe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VK+T/3DB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6CL9FF/Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XILyU7VO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HUgP4LBe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B04D9226E2;
	Mon, 28 Sep 2026 10:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790592978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnfeABNCaT2B7EM/i7I36qnR6ZUPTQ5UXG0Isu4aaS0=;
	b=VK+T/3DBuPbINqxhHCC7k7EHrtSuONa1KZM8f5Sc0gf8NEHywn1B/wiZv5wM+0RlNhSYJJ
	9rkuL4d1NsckjtrcOtDkDtgAUqDxWLnaDuRyYrPBeXMqEmYtyIKiZtrAqqP1+GK05agKQK
	kUkPtUt2KeoS1gnQYuVFQzmQSQ6amgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790592978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnfeABNCaT2B7EM/i7I36qnR6ZUPTQ5UXG0Isu4aaS0=;
	b=6CL9FF/QYEsOhirfpZV3TjK4lju4HrtsdyUGhXRBUTx9RzdbJRqdSrqxXGoqtRegFAcT0E
	rXPldGIC0wsI40Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790592974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnfeABNCaT2B7EM/i7I36qnR6ZUPTQ5UXG0Isu4aaS0=;
	b=XILyU7VOH8AqXwbv7V05dIPPEw4VoUvR+aCSoPFshK8xpnIoTpKwmLg1l9ys/N1K7Jvekn
	YGmfJF+6QU0FEF3Rd1+dLAZND275t9hb1+/OCMQRAu0tzRudYXuEepaMgHQzXA4n8DNASK
	gQmsoTKhNibXAECF4/CSkoj8XsHXlks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790592974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnfeABNCaT2B7EM/i7I36qnR6ZUPTQ5UXG0Isu4aaS0=;
	b=HUgP4LBes5LLNyws9Ael7aDREulJyfKMT9x5/tLPPTVx7OtsUrdTdmKiulfZEyXC+Y+r/Q
	befSRLtsdNFTgnCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 756C8133F1;
	Mon, 28 Sep 2026 10:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GBdDE85HumqYHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 10:56:14 +0000
Date: Mon, 28 Sep 2026 12:56:13 +0200
Message-ID: <87ld8l7igi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2] ALSA: seq: Mark OSS sequencer emulation as deprecated
In-Reply-To: <20260912124951.416761-1-tiwai@suse.de>
References: <20260912124951.416761-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO

On Sat, 12 Sep 2026 14:49:45 +0200,
Takashi Iwai wrote:
> 
> OSS sequencer API emulation has been implemented as a client of ALSA
> sequencer, decades ago, at the time where OSS was still use.  But the
> API itself became very niche, and almost noone using it for a real
> purpose any longer -- only exceptions are AI and fuzzers, who have
> been causing significant maintenance burden for issues they hit &
> found.
> 
> Meanwhile, the most features of OSS sequencer API emulation can be
> achieved in user-space, either by ALSA-OSS layer (aoss) or oss-seq-emu
> program:
>   https://github.com/alsa-project/alsa-oss
>   https://github.com/tiwai/oss-seq-emu
> where the former is LD_PRELOAD wrapper and the latter is a CUSE-based
> daemon.  So we can drop the stuff from the kernel sooner or later.
> 
> Now, let's mark the OSS sequencer emulation as deprecated and give a
> warning when loaded, so that we can drop it later actually.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Since there has been no objection, I'm going to queue this for 7.4.


thanks,

Takashi
