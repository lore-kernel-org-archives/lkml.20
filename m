Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21DA70809
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998610; cv=none; b=d2oK3tH21yabnSru/eH9wNIchyG//cw9pnEylw4M3voZcmH7JkRYD7Zdhe3H1eiPMZwJ92ted1dejQuEDb4YbYLnaF9vSkepcDeYBgl1a50TSwTO9eC3eEnHKV44UcrnJDLw7B3Ve7PG6rTvWpVq285Gb+6QdEdTZo30c3hTnUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998610; c=relaxed/simple;
	bh=EKX1YD4uIfCT4/gD8PVpTKfI4gS62ipKA98Eu2o1QQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqyiFYGaU0kwS9t6G1zEmdpqzHuMGGN6rPihwmnder7LQ4JHAKosHvEUhpgl08Zp1aTwx5qQsJ6nECbhzpFMh3HcX4QgAcWMB6TWkrqQyjA7U9T9UTGuBMRubj20chqRWnmRys9g9vwz2VbEQLI2e7+WaoWKX9b/gxfYgQT2U3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wzR+B/ey; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4CEvNcIB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Big9oNgJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pmel4JnP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wzR+B/ey";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4CEvNcIB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Big9oNgJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pmel4JnP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 52F141F7FC;
	Mon, 21 Sep 2026 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789998602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZtLm53IUi/1m5pz1oVSVhLTNUB+FHDnKY+yq6LJ+jw=;
	b=wzR+B/eyoMlXOt+h98DfGlNkWDGAe1zaRxV9kcz4mXqB47rR7muH3qr00nxHXmlXaLo/bh
	MrJUGLJx2HOJmEO5SdUXQIXEE4/QOhgy+RE2gr6ae2avtCPsD1nFeyP6d9P0QGgkBCnPgE
	BVg3g9sTcR9rWRLyje8aWanQ0Ob0b44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789998602;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZtLm53IUi/1m5pz1oVSVhLTNUB+FHDnKY+yq6LJ+jw=;
	b=4CEvNcIBoElL9BSZ4vaiwwO1elvbcrORHKE2UZ918R0dbelLjzsTomk3CCvA+yhFEOr/Q6
	HsuqTZDEOFQdGWBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789998598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZtLm53IUi/1m5pz1oVSVhLTNUB+FHDnKY+yq6LJ+jw=;
	b=Big9oNgJ182TctBerFOzSFaTXh4in5GT/qpul/k+e72OEt2KPMYjYsdEmPlrISZdDu4P/a
	My3BSPUx1y23IHPBbewbm/ZgTvjLAmhHSC1VKXdVG1WDWzFnWIsz9SIqMJLcNAteFCnIm3
	joe1g0lkQrCo2uujzBNpFw+ntXysfug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789998598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZtLm53IUi/1m5pz1oVSVhLTNUB+FHDnKY+yq6LJ+jw=;
	b=Pmel4JnPeXiH5JU1k3XexMG4Q9wmdqJuFeweYZndV1K3Afj/fksVqHPQ+BTTlfL5a1n4Jz
	sSas7hmw1RWL5DCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E02851368D;
	Mon, 21 Sep 2026 13:49:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHJvKAU2sWrqFwAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 13:49:57 +0000
Message-ID: <0602191a-81ce-4f8a-90d0-b47ba2bc36ac@suse.de>
Date: Mon, 21 Sep 2026 15:49:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: auth: validate DHCHAP secret before stopping
 authentication
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260917080424.3544-1-sreekuttan2156239@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260917080424.3544-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,kernel.dk,lst.de,grimberg.me];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO

On 9/17/26 10:04 AM, Sreeraj S Kurup wrote:
> The driver currently calls nvme_auth_stop() before checking if the new
> secret key is valid. If a bad key is passed through sysfs, the key
> parser fails and exits early.
> 
> Since nvme_auth_stop() was already called, the current authentication
> session gets stopped. However, because the parser failed, the work
> thread is never restarted. This leaves the NVMe controller stuck in a
> stopped state until someone writes a valid key.
> 
Are you sure?
All what 'nvme_auth_stop()' does is stopping a currently running
authentication. And if someone writes an invalid key it certainly
was his intention to _start_ authentication.
I find it kinda weird to allow an pre-existing authentication to
run while the admin indicates that he wants to start a new one.
So not really sure if this fixes anything.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
