Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADA435C681;
	Sun, 11 Oct 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708556; cv=none; b=ky48TOYrS/QPV8LE+oSHOsyZdVw8DtQiDuaysXg2QV1MQ4Bgm3kftqh9W77rfUuZzbQKlFNF1x59l9IyePn6kzQT5gqx8JGiShBB+XmKVa4vYMLi7W20dE+XTEzqFUwWcg8PpxWdRZCMMA0JMXKqARp5+Z+nmZC9Wf8ZSRKFHbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708556; c=relaxed/simple;
	bh=QdeshDYc/0f2xWT2vqgVz5NA2TAmIq1oWrpuYnrkThY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrKWIHMK15jGlqovQCZDvSiHtXg7uTzodkePdGk8bxhrLNcu2V+L2UHsZxESlPX5tfqb/DSSsgEmEUtG5mjvYmT0NZtycNlnzz2y4ypJMSTQmBff2aA3J9ekbYtErIqTCPDUdnMi5QladpG42ugWGf+nJZMlyn1zEe/wBDj+BWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fM8y/q0/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XnYvO5Nk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fM8y/q0/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XnYvO5Nk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fM8y/q0/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XnYvO5Nk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fM8y/q0/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XnYvO5Nk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CFF21F750;
	Sun, 11 Oct 2026 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791708553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnjO99Fom7cQPIwFGG6E7G1b7cF8+nJ7G5dUb/6U4g8=;
	b=fM8y/q0/3q0nMsOcPEtz28o7vJ/fYwStC2Dvgnz7XzYgGPb5NRKzWZdvd9Bh1qEy+Pbcx6
	9cti05vMxjuuGkNxQHS+hO9nh04fjXOggqAAbLFIElfnNDE7ZUf8U+1EIvQGzQ7/cDt1IA
	2aoEVoZhHxVaZLVwdaXZ+8EVO343ebo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791708553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnjO99Fom7cQPIwFGG6E7G1b7cF8+nJ7G5dUb/6U4g8=;
	b=XnYvO5Nkqq9M58E2NaARw9Y+IrcltzTOnPqJ0M0ibp3DjemkJR0P3Q3zo1grtnzaDPZe6q
	62iy2490QhI/zFAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791708553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnjO99Fom7cQPIwFGG6E7G1b7cF8+nJ7G5dUb/6U4g8=;
	b=fM8y/q0/3q0nMsOcPEtz28o7vJ/fYwStC2Dvgnz7XzYgGPb5NRKzWZdvd9Bh1qEy+Pbcx6
	9cti05vMxjuuGkNxQHS+hO9nh04fjXOggqAAbLFIElfnNDE7ZUf8U+1EIvQGzQ7/cDt1IA
	2aoEVoZhHxVaZLVwdaXZ+8EVO343ebo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791708553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnjO99Fom7cQPIwFGG6E7G1b7cF8+nJ7G5dUb/6U4g8=;
	b=XnYvO5Nkqq9M58E2NaARw9Y+IrcltzTOnPqJ0M0ibp3DjemkJR0P3Q3zo1grtnzaDPZe6q
	62iy2490QhI/zFAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21BEF13408;
	Sun, 11 Oct 2026 08:49:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hidMOohNy2oUEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 Oct 2026 08:49:13 +0000
Date: Sun, 11 Oct 2026 10:49:12 +0200
Message-ID: <87ld84ipvb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Wait for one RCU grace period when deleting all ports
In-Reply-To: <20261010222543.1470723-1-aliamemis@disroot.org>
References: <20261010222543.1470723-1-aliamemis@disroot.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sun, 11 Oct 2026 00:25:40 +0200,
Ali Ahmet Memiº wrote:
> 
> Since the port list was converted to RCU, snd_seq_delete_all_ports()
> calls synchronize_rcu() once per port under register_mutex. Closing a
> client with 254 ports now takes about 1.6s and every other client
> open or close waits for it.
> 
> Unlink all ports first, wait for a single grace period and then free
> them.
> 
> Fixes: 4c252fbc06d6 ("ALSA: seq: Use RCU for the client port list")
> Signed-off-by: Ali Ahmet Memiº <aliamemis@disroot.org>
> ---
> Tested in QEMU on v7.3 with lockdep and KASAN.  Closing a client
> with 254 ports went from ~1.6s to ~0.02s, and a second client doing
> open/close in a loop no longer stalls.  Closing the client while other
> clients send to and query its ports ran 100 rounds without reports.

Applied now to for-next branch.
Sounds like a good performance improvement.


thanks,

Takashi
