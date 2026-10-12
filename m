Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CB429825;
	Mon, 12 Oct 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816705; cv=none; b=uwKNOAqW301SWOWtoXwIZUyrYrlVih3y7shwCLwjuN2qVro4+O6iY2OfqZiyJEy9MbsOstkFO183FHYDfB4Nr4fRD6SJ5JebIpbLETkCK4cAry/jRiNhPnwT1JFkI1VxeShPhrbRh6SzG4bwF+qxFPUswH20FPTalwPJZPSIW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816705; c=relaxed/simple;
	bh=ZhzLGhWwIeBN0DJCkYMQNfGEFns5SmMfMztuIxAuqng=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGW6zzBgjigHigt21dd1SEuaMnOTie5EN1QcckVqF6biRJWw+UkGzhx8gXBbD4MQu8eJvEIytPAAmtGGXfmR+pu36KHr1SY2Sc6myBJX9ESz+IbxRXRxLKa55gx8vVGfQhXxB89OuxvYA7crokX01/oMAESuRL1t+IMxzXbXc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lz/HiNe0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OkzSRvr1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lz/HiNe0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OkzSRvr1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lz/HiNe0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OkzSRvr1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lz/HiNe0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OkzSRvr1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 808CF21E1B;
	Mon, 12 Oct 2026 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791816701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34G8PX6AvOsqxjd/cf2SxPH+Se9/btkP4IeV9ac0LGE=;
	b=lz/HiNe0VjlfCHloJNZLlzP+iWxZTVVa6jZgJIdVKcbvLGMZaGVIsGyzZZszi7vQgCePQd
	dOXSrfCseLRse/zVRjve/QbRKy4adFX4dH3ew+pXLK/VvKu9wS4sXWLP9SrHT6XVeKY7aC
	7FNGwJ/7AzSt4Sbbr5mTsfo2DZt892c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791816701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34G8PX6AvOsqxjd/cf2SxPH+Se9/btkP4IeV9ac0LGE=;
	b=OkzSRvr1/VtuZTVfWIGg10Dqd6lqsvndcEZeK+OUwELUVbbw1t0SxHq5jG4b24gmIE1bgQ
	C3B7mCp6u9PbT5CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="lz/HiNe0";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OkzSRvr1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791816701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34G8PX6AvOsqxjd/cf2SxPH+Se9/btkP4IeV9ac0LGE=;
	b=lz/HiNe0VjlfCHloJNZLlzP+iWxZTVVa6jZgJIdVKcbvLGMZaGVIsGyzZZszi7vQgCePQd
	dOXSrfCseLRse/zVRjve/QbRKy4adFX4dH3ew+pXLK/VvKu9wS4sXWLP9SrHT6XVeKY7aC
	7FNGwJ/7AzSt4Sbbr5mTsfo2DZt892c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791816701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34G8PX6AvOsqxjd/cf2SxPH+Se9/btkP4IeV9ac0LGE=;
	b=OkzSRvr1/VtuZTVfWIGg10Dqd6lqsvndcEZeK+OUwELUVbbw1t0SxHq5jG4b24gmIE1bgQ
	C3B7mCp6u9PbT5CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D395A13408;
	Mon, 12 Oct 2026 14:51:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nylAKvzzzGp8SwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 14:51:40 +0000
Date: Mon, 12 Oct 2026 16:51:40 +0200
Message-ID: <87h5irgef7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control_led: Fix deadlock between sysfs writes and card disconnect
In-Reply-To: <20261012141238.1823718-1-aliamemis@disroot.org>
References: <20261011180627.1594051-1-aliamemis@disroot.org>
	<874ieridp1.wl-tiwai@suse.de>
	<20261012141238.1823718-1-aliamemis@disroot.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 808CF21E1B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, 12 Oct 2026 16:12:35 +0200,
Ali Ahmet Memiº wrote:
> 
> On Mon, 12 Oct 2026 09:24:26 +0200, Takashi Iwai wrote:
> > Hm, it's not clear to me how this happens: I see no controls_rwsem
> > down around snd_ctl_led_disconnect() call.  Could you elaborate about
> > it a bit more?
> 
> It's taken in the call_snd_ctl_lops() macro in control.c:
> 
> 	guard(rwsem_read)(&(_card)->controls_rwsem);
> 	guard(rwsem_read)(&snd_ctl_layer_rwsem);
> 
> so snd_ctl_dev_disconnect() calls ->ldisconnect() with controls_rwsem
> held for read.  snd_ctl_led_sysfs_remove() then waits in kernfs_drain()
> for the attach write which is blocked on down_write(controls_rwsem) in
> snd_ctl_led_set_id().

Thanks, now it's clearer.
The patch is applied to for-next branch now.


thanks,

Takashi
