Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C8440641;
	Mon,  7 Sep 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772176; cv=none; b=pSmJoJs6Flbr29D4RqdIgtoVaODlYo0L7TOIOozcp5yk+imCgIj1Bt4e3U8f/+MqKDq60kwjBJknDUxoqW0I8wzmGuqBHxI5chuLuNoNUXICgau7Cz6zj8hUP2q8Tg+F7GlLGRZ1GuDsVETQukGkSf49ULbrIV1xUF9BwzpcFYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772176; c=relaxed/simple;
	bh=a5yTJl1mTRNz/JnJGETtgRbZibZXhJy1nbc0Lpub2jM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ww4K9c6DAL9VNAY1GDrNTGB4YIKQQxrBp663qNCocyr6TrxxpnCntcdBRYMjfLkXnIC7OxDGPaZdhR9+ckpw/L/50fFNLmkOXEFx/29WJWjrFZuYsnlDJDhx+WDDg6cb1ikXPEPNPuEr3y88kEhWvRLm8LPIeRAjzHUUZun79B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RxmycdbA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MLkoViF3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EYS0JhIM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZFqKzuHP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RxmycdbA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MLkoViF3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EYS0JhIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZFqKzuHP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D93E1F453;
	Mon,  7 Sep 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788772169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ayhPQCbhnor1lPCivHrHnj/zJ7ZNSLcLh+xD4A7yX4=;
	b=RxmycdbAIO4OVyCEIL9O0pfCvwDurOi1D6P2DoJBgwPq3Tut6eHaRtriZJHJUkZgMw8WrQ
	SExGba1NQAHUqo4JSr5yal2OTJ1zPC8gOAMEJihO3p/wVdQKm+DpZ2sINpDaDyuWP1jRup
	t8vuwpKxPg5IFTdg2cM6ceed+h4nhu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788772169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ayhPQCbhnor1lPCivHrHnj/zJ7ZNSLcLh+xD4A7yX4=;
	b=MLkoViF3YX+tUsoMfLapzh0/Nmt1Om7/HXDHRhI8X0xzs8FgIpbdyhE/KWysQU8AIG0Jw0
	Tl6qVYDRt08leKDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788772165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ayhPQCbhnor1lPCivHrHnj/zJ7ZNSLcLh+xD4A7yX4=;
	b=EYS0JhIM7+I5nJqqJSCPUZul5E5jtOxOY8dxW/DR7vV8qItmL99TfLU7v86sySDTr6xAfB
	zRSfmXm87SL1Rzx/HJSA1F4GU72HX/0L0tuXGCIqEPDbHbDHb7w7TFKkkcXeBf9ORbs+AM
	Me0eVmCeCe43pwyam5CQAsvfQjpT2zY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788772165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ayhPQCbhnor1lPCivHrHnj/zJ7ZNSLcLh+xD4A7yX4=;
	b=ZFqKzuHPDLBuoB4hA18WebMRzpdcA+vsdAajgcFWSY3+a2sVA8Bh6Mz69QhV6gfnW3K2E5
	wXzgGhD6uc1mcHAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79FA613432;
	Mon,  7 Sep 2026 09:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a6NmHER/nmoyaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Sep 2026 09:09:24 +0000
Date: Mon, 07 Sep 2026 11:09:23 +0200
Message-ID: <8733vltol8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
 <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] ASoC: SDCA: allow building without ACPI
In-Reply-To: <b1eb306a-ca6b-4fb5-93c6-7890a88e2689@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
	<20260907083727.733705-2-srinivas.kandagatla@oss.qualcomm.com>
	<b1eb306a-ca6b-4fb5-93c6-7890a88e2689@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,opensource.cirrus.com,linux.intel.com,perex.cz,gmail.com,linux.dev,suse.com,catcrafts.net,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 07 Sep 2026 10:54:08 +0200,
Richard Fitzgerald wrote:
> 
> On 07/09/2026 9:37 am, Srinivas Kandagatla wrote:
> > The SDCA class driver is useful on non-ACPI platforms where the
> > topology is supplied statically via sdca_class_hw_ops.get_function_data.
> > 
> > Drop 'depends on ACPI' from SND_SOC_SDCA and guard the
> > ACPI-parsing implementations in sdca_device.c and sdca_functions.c
> > with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.
> 
> Would it be better to use IS_REACHABLE(CONFIG_ACPI)?

CONFIG_ACPI is a bool, so it's equivalent.


thanks,

Takashi
