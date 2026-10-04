Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48DA3BE623;
	Sun,  4 Oct 2026 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138720; cv=none; b=sfmYirY6HFlitwswg5TI9eEsM4XC6vUA+ArMtqM0jJ5uJRUnER0g3eizhuFPKPuYv5HSEVP7etG+s4XyrWR8ebgOdeMdNcp3r2fvcIXBLOrwS1l2m6PPlpZpzurGYSeFjUMgCu5icPrSvPDsMwXxL5JB9QkNZ8QDKhTFPVZ1v8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138720; c=relaxed/simple;
	bh=O/NQxFXV4MfmFPKhQI6MQlGdtlogTdCzF5/cog4Yo4w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzBbNKb77vsnFAv/i/r6nn9b9YNneKLWht47pLymBGDmEckQK+hcCYcjF2Rr+jGQKxzam8a0imTCjYTHqPE+5YjFHxbidbDic2dhkG/6rk0kcoKh+YgZRj6EE6nTd9i8TY4RJyPvDpfrgPY2YkmJOs01j+gc8UBxriSUaVcRvbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N+n7LPwV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WW+fp4Wn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ng5BlkOZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F/UIlMGm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N+n7LPwV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WW+fp4Wn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ng5BlkOZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F/UIlMGm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 600351F387;
	Sun,  4 Oct 2026 18:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUEjg45eaMADnO0KDlzRFjk26IVVSz6mwInfmf9/Xnc=;
	b=N+n7LPwVcMERSITKOw8Rx3iid2uRofZ73CqBV1T/kxeTiBUg45UB7VoULsZiA3CwTXy+Vz
	LKAiEL/v7MO1uY3UMMrnp/XaJUg9qqpmbjopNHrcrT43sWsp3nn0fjrMJZLoBB5+kc/iht
	G5nczKv47AhbJnmJihYUZuoLB7lqzmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUEjg45eaMADnO0KDlzRFjk26IVVSz6mwInfmf9/Xnc=;
	b=WW+fp4Wnwq0dofyAYhWAkln0D7banH3tcxcCKb4P4EZGhZTkO6k+nfdLcej64yqYVKn8+f
	SbunSY7weC8jgiAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ng5BlkOZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="F/UIlMGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUEjg45eaMADnO0KDlzRFjk26IVVSz6mwInfmf9/Xnc=;
	b=Ng5BlkOZ7h05Q1uZEh/y0iSp2qC9o0z9Lwfd+W5EAjPRNIB5VJ5j/3WWbNK8UPVITrFJ7Y
	BhFY5CCslqy5o/y0h1GqKozuCSs6nPAt66cLLr8LxCTZJK79Ux8WGW1TSeUwJfjLIy9zhc
	gLqZsmk/sDRTmRkVKgv4uxIrvltcpzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUEjg45eaMADnO0KDlzRFjk26IVVSz6mwInfmf9/Xnc=;
	b=F/UIlMGm1+AeR+sQndu2jneZZACCl5qcgqFXyxEVcIr4vtW0wTlbXMwIgDLBsUUknaAEWo
	XNmn0hdbaI1Y0nAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24BA8133CF;
	Sun,  4 Oct 2026 18:31:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id x9ViAJSbwmp2WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 18:31:48 +0000
Date: Sun, 04 Oct 2026 20:31:39 +0200
Message-ID: <878q4diagk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Denis Yakovlev <mfthesun@vivaldi.net>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on HONOR MagicBook Pro 16 2024
In-Reply-To: <20261003133325.97507-1-mfthesun@vivaldi.net>
References: <20261003133325.97507-1-mfthesun@vivaldi.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 600351F387
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 03 Oct 2026 15:33:25 +0200,
Denis Yakovlev wrote:
> 
> The HONOR MagicBook Pro 16 2024 (DRA-XX, board M1020, ALC256, SSID
> 1ee7:204e) has a combined 3.5 mm headphone/microphone jack. The BIOS
> leaves the headset mic pin 0x19 at 0x411111f0, so the codec parser
> builds no capture path for it, and it leaves the jack switch
> (coefficient 0x45) in the TRS state, which cuts the microphone contact
> off from the codec. A wired headset microphone therefore records
> nothing.
> 
> Configure 0x19 as a headset microphone (0x03a1113c, "headset mic
> without its own jack detect"), the same value already used for the
> sibling M1020 board (HONOR MRB-XXX) and by the VAIO quirks, and chain
> to the generic headset mode handler, which detects the CTIA/OMTP
> headset type on every jack event and programs the jack switch
> accordingly. Pin 0x1a is left untouched: there is no evidence that it
> is wired on this board.
> 
> Fixes: 1e3e378d63be ("ALSA: hda/realtek: Enable bass speakers on HONOR MagicBook Pro 16 2024")
> Assisted-by: LLM
> Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>

Applied to for-next branch.  Thanks.


Takashi
