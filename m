Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620118;
	b=Gt+6se6ZnwpHJFcMYICfgjpGJDE/IVv1f1Cf5WsOlCHUXJWtIaEnvNKLRBNY+aDL7yMo
	 dZGBb8mY+nOv/ery6rtc6yi8vpFzyteF5+YD1xkjb9UcSk5q1oHUAVqyJA57YFbauMu3f
	 5ID0u/OaHcT5YZFfFaPcTcAL1fD+7zQbUI4hjHjCF10qFCJZB23pfnpo/C3LWB1xcDErR
	 h/JI9dj9VuagrigfHV5l6x6NJhDOY0YH1i7EHp2CxSva+hCj6VVyndHfeih2cfGISlUe/
	 E6AL2h7QGdpvAQ5BRF5I+o7NHAnAi1wqeN8Q8GeHhETJmH1LePGltRH1rmm4gmwh46g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620118;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ziwl8QBf1v7FFJqjlJ23GJJU3dSmhwP3y1Fomlh8GfI=;
	b=pSoUvETGbLIJeYSnCVfP3nxNnAd53Mzl1Q9uJHDoFqjWxt0iMgm9ZMxCXtij2QIfjNzd
	 wBs41RlocXIt68KIhg3A9QJur8Hw9orxMwCTb5aKCO0Kzu5j/uHEBcqQvvWIO8+aTdnz7
	 leD2OhLvwyV+WfJ43Y0G4BM9CCajbxlKmdlGmFeh1DemHtAJu0k3at/j2wb6FhYpJxKlr
	 B2xhrvCvK6DqzTw1wa7gL8H+Aeddue5fHnxvq91IutJXZQcJWaZFSZk2ZXTV27CqAdfz3
	 fVGnN62VpvElXi64bYYIu7b+ORVXyVsapcIyCDXpeqSMvTwzLumpJD27h3tE2maKYUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Ra1K/Gtf";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=M5T3WNw2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BE606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 017BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ra1K/Gtf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=M5T3WNw2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793620116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ziwl8QBf1v7FFJqjlJ23GJJU3dSmhwP3y1Fomlh8GfI=;
	b=Ra1K/GtfLecWrVIoEgS5pva1UMxdRS72Q1nIkpYllTb9/4pB04W+RPASWr68vpNQBkokXN
	C26dNiDBQi3MbLT3MD406EZKNui+2BIebEA7Qfed2uM56cLXnRTNNBJYeAkn+sX8lubM+8
	eBnrqMQGGidZs+XX4h89j8ysXonqDd8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-kwbyvuexNUiJboFSLB5siA-1; Mon, 02 Nov 2026 06:48:35 -0500
X-MC-Unique: kwbyvuexNUiJboFSLB5siA-1
X-Mimecast-MFC-AGG-ID: kwbyvuexNUiJboFSLB5siA_1793620115
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17741243eso22508235e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793620114; x=1794224914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ziwl8QBf1v7FFJqjlJ23GJJU3dSmhwP3y1Fomlh8GfI=;
        b=M5T3WNw2brO7ZwwLoa6OHEsP3GHO3BmqNYgjNAVqCOA5njl6h+bPeX2Jrko1Q7Lam+
         MZp/AX+nWcfXv9vpGQC4wnSI7Ta/UmUMsOLeePwwaf7is47mKTPhZkEEu0LlUlTA2b6O
         oKd5pyJgwisC1fR37qT+BauXIZa/dLGd1NgIV9anf0uNI7YRxEPdgawS6Ft64AXoZbxo
         zxDLAnu3tPeIdT9KqbF+dm6NspYi5rryh7h57jbznbkf2zzbCxcLgXwg+9mTb3A3lCkm
         jHw8fyR0ohy+6a6o0MLEgBFwkCn2bBS002pCsKBaFV+Tfg3JRpuHGizHqa81Kt9/hRWk
         m1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620114; x=1794224914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziwl8QBf1v7FFJqjlJ23GJJU3dSmhwP3y1Fomlh8GfI=;
        b=HCJ304yq+oe+jJSHxIJ9Csot1rPRFEp9fNpQR3m+T0Lk8Eryac6/H5hq8lxevM0WDh
         U/ho10yshblgCBxv7Aveucz4nM4ttsCZ5ElYyHQp1EVSlBr9eEeyZK/la7hntzf5y7+d
         dN+eQb7lzGZPloDwLgQPLJTtW0Gx7KLljLIdl7GVHtG2fyNaan86s+xiTDDblUpqmTBC
         R9vWWOz7KbbB2O3uteWrKhjq3rc3nSMIFpfvWQMVurZvO7t/5iLx597LGBkXjMWehOYt
         WgF3Qg28Vou4g2joW3GF5oK/TwHRD2ORiOMrf+7cyDmSC5S7c2TV7ovGB70Tcc0IIjAi
         7XCQ==
