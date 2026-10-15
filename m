Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD64C9DE3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061320; cv=none; b=f5iErgCWO+NWMeH6+4vJVjmv6Mx8hwvo0+7HTJy/Frgr2WKY497P9qmQeW/Z4yt6vRhAd/xWVbrD+YRPpq8P4FpSbapCfVKEB5+ShHW5FIDQrCe7IIq5q3UTXkje+6+JWActgWs/ivE1luQ02pfz8thU7pnp/39Ialb/TX1MvhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061320; c=relaxed/simple;
	bh=VX6sQX6GQHichPhOMPIXa6BfOMoiMG7jcarCI7tpgVE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gz2ph4gZwB+O18rLDiN6GaUpRefvrq314vCUB85kv0O7xVzOfhOjYJ3bXXGIWW+IjKiYGy6NXruPhhlFnCSHw3Y8q61veIXOuu0WXl8CeEvbZkmnScgubQczlrkpemNhB9ZM316XAZHzvpOvbwrAju3W+i2JohfxqAqL8Nt2uXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rw5QHONG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0/lvOSd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rw5QHONG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0/lvOSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792061318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vP2T14fdZ9XceyUCbSqZEpcWzH3VTeyPfkjXOwntFs=;
	b=Rw5QHONGbMtOugYPHkQq/M6bz+bNEJgXEYjxzI7LGL72uNxdtXEBZ/j0whRaoyfUMtybp4
	dXNwADkFwxhjf3SVgYtF1JoDv7bF5d4iEgcbVCNZv7IKEc+2XibheOHQyT8vPgYbylchCM
	gapWJ0Mb4XOyUBwT42j/8CGwCsm6pK4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-dKSRCjXGM5aML6cqM0tSfg-1; Thu, 15 Oct 2026 10:48:37 +0000
X-MC-Unique: dKSRCjXGM5aML6cqM0tSfg-1
X-Mimecast-MFC-AGG-ID: dKSRCjXGM5aML6cqM0tSfg_1792061316
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso41512605e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792061316; x=1792666116; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vP2T14fdZ9XceyUCbSqZEpcWzH3VTeyPfkjXOwntFs=;
        b=H0/lvOSdnAlg9lFaDpEl5e/ACg9AbnjOsAvjPyQ6+HZhpQuynRfV4PR1U1wEjUK8Zu
         gad6nXN64IAhovE/e7Gi2peP7tVsIOpxEpRfsmL4IQDsQ2bVeFsDCnvLXC1+nA87h3Qe
         I29OdrcTSarhkHnDYzsY7VVydhZS3A92ZOGoBKdXDcPG/c5xuK0ixG8aIRGZFdnRMS1t
         ZgcF71O8MwEBQnhBmkVVhvAafHCNXdGI6EZidIkUX40feOC+8gIQ5r95pMk1MaLRwd4/
         zyDrfswllSDLDAPMWejdN/MUUIEI8IhhnbbZ4zG+G+ZuRmMDnQ33H74ocj57J3FKH6fz
         dLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061316; x=1792666116;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0vP2T14fdZ9XceyUCbSqZEpcWzH3VTeyPfkjXOwntFs=;
        b=k37uqRdVUwiwhiAgz155CZujhf8nfpbQmQg0fLo5NWtLX2qSvPHb+lZNULdbZgA2rd
         jNDAAvmPJBbIurcGMEMPUcLiOfIYbadWtyX6GAehSTr7t8r0Zgm94OVlxt3++lkMVMfQ
         WwbsA+w2WehvZ8RJGg+4GW2AXZt2XV0OuQ3JVLwBdHM/zGsRMM37QXg6OWo5uf65IQOQ
         kJBlGt5q9o6fdO3eckZlHyRuhdGn/19/NNvpjG1R6gsxF9YBo9l9DA0RlxIG4PLOD/VU
         pnB9tapRw5ZpuJvsIX8UG05tDxGeeNxzhzyZFrQkWwDD92kknIRyT82+JVetf2wL5ek7
         c4jA==
X-Forwarded-Encrypted: i=1; AKwUvBwxeBzft63blK5SR9bvUm350IB8NvrOnDW1axBCNZ6FFiFhEGHo8YmaDY4wXnrt7pLRAeEgl5hnt++xmHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/39Lc7geBVRasIFAn5qLcr0beGa71TyYfDwLa5AD/AhOTLoP5
	bkcUbBh7DZtkrx2yPwuuHSQujyUzTsQnaZCZuJz5gE+77NTC1jvgLSDGgNv94Vu0qDLfKMOBpmK
	ZSz0snvMptEoD5o/7kIYlIjrgVdAPyzVjf3+fVZDu8vgHv2igKp1KJEHEmsLHKbSPRw==
X-Gm-Gg: AYBFou340tAQMFrUTvyNzqIdiBs2Y/7KB4kl6W0AMbZHtkIeILhtmWSSxoiVKyiU4O/
	SYOOxlNhyPH2u4XahRWm+pmw0fouvzILeBmrJFabt9/U0L3xzLH9xUQbJtGNEcr6xLi7xVLliQD
	Ne65Ydpb5yGMJ8O/L9jQm++Djqpj13MJ0Vzg8GmBv2OhvTQUw7PjTDCaFRHCVLlf0MWBM4th4Zv
	oqinhV7NgBqSioaPp48lvm4a0GIUC+ifqfbVa9gwBPOdpLydQ+qNDbcSS1lIBKE3c4pj+9iLNgA
	3N6NsjV5MnEjm87Qt7egSNDZtrjGzwhZ03JxD/oLFMvyHIsYO1soHWn8+pIZRYbPh9dHoZLZv5q
	N0MyMsaV+iVoCJ8dWzvNUPty1UzDDpsD2B4TeGV1mnNwiXvA3EyF38j3Pczeo0MK2rw==
X-Received: by 2002:a05:600c:6285:b0:4a1:70da:3350 with SMTP id 5b1f17b1804b1-4a18e4b8c6emr349772815e9.32.1792061315955;
        Thu, 15 Oct 2026 03:48:35 -0700 (PDT)
X-Received: by 2002:a05:600c:6285:b0:4a1:70da:3350 with SMTP id 5b1f17b1804b1-4a18e4b8c6emr349772275e9.32.1792061315579;
        Thu, 15 Oct 2026 03:48:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm58389045e9.8.2026.10.15.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:48:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Julien
 Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/3] drm/bridge: ite-it66121: log an error if the IDs do
 not match
In-Reply-To: <20261015-drm-ite-it66121-log-probe-errors-v1-2-7fd6994e0be0@bootlin.com>
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
 <20261015-drm-ite-it66121-log-probe-errors-v1-2-7fd6994e0be0@bootlin.com>
Date: Thu, 15 Oct 2026 12:48:33 +0200
Message-ID: <xlv1v773fddq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Luca Ceresoli <luca.ceresoli@bootlin.com> writes:

> If the IDs read from the chip do not match any of the known models,
> it66121_probe() fails silently, making troubleshooting unnecessarily
> difficult. Log an error to clarify the failure reason, showing the IDs read
> from the hardware.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

