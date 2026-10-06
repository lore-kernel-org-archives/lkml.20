Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDC217723;
	Tue,  6 Oct 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295971; cv=none; b=Y1U2MxgNljQomQpVE/0iT9LwmAK5soSBpTGSBtbHN5Asrdqa+vUxaFvys+CRltT0tMveLMbzQDBNR1Ocx8hQA32pT7Ggs3FToJJoEeGLYOtdjOLHGHL1UQh6AUQIdeBIYRsm5DnMkwI3vdC0pvCtk6q3+RAmrpYjPLZTr+3tqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295971; c=relaxed/simple;
	bh=qdO7Mhq09bWIq9YgrxP0DPSw7OU9qBoagiXzBeavfO8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/abKxLtHDRq702gyuVg492kDYK6PwXCZCnYxGij2v2jYsBPsxWJeWWkxdUGrvWo8XI0j7oRiLvUoUHG9HtWIueIxuQuMBg1sUg5No/IW8LcgUmqy1oUYlZ0y1xmt2rKndbYXtucVuuvmP9Dl6mr4bfKpsLmYgyDMb1aX+tTLUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SIcQQxUQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XHkj1ufn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BOGjlPyR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pdeFS0Xf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SIcQQxUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XHkj1ufn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BOGjlPyR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pdeFS0Xf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8F9B21FEA;
	Tue,  6 Oct 2026 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791295964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uraFhfuuTVKiYFnDxsHsVcA5DvRI7vQxkFKFI35Ui9g=;
	b=SIcQQxUQJfI8Z/2dW9neT02lR8VHHV+57O2xSRfXKhfqHiWr1Eco4CwqSHhhDwfCUckZbG
	kk98Ns6/riwPuBVTcxpkym7aWY8QzBojVoRaxObA8INQfPfaLUugMn/DqhUQHyp+t+pyLf
	wpitBlIxSc5pMtbaZx/qtzzMas8/bg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791295964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uraFhfuuTVKiYFnDxsHsVcA5DvRI7vQxkFKFI35Ui9g=;
	b=XHkj1ufnORJf3k4Duhj7Tv+cCfDOl5wvTSBgdcLZPEce18PBuvPYjj0E5tFiyHv3JX2/ca
	pjNncZtafAF/ZkDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BOGjlPyR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pdeFS0Xf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791295959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uraFhfuuTVKiYFnDxsHsVcA5DvRI7vQxkFKFI35Ui9g=;
	b=BOGjlPyRFLpN0bYhjfHVtQOR82Uq/CzPuiHQE/tAunqPhual8BA2Yi34r5EyarX4Ygsl1F
	u84WGspol1kYkIfh67iEtKk19MVBBKDF5lnFYGN7CGlqBdiiSqZFR3xWPA1a51iH6bM6/r
	cRvC0b3iBpMkTYeH+2f66ut9Vu0hPho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791295959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uraFhfuuTVKiYFnDxsHsVcA5DvRI7vQxkFKFI35Ui9g=;
	b=pdeFS0XfuLQvzPcQdDsBL/1vfAJ1tkjACyTZCcwJgESZJDTZHZpUu1LOMbjbsfGl4gd7g8
	twRep0f6+GRwG6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83A1713A95;
	Tue,  6 Oct 2026 14:12:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H4MEGNcBxWoLFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 14:12:39 +0000
Date: Tue, 06 Oct 2026 16:12:39 +0200
Message-ID: <87ld8aq5ns.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Denis Yakovlev <mfthesun@vivaldi.net>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Drop unneeded DAC override for HONOR MagicBook Pro 16 2024
In-Reply-To: <20261005203836.11074-1-mfthesun@vivaldi.net>
References: <20261005203836.11074-1-mfthesun@vivaldi.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D8F9B21FEA
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 05 Oct 2026 22:38:36 +0200,
Denis Yakovlev wrote:
> 
> Commit 1e3e378d63be ("ALSA: hda/realtek: Enable bass speakers on HONOR
> MagicBook Pro 16 2024") restricted the speaker pin 0x1b to DAC 0x02, on
> the assumption that the second speaker pair would otherwise end up on
> DAC 0x03, as channels 3/4 that a stereo stream never reaches. That
> assumption was wrong: without the override, pin 0x1b is still connected
> to DAC 0x02, the only DAC that pin 0x14 can use, so the override changes
> nothing. With and without it the codec routing is identical and the
> speakers behave the same with nothing plugged in, with headphones and
> with a CTIA headset inserted; without it they also keep working after
> suspend/resume.
> 
> That commit also got the speaker roles the wrong way round. Pin 0x1b,
> which the BIOS does configure, drives the bottom speakers, which carry
> the low and mid frequencies; pin 0x14 drives the tweeters next to the
> keyboard, and those are the speakers that stay silent without the quirk.
> Measured with the internal microphones, enabling one pin at a time: at
> 1 kHz the 0x14 pair alone is more than 30 dB below the 0x1b pair alone,
> while at 6 kHz the two are within 10 dB of each other.
> 
> Drop the DAC override and correct the pin comment, so the quirk only
> sets pin configurations, like the one for the sibling M1020 board
> (HONOR MRB-XXX).
> 
> Fixes: 1e3e378d63be ("ALSA: hda/realtek: Enable bass speakers on HONOR MagicBook Pro 16 2024")
> Assisted-by: LLM
> Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>

Applied to for-next branch.  Thanks.


Takashi
