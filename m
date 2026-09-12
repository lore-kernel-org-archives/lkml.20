Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C733C9ED6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209029; cv=none; b=Uu7bsrc0WTCcrW+8QeENr8m/u21l26TDmyq5Kc+lrksB+MrLSJt1J14pTxHYvu+ljbJqL5S/ZGvT6VO6rFZOqIOb3g1IBFAWLYbSCBEnf1Ng6jPw6KQqfeEHXkMPKc9Jd0gu8KavQurShYJsIiHm3bEBxKiBzND9d0l6QyLG5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209029; c=relaxed/simple;
	bh=Ge1VSD4EhR+T+5baxH5LTs4UbrdDzHY/oZOBNhGf8WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wfh7R6Ghm/tafnzPvCjQeYZz1nWllpNU9ivCqGnPPZCbWNjqvd6YF6U9tZoz0ACqOo8bo2QSNGe8Xl1lZBrjXjZBCMMslnQYcWUk7JXcTZCj9fze83W25ecx89nkgGJSGOP/Ei6PdiCgZMZh54f4zpkVyaX7lQy11dGmGIB+k4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jNbLpBVS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PwJpAL4j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNbLpBVS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PwJpAL4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789209026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSEKt8b2T5ZUq53xnc5HGHRh5k/gLB6VjqYwxmbeHAA=;
	b=jNbLpBVSSDjz/7AYXSyYriFNbCay8wYrxmlaYcSTmoQLlKSyeTtrZUzX6JeS3YSUDesg3B
	W2R/1tjWLuthZcqFSZnJT2Fxq72yWxlWl8wTbkp/oqZVPWlKfN0dMwthIJMMJppUcZ/apP
	dwC6wr1svxGc35KYCtKGP1NXCWPaKmA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-qhSxY8d0MP-WrL_Bi-uG7g-1; Sat, 12 Sep 2026 06:30:23 -0400
X-MC-Unique: qhSxY8d0MP-WrL_Bi-uG7g-1
X-Mimecast-MFC-AGG-ID: qhSxY8d0MP-WrL_Bi-uG7g_1789209022
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-486f94eb4easo85205f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789209022; x=1789813822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lSEKt8b2T5ZUq53xnc5HGHRh5k/gLB6VjqYwxmbeHAA=;
        b=PwJpAL4jX+fO0sc7B3OSqMYhnPTQAr3NGQa1r7kkkbIOGUPISmOGeq8jOqameUp8DK
         XDRdOzpOISCuQ3d0WB8A3lNfkao6TEehPtFtPJnrtyg+ws7F/qS6C4R2o46XMMCxEPJU
         pbFlIHtr88gDTll8Pftv2JZq3KRviXpn/vSBuc4hHizMcH6NvlNL8fIs2wjIiXK4kNZG
         1MJHmRXSRGjHs7lkeQGkvnjR8bn+QwfOvBgx7YnoWUTe7Gamk7p/K/xGVvedh0sR5Dvt
         G61vQ+XVl3vOKfLjHXdNsgpFrx7CafCmYlBeJjem4XZQP8Nddkvu29l71ze8hb+ESj2g
         tNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209022; x=1789813822;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSEKt8b2T5ZUq53xnc5HGHRh5k/gLB6VjqYwxmbeHAA=;
        b=SSO7kj/JztdKRMdfPM9qRwckzLd8S7EFv54vT44q92oYWn0OaBRGpglPTVygMG17zb
         ylOJIDn/FEenlIvV7V2u8DEvuSpx3DyCYpwL5rW1X//Rxmw57J5D8wyc9Id/CN92CIPB
         4MS6hSPckOftxZo0ecu8jmdayXSdNC0/PVjFsf7J6+H5PeE+g1Aj8dKhm0NIVIFsiUsu
         ioyefTcaKsraN5aL80fBMr5oU8fa4ZVy0s/w+Py4XPqWylR19ZLLFkW8dkAPgPl9UCU5
         3bfMjuc7X6ldcWVMu0A6lXnDXYeUj05i8duEeAFT4jriaVkS8BGMrdDbnyOwu2NCquUw
         9plQ==
X-Forwarded-Encrypted: i=1; AKwUvByLhqvJuiI2msOIPnYfP25VDVNjpA3kt1WzGcPf6YunqXONm/dlonwJX7GSmPogHDLNSl8bnRMXBSLstQc=@vger.kernel.org
X-Gm-Message-State: AFuF++kIaH1qWWM8VdqX1deseBV15RiYHVKGZGTv++zanXVDx8wtxhl9
	0HCkHA/m+cbpC/5KYeOzJ69ejwBuPrWELnyYUbLMJBYyfdcLINU5hCTEJT4WhGs5QejFWsQUpoi
	5CumGgzluHbnbGY9vJecaXeXIxKCY/oXAO4UaBtS9tKE5Z8q22eXI8DEPOgbB3VM8Mw==
