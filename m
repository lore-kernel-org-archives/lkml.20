Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D6310652;
	Mon, 31 Aug 2026 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163574; cv=none; b=gFXVXsgvSqg6ez25qx13YJNfVW3c0XPLXPTGRPItodVDuIIYRKcWMWRC6GEwzitvsurbY8homvMDRMCds8fpUN145127/fOrPsSC5wv6OH/HcYx3esjwKM09Y/qAfwRjMvhj5N+8NV+XKkLPU7jwflDFEVY80PPPBbAszoQj2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163574; c=relaxed/simple;
	bh=1kesVN34fvEitPRM+XPoxwR9jQVdHcN8nCqzlfYrZuc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2eek9Wzti6GMmGckICpCYlzqBRXb9n0QYnpMgMFE4h26VEVKTNG6+GkYkn1enp94B7k7hoHdtxyieEkx5Dl7t5y+HZWLT7AZh3MECz4ve8cuLAjMp+cfbISsz5CWcEg8VHAnVRvedA1Avn21NEJtbTY7PyExymLMaPtA631hk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JDjy5LW0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CaxqGe93; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D4GZCmYD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3yHb4/89; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JDjy5LW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CaxqGe93";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D4GZCmYD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3yHb4/89"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54FDB1FB86;
	Mon, 31 Aug 2026 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788163567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WHjuqHGpzh1Z9uFx0kR/NlpPeEUBMlxQpQJce9ZRerY=;
	b=JDjy5LW0fV5VfmnQoMUuJy+ekqUThjWxi3mOTYoPKrmeOsxhpg3AViF2oQFrr2Lfc6gWfM
	IzuaoK/+taOvq8oWJZvCqF5jr68YkXnhu9Yr3tmwcTMBwlW5dH44X3fOcbd8RSGaGQmT4c
	ZdzlMZ3dsvZghYi85EvUO+aBpBjdYlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788163567;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WHjuqHGpzh1Z9uFx0kR/NlpPeEUBMlxQpQJce9ZRerY=;
	b=CaxqGe93a9syofdIQB95udnIOQwOER6fUAAHJtHlyiTePfyma1xkUm7ugSh5gMWJb/lbT3
	PvZM3tqIzDWdxlDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788163563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WHjuqHGpzh1Z9uFx0kR/NlpPeEUBMlxQpQJce9ZRerY=;
	b=D4GZCmYDXPDiE16JrD/Jh2abYumNyYfvOQ9q+KCEPVLNLEHO2kNzQWmPn99mN3125dS74D
	gGQilBeMKoIvvVUZ2PE8vvGte4l8sIz101mlgj232BxLajNnPLirJdVfJ1wzj28bkFIYuk
	DeYeEYi5LPkBHJNJFjRmNoT3U93h/zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788163563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WHjuqHGpzh1Z9uFx0kR/NlpPeEUBMlxQpQJce9ZRerY=;
	b=3yHb4/89rOK6xlgcpRZLWgtfsNcqgaDi2UPgJHtOqvCmna7FBgGipjH3KgHFt/m8tOIpS/
	SdLXCsmXq9PowbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 167E313515;
	Mon, 31 Aug 2026 08:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BmHuA+s1lWqcewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Aug 2026 08:06:03 +0000
Date: Mon, 31 Aug 2026 10:06:02 +0200
Message-ID: <87ecfesoid.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 9 14ILL10
In-Reply-To: <20260828101704.354406-1-zhangheng@kylinos.cn>
References: <20260828101704.354406-1-zhangheng@kylinos.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Flag: NO

On Fri, 28 Aug 2026 12:17:03 +0200,
Zhang Heng wrote:
> 
> The Lenovo Yoga Slim 9 14ILL10 (83CX) uses ALC287 with CS35L56
> amplifiers. Without a matching SSID entry the bass speakers stay silent.
> Add PCI SSID 17aa:380b (codec SSID 17aa:3905) to apply
> ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221902
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied both patches now.  Thanks.


Takashi
