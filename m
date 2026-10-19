Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441275;
	b=KXPNctL3M98lNE7n8tmY5436czjDkNvuNGdZOfic9ENWPvEDE324FsaHgQUPbAPueU53
	 7bNLN6NgNgU0gxNzsjd2l1BIiemlr+6lvnsFYR5UiKmCCjYHR1E9rrzXoElCBEsyYtWPM
	 G7Yiwl7QOQG0iFWHkslZtHwf5nshyvdoY6UMkf9u5my2dMN2phBFo5oZAhbGnmryr4rsV
	 Ozv7/hAWV8FvPwpYWSxKdQesi5tGgqfMKN78V2zwd9YfWox42gxKXS50tJ6zaLIiWgLte
	 AOg7RI+vJ0ltuG2782vYf8yGI1KAeIxkwVZsteEJYLjFG9NxLulLftXat1JNYo/1I2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CKKdw8V+R/UaH3b451GniCGJFNTIiHJBalTQve79lgI=;
	b=w7fQ/eu8sHQ2K4ZgFy80Pkg25ynb6yEwbJavIWwehruq6XEnei6AiQRJPfmvYewKZUi7
	 9M3N7sBn0wYilKVqBjGy4zbV7DG9wpuKfsSRMOYvRk5xr4BbwVfl6IsU9J7bnN+ZMVrPF
	 3mx3+BmGmNQVMOcAEr/Hyn4EsHA/Ghygk5JrfUfqv9b9KMmdqDT5DxPddOPYL87seB391
	 KIrW1fvTneQ0u+EQWHwDHaZV4OUKvpwwJtb+fWCXMU8cZAzhIUJsGSFiaJ3KMPYhQO3Oh
	 mFZShNfoT1VNkGBr1H4s76zETRVPOw+9bsD0BAH/IsLK5vbceRnMLjVx5ZOyHfll9/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=AVHohQkw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC88606A328
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC88606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=AVHohQkw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2122712f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792441273; x=1793046073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKKdw8V+R/UaH3b451GniCGJFNTIiHJBalTQve79lgI=;
        b=AVHohQkwGI0R0Cf1xjvMfUf3RZx403huNQxxCYvQtAjWb5V28BE8QImZ9hfrjPtE/y
         bxx7+GY00PLzDZmvozWiCXDesou8pPZ314V6bvL9531GNw6a36xa/lKJmqLw0yPF1M5a
         SXQZQb1TZ5+ZiUbJSxqmbObKDfsynZVRnRqsVMjSPCK/+VKsFSN/c0uSMtOb5qzxlDRP
         BNnvEt3SmH+KOp/0kvM8EMc2OiCuAF8+WITK0sM5nj6t19stuXWEIPpicE4eq9XFQ2yz
         KnX0necNw9y26eACKK/YJvJv8rqvn21ql+nvhcO4buoAIapOtFjS08s+KldZZfTeIe8V
         +jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441273; x=1793046073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKKdw8V+R/UaH3b451GniCGJFNTIiHJBalTQve79lgI=;
        b=DI32hrzfxUGm+e46CLO3KncwIeLKQMJ+BhDUr5E5AWMWXaBzVghapE0dw4S2vPf72+
         QrCBjmR7VauteoBnDngr3Y0ywbhRsSmnibr0ysRzrbKu2mj/s5gdZ+13J8hh/4KQH1fb
         zcK9sBsiJdQawFQrpQXoS66Gkzrmo52wC++4cF3UdtKOlrLDzlyLsMa5z/IvvhvJUSf3
         yaypwiHVW6WN2lTSaAFS3ZtItT4TTn3uNNjtC9x6JBR7qfCOl2io1kjG66AubiBLIP84
         oPDgBegotRLe14RVwGlg15oySypLgvnv/U67zIRk8NiCT+EoOPbgEs6gK99MPnKXXYPz
         p6nw==
X-Forwarded-Encrypted: i=1; AKwUvBwFKjZ13E6xMkBgWjEWtwpCVmhw0h5d7quBLuVS6w/URPXZEW3Cj/XoBEw5RFaBgRk9qnDdf2KVN78TUNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUdT/ZtgafsYWMy68xulwYECQrTdT+oVqK4mMv1f/mhaluOggA
	jx3tXKp6TxUk2+xA2hPH5IFtJlE7hQEdRBXs6pcy9mx6uqFoYd12QSB2iR4m7xwfU0c=
X-Gm-Gg: AYBFou0HfZzSY8HS45BOBgwDTYs9xGWVoSIlbqgi0rcqCeKY7Gv7FOAlwA/wrcUnnCu
	dZLW/BFxbT6aocoVDkiMC3L+plaWTPVBR2a+sTP791+TUAeKYFEWgfAGivM05Zqy/avk4eeFTsk
	E0xrCKeuNj2mp6ZRrkHCBOK+IfnPvoiawb750XKVyhKyETAeG1mGdwNwuHvMCXvqTLZMJu5/HaO
	NqjBTv03f03CP6YNQ9J9ni7G38Yn/PMrfW+sRoBRMnE/l91r0GLoXFp5ucWSN3lllT6mV9utoEZ
	8HVjAAd08vfhlSR9X5EoQ5QRST2b0Vz4QMcqaYmtigRaKN+ad96rJZFqm4ikhZmJWFvlwfpCOtK
	DOup0/eELYvDMS1g+PZCtzdOHT08Ljs4JZcwNCjUJHCFRLAapjiNPWzmh0o51OTGomvpkpQ+hif
	yE/szR0L+fDc6uCkpKhHBpuM7wTWnKalcGTIdLJ+hgC4KfVgTqmyM5Z0gCnYkCkH4bKlEwrjFtu
	71ajvRAEjivNSFZpYI=
