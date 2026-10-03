Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA49635AC3B;
	Sat,  3 Oct 2026 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018957; cv=none; b=i+F+o7D0dYU1iuvEoT8grsfIM0rAl1dXltIe0FWFTKdKj/hEw2sq8Qy0yaoq6U1imPfDPDyi/f1lq8YLbcfqHPlq/ugu8I3YusiK9psixUA3EgCTw+XeKYdLXG82WPAuWbvJb/86K107Qom0bBuwkBX0lDnpsovCK/8mCTnxerc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018957; c=relaxed/simple;
	bh=CnoeupIy68H7jKHUDANBYnE/s3sNUkEDj2ifkLis788=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NrLyqZm5LqagQNLkeifr0S3jlom6iHv+q2yk5UgrJ5erJ/c7Q1g7OAzSCdU2CApTK7ZNh3vh7kXy2zrV8e0oxcWKfd1XtNTyQWGCGK/p/tyjVNF/Xua3DQwRSKx5ae3MsgkFUEBCRmu4Q9TcFvSaUF/IKlYAaPYMFLJSr7JOLvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VwX8EQ5T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hb3miPzS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s2AFsxGX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w/64bfQu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VwX8EQ5T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hb3miPzS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s2AFsxGX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w/64bfQu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD7C91FECE;
	Sat,  3 Oct 2026 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gFLCpurLLtyjX13vW1bx1QmkkJEK517zWagV5t4gg5s=;
	b=VwX8EQ5T/56zVpBjHSp1vdd5t2qEMGHR21lCc+9Wvkxz3FwLS2AW02QwqL/Tv3SFkVQyqt
	WkGXUYrmDQl0OdVbz1rUvXWsZUHplOXveNW3hR6jw6KIN1hjm0db8kn1r8TEPxmeQh9+wM
	egMQKwzHPBrRiGNJvG635Eg1hYJmGt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gFLCpurLLtyjX13vW1bx1QmkkJEK517zWagV5t4gg5s=;
	b=hb3miPzSTXv7/IBIOrEljhsMbDU1zz1uVPju+T/BvjXbsXfbQJ0nY6Exf0u555jXee0Z2R
	HmDut1/un9qEfADQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s2AFsxGX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="w/64bfQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gFLCpurLLtyjX13vW1bx1QmkkJEK517zWagV5t4gg5s=;
	b=s2AFsxGXNe30KZ/7kfSQ1z8N7qbiMumoWqQNT1Vvbon2W18YYDHLpxF2/7/RTusLl3SpzV
	TbAMMaEBdljSkUJABXcVlessevjJXgaYwDxd7e8Sml9/cNt4rR0H3m+8nL99E9DTqNA19S
	+M1H3L+CP4Uo2tTIv227x34pFRzAiS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gFLCpurLLtyjX13vW1bx1QmkkJEK517zWagV5t4gg5s=;
	b=w/64bfQu57n6asEwg6VgxFG2EQ3IhQgxJRyQnHAGX0Bk1onORWVw4V2v250aOyEYaFvo1m
	h6+HYFjrv9/u4JAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C8DA13712;
	Sat,  3 Oct 2026 09:15:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8nVODb/HwGr0IwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:15:43 +0000
Date: Sat, 03 Oct 2026 11:15:42 +0200
Message-ID: <87jynzxhz5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA: ctxfi: Fix memory leakage when clearing DAO input mappers
In-Reply-To: <20261001144501.3050667-2-me@harin.net>
References: <20261001144501.3050667-1-me@harin.net>
	<20261001144501.3050667-2-me@harin.net>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: AD7C91FECE
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 01 Oct 2026 16:45:01 +0200,
Harin Lee wrote:
> 
> Commit e576e7843c0d ("ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions")
> centralized the DAO input mapper clearing logic in
> dao_clear_input(), but omitted the kfree() calls.
> 
> It removes the mapper entries from the list and sets their pointers
> to NULL without freeing the allocated array. This leaks memory each
> time dao_clear_input() is called.
> 
> Store the base pointer of the allocation before clearing the mapper
> entries and free the array after removing entries from the list.
> 
> Fixes: e576e7843c0d ("ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Harin Lee <me@harin.net>

Applied now.  Thanks.


Takashi
