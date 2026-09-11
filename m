Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF55AEC41
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161624; cv=none; b=aAXa8guu+aqkEKUfYJSh7uN9yIRzE3WsYBoeWirADvsjKgXlYspHU4AEVIolO7jXFcufpcUQU4lM3Lc75uHyqBnlf6zP1dv8gLEPThFQTKoA3v1wXBGqpAd36Ek5U2O0Sv8vLVoz1mH62Zg/VE6CYOM7fFlTrsnYykNCokqeW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161624; c=relaxed/simple;
	bh=YIhVHD4J9cX7TfLPkP4rQmfA+W2I7rkNagORAyvwZGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k53e4yJT1MujCVNLPsfmJkV/x9VlgkKfUMWRKOv/dcaqkNYYeKroOUun3xyFnXJsxugjN8/dIH2SOgFflkpp+TKxQUwnnb8D3hnDaLg5jXVHWUDH22ScEB1y4l4yStMK2lvoNWHbbUtGfKkYcil05xVqjxg/wMJno8Yw3TqDMLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/DwZaps; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cklvma6S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/DwZaps";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cklvma6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789161621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QBDntR8Kc7kI1G0eQPnEmLghdHGikSjpgJr/Az0xYE=;
	b=R/DwZapsqNwBo3u5GPqVuaeLpcxPtXKCOa5H0+SPTaDqOUmlrz9hwSVMOK4iDI9ve5/DSz
	pyTtAz9CVYENYJr8xjg/+fcus5fpwsk+UD9fUiefRz9Ffj62YVYyaK8a/o5kQJu5IDWdkZ
	DrkzmisVJfL876qAIycy60xg9pVfZFA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-pMOhwbMlO-aenN89BfyE6A-1; Fri, 11 Sep 2026 17:20:20 -0400
X-MC-Unique: pMOhwbMlO-aenN89BfyE6A-1
X-Mimecast-MFC-AGG-ID: pMOhwbMlO-aenN89BfyE6A_1789161619
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4955e865174so6807235e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789161619; x=1789766419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QBDntR8Kc7kI1G0eQPnEmLghdHGikSjpgJr/Az0xYE=;
        b=Cklvma6SwMUakm5XKu4GtWIW6hytzeZyYllMEMmWrqXeOOwcvVv+WtP3+vvCjGe0tz
         47vO35k52anQ7CsyjaOfCmdjynhKmBnIe/57PuPgRQ4q7VluQMIhP5dxjqBwtIPxTxN9
         lNYPPs/h5fwiUaO7Wkq0FqV/GmBIQB2vETHTNBihkpMsvAqOwUoqgn4VExyK+mVNvWuz
         r2YzwiDkkzniRrC+QPD+9SAOsyOzmEbNOU0W1cRwSQxbTSH+6pWSQxmP/ZCwrhSqQSmN
         yunk5EUCSP1ANkQKzVUSj4S6pmlesS54NqLIsyZvVffnrg0Py05SW7ibChAowniEitK/
         ehmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161619; x=1789766419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QBDntR8Kc7kI1G0eQPnEmLghdHGikSjpgJr/Az0xYE=;
        b=JOfqg1KdhHMsE+3JnXy/gS1F2epowqXbJgbnuO0UoCKABV/0oltbw6Jc2WxwrR79IS
         LlBlrTZrtrN/F/WgKA/6n7nvYh9lbKaBimKD6Qr03ZczSrDBtJ2175NrvW2w7Z3v2bbB
         yHtfaLgq+wlPTJgwW1am9s6vbSLVCWHldZgbPys82DaDknw5ieycCkTyLyUvybG9HU6Y
         SAj5BG9S1Xfc7LEp6qMHuLSjuHxy28xUOgsH4kJLQc8+oyzmz+iN0Ejl5hMW1OOEIXcV
         yZTfDD1O1GG7PFrPnCHgsyEmVXPQSto6etLamcCIrzl7SkDUGo+Un4SBUbYIQgHkfLIe
         sUQw==
X-Forwarded-Encrypted: i=1; AKwUvBzPsF6nLuqLHY7bJomE69EyBsegReX6ndqGdklP99nBZasmvczPCWeh6+5J+a0icDVug5JHGFqNmKXWZBA=@vger.kernel.org
X-Gm-Message-State: AFuF++mg5xcYK+qNU0nX3CZe2xu174NGUBJsjaA57CeLYeGzE9WCim1L
	z7aWPqnoj+otX7uajeFTqXWfwOm99zo/AZjJ3gWqqasf2eCb3V7yvrG2bs1elZua4k8tQujtjGP
	1Lo2PsH31K6HyY+6m4zXtiwIxNfRtaWZqJnE0xornZ1BcBkXTMYerZ859FK03ch+DzQ==
