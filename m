Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841E339388;
	Tue, 29 Sep 2026 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673816; cv=none; b=Yr2PNc3Coe72CFC7GUPWVziHiCtb+AKVCACGRDNyDGuyo2zwgqt2UuqkdWoI3mB8MUy9+qDdQWGKXzmdrU8OBLAYU7qqWNkJH4+bokh1t/XDQBPHmybykuUjSFXdvQ5w3wqd76zFx5EUeWBqEK/wQKDMrdIUSDOR25fSpIpS0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673816; c=relaxed/simple;
	bh=NtG05n5McksrFmzdfljrReNewmzzO2g4qlGKFcFGS8M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8Czt7UEavdTeVZDqFeFP4On5pVHuSl1hAzLiSEeU8mRgOF/PHLCjGE1K+G342fJKECpDQJKMUUtoGlYibfuNwSeVD5kJTeSjcCnS5CjTJtYo4yg29yeKhlRsgUqEErmciU4pajF2uLqTf0ZTT+J/OmahjTlG1B6SygNhMYtsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UzYVRinB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G2qKB3Dm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jMeMUBtv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YEOWHp1h; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UzYVRinB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G2qKB3Dm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jMeMUBtv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YEOWHp1h"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C1C721B9B;
	Tue, 29 Sep 2026 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790673802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+i6zypkUKEzzvakqFvOPHmJ2r/IO7UE3pWpJk8VhiM=;
	b=UzYVRinBLoAkce30emmXL1Rj0KRa3IiysyC5R5OHkzfvr8KevnsrZ6bKXew21eaUD+ymim
	09wlkrdj0yThcKTPxw3R1DW0DYmdvDixxMpbQ7upoTIk4pKxO4VnunXmmcxPRLtuErlouo
	70O5yU8gQf1mwVm2YE5SxRZeVPUOvgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790673802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+i6zypkUKEzzvakqFvOPHmJ2r/IO7UE3pWpJk8VhiM=;
	b=G2qKB3DmfCNYoj9zWt6BPZ2sxZ2xYJ98iu5Q/7jWUFUbgnMKJqeEG0e+6V3yF0t/N8Fywj
	SwPoGKDNNGgFvFDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jMeMUBtv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YEOWHp1h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790673798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+i6zypkUKEzzvakqFvOPHmJ2r/IO7UE3pWpJk8VhiM=;
	b=jMeMUBtvl2ZUHsd4zjIhOJ2Hrxj040yXVK9iW+m3GG3shP/VPfdBJqGsfVwGi3dzI3xjZ6
	xS+s1PQzg3dB9bTz1H0JW145i/bztmnoz6t6T+IB5iJryQAHaFAvoNW3cBy+QLrn44W9SM
	KTTn1yxsnLC7hm4bMc9PSxLp3Dx1clg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790673798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+i6zypkUKEzzvakqFvOPHmJ2r/IO7UE3pWpJk8VhiM=;
	b=YEOWHp1h/UtaXiR5EXKIVLyub7eJGJHCCGM6755ImR9UxzpXCEeQYLKICWCHUvN2nspl0E
	tj1VIUtbGRJa+8Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49B48136D1;
	Tue, 29 Sep 2026 09:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LDRZCYaDu2rBDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 09:23:18 +0000
Date: Tue, 29 Sep 2026 11:23:17 +0200
Message-ID: <87h5j82yyi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Pavilion AiO 24 speaker
In-Reply-To: <20260929091109.400313-1-zhangheng@kylinos.cn>
References: <20260929091109.400313-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7C1C721B9B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,kylinos.cn:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Spam-Level: 

On Tue, 29 Sep 2026 11:11:09 +0200,
Zhang Heng wrote:
> 
> Add ALC225_FIXUP_HP_AIO_SPK to enable the internal speaker on
> HP Pavilion AiO 24 (103c:85ba).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221691
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
