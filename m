Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579114;
	b=Oip+HNPePr0qk3y+rkUzQPn6ps+d4DOuYG48ax6j3G973Gd4eT2ouQr1PPyKu/2VC+lo
	 ErqGdyoAsG4SMxx//gEmdtlHcauuIy1caDdmcegWw5N2sUwW2qtfWrnPrVUTivjwbaqLL
	 f9I3A4+6h0D5KXAPDhvpeNgLXLmi8xgc3Cfvsl6Br2FybdTSjNlAS8C2E28s6ATARWXyj
	 RBV3kDldBMvVRfcE3HgzDOjF+a/aWWo7L7WC/I94itP1mvKKOSxleU5/TtclD5jvChjSm
	 LbTLzyS86SUj2rlTfhssYQ+9veWzSnLVhEYeYXWtHJDGdbvCAtMIYQr/tcquYi0iMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579114;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=JPgQ/gEOdHXUR4K7GIomw9SPXLVm8bA72T/an/wfs0g=;
	b=luxuOUg6oiHOePdEqbk88bbWKBBPQCPf7CG6wrb/QQw+6GeqQOIcCCHVzuan5ftULmon
	 X8Q4WRqwI7gLChF9qLXXXj1yCISsXYiV8pEE/1rluLaFVxEPUvi+J4S0fU722KwzqU3og
	 SrUJVQ0yTTpFU1VHHCn4LuiHbh/qFshboq6d6iWqDegedZPdBtF84iw2vwAN584ZeV32l
	 JSbFTH2QDbFTaP+957OACbVKZME5mrUQtgM4ZfOSxXaa/ABmksMh4DCyPDIe56k9mT6bz
	 EOEIjxQZJn7IHSFk3vq0RrwOO3EFh/jFLPCQVAgoHGMUts1wjQR+sfdrGyiqVoqIqEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DhRyV7Ep;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0I9+61Pp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DhRyV7Ep;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0I9+61Pp;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B2606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3B2606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DhRyV7Ep;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0I9+61Pp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DhRyV7Ep;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0I9+61Pp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D067F1F44F;
	Fri, 13 Nov 2026 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794579111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPgQ/gEOdHXUR4K7GIomw9SPXLVm8bA72T/an/wfs0g=;
	b=DhRyV7EpimlUxFWm6fx4O0wRNzhbGSWd4Qta57FYj8cLdj9Vs1Rn5bdjM2RotrmfTO+cM7
	f9nE5AjrrO69qDkpE9tdyc8AMbZ3SIKEty96Ag6EaIveybHSmm2Mvc23+uIrt3L5k3Jx6u
	NPmeR/refWSUmWwBSd+LA9TkqQ9a2MQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794579111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPgQ/gEOdHXUR4K7GIomw9SPXLVm8bA72T/an/wfs0g=;
	b=0I9+61PpB1PchPsi1xHuD+Otco/Ky1nufMmaINqOMU3w/T0PJLZiB9DdFLdBT+aqbE16Ak
	9w9hgdiYjbzUPKAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794579111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPgQ/gEOdHXUR4K7GIomw9SPXLVm8bA72T/an/wfs0g=;
	b=DhRyV7EpimlUxFWm6fx4O0wRNzhbGSWd4Qta57FYj8cLdj9Vs1Rn5bdjM2RotrmfTO+cM7
	f9nE5AjrrO69qDkpE9tdyc8AMbZ3SIKEty96Ag6EaIveybHSmm2Mvc23+uIrt3L5k3Jx6u
	NPmeR/refWSUmWwBSd+LA9TkqQ9a2MQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794579111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPgQ/gEOdHXUR4K7GIomw9SPXLVm8bA72T/an/wfs0g=;
	b=0I9+61PpB1PchPsi1xHuD+Otco/Ky1nufMmaINqOMU3w/T0PJLZiB9DdFLdBT+aqbE16Ak
	9w9hgdiYjbzUPKAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D8BD1344A;
	Fri, 13 Nov 2026 14:11:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qqLcHaca92qGaAAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 13 Nov 2026 14:11:51 +0000
Message-ID: <adf9ad3b-fdc9-42c6-8b70-7e4e80ba6441@suse.de>
Date: Fri, 13 Nov 2026 15:11:51 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] nvme-multipath: fail queued I/O when
 delayed_removal_secs is cleared
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Nilay Shroff <nilay@linux.ibm.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev>
 <20261111-bug-nvme-mpath-set-live-srcu-v2-1-fc772914d293@linux.dev>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261111-bug-nvme-mpath-set-live-srcu-v2-1-fc772914d293@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

On 11/11/26 2:10 PM, Qiliang Yuan wrote:
> With delayed_removal_secs set, bios submitted after the last path goes
> away are queued on head->requeue_list, in case a path comes back before
> the delayed removal of the head.
> 
> Writing 0 to delayed_removal_secs clears NVME_NSHEAD_QUEUE_IF_NO_PATH
> but doesn't kick the requeue work, so the bios already queued stay
> there until the removal work runs, up to the old delay later, instead
> of failing right away.
> 
> Kick the requeue work when the attribute is cleared, as
> fail_on_ctrl_loss_store() does when it is set, so that the queued bios
> are resubmitted and fail.
> 
> With delayed_removal_secs at 30 and no path left, a direct read is
> queued and delayed_removal_secs cleared two seconds later. The read
> then fails after (mean of two runs, min-max in parentheses):
> 
>    before (ms)            after (ms)   change
>    26234 (26209-26258)    3.5 (3-4)    -99.99%
> 
> Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>   drivers/nvme/host/multipath.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index ae8059366b57d..a92a05b1f925a 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -1249,6 +1249,10 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
>   	 */
>   	synchronize_srcu(&head->srcu);
>   
> +	/* Fail the I/O queued while waiting for a path to come back */
> +	if (!sec)
> +		kblockd_schedule_work(&head->requeue_work);
> +
>   	return count;
>   }
>   
> 

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
