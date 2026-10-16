Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0637C108
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118129; cv=none; b=Dt4fxSOWhNtfCPSlDDmkvDhR2P+UMFyHSLZvNDJFvTYVaWUckgstuURZiDy437ZsCnXxe85sY1fFTbCcY/tU4ZCjdL6ZB+M1E8cwQBED8iBPnJiJ7o6BQgtGKHjwSwJefVO5qJSLM/4SjOTVj47PXGD2h9Vdu2yH1Hsrp68aFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118129; c=relaxed/simple;
	bh=e1pzx7iHT7y8LGbTJDidgYeAv6c7Ezsr9NaS2X13/Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4OfgkTJ7JEyhgY+adQq7287cUrJPncIafQn6g4Itm5+3/SXeOc8mOgOoAZmXZDUbeoYsa9h/dK0NWnNynzuH7UBp4V4oeazukAYAhTMgdzqldFAbgrTuEPQngPXOS0We6h+BvPGFZrnzxSZk5KSsxKR46zBTjy7NjU6xggfWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ran/TBc7; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ran/TBc7"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91bb5795792so22516116d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118127; x=1792722927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03vOOfrUqgo7xXSCXx3l+3vM9t3JyBBNR2eJKIpJADU=;
        b=Ran/TBc7w0EreJsOKePA0YDoZ4yloK8JIOPdSX2pgPqfg7dHVAgAj+6FCmMD+fW/Tq
         I+gz9rSf6Wx+hm9TkbNttGdjnjCDZsn4GhqUNgF68gpor1t1o1mrRxZ60teSTtMx4a+H
         Wq7wzX7KGm2opY/mSIP38Rcqg4c2VTR7FZg8S7Dr8P9xgy7xDjeZWID4Wd620Ip0oe7B
         F7T0mDuaN/y8L+ju/m9S+TSi7TaBjnirLmWJ/inwhujmlUqMPnBB199T47E/rFWXpT44
         yVVilqbyEDYDbVoN6rAdTRbIGt3OPtyu/T4r0uBzOCXwdB/eTpNKokDMnVBcd6Ol40O4
         Jf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118127; x=1792722927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03vOOfrUqgo7xXSCXx3l+3vM9t3JyBBNR2eJKIpJADU=;
        b=WCcvDAEDtICnG9uiVzn/HZQcUE6u6VC0iHfJQM90JjYf9Lq3fnEO6ERr+YM7Jb6jNJ
         YC/GMphQcy877iJVAr+KQWrR2j3BVURCxfUDa9424TiUz5FOpP4oRTYHsWZBICWeJage
         Vm/KoIJzdJ9Itv/lnJGGI/X5cUf/op70BZxdOBxRO1a84hgg9KPZNviklhZT3ZKABT1y
         4rajMcDR0Se1c/rkrUikDhR35SMGSu9tHBHAx7jH3U/tooww0pAMdA67FnX4MNE8qpc9
         LvAWY5ezsqLUNYbh4qnITkAJy+hMOj5r1RATc6VTdDh5awsY08cWMJIUZ9bIOnIBroFO
         2FFw==
X-Forwarded-Encrypted: i=1; AKwUvByd0gzThED64O2zAhNRmcFVWiRDMmQf0sVH0opznHt8pPGQhk7EA3N//rWlLVyzhReDHPHMPp6xxxOrHro=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDxwMTdm5QbCsNTjGmLPX/fv/Zr8ycKKpGIiV+55+9T4H6AMLk
	zIG9AmTHRLxTbIaaMiwYgDoYYfAh4PSv6PU0o7dyUa65o+IwSeYi5oTz
X-Gm-Gg: AYBFou2fdYsnBua/wXIFCijgsGhvYMk3Rg4mlw8yWcrCRu4TWkeQWvvH818QzGAF0S4
	V/hk0guTex2eExvKUq0HspUSazZL1i2WIDMMX5J8mIONIeArZdIos0ncbFFYu75iD5srmBplpyl
	b3485wkiqyC7L4SX25RSASSTI3W74pvRSE5BMfGCWPy+WfJ9n3Bdl/vXiwUbeDo0pgQSOhlOMt1
	+MMFLvBB3IRfvi+6uCaCFPkpU+g//YaR14ysO0CnAsvMO2fu4EPAnTilsIkT5HYHzfxnbSCqIqB
	lV2WSseUFrNhehv1JS+aCmZR3tIQd16whLr5G9UB1D93lDzDWNYXZFxJcjzpe66MLH7tsG82OkW
	idRZ8EBNMM24JPP+OUQWQgDAn+BEGOeKIPJ1rghtFbW761e4WQFPze9XeCVmXD1oGuyD3wNftn5
	rSK/k7Zucx6tLKBDpKE3vRT/+cF3kG+UePyZK6N1uDVwJ2UuHM42/hoNwz1m2dhhc5cHSNPIr6Z
	/kvJpd9x6pEUk5fbhRplA==
X-Received: by 2002:a05:620a:6412:b0:93e:56c0:bea9 with SMTP id af79cd13be357-93ebd1e0039mr3550692085a.21.1792118127587;
        Thu, 15 Oct 2026 19:35:27 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1b765dcesm52558885a.30.2026.10.15.19.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:35:26 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] virtio-mem: only mark the device ready in kdump mode with vmcore support
Date: Thu, 15 Oct 2026 22:35:09 -0400
Message-ID: <20261016023521.747447-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_mem_init_kdump() marks the device DRIVER_OK before it checks for
CONFIG_PROC_VMCORE.  Without vmcore support it then fails with -EBUSY,
and virtio_mem_probe() deletes the virtqueue on that error path without
resetting the device first, so the device is left believing the driver
is ready while its queue points at memory that has been freed.

Before commit a9403425b3cf ("virtio-mem: mark device ready before
registering callbacks in kdump mode"), virtio_mem_probe() called
virtio_device_ready() only after virtio_mem_init() had succeeded, so this
path never exposed a ready device.

Move virtio_device_ready() into the CONFIG_PROC_VMCORE branch, right
before the vmcore callbacks that need it are registered, so the -EBUSY
path never sets DRIVER_OK.

Fixes: a9403425b3cf ("virtio-mem: mark device ready before registering callbacks in kdump mode")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/virtio/virtio_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index e18dd736f2ec..b28d2da7d5b6 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2817,9 +2817,9 @@ static int virtio_mem_vmcore_get_device_ram(struct vmcore_cb *cb,
 
 static int virtio_mem_init_kdump(struct virtio_mem *vm)
 {
+#ifdef CONFIG_PROC_VMCORE
 	/* We must be prepared to receive a callback immediately. */
 	virtio_device_ready(vm->vdev);
-#ifdef CONFIG_PROC_VMCORE
 	dev_info(&vm->vdev->dev, "memory hot(un)plug disabled in kdump kernel\n");
 	vm->vmcore_cb.pfn_is_ram = virtio_mem_vmcore_pfn_is_ram;
 #ifdef CONFIG_PROC_VMCORE_DEVICE_RAM
-- 
2.43.0

