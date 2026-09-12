Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDEF427F9C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209029; cv=none; b=Eg+tupe2kzJga5vvifAPUwgN3VjZJ6uTLvv7yNb5FH9TekEvJvWaRaXNrD7HEkppGj1RnAUMGtn9w94ZvksOUlvHogKoRww7n+QN3B7m9kdf54qvuLDlM7Kndiy62E6UocPtBbbe51gD8dBQExW6cxz7P+RniGZ/WgSKMfQHFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209029; c=relaxed/simple;
	bh=zhOWEamuPNzIa7ywZJbECDtA1y6/KiIZvm4TxhOofpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meqsInZo31IkWLkNGcEJuilxF0ij6p7jVdyi1STKXj0JFK/XH5gUN83JmKOYs+K5rsK8/Q78qaLCGmVkxJ/UniLq5HF2xo3UrUTZ4NYjlGVB97GbhlwDijCepam/mBjbDRRWEfiOke0JGnFhRCjeFwLF37A6UdULN3mvMuLjl2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0rf+KFv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TyxmqXeA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0rf+KFv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TyxmqXeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789209026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NnOxC74F2mkf00TAH+G2Hhd/RtqM8EKHsqZjkYjYcVU=;
	b=T0rf+KFv2M6HtoVZDKM4gVUZSAKwomaSt0pOySCYHRKVXMzsYFjlNikjoMLS9BLMOvHXfy
	5TXfxmcjq0Q+D/IYP9Co5tCmaOK+fb+QqkbojvUqS6Fyma3Ghp4dDWe/S2e9tGDyKYGTd1
	nsQlo5/eTCzYhrolFWDPEVrFs5YjMV4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-E4VIw1iTOQOn4v5rWiSDpg-1; Sat, 12 Sep 2026 06:30:25 -0400
X-MC-Unique: E4VIw1iTOQOn4v5rWiSDpg-1
X-Mimecast-MFC-AGG-ID: E4VIw1iTOQOn4v5rWiSDpg_1789209024
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e635a6002so15614445e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789209024; x=1789813824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnOxC74F2mkf00TAH+G2Hhd/RtqM8EKHsqZjkYjYcVU=;
        b=TyxmqXeA6OrCWQovyGqWFv7xuhZv4Y4vnA2gEALjnFQg8eatzLN8angrjEjnHyFMWb
         yLK+swerpkpfucGhubytZCCGbRookaAmHXaG4L+dJnWiML0OJbZfLt0VEn9mR7wHcG5n
         QDi87WmpnZb2VXIEBLCAlrYh8/jRkBAlujDjog0Ig8KUT+VQQPS9ecZcFo5NvN4SG46X
         r5TE706KFclNu/SpdPmx8iuyfysRkoayNRESn1arAL6s4QyJquuMJBW3E6PRcDdlUk6k
         C3FWzbnHkXh8h3NLj49K+E7hZy/3rklfeMal7lRGaHCnBjV8EuLvAj2GhaqKKWz+/ktn
         jj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209024; x=1789813824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnOxC74F2mkf00TAH+G2Hhd/RtqM8EKHsqZjkYjYcVU=;
        b=qHrWIsSXaxGBUgYlDE6VUFSi1R9VHmSIZXkeKWeKYKbVc173dJftiFkB5AMYpxxg6M
         rCrutMxqMuKCBDkssjHi1HRG1lw8nbEncZRh4RNk9LhtEbzTsJzJ57Xp2w17NdcDZ7zq
         RrXBH+bFVjO2lz87mR6bLCdmcFXac7LNOGYV3GrACHmScbSzmWXew9zzKB1wRMKrH60W
         /noJ+xScRhdA/EdwtBzqtTGYriyVh5QiMtJvyGDfeqJ20if/ZGJoFuS8gD4MHeSjxgX4
         6lIyZM01+sBPDx+wiTsIW1BH78r7r6/pr8LEI5KT+Hwgd3+j+hElBPgkVQ/02bXGBoYg
         Y7TQ==
