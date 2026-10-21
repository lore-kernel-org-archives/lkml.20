Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575945;
	b=TQ/AfVUlgRCZxJDqjiidRToH87qu6J9OlaEg+hstsxteTDgRFvYol0LUlTNCjXdM6H7P
	 2lPyRw8LXyJ46wy6iujo+p24Yumr90CzwGU+5GinwuWODAvr6koaKA1xdERCMvr4RVAOi
	 o+Tc53ptnYGIMewanmHUguGDRHNLQQk/HFrX2s9mtN38JhnsCzvTK/hH5R3j+zRnrE+Qc
	 ChhdOcnpfh5okM5J2d+CI8tpJOETLWJiufYO3wRbOfJD6hqxkGWEpc22NnG0b4iHVp8Ci
	 WqtMQ8jRApL1M3JwGaQa/znNwaq0KxiAOYtongL5ifI8/H/eluJpDpXymmG7ZiaE69A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6NbYVhDAgDjCXLKt6OUsnbPdCRFgrXF84XGBkdNmv0Q=;
	b=lHag8HRDVA+Wrzk2XJWcykEnbMxxUhGI288+Tr40bU7T+tQePt68Flqzh/3zkkL7MVjZ
	 YKNfUyB49enkcYO0do89PR9QM/wpUk5Gsi1Jq16LB7Q3cWxEeRpPjy0KgkJxbsNY4oYVc
	 59Km/9TTh1xy01Su8MykErHE5ACIb37qboLNm+RLfgK4mPTIxfvcUnwNbeaKOXlTu/IFJ
	 rxXzBiVUsTJcBJOpgJ3Gbc0q92K/IlQ7YxOl/iKdoeCzHQgRO/eIbwIpuOVpLlnvnyYDN
	 eywV+Bi7hiIzanz7JMkA+NGAJ+cAyx1eHjz2ohIM4p2IR/gjF783d39Ll1uNDXB7ADw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=X1Uu7M9W;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C92606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C92606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=X1Uu7M9W
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so674771eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792575944; x=1793180744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NbYVhDAgDjCXLKt6OUsnbPdCRFgrXF84XGBkdNmv0Q=;
        b=X1Uu7M9WYRfN40A4em3BmEdd/kW5CM43X9l3Q8QVg7uA38xjI8leIGQCgd+iBF23bF
         SHlXHoJ1dHrzNDR2RjtHr5QL/T/VNJ4QEM82FmWbofBPq59UV2rJyNze+wVlYMWBXrPG
         BOqDIcKJRTTpHAY0mbq6gpSrO1NQxZNPPr3P7vi7SfPZg+EHsszyykry2olxgPtGSf9E
         xTlbX0p6OVS2jcjphRrJJvDYbxIf9hol325lg4x8HWnam38cFC10GykXKb3MdXKtmsL2
         Rhyn7XMomj6y7Vdq587V34QUGYhpWBqxBsqzmEFmtrHyHa/Fj5rx+dB+nTVwsPni46HA
         Hb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575944; x=1793180744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NbYVhDAgDjCXLKt6OUsnbPdCRFgrXF84XGBkdNmv0Q=;
        b=Ly9y8djOH2z/vudBDZMkIf7YTA0dJvMsDEegcVlG+pXS5sC5PK/xcVjWW93zl7/6yT
         026cqT7wGknGkZ2bAkQvsF7JT7rxnzlSs9ml8IJ+DpfRNXqft/iJcGlfJjJ2E5fFJkBX
         tnZeHOS5a+RdKCE7BRiiGTmAC8bxYoPE0YjxD+OC5S8M0DTjSOnH7lvOLMUH+tVi16wJ
         hYT8EePhpIY6pwDEdoDURYAg9Cu5isZp5U6wjAwuYRVGkK0QCwdHQMnFPRXBFltNsKMs
         1ZsIzPQJaxDc/ApRHQWPk8uonJpvAgBxx1+rBSnUSD1hm4cfVrTQztAAHMiuhs5jN0Aw
         HCrg==
X-Forwarded-Encrypted: i=1; AKwUvBx4Sgu7UeLxCRDUQjes6dHrWFJkA9QhPtBAVHCBkv+iDx4DzfaGrhmee08khYpoFSlISsfl9UKeMqD/7qI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlHv06zbboLdAj2MBNmda+iqQXhPpVBOGM0X3OEsQYhwCDpDX4
	MiaSD0LlI+hn8fAgL1V0BS7jxx8KubuFRAGYpukIlZ4XiVdESziA4qNJCAFp1fwRLjM=
