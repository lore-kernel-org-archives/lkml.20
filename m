Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651723;
	b=mSCNpxrQeuEuZ3SGoT/b5Bwo62ug+77l+dkAdwRp7HY2e7X14Pb4Ol/mjl8KiFqzY1Wz
	 yLWA7vo22rA/Za9RJyo7Vo4Y33daUXN0Y7ihK21K+J98TJvtUfPnvSi9WIUiKwKGFzzbT
	 8sH1aAbNEVLCjFz1kd9ofcb3Yz9lqs5rDru/lNMAQTKElyV9h5e1tty+yDEQARKbaN4ak
	 2aBn3WaX6Fa0E3LdrvOd1Riuo+6yxr5Lwb9QsoawAdQhj6zIHqOYz+ZCgf7aIEr0gEe55
	 BRBNyV3HHR1e0vCUZrfop5/K0LaGYudV+ZysPMhLD63nxxhwZkryLvkplk8uZ8JOTWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xHb4BMKUD2DiMuu6B4zoIeu1Wmb9749M+/aid4F1J+4=;
	b=nnTIqqJiCwmP4E/aLOynwgYml2QowdGQTECwg4ctjzn7jUWMKfmJeug5zdPf2jsnvFqk
	 vyiugkFVWF6CNg/RZmqnNOKSI6P3/kEklRMoR1AmdpVWcmSFW0uoWCuiv+K8VWYV2EYJm
	 CGykQHE741kDlhLNALrMtWIZuorkVYEWMOjV2dg51Rlp7Drz/Q0Ja6yYxx2ZfnbSC6p4M
	 +pG+zUAw6Lq6h+Rkw1/IRD5BQuH2ZE8SMEzSjM6YwJ6NKlV0HRFF6hYi1QA6CZjPinYaz
	 2UNI2Lh/Fyiac8MjE9HZIQcQGhewyUKFjxk3IcMXR7frPTA1wHDptkiSqD+0TLsxRMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMrZ5l5M;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E472606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E472606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMrZ5l5M
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93a40a9a01aso5633885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793651722; x=1794256522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHb4BMKUD2DiMuu6B4zoIeu1Wmb9749M+/aid4F1J+4=;
        b=NMrZ5l5M7z9NtmGzbN5/+78YJntISYc8ZDdPwsRjn2Xs8xanmh68fu2SWZgYtWFuQ0
         od9OrWpvnXO9l0L9Hhw2x5Vvpd9Mq4pWwUPSMmnrGomo0qD2+XqXMPUqQhfqtyzJ0Nru
         PaotkiI5KdLDnhgUVWT5h1+YnjHEBO1p+NwBI2BTS0YhgT5ROqNs1JRf9o999JQmZFHj
         3I1P3UXUK7jQrOazeo8Oqxepijoq7MEGNUT3C9RJ+ZqbYBP1EXmNH7b8zVYA2oN3VWeb
         BgeDpkJwVxs4Arnz3Ngzctba6hGwCZ/QvjBYzWoSoNeus9Vzr0twX0o0SAh1xkSQlVdi
         c6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651722; x=1794256522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHb4BMKUD2DiMuu6B4zoIeu1Wmb9749M+/aid4F1J+4=;
        b=yj4CmDIcc4/12E/Q//TT+PlBDGV3JjVcTORw9z3OrISK32IU6CXyBG3CCRMAtUb7VW
         wDUS8mr5OjkHcDEE6VYgsAggLFeDsQnPN0QKjCHeL8cqRoQIugVDiOUC8JOezwLaDFnA
         WLapVmtXQRih5ND7KUJgiAPc2Arw3y5113K7kNeVu00NnoUoD83NGvC1BPXGwD8TiGu4
         jQl6g3uo//Y0OO4mVhSFyLS8Wn7v5mfuvxcYenS7y2JvOdIuuVK+UzgFJVUExxX+2fFx
         rO4191aJPg6XQHncKLMpjd0Tzq+GjaKkcTlq6vNcx4cbSX02PIYugiz0vADTiPeaYMos
         Af/A==
