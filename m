Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED054EEC4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111552; cv=none; b=OSyRiz+rK0UgSmgGTBLYWujPxDls8qfs8cQsCACZ2+8dA0ZGMF5rWb2U2ws+S5aZoV3BAQ6ODKOFwDBjz8FfASUmGbf433ZoG6fm9HlRuQobmJpP1AtveTJkLOO1mTKKQWLcgKPy7950dhM6Hwl7EO4DEkwJyGcXyI6TMKBPLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111552; c=relaxed/simple;
	bh=2+E9WLAhddquoAhrHExJTH/ipVluXO40UC60vRyiwHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sd5LNOzOfWPE5tsXpGFMmFAdU40HGPR0XjYLpyFGA48qKvPRWVEoOl7dQThSrG07LWNqi40sc6hOqGLnehH5pxtfcbxhPJzfiFu3TJjnxaZ0rF+kT1yjJR9rOQPEgMInZRGe+COZzocCz370dWqu/pPaT2E652zomYVGV+WkIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+ObHwaF; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+ObHwaF"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9106feddbdfso2666376d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111534; x=1790716334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCOJ4IYbfFaRdEJKYXl8sjbEptgWjDvoJQmY8J0q84k=;
        b=e+ObHwaF5irV8lCqiCCfQD+0jvXngq0cWnSJ7DRgHKo8UjBNIm6eXvW2tPIXT6xwtM
         ZbRx/c3Z382fZ37xfKtJCdtx4RP/x5qWVB6SzitNr2swgL1QnILKeKZrR1D6OqQM/JY/
         nSul8fAW2D91nnhcX08DeltgmFw0jh7yboE5LUcAU0rTC/WHH7QCnjZ0Phc+IvO78tDa
         5LxIc8KqPP3gCxmQCBAgtrmbIGixMyyP34jSlwKClHElfzMJVYQhpOOW0vipZM3MuDk4
         cg1hDTsH7gYlLYOk5DE2UEJRV37eh2BLnJkoX4nR1jBVB1LLMguUn4EeCQ6MdVTCCzUv
         gVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111534; x=1790716334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCOJ4IYbfFaRdEJKYXl8sjbEptgWjDvoJQmY8J0q84k=;
        b=s1epD9GaNpylY7uJEIaAXu9SQfufi2NJ5nqttJa5924lT2Sc4A2xIih0x1M0c6XFrN
         YP3DJRKvvyh7zckensxuXgOlz/UkDRmScY+CLpCEzG3mxAqkjuX+qqHAf371r57/bA/T
         dydN2RnQYueLWxgHo1Jz6u7fLqYoLd0RQ7hn7rSSlzih37omr/U6tCO3Qd2dvpflf3hR
         pY0AR/k7Qz1idg8hCuG3OyzNOx0zyBSJ7WgQotbdP0u2H8S3y4ROCdeLFTXrDHfkDDYj
         KBJWhSM1Uia2pO6DzctypWlAvgse4x0f8OSrL2lW6teKM14R9YcldiGqeZPK8D/Nbgin
         9Ehw==
X-Forwarded-Encrypted: i=1; AKwUvByUBt0ooEQkJxYsaLx0w31wHsjQKd904Zs91bzQEFRyTrPnCW6BFq0JB60tMZ15cXAV5S6nSAM0Tv2isA4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYp7XSyVPTF64x8GUubcFsnjQqvGTdHgAFNaZ1wpEJMHFmup3g
	BngoZqJHHhXsWU84HQBfVMZxob7GTHna2fdjJBXBqYpMI+o9wJ7SFVbu
X-Gm-Gg: AYBFou3xoJC56zt4s8J5QQ9En8kQyaTQW0D3x/HCFo3F9hZMsW/Sqv8hyMLJjSVYM42
	yaPqF+VCkFRXJgmy2gARRi+YcLvbEh2IXBMUEKbk+wH0xFOplGF7A9RNsaiSmUWDSPtY+WDRXaY
	cXrxwcNrPv+A7vVYvadg2FgCfaVajE6p1gdKRQixaw/A+QKuzYSqNxtCtrrJzz2B4WLjbLOd39A
	+I16SjKkT1NvoYXewzCqbR5JDRjvZPKzRlxZLB4EE80GZh0wXYRPC+Ch9mnzqmpaCZQRiz0e2Ed
	9qcCCcXPNW3psITEIqRK75kAQzB+qXV/mR34zU0NJXnW9jYqk1dG3SvGHne/WggYg6cze07tfY2
	Yep5i7oGiy5HMkySTe3WGyhCTGRA1YObRuz+eC9A2FDP9AmE0GGCWtPWawK2D3WedmHm8j0zurJ
	U0HlIbGC92f5IWiDZ+wELcFLmLZgN6gyZhBAotJ5MkpIIoVThZYINRMOFTjU2oRChFDep2Zj5BN
	ca+Okpz4nE4GI+3DhGgMw==
X-Received: by 2002:a05:6214:4a88:b0:912:533a:4a43 with SMTP id 6a1803df08f44-9140c3f990dmr12597706d6.32.1790111533845;
        Tue, 22 Sep 2026 14:12:13 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c4640c9sm6319316d6.40.2026.09.22.14.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:12:13 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] virtio_blk: Reset device on probe error paths after DRIVER_OK
Date: Tue, 22 Sep 2026 17:11:41 -0400
Message-ID: <20260922211207.523999-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtblk_probe() marks the device ready before revalidating zones and
adding the disk, and either of those can fail.  The out_cleanup_disk path
they take goes on to delete the virtqueues, but nothing tells the device
to stop first, so it is still live when the rings are freed.

Reset the device at out_cleanup_disk, which is only reachable after
virtio_device_ready().  virtblk_remove() and virtblk_freeze_priv() both
reset before deleting the virtqueues for the same reason.

Fixes: dbb301f91fc8 ("virtio_blk: add error handling support for add_disk()")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/block/virtio_blk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 32bf3ba07a9dc..ed97dafebe164 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1547,6 +1547,7 @@ static int virtblk_probe(struct virtio_device *vdev)
 	return 0;
 
 out_cleanup_disk:
+	virtio_reset_device(vdev);
 	put_disk(vblk->disk);
 out_free_tags:
 	blk_mq_free_tag_set(&vblk->tag_set);
-- 
2.43.0

