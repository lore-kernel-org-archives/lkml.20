Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3B227EA4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356509; cv=none; b=Mv8VlJFY14dRNY+NUyh+OrAmS8EyXfJ67Pvg3ON3dat4zCKWBZY1Q1Th59nCdHSYIVdMFMtfS5tJJZLwI9n9VzDNQ3pnklxpCqJ6Im5I5yFbxLVdJiVqdUTiVpkX4d5bN2XhYcQCRi2BeBj9ffktYb5iuhduIQz6t0HbBSTCzFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356509; c=relaxed/simple;
	bh=r6mRzQhhJ88iS45AXaAovqfXVJ5jLdC6yvmI5FzNa2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mU72AhLao3y5u7o/7TQS1tcR1f5gTVV5e+Ze4Lrlmge2aV1CJaB+6f40DRWpGQjdAUW0Kyl2lGoCzn9OeBmRRcBxr7zFaZtFZLXiLyZtJG5taZfTr3uxKyRdMYhVV4qtZ8yRlSrwT4sJro4xDlR+/712V2LVx4Fps64K7oOEoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DxR7/TYq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HQHjp8gW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DxR7/TYq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQHjp8gW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788356504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BRhy8W81mqy36OEvhVyBzZ3Evc0oZiCvH7zL9mD3AoU=;
	b=DxR7/TYqf/Evufv8kDJcewe18KLZdia1UyWqXLmifl9/aQuTnvuRrO+GzCe7weG8PB5hCb
	yq7RLRyfBOQXsn54NlOsrm7HmQigxX4ERM/jSnOkEbx7aPeOhpN+lngzbdr/gSYuau3EYL
	pYzcR32XpJ+HuuGeIKvRgDKkvtPCaUc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-yvyQi2zXMQWg78aZ_g-35g-1; Wed, 02 Sep 2026 09:41:43 -0400
X-MC-Unique: yvyQi2zXMQWg78aZ_g-35g-1
X-Mimecast-MFC-AGG-ID: yvyQi2zXMQWg78aZ_g-35g_1788356502
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955e865174so5134605e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788356502; x=1788961302; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRhy8W81mqy36OEvhVyBzZ3Evc0oZiCvH7zL9mD3AoU=;
        b=HQHjp8gWNOPDIdj458Gcdqlr73bGkyaAOp/n+qImZUz2t/dXKTTLyo98whJb1ERs4E
         EJNpbSTcqBdvrc38f9WsBL9nDvjtZ2LuPMtXsfp5ocO5D9nMOW2UJiInajg388owEPGx
         powwVVCrthyywVFn+R+CNinewBile5QhAB36gNEJeUV3Hu8NlmRLiCdtu6Lpo+jWGLTZ
         sqjpnJdAfN41Eqe4UVScQZ0yHzPDGbinbIFkm0oIVFkgZwuhnSi2WWviz23m/BIInWfr
         jSGH3JIT7vSJRl6jSSHS8ZhR5XPXj7h6An6lE6PWfgESojjqK9esMbRchCSxgVnENWc2
         WL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356502; x=1788961302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BRhy8W81mqy36OEvhVyBzZ3Evc0oZiCvH7zL9mD3AoU=;
        b=UXLNGTc5rhF241QJ5c7BZLLcdCpN+mDlxM1LUzZeWYkJ/noDhTHqPwdtHq+MmwiiJL
         8Pj1hHcFnq5Hqk94xu0doALlzMV2Ksf4g3pfxI6FQUTzacNl99RgjYRVPk8whJEm5sZm
         JU4OAL4TRnDlN/faf+LR8Ojr/9/NHkemN8yEuCxPCQFr9J+s6mwEhWP49mr+7oInwbQG
         v+I2lmiDkARc4HRvKO1NWfpx8Wv7dE1ivy55YUngEOPl/U4H0u1f72RDpl/3dYtfstnx
         XewmzJShiYGminHPrbSeFz0LMn0PMOtNcXhbc/+je2zzEJTVZnWlQYlQTa+3lzuxu3w/
         dXCw==
