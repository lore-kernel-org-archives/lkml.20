Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB1381E85
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161620; cv=none; b=UDGuLrUGJxr3Bzn6pku7nVPm/qilKsZB9KCh5uTjbB3ZceRRYK7t9nNSzxf90Fav2n42J4jd9Iu8Nx/ZACKUFBmiTfq6+9fH9OqWpAblj0pvyYb+qdUHFT5jV1plM2xxRCOGy42HTe/Suc8uuLFNvnagFRB5ere9rfnnBz4PRgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161620; c=relaxed/simple;
	bh=RCHAL0lzCqQvQNb2FKlrU6gKEOcCvPQaZQ8kaXzV12o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlQorEoc8J1dlGNnuXp0Fgnili8ZYViyp0/2RlRfV5qJi6J+glPrPqwCDPseZe21/hfBqwCCp+nf9JvvjD3EC0bBZ/inBkLd0ZJbJfUgJk2Xxm7cE2tmdvGPT1G1b2FNh/jrVM5IdzPm9zqrYoy9yENe3yxr/2OzVVydekkINR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeFDGhbs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4kiJldK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeFDGhbs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4kiJldK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789161618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uu0NQ9lViNj2uc4OaUGE9Tv4kMpxfHFXYrk4Ng1zNOs=;
	b=VeFDGhbstdtviqVCO/iwPRFLH4BVc4awAdmU3ov3U3lu4hHuY3GUPUVvFvBhyLspSyeKXb
	Fu2JPB/4K3kbBDl/814DikwKLCfXUOFKq/QkO2MpuANfNaFtT8qao29XDGyPwzea8o05OS
	yOOtNBQqml3ns3ugK2GHROTuLRg8CUo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-9NgfeGjSMzSocyWlEiGMTA-1; Fri, 11 Sep 2026 17:20:16 -0400
X-MC-Unique: 9NgfeGjSMzSocyWlEiGMTA-1
X-Mimecast-MFC-AGG-ID: 9NgfeGjSMzSocyWlEiGMTA_1789161616
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f4bff865cso738373f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789161615; x=1789766415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uu0NQ9lViNj2uc4OaUGE9Tv4kMpxfHFXYrk4Ng1zNOs=;
        b=Z4kiJldKKAkt++FebgFQg/Cax9Gi1pzgxxv1DpKiKNKpGmSG5F2obvhUUWl3W4v624
         z8bT2mdHbKx1OBdz0ytj8FWUozKOYZL5pkryYKWYOFCVyV+H49ilLUwV/PeG1aQhli9H
         8NLc/MYrbh7ET+/yvdUtnzTHeJidRIvlxqypKppBhyBSd8iQsgtHiC9aSGdfALWJGrpe
         SjdGCDRh5nXM5FXF53Cud3X26otshNa8FrLDNnMUrqVdpNp0+EVBgAn6hZlg8oFtUnUM
         Lr6bMsPNJhVax72rGDQ8tBz5z95hH16JGzz4OkX0oHT8xe/VDG/zI0mntxuB4LB8zz7m
         IQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161615; x=1789766415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uu0NQ9lViNj2uc4OaUGE9Tv4kMpxfHFXYrk4Ng1zNOs=;
        b=QP+w4PyZOHOtpDLOg8eBn/IGUAtyELegdJw6TJCJQaGHdrTZJR1xgMRpfP6jF7h+GD
         lGoR4sZQWTEUlArYa1vrwHhdJSNyvvNw0BoH3px3Tt2kJZH8ffd15zoIPP5jWNWyom+Y
         in3z+DWyE0pn1A7bV56PLcnH5TbB/JxGzoRafD000Pvi9ycxpjVr7AyjNQZi6lYT/yB2
         I3SCS+gXr/IBZUCDQr8y7JkyFeKVV/a9YvtKTv4BNp2JWxAF2lITGy2QeZ0vvHfONbb5
         6pXVLVVPKsJ+isLf4L+PElpAjDcH4W3zbPqEWLlPzwqd84uX6Elc9x+tE8wNEzoYZqfh
         W9tg==
X-Forwarded-Encrypted: i=1; AKwUvBwBA4Fd12pN/4mUhnklm/i9xaUzAhISSCDubPxNDsTKlaCaq6So00aqU4x37AQ/d6HI5OwPCuS6esMf/eI=@vger.kernel.org
X-Gm-Message-State: AFuF++l0MYQffGGBP6B9v4C1P7tcnEZ7DitnG6SQYogEF9khJmVW1eyR
	N883SwhguyYawXRNcuy7joCcSye+1PZryQwa7E0zYAGUPjveYy8diP351nQmCIp0hrgQnxPAH9u
	pj9f5X7NusCmNmWvyo9LicBJPsiqFT3vrPN+6MaPVyJKETfWU3t58KsIl5W9pt5WEAw==
X-Gm-Gg: AYBFou3zdlPTvd4Qb/iNlfLWIM7Ofh/fmEJx1scMgl3J62N5QiO4lIiwy30A55uwE/u
	KUAjJkzDRYCFYwIACWr/PA2rwDnJpMIxD0EosGvxGMl/7gbuXXKxKl0CH7UiIvwGK9tMg2MCEch
	0NwRhajJ2+Rzoh8mKUjR4qGszzMRBbvLL8/AQJtOjTP7DCEVnWJ3Myn9ctRYP2a8FhtVMnldvX0
	5EBu2Ct6WqD/U01BsdC00NrqzXaoctqnv/vSDpm5cGzbNrjxmTXBgh9BEjOcO0RJTK/yzhdOJmC
	K9+fB4l+RXwqqS9iflxuMowjY0JHDQfJNkYvcmJMDw7GwJ0x1qwFZPLrf+4i6GW3cR0=
X-Received: by 2002:a05:600c:540e:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e66922810mr89358405e9.2.1789161615474;
        Fri, 11 Sep 2026 14:20:15 -0700 (PDT)
X-Received: by 2002:a05:600c:540e:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e66922810mr89357925e9.2.1789161615023;
        Fri, 11 Sep 2026 14:20:15 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm201623235e9.15.2026.09.11.14.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:20:12 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:20:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] virtio: synchronize callbacks after device reset
Message-ID: <01295278b402c2856b83568e07c86853f2d30e2b.1789160982.git.mst@redhat.com>
References: <cover.1789160982.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789160982.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

virtio_reset_device says:
	Note: this guarantees that vq callbacks are not in progress
but in practice, only virtio pci correctly synchronizes the cbs.

On other transports, a callback that is already executing, keeps running
while the driver tears down the state it uses.

Add virtio_synchronize_cbs to virtio_reset_device fixing this for all
transports that correctly implement synchronize_cbs().

Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Link: https://lore.kernel.org/all/20260818040433.66986-1-kmehltretter@gmail.com/
Fixes: c46eccdaadab ("virtio: document virtio_reset_device")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
Changes v2->v3: unchanged

 drivers/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index b6c9e927bef5..a8588d7ad109 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -264,6 +264,8 @@ void virtio_reset_device(struct virtio_device *dev)
 #endif
 
 	dev->config->reset(dev);
+	/* Flush pending VQ/configuration callbacks. */
+	virtio_synchronize_cbs(dev);
 }
 EXPORT_SYMBOL_GPL(virtio_reset_device);
 
-- 
MST

