Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755463C9EF6;
	Mon, 31 Aug 2026 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163646; cv=none; b=HuJ+n3p3QzcqmOELaKVTfaC5N6ww4lYW+CQz32RwBdZEb/wfLq2sg10DgFKU5sf1itD6ydlsvAz78GpJ8JRePJdG3ZxJb245tVbklQqy+oc100/yPJL/wWg/RpfFWnFFA9iNBOJIn+Q7eIqDoQfOXGsY2eWpsRhS1467j9BXz0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163646; c=relaxed/simple;
	bh=o5XlMW4LGXqWij9UOFGBQjwRQ4Cd9pa0xEdao2aziQk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFJu19R12WXiiT9gYnOEqPqwij7i7jRt51w+C9jZ/V4cDtsghoLpCWfeomC3tkOdCYyEkIiBbObbE6n9g0XdcqfYIMhYeBtrCitrBFgE6Z0TWHoVdaYg5obdSFSxbxhSBhw10HoztICZijqbVcRmWNbmyp/0yA3av33ui2b3oV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J/3wDrZb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3w47LRRE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ITywfvL2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a9KV7N2u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J/3wDrZb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3w47LRRE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ITywfvL2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a9KV7N2u"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 033F122729;
	Mon, 31 Aug 2026 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788163639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZH9cjDhNl1m6sDklrhye290EQ8RldV3BydZgsDYPcU=;
	b=J/3wDrZbpvCxsJv3DeVPLAH1WuhYS4OTbHCrmHgbIeBjvrszAH7H+54hekg8Ha2bkrQYr0
	BzvGgHA5DKftHdXt1gGTMTgGsDvIzaxh8fRDno99N/K6LK54ixH3bT5ybQuXkrULPzjezw
	JihyJzFIXvmoQPiW65wsv5Uwm6I7qks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788163639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZH9cjDhNl1m6sDklrhye290EQ8RldV3BydZgsDYPcU=;
	b=3w47LRREKlGEZzTUqxuoIr0JDoAql/tURbDTK8ucFBVVCOwcL9khLwFFrbsmOaP/U/9/dL
	DFfRksruUAOhAfDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ITywfvL2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a9KV7N2u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788163635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZH9cjDhNl1m6sDklrhye290EQ8RldV3BydZgsDYPcU=;
	b=ITywfvL2JRwU3IUjpORaxTtuIWPtbTcGu904HLRwJmwGxXMEEpDQ2S9kFCmb/jw4TKrKNd
	OsouuRoeEtMyzNdx6nklZCatq7lQrYsI80ABrXckMgnnonA8Hf1cjiwQAHdktyluwLR18G
	dRrbWyjB8gja35OBpHH2pVAutr/8Tw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788163635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZH9cjDhNl1m6sDklrhye290EQ8RldV3BydZgsDYPcU=;
	b=a9KV7N2ucTfl0KPmySMqkHWME77asvJv5xxdjRuWvcwFVc1ER4RskR/ClCG5+MGDU0fwoj
	uz5yKlsVxU6uFxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A61DA13515;
	Mon, 31 Aug 2026 08:07:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TQc1JzI2lWoWfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Aug 2026 08:07:14 +0000
Date: Mon, 31 Aug 2026 10:07:14 +0200
Message-ID: <87cxuysogd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Riku Matsumura <rick197.3@icloud.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for VAIO VJS131
In-Reply-To: <20260830000008.22371-1-rick197.3@icloud.com>
References: <20260830000008.22371-1-rick197.3@icloud.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 033F122729
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[icloud.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[icloud.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icloud.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Sun, 30 Aug 2026 02:00:08 +0200,
Riku Matsumura wrote:
> 
> The VAIO VJS131 with an ALC233 codec incorrectly selects the headset
> microphone when no headset is connected. Add a PCI SSID quirk for
> 1d19:0006 to apply ALC233_FIXUP_ASUS_MIC_NO_PRESENCE, which configures
> pin 0x19 as a headset microphone without its own jack detection.
> 
> Signed-off-by: Riku Matsumura <rick197.3@icloud.com>

Applied now.  Thanks.


Takashi
