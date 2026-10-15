Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E4313E0D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071037; cv=none; b=d/9dJPAWgcGyX6nRm5QTwGsT7bD2e8hD9SjHzdGzQEK+3fomZJSoEqerChJzdHxr8H7Ct3zVMszK56BmDrfnqI9fYnlXjdHdFwQP6bY2VhW7cuiSUv24Y29dYI4YV5N2pM+866qiTysUgVP363/pf20MJa2FLf1FyNWiwyEpOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071037; c=relaxed/simple;
	bh=cwW617JewnF8m+D1Vc8i8JYYQvrKn3pSl1v+w1CVZhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0U1D3bKH05Qp4gHW6nrSJ3EBPGvztPNsSz6msAL2fozB9IZ2Ju3P5RpJ8TiFe+bMs2Nwy2FLtKauXSQzpQuxQKPKFbhFqmHwaJhN+vc9I4aW1/n/aA11XpoAYHABygxhdNjSsmkw+wQjeujXER6MfoiwE9ogFNiVhd7XPFJBic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QlNitezl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T3E+PAvo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QlNitezl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T3E+PAvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792071032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uoo2tu2S9XmQrr+C0lJWQJpw+2qkSB2NHh3Sjnut3aY=;
	b=QlNitezl5pAtgfIHKboPjGqZ6liKlqvzl4IA9OUlM3LSj9epvjz7+SfxUwnbiMp3TQjvHI
	KIXO6mzHi1iVIQ2eknz8WXvDa2D+I+F/PvU+gK+pYhRZLPdKaa6Zp2ekw6VhAWPHvEvS77
	Rg9V7CasTmgkgjt/QByompjv7LDvc/k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-NT52VjruMZ2E2Gubx3__fw-1; Thu, 15 Oct 2026 13:30:30 +0000
X-MC-Unique: NT52VjruMZ2E2Gubx3__fw-1
X-Mimecast-MFC-AGG-ID: NT52VjruMZ2E2Gubx3__fw_1792071029
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b0a199b20so4373872f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792071029; x=1792675829; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uoo2tu2S9XmQrr+C0lJWQJpw+2qkSB2NHh3Sjnut3aY=;
        b=T3E+PAvoof1bJGSQCQ5V9V/MbDy3Q8y2FFh6MCA7CpKJHynEk+NGccVw1Web6ZUyBc
         RG5+paW9vnjrUxvoRvQK73ILCPfVaVw0E/oDJ4uGrFkwOg/9ZXDZwMav2jvmaMclmUKn
         fLhVS37DV3Fgo8CD48z+NB+sTope1zRukInGRUQqdziTZ0usTds/yx+VJN/DQsxsWSlE
         PXXBbmFKR60FqEkRw0oRHXFavpnWw/1EHLT4GqXXA9AAREIUsNLsaQ8AlaOMjb78l9xg
         XYpT1AfL6hW0nXkODEFDdP9TeBnTfWulKSid0uVNH30aAdX3PcBb7b9AUtT0Aqkpy7vJ
         jPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071029; x=1792675829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uoo2tu2S9XmQrr+C0lJWQJpw+2qkSB2NHh3Sjnut3aY=;
        b=QP09rbAjfjKThfId3eRuseTVKOwpYJIPgBqAa/hAH3NBwI+2vFMBAD1cEXOAeRls2I
         lbehIFc2btxKFqtclKl2znmC1d2YO4gL8TMq/kfcSUQxST5ufcZ6lJ0DF27eewiJvUdb
         pD8AwIVuYwEJIx3OoKIMP/V+XA0bssYAp0F5JEKexLr+s/fHhKzsdmtEYVcSc2hSXAfC
         L/dRRDZ+Ddx8NnvrMngjO6IZ8wo4kZlBLbpb5CcXDMxZJo8NRnVQO3Az1ABPLEJHwGzX
         0AMbWGd90vLHXQ4vak5sykCku7BorDRDuzH/pXi6yFyvAvpgbPp6bUeQ1g/jbQMLZFLj
         bFYw==
X-Forwarded-Encrypted: i=1; AKwUvBwBib9VXgW8Efh8K5XQgOPpg3BSA6eLMjDObqBWfm7cR4BlC4mpKjPvNp3aTDnbMHfwqvhUqEDKMk4nOyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7LDEuqCCNjgQH1uuDA7hoiAyTP9l08efpLR7lBYGpIVmZ0QPc
	tNx+LxIncSRB7+HdzCGc3Y+GSaKHrlV0ssSGXJpNXnlPou8UiQVwbCQMgxnihi4RodxicjUeWj8
	jwT8TTiu041GMwwbjI8Bx+f4zKpWIl1761eWJz9qEZQr4j0IMxmXYBYb9Ya775duPSg==