X-Gm-Gg: AYBFou3CplrXp4lBAHyHvKWbmygtTIH4bRJzM3+vKaTwIjOVxrCUN0h8yb2cK8WJOyS
	tgCHE8YRZ2q4BiUXR/oXEp1o6XZsKF/uQEXr4sefv8lRFhGUuNoOcqbMzB+H6zeiVPo92nqBcrD
	23J4nvBgnQT66jeK43CZtFtMnyUz0T7UdcYqlzGWNpMl0EtowMYSPJht+TkSLNn0p/cunBOIcxx
	Kz6EpyFgx7YAkC4PVsnmNBnVn2iXWjuUakPPwMWFdlhTAPie/Hft532MPca2e/p39EJvPaufxJW
	LqBPNNJ7bQMObjwKMOxhGI4xo58gObwaKj74HYOYjZ/qL7PtVBbXloxY9Zkz6GE+e26HWRol3k4
	LywUahiH7WVvQOS8QhWoI+JvGtY1PW/f12CJlB0zr9dVkGGoecyWte9VOW/ropigGa+dcEIj/ta
	X3JIXKwcrpZXZkupqcOvRN/bRrjnAXRP2Jf+kwcpbW3rqbGsc8zV0b+CQd5S2RgX+nBDKT6D835
	zIy+Cza8hqURZCOeuxh44rFrPAPs9W89YyPs4yrvav5vBOhgPMDIIu5EPT4U6GaRAjYc4/y+5Hk
	kl21Ben9uZdPiDmP9AlOuxLXNyI67fHHbw==
X-Received: by 2002:a05:7301:c004:b0:35c:ceb0:8bf9 with SMTP id 5a478bee46e88-3674de50911mr2681358eec.38.1792575943810;
        Wed, 21 Oct 2026 02:45:43 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4381:36fd:9c31:126:4a90:466f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm6750326eec.15.2026.10.21.02.45.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 02:45:43 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: sashiko-bot@kernel.org
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai
Subject: Re: [PATCH v5 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Wed, 21 Oct 2026 02:45:12 -0700
Message-ID: <20261021094521.80335-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-175868@kernel.org>
References: <20261018010059.83120-1-saravanand@crusoe.ai> <20261018010059.83120-3-saravanand@crusoe.ai> <sashiko-outbox-175868@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 01:15:14AM +0000, sashiko-bot@kernel.org wrote:
[...]
> [Severity: Medium]
> In nvme_tcp_setup_queue_async(), nvme_tcp_alloc_queue() runs before
> nvme_tcp_start_queue(), where nvme_tcp_set_queue_io_cpu() is called:
>
> nvme_tcp_setup_queue_async()
>   nvme_tcp_alloc_queue()
>     if (!test_bit(NVME_TCP_Q_IO_CPU_USER, &queue->flags))
>       nvme_tcp_queue_change_io_cpu(queue, WORK_CPU_UNBOUND);
>     ...
>     nvme_tcp_add_queue_sysfs(queue);
>   nvme_tcp_start_queue()
>     if (idx) {
>       nvme_tcp_set_queue_io_cpu(queue);
>       ret = nvmf_connect_io_queue(nctrl, idx);
>     }
>
> Because nvme_tcp_add_queue_sysfs() publishes the sysfs attributes in
> nvme_tcp_alloc_queue() before nvme_tcp_set_queue_io_cpu() runs in
> nvme_tcp_start_queue(), can a userspace control plane reading io_cpu and
> managed as soon as the queue directory appears observe io_cpu as -1
> (unbound) with managed=1 even when wq_unbound is false?

Agreed. v6 adds the queue directory in nvme_tcp_start_queue(), right
after nvme_tcp_set_queue_io_cpu(), instead of at the end of
nvme_tcp_alloc_queue(), so io_cpu and managed only become visible once
the selection has run. The directory is still removed in
nvme_tcp_free_queue(), which the setup error path calls for every
allocated queue, so a failed connect does not leave it behind.

> Also, during parallel reconnects in nvme_tcp_setup_io_queues(), a queue
> with NVME_TCP_Q_IO_CPU_USER set does not re-increment
> nvme_tcp_cpu_queues[io_cpu] until it reaches nvme_tcp_set_queue_io_cpu()
> after completing the blocking TCP, TLS, and ICReq handshakes in
> nvme_tcp_alloc_queue(). If a driver-managed queue finishes its handshake
> first, could nvme_tcp_set_queue_io_cpu() pick a CPU without accounting for
> the user-assigned queue's load?

This window exists for every queue, not only user assigned ones,
since a queue is counted only once its handshakes complete and it
reaches its own selection. The selection is best effort, and the user
assigned queue keeps its io_cpu regardless, so I'd rather not add
accounting to nvme_tcp_alloc_queue() and its error path for it.

Thanks,
Saravanan D.
