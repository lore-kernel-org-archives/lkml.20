Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830939;
	b=vOz8JtpCNdVNWVeaJhbXwQSRnyj6/WROLObcB4jQWT4lPWftILjsoJdmNYtvW9vcvvLE
	 ehVDZjSqnEBeyGUgBtpoqcaDliRHJXk62HDDyyaWC+JgHgZbF8ginJXRL6AzUVlfc9G5C
	 HdCuvt65600mhaEGk9Y0Zy4BoAhwEoKTCf0lZj6hN4ef5mIBr+slmnCmK0agcpDtPE7a/
	 9U0bD/jA5MmYPXqRNgHjpYqCovMraWB3/9oXrsKls/PWJBdqQrtzhKklOMydZKeLQ2moW
	 ZXrpRnJuLrou43mTFUeKLHwosb59LjLPb+xKTjb+0A+adH8QErCxyL1K0OjfTU9sbdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830939;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=FVpXCDMg8kn0u8xB9ITkyi9m3sSv2PuUX+YRB0gAU7A=;
	b=4uOrIELreLE5C++HCn2/Wovymgt3WeONjViUT5BeNULMavPyTHrwl200OaukFWu07wI9
	 zzJPUUgbW15L1vhdt7FdvM1dl4LJg1O4B/5Mp3eYfZcLtg2Rb+RRGasIVwZ/hRmLP4a6z
	 ITssFc2orDaY6vTk1ig0hBZ3hU1A69e6zTT+kydcndWtlE/ySPTvUkfkHGtfxySabCzZ9
	 0/7xYda31Xo+NTb6KIJVSEvG8I4U5REYvTR+wBL4amInUGsiRXdzF6tQD/MNw0+w8qmrq
	 zoJvisfgza9jiqQw9h2+uhM+oGG1CmcYTwZsUXuazNGLJ3f9UZ8Tg2G1K09M4zTg2Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ACab6khR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="w/c1gqFf";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ACab6khR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="w/c1gqFf";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B8606A31A;
	Sat, 24 Oct 2026 08:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ACab6khR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=w/c1gqFf;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ACab6khR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=w/c1gqFf
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 534F11F44E;
	Sat, 24 Oct 2026 08:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792830937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVpXCDMg8kn0u8xB9ITkyi9m3sSv2PuUX+YRB0gAU7A=;
	b=ACab6khR0TKiGlFnANtc4A26jwDCWO6kjKFGcRs4qB9d27mGBOGka1bPm4qEz9wnbRKChT
	oSKNYGqGCSyYcEWmvNMroVjZK3ISKOz5SzC5VgYjJDrNHPihK6C4Tc59PJWfX40iQPSveq
	RffmnVJwyEhAbQbxXeZdUu575rxLh8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792830937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVpXCDMg8kn0u8xB9ITkyi9m3sSv2PuUX+YRB0gAU7A=;
	b=w/c1gqFfDzeirACCGqiDJr9dqVlRlQx4Ojs2nm6x5IRyL2rUP4iC5tx9bJS8f9PHoxQ/yI
	OraK+tdtKSHMFVCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792830937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVpXCDMg8kn0u8xB9ITkyi9m3sSv2PuUX+YRB0gAU7A=;
	b=ACab6khR0TKiGlFnANtc4A26jwDCWO6kjKFGcRs4qB9d27mGBOGka1bPm4qEz9wnbRKChT
	oSKNYGqGCSyYcEWmvNMroVjZK3ISKOz5SzC5VgYjJDrNHPihK6C4Tc59PJWfX40iQPSveq
	RffmnVJwyEhAbQbxXeZdUu575rxLh8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792830937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVpXCDMg8kn0u8xB9ITkyi9m3sSv2PuUX+YRB0gAU7A=;
	b=w/c1gqFfDzeirACCGqiDJr9dqVlRlQx4Ojs2nm6x5IRyL2rUP4iC5tx9bJS8f9PHoxQ/yI
	OraK+tdtKSHMFVCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06936133F3;
	Sat, 24 Oct 2026 08:35:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zVHiM9ht3GpqZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 Oct 2026 08:35:37 +0000
Date: Sat, 24 Oct 2026 10:35:36 +0200
Message-ID: <87fqxv8pif.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Benjamin Pryor <programmer2514@gmail.com>
Cc: Andrew Udvare <audvare@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66 Raider 11UE
In-Reply-To: <2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
References: <20260909193104.26508-1-audvare@gmail.com>
	<2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,perex.cz,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 24 Oct 2026 10:26:37 +0200,
Benjamin Pryor wrote:
> 
> > Add a fixup that programs the amplifier's initialisation sequence at codec
> > init, which turns silence detection off.
> 
> This fixup should apply to device ID 1462:1305 as well, since it uses
> the exact same coefficients as 1462:12fb and suffers from the same
> silence detection cutoffs.
> 
> See: https://github.com/thesofproject/sof/issues/10475#issuecomment-6380540623
> 
> Best,
> Ben Pryor

Could you submit a proper patch for upstreaming?


thanks,

Takashi

> 
> ---
> diff -u alc269-old.c alc269.c
> 
> --- alc269-old.c	2026-10-24 04:14:40.174188675 -0400
> +++ alc269.c	2026-10-24 04:14:28.725047392 -0400
> @@ -7593,6 +7593,7 @@
>  	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
> +	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
>  	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
> ---
> 
