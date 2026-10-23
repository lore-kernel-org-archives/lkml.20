Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762384;
	b=TFL93GNjbwsdvVhPesukX8sViVJhPELeDgRzoaL6IHeqvUwZgW6yKPucVBbxIgMrf6hi
	 w+HjKWO8C9cmENL+aBee2ORAdxI/QvwjCWJjhEcwo2BMIpp6eYILYTVt74g0KcSMNcyiS
	 EMd7ZBhN/LkKhBTE6Ukdser582hoyFiFi9P0haKpbWd6ECq0ddzAAZOLe4N0zWAuMZCPD
	 fSTpRQsnKl80Zrcg+f4uHI2JZvEUagHSgz/aYW73cUFVs2GqAK63h90BOnGDOmyry8VpP
	 FW0QplSjy7e4EA70k828OsfEn9y1Lzyi33/5glbBjQfFpzBnP03KykwqGJfXxA7YWJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762384;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=YLiRLuXE9FqJjXWqvrv2UMlvykHVexznc/s2NHsVgeY=;
	b=V1+Lt7rN/ObbDpD5ulbso3poUpaTlSx+ySwk1IWB0/S/QvQsy1+ut5F4FG0xpY5ihGGY
	 9FLvNYdLUxTvaoEvN6kzTcmODDr4n6qDSgbz//lCD0nMmLQ80s8RR0LCFtkjhLW3I22zJ
	 jiBQwtxbZhAiG70DJ6pPqac9zTSaART7T/C7CZzNEj3uzhBUiknrI4aUi8bWzENMxvRvo
	 v+tXOnCbPsoRxwuE/pqdrtIknqPoVt2CIZNUCcSs0yt6cPJsLWROXj/DCG27pH7golbLQ
	 CIedcvkhwYASXCWl/uVTYTJLUhCP3BIhFedfBZjUzIAND1vyQ4Sn/+wQEzgSw8ZMZjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0OZwhTuR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1Qwusqrw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qs1982QU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4FznDytJ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0EB606A321;
	Fri, 23 Oct 2026 13:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0OZwhTuR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1Qwusqrw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qs1982QU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4FznDytJ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8399220D4;
	Fri, 23 Oct 2026 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YLiRLuXE9FqJjXWqvrv2UMlvykHVexznc/s2NHsVgeY=;
	b=0OZwhTuRx92xJP9vnVh3LiCRVcp9PBjP4tNjZgAE2pzk3RvHBYOjjTYSpZP/e76D8xe+Vu
	/I+KSz0ewEq3hXDvzkYRI5oAeEDr2Gdlm6L1CxWIZCZvmekFK3fHykeK/zDnwVgkRTRb8L
	mmtXEYMX+2NoaBjU8Qcfq2r6CsTM7jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YLiRLuXE9FqJjXWqvrv2UMlvykHVexznc/s2NHsVgeY=;
	b=1Qwusqrw/NlWpy1i/fA1QWzibX+db9NDPNvinNh8fDcavMkl1DSpJswLOqMqTHMvCe3/Kf
	o19WWlCmIOW2BwBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YLiRLuXE9FqJjXWqvrv2UMlvykHVexznc/s2NHsVgeY=;
	b=qs1982QUKjHQS3+KiSCjAUQy8z2vxI1g42bNFlZ/NCgTmlJm7PAevXLfgRoRiO5r393MtF
	lTgWr7F0E+Ih0iiQMxa2JwqnMYOs/A0l3osnhACD8pAUQO86zU6QdhaqflFvhqdKOlWrUw
	tL/3ErfSunglq4RkceAmz+PWcgoGw6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YLiRLuXE9FqJjXWqvrv2UMlvykHVexznc/s2NHsVgeY=;
	b=4FznDytJfmfDifWLk8bIv8VkjHvFvD1Iw6ovV3zOxgS9wyeO/Sfb9Ji8RSx4APUEKhyJOK
	AunO/bCDkoqzAvBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98C35133F6;
	Fri, 23 Oct 2026 13:33:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id njZZHA1i22r+TQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:33:01 +0000
Date: Fri, 23 Oct 2026 15:33:01 +0200
Message-ID: <87mrs4a6eq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Fix internal mic on ASUS VivoBook X509JB
In-Reply-To: <20261022025950.150390-1-zhangheng@kylinos.cn>
References: <20261022025950.150390-1-zhangheng@kylinos.cn>
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Thu, 22 Oct 2026 04:59:49 +0200,
Zhang Heng wrote:
> 
> On the ASUS VivoBook X509JB (SSID 1043:1ec1) with ALC256, the BIOS
> marks pin 0x13 as not connected and pin 0x1b as the internal mic, but
> the generic parser still defaults Capture Source to 0x13, which
> records only white noise. Manually selecting 0x1b works, but
> PipeWire/WirePlumber resets it on every stream open.
> 
> Reuse ALC2XX_FIXUP_HEADSET_MIC for this SSID. It limits capture
> sources to 0x19 and 0x1b, removing the bogus 0x13 source so the
> internal mic records normally without manual mixer changes.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222152
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied both patches now.  Thanks.


Takashi
