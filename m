Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928424;
	b=PmWvK0c5aggBABEjooyO9OLgwGmbG2AWiDAHucp3As4eGBRRw4EvMqSj+ELPNZOoClY7
	 8XpTRAvSioECQkVzVcj+z7Suy8ESqs0BR4PZFYX2BSoajCohHynsDbBP7bCGSriT8wsgj
	 T0JvBryfPj1W5ZSw3pPhc3J6EFbcKihG+oXfx1K/VRH4pnIpFDWbnS4nfsk4i7qOItv76
	 Qt3njSAJ1iDs6fNvSKJvtfI/0vhGx1kcpp9MiFPlNyL2cc4WI/LbkyDjdQBxecv89nCgh
	 LOcDY7CzbT2KNeRFLQDX7GSOvYcW12Ux4uGd2gmhOPqL+H2JFBSH1TVnKyyBBbDotBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928424;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=5bywH9Z+lJsAxzSeeoFsm7ea77DXoKZ0Ta2n8SrOMJ8=;
	b=l2Nh6ckWjMfn4/MS6INrXG7EBnlEvMTy/M7wQuS00UQIJ6pVPBSGN7UEoHneWHqr5lAq
	 8SKFr5CZV5V8ge0U3ks0brMC/7/spm2Vxt4nLL3G8fmAnbhjtv9Q0eYbPrevAbPsKqH6J
	 CDlnvt/FTQyzCHmEZ+X1Vh0fORWcfZEGibuAjlYWGxbn619TNs/mFCCQNaDK4wfbuMsPI
	 0EQ+7l8S1LkfFg3Y9/Nk5OZ7jKnRypd3Q5JjHRQ/pQdRAAABzXw4NRSd0mFsHKL1f9acB
	 J1g0VnsZbqrqQ6qyqq5tz6pF77dWEGD8ktMTSFL70l55wdZ/P/pVUVW0rU2QL7CUuLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oQ1I10S7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bQ2MhsfT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oQ1I10S7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bQ2MhsfT;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBF606A31C;
	Tue, 17 Nov 2026 15:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FEBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oQ1I10S7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bQ2MhsfT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oQ1I10S7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bQ2MhsfT
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D17721FA3;
	Tue, 17 Nov 2026 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794928422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5bywH9Z+lJsAxzSeeoFsm7ea77DXoKZ0Ta2n8SrOMJ8=;
	b=oQ1I10S7AcCaFbtDw43HzI7zRshQsWqFOHL0ZNxFUJdRUM1ZFm4us5FC5GQNnzwqy+TYch
	8KSQQXSi+Mk+mte5Rtmn0quo5bNQTTC+n8HunlgiJ5sENnvHImVkM6jSm+eCoCVX9Jky/w
	Xz7a/UI1PpPUIArcwgl33V2ynBVNN9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794928422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5bywH9Z+lJsAxzSeeoFsm7ea77DXoKZ0Ta2n8SrOMJ8=;
	b=bQ2MhsfTJmfobONknq/DzZ9vMV5Ppi3R4XaESqROjgzzmg13x1hgHjXLTRUXCQMuV0+xDM
	PAZhaKm3mf26JeBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oQ1I10S7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bQ2MhsfT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794928422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5bywH9Z+lJsAxzSeeoFsm7ea77DXoKZ0Ta2n8SrOMJ8=;
	b=oQ1I10S7AcCaFbtDw43HzI7zRshQsWqFOHL0ZNxFUJdRUM1ZFm4us5FC5GQNnzwqy+TYch
	8KSQQXSi+Mk+mte5Rtmn0quo5bNQTTC+n8HunlgiJ5sENnvHImVkM6jSm+eCoCVX9Jky/w
	Xz7a/UI1PpPUIArcwgl33V2ynBVNN9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794928422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5bywH9Z+lJsAxzSeeoFsm7ea77DXoKZ0Ta2n8SrOMJ8=;
	b=bQ2MhsfTJmfobONknq/DzZ9vMV5Ppi3R4XaESqROjgzzmg13x1hgHjXLTRUXCQMuV0+xDM
	PAZhaKm3mf26JeBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB9161334C;
	Tue, 17 Nov 2026 15:13:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ByQ+GiRv/GoLawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 15:13:40 +0000
Date: Tue, 17 Nov 2026 16:13:40 +0100
Message-ID: <87qzgjxzh7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
In-Reply-To: <20261117062808.2807-1-sreekuttan2156239@gmail.com>
References: <20261113110427.4256-1-sreekuttan2156239@gmail.com>
	<20261117062808.2807-1-sreekuttan2156239@gmail.com>
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
X-Rspamd-Queue-Id: 1D17721FA3
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
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Tue, 17 Nov 2026 07:28:08 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> Thanks for reviewing my other patches.
> 
> I noticed that this patch is still pending review. 
> Could you please take a look when you get a chance?

I'm still considering whether it's safe.  The open code in the error
path looks a bit scary.

Aren't dma_buf_put() called already in snd_compr_task_free() that is
called from snd_compr_task_free_one()?

Also, a bit concern is that we expose to user-space before actually
installing the file descriptor.  I don't think there will be so much
race here, but just need to be sure...


thanks,

Takashi
