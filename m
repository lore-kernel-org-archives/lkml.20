Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628236;
	b=Indt7k+AKA3y/5B9swOJiw5oR+EbVrmzJlHzlyZSl0wvle5DHq23N06evVJTyz0nCYOY
	 skc+ScablQm4oiy7IGYfY11jb7F6NTnZRidnDbGDAsXvff31wSNq25HUkZKmB4z1txjKQ
	 Y2qBAm2s4C0AOjsgniSGoddvsNR46bbxl2+aezyc7RkrYeiA8ANBH8gvOmtu76Yq454WW
	 0gVQ/6XX/gTof5jFM/qVpWAHu6Kv1QTbF/rfjWHOdTMApTs0odTMvKogDXUvyKcca2gTN
	 TWs9nzubiihLlekgo5Vu1sOpl88DbYM4cppx9h3TC1Tc8u61hmt/KkDNNig4KwRM+Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628236;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=2exfNJAjFIm+V8iRAws74yjXejKyxK8RNSuUp596ULY=;
	b=Df6hWW3hmwTT0uC6OMipBtN2twh1Z6aaqkZmOL+fTCP4clAb4GDLFQVKIJvrREl+lZcK
	 rdnm0L/WeHWmzILWI2M0Y3MfIiuQWog5HZjeGu8M6wSUEQUZcymVoWrDhXnAU1/SLej6G
	 Jji+15MsoEqzQdVoknLJwUPlWg/QUCn2+grjMbQcY6Eqp0YTT1agL8h1xP0ZHBhFKSRXZ
	 ixc0rf0UC7ByUB0kfRD66qdVzhrqCZtsKCgFgImKdCFcbSoGhzy0tptrmu+Uw7OoUdQTO
	 jhg+3tHp4eacfmiMi9BCc4aou5d0APzIOdL0gOlnqJmWEJBww4fWEMcQT1sFlX1hUWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kQvVNbnL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wm3IyQs+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kQvVNbnL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wm3IyQs+;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17CF606A331;
	Mon,  2 Nov 2026 14:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17CF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kQvVNbnL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wm3IyQs+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kQvVNbnL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wm3IyQs+
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3702C2209D;
	Mon,  2 Nov 2026 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793628233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2exfNJAjFIm+V8iRAws74yjXejKyxK8RNSuUp596ULY=;
	b=kQvVNbnLQ5Bk+mSa61Cq4rr2uDKGhWSU+UBsTaMt0Lxur/LtoAmMtPnvdNFCkiyQuJUPL1
	1WtjzPzA5zZeGLuanhknuaGwyQ1IFEeD4Dh9M4LKRs6C/SD/4nK+CQz3jhE1CMtRD164QA
	WwzTR5KtBDvx9mQXsPwEChokn0hvwik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793628233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2exfNJAjFIm+V8iRAws74yjXejKyxK8RNSuUp596ULY=;
	b=Wm3IyQs+YnEqBfOq4HtkoispvZvaCD/itopMe/qeXoTIKcwoEQdq+p/ZXsYibGcmOvAaW3
	SLCMI/tGlTTwk9Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793628233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2exfNJAjFIm+V8iRAws74yjXejKyxK8RNSuUp596ULY=;
	b=kQvVNbnLQ5Bk+mSa61Cq4rr2uDKGhWSU+UBsTaMt0Lxur/LtoAmMtPnvdNFCkiyQuJUPL1
	1WtjzPzA5zZeGLuanhknuaGwyQ1IFEeD4Dh9M4LKRs6C/SD/4nK+CQz3jhE1CMtRD164QA
	WwzTR5KtBDvx9mQXsPwEChokn0hvwik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793628233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2exfNJAjFIm+V8iRAws74yjXejKyxK8RNSuUp596ULY=;
	b=Wm3IyQs+YnEqBfOq4HtkoispvZvaCD/itopMe/qeXoTIKcwoEQdq+p/ZXsYibGcmOvAaW3
	SLCMI/tGlTTwk9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2C4F134B3;
	Mon,  2 Nov 2026 14:03:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xgXtJUiY6GreHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 14:03:52 +0000
Date: Mon, 02 Nov 2026 15:03:52 +0100
Message-ID: <87zevr8h4n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Isma=EFl?= Bahloul <i.bahloul01@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 0/8] ALSA: usb: add RME Babyface Pro driver (proprietary mode)
In-Reply-To: <20261027113140.134257-1-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
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
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 27 Oct 2026 12:31:31 +0100,
Ismaïl Bahloul wrote:
> 
> Hi Takashi,
> 
> This is v7 of the RME Babyface Pro proprietary-mode driver.  The split
> is the one you asked for in the v4 review and that v5 introduced: a
> minimal core first, the mixer added piece by piece, suspend/resume near
> the end, the front panel and the DSP EQ last, and a design document.
> v7 keeps that split and folds in the fixes made since v6, and is
> rebased onto next-20261026, the most recent snapshot at the time of
> writing.
> 
> This is not an RFC.  The split you asked for in the v4 review has been
> in place since v5, the open points at the end are documented and none
> of them blocks a merge, so the series is submitted for merge rather
> than for another design round.

Thanks for the updates.  The split patches look much better than
before, which made easier to review.

I haven't fully reviewed in details, but I see you've received quite a
few complaints from Sashiko, so please check them again, and fix if
they are valid.  If they are to be ignored, just explain.

In general, a few things I noticed:

- Please try to use the new guard & co macros for spin/mutex locks and
  RCU.  They are much safer than manual lock/unlock.  (A caveat is
  that you need to be careful not to mix up with guard() and goto,
  though.)

- The inner loop of babyface_playback_copy() and *_capture_copy() can
  be simple memcpy().  You basically copy each 4 bytes as-is and they
  are continuous for channels, after all.

- The bf_seen_before() may lead to unlimited amount of list contents,
  which isn't really good.


thanks,

Takashi
