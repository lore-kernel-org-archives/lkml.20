Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27936197E;
	Sat,  3 Oct 2026 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018869; cv=none; b=MzdxhGVKie8YkKY2vwgTbtGjIkRmkMU/Fy4mYm5FWgbeRFHtMMsIEXofghvhonpvp4DTyWX+x0oNEOmK+yhjLIj0Y5VP758+Tfv2V3rYZqtmUFVfMCJzLaE1Kg5CJ/5cjHdWYfsMo5UlD1TdoN03CXyq9ikTTCiT83+atFRFSrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018869; c=relaxed/simple;
	bh=Ssbthym35J11NlLiVFAsyqRowYu32o/p01e4+R+mq9o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXek/LYC9zB4iQnnbk1fkCuiCKApPCwT2gX5sabdrNnT/cssMrfqGIEPbD3VVGxFfdMiNeH0YlXvwuVTORNw9g/3WB6MHwSG4bcouP9m3YdDQJi2ctg2PT6bENali3jL68VEmXMcsRJCmMcVvByE5Gjze4hAHVCWBviT6jYPFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fL1mlj3z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5OgXPDHp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u1YFZMwW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0Az2a4fS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fL1mlj3z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5OgXPDHp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u1YFZMwW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Az2a4fS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D6ED1FECE;
	Sat,  3 Oct 2026 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Khne2AmZKrAqNnfUZBI5euzaCrjHmVJdRxL1HqZuYkM=;
	b=fL1mlj3zYgLTZPJR2uNJuM4A0/BuUH0fvF1mJs2UrKb1omlZx+MwJPZD0QKjMLjgoQGkjz
	CPnpqd6lX9hndh3k4p7KP4mq3+Y3DRtG02QdmY0A9kXaKqIbfhEAOUaqm/AHaBEtN6l2H6
	+V+G6ne1udOK9CtFmSLZE2DTj3a29LM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Khne2AmZKrAqNnfUZBI5euzaCrjHmVJdRxL1HqZuYkM=;
	b=5OgXPDHpemU1OOxpTQPBHWpDaHvQomaxH0YiEge+zzbRtNzQtPv0eJD0wlXyNt2aW3mS0/
	3lEJIm7ZM6jbkvCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Khne2AmZKrAqNnfUZBI5euzaCrjHmVJdRxL1HqZuYkM=;
	b=u1YFZMwWLqMGA//6DybApihR3IaBKq+GGyFRl2BI24g/FztG66yjeBUzNc/gbZML5TcfrZ
	rTIoXnr2sRDKhEDHSD4cdXNi8CZcOdIaK7qHluxggpcD5cn+WYDhoI1nEroMBO60jg32Ux
	IJ4flAw2XUDHOjStNziSx2NXiOcVNCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Khne2AmZKrAqNnfUZBI5euzaCrjHmVJdRxL1HqZuYkM=;
	b=0Az2a4fS+oWbH48Pf/RIfyVJ9hBsUKo9ik+dEte8VW+IRF0U0ZCn8aQfN02Kg/z+ebd9dM
	4xMS2AchrmP9LWCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E429913712;
	Sat,  3 Oct 2026 09:14:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E7CKLmjHwGrsIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:14:16 +0000
Date: Sat, 03 Oct 2026 11:14:16 +0200
Message-ID: <87ld8fxi1j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Eckhart Mohr <e.mohr@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASRock NUC BOX-358H
In-Reply-To: <20261001183403.103990-1-wse@tuxedocomputers.com>
References: <20261001183403.103990-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.28 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-0.98)[-0.980];
	NEURAL_HAM_SHORT(-0.20)[-0.975];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.28
X-Spam-Level: 

On Thu, 01 Oct 2026 20:34:00 +0200,
Werner Sembach wrote:
> 
> From: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> 
> Fix headphone jack detection for some devices
> 
> Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Applied now.  Thanks.


Takashi
