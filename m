Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425611;
	b=g4nz/8RrStR5Ore3FEEGw2tCWPm1gXlekWGFKdNKX7wl7Pdt1JZlFmQcIC6M0+xo4xpm
	 xGiw1B7Ek0IZUrRB9+k9YYU8WAknAfaZoPXY2aYP0Ziw++wkatN6lzaXUHpf663CL1vfp
	 jO3tRGdDSKRQ0fO/g1T+jOPsDmbbEESAQ/r+GUPXtt/K8wA1rpM3X/Djg6ut4FO8PpGLZ
	 3dDVlnWqHcd3Vn0u8ADOtg0gYVbJs+Dg3OHaoo1PUyam1CqgVKPxjD6IERC3JpCtlPNPh
	 GU03BMgYCVTCHBkAxfc86apPxHSoOiVW/4jXxuMS0f6btk30ebCSxU4SCUyEXx/WOeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425611;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Level:X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=Xh6PJJlV875LKrbewHDu4bmlG53O8CsIX2VAY6YWyNo=;
	b=wReqqSs/hZJo+/tWfz7j6MfrZDcU2wRSX+b+WjU7jiADn7vdVcgysn7zGuux8xR+GC+K
	 qjJ/kM4DfUtUvltSeK10F/N3VInnhpiqjonT8pWuBPCPD445rzxQUP8hrfbyDj2exPtk4
	 hc2oS5RD87jp4q/yDCwwKB4TLqBTutD0UBuGoGQmj+V5QZBcEmAzUe2hk7EwKC71QgO7a
	 IeZXe7T0fdcuvMAORF10I5LkZHpo0dguSUaXQHnPuBXO8oI066+OLa4GoHxHJ8lppdj3W
	 sST7LAlSSYQRyFWo8Ree4RweOIv1Dy1IBVVtM3utsZcpvXYU+O16z8Vsj5nsKRiLC/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oV77sMda;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Xapmkwr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oV77sMda;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Xapmkwr;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637D6606EFF2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637D6606EFF2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oV77sMda;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Xapmkwr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oV77sMda;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Xapmkwr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8283E21CF9;
	Mon, 19 Oct 2026 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792425609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh6PJJlV875LKrbewHDu4bmlG53O8CsIX2VAY6YWyNo=;
	b=oV77sMdaONFdoQfC+DNxIvq3EWEHRGfbQdCllc6m8gHKDSa1X7aHbhsNa4T62S7f8rpRTK
	+i03UjZrPFEdLLZvVC4C+8mrZGREP5E1pkxEWfXtUdyKQ2weg5lv//Mok+z3NSc96NahqC
	nvqwnLOM6VNuzvFkj50PGtgnAtl4e7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792425609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh6PJJlV875LKrbewHDu4bmlG53O8CsIX2VAY6YWyNo=;
	b=3Xapmkwr4z9uH/PDkeyI1mFfbK6bIa9VeeUi++zNooUai8532BVHV3tW2QwNUA6KDDg3ft
	tZvO7bu0iakAu9DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oV77sMda;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3Xapmkwr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792425609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh6PJJlV875LKrbewHDu4bmlG53O8CsIX2VAY6YWyNo=;
	b=oV77sMdaONFdoQfC+DNxIvq3EWEHRGfbQdCllc6m8gHKDSa1X7aHbhsNa4T62S7f8rpRTK
	+i03UjZrPFEdLLZvVC4C+8mrZGREP5E1pkxEWfXtUdyKQ2weg5lv//Mok+z3NSc96NahqC
	nvqwnLOM6VNuzvFkj50PGtgnAtl4e7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792425609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh6PJJlV875LKrbewHDu4bmlG53O8CsIX2VAY6YWyNo=;
	b=3Xapmkwr4z9uH/PDkeyI1mFfbK6bIa9VeeUi++zNooUai8532BVHV3tW2QwNUA6KDDg3ft
	tZvO7bu0iakAu9DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47F20134B3;
	Mon, 19 Oct 2026 16:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rdRvCYk+1moLSwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 19 Oct 2026 16:00:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 03/18] nvmet: Implement CCR nvme command
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260920182936.2317916-4-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-4-mkhalfella@purestorage.com>
Date: Mon, 19 Oct 2026 18:00:01 +0200
Message-Id: <179242560183.3619480.12432335570480465347.b4-review@b4>
X-Mailer: b4 0.16.0
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 8283E21CF9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