X-Forwarded-Encrypted: i=1; AKwUvBxrgkckdIJ9BVHiABD2neu19/5CkgZbjHyyp6goOLJUYu0AA5gwXpZUNoZwwa7UQe2NnLPZPdxDegdhoK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHpwl8Vg9G7i8I/3LVEFXYO4PNoZor2oUe1AHrpz9JIxpo0SY0
	hUDW57BfugaqS0bauOWwERbl+nAuZYIXEbYc1j5AFXzbKUU+8v3MA/aw
X-Gm-Gg: AYBFou2/NlfZJsZS9hka03Lnjt5bSb8Q5ATNVUYcXGajeb15S8uM8ZwZ2XDHgyznwjg
	bhLII0hxOj4N0eiKT6uQwOWyJBC1uIeVQbV/xva75d1T1RlsbPvEBoyZKZKsiixyG1O7TgLGJzx
	fHeqROCN3Ahe45mtqMNYiqCZpKEw+FYKyGr4Rmpdr1C6LGD4foEjRWWmhtPthtb8BNnv54He8eF
	10UI2qjh3GXC9sONt2A5+r4GWELxUUmjadDMk6alWMutzDvaMRmVPeqUPYNPuEYCCsIMdGzYcSk
	UmIFi8k5l+8Ylehjjc36de6R0pwQy4I5ErqZEdUaVJjsrmljagIhX7kOx1xq6mE8F5P/5HwDSVi
	ynFh76WDxXuYJiTVbfoRRcYMhNUOJ8Gsrjolabxs3vApDgH5dOn27TVtufpqYRXoHiuSP5dFzQk
	PBvTxJoUwBMOdCM4hT1hXuyTO9IxcbF8Vbh8jJBi0b8y8slj2spJVw/oI9PEuRUCoFa6JXIs/sj
	nnAqhIsn75uNWiL+PIKRd82IvhqUev/BN5ujcnBw0rGcb695csE1tWzUG0tNd1FvEnW6ViacZpI
	RCHsoj6hukJGBCVEuYSLovwue+uL/b4uvSgVVP/qie+vP5HfyKYx
X-Received: by 2002:a05:620a:4724:b0:93f:58dd:4c34 with SMTP id af79cd13be357-9442171e0e9mr1845990685a.34.1793651722215;
        Mon, 02 Nov 2026 12:35:22 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944252e5162sm916242185a.5.2026.11.02.12.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:35:21 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] virtio-mem: only mark the device ready in kdump mode with vmcore support
Date: Mon,  2 Nov 2026 15:35:16 -0500
Message-ID: <20261102203518.436327-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

virtio_mem_init_kdump() marks the device DRIVER_OK before it checks for
CONFIG_PROC_VMCORE. Without vmcore support it then fails with -EBUSY,
and virtio_mem_probe() deletes the virtqueue on that error path without
resetting the device first. The device is left with DRIVER_OK set and a
queue that points at freed memory. Nothing has been queued at that
point, so the device has nothing to process, but the driver should not
leave a device it is giving up on marked ready.

Before commit a9403425b3cf ("virtio-mem: mark device ready before
registering callbacks in kdump mode"), virtio_mem_probe() called
virtio_device_ready() only after virtio_mem_init() had succeeded, so this
path never exposed a ready device.

Move virtio_device_ready() into the CONFIG_PROC_VMCORE branch, right
before the vmcore callbacks that need it are registered, so the -EBUSY
path never sets DRIVER_OK.

Fixes: a9403425b3cf ("virtio-mem: mark device ready before registering callbacks in kdump mode")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
v2:
- Drop Cc: stable, as no practical kdump kernel disables PROC_VMCORE
  (David).
- Say in the changelog that nothing is queued on this path.
- Rebased on v7.4-rc1.

v1: https://lore.kernel.org/r/20261016023521.747447-1-oss.patchbox@gmail.com

Compile-tested with W=1, with and without CONFIG_PROC_VMCORE.

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

