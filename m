Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E269381B1D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817546; cv=none; b=ALdN8Db3mlx6lYwMUZxkhSMeb9hvKdDIYHtVNNBgp+P/HA4E5cdkpc1zPjC0nHx8tjK9cXad1ho7OCPGb6u1JI4OZRQpqLhtLqvbPWEbDblq0z0lgohYQTi6yieUBcPbCeSOzMgMJUmO3bl/YpDjR2he2tvtaHp5R1cMqrLxn4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817546; c=relaxed/simple;
	bh=2z+7OZ/8s1izu6DqIUIRPHmKWhBimeDK/7uC8qr1E7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfchE2bNVuXCXYPEkjLeQ9WX5AjgVoTfPk3VaZY7JH2O+uYMnfWH1G+hyJhK+Za8xg8/sVRvMTMZVA/jMmj92YCFsU0PoEGJ2XG9HWsKkuc9EmGHt+5BaUZbuRxrqS/H3rrfrq7EJlgmqGtXkqzt5pHpz1fLL2KWrRaaXJVdJN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpwmahTA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4SmvfJ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpwmahTA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4SmvfJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788817544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zgpCJtcUJEpX0DtKX/LyNeVmPwd5hRkpw0WrWcgdUoE=;
	b=MpwmahTAYyQ89vHVma42WXiGuRo1BE2OnexMfVTykeGZ0kMBQr0SJ6UtaJFGz0VJa4dx3w
	QSvNPGa87iNDlG+zPT8Zx6jm7YS0GbJMfc5FV8AgWM8qh7NoJRD9cqik+WyWU+4izPtJF4
	o1e73vYAJDvs2xrbA2URKMJzAwmfy5M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-RpOjRNU9OkySsDGW1Xvqug-1; Mon, 07 Sep 2026 17:45:42 -0400
X-MC-Unique: RpOjRNU9OkySsDGW1Xvqug-1
X-Mimecast-MFC-AGG-ID: RpOjRNU9OkySsDGW1Xvqug_1788817542
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495529a93f9so38360965e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788817541; x=1789422341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgpCJtcUJEpX0DtKX/LyNeVmPwd5hRkpw0WrWcgdUoE=;
        b=S4SmvfJ77MAFDEUGQsnnE+x8f7LKNr+cs5swa89tQaqIqAfX3uuQMktHsstIqN9HMm
         Pm9wXEJm8ArMizwVoark0mAzjoiJC/dtzFsDnxpVEUu/GUQ8z0w+5l2566JqCehdimB1
         gHRV2JTQEqGN07wtfnPRijSHRVoKktOnX+ooxuWTUkDFcRDz2sPMJ7oaYURl6oQbpkkt
         n6Okb0TRHnqjZVTiQsg46fv6WaE5jQZNehxs+q6+AMxARETwcw8NSmmPuYQtOy5AbXo3
         3OCschM7IktnwMP9967Co3Ow7nezezu+EwEpMQd5zNGBZizygywfGcQh06zoclQZADI+
         MCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817541; x=1789422341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgpCJtcUJEpX0DtKX/LyNeVmPwd5hRkpw0WrWcgdUoE=;
        b=WylhHJltgXEiUOIbJxILkJ/0Y/RH5kqh6/CV3bY4EAxX4/+xaTQK+KJiUAOrQ/KGW4
         mxJREizqOkQWELg3D49o+zzhf7kt7dIq4/58eUUXW6aDOzSA+DAisMWlUl4h5Cf/fUm3
         tx9ZsaiYTqQ62/09jUhLoh9AtBf8jdM7xJdYu/c/HcimG7DnOB3F1fohyaD2y/aNIimB
         q/cOlzWTRhiD6IeTYNtCebmhMtFTNHs80t+kQFA8jD2DI+nSG9wztT3IVhD7RL7iuxlO
         t3aPD+yrfUfJtwuSfO+SmlCPCKvxglbEB0F5KFsfhk31u00gxLEtZVRlVQ2QLKEgIxfw
         3b7w==
X-Forwarded-Encrypted: i=1; AKwUvByeVokJbLO4Ujoi2skplxW/BKh+6x/fZ2SZJsmFEf3FU9aiUIhCSjUxCGQlcBm1wJSQiShxFBMG+8rnYsI=@vger.kernel.org
X-Gm-Message-State: AFuF++l3E1KoKBnAHfXPXp7eAJf4PF1eIK750CmOltTKpDuCu/pwytZq
	Vgqq0rxUbRRQcyezdeFtq81pShhlGMxd1qmvDkGngEcdFXBQ2BaBILlCTRLNHamFQPkvcU7GcC0
	P628X4xCqQVWiFukVWmxL/+ZNeu1rU5ufeFGGpmhWS7CDhsX7qFch6U6aFu2LqEe4ew==