X-Gm-Gg: AYBFou0xSdKEkc6K4fc7ArpwrSaWRVTUgnPLpC+Pla7P6GIX2w7068DZRbM1+fXkZ0+
	fJLJoIJ1VUnNxOooLyJ7bzGSA9YfSnBlo1EoFRFWbCAQwWvcsPe3xw0Fp06yEZiV4zaH5qnquBY
	l7LsUUL8dmHl4egguruC2M4Rf1/ajIPm2kIVlouowiAJ/Z5kiE6UzLoLXPUZGdsdSvUj8HgbrUV
	ia7GeNcyMdaEdMlF8kwLIqPvmsLmTIQUYMIJ+JPJF4cbRhPtxVANDSFrrNnabbCquGrwbzGUqwZ
	xB0y+GHdjxWh/Re7K6f3sHLtEyiSR2onPPDZJbTQF23ZKTHE/DpbPtM5pc6/SOHLKdo=
X-Received: by 2002:a05:600c:354a:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49e61a005b6mr74224355e9.30.1789161619123;
        Fri, 11 Sep 2026 14:20:19 -0700 (PDT)
X-Received: by 2002:a05:600c:354a:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49e61a005b6mr74224155e9.30.1789161618697;
        Fri, 11 Sep 2026 14:20:18 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6aac22bbsm17560275e9.0.2026.09.11.14.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:20:17 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:20:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] virtio_pci_modern: move avq cleanup from reset to
 del_vqs
Message-ID: <d0b3de807c800befe9adce1cefb2d064d9fe0bec.1789160982.git.mst@redhat.com>
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

vp_modern_avq_cleanup() detaches unused buffers from the admin
virtqueue and completes pending commands with -EIO. Calling it
from vp_reset() is incorrect: virtqueue_get_buf in the avq
interrupt handler can race with virtqueue_detach_unused_buf in
cleanup, and get_buf after detach is not documented as valid.

The root cause is that detaching buffers does not belong in
reset at all - reset quiesces the device, while cleanup belongs
where the virtqueue is about to be destroyed, in del_vqs.

Move the call to vp_del_vqs(), which runs after
virtio_synchronize_cbs() has already guaranteed that no
interrupt handler is in progress, eliminating the race.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/virtualization/20260911125745.E0A2F1F00899@smtp.kernel.org/
Fixes: 4c3b54af907e ("virtio_pci_modern: use completion instead of busy loop to wait on admin cmd result")
Cc: Jiri Pirko <jiri@resnulli.us>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
New in v3. v2 dropped sync from modern vp_reset in one combined
patch, leaving avq_cleanup in vp_reset. v3 moves avq_cleanup out
of vp_reset entirely into vp_del_vqs, fixing the race. Adds NULL
check for admin_vq.info for find_vqs error paths.

 drivers/virtio/virtio_pci_common.c |  2 ++
 drivers/virtio/virtio_pci_common.h |  1 +
 drivers/virtio/virtio_pci_modern.c | 10 ++++------
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index b90c174450b2..28b254ee4726 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -270,6 +270,8 @@ void vp_del_vqs(struct virtio_device *vdev)
 	struct virtqueue *vq, *n;
 	int i;
 
+	vp_modern_avq_cleanup(vdev);
+
 	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
 		info = vp_is_avq(vdev, vq->index) ? vp_dev->admin_vq.info :
 						    vp_dev->vqs[vq->index];
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 8cd01de27baf..a4ff6ec903a3 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -194,6 +194,7 @@ struct virtio_device *virtio_pci_vf_get_pf_dev(struct pci_dev *pdev);
 #endif
 
 bool vp_is_avq(struct virtio_device *vdev, unsigned int index);
+void vp_modern_avq_cleanup(struct virtio_device *vdev);
 void vp_modern_avq_done(struct virtqueue *vq);
 int vp_modern_admin_cmd_exec(struct virtio_device *vdev,
 			     struct virtio_admin_cmd *cmd);
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 6d8ae2a6a8ca..ef76f35c6b2c 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -345,7 +345,7 @@ static void vp_modern_avq_activate(struct virtio_device *vdev)
 	virtio_pci_admin_cmd_cap_init(vdev);
 }
 
-static void vp_modern_avq_cleanup(struct virtio_device *vdev)
+void vp_modern_avq_cleanup(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	struct virtio_admin_cmd *cmd;
@@ -354,6 +354,9 @@ static void vp_modern_avq_cleanup(struct virtio_device *vdev)
 	if (!virtio_has_feature(vdev, VIRTIO_F_ADMIN_VQ))
 		return;
 
+	if (!vp_dev->admin_vq.info)
+		return;
+
 	vq = vp_dev->admin_vq.info->vq;
 	if (!vq)
 		return;
@@ -557,11 +560,6 @@ static void vp_reset(struct virtio_device *vdev)
 	 */
 	while (vp_modern_get_status(mdev))
 		msleep(1);
-
-	vp_modern_avq_cleanup(vdev);
-
-	/* Flush pending VQ/configuration callbacks. */
-	vp_synchronize_vectors(vdev);
 }
 
 static int vp_active_vq(struct virtqueue *vq, u16 msix_vec)
-- 
MST

