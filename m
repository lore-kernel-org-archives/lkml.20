Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49283D3CF7;
	Sat, 17 Oct 2026 08:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225733; cv=none; b=Fv3Ilo9UJiOUO7ePYeMYzwuk5nw+4VSUBn6cpmQYreLBW+2whFcCFO10jg8T6IpK8baO1/LcdrY7FgFsi9R77WMlHz/lbavYG2ZWKpWEzefxf7zDdMMvUuu+b5Sny3lK8DKDaEpWBhCAfu7yRxNliltxKMM7laXGmFCjHNKkeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225733; c=relaxed/simple;
	bh=1mnSXF5Oh99ccRNYJmvqh3wAMVGtTICWDddNKy5a3OY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlS7MAYf92gDzbQzvOQ6qfXqC7I+yn1e9vT4nO8KVLQ8xD4ns3tDtJ0Z4ukLQgIrPLcYS215KC3QUYZoYv0hOWysc4I89PJW5nuRXVj05WEm3YHsEX8pepNNo17dlHX7gnIwfjH0dFHZa+3le+Nn68XtM+9Y34iojF5c44zFZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d/dtmcrg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YyVizgDn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d/dtmcrg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YyVizgDn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d/dtmcrg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YyVizgDn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d/dtmcrg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YyVizgDn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A60F1F444;
	Sat, 17 Oct 2026 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQLtpgkU4vf2KXxErSB29OFP8fm40JZ2yd8AGnVkmXE=;
	b=d/dtmcrg+kPj/6mOz/tRgvb7do9RcgZ4z26BPm6Ukeo9XwaCeWAPXqQSJUP15Z2x75rI8s
	ZiIQ/BBjDsbsSDuvhQQk+YQv1cIWhk01H5MILO8h0jy5PPIeE1xh07QRdONsiF/BgWcHPY
	r29nkNeys6YdBUwLRRMAmyXf35s5oiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQLtpgkU4vf2KXxErSB29OFP8fm40JZ2yd8AGnVkmXE=;
	b=YyVizgDnrJvGib2D96LWRfekR03JDCAfT0H27S99UC5P5QwU+q+VGSlZq5Tq2GXxrATxs/
	31Oo2Pf0mGPLbmAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="d/dtmcrg";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YyVizgDn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQLtpgkU4vf2KXxErSB29OFP8fm40JZ2yd8AGnVkmXE=;
	b=d/dtmcrg+kPj/6mOz/tRgvb7do9RcgZ4z26BPm6Ukeo9XwaCeWAPXqQSJUP15Z2x75rI8s
	ZiIQ/BBjDsbsSDuvhQQk+YQv1cIWhk01H5MILO8h0jy5PPIeE1xh07QRdONsiF/BgWcHPY
	r29nkNeys6YdBUwLRRMAmyXf35s5oiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQLtpgkU4vf2KXxErSB29OFP8fm40JZ2yd8AGnVkmXE=;
	b=YyVizgDnrJvGib2D96LWRfekR03JDCAfT0H27S99UC5P5QwU+q+VGSlZq5Tq2GXxrATxs/
	31Oo2Pf0mGPLbmAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3B05133A7;
	Sat, 17 Oct 2026 08:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iWdtIsEx02qPJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Oct 2026 08:28:49 +0000
Date: Sat, 17 Oct 2026 10:28:49 +0200
Message-ID: <87ik3020ji.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix internal speakers on Acer Aspire AL16-31P
In-Reply-To: <20261017005039.9139-1-gamaerry@gmail.com>
References: <20261017005039.9139-1-gamaerry@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Rspamd-Queue-Id: 0A60F1F444
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Sat, 17 Oct 2026 02:50:39 +0200,
Luis Gerardo Lopez Hernandez wrote:
> 
> The Acer Aspire AL16-31P (Intel Alder Lake-N, Realtek ALC269VC,
> PCI/codec SSID 2782:1718) has its internal speakers wired to pin 0x1b,
> but the BIOS marks that pin as not connected (0x411111f0) and only
> exposes pin 0x14 as the speaker. As a result the internal speakers are
> silent while headphones, HDMI and Bluetooth work.
> 
> This is the same layout as the Infinix Y4 Max and MEDION E15433, which
> share the 0x2782 subsystem vendor. Reuse their fixup, which configures
> pin 0x1b as an internal speaker and limits the internal mic boost.
> 
> Tested by booting with snd-hda-intel model=2782:1705: the fixup is
> picked, pin 0x1b is used as a speaker output, the internal speakers
> work, and they are muted when headphones are plugged in.
> 
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
