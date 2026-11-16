Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817107;
	b=PTLfMXlhvTV4CjeCX0uHlQumCX0KZO8m6JmcM1SBQ22g+9XJ1qQMzadkBHkdPsN3Sjg3
	 fOwDjZ3jiwaAnJhFTRrh6F4CNCW7Yl/SpzIa4hOh/2tu9f5GunDT7hZVtBTBoEvgniF1e
	 MWddYs0pqsJDaXfvZWy+t/Fa/8Sk73Xv7T5/ePCSopgN+B04iEQUeWNgjQM76dEw0rowb
	 LvyZAA6RfZeyVng0/tjKSMu/1wMrwk98/e5gcmkajJv1oGv493ML5ypE4RjtbeM2Pmhbz
	 CpEn7y+tDzW/lYuBh7EGzHPmzfEb5k+/Z72eVViInFhJu16tQy8finnEsP8b+rNLMHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817107;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/MsxKHT1v+wbsuT8knl2lByYutV0BQaZynJDwVTf7Q8=;
	b=kTslAKKeeOyyyoqGjrKycxZfTAfdOBt/tK+xRTTFnEBeYAX33R40qAloeWDBWbA8+rIR
	 EO+zC3lWFkADdaaUUd7qNjj/CtU8kxfZkMCa737Kw/qG/QL3UrmQfZ1CNV9l7S5CHfvRt
	 kc+OEIZR28wLmZuBQb88ZK9Fq86v+OXTnf3iR5dKixlEl+5gR96DRuByC6JbnS9oi7VRf
	 W5kGmdznW0paDGydIc+By1VgQF+mxS0jeGxEpYRXgfcFnzMh2zb/LZysPuGNC0HeKkEiv
	 SJyGCn9bJ9Tg2fkbRfMfk6c7IGrMPyRa7r/fSaRpzRUgD8oufEbeQkzJrUCNR/ZMWVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VPy25xh8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U1YORAeW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2B606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E2B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VPy25xh8;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U1YORAeW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794817105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MsxKHT1v+wbsuT8knl2lByYutV0BQaZynJDwVTf7Q8=;
	b=VPy25xh8KWskD9Vzf9ch16EDrB9ITsqyptN8gu+jtuZbT5z4GJYCQ/NW2Lma5zPezJglsE
	+v1daWHsc98CQbN2Z/8PA1EEUBHBX+RcBpwlqYqzyhF+qq80Yrd7pAbJ+F7lqTiI0SHZTU
	79T7G62S3Mvhs33owP+3LYNPKRLvTTQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-7APmmuS7P86rwi7hFONOqA-1; Mon, 16 Nov 2026 03:18:24 -0500
X-MC-Unique: 7APmmuS7P86rwi7hFONOqA-1
X-Mimecast-MFC-AGG-ID: 7APmmuS7P86rwi7hFONOqA_1794817103
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso17836955e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794817103; x=1795421903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MsxKHT1v+wbsuT8knl2lByYutV0BQaZynJDwVTf7Q8=;
        b=U1YORAeWCWRVN6XHfIEYmCvNlgwoWFN9HhF1gszSmlriQftYjfALR/epGOpQ+30kjR
         P14bf7yoXr7BSIfw0t+v+yU9iJivxdWLwxRp1MognoPNTfK0XffujICw38sg1Fk6Ibjh
         kEFuxAwdM3MCg7SMu9FOaFGNHSDhUOqhe/JkPvRi/FK7jd6VQBQNvG+fjMIkev6zN+Gq
         MdZxPL8PbcuEVjX7xLYAq4A2HeUpGaua6B9GbtPFDDovScdrC8Vn+Rm1MMEe4D2mUm4V
         ahnTQG0LkZ44EfgyumfC4E6IuFp2EsxYEQLKjJljiOXcSbXnPap9wv1XQiirlAUyI6k2
         KK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794817103; x=1795421903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MsxKHT1v+wbsuT8knl2lByYutV0BQaZynJDwVTf7Q8=;
        b=uiFdzaETcXEddtquJOG8rjGjlstsTLPPqJWv07K4mGY5KY0COdIoftXSIL/L5Ty4N7
         m0FmqWYzc02iaB6bnpFi+rl+I0U3cfCTf++yep4VUoTfBcW7kDpWkmsUDeS7Xu1yWuJX
         Nxaj1/3+RRhptGB9RwOUgm28/Dy4yyQIjv5GiEI38tuLRd+Wf6mzchAxzgZoowh0rcEy
         6/S2Fzm3zZTU6R3GNSSy/rupfYQ7nIo2HJ5hHQIHi8P0Ewt+mRphI0BNbQ2LyFET72LW
         VZItGH8+uAPkHdcqAZNPMWset1jY+pcE0YzaBHjFMS1xWIs2ZexuPKQ0OvAJOMSOaLcz
         CBYw==
