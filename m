Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021916;
	b=sch6A8dv4vwTYHP5tDDqBxI/V6oeVE8oq+6S6cyYvu7P62lm7NxXDpCMtv3lI3/YPW0K
	 Is2gXEEPiyjm+Say+dg/IoRDR/qXd/E3T1rdNA7wmvIOh6xE2kVfsH77F6GwVzeFaUYxX
	 tNrpPosNR+ZMysAtiZUzcG78Bwp13okNo5sef+cOoSxHe8fpWyk+mbMU8daAUi1acsFhe
	 fgQfqDUtEL7yOLSahZSEgog3l1Saqn9ohHui+j6MgOOzXZA3GHopZojSvPiigCaIm2mwt
	 YFSdK+KhyuzAsgpaest94pTgoqEYIkCz8vAAXNnGvC2c0TQ9Rc/hWIAfBGfPPq/qZiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021916;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=eHOfMK6o0REgr2trRNcLayc/qQKn8qWFAKOukLvltc4=;
	b=ItmLg7uBYzcTlGZlvEx/UpCC/lPuz05RS6doJXEDZYZxzzu+wZ/MHf3sZiJEP8tMG/HY
	 tTzpGWcTIbx62p0M6YSOkX7YfyZ5eOlzvX11ug4o418FSvTJHnPxhyLdr8awCYuYg4V9V
	 JBXi6DLMrjjBLOyv5Rd7U9EwYc6Ccfcg6QHqln+6IBZYFYeiVczJsO0ulJ0/oAe9ja8xW
	 0CXE2eJeq+LQtV3i2WE3wYfVF/knSudhLekZqUGOrvEmDDLJFnBAXZ6c4zTi97MRHTsOA
	 EcZihyVqM5X3eeG52bpj9ouLoOQSZ8ueN1RX0T5W29LfGMPWhCg7BPyMW/xFRsgh56Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mtpkOCsm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/4Ip0aOS";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=i5TtyA21;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wpg2m4gK;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE5606A31E;
	Mon, 26 Oct 2026 13:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AE5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mtpkOCsm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/4Ip0aOS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=i5TtyA21;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wpg2m4gK
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54A4A21F41;
	Mon, 26 Oct 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793021913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eHOfMK6o0REgr2trRNcLayc/qQKn8qWFAKOukLvltc4=;
	b=mtpkOCsmwAXbiazzrR1CFdXNTZYGEz/SUFNqSTR3pNt4KU1t8KIzue00dXFwHt9ZIQGIwb
	XwbAaec/EUNJZbChTNfEBGBYGWp6eJoeA5/z8bujYtcQ8MaA+mU92yN9umEF0oeWog4jXv
	rmXMLcaoCePGtwKNW+/AF+BGVd7J9UY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793021913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eHOfMK6o0REgr2trRNcLayc/qQKn8qWFAKOukLvltc4=;
	b=/4Ip0aOSk7E6q1axaw4mW2+dftZKtsE8r506BdNl396EIwFf+2NX13FL/vg0ax8sOjOkBR
	UW720kjJ/iiLB+CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=i5TtyA21;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wpg2m4gK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793021912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eHOfMK6o0REgr2trRNcLayc/qQKn8qWFAKOukLvltc4=;
	b=i5TtyA21TyYPJlFKAbbXh+MNccFtuAtwvxiyCEykCdA9PhrvYXQtbIh/y3ayuZyiRIR+4T
	4PjZlflkY94/USpwF4qlj7+e/KEeM/vOVL3RN/M4EE0anDToaTT2vkjzclUaijat5vB5NF
	XyK/pSjS6/nv0GTAiKoVZibCSoogVfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793021912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eHOfMK6o0REgr2trRNcLayc/qQKn8qWFAKOukLvltc4=;
	b=Wpg2m4gKgi82+Hz9UfGO5qcYFVTkjvzpUnQGWNG5VydJ0L7RgRk9WDrXEpUVzVLzrDhJ9z
	cl+GCxJZwOCynmAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02F5C13408;
	Mon, 26 Oct 2026 13:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Oj1L9dX32rRAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Oct 2026 13:38:31 +0000
Date: Mon, 26 Oct 2026 14:38:31 +0100
Message-ID: <875wyo60q0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: x8svc <enscrpt@pm.me>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio, ua101: oversized packet copies overrun PCM ring buffers
In-Reply-To: <20261026122855.283-1-enscrpt@pm.me>
References: <20261026001003.1067-1-enscrpt@pm.me>
	<87tsm86fzy.wl-tiwai@suse.de>
	<20261026122855.283-1-enscrpt@pm.me>
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
X-Rspamd-Queue-Id: 54A4A21F41
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,pm.me:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Mon, 26 Oct 2026 13:30:07 +0100,
x8svc wrote:
> 
> Takashi,
> 
> Thanks for the review.
> 
> x8svc is my standing identity, not a name picked for this one patch. The same
> name signs every commit I push and is the account behind my public GitHub
> work; I expect to keep using it for any future kernel submissions too.

Honestly speaking, I don't care about github activity at all.  The
only question is the activity in the kernel community, and I don't see
any of such until now?

> Both patches already carry matching From and Signed-off-by lines
> (x8svc <enscrpt@pm.me>), so unless there's something more specific you need
> to treat it as a known identity, I'd rather not resubmit for no reason. Let
> me know if that's enough, or what else you need.

The Signed-off-by is the only concern.


thanks,

Takashi