> +void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req)
> +{
> +	struct nvmet_ctrl *ictrl, *sctrl = req->sq->ctrl;
> +	struct nvme_command *cmd = req->cmd;
> +	struct nvmet_ccr *ccr, *new_ccr;
> +	int ccr_active, ccr_total;
> +	u16 cntlid, status = NVME_SC_SUCCESS;
> +
> +	if (!nvmet_check_transfer_len(req, 0))
> +		return;
> +
> +	cntlid = le16_to_cpu(cmd->ccr.icid);
> +	if (sctrl->cntlid == cntlid) {
> +		req->error_loc =
> +			offsetof(struct nvme_cross_ctrl_reset_cmd, icid);
> +		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
> +		goto out;
> +	}
> +
> +	/* Find and get impacted controller */
> +	ictrl = nvmet_ctrl_find_get_ccr(sctrl->subsys, sctrl->hostnqn,
> +					cmd->ccr.ciu, cntlid,
> +					le64_to_cpu(cmd->ccr.cirn));
> +	if (!ictrl) {
> +		/* Immediate Reset Successful */
> +		nvmet_set_result(req, 1);
> +		status = NVME_SC_SUCCESS;
> +		goto out;
> +	}
> +
> +	ccr_total = ccr_active = 0;
> +	mutex_lock(&sctrl->lock);
> +	list_for_each_entry(ccr, &sctrl->ccr_list, entry) {
> +		if (ccr->ctrl == ictrl) {
> +			status = NVME_SC_CCR_IN_PROGRESS | NVME_STATUS_DNR;
> +			goto out_unlock;
> +		}
> +
> +		ccr_total++;
> +		if (ccr->ctrl)
> +			ccr_active++;
> +	}
> +
> +	if (ccr_active >= NVMF_CCR_LIMIT) {
> +		status = NVME_SC_CCR_LIMIT_EXCEEDED;
> +		goto out_unlock;
> +	}
> +	if (ccr_total >= NVMF_CCR_PER_PAGE) {
> +		status = NVME_SC_CCR_LOGPAGE_FULL;
> +		goto out_unlock;
> +	}
> +
> +	new_ccr = kmalloc_obj(*new_ccr, GFP_KERNEL);
> +	if (!new_ccr) {
> +		status = NVME_SC_INTERNAL;
> +		goto out_unlock;
> +	}
> +
> +	new_ccr->ciu = cmd->ccr.ciu;
> +	new_ccr->icid = cntlid;
> +	new_ccr->ctrl = ictrl;
> +	list_add_tail(&new_ccr->entry, &sctrl->ccr_list);
> +
> +out_unlock:
> +	mutex_unlock(&sctrl->lock);
> +	if (status == NVME_SC_SUCCESS)
> +		nvmet_ctrl_fatal_error(ictrl);

nvmet_ctrl_fatal_error will log an error, is this desired?

> +struct nvmet_ctrl *nvmet_ctrl_find_get_ccr(struct nvmet_subsys *subsys,
> +					   const char *hostnqn, u8 ciu,
> +					   u16 cntlid, u64 cirn)
> +{
> +	struct nvmet_ctrl *ctrl, *ictrl = NULL;
> +	bool found = false;
> +
> +	mutex_lock(&subsys->lock);
> +	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry) {
> +		if (ctrl->cntlid != cntlid)
> +			continue;
> +		if (strncmp(ctrl->hostnqn, hostnqn, NVMF_NQN_SIZE))
> +			continue;
> +
> +		/* Avoid racing with a controller that is becoming ready */

I think this comment could a bit more eleborate, it took me a while
to figure out the impact of it. What about something like:

                /*
                 * Enabling the controller (nvmet_start_ctrl()) regenerates
                 * ciu and cirn under ctrl->lock. Hold the lock so that a
                 * controller becoming ready concurrently is matched against
                 * either the old or the new instance, never a mix of both.
                 *
                 * CSTS.RDY is not checked on purpose: a disabled controller
                 * can still have commands in flight, so a matching instance
                 * must go through the CCR path rather than being reported as
                 * already reset.
                 */

-- 
Daniel Wagner <wagi@kernel.org>