X-Forwarded-Encrypted: i=1; AL+hErGnqzeCtwJARrjpaowAgWu5XAUYeVCNqX1xLH+V1YXSad4Pi/xLtDzr0i2ng1oSgn66uXzAKGOlF7gbDg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XygSJ9KH3aiHPLyVc26RnFJCCt/csAiZh7vzXzD128ZkEsgHT
	aewOfLSJLkmRE32V0b+UX2+FYhD7HKpuHWfI2RW64S3S05Ihzr0fSsZQozjIKKJnfUxOpza7AJq
	wJUyaQ9RXgg+l655rls0gfaZc5dLyZtQXrPPZtTksXNa1DoJCtk521yMjMxNm8bOJoQ==
X-Gm-Gg: AYBFou0JwVbmJX8azCVmaC2hegdNJifnpknw98zhJe05El8uJs3TYPWXUCCbOERjh6h
	0q6o+q2BVcxzrzkU90bz959kqYpcI6W0S70/lTWhGip7/LfeGDQE60hW/b0sRfUldOU84GUtECb
	Er62siCZeJeEoVE3bTuY2vb4eXwvWLTi/hfXTKXC7Bu0eZlLkD0gjeOJEAy/VlfiuGBcGD2NPBQ
	QvpNsMdGAeOpxMWnwXXyFIL8+CpzSFPJFk2A411mrj+3CnDkGa2LkDmee6fVdFQxdKnwZrhOs+Q
	nRvDAbMJ0G+77sOYZ0C2r9EZhmZK1Ym2NfWqUR8mZfj0j9zvFcM5Kc51nSfsD3dGpHRcd1MUN4f
	ZJU/8pD7zPpZ4bKF82A3X/bTp8A/jUawJ4vyHAIYaFg==
X-Received: by 2002:a05:600c:3ba1:b0:4bb:6847:792d with SMTP id 5b1f17b1804b1-4bb68477c2dmr108079585e9.20.1794817102832;
        Mon, 16 Nov 2026 00:18:22 -0800 (PST)
X-Received: by 2002:a05:600c:3ba1:b0:4bb:6847:792d with SMTP id 5b1f17b1804b1-4bb68477c2dmr108079055e9.20.1794817102280;
        Mon, 16 Nov 2026 00:18:22 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb64ec7b58sm207200255e9.5.2026.11.16.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:18:21 -0800 (PST)
Date: Mon, 16 Nov 2026 03:18:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] vdpa/vp_vdpa: Wait for device reset to complete
Message-ID: <20261116031658-mutt-send-email-mst@kernel.org>
References: <20261116030152.1704527-2-oss.patchbox@gmail.com>
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
In-Reply-To: <20261116030152.1704527-2-oss.patchbox@gmail.com>

On Sun, Nov 15, 2026 at 10:01:44PM -0500, Yuho Choi wrote:
> vp_vdpa_reset() writes 0 to device_status and returns success right
> away. The virtio specification requires the driver to wait until a read
> of device_status returns 0 before reinitializing the device, and
> virtio_pci_modern's vp_reset() does exactly that: the read-back flushes
> the posted status write and any in-flight device writes, including
> MSI-X messages.
> 
> Without it, vhost-vdpa (or virtio-vdpa) can go on to tear down the
> IOTLB/IOMMU mappings or reprogram the queues while the device has not
> yet finished its reset, and may still be DMAing to the old virtqueue
> addresses. The MSI-X vectors are also freed while an interrupt from
> the old configuration may still be in flight.
> 
> Poll device_status after writing 0, in the same way as vp_reset(),
> before freeing the IRQs and returning.
> 
> Fixes: 64b9f64f80a6 ("vdpa: introduce virtio pci driver")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> v2:
> - Drop Cc: stable, as this has not been reproduced.
> - Rebased on current mainline. No code change.
> 
> v1: https://lore.kernel.org/r/20260926211507.1330179-1-oss.patchbox@gmail.com
> 
> Like vp_reset(), the new loop has no bound, so a surprise-removed
> device that reads back all ones would keep it spinning (the Sashiko
> review of v1 pointed this out). I kept it the same as vp_reset()
> rather than handling that case only here.
> 
> Compile-tested only (x86_64 defconfig + VP_VDPA, W=1).

If you can't bother testing, why should I bother merging?

>  drivers/vdpa/virtio_pci/vp_vdpa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
> index 646efd9384fb..eba82ff253ea 100644
> --- a/drivers/vdpa/virtio_pci/vp_vdpa.c
> +++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
> @@ -8,6 +8,7 @@
>   * Based on virtio_pci_modern.c.
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -236,6 +237,9 @@ static int vp_vdpa_reset(struct vdpa_device *vdpa)
>  	u8 s = vp_vdpa_get_status(vdpa);
>  
>  	vp_modern_set_status(mdev, 0);
> +	/* Wait for the reset to complete */
> +	while (vp_modern_get_status(mdev))
> +		fsleep(1000);
>  
>  	if (s & VIRTIO_CONFIG_S_DRIVER_OK)
>  		vp_vdpa_free_irq(vp_vdpa);
> 
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
> -- 
> 2.43.0

