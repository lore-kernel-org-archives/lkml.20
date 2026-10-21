Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594732;
	b=kFzYYAYhV0zLEcCQP6nOwiFkQhUPYxqH3J8ax0x9TiKJhA8KwuScoOrztx6iXnkttb0c
	 WDh+lmt4F1Jagq7uuHx24YiXjNGjSlvLmtRTS+ynvPF/bjoVzSnkORZaCdAxPQipFGY+b
	 X6gPDbd/le3fiqNiG1wiQHb/CsvzyhfgmZ7qL5UZvm/oLXs4AMoCAh/UB0qGb+ZS/yD46
	 7xaOY9jOAu7MGRw0vkoFZQqHQ8IKTI+iyfJU7lAFYzhSLKbqXfCn45TUhhBEmcC1bTqMh
	 IIyG84STo505yf1A3BIxyYM2fWLXXmxl3XvwCRBv02VatGuLrQVtdBic6Ta2YZtzbdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594732;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=WRCoEq90OxUV9ZxcUAEaVJ83BjwryOyU5b8zNnCpwbU=;
	b=k1N857hJd7E8WR/ruVZSooKtF6EkwMXH5FTFyhwIpeIZfFF7SbZ8a4IsqvFlEPHWzVPq
	 PJqf/jexkcgol2hqSTtVGmQvQZ15G4HqO5do0I0f9c5BvO0L5rSE1PRx39BWjUv5/PY0W
	 xnxr6J5bQf4lS1+RuuZbqwAFM8Um/9Qb5hrCh23n9KekFEzgFUwX4t/83hOOkZHGke9Cq
	 ZmtRAiTXODeTyxKW6pGUrkaGEUwvS/q2ufEwGAgpSFZLeEInHkd4ynrpgMJAoMHxZvmUA
	 NKNYrAYGV3uw4MF0sCeRBvJGL4ZrhWxdLwT/aN9iuSdvE3wQ2Mb3nhAMoUdbYe6gscA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FcbOwEqS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mVn5Q2+f;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FcbOwEqS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mVn5Q2+f;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BCD606A31B;
	Wed, 21 Oct 2026 14:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FcbOwEqS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mVn5Q2+f;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FcbOwEqS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mVn5Q2+f
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C7A421F67;
	Wed, 21 Oct 2026 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792594730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WRCoEq90OxUV9ZxcUAEaVJ83BjwryOyU5b8zNnCpwbU=;
	b=FcbOwEqSG+jmsc0rII5sUvrBVfsAHJyh/v4pf1jRRzHQtU2NghfCubPpEAfDbA8M9PyIYT
	KscNJzXuHNC3Ppb5/Za5AsKR2PTwjmKDsfR38z47IXFi1AlFnwiQ80yG8tZVOYjUHQSJIB
	WwBvelIX6DHUAvUgLDhwThazoMOsLqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792594730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WRCoEq90OxUV9ZxcUAEaVJ83BjwryOyU5b8zNnCpwbU=;
	b=mVn5Q2+fnqjxxr7iwCcUn9euoJqPNVFdQcn4bFFeZWEGPRuwcgGnRRqzbk4MluNDCPCNpx
	Prt0W69eeDaSgSDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FcbOwEqS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mVn5Q2+f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792594730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WRCoEq90OxUV9ZxcUAEaVJ83BjwryOyU5b8zNnCpwbU=;
	b=FcbOwEqSG+jmsc0rII5sUvrBVfsAHJyh/v4pf1jRRzHQtU2NghfCubPpEAfDbA8M9PyIYT
	KscNJzXuHNC3Ppb5/Za5AsKR2PTwjmKDsfR38z47IXFi1AlFnwiQ80yG8tZVOYjUHQSJIB
	WwBvelIX6DHUAvUgLDhwThazoMOsLqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792594730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WRCoEq90OxUV9ZxcUAEaVJ83BjwryOyU5b8zNnCpwbU=;
	b=mVn5Q2+fnqjxxr7iwCcUn9euoJqPNVFdQcn4bFFeZWEGPRuwcgGnRRqzbk4MluNDCPCNpx
	Prt0W69eeDaSgSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0F58134A5;
	Wed, 21 Oct 2026 14:58:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Oh8dMCnT2GrqcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 14:58:49 +0000
Date: Wed, 21 Oct 2026 16:58:49 +0200
Message-ID: <87fqxzdrrq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ajanesh Lal <ajaneshlal3@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16 (103c:8be5)
In-Reply-To: <20261021142453.177174-1-ajaneshlal3@gmail.com>
References: <20261021142453.177174-1-ajaneshlal3@gmail.com>
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
X-Rspamd-Queue-Id: 1C7A421F67
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Wed, 21 Oct 2026 16:24:53 +0200,
Ajanesh Lal wrote:
> 
> The HP ENVY Laptop 16-h1xxx (PCI SSID 103c:8be5) uses an ALC245 codec
> with CS35L41 I2C speaker amplifiers. No LED fixup is applied for this
> subsystem ID, so the speaker mute LED and the microphone mute LED are
> never driven and do not follow their keys.
> 
> Add a fixup that calls the existing ALC245 mute LED COEF helper and the
> GPIO mic-mute LED helper directly, then chains to the CS35L41 I2C
> amplifier setup so the speakers keep working. Use it for 103c:8be5.
> 
> Tested on an HP ENVY Laptop 16-h1xxx running kernel 7.2.11: the
> hda::mute and hda::micmute LEDs appear and follow their keys, and the
> speaker amplifiers still bind (CS35L41 Bound in dmesg). The mic LED
> GPIO pin and polarity are not verified on other hardware.
> 
> Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
> Assisted-by: Claude:claude-haiku-5-5
> Signed-off-by: Ajanesh Lal <ajaneshlal3@gmail.com>

Applied now.  Thanks.


Takashi
