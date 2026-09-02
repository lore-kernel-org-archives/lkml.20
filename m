Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FDF43F8A5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353348; cv=none; b=p3UP9UMi4/njK4sJUL3t0sNSHT7Afa8m56/c6jxq/r75GkYlRheXXSX5RQgCOg35SvSsA8OlrheGxjiisXKW+qepG81ALSLtBZ1tuDTg+fh4/4XJlwXPvswGdKeemcJJohhHEtJHqUdkMmSuTOunGkHDEQlGbtoZsIwxhKlI4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353348; c=relaxed/simple;
	bh=W9k5cHk+Q9N4x4Oem4NuCeYy3xZ0p2ZMnnX3leIXLm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhzA+IVohCsvwOYoS4Rm/0l6CmY+Yl1PumPJiLja46bpvUIamMrzNiJq77CE93RKSi5txZmkZ2aGMx/MqJ1PK9nT1lmMuFxltoTcmqNJKWQPHx8QGE/BxZteF/8sjLpYS7xoKfEC6RuuIo+31IneobxoFXjuT92gKJNvy4UVOXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWH8bZsd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2ZkHuH7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWH8bZsd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2ZkHuH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788353344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lfd8/zwjOXKARscoyEL5q/2LpUM4smemvMzZyMNLMO8=;
	b=KWH8bZsdwRUU23C+UENiF26jwykyrPhxPt5X9ULWFJHZbK2Vv2CoadJua6sg2BxkILRnQE
	raDw8a1HodkzzpuruawJ4Vr4e+br2EWHHc/TFemV8L5yALO1KTlFuvT6aOCkwza7duOMwS
	4Q53gHXei0gw0wgjDc5aPelxnT/HUyE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-S6POGrglO6efZlFT-bdbfg-1; Wed, 02 Sept 2026 08:49:03 -0400
X-MC-Unique: S6POGrglO6efZlFT-bdbfg-1
X-Mimecast-MFC-AGG-ID: S6POGrglO6efZlFT-bdbfg_1788353342
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b7c1dc61eso9196925e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788353342; x=1788958142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lfd8/zwjOXKARscoyEL5q/2LpUM4smemvMzZyMNLMO8=;
        b=e2ZkHuH7ufKHFJHyhXj4+Va2UFkWKCDrhv6pCr3Pu1JK3M2yslaLv/YBMH4iwvHkDP
         AGv+36mY5T9f/FfMrK2eRL5gktHK9ptSz/302xwPGcMXTg97ZyKuf0jBGn/R+55HPHrP
         SDdAWmLzJXCOH26+aw8F+kgOoNRnuXspth3I5lrIET8tKH0/8QfqknKve1qhu1QA8w1i
         ElWivSdeyZzFhNvN/Nn0X4SaUbnq2QzuZid9SxypGK4eWJSHCmKw4pXVt8ZeZcUDA1F6
         scws3Kk5OT/2rN0Ykw8kEUcO0IecE7CpPvFy7Lp2YnWtRoEKTJrkj0q7CiKaaFWBjT43
         v5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353342; x=1788958142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lfd8/zwjOXKARscoyEL5q/2LpUM4smemvMzZyMNLMO8=;
        b=ewBxUEosOgc4xs/2AhWmTGPwB9ZEQ7ayDo9dQy/1nVOk9ER8LV9w/d9w+1y0QxhKoX
         bXEHzMpFQdxheEAK9SbvmAfdfqeVPWhJ2tESFBKvErf8dEbKZzj3BzTXtpiPyNGYpkeZ
         S53soizoreFa2afhJj8MSNd0j52HrSn28UK+tcmnMGe6tJA1MW+kJQ66dqNukGSYCeNM
         mmpbr3T97fPBBnnK2Y/Q9m6W2Uz+z3eyopP6qKIh/5S3SrXgsiJBquvF+H98dsEiRt7k
         Gi2FAJk5qnjmUizWj2S+dy0Wvl7+9JiWu9/3TvEcXOXzqyGsMEdrXgogxwwIK9lq2sat
         1/Tw==
