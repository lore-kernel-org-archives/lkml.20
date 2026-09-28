Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAE8156661;
	Mon, 28 Sep 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595381; cv=none; b=KoeAgSHvbwEm20CMxvyRqrqGHmQ89krJ+iuylI+bAQwMmkm0Mxio0TTK7LTxPgJRIgIgaub2evEnp5GSTFQIAB9WjTfCBp5EIRBJiewvHKq7eiO1Fq3wrTFICfuOTf42nuUWkkkkjNGOahNT5CNYrihdc0FGafi6mnzzI0osVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595381; c=relaxed/simple;
	bh=+LwjN+4N0qy5ur3uKeuz7fDqVrpsYM5o6p8p72k1kEo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1D3nzaJB95NeKV+GUh3Vu9sIzMQIRH+iLQ2OJKvruYiGCRdIAoNkgPL28McOcRbvHL3quTAhDg60da6bnC9XWj6mAj68X1/xgBKocHx6JmAQ180H5vlkpfWECzVELOYm2qU2VIb8hhw6cUZOlhTcxWlAN/cnIwQLXqFe0SuXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j7EzHeMv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EJuuAaQv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cT4r18FK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h7KPH6mC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j7EzHeMv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EJuuAaQv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cT4r18FK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h7KPH6mC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1E8D21F86A;
	Mon, 28 Sep 2026 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vd0hw8L3uIu7JvjfnIdQURpeWTGFsQp/Tl/85mT9804=;
	b=j7EzHeMv/dAsOi8qHEtU0TKVE0Y4uZhcOy9t7tTIvbO9JWtDCQrN5LMcYF9JazbDGkiLoH
	7Or/JwSZEH8jSds9bcdrXSwEQ315cDZaNR2to2x323/Y2QMMmkGFC4x62IkEW6eCNbd3yc
	qDlqdCm1cNvFAPGEzOM3qNrQ2cjH/wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vd0hw8L3uIu7JvjfnIdQURpeWTGFsQp/Tl/85mT9804=;
	b=EJuuAaQvDXwffT37VyPytbtXTkheYdPunEl9gfCvquLObKepf8qHPkWT/RmKh/fPxVCS4+
	f6M7T7m/DwQUeTDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vd0hw8L3uIu7JvjfnIdQURpeWTGFsQp/Tl/85mT9804=;
	b=cT4r18FKVJkWDo+Q6E2sr08D5KqgULrdqA6S/bH6gEuCL3Nyd66b99wAj8T94TpYu4y4PK
	aO5VIMnY7stKiEZliE/3ztS8RMuEy9NP2mH0TxzWaWhVD9d9jTM20GxnB60KI6Q3REysiP
	GjYAREz/4AknkuZ8o+TzyrOSYqqfOxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vd0hw8L3uIu7JvjfnIdQURpeWTGFsQp/Tl/85mT9804=;
	b=h7KPH6mCMd+FlMTTQR1g82jdbbdsC2e9S0gTv8BaakddZweb4hzcV+w8oYubbA/+ZuVNiw
	vBQmst7xQGWeOmBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8020133F3;
	Mon, 28 Sep 2026 11:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s1q4JylRumrPRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:36:09 +0000
Date: Mon, 28 Sep 2026 13:36:09 +0200
Message-ID: <87wls5621i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roman Bolotov <hadros@ikeepitoblique.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flag for ASUS SupremeFX Hi-Fi
In-Reply-To: <20260923064527.434441-1-hadros@ikeepitoblique.com>
References: <20260923064527.434441-1-hadros@ikeepitoblique.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Wed, 23 Sep 2026 08:45:27 +0200,
Roman Bolotov wrote:
> 
> The ASUS SupremeFX Hi-Fi (0b05:1826, 0b05:1827) does not survive USB
> autosuspend.  After a suspend/resume cycle the firmware degrades: HID
> probes begin to fail and the descriptors it returns become corrupted,
> until the device stops responding entirely and needs a physical power
> cycle to recover.
> 
> Add QUIRK_FLAG_DISABLE_AUTOSUSPEND for both product IDs.
> 
> Verified on 7.2.6 through the quirk_flags module parameter, with no
> code change, and with the local udev rules that had been forcing
> power/control commented out, so the parameter was the only mechanism
> in play.  Both IDs were passed as
> 
>   0b05:1827:disable_autosuspend;0b05:1826:disable_autosuspend
> 
> The device then stayed awake across 2.5 hours (runtime_suspended_time
> remained 0), survived a system suspend/resume cycle, and continued to
> work afterwards with no failed probes and no power cycle needed.
> 
> Signed-off-by: Roman Bolotov <hadros@ikeepitoblique.com>

Applied now.  Thanks.


Takashi
