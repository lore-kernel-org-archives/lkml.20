Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793147842;
	b=x1/9OnHv4fAtvSDFGKgUlD0eJDt/jOumTBz11776Y+wj3cvD6ZsMhJ2eQEfdjklEbXlv
	 RDkHYg7bzaz7ti56ICIFFPlpgL6SMtEsGLeUUq/pZXVDc9thIviSLMkL5k3IjlV/8IqFt
	 PjbVQv2NONDclbl3ArDwugOyURQXU7MBowew+LDMqS7dxYYBpPplqW/hs6zslTcH9nHKD
	 dZy7dpD1v5cCrLyCFGIPzzzmnN1UXg1lxWyaGc+aMwB9ql8RmEfULP3/VzI48suFqylNZ
	 COqsVkcjBYOJHPQxJRpK5pFVevX3oWRTmjMs2h7f7t1rTIwxgJ4WUt2GdB/sH6orHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6z3QohFwrl9/yr27qFYsYBSnTw/3E1beDpN8A1lFb2w=;
	b=bGvtHz+Wfd3piiqI4/cmLP7BWj2SbLj/uJ9YR7kL+HsHdOm2HmNsFkl7uPF7oHMQxIIK
	 9mIkCZTi8yAvj4Q+fTQ6QhACArX/S+XSAyb4GGU34PN8uUjVZsQk9+rhaEnXSjCDDYChs
	 RlThEPBO7KNq5Bg5XPJDTfpvtqz27vUx5f5JL+m5KUIx9h1Irf+ZZo45/Kzfacpa+ALz1
	 Pz002joxuYcxxv7d+GgTDtSK11dunJlrkUnbHLihjmlxFM2CRjcQFKOgpS3d6v0OJEYvM
	 B4p6ThcFzdaTP2XtSsyesTJJaZxhiZYAUoA6vE2u3i8byy5J3o1JkPdofXkEI/O/P3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Us3BQ6Oe;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38DE606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38DE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Us3BQ6Oe
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so8951095e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793147840; x=1793752640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z3QohFwrl9/yr27qFYsYBSnTw/3E1beDpN8A1lFb2w=;
        b=Us3BQ6OeRGuRLKCh4A/xtwYUHovES9okx+gEuRziZgqPd+whmms6vJJv/aAT7oMEJ2
         3rCugxLgKUVvC706v+s9kTo6ahP81FDSnV1qrL9ABg7JTwdbjmUglOFXrlP0E64jrRfo
         nMxpepUMNBqgrb253CsbpMePH9H8wEJTZgaVb503dpyFixRl6qhgpQ1iFaJQeWTKChxW
         P1BYLKCna4TSyR3tdO6hLCwBPqrW4H44+KlDyU1joaYrtoOLQWw8T2t5psyRfsKl3w25
         R6/A7nd0IPcIKGML4ixFDkBiYai4YeJpvW7E5kTa5klSmbCNsipZkgWAAqUjgS+6AFmm
         +hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147840; x=1793752640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6z3QohFwrl9/yr27qFYsYBSnTw/3E1beDpN8A1lFb2w=;
        b=CaWUtoZdYUTRMsik4A0q7X6PjZx3cefNCEkHqjYW5w+h5rx7fRktw90mKHEA+nSf3c
         JyDDbvNpVVhwI36Y2+f2n1qYPOPsQJsQwal6e8PDmHq1AYUSH3KpY+iVu7qnjqgsu2+e
         uxUSx3siOsa0hjP1xNc7HwjbQtNVm6gStgpzqgMw2QK+kcKqkt+rOlZyQQe4OX4F/2v7
         f3fkbLb0E8EDTWb031tK7GuSgCYxx2iaEzrsgB1WgeXlShg6L49Tb+E+8oKGnCijOPyr
         FwWHRm0MovH8iA2v44GSbGRH7NR2qu/B8rW5kOTQlxBZJxMwh3vpUk5KtN7J1BysR2So
         JBtA==
X-Forwarded-Encrypted: i=1; AKwUvBw0DpPTHDlAdny0qD/pCkyF3xCtAMWbGDFdwM8QKqdo2/JZBRqMDruPGgUA4zWR7xSH3M2J4AGr7Eh0VKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOSVygNiwPUD2PXYIN7Ttdk5al+rQ5SigMSKRWvwjWIXRur5Vr
	8rqzKsS/WlCGoZfrBQ91ODPTUfqpkT1QPkFudpUofEM4gFMsq6bZvxQj+6OC6IXWDsc=
