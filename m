Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B173E3DAB;
	Tue, 13 Oct 2026 06:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874628; cv=none; b=HuOjK/2w9u1xfMUjcyMpF7zWTKpeiJC5scy8fsOT2UR2MSqZoz1QO/wYUX4xQNvcPCrTfF3qz/2/7PbY4tI45yCBhL/DPCXDJcpUF3dg8MbC+mBWDK/vWFYDFau47wL8GxOw/UnCmdliceBkKPjChwreL1Wy4s60vWWkbN02KIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874628; c=relaxed/simple;
	bh=gFLb20HVXvXXP3zoRRodUfz9UTCptI/EIrxFPeQioNw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAfy7NhnrfU2NTrQE6DTssUdMuym3sE1YyCyVP2wHnxAeoQyJssuvR2WdiUl65+QK4q/n1XIugQ8f7bdqbkVvlpPmRsSNEyP2a5kSXJ614ZRJknz3gD2nUl+C/J5w4/TE4uOhQNuSbAho0aNPayL71IO1hItnkNcvRe9HQ/xbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTi4wuSx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=73VOziSu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QOaUIBzs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LxJtrxcu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTi4wuSx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="73VOziSu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QOaUIBzs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LxJtrxcu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 276B51F82E;
	Tue, 13 Oct 2026 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791874624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TYrrJxpMgT4bqmH1E9/F0Kp3FqT9uLzM9cFbdnO51M8=;
	b=oTi4wuSxT/fl/nRlOllX96iOXxrgY3RQcUSrmH/+Je77YO8cNoGGRAXxE8ye4az3KcX+eC
	vEa4eoLUKhr8cn6esA6/FEy15fmSkcxuvVG4ThsQeJWjHZFmHqMN5w7wsvTKq+/Lj22PVt
	YQwVH2Npz77EJeo+BPSX0h++h4h/mKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791874624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TYrrJxpMgT4bqmH1E9/F0Kp3FqT9uLzM9cFbdnO51M8=;
	b=73VOziSuKjquxjlLFLUOqY0PJJURTp+KpDL4W6NfLWMbdlgDJNdaHQpt2a/fQOhUl+1EgF
	E3QRly4msjUgVFAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QOaUIBzs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LxJtrxcu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791874623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TYrrJxpMgT4bqmH1E9/F0Kp3FqT9uLzM9cFbdnO51M8=;
	b=QOaUIBzsn38TsfLyG2/SYA/O371si/NyUPbJBABcTTki0uKyUg6PyqME3PYLsxGsfOKMhp
	1oTV7oaciQIBFch3fAn1BWD5SzHnsNxP1yy/49Fk2PxZPEBcIPzc726Vp+VZc/nIrPDbxa
	EnikbBlRWIutpKzxTtjDH5s0htMaEjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791874623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TYrrJxpMgT4bqmH1E9/F0Kp3FqT9uLzM9cFbdnO51M8=;
	b=LxJtrxcuNbr08MhpN2Az6HCcl7iG2BZThwjIcGYSLueGO5XCWfD7naNDmBYMrwwBJNVQ8J
	SgkG8oTM/ayEeXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 858FD1349D;
	Tue, 13 Oct 2026 06:57:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /8u2FT7WzWqFPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 06:57:02 +0000
Date: Tue, 13 Oct 2026 08:57:01 +0200
Message-ID: <87h5iqozpe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	blum@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: jack: Remove debugfs before freeing unregistered jacks
In-Reply-To: <CAFRLqsW7Y8YZok60ezLw9WKDXQMWd1=3NDQ5fxAoa+dotFRAUA@mail.gmail.com>
References: <pm-pmb-e1e7490bbe7ba1b3c44a-v2-3e3b6315a18c02ced60d@gmail.com>
	<871p9vidio.wl-tiwai@suse.de>
	<CAFRLqsW7Y8YZok60ezLw9WKDXQMWd1=3NDQ5fxAoa+dotFRAUA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 276B51F82E
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Tue, 13 Oct 2026 06:21:22 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> Takashi Iwai <tiwai@suse.de> 于2026年10月12日周一 15:28写道：
> >
> > Could you verify whether the problem still exists with the latest
> > sound.git tree for-next branch (i.e. for 7.4)?  There have been fixes
> > for the races at the disconnection, and snd_card_disconnect() became
> > already mandatory before the release.
> >
> 
> Thank you for the review and pointing out the recent disconnection
> fixes. I checked
> sound.git for-next at 8d70e364e866. A potential remaining issue is in
> the cleanup after a failed HDA codec rebind on a live card. The call
> paths below show how a newly created, unregistered jack can be freed
> before its debugfs entries are removed.
> 
> For the generic HDA codec driver, jack creation follows:
> 
>   hda_codec_driver_probe()
>     snd_hda_codec_build_controls()
>       snd_hda_gen_build_controls()  [build_controls callback]
>         snd_hda_jack_add_kctls()
>           add_jack_kctl()
>             snd_hda_jack_add_kctl_mst()
>               snd_jack_new()
> 
> snd_jack_new() creates a component in SNDRV_DEV_BUILD. With
> CONFIG_SND_JACK_INJECTION_DEBUG enabled, snd_jack_kctl_add() publishes
> its debugfs files. Even though the card already exists, this newly
> created component is not registered yet.
> 
> If a later jack-control allocation fails, the error returns to
> hda_codec_driver_probe() before its snd_card_register() call. Its error
> path reaches:
> 
>   snd_hda_codec_cleanup_for_unbind()
>     snd_hda_jack_tbl_clear()
>       snd_device_free()
>         __snd_device_free()
>           __snd_device_disconnect()  [skips SNDRV_DEV_BUILD]
>           snd_jack_dev_free()
> 
> snd_jack_dev_free() unlinks the controls and frees their snd_jack_kctl
> attachments before calling snd_jack_dev_disconnect(). By then the
> kctl_list is empty, so snd_jack_remove_debugfs() has no entries left to
> remove. The card-level debugfs directory has not been removed by a
> snd_card_disconnect() call along this cleanup path.

Thanks, now it's clearer.

IMO, ideally speaking, the debugfs entry addition should be done at
the registration phase, i.e. snd_jack_debugfs_add_inject_node() should
be performed in snd_jack_dev_register().  But it'd be a larger change,
so I take your patch as a quick fix for now to for-next branch.


thanks,

Takashi
