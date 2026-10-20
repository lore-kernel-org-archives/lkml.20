Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488982;
	b=MogV+w/UTG5G9AZB9M1fGBvPGpT1t2U0Y+CT1HMgwsvR3ix0WXXSzb4tRxTmMPopzWaT
	 Tg0KP6emRIT7NGKNimjgq+PwIC6MPHCCvfz0qgDsU+o9UOuW1zWSm99DfP2ujQ778eHND
	 LjPeB7XDFYmkK89gPP/nZmQfWUHEFaAYearNmTa07QTTaks8QVo9Ip7ZbFEI/gWyCGI/d
	 jU+gGmgvkSnef44PKpQ99SFnq2vT1KmaoVUp0sEhXjf0vvbFu3ZMVyNEIEADV+yWuWvGO
	 vKaun/fbHWHQVB4uaOG54BksykCFXkjvyhpxN4p9kPztiV6brKcZaLEuxA9e1Wg3zvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488982;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=4n+etd17kWY75uo06/KgtPiuqzHBy7OLAf8ZWW1+Os0=;
	b=BiHu7Ubm0bXIqmM1VA9Puc7c3FRdcz9W9tK7BgpC9/OMxm8XVrXlQxgqXR8D9ED6M88a
	 yCEsWcAksjZe4ZIutau3yVYCCF9JHdtx+Z4sSphTjkjuVsiSdg2d6Hz1mGsfDlOZk+UB6
	 o3FBp2EiTbf/Qw2Eyw27LfgEopbaT+opLof2sozoqRuEqL6munatVGNXKsWDeLw2YPUNS
	 4bfuYWWrR9KfC05W47/NxXOz7H1tvvkFAJ1qDThapaqGfyWBkdR0pattrtxwBcL9ulBI3
	 vqjnFqhPXQ/MDTjoFgXCp1BZOG5ZjMNBAOyRfjHrKajUtrLCoRcP0v2LbkeFVlt44oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="DHS6/S5i";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m7Eq00Dz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="DHS6/S5i";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m7Eq00Dz;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045D60A2600
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4045D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DHS6/S5i;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m7Eq00Dz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DHS6/S5i;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m7Eq00Dz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 727A41F799;
	Tue, 20 Oct 2026 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792488980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4n+etd17kWY75uo06/KgtPiuqzHBy7OLAf8ZWW1+Os0=;
	b=DHS6/S5icgKNpGYywSSHizjoxayQszIGA6xizV7fOiJb1mXHltw+ATaqaCTR3xRbhZ8QEW
	dPjq3E2VPOvUZasObWXDebdAMZoopaYpHeZn7bTO92yU8SRVNG+fBLzrtcdLKi+wxeiTvD
	ABNBng+pp0rvAmtwXp3bpPP2+mSgmNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792488980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4n+etd17kWY75uo06/KgtPiuqzHBy7OLAf8ZWW1+Os0=;
	b=m7Eq00DzwWYMSfrkIbfzUgDyvYrshqE9eREGIE7Zwwodf9MEN3WOS4f4D/g3Q26VO5tiw7
	7VIWhfH5IpuXwFCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792488980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4n+etd17kWY75uo06/KgtPiuqzHBy7OLAf8ZWW1+Os0=;
	b=DHS6/S5icgKNpGYywSSHizjoxayQszIGA6xizV7fOiJb1mXHltw+ATaqaCTR3xRbhZ8QEW
	dPjq3E2VPOvUZasObWXDebdAMZoopaYpHeZn7bTO92yU8SRVNG+fBLzrtcdLKi+wxeiTvD
	ABNBng+pp0rvAmtwXp3bpPP2+mSgmNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792488980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4n+etd17kWY75uo06/KgtPiuqzHBy7OLAf8ZWW1+Os0=;
	b=m7Eq00DzwWYMSfrkIbfzUgDyvYrshqE9eREGIE7Zwwodf9MEN3WOS4f4D/g3Q26VO5tiw7
	7VIWhfH5IpuXwFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39648136C6;
	Tue, 20 Oct 2026 09:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p8XBBRQ212o7BQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 09:36:20 +0000
Date: Tue, 20 Oct 2026 11:36:19 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/18] nvme-tcp: Use CCR to recover controller that
 hits an error
Message-ID: <d1e6b53b-3d14-4cc0-8153-dffd5da7673b@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-11-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-11-mkhalfella@purestorage.com>
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

On Sun, Sep 20, 2026 at 11:28:08AM -0700, Mohamed Khalfella wrote:
> @@ -2731,13 +2755,15 @@ static enum blk_eh_timer_return nvme_tcp_timeout(struct request *rq)
>  	struct nvme_tcp_cmd_pdu *pdu = nvme_tcp_req_cmd_pdu(req);
>  	struct nvme_command *cmd = &pdu->cmd;
>  	int qid = nvme_tcp_queue_id(req->queue);
> +	enum nvme_ctrl_state state;
>  
>  	dev_warn(ctrl->device,
>  		 "I/O tag %d (%04x) type %d opcode %#x (%s) QID %d timeout\n",
>  		 rq->tag, nvme_cid(rq), pdu->hdr.type, cmd->common.opcode,
>  		 nvme_fabrics_opcode_str(qid, cmd), qid);
>  
> -	if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
> +	state = nvme_ctrl_state(ctrl);
> +	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
>  		/*
>  		 * If we are resetting, connecting or deleting we should
>  		 * complete immediately because we may block controller

The documentation should be updated, maybe something like:

          state = nvme_ctrl_state(ctrl);
          if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
                  /*
                   * If fencing has finished or we are resetting, connecting or
                   * deleting we should complete immediately because we may
                   * block controller teardown or setup sequence
                   * - ctrl disable/shutdown fabrics requests
                   * - connect requests
                   * - initialization admin requests
                   * - I/O requests that entered after unquiescing and
                   *   the controller stopped responding
                   *
                   * All other requests should be cancelled by the error
                   * recovery work, so it's fine that we fail it here.
                   */
                  nvme_tcp_complete_timed_out(rq);
                  return BLK_EH_DONE;
          }

          /*
           * LIVE state should trigger the normal error recovery which will
           * handle completing this request. In FENCING state the request
           * must not be completed before fencing has finished, so just
           * rearm the timer and let the error recovery pick it up.
           */
          nvme_tcp_error_recovery(ctrl);
          return BLK_EH_RESET_TIMER;
