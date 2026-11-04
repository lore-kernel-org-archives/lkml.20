Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803317;
	b=xp3yOQxFrPaiZ36LtdU/UQPop4mFtQ5CVesWnHjiMbCl1jgWwssZRqPyFQn+KN3baaUu
	 RLYk7dpDmUx/q1jO9xvk5g+M8wQEQPBKSy5JHkfZQHBboH+e7nYJfadVIhOzpTDxGqF+x
	 axqZplV3STkCCF5M1YI33C37kVD3qnU5dvN6ycrnHDSnLfsQ6tVJsJDLQBx0tQhHNQdME
	 dhGJwHsX4ofU3iUK4PIJvEDKYHnh6hoRjMOaW0GTtOrwP1hIP8dGIL2x+rEq4NdID5UnV
	 RIPBrmGaiOuMzRXY70ZR2rm3qVhCiMKTFBzPbcbWrHJrLmrjjexgwnt4Or4btbGFdbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803317;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=OlAtB6wp4Rxg9m5TZVPBBQubE31obnHvFW2n9aoXtc0=;
	b=uSuVHEjbxC1jufPjZdYWVWzHXwTOqpa4ATsofmAu5V935Bm5nCOXIuD4+59Q4E27eirZ
	 fC6xyNnjw0AvafUpc+JIk3dSO8qNjnL1v/0APFJovAjD+LSEC3drK2s8v2ci4vLmNzUlm
	 1x4dWISyItrJ4GOfAaCQSqFFKsLUMaWYsfns9+A9IOXtNF007oGppijXlAaW1SSLblVUV
	 tDU4cZY349i0uoI2Co2ipjQGbnr0xdzavof4JAcX+bY0q7YYuILDkA5DZxaxjBUtv5woD
	 8e/wJGnT0syEueZriNI1vZOvF1S0NHX25dRIHMeoPP1G6VQC33OyvU8UX0oZ71UMwVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AKbhyIDy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Bu6W5BCe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="l/qI6CXm";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UMxra7va;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3E606A328;
	Wed,  4 Nov 2026 14:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE3E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AKbhyIDy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Bu6W5BCe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l/qI6CXm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UMxra7va
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4761F21EB3;
	Wed,  4 Nov 2026 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlAtB6wp4Rxg9m5TZVPBBQubE31obnHvFW2n9aoXtc0=;
	b=AKbhyIDyHgGo91GC3dXwslkq9tS0ZQtkg01wK+MfVqKuuJQLfh0B3INdFkS8ytdjtzykuX
	bYopyHrewCgQJ2RHZwQcEThjh6TsSTA6DWwntYOGe9zmFa29nXzAvmDDwg4FxdCx38IFzs
	iPZ01U9f83Na03Z+tzYvckAnaHcR8M0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlAtB6wp4Rxg9m5TZVPBBQubE31obnHvFW2n9aoXtc0=;
	b=Bu6W5BCe/JFSAecVZKVJeHALwVRCwqiH0lns4oyJ7dj2tee/xSYw/mKLM11BPpXD9A/YR6
	QCDcS3KIwEWrA9Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlAtB6wp4Rxg9m5TZVPBBQubE31obnHvFW2n9aoXtc0=;
	b=l/qI6CXmCutpQP8eED8mBKo4QtvY3EXMN/aHUyokASYshw5Eibc9rIr5p0oFfjoQr7ObQx
	gfx+zGU46y0Sev5cCrYgHdBesuUNid7w7FEFpzAH5IHRPx+0Gb4lCkr7bomigdlipTXbEU
	sr3GfFnm30M1F8JUuBS39zmBUjSRbD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803314;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlAtB6wp4Rxg9m5TZVPBBQubE31obnHvFW2n9aoXtc0=;
	b=UMxra7va6xYAZJdrkNU+Nm6OD9DncwPjLsVC/NmGzB6fK0L6WciX+yObhnKKf9mEPGbufk
	lIVZVK3jeAIM7JDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB584134F0;
	Wed,  4 Nov 2026 14:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k5wHMDFE62oBfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:41:53 +0000
Date: Wed, 04 Nov 2026 15:41:53 +0100
Message-ID: <87zevou09a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Maidanovych via B4 Relay <devnull+devuarpd.gmail.com@kernel.org>
Subject: Re: [PATCH 1/3] ALSA: hda/realtek: Fix DAC binding for Lenovo Legion Pro 7 16ARX8H
In-Reply-To: <20261104100427.474270-1-zhangheng@kylinos.cn>
References: <20261104100427.474270-1-zhangheng@kylinos.cn>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[devuarpd.gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80

On Wed, 04 Nov 2026 11:04:25 +0100,
Zhang Heng wrote:
> 
> The Lenovo Legion Pro 7 16ARX8H (SSID 17aa:38a7) uses the TAS2781
> I2C DAC. The generic ALC287_FIXUP_TAS2781_I2C quirk assumes two
> speakers (0x14 and 0x17). It forcibly binds 0x14 to DAC 0x02, and
> binds 0x17 and 0x21 to DAC 0x03.
> 
> However, this machine only has 0x17 as the speaker and lacks 0x14,
> which leads to incorrect DAC binding. To fix this, chain the
> alc295_fixup_asus_dacs() fixup before the generic quirk to ensure
> the correct DAC routing for this hardware layout.
> 
> Tested-by: Roman Maidanovych via B4 Relay <devnull+devuarpd.gmail.com@kernel.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221735
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied all three patches now.  Thanks.


Takashi
