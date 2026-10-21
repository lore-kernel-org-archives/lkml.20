Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572187;
	b=iGdL1oApWSEzRQjdtgrUkiFowM9xXZr5TstUZyX9yOGvvG65DqhcqC4zQvqouQXB3NUP
	 7+5y1JJgbVYJSH3TQJEDA6veYX1ZjZ66bdEJgK6BVcwu3SINK3zFjtx1ZV3eNrCB42cQP
	 rdXYgOMvXjRIVkrmrYEJTXMRLDDxwY4lRipq8nZUu2DkygNmbghGZc5s0tpwgkAgzu9NI
	 RO7cmc5TWlAnc8C5WfYWEe/0FFcvUK9F0OWWdzAk8HeDYO1h6b4ZA/9OYv87f7XPo2Yl0
	 8QvSUc1x9ewSHP9f0dS4s/FeQlI7UEs/npy6lhr0ocOK6rfX0Fy6k4fxKPloQxXAfZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572187;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=4qFeKdnPjK54hOTHS3Q2krmHxlATrpezgT+ZpzhYg/w=;
	b=Kn7Yr7U0+p6Rp6mdlgqjbpfBTr6UKaQ71Tam4HK6us7ongLtewivIKAeDrD68FDTI2ch
	 lc3JxKhm+uhttcWuqwy9NoDTFdFH+gZoEjUl1eiHZSBGdJm0xycDs2rDLbIDgsEmn5wOu
	 wzuv8FCP9nXz9tk2mv9JOatJsGtap7uVSA2hAvPP21KJvE8qeJzgWBSoy0D3JGb1Hui7F
	 VTek+Tj9wmJ9JtJndT9VlaWoQdBkYePJTaUJutNFW8JfPECZQHDpD0pYyC86XrqXvvKbC
	 YUiupGT69x2OHopEuAKBD4DN+SmO267NSuZ9NnfjiNo6srdOC6bjCe2FWCVWI0jWT6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4BYOTda;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B+XaYPx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4BYOTda;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B+XaYPx;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DF606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4BYOTda;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B+XaYPx;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4BYOTda;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B+XaYPx
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D23821E24;
	Wed, 21 Oct 2026 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792572184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qFeKdnPjK54hOTHS3Q2krmHxlATrpezgT+ZpzhYg/w=;
	b=k4BYOTdacwcuKBLBjwFjYNsNaywQu/dSt26qZLkzheRf7cKchVsw3/mQ+PK4M11jexxiFp
	KS2z/SxblGXK6GaCv0WQFB7Fx/qgJ2/ZenKy78Xfu7+3TuYq/JK1L9f4Avp3YHvchIWUrN
	dehG6MabyvC2xe20S9vsEu0ibZmdGLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792572184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qFeKdnPjK54hOTHS3Q2krmHxlATrpezgT+ZpzhYg/w=;
	b=2B+XaYPxvOo/xYEF3oBgJCQsY7neeBD4dZ+nGWpWLDAqaYtEU0nTjIzUXrUS53g4qNrN4C
	EVa2YH6KPoFwHQDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792572184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qFeKdnPjK54hOTHS3Q2krmHxlATrpezgT+ZpzhYg/w=;
	b=k4BYOTdacwcuKBLBjwFjYNsNaywQu/dSt26qZLkzheRf7cKchVsw3/mQ+PK4M11jexxiFp
	KS2z/SxblGXK6GaCv0WQFB7Fx/qgJ2/ZenKy78Xfu7+3TuYq/JK1L9f4Avp3YHvchIWUrN
	dehG6MabyvC2xe20S9vsEu0ibZmdGLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792572184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qFeKdnPjK54hOTHS3Q2krmHxlATrpezgT+ZpzhYg/w=;
	b=2B+XaYPxvOo/xYEF3oBgJCQsY7neeBD4dZ+nGWpWLDAqaYtEU0nTjIzUXrUS53g4qNrN4C
	EVa2YH6KPoFwHQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 447A113518;
	Wed, 21 Oct 2026 08:43:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cw3CBxh72GpCYwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 21 Oct 2026 08:43:04 +0000
Date: Wed, 21 Oct 2026 10:43:03 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/18] nvme: Implement cross-controller reset
 completion
Message-ID: <02c2a904-2264-46b8-b49f-6f7109913da6@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-10-mkhalfella@purestorage.com>
 <207f5a00-7fee-4ea5-b541-38424d4766bd@flourine.local>
 <20261021010438.GR2931-mkhalfella@purestorage.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021010438.GR2931-mkhalfella@purestorage.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, Oct 20, 2026 at 06:04:38PM -0700, Mohamed Khalfella wrote:
> > What happens to the waiters on sctrl->ccr_list when the source
> > controller enters error recovery while a CCR is pending?
> 
> You already answered it below :)

I tried to figure it out, but I'm still not sure if I really understand
all the conditions. So bear with me.

> > As far as I can tell, ccr_work itself is fine. The reset path cancels
> > it via nvme_stop_ctrl(), and in the error recovery path the Get Log
> > Page just fails once the admin queue is torn down. But the target drops
> > all CCRs issued by the old association when it frees the controller,
> > so the CCR completed AEN for them will never arrive. Nothing on the
> > host side walks ccr_list when the controller leaves LIVE, so
> > nvme_issue_wait_ccr() sleeps until min(kato, deadline - now) runs out
> > before nvme_fence_ctrl() tries the next source controller. In the
> > worst case that eats the whole fencing window.
> 
> If the remaining of the fencing window (deadline - now) is less than
> kato then I am fine with this scenario wasting this time anyway. If we
> hit the deadline then we consider fencing done anyway. If it consumes
> kato from the deadline then we retry another path.

Okay, this might be something worth documenting? It seems like a case we
will get bug reports in the future.

> > Would it make sense to fail all pending entries (set ccrs to a failure
> > status and complete them under ctrl->lock) when the source controller
> > goes into error recovery, so the fencing code can move on to another
> > path right away?
> 
> Failing pending CCR entries that we know we are not going to complete
> will help in this case. The question is where to do that. A LIVE
> controller might hit an error and transition to FENCING, or manually 
> reset and move to RESETTING, or deleted and go to DELETING. Do we need
> to consider all these places to fail the pending CCRs?

I'd say yes. Anyway, I don't think this needs to be addressed right away
if the current code is functional correct and we are just not as fast as
possible. 

> You might have also noticed that nvme_issue_wait_ccr() calling
> __nvme_submit_sync_cmd() might consume the entire fencing window if the
> CCR command gets held because the source controller hits an error. This
> is another area be optimized. I am inclined to leave the code as it is
> today. What is being described here is an optimization that can come
> later on.

Yes, I was actually about to ask about __nvme_submit_sync_cmd in this
path next. Since my questions are about optimization, I don't think we
should make the current version any more complex than it already is. We
can handle optimization later, but please document those cases in the
meantime.
