Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545933;
	b=eeEL4YKFNGaBzDvFpR5jHSdnLrJJE76gkEqeF3CxcfNrNt5sYtll3CDb1/JBz2drNhNY
	 RHuN0jIB/aaBeMxUuFc+lOtQM4vn8tYFb9JW8iVEN/oygRLsWBlo9Omeg+EidQcmyn8db
	 E16cxtSXD17An0suco9e8fRncSIwQaHVSB4UGjp67kRihEoW2GzyTsrmkmZ1ksm9cERbR
	 Tncn02wb3bcAUAhtRKPcUlaZNYz5jqNChOP0pX/fSBlwpn7IXBpCWxn4mCqUTA3Bhv/6O
	 Oqfx6GtFKTnaJ+Zf9Vn2kayAlGOPFG/vF8esFRep1nTmceW0EB36qpEaWADyoXVF4KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k5DXLo6R/kdSN6QGlOTZcY8/4DMXbPtBMmC00YCocIU=;
	b=OjLcg56oXFJIIIJ7+ZiGRXYXUMLyRhH0EhwUOFozhuNfavcbo2e3dERDYcyrLoF5fLJX
	 AQWhXRrUzi83W0oitOOIpZ4R5RS5qoFzGupUI2V1uFvjUQ+cvix3GZ0B4fJ0ShOK06u6V
	 Vw39j7z777Os5uhgBuGIk/CYCsPf8rUm6xEcy7y+6OKi4cgPYIJb6vpJdAb6nlHKelZM8
	 ZpSwJEVx/NRE9o+WFErua1GAUBuUJhYdLHoP5Mv8MB13Hs6y3kbZ8U8hR07X/QR/8Ky5+
	 q+t24ZMHbeRQVNXfhQn+RXgegWu5VuYM9azayfxTA4bEPIkp9Em+glSsDV4SvtV5Kjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=X8z4nyCn;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C56606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C56606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=X8z4nyCn
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so281541c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792545932; x=1793150732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k5DXLo6R/kdSN6QGlOTZcY8/4DMXbPtBMmC00YCocIU=;
        b=X8z4nyCnqdptQB3KTUImfEbJ8lP5/E5s80Jy6LK9ZJSs8+r8ik5GyvhQjyHEh2v3Z2
         oqLDnKEJ3xRGq+0oarBgMRSHNCwUNOTb9TuP4lbZXfqIYM/xv0fAxNu82NBKx3Vgn1aN
         EQ8A/TCioFjGvLd3Vm3z8FHqWzvxTNTdktzBcA2XExDYjmmhN7OWuQKNYf3GZ2CHu0FC
         gSrfMj9HkZ2AXHKTaZuMbjNUtU6F/EGww6uIAGcO/vR1va6LSDcI23bINggAIu4J1lcA
         xRpuGjr9WGqsfO2a3/vj0W1UAyaZUE+IONiFXAnHzOwydX3/Q3ctEHoSxwfl5u4tF1Hn
         HZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792545932; x=1793150732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5DXLo6R/kdSN6QGlOTZcY8/4DMXbPtBMmC00YCocIU=;
        b=p3nwavMPuDnKZlp37hLMSEjnmY+rgxQfHUwPGobbC1gvvk/KmeQiXygT3FhTvnx3U1
         OijfB32rglEh/ZLrzfweuaNU0CRcKaM5aaaSb5Sd4qH5eNDcjrTJRdDy0TX/LAjwB3/n
         88YuvFHKHA73yrp0p6FAj+eClcXnzuRZUge73WqcLGNYzTNNYKNymxceoaIQUHME8ibS
         OVJMg3IMIvwmP91AGePS2ODnh0vmZ0QNMllJ1Jxa/HBlSmcB7k0OhFpZkswfmkOTzITj
         AZnglaS/rlQURP1WGZZUJBcX6VByg05wfpMkgPMahB/KdprTEy6h5mdRoYNwgPRAzKSS
         iVLw==
