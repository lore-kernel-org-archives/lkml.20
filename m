Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278C3C13F5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990126; cv=none; b=jjZra78eMCTmQv3w1UL7zTEwI5E1ZYcftZyxT4PfFdBuhj2EbtwA4bGIZWImVYAatUh6D9U5n9gtROaLeTFbOPB/V0LVB/8z5ASjrD019r9GRGEdy4bDmmfwZj39bZj9HUKV4+qfauuImCnUfoniWjUFUrc+tl9ArdG7zwa2lSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990126; c=relaxed/simple;
	bh=6x7bWgUbrJzWW4PWTaEsDx0AP8ht7m08t2wGoigcZck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIYMUhcozM1sLE908dj/koD/ojVoLw+vjYXUXV5iWlqHYoanIdeiBm+3YIH1eMKcw0ENqWMr+LPAinh8orO97Qm3F0HIakHGb9VBkLMQBj4Jtd3SVm9j7MxbEQrT9v0EMdSxeRvYvYb02ZmAgMe+sn8x3ranXWwna5TSXrEFFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VjN0N5Zl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0VVPFEi/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yv4M9aiR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q9sV4Syu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VjN0N5Zl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0VVPFEi/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yv4M9aiR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q9sV4Syu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E27AC1FAA3;
	Mon, 21 Sep 2026 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789990119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/NfxikMW0an5SBYmu5hTO0LNfhoBM9wQ5NRZpY/GkJg=;
	b=VjN0N5Zl79FtE2/GBE7l7l59/Sb8ANygoLJz9KzcTbaCQoWRprCFMtqbJF2FZqTCMaEQKt
	bH2ckt+mIE+/V8wazxX1AszFkC924RBp6wAXBAVZk99Sxi7ZMPMNDZawID1fewiWKHMpwH
	ewo3MCKC1a1761qHfSMsciF/Ak2owjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789990119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/NfxikMW0an5SBYmu5hTO0LNfhoBM9wQ5NRZpY/GkJg=;
	b=0VVPFEi/huCWgBwTVrA4LBpyCP3bMfUaCzpLE90Q1hgu/gO4iiAvGluVzozNsqbo6JPZ/B
	pQpzzhY7PUaMBzAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789990114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/NfxikMW0an5SBYmu5hTO0LNfhoBM9wQ5NRZpY/GkJg=;
	b=Yv4M9aiRuv8s2thiL4B+pzXQ7/kOW8Wjob0pG/vBHjgPXOWSZ8xbJbLnDRlsYhiexiEtPr
	ZeWU5fE8b4NqcH4669aasiH2/G+pga6E4TFYMifC8IwjdofuW8+14KTXGa0xSSizRdbdwO
	NiiLrJV2SUonBuUCSOr7lhtCtYk0yrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789990114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/NfxikMW0an5SBYmu5hTO0LNfhoBM9wQ5NRZpY/GkJg=;
	b=q9sV4Syuc7Wxfkin30dX96s50DF4uOIkMWFpIK4WE9d3ndBN1rjWglS1I3tvXCzPuI7g1O
	7g6j71cO/Ixi6WDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A249A1368D;
	Mon, 21 Sep 2026 11:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QCrYHuIUsWp0fAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 21 Sep 2026 11:28:34 +0000
Date: Mon, 21 Sep 2026 13:28:33 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Justin Tee <justin.tee@broadcom.com>, 
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, Paul Ely <paul.ely@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Daniel Wagner <wagi@kernel.org>, Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet-fcloop: fail LS request synchronously when remote
 port is gone
Message-ID: <2ad8b13c-b548-4574-9c61-5224833e1bad@flourine.local>
References: <20260920163804.67858-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920163804.67858-1-ngocthang2710.1999@gmail.com>
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[77955102efac681ec73b];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,lst.de,grimberg.me,nvidia.com,kernel.org,suse.de,lists.infradead.org,vger.kernel.org,syzkaller.appspotmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flourine.local:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Sun, Sep 20, 2026 at 11:38:04PM +0700, Nguyen Ngoc Thang wrote:
> fcloop_t2h_ls_req() handles a missing remoteport by queueing the request
> on tport->ls_list and completing it with -ECONNREFUSED from a work item.
> 
> nvmet_fc_delete_assoc_work() sends the Disconnect Association LS this
> way. When it runs during nvmet_fc_unregister_targetport(), the work is
> queued after flush_workqueue() has started, so it is not waited for.
> nvmet_fc_free_pending_reqs() then frees the still-pending lsop and the
> late work item calls lsreq->done() on freed memory:
> 
>   BUG: KASAN: slab-use-after-free in fcloop_rport_lsrqst_work+0x242/0x2e0
>   Workqueue: nvmet-wq fcloop_tport_lsrqst_work
>   Allocated by nvmet_fc_xmt_disconnect_assoc
>   Freed by nvmet_fc_free_pending_reqs
>            nvmet_fc_unregister_targetport
>            fcloop_delete_target_port
> 
> Return -ECONNREFUSED directly instead. __nvmet_fc_send_ls_req() unwinds
> and nvmet_fc_xmt_disconnect_assoc() frees the lsop, so no completion is
> left outstanding.

IIRC this has been added to free memory in a different execution
scenario. So I don't think you can just skip it.

And this is also a change in the behavior between HBA's behaviour in the
loopback behavior.
