Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B31E214813
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785331; cv=none; b=Wt+Irm1PU1BrSuHa4X1i8L9wsh496q8HAuawTuc+n/ySvRQ+GH/6Pt7lJXrPJHhNsYl47+jqbL7QofDj8rL3vMSwRALUiyoDpjtVthm9MGN9r7xItX1BAUOYNbMW14pleOeKdjb0F6bDTOiU1AYAGAYR0hS1rPqvw0DyqRuEuIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785331; c=relaxed/simple;
	bh=cosHv8xyr0t36btszO5L0e7U/LiWe3xxiHukHmufOB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgKYqlvK7EYYPrdM8hSzpwETEFtDae3o67d5tD91L2edIb4wdLuzZnSgalf+LBxXNDxgO0Wroo+RXhNaL59zTDc64txbQR/tlGi338qhcAT0zarNgH8n6wVlDSZBtWamAP4+SfQGKVRG45n/XcSny6NIfy+psiRTpdKrcuOpiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J45YA/B7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EFBIxVKw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J45YA/B7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EFBIxVKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791785328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4GRhXvDSJMGEbosLzlxSFhMKfkKZMp2xgG1/1x2ODX0=;
	b=J45YA/B7+WuCkye1ig7y1UPcvvJOHKqyr3Uz8XhfoabJQQULvVcr9ki1uB4VO0CWMUi4K+
	sQMMuDavndKVLTycnnqxPZU/qt9LBK2V1lIMrmqq21aczW6vUqGgFL0tE8kLS0gs0ccOPM
	hCCFw5rQr+KkLl7Caoh0Kib26hgEMwg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-MXs7NoXqMkaP-Br4BaM2yQ-1; Mon, 12 Oct 2026 06:08:47 +0000
X-MC-Unique: MXs7NoXqMkaP-Br4BaM2yQ-1
X-Mimecast-MFC-AGG-ID: MXs7NoXqMkaP-Br4BaM2yQ_1791785326
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c4649b368so1303552f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791785326; x=1792390126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GRhXvDSJMGEbosLzlxSFhMKfkKZMp2xgG1/1x2ODX0=;
        b=EFBIxVKwERNgqjdWeK41lAljydWruwSsKSgtSxBQdP8zwSYaE5JX6vSYAsBl2vzsXT
         O/9/mZPjMD7hYkSQD+1qgyZbStBXfsIrKgI+pCyNYXc3vUGcHKoggmyefags0P1Dw3f+
         2BmLkQTwr/YRYs9MOoNtQqOgTDr4jsrQWDlw6zjfIKjHMDj4Uk2EYVsNkC9qXxT8o3IO
         /kPneb75y2WdcFl0tsdMBZcOvQQQabH7bpqqnCJFEjgMxOBaNNOIS//UqAPc+2p5VOm3
         eAXvLAhGOMN3ocavk8wnX868z7w3+fRnbR7b+6HfXHVLefxQ8PaApieZMxQ1v78vwGPD
         2lZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785326; x=1792390126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GRhXvDSJMGEbosLzlxSFhMKfkKZMp2xgG1/1x2ODX0=;
        b=CdT2J5sPGusFXXKmbgE9J6PjMpcJmakx/d/SvN26pjPdQeXsD2k8hQUuuHTLOWBx+r
         GrkYTmhWE4dgnx992v3YNT+PIkw7lnTGU0EC/opKcKkFG9iHal4lZR8ed7hwi6ThwcPO
         sL/vU0Z9ZKSUoYlz9LQXU/TPzdvpqklZqIE1x7t+dY3tqJl3KAo7IFLD+Zpx+dVG9IoR
         +vqQNejaw/sSb29aVvDfMja9M/HlPUrIohZKB5nwF2bQd0oE5oHkfSXC5G2OkXoT74Ld
         SaKXSME7tNSAoPTbVrdo18NL2GMMSAAQ2EplRxVKgufxj+bCNVhx7a63lNGlq+Q6SI9l
         4eHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqJjXTcvb2DROSlSNAZBq0jrnkTpFxuOW3ZgHcOW5wOTOJt4Qsv81QVZvARI5qPwInskSy/DgS6dY2svA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyTxhYlF1RhxVhzyeXvD4HdNCwRSnDe1vSo817Wsg78E3xRtZu
	HKfGAhqH3lysGG+O6MqH7mb610lCONgsDGGDxt/TS02yCXh1Qd4jeaxZOusYvqKmz5GPsc1UlZ2
	DYuhxt0+d8oUqx36pl916cDVTUMSDM2Mfb7G+7/P9aLF9B2PNKOjpQogukxlUab3cew==