X-Forwarded-Encrypted: i=1; AKwUvBy48n92yD8RoTizGWLMNNV8hoD1iolxObKisvs4a8M1lXEgB5U/diVZFJh6zHMkh9mtccdBMSFPxS1OctQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nO+g4V+aX4ZKaeT8faOVnWPjqsMqTWDZGuPokBnxvOFGjNdZcD
	eo57wzVW232AmkApCUqgslzqXZKg9LKFtymJrRfEvvM9F1EV5v8Fyi0wDWHhcZUxNMsfU0tC8W6
	qGuWA0zOMy4sY1NvLmaU2F9BQYGkHgHYGwekeOx+nRtjKD1i/4kLgu3k6fym1xHPz0Q==
X-Gm-Gg: AYBFou1GTm/mcKPxcPoqziYNmQQSvLC7GbH76rxFmnmcwBffeEdDDPhjAECdrKZwFGv
	JBM4V3tG4opw8wyBZJPxAS1Q9nFCbzM1PXv7vnfFgKYYrNCThjGzB0U9E81FPbNWHt/hVJX5CPc
	FZHae9FDG2XP/iP3tZwB7ur5ijApUSqwzHdvjumwn06SGiPUPeqIptsB8Hux/hZvodKIFwwcRfr
	7GXaBHAcosdfDjl3frPh0U1WPlSSptqtAc3q6dhMOqq4y0IuFQjV5TwHgvc3hHB5Fd7j2xADejO
	SU2hSp5uQl3LzTim2Cu3LnihnMe6MuUiuDl+UYv48BxzDGMNSNtu/afpBgJEnFTOv1E=
X-Received: by 2002:a05:600c:a03:b0:49c:dada:f57f with SMTP id 5b1f17b1804b1-49e6197f78dmr95008635e9.7.1789209023940;
        Sat, 12 Sep 2026 03:30:23 -0700 (PDT)
X-Received: by 2002:a05:600c:a03:b0:49c:dada:f57f with SMTP id 5b1f17b1804b1-49e6197f78dmr95008195e9.7.1789209023459;
        Sat, 12 Sep 2026 03:30:23 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm251334355e9.15.2026.09.12.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:30:22 -0700 (PDT)
Date: Sat, 12 Sep 2026 06:30:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] virtio_pci: drop callback sync on reset
Message-ID: <64421afa76075c2e0b66ef5c2ea18948b861ab73.1789204858.git.mst@redhat.com>
References: <cover.1789204858.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789204858.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

The virtio core now synchronizes callbacks after reset,
so the PCI transports no longer need to do it themselves.

Assisted-by: LLM
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    v3->v4:
        now includes modern transport (previously only legacy
        in patch 2, modern was in patch 3)
    
    v2->v3:
        split from v2 patch 2 - legacy part only

 drivers/virtio/virtio_pci_legacy.c | 2 --
 drivers/virtio/virtio_pci_modern.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index d9cbb02b35a1..8115aa39e01e 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -98,8 +98,6 @@ static void vp_reset(struct virtio_device *vdev)
 	/* Flush out the status write, and flush in device writes,
 	 * including MSi-X interrupts, if any. */
 	vp_legacy_get_status(&vp_dev->ldev);
-	/* Flush pending VQ/configuration callbacks. */
-	vp_synchronize_vectors(vdev);
 }
 
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index b4249afd7f58..922e2df027de 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -563,9 +563,6 @@ static void vp_reset(struct virtio_device *vdev)
 	 */
 	while (vp_modern_get_status(mdev))
 		msleep(1);
-
-	/* Flush pending VQ/configuration callbacks. */
-	vp_synchronize_vectors(vdev);
 }
 
 static int vp_active_vq(struct virtqueue *vq, u16 msix_vec)
-- 
MST

