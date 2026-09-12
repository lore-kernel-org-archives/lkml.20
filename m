Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FED47ACDD;
	Sat, 12 Sep 2026 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216459; cv=none; b=JxIvYI3o5+KqMNTcc3FT++/uYGtQH2HtStEG4dxpHDDwnxI4w3atjKw+jHayGgUGMmoWxxQwgMI6dfCL7FEPVBtNSUgKIWDzYoveNphISKFU3mVk0H3k+mKKjtF6THiV1wQ2x+IOkK9JDI4hmD/0dtK5CFfGBnksBguZnGux1tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216459; c=relaxed/simple;
	bh=kCOhI9Y8dNnSwx5/91OI5NKkgojCQKJBcnLap64Pat0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMSUX42ZXD+yfvebEL2eR0sa+GnZRt/z+Yol7p3K/gfzjOQM9ldKYFUJfPhN+wtijmQXhadwdgB3F4hkO/uyqxu7/5d5rt73mSI2J/9dao+uPxgqMH3Jo4jxfKyWII78X581fxSZqk+Y8/gTVKgJd+u6KAHBl0PY3Z0oQzzk5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1MPI2fwT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uuz8BKpW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bi0EqLfM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3M3om3xf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1MPI2fwT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uuz8BKpW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bi0EqLfM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3M3om3xf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7069B21D33;
	Sat, 12 Sep 2026 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789216445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNVwZ3JmFclZeYHLps49T6yXw5/ApBLAYr6fcNpekaE=;
	b=1MPI2fwTjqtLw3f47dnZxS9cAUjZURlCV0/7hprf5q9sjiNpZZX3BoUs1RSt4GQIjl7mS5
	tGdpE8f3Yg27Yv/dCPekIN2dORN1Z4zEPJPpvM85wPzB8kTghqGmXdVG40rx+eXvBNyQcS
	5CDIor59Mt/14+ep8BUtE9x40k42n8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789216445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNVwZ3JmFclZeYHLps49T6yXw5/ApBLAYr6fcNpekaE=;
	b=Uuz8BKpWPeu++993J+R6oXRki9w7fLG9z80pT1HYen7cT18sjln2thBDbqidtzjaiJSWLf
	F9++DNWeseZvkNDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Bi0EqLfM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3M3om3xf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789216441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNVwZ3JmFclZeYHLps49T6yXw5/ApBLAYr6fcNpekaE=;
	b=Bi0EqLfMP5Bf/LyyE7WX/REkB/v2X09e3xu62BQlhzQxvrhn3Y1IaTctk+2eIkJpfTvN/x
	+sC25g1Vh95lSHLMbNEhrmJ451rn6tjKN9dGIBaZi2+29ppsc36+OeD4XUhfEITzOhSLL8
	09lt5MpMwk6BNGP2XyAkC8/ozC7wfMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789216441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNVwZ3JmFclZeYHLps49T6yXw5/ApBLAYr6fcNpekaE=;
	b=3M3om3xfv5ImWCsbIcuKyuHi+nOzUWjkHXUnMyy7A0s9pXG0P0b8P7cJ71GPXgWZ8YcHkX
	g/b2mr6+7kIEU9CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0749C13693;
	Sat, 12 Sep 2026 12:34:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y62RALlGpWq3DAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 12:34:01 +0000
Date: Sat, 12 Sep 2026 14:34:00 +0200
Message-ID: <875x0a3ayv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free Read in usx2y_async_seq04_init
In-Reply-To: <CA+0ovChexj4TrZL_2iG_P0WBEbZc5+73GfB3DkciQi=R8pZOnA@mail.gmail.com>
References: <CA+0ovChexj4TrZL_2iG_P0WBEbZc5+73GfB3DkciQi=R8pZOnA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 7069B21D33
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Fri, 11 Sep 2026 17:53:55 +0200,
Farhad Alemi wrote:
> 
> Hello,
> 
> We are reporting the following crash (reproducer attached):
> Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
> Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)
> 
> [   44.599577][ T9507] BUG: KASAN: slab-use-after-free in
> usx2y_async_seq04_init+0x2b8/0x360
(snip)

Both this one and your another report ("[BUG] KASAN:
slab-use-after-free Read in __snd_ctl_add_replace") are basically the
same issue -- UAFs after the card release of USB drivers that are done
asynchronously from the disconnect callback.

Below is the fix patch for both.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: core: Fix potential UAF after asynchronous card release

Usually a sound driver releases the resources assigned to the card via
snd_card_free(), and it synchronizes with the whole release procedure.
However, when the card is released asynchronously via
snd_card_free_when_closed() like USB-audio driver, the situation is
slightly different; although the snd_card_disconnect() call at the
disconnection guarantees that any newer accesses will be gated, the
in-flight tasks might be still accessing to the underlying card->dev
device even after the disconnection, which would cause a
use-after-free in the end, as reported by fuzzers.

For addressing the bug above, this patch takes the refcount of
card->dev at initialization of the card object, and releases at its
destructor.   This assures the availability of the card->dev in its
whole lifecycle.

Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
Closes: https://lore.kernel.org/CA+0ovChexj4TrZL_2iG_P0WBEbZc5+73GfB3DkciQi=R8pZOnA@mail.gmail.com
Closes: https://lore.kernel.org/CA+0ovCgQUQNN=Z1tJTouiCsDaXR5M-3-SQEGk-cpPXQkM5Xh+w@mail.gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 2f7f83a7611b..bffa94b7b956 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -310,7 +310,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 			kfree(card); /* manually free here, as no destructor called */
 		return err;
 	}
-	card->dev = parent;
+	card->dev = get_device(parent);
 	card->number = idx;
 	WARN_ON(IS_MODULE(CONFIG_SND) && !module);
 	card->module = module;
@@ -605,6 +605,7 @@ static int snd_card_do_free(struct snd_card *card)
 	}
 	if (card->release_completion)
 		complete(card->release_completion);
+	put_device(card->dev);
 	if (!managed)
 		kfree(card);
 	return 0;
-- 
2.55.0