X-Forwarded-Encrypted: i=1; AHgh+RqX6cRrps1X/IEXQBmt5Qenug00qepv6d2lzvxMrm+Kin94lx69STrMFXKQ95w+eDCIosEZHNT+7ztlUck=@vger.kernel.org
X-Gm-Message-State: AFuF++nV4a8Hc0NnI9RiQa1E01nuf6jbYxZEHM1zzH44DEnZDJBSTFr9
	AhhXjw8swyWo/Mg7ABhEunV+bYZPX412oTMpMDlx6TLQ3OfDAmgzZH9cCcG8BLERJmagqqfFgwU
	ca74VzjRU2df2u292Fy6HGWzByW7SSxFA3J8YXdTqoirDt4IQqsVrW4/8Zo0hLChuAA==
X-Gm-Gg: AR+sD10bUM3IAHptorSLLwwpap8v3Jm/462ok+Y9NWGUv+cTAvJ8xxaO2iamBo5UHJt
	5bP3hggzCC7/GCOEHbVWwgW6TGNnVeVNYewkSvoYJd04yhfmyxNA+pnrCEDY3DHRAdy/kSkUFHl
	tN7xZhBECzdM/UResZ5sgCwPRvCWbTV+9ECO1yM0qnUTCrEelHIg4meqyHuSBlJjLRbCj7/koTr
	Q7lmm8JYQ+lWQqsrj1dL0QW9xfv4nFMc7EZjPylFgZVHaa7s5hbMRUhqTfxICqXaMrrejmh6lpj
	HJ4da53k9NmSM98rxzsujPLls0h2m9W+nkUBYzHKvQVd2BWujct73h3PZ4Y45x5Cfx4iF1f+XY8
	t9Az7BNyVHov7ZkluqfoY1bEc+cyLlG300mDl5PMi4JdWNA==
X-Received: by 2002:a05:600c:8705:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49ce58366f0mr83354595e9.16.1788353342224;
        Wed, 02 Sep 2026 05:49:02 -0700 (PDT)
X-Received: by 2002:a05:600c:8705:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49ce58366f0mr83353405e9.16.1788353341664;
        Wed, 02 Sep 2026 05:49:01 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b456sm169105265e9.2.2026.09.02.05.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:49:00 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:48:58 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: mst@redhat.com, Jason Wang <jasowangio@gmail.com>, 
	Laurent Vivier <lvivier@redhat.com>, jen@redhat.com, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio: add Eugenio =?utf-8?B?UMOpcmV6?= as Maintainer
Message-ID: <apgahfkAdwYcu_5a@sgarzare-redhat>
References: <20260902092459.1983909-1-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902092459.1983909-1-eperezma@redhat.com>

On Wed, Sep 02, 2026 at 11:24:59AM +0200, Eugenio Pérez wrote:
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> MAINTAINERS | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 3a19da74d00c..a92c5712d8cc 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -28877,7 +28877,7 @@ VIRTIO CORE
> M:	"Michael S. Tsirkin" <mst@redhat.com>
> M:	Jason Wang <jasowangio@gmail.com>
> R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>-R:	Eugenio Pérez <eperezma@redhat.com>
>+M:	Eugenio Pérez <eperezma@redhat.com>

Should this be moved up before R: entries?

BTW thanks for the effort!

Stefano

> L:	virtualization@lists.linux.dev
> S:	Maintained
> F:	Documentation/ABI/testing/sysfs-bus-vdpa
>@@ -28954,7 +28954,7 @@ F:	include/uapi/linux/virtio_gpu.h
> VIRTIO HOST (VHOST)
> M:	"Michael S. Tsirkin" <mst@redhat.com>
> M:	Jason Wang <jasowangio@gmail.com>
>-R:	Eugenio Pérez <eperezma@redhat.com>
>+M:	Eugenio Pérez <eperezma@redhat.com>
> L:	kvm@vger.kernel.org
> L:	virtualization@lists.linux.dev
> L:	netdev@vger.kernel.org
>@@ -29009,8 +29009,8 @@ F:	include/uapi/linux/virtio_mem.h
> VIRTIO NET DRIVER
> M:	"Michael S. Tsirkin" <mst@redhat.com>
> M:	Jason Wang <jasowangio@gmail.com>
>+M:	Eugenio Pérez <eperezma@redhat.com>
> R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>-R:	Eugenio Pérez <eperezma@redhat.com>
> L:	netdev@vger.kernel.org
> L:	virtualization@lists.linux.dev
> S:	Maintained
>--
>2.55.0
>