X-Received: by 2002:a5d:584f:0:b0:48b:123e:2f60 with SMTP id ffacd0b85a97d-48e07fa71c4mr16000755f8f.39.1792441272605;
        Mon, 19 Oct 2026 13:21:12 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d817d75sm1239430f8f.25.2026.10.19.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:21:12 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:21:08 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 03/18] nvmet: Implement CCR nvme command
Message-ID: <20261019202108.GL2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-4-mkhalfella@purestorage.com>
 <179242560183.3619480.12432335570480465347.b4-review@b4>
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
In-Reply-To: <179242560183.3619480.12432335570480465347.b4-review@b4>

On Mon 2026-10-19 18:00:01 +0200, Daniel Wagner wrote:
> > +void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req)
> > +{
> > +	struct nvmet_ctrl *ictrl, *sctrl = req->sq->ctrl;
> > +	struct nvme_command *cmd = req->cmd;
> > +	struct nvmet_ccr *ccr, *new_ccr;
> > +	int ccr_active, ccr_total;
> > +	u16 cntlid, status = NVME_SC_SUCCESS;
> > +
> > +	if (!nvmet_check_transfer_len(req, 0))
> > +		return;
> > +
> > +	cntlid = le16_to_cpu(cmd->ccr.icid);
> > +	if (sctrl->cntlid == cntlid) {
> > +		req->error_loc =
> > +			offsetof(struct nvme_cross_ctrl_reset_cmd, icid);
> > +		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
> > +		goto out;
> > +	}
> > +
> > +	/* Find and get impacted controller */
> > +	ictrl = nvmet_ctrl_find_get_ccr(sctrl->subsys, sctrl->hostnqn,
> > +					cmd->ccr.ciu, cntlid,
> > +					le64_to_cpu(cmd->ccr.cirn));
> > +	if (!ictrl) {
> > +		/* Immediate Reset Successful */
> > +		nvmet_set_result(req, 1);
> > +		status = NVME_SC_SUCCESS;
> > +		goto out;
> > +	}
> > +
> > +	ccr_total = ccr_active = 0;
> > +	mutex_lock(&sctrl->lock);
> > +	list_for_each_entry(ccr, &sctrl->ccr_list, entry) {
> > +		if (ccr->ctrl == ictrl) {
> > +			status = NVME_SC_CCR_IN_PROGRESS | NVME_STATUS_DNR;
> > +			goto out_unlock;
> > +		}
> > +
> > +		ccr_total++;
> > +		if (ccr->ctrl)
> > +			ccr_active++;
> > +	}
> > +
> > +	if (ccr_active >= NVMF_CCR_LIMIT) {
> > +		status = NVME_SC_CCR_LIMIT_EXCEEDED;
> > +		goto out_unlock;
> > +	}
> > +	if (ccr_total >= NVMF_CCR_PER_PAGE) {
> > +		status = NVME_SC_CCR_LOGPAGE_FULL;
> > +		goto out_unlock;
> > +	}
> > +
> > +	new_ccr = kmalloc_obj(*new_ccr, GFP_KERNEL);
> > +	if (!new_ccr) {
> > +		status = NVME_SC_INTERNAL;
> > +		goto out_unlock;
> > +	}
> > +
> > +	new_ccr->ciu = cmd->ccr.ciu;
> > +	new_ccr->icid = cntlid;
> > +	new_ccr->ctrl = ictrl;
> > +	list_add_tail(&new_ccr->entry, &sctrl->ccr_list);
> > +
> > +out_unlock:
> > +	mutex_unlock(&sctrl->lock);
> > +	if (status == NVME_SC_SUCCESS)
> > +		nvmet_ctrl_fatal_error(ictrl);
> 
> nvmet_ctrl_fatal_error will log an error, is this desired?

I think it is good to have the error logged. The fatal error might not
have been observed by the impacted controller we are failing yet, but it
is still okay to consider it as fatal error IMO.

> 
> > +struct nvmet_ctrl *nvmet_ctrl_find_get_ccr(struct nvmet_subsys *subsys,
> > +					   const char *hostnqn, u8 ciu,
> > +					   u16 cntlid, u64 cirn)
> > +{
> > +	struct nvmet_ctrl *ctrl, *ictrl = NULL;
> > +	bool found = false;
> > +
> > +	mutex_lock(&subsys->lock);
> > +	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry) {
> > +		if (ctrl->cntlid != cntlid)
> > +			continue;
> > +		if (strncmp(ctrl->hostnqn, hostnqn, NVMF_NQN_SIZE))
> > +			continue;
> > +
> > +		/* Avoid racing with a controller that is becoming ready */
> 
> I think this comment could a bit more eleborate, it took me a while
> to figure out the impact of it. What about something like:
> 
>                 /*
>                  * Enabling the controller (nvmet_start_ctrl()) regenerates
>                  * ciu and cirn under ctrl->lock. Hold the lock so that a
>                  * controller becoming ready concurrently is matched against
>                  * either the old or the new instance, never a mix of both.
>                  *
>                  * CSTS.RDY is not checked on purpose: a disabled controller
>                  * can still have commands in flight, so a matching instance
>                  * must go through the CCR path rather than being reported as
>                  * already reset.
>                  */

Okay, I will take the first paragraph and remove the mention to
nvmet_start_ctrl() because comments with function names do not
usually age well. The second paragraph is not directly related
to the lock IMO.

> 
> -- 
> Daniel Wagner <wagi@kernel.org>
