Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487889;
	b=i7ig5D3STxgMwbCyeda9hoS0j8IgcHUZy6bWEs1S+ykTHxuGPXNX1C3b46Wf2ekNnj8k
	 +iecDzlHVzdWpCvz+OJSz9BxlQUkZ+MPwS5/d0nxdd2cuMk5VLEks8r4CwAKOYtes/aBr
	 tnLSGlHhCbPW/N7vInd+m8DOP+4j6oepU6JqbJ846+vPVMKkuLcmIFGC+jwrum/f+Lz1G
	 sXC39HzZ9UhG27aJy06EMLDIr5f+n0F65tnqMAkxf/p8T7GQS7UXyGR2Gw2DxOG0XWNse
	 cT8cK4SdpOFvrvY3Qe0ZRapqjHBMm7S/pb2/OJvIHbewcOYNCmTcJpBjDR4TT//0Bbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487889;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Rspamd-Action:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=ysfbbrFI8yivLPYPpI0njpIa6LJjUf9RR89EPWV3woQ=;
	b=AM1OTjAS9dLEvF7ajwngVp6T0QMuLFW2H4N9IEhEIlLyS8wsSdg8UJiMCPu6evXTekyt
	 sL8mxeYcUjgndfP80WbsC9ubZv8LdhWpo6A7pAVlznUiYk0KBHaR2/eRwtzxKLp/QqA62
	 g/aFSRxDgMISZxutyOAJV8vdAeSSwwWxXkdjUYbVJNbpQmvAxtXo1f3kA5NjCgypUFXPW
	 D4Zbq6huetNCI4PUwOvjCPkcqV559I/Y0jskYAxECehzqWZqCn8PN/poALQVgHyoD6mwj
	 uoNUWh1+lXf4s+7apdiTudjVzm/5CzA87ukQFsle2paAe+AQtXZoqf8GHsoyeb6Yv4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W2tO11AD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GlVPXgLU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W2tO11AD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GlVPXgLU;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9DB606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W2tO11AD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GlVPXgLU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W2tO11AD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GlVPXgLU
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B53D11F44E;
	Tue, 20 Oct 2026 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792487885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysfbbrFI8yivLPYPpI0njpIa6LJjUf9RR89EPWV3woQ=;
	b=W2tO11ADs9lp13lL6/fdplhBq0f1R9OtWB/EyD27XTYl7cyUV4GkvUC+3Px7lPVMlJ6Ix+
	15B4omv2hYncyr3nLfkYAigVEtMCJgRrkVI5Nu0kXs8DDphXsxy2+2UEDOJKpj0HrCZz6Y
	BdhzKfE/7AvyYi7rk0iiOf3B2zhrLN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792487885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysfbbrFI8yivLPYPpI0njpIa6LJjUf9RR89EPWV3woQ=;
	b=GlVPXgLUletv7Aw/8+gtLbc1JwS7igsW7TkChkoRqVg5ludBuM3zt8Ifhfu0zIARUua7zu
	xKYus6Tj9QEsqfBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W2tO11AD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GlVPXgLU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792487885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysfbbrFI8yivLPYPpI0njpIa6LJjUf9RR89EPWV3woQ=;
	b=W2tO11ADs9lp13lL6/fdplhBq0f1R9OtWB/EyD27XTYl7cyUV4GkvUC+3Px7lPVMlJ6Ix+
	15B4omv2hYncyr3nLfkYAigVEtMCJgRrkVI5Nu0kXs8DDphXsxy2+2UEDOJKpj0HrCZz6Y
	BdhzKfE/7AvyYi7rk0iiOf3B2zhrLN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792487885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysfbbrFI8yivLPYPpI0njpIa6LJjUf9RR89EPWV3woQ=;
	b=GlVPXgLUletv7Aw/8+gtLbc1JwS7igsW7TkChkoRqVg5ludBuM3zt8Ifhfu0zIARUua7zu
	xKYus6Tj9QEsqfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A498136C6;
	Tue, 20 Oct 2026 09:18:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PTFaFM0x12ofcQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 09:18:05 +0000
Date: Tue, 20 Oct 2026 11:18:04 +0200
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
Message-ID: <207f5a00-7fee-4ea5-b541-38424d4766bd@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-10-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-10-mkhalfella@purestorage.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B53D11F44E
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Sun, Sep 20, 2026 at 11:28:07AM -0700, Mohamed Khalfella wrote:
>  static void nvme_fw_act_work(struct work_struct *work)
>  {
>  	struct nvme_ctrl *ctrl = container_of(work,
> @@ -5099,6 +5142,9 @@ static bool nvme_handle_aen_notice(struct nvme_ctrl *ctrl, u32 result)
>  	case NVME_AER_NOTICE_DISC_CHANGED:
>  		ctrl->aen_result = result;
>  		break;
> +	case NVME_AER_NOTICE_CCR_COMPLETED:
> +		queue_work(nvme_wq, &ctrl->ccr_work);

What happens to the waiters on sctrl->ccr_list when the source
controller enters error recovery while a CCR is pending?

As far as I can tell, ccr_work itself is fine. The reset path cancels
it via nvme_stop_ctrl(), and in the error recovery path the Get Log
Page just fails once the admin queue is torn down. But the target drops
all CCRs issued by the old association when it frees the controller,
so the CCR completed AEN for them will never arrive. Nothing on the
host side walks ccr_list when the controller leaves LIVE, so
nvme_issue_wait_ccr() sleeps until min(kato, deadline - now) runs out
before nvme_fence_ctrl() tries the next source controller. In the
worst case that eats the whole fencing window.

Would it make sense to fail all pending entries (set ccrs to a failure
status and complete them under ctrl->lock) when the source controller
goes into error recovery, so the fencing code can move on to another
path right away?
