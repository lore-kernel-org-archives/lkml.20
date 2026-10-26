Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001685;
	b=Cjyy3k/AgnLc4+opqRgQtJOQuWYhJ0anmd5mtzkiKFLmEIn40Thz8QpJCp1tM1BCeEgT
	 IXs+ipgpjMg68ey3ByhVoIBkKUk1Y6insO/y0go9lLjsTH3O9wSMRIiKoFJcd/hBPnCEu
	 YT0WSkuc+J+mEWZIGCy/uc0izZC0VHUsHZ/hgxkEcwsYdlql/lEf4hfdaTvchdArbT/ow
	 VmHE6qjhTQsjs5gkbaF1mQLhf3Xi9rxs1Zqw3vxMxwWe+7s57pISMIFmWkTDu2eRXVvTR
	 7pk3Bnn9kElVooGUgCuRIua2BDg8bthGiPrGrqenDtO4ACfTMsXR3NjSvhYk4Qo6xKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001685;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=Ctyq+gG5jXVz/TU156m5hBEkcXWdW8CVnveOiNrOFVE=;
	b=ecL9Af4QhsFocE07HVj7L3a2wPoNeARD4b4RrHIcuVmal2SAVS9EL9YqTsDWCFz+PNC8
	 wZDHVoiOVzJvcJProDylv18y8D/Ln6QCnu+YzEYHGHakCCxsg34evJsY0ga5+elD/m5JQ
	 ZBUedRhXLXdkA3ILK74aCMAxbsZOBtgQ9uytCrd9s9GIxA1/IpuqmKEUtsRWAfy0EbLud
	 ae8LYzF+ZOPknfdtOzsbbkxcGPJgdVOOlP18t+cFOfJNwnUYjP+3o8LW2qn21V2Zixo2t
	 CYaTB/JwtIlNoUr5+mHPyUKQslVzN560Oxv840QBTqs5JCW5Nlhfwprhh7C4IqjDhkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhMbNPJL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IQ0LwCfJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhMbNPJL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IQ0LwCfJ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301F606A31A;
	Mon, 26 Oct 2026 08:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5301F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhMbNPJL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IQ0LwCfJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhMbNPJL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IQ0LwCfJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4831C1F7B7;
	Mon, 26 Oct 2026 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctyq+gG5jXVz/TU156m5hBEkcXWdW8CVnveOiNrOFVE=;
	b=lhMbNPJLXR1S0MM93RDkY9cFgZGkiBPVFjJN9IDhQk9ByNH3dqlrPbp7ZMxpnEY0TRw2QY
	ICTJPklOi7c76juQ58oeS9GoHhMutdnusVN3EYBLVj5mo8K6LVWVZmDVKbzY2DYzV0+tGA
	dvcLydwKLn0pVyal27FSiFAB5gOFR6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctyq+gG5jXVz/TU156m5hBEkcXWdW8CVnveOiNrOFVE=;
	b=IQ0LwCfJaydBa/wioP5v+qdB1QM/dA5/06BW+JrKiScMp3RYysSoWMkxa6b3160jgEHGZS
	YICA8dFAZ5NExFAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lhMbNPJL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IQ0LwCfJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctyq+gG5jXVz/TU156m5hBEkcXWdW8CVnveOiNrOFVE=;
	b=lhMbNPJLXR1S0MM93RDkY9cFgZGkiBPVFjJN9IDhQk9ByNH3dqlrPbp7ZMxpnEY0TRw2QY
	ICTJPklOi7c76juQ58oeS9GoHhMutdnusVN3EYBLVj5mo8K6LVWVZmDVKbzY2DYzV0+tGA
	dvcLydwKLn0pVyal27FSiFAB5gOFR6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctyq+gG5jXVz/TU156m5hBEkcXWdW8CVnveOiNrOFVE=;
	b=IQ0LwCfJaydBa/wioP5v+qdB1QM/dA5/06BW+JrKiScMp3RYysSoWMkxa6b3160jgEHGZS
	YICA8dFAZ5NExFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E827513319;
	Mon, 26 Oct 2026 08:01:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OvKWMdII32pRGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Oct 2026 08:01:22 +0000
Date: Mon, 26 Oct 2026 09:01:22 +0100
Message-ID: <87wlr46gbx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v4 0/3] ALSA: opl3: Fix sequencer timer and channel lifetimes
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,suse.de,gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 4831C1F7B7

On Sat, 24 Oct 2026 18:49:48 +0200,
Cen Zhang wrote:
> 
> OPL3 can receive a fixed-duration note before its timer is initialized,
> and the card-owned voice array can retain channel pointers after either
> sequencer port has freed its channel set. The delayed-note timer can also
> remain queued after the sequencer client has been deleted.
> 
> Initialize the timer before publishing ports, key off active voices and
> clear their aliases before freeing each channel set, and shut down the
> shared timer after client deletion has drained both event producers.
> Retire higher-numbered partners before their 4-op primaries so no active
> hardware KEYON is skipped when the primary changes its partner's state.
> 
> This series applies to tiwai/sound.git for-next at d74eb09af56b.
> 
> ---
> Cen Zhang (3):
>   ALSA: opl3: Initialize the timer before publishing a sequencer port
>   ALSA: opl3: Clear voice channels before freeing their sets
>   ALSA: opl3: Shut down the timer after draining sequencer ports

Applied all three patches now.  Thanks.


Takashi