X-Gm-Gg: AYBFou2IsH3vPOPk2WypNUENjylyxmaFYG7ceyshtX1WP6MHsdAd9cloLXnCV27MI5c
	jr4fPCM0cHRx2TPcCH+93RCAM+vhUFmmOTh/Z5BPRMoYsTG06zHyQ++/kWLyN/VHqGF9vfIn1gs
	t8Mx6dLat6aQ7wMSbqCJDWVGCkhkVFkPZxL1qbKI1Nl3f+Cc0yUG10fJXaudCmnVs2/QbrycUHL
	0Xq2RWtSHOhZemuqZ0+/d/Mfcv0xbclc5JpZDs4St+RKzZyRMHK/7kTOrLtuZE6bDCs/qy7+Dks
	r7sjCbyYkvmmGEXVvnXc9V4/Jj9NFUZZlvg7IpNU7aqG7Su0773v+cbYCCCKlKX1HqznprbYZ+L
	05IsD02ztrHX+oqUvjzDUvobhsaJRC9L6p/25HOWCgRv3Ip/nuz6SL0bh0QO2yNggHsrIn7FvUP
	nJfQBKXj8hMys5gS7ar6X+veYDsMieiwu/hDTR7EE+cH1uadXfxjHIQXVjq6sE6FjFgvdqX4YGF
	OMEPOfUVZLjQkFZ2FHqRPhAkn4nWL2gWprgcyprqWI4HPqYMPP7vTBTWPl1nS2bLvG8SwxZgwYY
	10JWnJROijIjCK4yKl+uXhqOtSfSHa6ZoN7fK9HmIw2eH9MY3LGeJEcGKiEOIHmGVy9y6LVVKvn
	apBBpulYcknw=
X-Received: by 2002:a05:600c:3e15:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a9961f3d36mr3510115e9.6.1793147840030;
        Tue, 27 Oct 2026 17:37:20 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.128])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a976010d2csm8395245e9.2.2026.10.27.17.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:37:18 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vkoul@kernel.org,
	vinicius.gomes@intel.com
Cc: dave.jiang@intel.com,
	xueshuai@linux.alibaba.com,
	fenghuay@nvidia.com,
	Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jingyi Li <jinli@purestorage.com>
Subject: [PATCH 2/2] dmaengine: idxd: fix destroy of NULL or already destroyed workqueue
Date: Wed, 28 Oct 2026 00:37:07 +0000
Message-ID: <20261028003708.834341-3-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028003708.834341-1-jinli@purestorage.com>
References: <20261028003708.834341-1-jinli@purestorage.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

idxd_conf_device_release() unconditionally calls
destroy_workqueue(idxd->wq). This is wrong in two cases:

 - If idxd_probe() fails before idxd_setup_internals() has created the
   workqueue, for example when the device reports HALTED after reset,
   idxd->wq is still NULL and the final put_device() in the probe error
   path oopses:

   BUG: kernel NULL pointer dereference, address: 00000000000000d0
   RIP: 0010:destroy_workqueue+0xe/0x300
   Call Trace:
    <TASK>
    idxd_conf_device_release+0x15/0x90 [idxd]
    device_release+0x3c/0x90
    kobject_put+0x7e/0x1e0
    idxd_pci_probe_alloc+0x300/0x15e0 [idxd]
    local_pci_probe+0x22/0x60
    pci_device_probe+0xd4/0x260

 - idxd_cleanup_internals() and the err_evl path of
   idxd_setup_internals() destroy the workqueue but leave idxd->wq
   pointing to it, so the release callback destroys it a second time.

Clear idxd->wq after the early destroys and skip the destroy in the
release callback when there is no workqueue.

We hit the NULL case in a kdump crash kernel, where the DSA device
fails to reset and the oops kills the crash kernel before the dump is
saved.

Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
Cc: stable@vger.kernel.org
Signed-off-by: Jingyi Li <jinli@purestorage.com>
---
 drivers/dma/idxd/init.c  | 2 ++
 drivers/dma/idxd/sysfs.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 1577d22b299c..5962cacef060 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -389,6 +389,7 @@ static void idxd_cleanup_internals(struct idxd_device *idxd)
 	idxd_clean_engines(idxd);
 	idxd_clean_wqs(idxd);
 	destroy_workqueue(idxd->wq);
+	idxd->wq = NULL;
 }
 
 static int idxd_init_evl(struct idxd_device *idxd)
@@ -460,6 +461,7 @@ static int idxd_setup_internals(struct idxd_device *idxd)
 
  err_evl:
 	destroy_workqueue(idxd->wq);
+	idxd->wq = NULL;
  err_wkq_create:
 	idxd_clean_groups(idxd);
  err_group:
diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index 6d251095c350..d5ffc641c856 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -1836,7 +1836,8 @@ static void idxd_conf_device_release(struct device *dev)
 {
 	struct idxd_device *idxd = confdev_to_idxd(dev);
 
-	destroy_workqueue(idxd->wq);
+	if (idxd->wq)
+		destroy_workqueue(idxd->wq);
 	kfree(idxd->groups);
 	bitmap_free(idxd->wq_enable_map);
 	kfree(idxd->wqs);
-- 
2.43.0

