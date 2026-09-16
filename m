Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B414457C7;
	Wed, 16 Sep 2026 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544482; cv=none; b=W5UeCb7blgvOxXflLxg3TAI4AsV33sI625YUaXSZZlORe1lRfGKpxUz0F65J+a7UrS2UmahxYfIPPkPPZa+72YmH38x7XtaV16aKntu9vhel455hwItYp53S2ntibu1K0aP1W9KHC+7xpu3ftXumsOBc7F2POXLBt/7l1LKVgOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544482; c=relaxed/simple;
	bh=tay9gdRdnmbOWrci6HaZ97LBWSFEjpAoXpazrwaWGhI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYyUqopS442fSVSXehnllQqUCuZoPqUP3oCLHLieuX1GinE3Cp6BtjYuF/HtQKqD+JhOMLMJbkYHWIS9mjsIvRuyoR8FUFnxkDWKRID43UQq8AumfxOMLNg3CTTvuDUkx0r1UXCIDPHx4sy0/suzamYylOOzDeE8voov0dZc1/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2PSFwoD8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O/Bb7oGs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uXOyBF52; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=35cKx9lP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2PSFwoD8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O/Bb7oGs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uXOyBF52";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="35cKx9lP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7A4721A6E;
	Wed, 16 Sep 2026 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789544460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BxglG7s/pBFpIRx525JpPFtW2x8vqQ7lCtjyeujkXI=;
	b=2PSFwoD8MF9BrsagRR92cgJ1jNU8LKJhqthx0Ckt3nv4gZQHLeByqbq7HG8ekysvhMxo9K
	Qnac5uqJRS3BYjPjfEIxII++5DTstgTNQ1coutAS4z4Vxj7O1vqdF7tdejznT0lVz83Uen
	CIPx8xxnSkEwbB7K2P4vLRI5PNbdaGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789544460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BxglG7s/pBFpIRx525JpPFtW2x8vqQ7lCtjyeujkXI=;
	b=O/Bb7oGsSV5eWwL9+dfIOrv8nnggvpMsPskWau0IDZkQamWBy7cKowaP/m78offVqDCFIm
	KvEq0t1ubph+bNAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uXOyBF52;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=35cKx9lP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789544455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BxglG7s/pBFpIRx525JpPFtW2x8vqQ7lCtjyeujkXI=;
	b=uXOyBF526hyENMYEafZWkOvm6ZvCIdT4JfXGztcLZg0h8QDJlza/kNcseGIC8NE8QXJZ/n
	dnlAQQfgeGdnRjK6w8YX8di/gDHpQ8uTFLiAw1XlwMSWwSDoakqlFBEEmu+oTqe+K9KuPB
	AZbWFZ1RPPLdnlthNuORKHL5yHqWVV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789544455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BxglG7s/pBFpIRx525JpPFtW2x8vqQ7lCtjyeujkXI=;
	b=35cKx9lPqfcrMK5k2Kx4gWA3/Y6RpZHTbIa3/n/DVf+a9AQbQz0OQAYNmnqGO6NKIW9/ou
	+lzvY2csMCrInzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 860DC136A5;
	Wed, 16 Sep 2026 07:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q6YaFwdIqmo8HAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 07:40:55 +0000
Date: Wed, 16 Sep 2026 09:40:55 +0200
Message-ID: <8733v9lk3c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: patryk.dankow@protonmail.com
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	dnaim@cachyos.org,
	damien.dagorn29@gmail.com,
	kailang@realtek.com,
	habilerenturker@hotmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda/realtek: Add mute LED support for ASUS PM3406CKA
In-Reply-To: <20260915174110.67871-3-patryk.dankow@protonmail.com>
References: <20260915174110.67871-1-patryk.dankow@protonmail.com>
	<20260915174110.67871-3-patryk.dankow@protonmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E7A4721A6E
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com,protonmail.com];
	FREEMAIL_TO(0.00)[protonmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,kylinos.cn,cachyos.org,gmail.com,realtek.com,hotmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,protonmail.com:email,suse.de:dkim,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Tue, 15 Sep 2026 19:41:36 +0200,
patryk.dankow@protonmail.com wrote:
> 
> From: Patryk Dañków <patryk.dankow@protonmail.com>
> 
> Enable vmaster mute LED handling for the PM3406CKA while retaining
> the existing CS35L41 I2C fixup by chaining the new fixup to it.
> 
> Tested on ASUS ExpertBook PM3406CKA.
> 
> Signed-off-by: Patryk Dañków <patryk.dankow@protonmail.com>

I suppose both patches should be in the same tree, so feel free to
take my ack if the series go through another tree:

Reviewed-by: Takashi Iwai <tiwai@suse.de>

Or, if both should be merged through sound git tree, let me know.


thanks,

Takashi