X-Gm-Gg: AYBFou0sc6w57IYjgNjdw8ZFxgMhrCOs0OeLxdyKUsJfD/d/b8bfyspGJhZpX5PhZKV
	bCGvc5eb7u/ezYMmAisgXxITfxFbKwJHV+rAdcT3zqBtCw2ojB5qoYKBYcupZVGEHdvEjrtJMDv
	iCnwMeGXNO/iL+sj3EzG+8MMu5jf3K5nLMixLgYoMXY6FmRZ+z7wg1MY+d6iO26zjU00km/c0JB
	8z6kb8ZqmZ9opUvqCX/GulSxfk/t3+t8GQUUMJ+8V1UqLzndwcyGXN+e0DCnxsRPMMx6xmmthR8
	uTHua5bA7j8V7Dz7gB5yUWu+o0+VbmZ6L7Nzn73MuyJCLwDH+qr8sJVSi6B5SiWhz95yYg==
X-Received: by 2002:a05:6000:26c6:b0:48b:10af:f85e with SMTP id ffacd0b85a97d-48dbaaee1admr14696056f8f.33.1791785325703;
        Sun, 11 Oct 2026 23:08:45 -0700 (PDT)
X-Received: by 2002:a05:6000:26c6:b0:48b:10af:f85e with SMTP id ffacd0b85a97d-48dbaaee1admr14695991f8f.33.1791785325117;
        Sun, 11 Oct 2026 23:08:45 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c38f4sm19939856f8f.27.2026.10.11.23.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:08:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 02:08:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: Mike Christie <michael.christie@oracle.com>,
	Jason Wang <jasowangio@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] vhost-scsi: do not count PI bytes in the data length
Message-ID: <20261012015950-mutt-send-email-mst@kernel.org>
References: <20261011014803.100454-1-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011014803.100454-1-physicalmtea@gmail.com>

On Sun, Oct 11, 2026 at 09:48:03AM +0800, Jia Jia wrote:
> vhost_scsi_handle_vq() moves pi_bytesout or pi_bytesin into the
> protection sgl and subtracts those bytes from exp_data_len.  The length
> passed to TCM is still exp_data_len + prot_bytes.
> 
> prot_bytes comes from virtio_scsi_cmd_req_pi.  With
> VIRTIO_SCSI_F_T10_PI negotiated, vhost reads that header and does not
> check that the CDB is a READ or WRITE.  sbc_check_prot() replaces
> data_length from the CDB only when the protect field is non-zero.
> target_cmd_size_check() leaves a write's data_length unchanged when the
> CDB size is smaller, so a command that does not get that replacement
> keeps a data_length larger than the data sgl.
> 
> The KASAN report is a MODE SELECT whose header had pi_bytesout set.
> The data sgl held only the parameter list.  spc_emulate_modeselect()
> walked data_length and read the next physical page.
> 
> Pass the data sgl length.  Protected READ and WRITE still take their
> length from the CDB in sbc_check_prot().
> 
> KASAN reports:
> 
>   BUG: KASAN: use-after-free in spc_emulate_modeselect+0x145/0x380 [target_core_mod]
>   Read of size 1
> 
>   spc_emulate_modeselect
>   __target_execute_cmd
>   target_execute_cmd
>   vhost_scsi_write_pending
>   transport_generic_new_cmd
>   __target_submit
>   target_queued_submit_work
>   process_one_work
>   worker_thread
>   kthread
>   ret_from_fork
>   ret_from_fork_asm
> 
> Fixes: 9f977ef7b671 ("vhost-scsi: Include prot_bytes into expected data transfer length")
> Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> ---
> v2:
>   - Drop the claim that target used to subtract prot_length.
>     9f977ef7b671 cites 14ef9200, which is not in the tree
>   - prot_bytes comes from virtio_scsi_cmd_req_pi


you can mention the other patches you sent fixing
security maybe this will calm down sashiko.

> 
>  drivers/vhost/scsi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index 4f8c0260bc9e..4bd29c2ceed9 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -1534,9 +1534,13 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
>  		 * vhost_scsi_queue_data_in() and vhost_scsi_queue_status()
>  		 */
>  		cmd->tvc_vq_desc = vc.head;
> +		/*
> +		 * exp_data_len is the data sgl. prot_bytes already sit in
> +		 * the protection sgl. Protected READ and WRITE replace
> +		 * data_length from the CDB in sbc_check_prot().

this is barely readable - could you improve pls? even if that makes it
a bit more verbose.




> +		 */
>  		vhost_scsi_target_queue_cmd(nexus, cmd, cdb, lun, task_attr,
> -					    data_direction,
> -					    exp_data_len + prot_bytes);
> +					    data_direction, exp_data_len);
>  		ret = 0;
>  err:
>  		/*
> -- 
> 2.53.0

