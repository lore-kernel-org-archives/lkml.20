Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703096;
	b=K/8XaswAqf+8eSIaLt/SXKIKCeQu95uPMdHBprZkleI1zGzXhTZwI7h3IE2yq0F7xMfd
	 glhJ1Gfhd3vkqHHIkVG/20eNH2QI69wd734M4DLHXLJpjWd82c2xoCXzWV1Z7lIN/OluN
	 g3Sl1WY8SCenF5AbS6+QWodNHhCDrrMoQg41m3t2UV5u9AqFRD+tiKjW0fbym0+9No5+t
	 cWjcFJMU3vqmH6nGtM98iWx0IgKoS84HQrWOQoNO2GF9uIFUs4Gr17raQ7aoWsH8vXQZ3
	 PuEXmX+WPQMQKYg3hoOpaNPIHMj12vSYaKeVipSsEGgC4337N2Nhtc1qUl+KPatfGDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703096;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=5D7xCUClOOfsmSvAcaEAFG25UX6miDGSw5YNpSrkX2w=;
	b=qFHEhZ+zg4eLdZj0N8zLwmEqFEsMiWj7ZsBAJ4QHF1bSJEGHC5ppGHK0P0DcTHJloy6G
	 vsPeyxJs/91bFjYTEY8GUP2EUtO3F7cjehcjfbm+xZuN4uTsbhsriBZuyVapz8XZbS1ef
	 09o1gwC4I44MEHAkEYwzn5mT7wq2qGrD4KaPg9s3MRE1l2WysquV73WU4uf/iQUMNXqNT
	 f1RU1mhQa+0xjAMuPiCUTfwlGfkz0uR2T7jeFGbVmTZjHjFA2i4hKFnez5VYR0m8G0D96
	 QH34NZJSxbVc3/SAdGlRjykEVSE3I55Na0hdi/rqetap4P3JQhBHSQp1+TTm7mp/Ocw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KHOhduX9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0qaqPdiE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KHOhduX9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0qaqPdiE;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14700606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14700606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KHOhduX9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0qaqPdiE;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KHOhduX9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0qaqPdiE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B04B1FBF1;
	Tue,  3 Nov 2026 10:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793703094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5D7xCUClOOfsmSvAcaEAFG25UX6miDGSw5YNpSrkX2w=;
	b=KHOhduX9mVmQzN3agJyd8Mbs2/ubzjM0FjPNmp6SF42zDc1Nmqo7x1sdssX2CAxGl0MkMp
	dPy3LczGUFBIsb01+d+BHI23wSmJuF4ZpqZmG4A7gNzVTqjP9l9VPu1n4+rUzwNLBJ9HLS
	DDxl6y3blimkFk4PWyrcphq2fm1T7U0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793703094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5D7xCUClOOfsmSvAcaEAFG25UX6miDGSw5YNpSrkX2w=;
	b=0qaqPdiElRcc7UN5iKxmCBVadcHxB+JOikV0LcKKuGLDg+pV404AsFLWDL9nrKNpJFAIls
	hi8VmhyoZoVXQCCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793703094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5D7xCUClOOfsmSvAcaEAFG25UX6miDGSw5YNpSrkX2w=;
	b=KHOhduX9mVmQzN3agJyd8Mbs2/ubzjM0FjPNmp6SF42zDc1Nmqo7x1sdssX2CAxGl0MkMp
	dPy3LczGUFBIsb01+d+BHI23wSmJuF4ZpqZmG4A7gNzVTqjP9l9VPu1n4+rUzwNLBJ9HLS
	DDxl6y3blimkFk4PWyrcphq2fm1T7U0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793703094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5D7xCUClOOfsmSvAcaEAFG25UX6miDGSw5YNpSrkX2w=;
	b=0qaqPdiElRcc7UN5iKxmCBVadcHxB+JOikV0LcKKuGLDg+pV404AsFLWDL9nrKNpJFAIls
	hi8VmhyoZoVXQCCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03E231350A;
	Tue,  3 Nov 2026 10:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iBcdM7W86WopHQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 03 Nov 2026 10:51:33 +0000
Date: Tue, 3 Nov 2026 11:51:28 +0100
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/18] nvme-fc: Hold inflight requests while in
 FENCING state
Message-ID: <80b5302d-1bcb-45d3-b926-0874470ee183@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-16-mkhalfella@purestorage.com>
 <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>
 <20261021212357.GZ2931-mkhalfella@purestorage.com>
 <45d52d19-dbfc-49b9-a445-a8fb9e69abef@flourine.local>
 <20261103011851.GK122209-mkhalfella@purestorage.com>
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
In-Reply-To: <20261103011851.GK122209-mkhalfella@purestorage.com>
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
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
X-Spam-Score: -13.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, Nov 02, 2026 at 05:18:51PM -0800, Mohamed Khalfella wrote:
> -/* Complete the requests held in __nvme_fc_teardown_association() */
> +static bool
> +nvme_fc_cancel_held_request(struct request *req, void *data)
> +{
> +	struct nvme_fc_fcp_op *op = blk_mq_rq_to_pdu(req);
> +	struct nvme_ctrl *ctrl = data;
> +
> +	/*
> +	 * A single cmpxchg decides who completes this request. If the op is
> +	 * HELD, nvme_fc_fcpio_done() is done with it and we cancel it. If it
> +	 * is still COMPLETE, nvme_fc_fcpio_done() has not decided yet: move
> +	 * it to IDLE so its own cmpxchg to HELD fails and it completes the
> +	 * request itself (nvme_fc_complete_rq() sets IDLE anyway). Doing this
> +	 * as read-then-cmpxchg would let the op become HELD in between and
> +	 * leave it with no one to complete it.
> +	 */
> +	if (atomic_cmpxchg(&op->state, FCPOP_STATE_COMPLETE,
> +			   FCPOP_STATE_IDLE) == FCPOP_STATE_HELD)
> +		nvme_cancel_request(req, ctrl);
> +
> +	return true;
> +}
> +
>  static void
> -nvme_fc_flush_held_requests(struct nvme_fc_ctrl *ctrl)
> +nvme_fc_cancel_held_requests(struct nvme_ctrl *ctrl, struct blk_mq_tag_set *set)
>  {
> -	nvme_cancel_tagset(&ctrl->ctrl);
> -	nvme_cancel_admin_tagset(&ctrl->ctrl);
> +	if (set) {

Do we call flush when we don't have a set?

nitpick: use the early return pattern if needed.

> +		blk_mq_tagset_busy_iter(set, nvme_fc_cancel_held_request, ctrl);
> +		blk_mq_tagset_wait_completed_request(set);
> +	}
> +}
> +
> +/* Complete the requests nvme_fc_fcpio_done() held during the fence */
> +static void
> +nvme_fc_flush_held_requests(struct nvme_fc_ctrl *fc_ctrl)
> +{
> +	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
> +
> +	nvme_fc_cancel_held_requests(ctrl, ctrl->tagset);
> +	nvme_fc_cancel_held_requests(ctrl, ctrl->admin_tagset);
>  
>  	/* re-enable the admin_q so anything new can fast fail */
> -	nvme_unquiesce_admin_queue(&ctrl->ctrl);
> +	nvme_unquiesce_admin_queue(ctrl);
>  
>  	/* resume the io queues so that things will fast fail */
> -	nvme_unquiesce_io_queues(&ctrl->ctrl);
> +	nvme_unquiesce_io_queues(ctrl);
>  }
>  
>  /*

Yes, I'd prefer this over the introduction of RCU in this code path.

