Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545662;
	b=lGxGw0/3A7C0Ircxl1CHwWq7299mbLw1DgdAcJYuF/Nhb9PGSXdHcGJh3zTB+PVV3YkM
	 e3iX0b1ecglAQBNQpKdXmKP/gg8AiMUrGvVdy5kDXUZMiLIcvlqiC3KYeeNXwlc3BPjVA
	 UsHa6IX/F3bbaoD6vzA6YYKmsDqLSzOQt9r2x1/0JmY53fmRi5IdAX7s/e9Qu4+CYqAlY
	 SM0NVwvEdX3jDho75SvtPjSL3dhNsxld8EyQnXFSVIBdA+huA+Xz5rr83yWgsNJ8kocy7
	 qjuIIWqovtTS8JktZTaKVkWolPvQTzZIqoMd32P7PidbX4rA2WK0oXLaA8KabquaYNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uIy+JtJ16TtxbVm/PfwhUZa+19M2uMfSlcIIrSZi7Tg=;
	b=m/J2KySvqISnc+4VMDnSoTTvgmwseAdWnhMGVUPStxorMaWsZ9WgzlftCifj8MeHY03l
	 aLNC7vrVGfDNRXp1fYXcfKLmdTcz9L8R+gJFSTvbKmSm38Hy1qm4seQcDLsRFNsb/iqJf
	 djAzan1APQNRMOJq7tKaaD5O1C8u+SLzMApOivWax7i/5/WLAOnt/dvEC4nqPMweODhNk
	 Fy1k4aVEOkKolVptg8CH8gM/6ryKDjWHudT0I26s3C6COnj1O/Ecl4y0FOINTOMfxUF3D
	 SPI1VHmkyD4b7YL5zzslyuXf+Rax1Uc/DUDOdyyipfpVwlpU4dHzbDJ+5xo1ohDHAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eNicd16b;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10D5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eNicd16b
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso608958eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792545661; x=1793150461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uIy+JtJ16TtxbVm/PfwhUZa+19M2uMfSlcIIrSZi7Tg=;
        b=eNicd16bJjsqIMQqpN39bBS3CzlUCG/+54YXqkMOCNH6ojizbb2geuFtl9sjMBKVAD
         LPU9XHKhr7W1DQCmaqhhsK/3Npg6OT//u2Jq/nOKslAqXyYE3L7P73cy54Zo9Rq54mWG
         m7c/IYas9FbBg7gUM75hJ2T8UzJ4CZKN65zy42jpZsd50tvFOJ9M2VP5y+EHn92Ci/Zz
         i0KQVsbnJ7zeSsVJd+Y2YPEQ9qLgNFSqQs33GfJspKEVqc3f1YEiGJ6YI8+ue6b3Znu7
         rzI21aAE6Q81HOE0EiVsLQ4cHU2IWbc4yBVFVuyKcL2dCkHhpstrzq4wnmdxEtyjX9D9
         +2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792545661; x=1793150461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uIy+JtJ16TtxbVm/PfwhUZa+19M2uMfSlcIIrSZi7Tg=;
        b=qnDDQdmAO1JV01k5OWBnL7uWniddFMwfdofLF6D3osP+ixz1NMXtaaNSGco+i7RNcO
         CPmBnZ+H6dYOii8BrDxBbDUsj2cIy8kM82jFSYK96AbIML7/IC0pXyMCgy/SqxSMcI/o
         63XjARVRayUOeTAM8VmYzgYFQ4BmeXEqxIUIwF/hdTxfikZWwg2IhSZillRiU6mijRIl
         2t+sEKGS7IMBLJL86jhkczvmYRqLTU2lJIbqUeEBVg/yOKfLRtPcHors3P4+oOh55qRX
         HPBYK5OKWqIbxDTcfNsBYP992x31g66H1Tmui8OWi8n8ZUwHARxwQkLrusEdODRXXeRK
         GlsA==
X-Forwarded-Encrypted: i=1; AKwUvBzM7VBXm51gYLQ6J3aC1V9CbdF7dXZrg6u9G5PnnMqra0jcvoP3nZHpaSL36ouiOwB6Amtyc4oaJ8Evm2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiRvrpLBbtfGpWPnnhi+kjgEmxmK6Dz0SwOepYdY+b0Xc/RjpG
	JsbGiqBRDrtOkxONK6B8gh4Af2EiucFMk0g0C1x+3YylDUvkL4DZg4k3kDGIKepqN8UArytJnW8
	VZy1nxpc=
