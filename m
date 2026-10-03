Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3694E36494B;
	Sat,  3 Oct 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021214; cv=none; b=UGfRdy+q5vVTpf4HKjs0RAt2F2OCSZho7Y2JHFMBkhhOIpf6rs1ze6KXjyhKHrTSwR15TLNwfus4FElZ8fRZPui6GKQbdjHFx989CB6biaxXpxlorfUYZXcDchWkE75FfpgCSIQDDb0ISahilfJRx8kpY6h6ijNoGMEhXpMBO+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021214; c=relaxed/simple;
	bh=zWHyGmL3fwCHQd2VG5DCM0CU2eR+mWdbzkYvQcty0rc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UmHxd7V2WTeJk3mHcVsbL4QkiUWiPQtJebQCDOn5FapWxOtXiCUNlEXHNianRoKM+PxOCc4QL2zKw5ARgYsoudhj1RN/rvZLEeYjgV3LLOiL/VIb8BDTUZRPmwABTJVlSDwqpIcOd3qe5BwrOVp0GSiFbRQU6wCGP4ikZiCWWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uj0jMMXQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TIVm5st7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GUWdiC0X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SDRyZGbY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uj0jMMXQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TIVm5st7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GUWdiC0X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SDRyZGbY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EC281FED3;
	Sat,  3 Oct 2026 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791021207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pGeDujY3TCxcrIZyqEV+iPSAQk/snzvWeJlB/KF81LY=;
	b=uj0jMMXQ6t+hnrrgWQoHPFZtiwurF0FwNhtY9rp7BQvDK8DIpL+pRkgC4RP4dxnw9nJt76
	GPQGKzZdQF0RxG5OAyjVfyXSnhdxztASRiA4sxyGNXpYoTEaHaHr1QHksvybbD6smlbxzL
	v/6oqzVzgqvGwWn20iqD/empWm5yi+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791021207;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pGeDujY3TCxcrIZyqEV+iPSAQk/snzvWeJlB/KF81LY=;
	b=TIVm5st74RNPtrZzK2FAdnjt3Bf74eghGa1zduRoWvXwZV3CJsD3ZC/dsHYW+MdGZs3epy
	tcc47DUAgfufwKCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GUWdiC0X;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SDRyZGbY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791021203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pGeDujY3TCxcrIZyqEV+iPSAQk/snzvWeJlB/KF81LY=;
	b=GUWdiC0Xh1aOznTA/pKWjvHRSTCxjRKjyy/ZPzCPeGLVLL3DtFj7B83iK9UCxmV7WFR6vj
	Mqc2hSalMFSs2I4DxLofkOzY5Tb89BTaly8QV1FWLrSxGugQYuENo/4VYSJ8LnuN8E3EiG
	wHfAGFEXi4wuzNXfqh2Ela/Y9pRDRK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791021203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pGeDujY3TCxcrIZyqEV+iPSAQk/snzvWeJlB/KF81LY=;
	b=SDRyZGbYQ1ynl7SqYXDLcT6R7dIyAsBK6j+InJzYo7gKt8u8IIS+TJF3Yigjyj72QFJvvG
	76Hpr1GiyxGXbFDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98C3213712;
	Sat,  3 Oct 2026 09:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m8lyG5LQwGokSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:53:22 +0000
Date: Sat, 03 Oct 2026 11:53:22 +0200
Message-ID: <878q4fxg8d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yejung Kim <catcake43@meowing.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flag for Creative Stage SE
In-Reply-To: <87bj9bxgf6.wl-tiwai@suse.de>
References: <20261002185035.9040-1-catcake43@meowing.net>
	<87bj9bxgf6.wl-tiwai@suse.de>
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
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meowing.net:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0EC281FED3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sat, 03 Oct 2026 11:49:17 +0200,
Takashi Iwai wrote:
> 
> On Fri, 02 Oct 2026 20:50:35 +0200,
> Yejung Kim wrote:
> > 
> > The UAC mixer on Creative Stage SE (041e:3289) returns invalid/constant
> > GET_CUR volume values, causing ALSA to treat it as a sticky mixer and
> > to disable it.
> > 
> > Add a quirk table entry applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN to
> > allow volume controls to function correctly.
> > 
> > Signed-off-by: Yejung Kim <catcake43@meowing.net>
> 
> Applied now.  Thanks.

... rather not, I dropped again.

This flag is no longer needed with the latest 7.3-rc, and the quirk
has been dropped / renamed.

Please retest with the latest 7.3-rc.  Or it'll be fixed in the
upcoming 7.2.x update, I suppose.


thanks,

Takashi
