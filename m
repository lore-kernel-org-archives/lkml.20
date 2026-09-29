Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF452BE59;
	Tue, 29 Sep 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688895; cv=none; b=c7WUw6b3NpWw4nMQxhtzOYNYuKhrMp2snVfQOxI9vOwvzQ44MJqq79ggzSUILzEeVk5ppf7h9KC6mzUpL/eJuPDn4wnSmvXvf5Z7qRWD6QnxQvJz0YvhVM7uCFkROHCG7eFWpiGo/iVeoYaoh2k2sD7/FoNkJ4Il6WYGUWiIXJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688895; c=relaxed/simple;
	bh=NwIPoOh+SqHXgnzsp6cdk7HD0c7lF4TMNyWmWRqc0/k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sX36cc7Wbf6wbErNMiSpObbCuA0NCKERsYMVBMi9X8+JB4hXurV4xc5xHCh9pxATJBLbqw+GOGYankTwo7VUwfDxJ8gX72h61Opb7LvHJCfRr2ZgHqiJr0ZrmAwJuysm/LFPlTo0dEf/W6TY1H3MKbKVmpntyBi1Awfs7mYrENk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oUkOs+3F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wTSVGCCD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SuUlB3XE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lwL+69hD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oUkOs+3F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wTSVGCCD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SuUlB3XE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lwL+69hD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1429421DB9;
	Tue, 29 Sep 2026 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790688889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YURhHYKq6jcwd6Xp7yP0pZ7S25FKaRJXpjOVPQWr6ws=;
	b=oUkOs+3FoecrF0u3B1krndPe3TTvAss9DOme64K77SnoxrtKEsTjhw/atb+fis7PlecjfP
	DRVOrded2yJzu56y61IEw8T2Wa3WQXll/MwnQpHguk1+BbwYEkUxguzMxOYCYDOz4OE/qR
	Y+Tdzj9/m2WXKC09euzNIXPaMj8J7bw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790688889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YURhHYKq6jcwd6Xp7yP0pZ7S25FKaRJXpjOVPQWr6ws=;
	b=wTSVGCCDPsJTf52F51tkYI4iaYvAgArEM3iTleES/12z2u5wiYJvfj6wLCKSJXu0KUaDYU
	R7TwN5TsK+7k28Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SuUlB3XE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lwL+69hD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790688885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YURhHYKq6jcwd6Xp7yP0pZ7S25FKaRJXpjOVPQWr6ws=;
	b=SuUlB3XEgM9Flj91qRoMEYhCbOZMmFHQCHYin1DbPY6RJ68yEvFNm5dhNUz3MivFENfTTJ
	Leit+H2DSgCOjfU75rnsvoxw+E2PWD6KQN+sAaNlDg80+Xub1MYgtg6WvDSkS0YYDkt/KP
	JTecyg0hHTEPozEaQDZyM6eAtl0iQdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790688885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YURhHYKq6jcwd6Xp7yP0pZ7S25FKaRJXpjOVPQWr6ws=;
	b=lwL+69hDX/gMxDJOW4IS3mbY/f8O91cGfraYJgVbIvAeg2EV1Njf1VzHLNEezDeXcVNk+p
	D9LTnQLsvwQSvTAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEC42136D1;
	Tue, 29 Sep 2026 13:34:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KyOfKXS+u2qiIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 13:34:44 +0000
Date: Tue, 29 Sep 2026 15:34:40 +0200
Message-ID: <877bk418r3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Protect Roland control activation
In-Reply-To: <20260929074026.2040321-1-runyu.xiao@seu.edu.cn>
References: <20260929074026.2040321-1-runyu.xiao@seu.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1429421DB9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 29 Sep 2026 09:40:26 +0200,
Runyu Xiao wrote:
> 
> The USB MIDI driver changes the Roland MIDI Input Mode control's access
> flags directly from the rawmidi open and close paths.  These changes are
> not protected by the ALSA control core and the corresponding notifications
> can race with control access.
> 
> Use snd_ctl_activate_id() so that the control core updates the access flags
> and sends the notification under its lock.  Release the USB MIDI mutex
> before calling it because the control write path holds controls_rwsem while
> roland_load_put() takes the USB MIDI mutex.
> 
> Keep the state transition and alternate-setting change under the USB MIDI
> mutex; rawmidi's open mutex serializes the enclosing open and close paths.
> 
> Fixes: 96f61d9ade82 ("sound: usb-audio: allow switching altsetting on Roland USB MIDI devices")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

The patch couldn't be applied cleanly on top of the latest sound git
tree for-next branch.  Could you try to rebase and resubmit?


thanks,

Takashi
