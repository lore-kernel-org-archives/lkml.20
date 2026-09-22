Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47229380FEC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097425; cv=none; b=TkbOcG/DJ31gqWNEMLzpARrhkkULiM4zguOb0t22U3EbWd//Dlb2p6lliqEirapxwlQEJJJohGcQuJznVqQa75htQPnEy6HnPzSjWUKp+ZHmGuYACDYxniXx5esCPEsujCFnQwOk4lBTKwxLPvv5sWSUWoCqjOo8tQRPwBF/Mz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097425; c=relaxed/simple;
	bh=B+rFwWBDA/3MGrtYnR6VaIzmZ5dtBML4X3N5+GW8s6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zb5fhzp0Cb8W+zTenksEpKzeEX+51U5pnqdbvApV5zu3ZIZSHKnCH9U/yv9Fm0TwzDd2HxLi6BGPOfflT+tyQbqLD+S2oZTtOU81rZfyEIhV9Qf/AVKvlSMp38zBIwWZz7qaMU6ShFhtVG8YGKxCuaBugu2puzf5nnBj2lTCZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CczlwiAg; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CczlwiAg"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so20280eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097423; x=1790702223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdkopeEhdVPiVywAYlu3szNf41bUlu4QoiIzTh5w9l4=;
        b=CczlwiAggu/WY0FX3NyuZKfD71/CLWjmV+nDGe3ObnhQpqhZiFTTyHuGfWNi617Inu
         8RxdHCujzm5rnL5N81r38gaYhS6CMxa/Scjlq/24PU0gIxazo4kVp0VzB2k/eaMLAcxx
         FtlbMeiYWU7l5q4BRkgQw6goVro+kYYn7oOOx1Rcg//uCyospanz915cySgdZe9DbaN2
         Plg4IgIoV/AYbiLostA/7AkagUtTR4wg9OlvxLRxbC49qNWUbVHl7tfIC2QNHnakXIcf
         6b8VeXgr8MSGqq20J7dtA7TANm3pV6IF2WXP3EGdtFAr58ALYIMXtC32/by04HQycW18
         0TYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097423; x=1790702223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdkopeEhdVPiVywAYlu3szNf41bUlu4QoiIzTh5w9l4=;
        b=ixJ5TqmivY4Qr4jkZ4ZSxI+PLjE28Rlsi3J/IuXDoFFSOlK/O/oEfJzBMqYmbsqP+i
         gkJ8ftlofk+kc1CFfnug/ZdxRw0O2nPl0tgLbvQ2b9iJJBep/a62zvINNwGt3hO1qTAa
         +jT9B5XUYFAo8HfsAH1R3lYKqtsDs58FSChxsTFrRV5LGjyYggG0vJR7E+2EYt5RVxeY
         nk7TLj1wOoW0U8ikmA6rGazU0O0zlAK0g5W7jt/Itc7Goi9jjjyXcjUHZ8LSzHLK5iiW
         J0MHLdlyLltmwprSm5xkZufJPmgOQiYtWy1G/MGNoJlOJFX/fexk8D+EaGZQSxEA9at/
         Fdog==
X-Forwarded-Encrypted: i=1; AKwUvBybM7cMlRNG/H81dLrakmIkuj/Su6N6m8yifiIoemv8CqZ0LxiMht2Z+vlBBS7xGwVRMpmRGehvh51gqV4=@vger.kernel.org
X-Gm-Message-State: AFuF++nyEQSxSzw6lWASYtd0ZMdo9DJ0Omd0jOnFwcO5W9QayHZIlEoO
	XSOmCZ4P5rC4/FjbPGlnSnKUe0hLFKtDcDtGFM0atpH4H7L0aYV8I1uj
