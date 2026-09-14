Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985633D5C05;
	Mon, 14 Sep 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402133; cv=none; b=RoqIHa6GYxALjNmqJfxcifZIk5shUxr3r+1P5egIsCptID6CSpqYw4wPVY4e9KD7c5nxbPsdV+ggiAJPyNBb/wO3eqJmf9kKXcFQMZr0F+S6ACYerljceLfr+rnZXOGwE638wWawAhXP6ENqRxoAaZM41A0kPS6CW+Sa7PGMGH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402133; c=relaxed/simple;
	bh=HKY52jKpb2U52c2dS7+hBLFBvpuDcJCIssi8KzriE3w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Di996GRj8fOv6OjX7f9+rMu4bo+1UrFYJwnusRvnktgZlHoP6dawn8VzuEcKTT9+fxkeDjaIj4j1bg0hce7x4UEFRhFSYlgSsUwEZkXb+LU+3pz77SzyDKpAnxIwxDfiq4ubfjLilppvCxk/oWWNgyJQSE96680T0qCpXtHDooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oJsBxZHG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ePFS6Dm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gqpf7rjy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4qnvxuY+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oJsBxZHG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ePFS6Dm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gqpf7rjy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4qnvxuY+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 34CF71F893;
	Mon, 14 Sep 2026 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFz8ohKQNPvuZo7ItrkkkBBy/UFIGtCsj3BWGvoA1nw=;
	b=oJsBxZHGNB/+TU69TIeJcnHQ7NH2b7Zl6vO8Q4C40lpNg/Nn6TW54BYNbW2O4WLDjjV7Y+
	Rwfx5fC5hUXw1cgI94Nk8TKRVLfE6BoqD982Z7xsMG9cK2TT0IcsDMX2agfiWNZp40Uod/
	PIYwKmlsje+Y878SRrbG8+lEoJvKE4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFz8ohKQNPvuZo7ItrkkkBBy/UFIGtCsj3BWGvoA1nw=;
	b=7ePFS6DmMKQOobXodeemLB6RTNUxVZu876vmVrRhmUOi1wfI16P47lXP6wpMeOGLwsM1w0
	fgXKQ8trT1fq3WBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFz8ohKQNPvuZo7ItrkkkBBy/UFIGtCsj3BWGvoA1nw=;
	b=gqpf7rjyXlfNPdVieJGWwHUZGRprMGcQY1nyA3yWZcd5hnic6y5T238+JFpC5NzY+nv/t/
	bPt627PAMvxrE6n/LgzxkXygjrpSTD6XK9wRsJVrsxQ7GnygaiJ61UuVRXMFdsFk3Pkenl
	M/xcRvQoPuTIEGIGl1DVutvdXLW3cgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFz8ohKQNPvuZo7ItrkkkBBy/UFIGtCsj3BWGvoA1nw=;
	b=4qnvxuY+7AfDm00LThcfzHKS8WlRgfrB5TLhsb9Sa9u2IGu4W3t4cZepsGM0KtxoI/PQcW
	xKzF8+gSfPm+eOBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7B3713693;
	Mon, 14 Sep 2026 16:08:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1C9yMwgcqGpsFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:08:40 +0000
Date: Mon, 14 Sep 2026 18:08:40 +0200
Message-ID: <877bknolx3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: fix typos in comments
In-Reply-To: <20260907063202.20577-1-hemanth.selam@gmail.com>
References: <20260907063202.20577-1-hemanth.selam@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 07 Sep 2026 08:32:02 +0200,
Hemanth Selam wrote:
> 
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  include/sound/emu10k1.h             | 4 ++--
>  include/sound/emux_legacy.h         | 2 +-
>  sound/core/seq/oss/seq_oss_init.c   | 2 +-
>  sound/firewire/bebob/bebob_hwdep.c  | 2 +-
>  sound/hda/codecs/hdmi/hdmi.c        | 2 +-
>  sound/hda/codecs/realtek/alc882.c   | 2 +-
>  sound/hda/codecs/sigmatel.c         | 6 +++---
>  sound/hda/common/codec.c            | 2 +-
>  sound/i2c/other/ak4113.c            | 2 +-
>  sound/i2c/other/ak4114.c            | 2 +-
>  sound/i2c/other/ak4xxx-adda.c       | 2 +-
>  sound/isa/opti9xx/opti92x-ad1848.c  | 2 +-
>  sound/mips/hal2.c                   | 4 ++--
>  sound/pci/ac97/ac97_codec.c         | 2 +-
>  sound/pci/ac97/ac97_patch.c         | 2 +-
>  sound/pci/au88x0/au88x0.h           | 2 +-
>  sound/pci/au88x0/au88x0_mpu401.c    | 2 +-
>  sound/pci/aw2/aw2-saa7146.c         | 4 ++--
>  sound/pci/cs4281.c                  | 2 +-
>  sound/pci/cs46xx/cs46xx_lib.c       | 6 +++---
>  sound/pci/cs46xx/dsp_spos_scb_lib.c | 8 ++++----
>  sound/pci/echoaudio/echoaudio.c     | 4 ++--
>  sound/pci/echoaudio/echoaudio.h     | 4 ++--
>  sound/pci/lx6464es/lx_core.c        | 2 +-
>  sound/pci/lx6464es/lx_defs.h        | 2 +-
>  sound/pci/pcxhr/pcxhr_core.c        | 4 ++--
>  sound/pci/riptide/riptide.c         | 4 ++--
>  sound/pci/rme32.c                   | 2 +-
>  sound/pci/rme9652/hdsp.c            | 2 +-
>  sound/pci/trident/trident_memory.c  | 2 +-
>  sound/pci/vx222/vx222_ops.c         | 2 +-
>  sound/pcmcia/vx/vxp_ops.c           | 2 +-
>  sound/ppc/tumbler.c                 | 2 +-
>  sound/usb/mixer.c                   | 4 ++--
>  sound/usb/mixer_us16x08.h           | 2 +-

That's way too spanned than wished.  Could you try to split a bit
more?  Not necessarily one by one, but the current form is too coarse,
and it can be problematic when backporting a fix patch in future, too.


thanks,

Takashi
