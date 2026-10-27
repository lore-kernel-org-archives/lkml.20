Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082966;
	b=ANXZWNEanPq8eySS7PS4skpix6Lyj1el2RWLJWMz4svWOVDb+SPUb8WXtJsL4bELtAQV
	 LraHJEvJI8Bak/iXQOYDGeg+Q35G06IEsa7T4NqkDgVAzdtP3iTWLSYgPYT+KLzGxDJwn
	 JmQ64ZgkztJFooG8cXw+sdxek2kS4UalmB5448y0BPYU+R2lHlNEV6DfoebhGW1Kul9w8
	 jRhiFD7Ydqw8sgMfVbbjqtekKcc54I3qf8xc5SMTqjbWvbxuTCyiMD6diSWdiGeO/feJg
	 LcbCYzOPI1BqWhCm12yBujt5C7g6FKbWK7aFIVEgieHsHeJ1Yi0gqMFFM1Y1fJ264Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082966;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=SpwP676LEx8vBDWRHmeQhmojTRoDKMCSlgUghYQZpyI=;
	b=x8oLsXCuO6mwpkFCE5azgESm5m37oWBOaIxJfbJMq7SisFxLUGvvY1qogiRim1Pqjmnh
	 SI5HS85dNEdnhIeGMHUwqexwyA6aKAFzq4wBCz6hR1CRA7Y872j4v+O6C+PlDPt7Q0dfa
	 JLZmE5+y3MLP7e5O2aCO+lCuf4pEcpGw4NIsgLx5rPDJ/5wYggybeOWMrd4TCdd5PXIhH
	 8cW1ifU68M9+1bU6BKBQJ2iRVtLheBkorWzoUwWCXF2R4xzENOdsqeYlMFj5z6F73zyNK
	 89xTK+Y4tPKy1G313LAsNij8cat3qbhYFTXSHDnsVQ7/RUXbHMMTPkk7+sJYC3vW6Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GvH3Y9p7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kIk+E9K4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GvH3Y9p7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kIk+E9K4;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5D606A31A;
	Tue, 27 Oct 2026 06:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GvH3Y9p7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kIk+E9K4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GvH3Y9p7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kIk+E9K4
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C39B51F7BE;
	Tue, 27 Oct 2026 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793082963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpwP676LEx8vBDWRHmeQhmojTRoDKMCSlgUghYQZpyI=;
	b=GvH3Y9p7AqzQJM/b5WRLG5xXjo+ehY/fGqe2FDFaBtf6/RtYC/E4jWlXZhSyFVncuGCYAM
	DWrOFWxn2g6nejnYB/TB9QMnWobWOXHmz2nKhNLSxyvsdHpeXaJRQVwKZmoDST/qtTyzKj
	ZayybCj6C/dMsNvXN6NVKDQ3DG+sDic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793082963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpwP676LEx8vBDWRHmeQhmojTRoDKMCSlgUghYQZpyI=;
	b=kIk+E9K4Wn7EmokdPIkoTNQJbgTkN5Ek3YAv0mf3vP9UFHOpscQGfrxVxZUfzomMkn58+d
	iNNNDc6TSiI2AbDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793082963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpwP676LEx8vBDWRHmeQhmojTRoDKMCSlgUghYQZpyI=;
	b=GvH3Y9p7AqzQJM/b5WRLG5xXjo+ehY/fGqe2FDFaBtf6/RtYC/E4jWlXZhSyFVncuGCYAM
	DWrOFWxn2g6nejnYB/TB9QMnWobWOXHmz2nKhNLSxyvsdHpeXaJRQVwKZmoDST/qtTyzKj
	ZayybCj6C/dMsNvXN6NVKDQ3DG+sDic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793082963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpwP676LEx8vBDWRHmeQhmojTRoDKMCSlgUghYQZpyI=;
	b=kIk+E9K4Wn7EmokdPIkoTNQJbgTkN5Ek3YAv0mf3vP9UFHOpscQGfrxVxZUfzomMkn58+d
	iNNNDc6TSiI2AbDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 752641321C;
	Tue, 27 Oct 2026 06:36:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HndiElNG4GpWHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 06:36:03 +0000
Date: Tue, 27 Oct 2026 07:36:03 +0100
Message-ID: <87bj8f4pm4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sinan Turunc <enscrpt@pm.me>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio, ua101: oversized packet copies overrun PCM ring buffers
In-Reply-To: <20261026224036.657-1-enscrpt@pm.me>
References: <20261026001003.1067-1-enscrpt@pm.me>
	<87tsm86fzy.wl-tiwai@suse.de>
	<20261026122855.283-1-enscrpt@pm.me>
	<875wyo60q0.wl-tiwai@suse.de>
	<20261026224036.657-1-enscrpt@pm.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 26 Oct 2026 23:40:54 +0100,
Sinan Turunc wrote:
> 
> Takashi,
> 
> Understood, thanks. I have resent the series as v2 with my real name,
> Sinan Turunc, in From and Signed-off-by. There is no code change.
> 
> v2: https://lore.kernel.org/all/20261026223543.620-1-enscrpt@pm.me/

Thank you for cooperation!


Takashi