X-Forwarded-Encrypted: i=1; AHgh+RqZCxhOp+g3IWUYrpsFgX8cD3VySsaiVGlpYlz/eQ+Kdietc9dBlKKdWellLMQSyEipjl4Bjzdbz6s9/U4=@vger.kernel.org
X-Gm-Message-State: AFuF++m4+5D2I1cYcO/xqqZkHQ6lG8cWIBbIoA/MCDz+jHSmTNaVQOsF
	bdOAohQDM94iDZAc3tPGeT/leIvCW4SA4IYnVhbHAzSlJDyfmbe1hcJMHkeji5/2SdiW5qlfE4E
	2PcntEo1F34eROggOdgiV2wK/rhlA8tH6JzDFqeEys4lD/HP7DRUY1eo/t9Zo42EQhw==
X-Gm-Gg: AR+sD10Kp+qc3QxRZoZVSo1LwDYBvvWqFkq2INbpxLEbbttRu5Jre/JzTLwSFnZ8DmP
	/l69QPrkM53xINSduKhS7DjLtWoX8KobIqDUMyiSB+5N2DV5h4V4BfdU8i883yVtNOOdM0895Yx
	DqkwPLEl/6ykhaC5krsPRB0ZhgDX8ROZ+qOb6GX5FZQFhdK2ALmikAR0uCx++dWT5HY1W7fzKUh
	z+lEm0nNd0YJ2sU8GYR2wzvLjPdwMxZHcNQZ58BsX+tnl1L9LZiGI3Oc+3HyTQqo6XYjjYXlcbG
	yiu1TbmPsRsc/VPl5iAKVz3zFmhMFnMsMXAqs8qazXknd+EH6+Aur5Bkaf8hxr4SvDs=
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr85207725e9.16.1788356502289;
        Wed, 02 Sep 2026 06:41:42 -0700 (PDT)
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr85206655e9.16.1788356501767;
        Wed, 02 Sep 2026 06:41:41 -0700 (PDT)
Received: from redhat.com ([187.15.128.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b456sm172790195e9.2.2026.09.02.06.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:41:40 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:41:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, jen@redhat.com,
	virtualization@lists.linux.dev,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio: add =?iso-8859-1?Q?Eug?=
 =?iso-8859-1?Q?enio_P=E9rez?= as Maintainer
Message-ID: <20260902094126-mutt-send-email-mst@kernel.org>
References: <20260902092459.1983909-1-eperezma@redhat.com>
 <apgahfkAdwYcu_5a@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apgahfkAdwYcu_5a@sgarzare-redhat>

On Wed, Sep 02, 2026 at 02:48:58PM +0200, Stefano Garzarella wrote:
> On Wed, Sep 02, 2026 at 11:24:59AM +0200, Eugenio Pérez wrote:
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > ---
> > MAINTAINERS | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a19da74d00c..a92c5712d8cc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28877,7 +28877,7 @@ VIRTIO CORE
> > M:	"Michael S. Tsirkin" <mst@redhat.com>
> > M:	Jason Wang <jasowangio@gmail.com>
> > R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > -R:	Eugenio Pérez <eperezma@redhat.com>
> > +M:	Eugenio Pérez <eperezma@redhat.com>
> 
> Should this be moved up before R: entries?
> 
> BTW thanks for the effort!
> 
> Stefano

Good point.

> > L:	virtualization@lists.linux.dev
> > S:	Maintained
> > F:	Documentation/ABI/testing/sysfs-bus-vdpa
> > @@ -28954,7 +28954,7 @@ F:	include/uapi/linux/virtio_gpu.h
> > VIRTIO HOST (VHOST)
> > M:	"Michael S. Tsirkin" <mst@redhat.com>
> > M:	Jason Wang <jasowangio@gmail.com>
> > -R:	Eugenio Pérez <eperezma@redhat.com>
> > +M:	Eugenio Pérez <eperezma@redhat.com>
> > L:	kvm@vger.kernel.org
> > L:	virtualization@lists.linux.dev
> > L:	netdev@vger.kernel.org
> > @@ -29009,8 +29009,8 @@ F:	include/uapi/linux/virtio_mem.h
> > VIRTIO NET DRIVER
> > M:	"Michael S. Tsirkin" <mst@redhat.com>
> > M:	Jason Wang <jasowangio@gmail.com>
> > +M:	Eugenio Pérez <eperezma@redhat.com>
> > R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > -R:	Eugenio Pérez <eperezma@redhat.com>
> > L:	netdev@vger.kernel.org
> > L:	virtualization@lists.linux.dev
> > S:	Maintained
> > --
> > 2.55.0
> > 

