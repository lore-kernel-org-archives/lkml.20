Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD183749E1;
	Mon, 28 Sep 2026 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610275; cv=none; b=LQT3ybQ3MrwNuqAAuR0CXQPgMfiL7pyg+UbAbS68rgYfU+16FTW6MkkfqzagY6mQJywE51qI7EFzYXop1I94zYNf9bJkkBSGx69yj36L6PazXaSKoA+pCHS9fiK8ByR0/6sz5rhcYvfzK7AMJbFAA+N5OoFCiTGBYgpX+U2zlKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610275; c=relaxed/simple;
	bh=oYWLIsPpqRNEKyCnKZmjGH5wmdT2PKiWTIaG8ec8SKs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ER3uuB0/MUEZvV12l2ubhRLkXCygNXkAIodC2OYrC9WJiG0XKpjiK/uCZN2WzGBbA1C8mhAGofr8wtrrbs7QHSp9LtW+RIusk9D1qogoKfX+ACts98NJR68OPkGx8hRBo0Ns1pijT9+TSdUJgKNRoiHM+kn8KR2VGXykTFm/j2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r0WDKSQo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=elMEMkmW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tqXvzdiw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d70GCo3P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r0WDKSQo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="elMEMkmW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tqXvzdiw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d70GCo3P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC40A1F8AA;
	Mon, 28 Sep 2026 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790610268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N+UMqJ91GA2KmTLJhEVSIC0BWDdfIpZX/6WQAsX4jHE=;
	b=r0WDKSQocXNG+NqIw+zvGp2sFHXGeo20E1DSCbASxeC8VpnKZ5UTYEajBZ/6J3+/zobmBP
	3VVhZ/qbUjmQA24Me/06VjRNAN7SSTKFaAV47Fw7GBH4UWKUgEFeSJ6kqzF0R8JDdq4ClK
	Ju/Ak6+rVmVD9F0OFD8zcg9XMZcyrug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790610268;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N+UMqJ91GA2KmTLJhEVSIC0BWDdfIpZX/6WQAsX4jHE=;
	b=elMEMkmWTnFEkqQSU9Z+t2+HyJAwEjMl5i1igxQj6P/95sZk1maTzwoQn0Mw7MvjyadwqW
	KKVU3nDr7Y8yMkDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tqXvzdiw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d70GCo3P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790610263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N+UMqJ91GA2KmTLJhEVSIC0BWDdfIpZX/6WQAsX4jHE=;
	b=tqXvzdiwXN1nPQebdFy97n5RvsGwYhriYREA6sebhSxaTAs/VQZFDynzI/1dpYqswpk1Ky
	R1fP4kl9159vJmMjQKfuxuIzrP4CRIq58bkvnJAIWeh10X0e6htx1yQO64jahmmhp0dn9d
	+epL2V6xnpIfJH6Qpk2RcrcwcBTvST8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790610263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N+UMqJ91GA2KmTLJhEVSIC0BWDdfIpZX/6WQAsX4jHE=;
	b=d70GCo3Pm4Bs0N92EpPtLzYXvG1SZZF0AGTsIzmlaIJ7tR881NxyiNoqhBkuLxWD4lG2bM
	PuuBJ04VX13/ndBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A91C133F3;
	Mon, 28 Sep 2026 15:44:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j3BrE1eLumo+TQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 15:44:23 +0000
Date: Mon, 28 Sep 2026 17:44:22 +0200
Message-ID: <87a4p14bzd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Faaris Ansari <faaris.ansari@gmail.com>
Cc: tiwai@suse.de,
	adventureFAN@gmx.de,
	corbet@lwn.net,
	i@rong.moe,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	tiwai@suse.com
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Demote the severity of sticky GET_CUR
In-Reply-To: <191af638-f19f-423c-8306-d96ea2b3dcad@gmail.com>
References: <87h5klw6kp.wl-tiwai@suse.de>
	<191af638-f19f-423c-8306-d96ea2b3dcad@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EC40A1F8AA
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[suse.de,gmx.de,lwn.net,rong.moe,vger.kernel.org,perex.cz,infradead.org,linuxfoundation.org,suse.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Fri, 25 Sep 2026 20:33:17 +0200,
Faaris Ansari wrote:
> 
> Hi there,
> 
> I am continuing to have a bug across the latest 7.2 kernels, as well
> as 6.18 and 6.12 LTS branches concerning hardware volume control on my
> Audient EVO4, that I think is related to this issue - would appreciate
> some guidance if not.

Could you verify the behavior on the latest 7.3-rc?
Once after confirming that the issue is addressed, we may consider
backporting to the older kernels.


thanks,

Takashi