X-Forwarded-Encrypted: i=1; AKwUvBxKzjEBzVC7FLHFqwZe12ZXNogfgHc2RZt3nQLNhS2WT4DAlyvgZkKAxhCcZEL5FrazSo82NQtXmzvR7+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI59DTAfR8kUnn/duR7INF+6/XoSKaQvzffOSSeSV2KcKP8+IvQ
	Mhp63o/vwq732lzgJsZnJ55SW/PkDEPPKwYDBbqGTKEwd03vDJ1qRE1diIeMZJ+H1Yg=
X-Gm-Gg: AYBFou3oPQGsndiwi73Yen+xEC7Kbvj1mByJ0ChY55d3k2btRcbxDRJylEPrRD+4kf9
	XVTM41BII0dlJ2Ip8q6W1H04++80OW+aFdELVOeyg7USJfDawDd24QXjxScm++NhJs9A6LHzMJD
	PACeC18Q01ofN6+9COkCW91HV/sjKCB1Vb6rOohibCfdeC6BEJoqSjaiemdvrkS6UsWwue6yI3u
	jcaIz6+17wuq8MQu7mJWbhcR1b0KvQ0kCsdys5WNW6/nqU8v+MMc9zztfYlkxqXkQE7tU+Q9rVE
	TUpUBZgY7SIC60Zh08jj0Jvg5uy7+G0fkhkzyMgQd0axHIa4QFsARrX6+5VLacYWbORwI02l3Xd
	Mqn9H8MGNHoiJtePlOy4Gu20N5sjnwGEr7/KXYJVPhr4RgLtFszSfyaRjuhx1ORVgFdNFBhL7OY
	yPyuWcuWNX/RnGoQ0xNzD6BkuPK+fttnxLNW4yKpBsfr6Kv41Xt248OqENtX0HfODOJElRhW3Rw
	+LIQDr4p9UaT0pNmqIOtaedi2eQIGOIGlSoGp/KRdtOO+ACntI/P1aLZFc3v4KiTbFHaZ0wqxsJ
X-Received: by 2002:a05:7022:7a9:b0:187:eb7f:b8f with SMTP id a92af1059eb24-190a50efe13mr997401c88.13.1792545931941;
        Tue, 20 Oct 2026 18:25:31 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm2943035c88.12.2026.10.20.18.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:25:31 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:25:30 -0700
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
Subject: Re: [PATCH v6 11/18] nvme-rdma: Use CCR to recover controller that
 hits an error
Message-ID: <20261021012530.GT2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-12-mkhalfella@purestorage.com>
 <8cfb3b90-7629-4a8c-a393-7f724f01c19c@flourine.local>
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
In-Reply-To: <8cfb3b90-7629-4a8c-a393-7f724f01c19c@flourine.local>

On Tue 2026-10-20 11:36:56 +0200, Daniel Wagner wrote:
> On Sun, Sep 20, 2026 at 11:28:09AM -0700, Mohamed Khalfella wrote:
> > @@ -1990,13 +2014,15 @@ static enum blk_eh_timer_return nvme_rdma_timeout(struct request *rq)
> >  	struct nvme_rdma_ctrl *ctrl = queue->ctrl;
> >  	struct nvme_command *cmd = req->req.cmd;
> >  	int qid = nvme_rdma_queue_idx(queue);
> > +	enum nvme_ctrl_state state;
> >  
> >  	dev_warn(ctrl->ctrl.device,
> >  		 "I/O tag %d (%04x) opcode %#x (%s) QID %d timeout\n",
> >  		 rq->tag, nvme_cid(rq), cmd->common.opcode,
> >  		 nvme_fabrics_opcode_str(qid, cmd), qid);
> >  
> > -	if (nvme_ctrl_state(&ctrl->ctrl) != NVME_CTRL_LIVE) {
> > +	state = nvme_ctrl_state(&ctrl->ctrl);
> > +	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
> 
> documentation needs to be udpated like in the tcp patch.

Done
