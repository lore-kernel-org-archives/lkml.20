Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7780372EC0;
	Sat,  3 Oct 2026 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009570; cv=none; b=YAfwlDpWFI1+HisEYIKp/8i4sYlglMANyLqvTer2uXCg+JT1/o4ggOBygGMNPiZKtg5LBafOAibjRD1gCtV8WH8c5ZQ/4Xhb98In+QmcuTEt2QWMy7xZpCFX/7OBWxkxjtdq2nZZHQmNozWCs2f+zCx1sIN1AhF2+RVhhbl6hZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009570; c=relaxed/simple;
	bh=Pj8Nbq/Wt20QRo+thE9FsJkDTqcyfpSl0x/M3iYGYJo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I9RWEX3CX3LUySswcBnCiWYlH2FNfXnjQn9si4vuPcc0EWlaLTx6wHwaiEy9Ci6b4zxz/xpQyFjLvQESLEf1bMRYg437XnCuRUVNwQYz0N+oMeESkpc9Dn7JryXSF5BaaxfOFK6krrsRv9VBGzrCX0tcYeQy04b2rKWIqWFCiGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KAyDF+XO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kF4JtyU/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T+DZ6MhP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6FJAh52+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KAyDF+XO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kF4JtyU/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T+DZ6MhP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FJAh52+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BD8B21B02;
	Sat,  3 Oct 2026 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791009562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=KAyDF+XOrg9b8Wr9+kJ3zqOXm697eHGDQ8fFCe2lLQAIz6Leit+XdOVJJRYQpxre9A0xdp
	U4c86F8J5T5v4yq8+5b6TdkR68oYXf/eAsTpP531QDjY9bXVisFLPFiryWkbuBNGwkWk/f
	uQKQCCGXmXWGXyD6WZsqqwwbHbvePP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791009562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=kF4JtyU/3LOEHjQBfY7qE10jZI8z+EVLGwuqqgtLmnYZJktULZw7w9cImkxBgpjWpzTEyI
	zmTHianPnkANq8Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=T+DZ6MhP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6FJAh52+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791009558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=T+DZ6MhP5XYLdPUuAzT/xpVwqesWts2vKCzkSASzMUEDZZNJmO+s13tJYxIrT4ay7cyC2j
	aMU4Z3xemjSb8p1t533vRHJLubmqQeCwrUglWiwscy7fzD7iO/ypx2LZ8FxscM9EfsBGcD
	0caU2R5OFvVSCVh4UGp0k0Fv/Ycp2kU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791009558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=6FJAh52+hKBECMpEzhZhDMl+zgwrTQjPGj9lw5zb6aRkUV1o9Ra+cPXjJmyDLdSgLiz/oI
	1ASo8i0FYZjIp+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C27813707;
	Sat,  3 Oct 2026 06:39:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MU+pNxSjwGqQCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 06:39:17 +0000
Date: Sat, 03 Oct 2026 08:39:16 +0200
Message-ID: <87wlrzxp7v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,	Martin =?ISO-8859-2?Q?Povi=B9er?=
 <povik+lin@cutebit.org>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski
 <krzk+dt@kernel.org>,	Conor Dooley <conor+dt@kernel.org>,	Sven Peter
 <sven@kernel.org>,	Janne Grunau <j@jannau.net>,	Neal Gompa
 <neal@gompa.dev>,	David Rhodes <david.rhodes@cirrus.com>,	Richard
 Fitzgerald <rf@opensource.cirrus.com>,	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,	Ulf Hansson <ulfh@kernel.org>,	Amit Kucheria
 <amit.kucheria@linaro.org>,	"Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Vinod
 Koul <vkoul@kernel.org>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Sen Wang <sen@ti.com>,	James Schulman
 <james.schulman@cirrus.com>,	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,	linux-mediatek@lists.infradead.org,	Hector
 Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
In-Reply-To: <u9VW29vaRPGENsSTq9RHUg@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
	<20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
	<878q4k2xl0.wl-tiwai@suse.de>
	<u9VW29vaRPGENsSTq9RHUg@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3BD8B21B02
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,cutebit.org,gmail.com,kernel.org,jannau.net,gompa.dev,cirrus.com,opensource.cirrus.com,perex.cz,suse.com,linaro.org,intel.com,metafoo.de,collabora.com,ti.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,marcan.st];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[lin,dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Sat, 03 Oct 2026 03:34:07 +0200,
James Calligeros wrote:
> 
> On Tuesday, 29 September 2026 7:52:59 pm Australian Eastern Standard Time 
> Takashi Iwai wrote:
> > On Sun, 20 Sep 2026 06:53:47 +0200,
> > 
> > James Calligeros wrote:
> > > From: Hector Martin <marcan@marcan.st>
> > > 
> > > This allows drivers to implement policy around locking/unlocking
> > > controls, such as enforcing that a group of controls may only be locked
> > > by the same process/file, and taking actions when the controls
> > > lock/unlock (such as granting special access on lock and resetting
> > > values on unlock).
> > > 
> > > This is, in particular, useful to implement volume safety controls, such
> > > that only a particular process (that locks controls and completes a
> > > handshake) may increase volumes above a given safe limit. It also allows
> > > the volume to be automatically lowered if that process dies (which will
> > > trigger an implicit unlock).
> > > 
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > 
> > This doesn't sound like a good approach to me, and this looks rather
> > irrelevant with the purpose of the series.
> 
> I'm not sure what you mean by it being irrelevant. A significant portion
> of the machine driver is dedicated to implementing safety interlocks based
> on the functionality added via this patch. It would be impossible to prevent
> badly-behaving users{,pace} from defeating the safety guarantees made by
> speakersafetyd (and thus permanently damaging the machine) without giving
> speakersafetd exclusive ownership over the safety interlock kcontrol.

Improving the lock/unlock itself can be an interesting idea (but we
should do in a different way instead of blindly extending each kernel
control ops).  OTOH, the whole implementation of the driver and the
feature depending on that stuff sounds rather fragile.


thanks,

Takashi
