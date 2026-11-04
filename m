Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813468;
	b=wUCOMzKogrXYrpeA1w7zTjett7BCozLfs8bJ4GZM+Iyo3kk2KejEElqZtAVwOFP7+AQ5
	 vxDIayO4krEVUuJ+rRJyCSzV45E8zBTe//ZmJR4koxviqpFRmy47aQC9dIkNvLmZm1pXC
	 ZYznL7Vzj5ad7ScRiYMUYTn+qfg0xtoNMVL5na2B/2W4QPE201mYEO3g3QnvELjrnNKB9
	 Zw7Se28jo9eUMopiXQIBH/PivovH3opnIEwpjxP+BB8hQKEQ4mXiujAlCHMflPNLGJRKO
	 pERvoB5C8NRBshknNp6cZZr7ALrq/cKFD8gYCrhAVeUyxbGfB6fKYKZU+auKDmreZCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813468;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=v2WXUV9/HYapwCowiLlDMse6dYBPfMwTbLThnaTni3I=;
	b=qswYPhh4svVpwEsa6AAzf+Zw06tOHFfiAn/XSOT9C/kztEMurRpraEEcxgHq3LskRp/s
	 tNTbiEOPtFVhMtI96QlqlI1w1AojF7GNDUt9Ekop7F5EZtJhONJb1R41IHPhKik7pw2Vz
	 VMyL8ae5PDArqpkX4oirpYA2M/n1NcAku0N9SQmh6f9c2Kc3U4HoU1rfiRASFqatpmfgL
	 LsGUovckW7ZhsjYCJME/896WF0Ndl2pap40qGYRXZMitEclXYJ8B3ATB6xftd8Qcs25H4
	 W3NP2MwRKbyp0/kH9nOvXMt2sWxVz/xWBdUlXxnetWciH17CJ8fML0QRq4gBjNvj1ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mxebXkYH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SrcqebdX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mxebXkYH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SrcqebdX;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C08660A2635
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C08660A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mxebXkYH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SrcqebdX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mxebXkYH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SrcqebdX
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D152D21BA2;
	Wed,  4 Nov 2026 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793813465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2WXUV9/HYapwCowiLlDMse6dYBPfMwTbLThnaTni3I=;
	b=mxebXkYHelk2Fnbb9fBKHJUjZyZQ4hf/30oGgFQImGDu5K33xGP3AG+7+IWK12HRRauFv7
	Axe/wtl43RSlQBqeSRPx/l2ADa7pXY2Onhl/GWeAZzkZGXjdTZwuBd66z/qleewB8Gv5f/
	KEzcRZ3ckNj8WZ+vh5st+QCIC5EBid4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793813465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2WXUV9/HYapwCowiLlDMse6dYBPfMwTbLThnaTni3I=;
	b=SrcqebdXRvqiq2YoQmS4ch14G+Qi+LLq3toCEw9YfPUqvexcyYPsSZ5ZUCPw/TMBg2ppcc
	CSkDGBLsjQ7ZCNDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793813465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2WXUV9/HYapwCowiLlDMse6dYBPfMwTbLThnaTni3I=;
	b=mxebXkYHelk2Fnbb9fBKHJUjZyZQ4hf/30oGgFQImGDu5K33xGP3AG+7+IWK12HRRauFv7
	Axe/wtl43RSlQBqeSRPx/l2ADa7pXY2Onhl/GWeAZzkZGXjdTZwuBd66z/qleewB8Gv5f/
	KEzcRZ3ckNj8WZ+vh5st+QCIC5EBid4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793813465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2WXUV9/HYapwCowiLlDMse6dYBPfMwTbLThnaTni3I=;
	b=SrcqebdXRvqiq2YoQmS4ch14G+Qi+LLq3toCEw9YfPUqvexcyYPsSZ5ZUCPw/TMBg2ppcc
	CSkDGBLsjQ7ZCNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F6DA134A5;
	Wed,  4 Nov 2026 17:31:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S7GqHtlr62qZLQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 04 Nov 2026 17:31:05 +0000
Date: Wed, 4 Nov 2026 18:30:56 +0100
From: Daniel Wagner <dwagner@suse.de>
To: Saravanan D <saravanand@crusoe.ai>
Cc: linux-nvme@lists.infradead.org, kbusch@kernel.org, hch@lst.de, 
	sagi@grimberg.me, axboe@kernel.dk, nilay@linux.ibm.com, sgogte@purestorage.com, 
	hare@kernel.org, hare@suse.de, linux-kernel@vger.kernel.org, iyamahata@crusoe.ai, 
	kiyer@crusoe.ai, ganbalagane@crusoe.ai, sjpark@crusoe.ai, bchen@crusoe.ai
Subject: Re: [PATCH v7 1/2] nvme: add per-queue sysfs directories
Message-ID: <23f41537-23bb-44e8-84e3-7069138d151d@flourine.local>
References: <cover.1793800758.git.saravanand@crusoe.ai>
 <656dac7329c8452efe786b0c76a3b8c0bbf53159.1793800758.git.saravanand@crusoe.ai>
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
In-Reply-To: <656dac7329c8452efe786b0c76a3b8c0bbf53159.1793800758.git.saravanand@crusoe.ai>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30

On Wed, Nov 04, 2026 at 06:06:29AM -0800, Saravanan D wrote:
> +struct nvme_queue_info *
> +nvme_add_queue_info(struct nvme_ctrl *ctrl, unsigned int qid, void *data)
> +{
> +	struct nvme_queue_info *qinfo;
> +	int ret;
> +
> +	if (WARN_ON_ONCE(!ctrl->queues_kobj))
> +		return ERR_PTR(-EINVAL);
> +
> +	qinfo = kzalloc_obj(*qinfo);
> +	if (!qinfo)
> +		return ERR_PTR(-ENOMEM);
> +	qinfo->data = data;
> +
> +	ret = kobject_init_and_add(&qinfo->kobj, &nvme_queue_info_ktype,
> +				   ctrl->queues_kobj, "%u", qid);
> +	if (ret)
> +		goto out_put;
> +
> +	ret = sysfs_create_groups(&qinfo->kobj, ctrl->ops->queue_attr_groups);
> +	if (ret)
> +		goto out_put;

Don't you have to call kobject_del(&qinfo->kobj); here?