X-Gm-Gg: AYBFou2FVyxZyoc118N5zgPC4vnyn0e5CAx6K+4aGzi/UxcB9KeqVtDzyCK5yROkUni
	DEgdW+Bulyb4mHy9/WLIPmtjNIyv/XQxr0Gk9T1nJbrYRKIWU6JubDQcf7XWWAXiZ2qN/Re9lCv
	lgQ/Y1dXjk2fSZFJnaVTHc0U31PydMx2nUcjRUKIGGpREkh13kWe+b+l649n+m6N6usnJz5X6d9
	M4yokgwfBSlje+MZIMkgoTLO2mGeeBe1JrX1iqK8aJiXgiSzndnZWy4n2Zd5d/tiHYENRr3U6+8
	IEkD4iy4XXEOv7pznY1HGk+Vkam6q257+HBFT/nfRJgfDMWqUtw9xNiKNYfla5X4L4w+u04hBHb
	oDCCzzghddf5zvdCGwyCBRBs/mbHL+cR6zCHqxc/FdTCpCZF8xBvI+N1YGatc4KAhHDMoSfDdTh
	FG602tzSZpDlyl0Zy4WG1r0jiopcHusiplmhvmai4Ez/VNjK4w4k+9JjxK4RdIjvkTCeRF5VlZ5
	QF2A0pDjA==
X-Received: by 2002:a05:693c:8942:10b0:33e:6c89:abe7 with SMTP id 5a478bee46e88-33e6c89c06cmr76936eec.3.1790097411255;
        Tue, 22 Sep 2026 10:16:51 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129b3a9sm6589192eec.13.2026.09.22.10.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:16:50 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH] virtio: update multi-line comments to the preferred style
Date: Tue, 22 Sep 2026 22:46:36 +0530
Message-ID: <20260922171636.201408-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some multi-line comments were not in the kernel coding style.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/virtio/virtio.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index b6c9e927bef5..c6dffced864a 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -51,8 +51,10 @@ static ssize_t features_show(struct device *_d,
 	unsigned int i;
 	ssize_t len = 0;
 
-	/* We actually represent this as a bitstring, as it could be
-	 * arbitrary length in future. */
+	/*
+	 * We actually represent this as a bitstring, as it could be
+	 * arbitrary length in future.
+	 */
 	for (i = 0; i < VIRTIO_FEATURES_BITS; i++)
 		len += sysfs_emit_at(buf, len, "%c",
 			       __virtio_test_bit(dev, i) ? '1' : '0');
@@ -80,8 +82,10 @@ static inline int virtio_id_match(const struct virtio_device *dev,
 	return id->vendor == VIRTIO_DEV_ANY_ID || id->vendor == dev->id.vendor;
 }
 
-/* This looks through all the IDs a driver claims to support.  If any of them
- * match, we return 1 and the kernel will call virtio_dev_probe(). */
+/*
+ * This looks through all the IDs a driver claims to support.
+ * If any of them match, we return 1 and the kernel will call virtio_dev_probe().
+ */
 static int virtio_dev_match(struct device *_dv, const struct device_driver *_dr)
 {
 	unsigned int i;
@@ -565,8 +569,12 @@ int register_virtio_device(struct virtio_device *dev)
 	INIT_LIST_HEAD(&dev->vqs);
 	spin_lock_init(&dev->vqs_list_lock);
 
-	/* We always start by resetting the device, in case a previous
-	 * driver messed it up.  This also tests that code path a little. */
+	/*
+	 * We always start by resetting the device, in case a previous
+	 * driver messed it up.
+	 *
+	 * This also tests that code path a little.
+	 */
 	virtio_reset_device(dev);
 
 	/* Acknowledge that we've seen the device. */
@@ -615,15 +623,19 @@ static int virtio_device_restore_priv(struct virtio_device *dev, bool restore)
 	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
 	int ret;
 
-	/* We always start by resetting the device, in case a previous
-	 * driver messed it up. */
+	/*
+	 * We always start by resetting the device, in case a previous
+	 * driver messed it up.
+	 */
 	virtio_reset_device(dev);
 
 	/* Acknowledge that we've seen the device. */
 	virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
 
-	/* Maybe driver failed before freeze.
-	 * Restore the failed status, for debugging. */
+	/*
+	 * Maybe driver failed before freeze.
+	 * Restore the failed status, for debugging.
+	 */
 	if (dev->failed)
 		virtio_add_status(dev, VIRTIO_CONFIG_S_FAILED);
 
-- 
2.55.0

