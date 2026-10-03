Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD35282F10;
	Sat,  3 Oct 2026 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020913; cv=none; b=X+2eLhDeKc5agn1Ri8w6v2vSywjT+q8zarlmNjIcb9C79nuK243ih6fQMkLgpHYVST1pCluO+OnZlyJoA5M6pbWTSPXDxqcIJ1Tc/Ouyqtif0ZGyF1A7AABE+ADHTqrtbbloWwJlwlDzE3UH7SKKQ00jpLcSB4O8t9DzJYpSmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020913; c=relaxed/simple;
	bh=cvWi3/uyLtYxqZXF6KMPj1aDdMfoY5Q+j/XU0FcSWWQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ucTQ+cH2m3AqEt+YJw+SeE9EckEmOYkDLD3tnl9a0nMJKTrVxMqaatjJ8TLf/YSahMD8fEz0W4+e7YADq7a/mNMASs5sHmm5kqINd0xNhFCnfIRFlLao+hSYUxuUCEov2pC15P6vL6FJjJ2wtKsCSBaEKheWqnMnL7yscETmjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l4Jy/vxY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Xs+RSaW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nzSwsISw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=btBLg7Q/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l4Jy/vxY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Xs+RSaW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nzSwsISw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="btBLg7Q/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4DF6121CA8;
	Sat,  3 Oct 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791020899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0QPGj2wmwNFfv8VCKotn4mq3e87FF3j1o4uak4Ov818=;
	b=l4Jy/vxY5XT1g7jX4EQrw6t44GAiOYyUaWKWjgkI5f9LQcMsszIyMDuaM0AS6jzgxqkgYO
	HllsYrkOqCGxqqz/OQRqrJUH4pYekFzjhC4s+GwwB/3lK6y6RYjJ5yO4LLoj5TxuiptsDl
	nHCJzdj1EvO8CWTOgjc1NgJocXkLZy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791020899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0QPGj2wmwNFfv8VCKotn4mq3e87FF3j1o4uak4Ov818=;
	b=4Xs+RSaWpwi6oxrbSIna/9lICaL1RqzrF6tSNFW0wGWZyKrRRoiBBVOh3vLKGVHzhOIm2X
	2Pm6ETBDp0cRw0DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nzSwsISw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="btBLg7Q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791020895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0QPGj2wmwNFfv8VCKotn4mq3e87FF3j1o4uak4Ov818=;
	b=nzSwsISwhRH8RSwc2XGT2rnQH/Z/FqPdBhEx0RNq1C7wHOdOrZjhbbu7NHD4TdgykmQfCU
	UX5qbx8P+m8BSEmjfkhrjlgoAEtgQ8eYdQ0jr+JgBsjXROJldLQD2A/QeklQNXfs4rFNoD
	X8jPylRc7gBDXiyIScDx+7HxncwtAuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791020895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0QPGj2wmwNFfv8VCKotn4mq3e87FF3j1o4uak4Ov818=;
	b=btBLg7Q/+87bDqLN62oTsWmkNXOQ7eHrMK77UUcE4U4Qt304wH2VslXoVU47R4W7YbLtK7
	RGsZFKS3S3XXRKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4FCC13712;
	Sat,  3 Oct 2026 09:48:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ILbGJV7PwGooQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:48:14 +0000
Date: Sat, 03 Oct 2026 11:48:14 +0200
Message-ID: <87cxtrxggx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Harry Nixon <harryanixon@yahoo.com>
Subject: Re: [PATCH] ALSA: hda: Fix speakers on ThinkBook Plus G3 IAP
In-Reply-To: <20261001033920.111061-1-zhangheng@kylinos.cn>
References: <20261001033920.111061-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4DF6121CA8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,cirrus.com,opensource.cirrus.com,vger.kernel.org,yahoo.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 01 Oct 2026 05:39:20 +0200,
Zhang Heng wrote:
> 
> Lenovo ThinkBook Plus G3 IAP shares PCI SSID 17aa:3891 with Yoga Pro
> 7 14AHP9, but has a different codec SSID (0x17aa3875). Use
> HDA_CODEC_QUIRK to select ALC287_FIXUP_CS35L41_I2C_2 and add ACPI
> _SUB values 17AA3845/17AA3846 to the CS35L41 property table, since
> the BIOS provides no _DSD.
> 
> Reported-by: Harry Nixon <harryanixon@yahoo.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222053
> Tested-by: Harry Nixon <harryanixon@yahoo.com>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied to for-next branch now.  Thanks.


Takashi