X-Forwarded-Encrypted: i=1; AKwUvBybJrG7OKMsr6FIAG5YYVJENXsp1FzYSTkS39KPGNQm6C6T2bPdCkdD6AhN9vYXh/SmxMqFHb6W05MV3bY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3hLK6dWl1brzReMeLxtnfw+Q533XaOcNixH8fRAbu/zrz2o2Y
	Z7p+STEaojrt6LbDEovLekaaTUt03KSNi5CzzQLfHW/zUXccISFN5LkDkdrchD7wQzKFIXNI8TZ
	+/o5oZD/RblFKivLbde0+Z7AvBO83im308a8QfgUhy6TP0m8CeRE4+HnZ9i7HIdijSw==
X-Gm-Gg: AYBFou1E1ET5ZngfsDZQNS8gdrWYmHE4oCpZ41hohj4Zoq+YarQTMNsPF/++3KHXcpJ
	egla+PFr8ReLeHSRpWi5NsJdCIhGeWfgZjeesJrmVHAcetPOzFaWfu+d3QLdOeY7BkI9Be29SMs
	thzwHzGzeH0399L2/OIbjQh7u00OLw3UE4XY7it5J+6gmjKzhxKgxR1j39TXMLJMxGx5o/lO21i
	2K9XVhh6lbtq15GgQFkRPDV+K/IXeBFH9yXZjsojnWesAFTNmwQj9PC8ojNpoUlpp8wUnLQIJI2
	vKoTs94iMDNgRI/TRA0B6ESRcnuxZxACPI3neaeVQePbExZXFC5BvY9r6rdYe+FKZYGaNvXJXlw
	G3e348AW12v7gusn3NZUJtLUinAWnfD2rdk/uniktsw==
X-Received: by 2002:a05:600c:46d1:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ac18a88fa6mr234177015e9.32.1793620114442;
        Mon, 02 Nov 2026 03:48:34 -0800 (PST)
X-Received: by 2002:a05:600c:46d1:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ac18a88fa6mr234176455e9.32.1793620113987;
        Mon, 02 Nov 2026 03:48:33 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm216985365e9.5.2026.11.02.03.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:48:33 -0800 (PST)
Date: Mon, 2 Nov 2026 06:48:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Hannes Reinecke <hare@suse.de>, jasowangio@gmail.com, mkp@kernel.org,
	James.Bottomley@hansenpartnership.com, pbonzini@redhat.com,
	stefanha@redhat.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH v2] scsi: virtio_scsi: implement eh_host_reset_handler
Message-ID: <20261102064501-mutt-send-email-mst@kernel.org>
References: <20260911164417.33860-1-ngocthang2710.1999@gmail.com>
 <28865bba-ac60-4c6e-aec8-64b1fcdb1c8f@suse.de>
 <20260914133144.15509-1-ngocthang2710.1999@gmail.com>
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
In-Reply-To: <20260914133144.15509-1-ngocthang2710.1999@gmail.com>

