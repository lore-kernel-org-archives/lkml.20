Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629000;
	b=SZD6OU6zA/PLC/nKq83pa/Sq6a21YHH9KdBhQYJBvnOXxxrKYW14UrFgna3WQw7TJqai
	 CCOjeHUqYutl1Kud2Xj2Xv15K4/6cJdH85VE2tk6uB0vTDFb2+Fr9OdGg13MLlTGT2DpL
	 C2qxi9mSlP+CXq8OYBVMo0hlrXfblkCgaIduOBowcTK4ezJiuSpa1g/r1w663JjwW+yqi
	 1INwUIF8fliagjqk8k0DQJWnRbZzYdZ/iWu8I7h4P6+qoXkghczJHKriBhsJauncVmzC2
	 ik9Qh/B6TZZaaLU43UvKPAaQXshgdkY41xAydj3n9Itwk5II4dIiI3cOMHR4V92u/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629000;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sl0xAa/SyZWrBp9CL5o2SaCOERZeomQ7Ndnf7a0XFec=;
	b=bPSbK7nG+enqs1oYndp5klaM+6UVQ3/3AY90yqnRpJLozm3k61xq+mZeFrKeDbiG3NDC
	 h7avL79ZiMnhmGToHsexNJiLVOzuzUS2+6uYvqvvWGVTeorlm7KybPMqUOvnU5SPSq/Ar
	 iw1BjN4ZOUGleWtB91nEx+Cdxhi0HvxuEArYx0eHyJm5KgeUXclx2IpGgYrcCpqJPHJAx
	 seYztLZhVYnuuw2RAFC+aqr2aDBLM3TWbxxZn9rBJ42HJyrJCOaWTh70wTkdjIiGOwU/M
	 akKh08EuKrl06dlw1we+ZL+dsUAMqmfG5QAP1JzFEOcUX0RzO1WeOe/h0xp9vqJ3aaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PvBuLG2b;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=doeMgxEf;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7D606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C7D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PvBuLG2b;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=doeMgxEf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793628998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sl0xAa/SyZWrBp9CL5o2SaCOERZeomQ7Ndnf7a0XFec=;
	b=PvBuLG2bQF/cZ/qi8GpW/v2IRJVctisKalowTF3VsY05fjJPKMfzblk0ldq6A/9K9nrUpx
	q3ZfQ1s3LNJH8ExyxVL4+a5gtyWJdv5Lt5STFNqDxgSHqDckNLeOc+AlCyFXqPByLr0Ivv
	nXpzqDCI8CZTxr5I9Wk3nU0UiQIJBPQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-1wn1VoEzM0ujQxz-FcETww-1; Mon, 02 Nov 2026 09:15:10 -0500
X-MC-Unique: 1wn1VoEzM0ujQxz-FcETww-1
X-Mimecast-MFC-AGG-ID: 1wn1VoEzM0ujQxz-FcETww_1793628909
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e6d6e780fso1429121f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793628909; x=1794233709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sl0xAa/SyZWrBp9CL5o2SaCOERZeomQ7Ndnf7a0XFec=;
        b=doeMgxEfgvWCyLilo9IkAVuAqeF3usowt3Apga80inLVI9yjjcz22i7bj3r+CrAJO8
         GKh3VCAaCaoJQsGMyQUDUiZWNWz0CgErZ3fnCB3raeEpea/5qdKA5z/ANYIH/Pn7iEs9
         C5uw8XJwlc6e30a5deJIb3/iSGKyjAdEZvIdgqSpoHtAy+CFyMactuF7Y7ZhowHc1mb4
         Qb8vJHbA6rRvAVABptP5eSVzdGhDYQ2/Q8pFXLqEGr/sQQhBuTv2s5syXrkOPWXpjppF
         WNxtuEztch9JEhwEdTK8Vp+ysLwAEYSPiDhMWtPwnDVaA4WuANaJu0LYyUd673mJ82eb
         Yxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628909; x=1794233709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sl0xAa/SyZWrBp9CL5o2SaCOERZeomQ7Ndnf7a0XFec=;
        b=NP7AwSBQeQhQxxtknfjF6RdtRcwpr91djTXi/+wTugeyLXE9CbwFLciwt0med9GaWf
         mmrg1GjkV8eY8AmLL6QiBWweg0qK4cOyQyj7BaM1wXMlRxPRcl0YmvPs3iC0CZnxQZiA
         bbV/FJ6UrugAD5+/18pLUVrxgUIJNByi8bmcF5bis8YgE6aYUs81vUFYgUnU5oWdVbyx
         lqNpSUsKE1x/vTDhZ/kok+xaFdKcwO1Mjd7M+MYhQDiih6dSP+V92Fga6EXfwVgGo7x9
         T2F1CqRQCefQrEjy0FenO39MbwHh12rgQXF21Mz1fk5b7KXisFWtmLmm5iCHvj5/WkiK
         eanA==
