Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417926;
	b=lxN7oXhmKzhqC3yucfzJbE6zZCagiZ8cN4uCpsCBmsWGTx2xk2XGFV9Su6N0jCvTUAjT
	 jSYuAvZKKO9RSJdfFP5QJPlAH/Nc1PtFtVYFta3//k8wM4b50ydlFwdu69G3XbTnwI81G
	 lZewfLIlEffUTQeXjC9K3pnPPLEXQ/8ZPNW1tvxByO2c+++nf3Vr/e06cw2iI5jYuF4GB
	 OVMPUV38/rMUbybAy5nbiSkZxCOD7rrBFrCoEIkiXglulCJd4XFTw7UkwxzdtGuceGxJE
	 zceEXECA0ekWldaWRsQ8QRIeKqXxJs+DZwPR3T0saA9m/rD5BTk77NJik5JUC0AJDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417926;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=JYIEpsAfOdGDX699CIxDE/GjPtBB2UQcKfD70Im8YM0=;
	b=mKhwvtHTsNX90R5Usz8xcFFsLHuj3e5PXjjDpDY5B+Fk0uZSO7QFNEU9i8z3TVEorZQu
	 cA7bCKwpxELxWPfWBBJzRVPaD4tj+BdkLokhBOCsdRlCiHf7rkjWd5cM0j9v+TE46YnGu
	 HaS5T7qijJF6XPjWFfDcii2frYzbDh/qzqDjWLT79QMCzUVKxU3vzBIWJXIVtsWFodsq/
	 14VfopCfSdXEtS9idqGTTr+M5rlLVG3kmRB0Z/pTrm+a1TclyxKJLAs4yTEkvmZda0UCn
	 OhjR8lI6tIlTmInfeTYhPNDmijr7Sx8EE2IOxglX2fVO+PUsdvxZgS1WJTqaw6XezEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo22Cq+R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hp7MHyZD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo22Cq+R;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hp7MHyZD;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB965606A884;
	Wed, 11 Nov 2026 17:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB965606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo22Cq+R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hp7MHyZD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo22Cq+R;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hp7MHyZD
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1BF6521E87;
	Wed, 11 Nov 2026 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794417924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JYIEpsAfOdGDX699CIxDE/GjPtBB2UQcKfD70Im8YM0=;
	b=Eo22Cq+RulkIas5FHRLN+PCvZMOQq/Fc9A94VPO8zOYzfYotuytLyUEkidQecvrVwpvInp
	Jizm6aLpDLTHGjK/62IP6a+WjATONHbjaqaSoi79VCJQvqFduy0M1tjRNijwNQw4sqHUno
	jMaPU4kVHhaTUHFeznP8JutLIDctAwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794417924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JYIEpsAfOdGDX699CIxDE/GjPtBB2UQcKfD70Im8YM0=;
	b=Hp7MHyZDNLzfZ/GM3+9WM0XKrUBoWpXilqS+1it1ALBh5HhWVyes9EBIxweAR7g6O0KhMK
	hjYQF/rNNTCRIeDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794417924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JYIEpsAfOdGDX699CIxDE/GjPtBB2UQcKfD70Im8YM0=;
	b=Eo22Cq+RulkIas5FHRLN+PCvZMOQq/Fc9A94VPO8zOYzfYotuytLyUEkidQecvrVwpvInp
	Jizm6aLpDLTHGjK/62IP6a+WjATONHbjaqaSoi79VCJQvqFduy0M1tjRNijwNQw4sqHUno
	jMaPU4kVHhaTUHFeznP8JutLIDctAwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794417924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JYIEpsAfOdGDX699CIxDE/GjPtBB2UQcKfD70Im8YM0=;
	b=Hp7MHyZDNLzfZ/GM3+9WM0XKrUBoWpXilqS+1it1ALBh5HhWVyes9EBIxweAR7g6O0KhMK
	hjYQF/rNNTCRIeDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 990C71339F;
	Wed, 11 Nov 2026 17:25:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l/HcGgOl9GoLRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Nov 2026 17:25:23 +0000
Date: Wed, 11 Nov 2026 18:25:23 +0100
Message-ID: <87y0azs2kc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Angel J <iamanaws@httpd.dev>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
In-Reply-To: <TDT6b_7cMUkRNo88Xj3i3Ji--f4WdAmawcBXuT3TmHzVrxy0Xhr6il-PPdh6dbodGGrapwWjGx1KWruC5fAjw0cV27lhGzJ0HRWJmLgfwrY=@httpd.dev>
References: <20261103150336.507675-1-iamanaws@httpd.dev>
	<87wlqtukxh.wl-tiwai@suse.de>
	<5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev>
	<877bilusui.wl-tiwai@suse.de>
	<57Kgu-Pdq28OE2JHZjO7YEuS6RCOZLFiDoZO8uqMUieYwA58mHOkRbbZADWKNQsocsNCzH1GkU4pSEhpi-l3mZenIkWdjdNsOHVlbAxGsXQ=@httpd.dev>
	<87bj7wvkpx.wl-tiwai@suse.de>
	<TDT6b_7cMUkRNo88Xj3i3Ji--f4WdAmawcBXuT3TmHzVrxy0Xhr6il-PPdh6dbodGGrapwWjGx1KWruC5fAjw0cV27lhGzJ0HRWJmLgfwrY=@httpd.dev>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 10 Nov 2026 17:24:15 +0100,
Angel J wrote:
> 
> On Tuesday, November 10th, 2026 at ..., Takashi Iwai <tiwai@suse.de> wrote:
> > Honestly speaking, the problem is that I don't know you, so I can't
> > trust.  If you have been involved with the kernel development long
> > enough, e.g. already appearing with "Angel J" in many threads or
> > commits, then it could be a good sign that it's a trustable known
> > identity.  But it doesn't look like that for now...
> 
> Hi Takashi,
> 
> That is fair, I am new to kernel development. Outside the kernel I am
> an active open source contributor, mostly to NixOS, with over 100
> merged changes in nixpkgs and contributions to other projects from
> this account:
> 
> https://github.com/iamanaws
> 
> I am not comfortable publishing my full name in a public archive. If
> the above is not enough, is there another way I could establish the
> identity that would work for you?

Well, although I'm not comfortable with the situation, the code change
itself is so trivial and can't do anything seriously wrong -- so it's
not wise to delay it just because of that, and I took as is now.


thanks,

Takashi
