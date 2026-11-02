Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613022;
	b=oAvb8r0H87q6ShXa+hcQ24LFrc+brrd3Y9ByDHud7RMzUvKvsqQwraJ6FhS4OULel7HL
	 WEHe6d5uPUQUZOdcB7M1HTRKViZitput65ybLlY76/TmH3rwstRo2ppf9DcUZWOUp6QOC
	 Q2LlL8ZpSOpQoe0Kk+BhKF3cZ1XzweQrow5hcLMJOZBAUJG5somDn39XxAre4OHhAFujW
	 QBavn5btbp/Yi42zyFhOpJNvOHdaEXDVT2E46hAQEC/pnT4WA/xHF22U8JO8fpDWqbsob
	 zTQzsq6ylZdki7QbS5y8Ewi56ojVZqUQPqmb7xNL6OcqJxlKcLDmQ07W0K5jmPrIh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LDtf/6qsvrJUn6LMYvjURkTS8eXDbVvfh2YukZT9J2w=;
	b=rQ+OJ+W6ns7gTGEvPyJ8nEVBrjhYdh4yUboqbOdQklMThuXLQC1TGnpj0ySAtwoSBfHw
	 sV/EhYEHMj5690qcEOW9aLsrqfMeHJEFhy2dasVwWIdgywhacXgDfNdTOUAwt3Cp4AEQv
	 7diOidm3EXwEKhPMMb07e5lhcIKDK6ETtgZCV6WFBGYdMjiznzIEryDwv7zX1cK9AvZaP
	 tmOafQBemIPKoDqfEbXFeoCq4r/VEt7STZELCRcL3KlGz517ITq0rZtn/6X4NaIfUldp9
	 K0UvwBHyiFNWGhjSeX7JkFzNi5n4yecCZkbydnSEKmD/iT14G3ADXhzGjYc2ZHoWlLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YThFbOX/";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB66606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB66606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YThFbOX/
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so1812401b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793613021; x=1794217821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDtf/6qsvrJUn6LMYvjURkTS8eXDbVvfh2YukZT9J2w=;
        b=YThFbOX/+NerO+qiIlkPOU2Hijtz8tqyMMq4Kkwmc6XuBMoS+d/hUgVAEFqc+BDvEi
         y/qUbJAA/XzwfMs7ZRNNKqlauOH8a0aaKatvFXv/Gxg36pp6AzuJdH0akInGrMKh73Bd
         /NDeK6g4a3ZPRV3ABTZYYB/jKD2AO9ARUAeKPIEwwD6GsgI0H8MndNhKqNfh1StoiH5t
         fdn/kKCil80ztfxg2OgLoVHno9wTiz8llYZ1cpARbpKHcmlXDAUL53aazSwuWv+duU0Q
         5hIok3FtPMBammUaABOfXQYwe/nLzmkbn5WHsJRbxJ+5+/OjY7Y/eyftcKoeaQPNh0p2
         urOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613021; x=1794217821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDtf/6qsvrJUn6LMYvjURkTS8eXDbVvfh2YukZT9J2w=;
        b=bMaluTLyikksoanzU5nB5EM86kPpUZ0P6iN+hgATppk7g19BZiS2YlVguNgmwHwfzA
         PVtmJbDK3rv1g8jNuI83GYYA5xqw6/1MQm4ePtpXyUICTwlSBhjdPfHeXiuUUH+SGlYv
         YgZWeWTxbkQVoX3cwuSDGGktJB/o50zJzz1vZSZwDQ4E5dN0h4HbUPkjO0PRvYYoOpa7
         qb+Lf4rOV+0/AIgl2Ohwag8Bka90vWQce1tER0eIWvF1hNfn5h8+YuAmOi2UJmOJhHSN
         31WQWDWwJCztxX7VHLN5MSfy32D7l2Zi1wSr/D7LujJHJrPJPDHEbF49jNJhr7Cnlqtk
         ui0A==
X-Forwarded-Encrypted: i=1; AKwUvBy1nxtPvaGH7Q5ozI0IrDqMOj8dhL0HsOfJtmJe0V3FLiMSWJUxhoMu3LIRdt4kuSdtjvZtAOdyuwi1O6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpSwDyV9hnUYCd9ir/VXFpX2KzSTieNYaQGmlCwS8w9IC9t2Xu
	zF3c1bw/ucIkPWN6yyBHw0A8NnvrxWfPkRBgGIHEjZDIrocsLJR5jSou
