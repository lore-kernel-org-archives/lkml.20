Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042603;
	b=K4nWa7W9Em3D5cGycas82ItkCoVlJ9xRLIsotxf5IiGHEeR6g6nHxTIZCP0CRKl1sGvJ
	 YMpZTvzn4SY5yhPVw5ynGdxtzjZrI4lHeqtncqGTFdbCiV4lOSr2h6iK/xf7Upujz3QP4
	 VQP7WpIVhcilKTwFl01ajEQb4sdp+1tflTBS2+OGvuFU5DxfkJbsnTgoRlTdi797okt9Q
	 RHoE4QaD3aWf+cH3R609YGRT2VBB8667HZafxT0AU54ZfphY4VxsGK80RUmfhHGOjhF/d
	 16AmGnXi9IV1QsfdtSvV70daBQl+R9jsoGDRQ4kahANGXjcYo+SOya1jQYpRWumiOBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042603;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=58xoYRpmyM84qotsXl7y1fIxuq7D7HoXDGO7AOQk7B8=;
	b=L+uUmdrfKGRlf1SDDUEeUx9EGENKyEr4uemyoWj+hsvNJPwInQnLzTak18Ta5NiZucVJ
	 dwRLBrM2BZrj3NGMmlUysKssMouWuvWwhCbHj6gE/CfPsEvN49JHZt2khd/4ZpPz5JFUc
	 LjoOR4nkR1+bc+BWWiVmUmfg79FVmru6OeBizwkcaWbMCBhq00oroyPn5IxLkpq/aFmU/
	 0j+3sxchu99c+xDm7P5GGHBXvgCOM0ey8AFHO3W7ti5mlUdUoSqaCZu8HpKiwo0xqhHuX
	 Z1+liKKp2cKJSjUAfMhDxUc/GQicjlPHHlLDbKItuxQCVYi0a4lqxUdCpacj5laLi6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mJWWyvfY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3UNC+BYZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mJWWyvfY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3UNC+BYZ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F6606A326;
	Sat,  7 Nov 2026 09:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mJWWyvfY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3UNC+BYZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mJWWyvfY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3UNC+BYZ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 81FC01F797;
	Sat,  7 Nov 2026 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58xoYRpmyM84qotsXl7y1fIxuq7D7HoXDGO7AOQk7B8=;
	b=mJWWyvfYsr63/+uPnI1Acj71p9RQDqItb/KG5jpvqpbmFugf5PzzrBGcig3lunfgqJqVIG
	e68KOnuVeT0vr+RXIBrZl7M0JFEt2uFozf7ZB0wT4b3JuojOHmssh1AMzCFS/3Nx6St0hQ
	0VJBmHFmjH9wvacbDCpFtJslmoODTtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58xoYRpmyM84qotsXl7y1fIxuq7D7HoXDGO7AOQk7B8=;
	b=3UNC+BYZBhU61l1PZhUR1NOyAM2IQlcUAvIpiM42+u5bwJuCy7HQTPd3ixz+S9OzBmpQg9
	Z7YGPPPvvDzhugCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58xoYRpmyM84qotsXl7y1fIxuq7D7HoXDGO7AOQk7B8=;
	b=mJWWyvfYsr63/+uPnI1Acj71p9RQDqItb/KG5jpvqpbmFugf5PzzrBGcig3lunfgqJqVIG
	e68KOnuVeT0vr+RXIBrZl7M0JFEt2uFozf7ZB0wT4b3JuojOHmssh1AMzCFS/3Nx6St0hQ
	0VJBmHFmjH9wvacbDCpFtJslmoODTtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58xoYRpmyM84qotsXl7y1fIxuq7D7HoXDGO7AOQk7B8=;
	b=3UNC+BYZBhU61l1PZhUR1NOyAM2IQlcUAvIpiM42+u5bwJuCy7HQTPd3ixz+S9OzBmpQg9
	Z7YGPPPvvDzhugCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10929132C9;
	Sat,  7 Nov 2026 09:10:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V2RiNOfq7mq7YQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 09:10:00 +0000
Date: Sat, 07 Nov 2026 10:09:59 +0100
Message-ID: <87eccxyplk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
In-Reply-To: <20261106183953.2762-1-sreekuttan2156239@gmail.com>
References: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
	<20261106183953.2762-1-sreekuttan2156239@gmail.com>
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Fri, 06 Nov 2026 19:39:53 +0100,
Sreeraj S Kurup wrote:
> 
> mode_store() updates led->mode while holding
> snd_ctl_led_mutex.
> 
> However, snd_ctl_led_set_state() and mode_show() read this
> field without holding the same mutex.
> 
> This can cause a data race when userspace changes the mode
> while another path reads it.
> 
> Read the mode under snd_ctl_led_mutex in
> snd_ctl_led_set_state() and use the local value after
> releasing the mutex.
> 
> Also protect the mode read in mode_show() with the mutex.
> 
> Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

As this sort of data race for a single value has no much impact on the
actual behavior, it's more or less just for consistency.
So I applied to for-next branch.  Thanks.


Takashi