X-Forwarded-Encrypted: i=1; AKwUvBywt9CnyTSLsDNPPrG9/3tEe34EnQk0pNktl8AVswq2z846tSPQVJB0eN9WP4OlqsPinJn2YdoqKXUzfI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ME9Umdlix9jqY7L125uqF8nbfh7sLiNRb+ONOi2UCSs4vaQcm
	JYwjD6+hIQ4PBfc9MN+upIJB21rBj8COn357pRFZOsU6Rxdg2ILpwLrjZ5S631+8p83OvTW7HYg
	9ais6H18/9IM/CsxndbSVXxTC+JfQTtnS/5WRqD+sMgyAyk+sZW2g+XJl2/KIq14VjQ==
X-Gm-Gg: AYBFou1xu1LHDawyrTcyCzZ90jS6Tb/ZWkX2pI9yi5g4TC6pFOaFeDNOpGqXb6p/8dv
	077kUEO5DlXrNbitjyJGl9OjaMOGTAYF1ODgnngLpw5/qKf8kcILCj8pqUwj1IQ53EW3mdXm+W4
	tlex8zJuFJpJkWi+1/VsLR/fL46jKfXGdcbLQQiwWp4it9GVHImJBz6PPSM3gy6itdJjxZY53e6
	XzaEOKHcXUI3wO89+8NTK2C/ZG8SGCNlapcTyGBGIFyv/7r+Keuz96Ft11i5dYtktAAHeRfJDLY
	Hn0BYkaWa8lqMPAd7+j97WSWR8oO4S5A0aan+FNvD3rsqSaVIkIEdy+ZYztugjGszZSWKhIehWy
	1jg/dLLoK+e/LR1Fdzs5zErh2HIuL0tL1Xm85XJFllQ==
X-Received: by 2002:a05:6000:25c3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e6e517f2bmr20529286f8f.50.1793628909014;
        Mon, 02 Nov 2026 06:15:09 -0800 (PST)
X-Received: by 2002:a05:6000:25c3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e6e517f2bmr20529177f8f.50.1793628908269;
        Mon, 02 Nov 2026 06:15:08 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm20775864f8f.1.2026.11.02.06.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:15:07 -0800 (PST)
Date: Mon, 2 Nov 2026 09:15:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: Jason Wang <jaswangio@gmail.com>,
	Mike Christie <michael.christie@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	Asias He <asias@redhat.com>, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vhost-scsi: fix event queue iov out-of-bounds
Message-ID: <20261102091441-mutt-send-email-mst@kernel.org>
References: <20260904005240.502787-1-physicalmtea@gmail.com>
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
In-Reply-To: <20260904005240.502787-1-physicalmtea@gmail.com>

On Fri, Sep 04, 2026 at 08:52:40AM +0800, Jia Jia wrote:
> vhost_scsi_do_evt_work() uses vq->iov[out] after vhost_get_vq_desc()
> without checking that the descriptor chain contains an input segment.
> vq->iov has UIO_MAXIOV entries (1024).  A chain of 1024 output-only
> descriptors yields out == 1024 and in == 0, so the length check reads
> one past the end of the array.
> 
> With a host-side harness that sets VHOST_SCSI_SET_EVENTS_MISSED and
> kicks an event queue filled with 1024 OUT descriptors, UBSAN reports:
> 
>   UBSAN: array-index-out-of-bounds in drivers/vhost/scsi.c:611:14
>   index 1024 is out of range for type 'iovec [1024]'
> 
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x5f/0x90
>    dump_stack+0x10/0x18
>    ubsan_epilogue+0x9/0x39
>    __ubsan_handle_out_of_bounds.cold+0x50/0x55
>    vhost_scsi_complete_events+0x55f/0x5a0 [vhost_scsi]
>    vhost_scsi_evt_work+0x17/0x30 [vhost_scsi]
>    vhost_run_work_list+0x8e/0xd0 [vhost]
>    vhost_task_fn+0xe1/0x210
>    ret_from_fork+0x348/0x540
>    ret_from_fork_asm+0x1a/0x30
>    </TASK>
> 
> Require at least one input descriptor before indexing iov[out], and
> treat a pure-output chain as a missed event like other invalid event
> buffers.
> 
> Fixes: a6c9af87363c ("tcm_vhost: Add hotplug/hotunplug support")
> Signed-off-by: Jia Jia <physicalmtea@gmail.com>

Applied an alternative more comprehensive patch, credited you.

> ---
>  drivers/vhost/scsi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index 9a1253b9d8c5..9b5f07f52b0c 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -608,9 +608,10 @@
>  		return;
>  	}
>  
> -	if ((vq->iov[out].iov_len != sizeof(struct virtio_scsi_event))) {
> +	if (!in ||
> +	    vq->iov[out].iov_len != sizeof(struct virtio_scsi_event)) {
>  		vq_err(vq, "Expecting virtio_scsi_event, got %zu bytes\n",
> -				vq->iov[out].iov_len);
> +		       in ? vq->iov[out].iov_len : 0);
>  		vs->vs_events_missed = true;
>  		return;
>  	}
> -- 
> 2.43.0

