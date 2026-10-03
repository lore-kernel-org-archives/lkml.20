Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B91B3BED5F;
	Sat,  3 Oct 2026 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019363; cv=none; b=fd5yh3zeXNvb2TKK9eXZgqPaCrAVfXXcFW9yDqCVf6Jy0kWJiISjyVw/A1xVrPzQPIYiYri5aWYxmsn6RQhP0YvxauVgFN6FI8i2ZOKlVq+bWoYexu3n9j+WxHVtfxEPvssKwPUGZVByZa4SdOd4hCzJ71AZTn8LgcmFGUNkAbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019363; c=relaxed/simple;
	bh=TF27ZLneeG9cgfK7XGN2merjaga8WF3G4Qh7s93x+fY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mt/8mdVbugH0dcE78CH3Qjg9TiGhSsRRT2ZOPfWptVLExux59Yog9ZtAwBGCGTfsGp1KjEd4/hyCYqC52SVYuxrPbhKzV2FVFA9gk6gTS1t6LpkM1b01Wu72EQm1S3pi5LVTHzTWfAZiLWU15CFXDpmoN5GaTo7HsYnQyIs3Xxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=my52R8VS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y0e4ZY/x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o0qnjyBd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tKiNhQPy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="my52R8VS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y0e4ZY/x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o0qnjyBd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tKiNhQPy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 046611FECE;
	Sat,  3 Oct 2026 09:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791019353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=my52R8VSIc8jiRLCwxnGDMah/d0WwzVDvjzRTIJTlK9GAFKAvrqTQ67aGfZbZ8GORxGkEt
	pBWBC/ecjvRjMDmS45a0Z+Zj/V3ytzTX3W6pbhLcTBFi7tRhHKh/zf1Q4FmwSgtd9CJRSq
	MLRVo2Ffd4xTt3Tiu45K2trgd7Qqtwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791019353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=y0e4ZY/x/TijHmgs32hn1KqyWePaDtRh3o0dbqpSmUr3s4aLjjUDCu93NADdtVSKZtTWqN
	bE11BeY0SlMNLwAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791019349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=o0qnjyBdc81rS3mR5z80q6HVqgP3FC+xtHgJzjReQt5TLk9IxCelCFG1xofvS2Okrva/jO
	XngN2vy3wUWWpqEigs5U1Re04z2VWQ4syhsN2WoGbsdeF9EJBG50Y4SalCIAmAO8ecsSi4
	dbv3Oiy4GjgAgi6vbux8kP3IVSYmIlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791019349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=tKiNhQPy6pFKT6VAQEePtpoOWhJQJNWWwMrNGF15zCU3LCOT0rgsqjT46Ob8jSm+06t6En
	YNjsNdqTI68AtECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E974413712;
	Sat,  3 Oct 2026 09:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7r3OLlPJwGodKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:22:27 +0000
Date: Sat, 03 Oct 2026 11:22:27 +0200
Message-ID: <87fqynxhnw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Rob Herring
 <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor Dooley
 <conor+dt@kernel.org>,	Sven Peter <sven@kernel.org>,	Janne Grunau
 <j@jannau.net>,	Neal Gompa <neal@gompa.dev>,	David Rhodes
 <david.rhodes@cirrus.com>,	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Ulf
 Hansson <ulfh@kernel.org>,	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Vinod Koul <vkoul@kernel.org>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Sen Wang <sen@ti.com>,	James Schulman
 <james.schulman@cirrus.com>,	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,	linux-mediatek@lists.infradead.org,	Hector
 Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
In-Reply-To: <87wlrzxp7v.wl-tiwai@suse.de>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
	<20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
	<878q4k2xl0.wl-tiwai@suse.de>
	<u9VW29vaRPGENsSTq9RHUg@gmail.com>
	<87wlrzxp7v.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[lin,dt];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[cutebit.org,gmail.com,kernel.org,jannau.net,gompa.dev,cirrus.com,opensource.cirrus.com,perex.cz,suse.com,linaro.org,intel.com,metafoo.de,collabora.com,ti.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,marcan.st];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Sat, 03 Oct 2026 08:39:16 +0200,
Takashi Iwai wrote:
> 
> On Sat, 03 Oct 2026 03:34:07 +0200,
> James Calligeros wrote:
> > 
> > On Tuesday, 29 September 2026 7:52:59 pm Australian Eastern Standard Time 
> > Takashi Iwai wrote:
> > > On Sun, 20 Sep 2026 06:53:47 +0200,
> > > 
> > > James Calligeros wrote:
> > > > From: Hector Martin <marcan@marcan.st>
> > > > 
> > > > This allows drivers to implement policy around locking/unlocking
> > > > controls, such as enforcing that a group of controls may only be locked
> > > > by the same process/file, and taking actions when the controls
> > > > lock/unlock (such as granting special access on lock and resetting
> > > > values on unlock).
> > > > 
> > > > This is, in particular, useful to implement volume safety controls, such
> > > > that only a particular process (that locks controls and completes a
> > > > handshake) may increase volumes above a given safe limit. It also allows
> > > > the volume to be automatically lowered if that process dies (which will
> > > > trigger an implicit unlock).
> > > > 
> > > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > > 
> > > This doesn't sound like a good approach to me, and this looks rather
> > > irrelevant with the purpose of the series.
> > 
> > I'm not sure what you mean by it being irrelevant. A significant portion
> > of the machine driver is dedicated to implementing safety interlocks based
> > on the functionality added via this patch. It would be impossible to prevent
> > badly-behaving users{,pace} from defeating the safety guarantees made by
> > speakersafetyd (and thus permanently damaging the machine) without giving
> > speakersafetd exclusive ownership over the safety interlock kcontrol.
> 
> Improving the lock/unlock itself can be an interesting idea (but we
> should do in a different way instead of blindly extending each kernel
> control ops).  OTOH, the whole implementation of the driver and the
> feature depending on that stuff sounds rather fragile.

Also, if you want a locking by user-space, how about to simply provide
a boolean control element for locking, instead of extending the whole
API and infrastructure?  The control can be taken exclusively for a
process, and the driver just blocks the operations from others while
the flag is set via that kcontrol.


Takashi
