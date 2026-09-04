Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0D3D47AA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556519; cv=none; b=GnWy6WwTNBrlV3AMb+5YY7JufIfsQBuOISSZzO/4Ol6pLcR2gaZzMZlJJIfPgR3tdf3nteaJDDS/yxxt8eMPTQ0v0c+5yJA1R01B1e5CiHvdIDG/LrTsit5E7/KldxCy/q3FL8Zvg4vk2bbSo/uNBEPFPz3smd3NNPjRUrTtsxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556519; c=relaxed/simple;
	bh=pyvo4LUWHIIfbPUmZcKO1ka6B8u8qSTB1nr4VyPHxMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pn0CoHf8yT5ayGjXfy42eMzPQOmXSmUgBM0MQDN5waz1DCKnrLTPVdTXkOiezdpWRhxN1u4JyKptkVV3cWGHvA6mMXtDPJKqpW13AXCGuPJDT0D3fEQGqC5GZSqBv5GeiInO4C73TOC7gNZ+CDRdGgthhqXeShM9U3Jhv8eXDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dbeq7sfy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m/Y7JZx5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dbeq7sfy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m/Y7JZx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788556513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1LRYgJkhKXsg+F6WlQSfLdN/TvDFXG7GLQTKhRs3og8=;
	b=Dbeq7sfyhuekV3QOzeda/NWu6DCcP4QQeXsiEv/2jA3dV3Eefs2DnFyjuIT6VCFuCjSzPw
	nAVnv8ddZMSXlnQ7IPk3IyvEY/yxY9w6pnAhCTs17m9J4SFfajRcVUdrwuaHcWpbosdGEV
	7zlkoOxor+OpHnziGgzPP54K7GsEtOQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-foNeYQKrNSeMb8DizLF1Kg-1; Fri, 04 Sep 2026 17:15:12 -0400
X-MC-Unique: foNeYQKrNSeMb8DizLF1Kg-1
X-Mimecast-MFC-AGG-ID: foNeYQKrNSeMb8DizLF1Kg_1788556511
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49545071724so10739505e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788556511; x=1789161311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LRYgJkhKXsg+F6WlQSfLdN/TvDFXG7GLQTKhRs3og8=;
        b=m/Y7JZx5G0E+cOdwvokeY9EQHG7KJqKtDx3WCMZ8IzD8dBKVSF6bMA9Shb/icaX98M
         U8aR8ci97N5Bp9vLZK0UcZV/buYd5ycpy+/87yqF1s8aIl/yBNngQzzYusyrcaYty2Xs
         RP2vBgEMs9WIYsWa9yu9qGKUk30XCX/Y7eI+ej2lrnPQ+ogHjClsAJY/sz9/csfltVxJ
         ssTbcskTc0bSARNz99ojF6MUG2wYfOoZXxPG6fRp+MfMEDFdJJPhsHNy84hjJc0I15YV
         Ucugnep3cwK9cpionCSEK+SvMesU2zsHdZE81UlQ/iYBcciPBbqhP910PlojCA7pzMcL
         WbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556511; x=1789161311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LRYgJkhKXsg+F6WlQSfLdN/TvDFXG7GLQTKhRs3og8=;
        b=IfMr1Lw1jtutNgj5JC2ej9bxt4HnQ6vC+FCXZcFMpzmKpDqoTArjereJGlFvCpSNWi
         7tA8HFfm7NWji3ZwAfPBJdsVhbaTFWx0CagkXJiqSqfrvVkV0SVb1djIWGhdDta92sIi
         9c5NnPeZiLsx9vt5lF/AAfrAjQcB6sGqL2rB9WgJz6+xb3bkn3bHKogkPLCxkAxyQi60
         06e88D26E3o3bdsDkJLwvCoV0EoT/7bpUQGaqBTZrVUp7xzl/TISHXoyh+9ZlTZd2e/e
         Eo8oRFO9CrvU7qQAHQFRIP9vDeWNChvjTUeeWzZR0ZOOeBkl3VYnwu2txMe4+0G7ipJU
         9oog==
X-Forwarded-Encrypted: i=1; AKwUvBwKWCPd7Yd4UZavDGRuxyQgYF0eh82AHD+nWh/jRqPy+GwJ7FTE6tFsmzhZu1FtWJVf9a9Ys1ajKEm76bs=@vger.kernel.org
X-Gm-Message-State: AFuF++msYd1+d9qkkMOgoc6/x0yZtdnHERC1GWEHjJpoRc4WUgvm02Pv
	RpG4zW3rFWFsO+i6YqSkcLKJ+uai1mGJZPFWqpcj7lzIzzHIOQ0GhNeFtFAF2STDz6wXjdjC9tI
	Yw2r29hLysBWDhF+I+5LUlVj8/iW9/OPaDc6Hyf5n8U3GqmlWVw927ZLqT59f4pmLLA==
X-Gm-Gg: AYBFou192giYXG1ChZLJPe0C+NjO5U1hsA59mXJerm/UIoXFEAU4XSynRh0lmrdOsyR
	IRTLGiJgdRvHuhq5htsaJ/Wo07YRx71omKw865DeycWLYUw2ATa2BmpD1lYnLmCdpOXEPmRXGZ7
	GInlB8KZMMQbxMIYnZLjPHOvrdXZs5dLQcflRd0nryEi1vqTbENhKiJZ56gPqAUv6CjD0Y7b2Ah
	zIEWH8cT1U0dQKy/M9fogbZ9yqv5dw4uVVGj6JDIV/hUGxB2VIDYM9/Yk/9lAjdkA/rwEDHsvCx
	7IsDFV/kth3Y/k+LM08RZ1hvxZncP2k11j1Cx5TMTd8tZzz2elcEoConZyfAFSeX6aTnD2yHJPf
	Kc8Izb8X1ZASuRX9W4NGhMgY=
X-Received: by 2002:a05:600c:8b04:b0:49c:fc6c:be11 with SMTP id 5b1f17b1804b1-49cfc6cc0c3mr56808225e9.23.1788556511136;
        Fri, 04 Sep 2026 14:15:11 -0700 (PDT)
X-Received: by 2002:a05:600c:8b04:b0:49c:fc6c:be11 with SMTP id 5b1f17b1804b1-49cfc6cc0c3mr56807965e9.23.1788556510730;
        Fri, 04 Sep 2026 14:15:10 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm217094745e9.9.2026.09.04.14.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:15:10 -0700 (PDT)
Date: Fri, 4 Sep 2026 17:15:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Stellman <astellman@stellman-greene.com>
Cc: jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] virtio-pci: return IRQ_HANDLED after non-zero ISR
Message-ID: <20260904171336-mutt-send-email-mst@kernel.org>
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

this is still the wrong commit to blame.

> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Assisted-by: LLM

This is not the correct format. See Documentation.

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


I already did exactly this in my tree, no further action is necessary,
but I will add your tested by tag.

Thanks!

> -- 
> 2.43.0

