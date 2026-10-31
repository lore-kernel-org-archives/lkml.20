Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793462596;
	b=vHd6SPyj6KXsfGzevDIGqwLwc9Rvt/73Agoji6ZKgUvPpZ74sjvdomUbMV+CqDMRh6/2
	 SUD+JjTpQpzGBHj6EHX2ztevhCK5QuXHdWAPa2U1jzIAcK+JUNULTt32w/aXb2IqehBVe
	 qf2O/qJoMgTwsHTS44MGjIqlldzYBf4VQdnHkNP8EOu25dMaVNCsc1aXNG3UkuoaIylmb
	 9mqN1P9gj/y+YdPcDHfHeiNpp27NVPUqIypgQPOaDiEfmPOYzN/6hqoB2yoKQyewycHTE
	 ZQ5jWbJ1E5ObCvd64GSQtwac7zJDSfXsyTGrnShhZdKKMzgaxPcAgtiyrT73KvOSxdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793462596;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=VZHI04ep+aMDqueIcXREJ9i7SmmuioT62o5wFPf6KsQ=;
	b=JYoZKzTWf5bD400izkg0tO67sn6r7TNrTHs6u7dzCowTDNLGY8hfWnBOFU0vAtOOiKtq
	 nlskCh6vGVaHXWYz6JwJ12ghlwxLd2wDV7PEJsDT1hHOniSFYwzCjqdTEMXO0p48yh3hm
	 HVksTZHrTbl4883IRrs3K0m+6VZEHXTc2wo8UqV0C9grJk/ilNW2ZMANEqCCEfwCbhTMf
	 n4Rppgc5/uoU3VxgPvfsp/nQOG8KBsG8uvUw5YlRyYo7eASyY2uxdWnw2mCS8y3a3/28e
	 38xt62nIcLLr/upTql5jhuu2Zplcz2S0DU/bblhMkOFTZx71tuwySw+wOnX0z4JOV7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rcm2ckr+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wevwQUU4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zbAvDukf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GMkhdXk2;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3861E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rcm2ckr+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wevwQUU4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zbAvDukf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GMkhdXk2
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 32C25222C2;
	Sat, 31 Oct 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793462594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZHI04ep+aMDqueIcXREJ9i7SmmuioT62o5wFPf6KsQ=;
	b=rcm2ckr+s4E6/4YVSccPkJ4zjpwQx7CG90xfLNgZOmt3lLOqUHCS12bvDSuzZtbUidlYIl
	vRD/Tji61zfFuNFhsI11G6DJaq0Db4l9qCeV+tnD+ubrjZrvVQSFMc6dwk10ClMva1SWgU
	u59Fa/vtPmx4gMs4U2OFvjobtMjdkj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793462594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZHI04ep+aMDqueIcXREJ9i7SmmuioT62o5wFPf6KsQ=;
	b=wevwQUU4DfFHIekVy0AmPcnGb7zL0W2erY/enU6xokRGh2VWhCi6oLj5kvRH9RJJ327jiZ
	zhcAkeRsbYJn57CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zbAvDukf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GMkhdXk2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793462593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZHI04ep+aMDqueIcXREJ9i7SmmuioT62o5wFPf6KsQ=;
	b=zbAvDukfCin4QwW41WeBTSYYJM7dROZYLcYQGr4agSeVfK1o4VIg8L/9btrVVXAiIVuqgl
	fU3TRX7WoaWfX2kJKVDKa3rkHHP6kA6bQQ6VWPf217AWSpig5Kdkg6nTRFs+jIk4Zibt+h
	rvoVK+Em2HZzpnQEsTS7MPtqk9zNf4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793462593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZHI04ep+aMDqueIcXREJ9i7SmmuioT62o5wFPf6KsQ=;
	b=GMkhdXk2Vq8DLnFcamlPbZAK1OT/lmcJVGZi7E+jW/xUI4Y83+AZE6bNmNGEOo/hnwV0xy
	u0zZ4bminm2cobCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE94813432;
	Sat, 31 Oct 2026 16:03:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfP0LEAR5mrnLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:03:12 +0000
Date: Sat, 31 Oct 2026 17:03:12 +0100
Message-ID: <87wlqxrh6n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Panpan Ren <renpanpan@kylinos.cn>
Cc: takashi.iwai@suse.de,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix card name for CVT Touch Device (1ff7:0f33)
In-Reply-To: <20261027090913.37647-1-renpanpan@kylinos.cn>
References: <20261027090913.37647-1-renpanpan@kylinos.cn>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,kylinos.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 32C25222C2

On Tue, 27 Oct 2026 10:09:13 +0100,
Panpan Ren wrote:
> 
> From: renpanpan <renpanpan@kylinos.cn>
> 
> The CVT Touch Device (1ff7:0f33) is a USB composite device (HID + UAC
> audio). Its iProduct string "Touch Device" is generic and does not
> identify the audio function. Windows names the audio function
> "MAXHUB Speaker" from the UAC OUTPUT_TERMINAL iTerminal descriptor.
> 
> Add a quirk entry to override the card shortname to "MAXHUB Speaker"
> with QUIRK_NO_INTERFACE to preserve normal stream and mixer creation.
> 
> Signed-off-by: renpanpan <renpanpan@kylinos.cn>

Applied now.  Thanks.


Takashi