X-Gm-Gg: AYBFou1f+lI7XjyC/ludLnpRjG4aWq35KjIFYFJmELwrEsOAirudZb+vtfY3qGQGm6B
	4BUWz5UDnq8BUUlzMVJfwKYDSim/3/IJ21kMxNhQvKfIEZjPP/US7iCGCxqmtUAHKvscIyFy+HI
	/4FdMBi+JQ76durUQ6heAeDkbSJGDDNCAs+7kq6stsOjbbmsS/eEXIyQFsCxkQUnUSaFvXyuN4m
	deBDNihj9UPffPnfty1aeq/eDXoyZf21DUP+dMRLZ6e4RqIztHUCaKbpjNjP6FLne1n28fPnBBc
	3Co5qbYJTE+T2D4yp7Bc03OHKuvScmoekm/iYZmk9u1U5ie/B/OTzsMAtNl4il6Hv4FXn4npRdt
	Ruo1n+ldBvRw6ueGz5LXq2mqGDiL8shS91ZlcG/EdCPT/R1+QF7aKrjzlaEWIw9gh93t9KmxdHu
	LI+JgHzZodIuYVVItbnKxKYP5kZeLuSTyq2w2qAXLY8uQygc/qQXKsKf0DZeofcPq4+9sempvvS
	YtWRSRXVuHJptGA9Y1naufj5LrDKLpUOoMajEewt/t+iRDKK0lviyQageVU/xNSL1CoZUndKjJ1
X-Received: by 2002:a05:7301:a07:b0:366:913f:4d27 with SMTP id 5a478bee46e88-3674fa0d640mr1022322eec.30.1792545660473;
        Tue, 20 Oct 2026 18:21:00 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-367411bd2a6sm3211171eec.18.2026.10.20.18.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:20:59 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:20:58 -0700
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
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/18] nvme-tcp: Use CCR to recover controller that
 hits an error
Message-ID: <20261021012058.GS2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-11-mkhalfella@purestorage.com>
 <d1e6b53b-3d14-4cc0-8153-dffd5da7673b@flourine.local>
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
In-Reply-To: <d1e6b53b-3d14-4cc0-8153-dffd5da7673b@flourine.local>

On Tue 2026-10-20 11:36:19 +0200, Daniel Wagner wrote:
> On Sun, Sep 20, 2026 at 11:28:08AM -0700, Mohamed Khalfella wrote:
> > @@ -2731,13 +2755,15 @@ static enum blk_eh_timer_return nvme_tcp_timeout(struct request *rq)
> >  	struct nvme_tcp_cmd_pdu *pdu = nvme_tcp_req_cmd_pdu(req);
> >  	struct nvme_command *cmd = &pdu->cmd;
> >  	int qid = nvme_tcp_queue_id(req->queue);
> > +	enum nvme_ctrl_state state;
> >  
> >  	dev_warn(ctrl->device,
> >  		 "I/O tag %d (%04x) type %d opcode %#x (%s) QID %d timeout\n",
> >  		 rq->tag, nvme_cid(rq), pdu->hdr.type, cmd->common.opcode,
> >  		 nvme_fabrics_opcode_str(qid, cmd), qid);
> >  
> > -	if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
> > +	state = nvme_ctrl_state(ctrl);
> > +	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
> >  		/*
> >  		 * If we are resetting, connecting or deleting we should
> >  		 * complete immediately because we may block controller
> 
> The documentation should be updated, maybe something like:
> 
>           state = nvme_ctrl_state(ctrl);
>           if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
>                   /*
>                    * If fencing has finished or we are resetting, connecting or
>                    * deleting we should complete immediately because we may
>                    * block controller teardown or setup sequence
>                    * - ctrl disable/shutdown fabrics requests
>                    * - connect requests
>                    * - initialization admin requests
>                    * - I/O requests that entered after unquiescing and
>                    *   the controller stopped responding
>                    *
>                    * All other requests should be cancelled by the error
>                    * recovery work, so it's fine that we fail it here.
>                    */
>                   nvme_tcp_complete_timed_out(rq);
>                   return BLK_EH_DONE;
>           }
> 
>           /*
>            * LIVE state should trigger the normal error recovery which will
>            * handle completing this request. In FENCING state the request
>            * must not be completed before fencing has finished, so just
>            * rearm the timer and let the error recovery pick it up.
>            */
>           nvme_tcp_error_recovery(ctrl);
>           return BLK_EH_RESET_TIMER;

Good point. I updated the comments.