X-Gm-Gg: AYBFou29BwTsMQoUQ63+DI+NDeAJ2Ca9Sk+gX5FIm+LUHrJb1TUYbSpbd09KUysWGyB
	0laomeAclQLaVKXtTVXr9rlN9lgUxaI6tA6xQ/alcPBi3HaqPN4rEBLN1G0w9Co04Mb0aUu2QCW
	0KzzZwBKDs41xWid6UuyVwSeoTqaZ8XJ5HQ+Hm+evfI/Q07Nk+tFVls1+qzyeFTHLnsAjHnWp/a
	Vtp/DAluPk+1v02+WXsOnltBrns/riBOsWQiq4vDL4ckWM3CUQs9Iga7EibVfqjkTQwZ0qKKutv
	YkFDKYz2IvDqfLqK53lGFaiNNb2m2+8MJAf3MSoL19jaTZ86n1pLJXxXeOpo6QsW9wR02ROjX6z
	bz55fVDEGgDch3a1TTMWXAJWNFP88kffymoDB3cxepdR3lAgYdMkRez5NtR5uq35iG/uc6yDYph
	o4pVR2ILJwv6ymdO8impOD9znRdqboCTCl2P3fjXW4NtWbsLHbkxZ+SkgNW0NltGWnTOC/Rzg0q
	hmunQwPNOvNPdULeIxi//hEkarM12qvBQysd48GLuKKwLCpDCLHAYI6DEglptsxl6Ll85C0dN3M
	1VIqCGjfgTzYsrpNq2dBZGaAMn33wklw52Sm6gzxUg5vay8oiZ0ULsY=
X-Received: by 2002:a05:6a20:a120:b0:3e4:b458:5239 with SMTP id adf61e73a8af0-3e928d687ddmr9858850637.45.1793613021164;
        Mon, 02 Nov 2026 01:50:21 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d06ae7sm1797411b3a.30.2026.11.02.01.50.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 01:50:20 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk
Cc: john.garry@linux.dev,
	nilay@linux.ibm.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] nvme: Do not drop the cdev reference twice when cdev_device_add() fails
Date: Mon,  2 Nov 2026 17:50:15 +0800
Message-ID: <20261102095015.36448-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Since commit 9952f3882ecb ("nvme: fix cdev lifetime"),
nvme_add_ns_cdev() and nvme_add_ns_head_cdev() take a reference to the
namespace (or namespace head) before calling nvme_cdev_add(), to be
dropped by the char device's release, nvme_cdev_rel(), and drop it
themselves when nvme_cdev_add() fails. But when cdev_device_add()
fails, nvme_cdev_add() has already put the device, and nvme_cdev_rel()
has already dropped that reference: the caller drops it a second time.

With one allocation failure injected into cdev_device_add() for a
namespace on an NVMe over loop controller, deleting the controller
gives, with native multipath:

  BUG: KASAN: slab-use-after-free in nvme_put_ns_head+0x21/0x140
  Write of size 4 at addr ff1100000a4ea078 by task init/1
   nvme_put_ns_head
   nvme_put_ns
   nvme_remove_namespaces
   nvme_do_delete_ctrl
   nvme_delete_ctrl_sync
   nvme_sysfs_delete
  Freed by task 1:
   kfree
   nvme_ns_remove
   nvme_remove_namespaces
  refcount_t: underflow; use-after-free.

Take the reference in nvme_cdev_add() instead, right before
cdev_device_add(), and let the callers neither take nor drop it. Add
nvme_is_ns_cdev() for the check that nvme_cdev_rel() and nvme_cdev_add()
now share.