X-Gm-Gg: AYBFou3ELImfnLvjVby2la1yAiF7mLWaH/0GA705g/JfW/17DiIoxq6D96nomhAkZJn
	td3GgoeJIxZ9l+lVuX5dK8Y9SchN8tUg3jfc/ZNRnVxK7ZrTrjHl0lETJnRNe19gRiLZkp1ubkv
	UwmsClKocaumnPFGOG2aVsH65vNkrkecLQPKIeazvEazfps1T9yzW4ZemckCK07BbaZfsboTTQ7
	AWcHnRwnwxKGMrE9i/UiN3Rt9zu6/z//+xomhU0filS8reR8ZJ+8SzIZW8MstLkZMzozGsfQ3fO
	ibLURlhpEVk01xhY6+ik4PjN92l2WjRbgbq4uS+pBXi4TrtaQwb1cWQ5R/DUR4ZXRY7hdGuNNXX
	j7lZZ7ghIZyskzMN8p7uc3Qg=
X-Received: by 2002:a05:600c:524b:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49cfa20cd2cmr231525235e9.31.1788817541429;
        Mon, 07 Sep 2026 14:45:41 -0700 (PDT)
X-Received: by 2002:a05:600c:524b:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49cfa20cd2cmr231525025e9.31.1788817541017;
        Mon, 07 Sep 2026 14:45:41 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm242068095e9.9.2026.09.07.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:45:40 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:45:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Stellman <astellman@stellman-greene.com>
Cc: jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] virtio-pci: return IRQ_HANDLED after non-zero ISR
Message-ID: <20260907174523-mutt-send-email-mst@kernel.org>
References: <20260904141318.30278-1-astellman@stellman-greene.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904141318.30278-1-astellman@stellman-greene.com>

On Fri, Sep 04, 2026 at 10:13:18AM -0400, Andrew Stellman wrote:
> vp_interrupt() reads the ISR before dispatching config-change and
> vring handling. Reading the ISR also clears it, so once the read
> returns non-zero the interrupt was from this device and has already
> been consumed.
> 
> Currently vp_interrupt() returns the result of vp_vring_interrupt().
> For a config-change interrupt with no vring work, that can return
> IRQ_NONE even though the ISR was non-zero and the interrupt was
> handled.
> 
> Call vp_vring_interrupt() for any queue work, but once the ISR is
> non-zero return IRQ_HANDLED.
> 
> Tested with QEMU virtio-blk-pci forced to INTx using vectors=0 and
> pci=nomsi. On an idle device, 200 config-change interrupts were
> generated using QMP block_resize.
> 
> Before this change, irq_handler_exit reported ret=unhandled and
> /proc/irq/11/spurious increased from 0 to 200 unhandled interrupts.
> After this change, irq_handler_exit reported ret=handled and the
> unhandled count remained at 0.
> 
> The issue was found during an LLM-assisted Quality Playbook review.
> 
> Fixes: 77cf524654a8 ("virtio_pci: split up vp_interrupt")
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Assisted-by: LLM

tell us which llm and which agent pls

> Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
> ---
> Changes from v2:
> - Repost as a standalone patch in a new thread, per maintainer request.
> - Add LLM-assistance disclosure.
> - No code changes.
> 
> Changes from v1:
> - Return IRQ_HANDLED for any non-zero ISR, as suggested by Michael.
> - Add Fixes and Suggested-by tags.
> - Test the change with virtio-blk forced to legacy INTx under QEMU.
> 
> Full red/green test logs and the tested v2 patch:
> https://github.com/andrewstellman/quality-playbook/tree/11ba61d/evidence/virtio-pci-intx
> 
>  drivers/virtio/virtio_pci_common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index 10371ecbc054..b90c174450b2 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -120,7 +120,9 @@ static irqreturn_t vp_interrupt(int irq, void *opaque)
>  	if (isr & VIRTIO_PCI_ISR_CONFIG)
>  		vp_config_changed(irq, opaque);
>  
> -	return vp_vring_interrupt(irq, opaque);
> +	vp_vring_interrupt(irq, opaque);
> +
> +	return IRQ_HANDLED;
>  }
>  
>  static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> 
> -- 
> 2.43.0