On Mon, Sep 14, 2026 at 08:31:44PM +0700, Nguyen Ngoc Thang wrote:
> Once virtscsi_eh_timed_out() lets SCSI EH run on an unresponsive host,
> abort and device reset both fail the same way (same dead ctrl vq), and
> since virtio_scsi implements neither target nor bus reset, EH falls
> through to scsi_eh_offline_sdevs(), which frees the stuck commands' DMA
> buffers without any guarantee the device has actually stopped touching
> them. If bus mastering (or whatever broke the transport) comes back
> later, the device can still write into memory the kernel has already
> reused.
> 
> Add a real eh_host_reset_handler instead. virtio_reset_device() is the
> guarantee scsi_eh_offline_sdevs() was missing: once it returns, the
> device will not touch guest memory again, so it is safe to hand
> outstanding commands' buffers back. Reuse virtscsi_remove_vqs() +
> virtscsi_init() -- the exact sequence already used across
> suspend/resume -- to tear the virtqueues down and rebuild them.
> 
> Verified with a QEMU virtio-scsi repro (PCI_COMMAND_MASTER cleared
> mid-write): EH now runs abort -> device reset -> host reset -> abort ->
> device reset -> host reset -> offline, then dd's stuck fsync returns
> EIO and D-state drains to 0, in ~244s total. No task remains
> uninterruptibly blocked.
> 
> Suggested-by: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>


This is not posted correctly:

- start a nbew thread do not reply
- against some tree which is not upstream

I papered over it


> ---
> v1 -> v2: implemented eh_host_reset_handler as suggested by Hannes
> Reinecke in review of the original RFC, instead of relying solely on
> the EH loop falling through to offline.
> ---
>  drivers/scsi/virtio_scsi.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index b4f20c487718..9698f4f91cc6 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -833,6 +833,8 @@ static enum scsi_timeout_action virtscsi_eh_timed_out(struct scsi_cmnd *scmnd)
>  	return SCSI_EH_NOT_HANDLED;
>  }
>  
> +static int virtscsi_host_reset(struct scsi_cmnd *sc);
> +

so move the function here?

>  static const struct scsi_host_template virtscsi_host_template = {
>  	.module = THIS_MODULE,
>  	.name = "Virtio SCSI HBA",
> @@ -846,6 +848,7 @@ static const struct scsi_host_template virtscsi_host_template = {
>  	.eh_abort_handler = virtscsi_abort,
>  	.eh_device_reset_handler = virtscsi_device_reset,
>  	.eh_timed_out = virtscsi_eh_timed_out,
> +	.eh_host_reset_handler = virtscsi_host_reset,
>  	.sdev_init = virtscsi_device_alloc,
>  
>  	.dma_boundary = UINT_MAX,
> @@ -947,6 +950,27 @@ static int virtscsi_init(struct virtio_device *vdev,
>  	return err;
>  }
>  
> +/*
> + * No bus/target reset in virtio-scsi, so EH lands here after device
> + * reset also times out. A virtio reset guarantees the device won't
> + * touch guest memory again, so stuck commands can be freed safely.
> + * Same teardown/rebuild already used for suspend/resume.
> + */
> +static int virtscsi_host_reset(struct scsi_cmnd *sc)
> +{
> +	struct virtio_scsi *vscsi = shost_priv(sc->device->host);
> +	struct virtio_device *vdev = vscsi->vdev;
> +
> +	scmd_printk(KERN_INFO, sc, "host reset\n");
> +
> +	virtscsi_remove_vqs(vdev);
> +	if (virtscsi_init(vdev, vscsi))
> +		return FAILED;
> +
> +	virtio_device_ready(vdev);
> +	return SUCCESS;
> +}
> +
>  static int virtscsi_probe(struct virtio_device *vdev)
>  {
>  	struct Scsi_Host *shost;
> -- 
> 2.43.0
> 