Fixes: 9952f3882ecb ("nvme: fix cdev lifetime")
Cc: stable@vger.kernel.org
Reviewed-by: John Garry <john.garry@linux.dev>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described below.
    
    Changes in v2, after John's review:
    - Add nvme_is_ns_cdev() for the check shared by nvme_cdev_rel() and
      nvme_cdev_add().
    - Shorten the comment and the changelog; the testing is below.
    - Add John's Reviewed-by.
    
    Tested on QEMU (x86_64, KVM) with KASAN, on next-20261030, with a loop
    target exporting a null_blk device, with nvme_core.multipath=N and Y:
    - failslab failing each allocation under nvme_cdev_add() in turn: before
      this patch every failure in cdev_device_add() gives the report above
      (or, with multipath=N, a use-after-free of the namespace in
      nvme_mpath_clear_ctrl_paths()); with it nothing is reported, also
      with lockdep and kmemleak.
    - the case of 9952f3882ecb: hold /dev/ng0n1 open while the controller
      is deleted, then issue NVME_IOCTL_ID and close it. With 9952f3882ecb
      reverted this gives KASAN slab-use-after-free in cdev_put() at the
      close, with either setting; with this patch nothing is reported.
    
    v1: https://lore.kernel.org/linux-nvme/20261101173400.98931-1-izaiahsun@gmail.com/

 drivers/nvme/host/core.c      | 18 +++++++++++++++---
 drivers/nvme/host/multipath.c |  2 --
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index af71d02b8476..9ea9db0271c2 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3941,10 +3941,16 @@ static int nvme_subsys_check_duplicate_ids(struct nvme_subsystem *subsys,
 	return 0;
 }
 
+/* The char device of a namespace rather than of a namespace head */
+static bool nvme_is_ns_cdev(struct device *dev)
+{
+	return dev->parent->class == &nvme_class;
+}
+
 static void nvme_cdev_rel(struct device *dev)
 {
 	ida_free(&nvme_ns_chr_minor_ida, MINOR(dev->devt));
-	if (dev->parent->class == &nvme_class)
+	if (nvme_is_ns_cdev(dev))
 		nvme_put_ns(container_of(dev, struct nvme_ns, cdev_device));
 	else
 		nvme_put_ns_head(container_of(dev, struct nvme_ns_head,
@@ -3978,6 +3984,14 @@ int nvme_cdev_add(struct cdev *cdev, struct device *cdev_device,
 	device_initialize(cdev_device);
 	cdev_init(cdev, fops);
 	cdev->owner = owner;
+	/* Undone in nvme_cdev_rel() */
+	if (nvme_is_ns_cdev(cdev_device))
+		nvme_get_ns(container_of(cdev_device, struct nvme_ns,
+					 cdev_device));
+	else
+		nvme_get_ns_head(container_of(cdev_device,
+					      struct nvme_ns_head,
+					      cdev_device));
 	ret = cdev_device_add(cdev, cdev_device);
 	if (ret)
 		put_device(cdev_device);
@@ -4010,13 +4024,11 @@ static void nvme_add_ns_cdev(struct nvme_ns *ns)
 {
 	ns->cdev_device.parent = ns->ctrl->device;
 
-	nvme_get_ns(ns); /* Undone in nvme_cdev_rel() */
 	if (nvme_cdev_add(&ns->cdev, &ns->cdev_device,
 			&nvme_ns_chr_fops, ns->ctrl->ops->module,
 			ns->ctrl->instance, ns->head->instance)) {
 		dev_err(ns->ctrl->device, "Unable to create the ng%dn%d device\n",
 			ns->ctrl->instance, ns->head->instance);
-		nvme_put_ns(ns);
 		return;
 	}
 	set_bit(NVME_NS_CDEV_LIVE, &ns->flags);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 9e0a0fd77c56..ae8059366b57 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -681,14 +681,12 @@ static void nvme_add_ns_head_cdev(struct nvme_ns_head *head)
 {
 	head->cdev_device.parent = &head->subsys->dev;
 
-	nvme_get_ns_head(head); /* Undone in nvme_cdev_rel() */
 	if (nvme_cdev_add(&head->cdev, &head->cdev_device,
 			&nvme_ns_head_chr_fops, THIS_MODULE,
 			head->subsys->instance, head->instance)) {
 		dev_err(disk_to_dev(head->disk),
 			"Unable to create the ng%dn%d device\n",
 			head->subsys->instance, head->instance);
-		nvme_put_ns_head(head);
 		return;
 	}
 	set_bit(NVME_NSHEAD_CDEV_LIVE, &head->flags);

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