X-Gm-Gg: AYBFou15FW0cvy4Lg7a+tfcyKLb1siA5wAimbGDnZmknfB4r/Dv5OrpNtIyGrB63u7F
	g3gqgqXNHryq8Me1raGCaIh0veK5DsA8jyl2K2mCAbEG5po35eM8mhT0DRxDO+ULUMEiNrZO8M8
	AghH6txPt/e/qGAw2htp2xgJUCvdIoF6ojKLW19KB66UJlOiU2Bua3+fBrHYF7WpvLMXWb9G+LG
	5Ul5o7ArfP2CnUhloK6R/MwPJrpC4ffYt0YN0jpRrWGO1TnyPIJMrbgIcSLzitrXih1Skdb4S/4
	8pdZR9hf1Zp+N6BH29PgP21zmCgXgxmzRILthYuuFlSj2DYhA2OnGqX6uxvlygawPfM=
X-Received: by 2002:a05:600c:4f88:b0:49c:fa21:e742 with SMTP id 5b1f17b1804b1-49e619ce757mr85771495e9.24.1789209021667;
        Sat, 12 Sep 2026 03:30:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4f88:b0:49c:fa21:e742 with SMTP id 5b1f17b1804b1-49e619ce757mr85771065e9.24.1789209021198;
        Sat, 12 Sep 2026 03:30:21 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71e300f3sm18291545e9.7.2026.09.12.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:30:20 -0700 (PDT)
Date: Sat, 12 Sep 2026 06:30:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] virtio_pci_modern: move avq cleanup from reset to
 del_vqs
Message-ID: <21fe35ad7b66e2c30dbdba6fe4df4824d1c0db66.1789204858.git.mst@redhat.com>
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

vp_modern_avq_cleanup() detaches unused buffers from the admin
virtqueue. Calling it from vp_reset() is incorrect:
virtqueue_get_buf in the avq interrupt handler can race with
virtqueue_detach_unused_buf in cleanup, and get_buf after
detach is not documented as valid.

The root cause is that detaching buffers does not belong in
reset at all - reset quiesces the device, while cleanup belongs
where the virtqueue is about to be destroyed, from del_vqs.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/virtualization/20260911125745.E0A2F1F00899@smtp.kernel.org/
Fixes: 4c3b54af907e ("virtio_pci_modern: use completion instead of busy loop to wait on admin cmd result")
Cc: Jiri Pirko <jiri@resnulli.us>
Assisted-by: LLM
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    v3->v4:
        split patch 3: avq cleanup move is now a separate
        patch from callback sync removal. Callback sync
        removal (previously modern-only in patch 3) merged
        with legacy removal into a single patch.
    
    v2->v3:
        new in v3

 drivers/virtio/virtio_pci_modern.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 6d8ae2a6a8ca..b4249afd7f58 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -364,6 +364,12 @@ static void vp_modern_avq_cleanup(struct virtio_device *vdev)
 	}
 }
 
+static void vp_modern_del_vqs(struct virtio_device *vdev)
+{
+	vp_modern_avq_cleanup(vdev);
+	vp_del_vqs(vdev);
+}
+
 static void vp_transport_features(struct virtio_device *vdev, u64 features)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
@@ -558,8 +564,6 @@ static void vp_reset(struct virtio_device *vdev)
 	while (vp_modern_get_status(mdev))
 		msleep(1);
 
-	vp_modern_avq_cleanup(vdev);
-
 	/* Flush pending VQ/configuration callbacks. */
 	vp_synchronize_vectors(vdev);
 }
@@ -1232,7 +1236,7 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 	.set_status	= vp_set_status,
 	.reset		= vp_reset,
 	.find_vqs	= vp_modern_find_vqs,
-	.del_vqs	= vp_del_vqs,
+	.del_vqs	= vp_modern_del_vqs,
 	.synchronize_cbs = vp_synchronize_vectors,
 	.get_extended_features = vp_get_features,
 	.finalize_features = vp_finalize_features,
@@ -1252,7 +1256,7 @@ static const struct virtio_config_ops virtio_pci_config_ops = {
 	.set_status	= vp_set_status,
 	.reset		= vp_reset,
 	.find_vqs	= vp_modern_find_vqs,
-	.del_vqs	= vp_del_vqs,
+	.del_vqs	= vp_modern_del_vqs,
 	.synchronize_cbs = vp_synchronize_vectors,
 	.get_extended_features = vp_get_features,
 	.finalize_features = vp_finalize_features,
-- 
MST