X-Gm-Gg: AYBFou3BURrKj72xjtOhmvNeEpR8WPNS7HHS2RH3EA12z7JUM/t+OBp81v2fk5cRiRU
	yxlkdv4e0BocvP28TJfVUoiHLVj7TldeaWpCc0TGuJXoA3IHnmNi10mLNSM0eC4uBJY3DqA5cqS
	hoF+Po94XyuWucxrzCf7CGSkCR9s6+yMCL9nnEe5c8fUvbdGs1132W816vyM3+zYNyyMSmUttwk
	xiUxqbEMa5YLqGmkJtX1T0B/JVgjGC8i4ay/UT241ydAb79+VxajUTljMH2XY9VDSQOI6UVgu4k
	uZwqTAw9+RmK46EbiXh4Y4gWRr1XanLW1AF07GRUVnrQj/XP1RdCObboL95AWlHCrKn/6Tl57bT
	qVx5ERw==
X-Received: by 2002:a05:6000:984:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-48dc29e4118mr32903776f8f.33.1792071029044;
        Thu, 15 Oct 2026 06:30:29 -0700 (PDT)
X-Received: by 2002:a05:6000:984:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-48dc29e4118mr32903697f8f.33.1792071028315;
        Thu, 15 Oct 2026 06:30:28 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.147.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm18997598f8f.19.2026.10.15.06.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:30:26 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:30:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: mst@redhat.com, linux-kernel@vger.kernel.org, 
	Laurent Vivier <lvivier@redhat.com>, virtualization@lists.linux.dev, 
	Jason Wang <jasowangio@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add missing virtio/vdpa/vduse/vhost headers
Message-ID: <atDSrbtSsWL_3JDp@sgarzare-redhat>
References: <20261015094049.107999-1-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015094049.107999-1-eperezma@redhat.com>

On Thu, Oct 15, 2026 at 11:40:49AM +0200, Eugenio Pérez wrote:
>Several headers related to virtio, vDPA, VDUSE and vhost were not
>covered by any specific MAINTAINERS entry and fell through to the
>catch-all THE REST section:
>
>- include/linux/device-id/virtio.h: not matched by the existing
>  "include/linux/virtio*.h" glob, which only matches files directly
>  under include/linux/ and does not recurse into subdirectories.
>
>- include/uapi/linux/vdpa.h: the in-kernel include/linux/vdpa.h was
>  listed under VIRTIO CORE but its UAPI companion was missing; the
>  "include/uapi/linux/virtio_*.h" pattern does not match it because
>  the filename lacks the "virtio_" prefix.
>

Maybe we should tell to the agent to avoid useless info in the commit 
message, I mean it's pretty clear that "include/uapi/linux/virtio_*.h" 
will not match include/uapi/linux/vdpa.h ...

>- include/uapi/linux/vduse.h: there is no dedicated VDUSE section in
>  MAINTAINERS; the driver lives under drivers/vdpa/ which is already
>  covered by VIRTIO CORE, so the UAPI header belongs there too.
>
>- include/uapi/linux/vhost_types.h: the VIRTIO HOST (VHOST) section
>  explicitly lists include/uapi/linux/vhost.h but omits its companion
>  types header.
>
>Assisted-by: claude-sonnet 4.6

nit: the suggested tag in Documentation/process/coding-assistants.rst is
Assisted-by: LLM [TOOL1] [TOOL2]

>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> MAINTAINERS | 4 ++++
> 1 file changed, 4 insertions(+)

Anyway, the patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


Maybe to be fixed in another patch, LLM here found also others files 
related to virtio/vhost/vdpa uncovered:

Other virtio-related files not covered by any virtio/vhost/vdpa
MAINTAINERS entry:

- Documentation/ABI/testing/sysfs-fs-virtiofs
   Current:   no section (THE REST only)
   Suggested: VIRTIO FILE SYSTEM

- Documentation/userspace-api/vduse.rst
   Current:   DOCUMENTATION only
   Suggested: VIRTIO CORE (already lists sysfs-class-vduse)

- include/trace/events/vsock_virtio_transport_common.h
   Current:   TRACING only
   Suggested: VIRTIO AND VHOST VSOCK DRIVER
              (next to virtio_transport_common.c)

- drivers/nvdimm/virtio_pmem.h
   Current:   LIBNVDIMM only
   Suggested: VIRTIO PMEM DRIVER (lists virtio_pmem.c and
              nd_virtio.c, but not the header)

- Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
   Current:   GPIO + DT bindings
   Suggested: VIRTIO GPIO DRIVER

- Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
   Current:   I2C + DT bindings
   Suggested: VIRTIO I2C DRIVER

- Documentation/networking/device_drivers/ethernet/amd/pds_vdpa.rst
   Current:   NETWORKING + DOCUMENTATION
   Suggested: PDS DSC VIRTIO DATA PATH ACCELERATOR
              (only lists drivers/vdpa/pds/)

- include/linux/mlx5/mlx5_ifc_vdpa.h
   Current:   MLX5 core/IB only
   Suggested: possibly MELLANOX MLX5 VDPA DRIVER (debatable, it's an
              mlx5 interface header)


I'll send a fix for the vsock events.

Thanks,
Stefano

