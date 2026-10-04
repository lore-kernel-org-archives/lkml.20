Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139783EB105
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138148; cv=none; b=QNzWZgkoaYteLJp1tgpYtEQKA15QsG9McVuNgMJ3LNrJYl4PrVx98k/htEJVwjK66Kg8x8vxDzHGCFx+nZSWCQ8iDQYxlDzUcFXgvYk4bfRT2JPr3rm+CyFdkwsZo327mwNRAgf6yg0qkL0pi3lrHp7REL46/IJgoMqcisF8qdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138148; c=relaxed/simple;
	bh=oWV1x6C2ME/T5Yb2MZ7o3ypqhTuzYDHLFIWMHTAMo24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CMQC9pWh2mBSLEKlcg4WZqXmRZJb/YkpD70xOdrarJM9CBcr7UvlB8+oOtDywaNnXN0DtAkf4u6imWYD7XQ8V0SwHYYS3sk3adi4528A7xaBcdfWZAV1b25OmklwM6oIaIi/N4nA0OpmH9hyf5jFO8I+suBDCFpkBfA2pysyJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLoC9oum; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLoC9oum"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so8209741cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791138146; x=1791742946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CF4IOObCfjFDOCjh2XXYxYv4lcIPIAWQIMOn46YsfNw=;
        b=cLoC9oumtHi2+NPyQvkumHQwBnwGRT0dJCy7UsbLdoy2ZwygQ8v84QDuBBaytPcLQ3
         xsQ/tQ0G5K6m22T2zAA4NjNlJLJpEqFA9Bh6f8OCbEru4nuSUq5ilL/75fklI9s9cTAQ
         PjHy5rcN+ttEzR9yAEhMJIX9C+mXb2HZnArrq+URcXj90Gk21fyCVszN4dlEEVLACMlp
         OMOwCwzKHNOEtURBUNnKKbeVlPlFURK+Y18dWN+6gtPlaEDNC5o48KBQLzclrwu/PJkg
         tS5Hp6/sxQCjAR6Rn/sevoxvliJwnqbog8C3GihMCfnTVlgDstmEaU8LUTegyNo1w1it
         qsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791138146; x=1791742946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CF4IOObCfjFDOCjh2XXYxYv4lcIPIAWQIMOn46YsfNw=;
        b=Bm4GRmW0vQiclOFebrQj2SwhzZqzGKWfPHYnYYykSNvZVL0qNaiaXbGIKRcyhn44y1
         fWXJZBOGt8xTQ0gFe5AtpTyYM5aj4L+MgBhQrjRdxjoSj1aiRF+ycPQ7J3v6/G4JvpCQ
         ICpzscsEyT5qRBoZdm9MsSKQnmuuKyfh5opI3TwIg6Gc1D7skReyHLDK/XJuqoMTYbEo
         9CSyedoZE+FDmfDJ7muQBQb67IWialabytRtt0jRfYd92kxO3VQjb5xmbK4TCzLdpedh
         TCCiXHAWhCNk9Eo5995TQXZscKpcmsMt66vCx14JBxjHru1AaDOojIyC9R6jQo6uZB+p
         g4pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlJFhekDpMfiVfmEqjAqwwRjD6mqXb8H36toBV1ht1jhoXdkppf/2WVh+1gbGLEs+EhfF0OXyHZtDV74o=@vger.kernel.org
X-Gm-Message-State: AFuF++mKKoGo5CMj0ynOPRb6CygJUlhiWogKhX/+7a8Ky4QabBzADTje
	kMxxP1a3ovKCZdsGNvbwF3YoXyAczt4dUTti6SZj1KiRxIdsarb7LD2k
X-Gm-Gg: AYBFou0qt7hjrvHxzCabMBrjl1GghA3M/CznHiNl8x4bZk90SawZlhBrYLKi7gg7znW
	JDby4eky4a91xEyGDXMvSgcPLOiRspVH2qRN5t6kw5FdblOEyUaxakgMR8i5tBfMa64Mc5dX3Ro
	rJLdrlo63uXoCWW8kNFa5eTlqBQFmPn5qGsxe+b+PLQnWvZfpp5JPUpRDC8RHpgBiUKOi0zQS51
	PTGLv2AGbTI6Ge1kmmGFUQ7x3WswlTb53w8cm4t2bXeFaV62HZ97ub3YFKLFj+O5lZdjiyJAY1p
	SgTxUB1LvDskFTI+/UynGukHOt9Qny3uB6G9hAzTQT5rAv9OgE1a+HRXbLVTsqDc5AT6I+c+6t+
	Reu4lvx2MTO8DBy3XjjpO3Ptt4PCdZ0QXjJwj2yg757L6l82a2ED18AIorIXMrSjvpHrS2KGRDX
	HJWgFw/BWU9XLZLN+EGX0bodLbVSRwj6G1bE6UGLkDjuZrmavhFBY/U9t7436dc8RBdLiVpdKNH
	YKBBT7HB9JGmQvlDc5DO20UXzEl9Y82
X-Received: by 2002:a05:622a:618c:b0:531:ab4:c604 with SMTP id d75a77b69052e-533bc652ea4mr174969861cf.1.1791138145927;
        Sun, 04 Oct 2026 11:22:25 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5351fd92b58sm27430061cf.21.2026.10.04.11.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:22:25 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Jean-Philippe Brucker <jpb@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	virtualization@lists.linux.dev,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] iommu/virtio: Reset device before deleting virtqueues on probe failure
Date: Sun,  4 Oct 2026 14:21:10 -0400
Message-ID: <20261004182218.177343-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

viommu_probe() marks the device DRIVER_OK before populating the event
virtqueue and registering the IOMMU device in sysfs.  viommu_fill_evtq()
hands the device a set of device-writable buffers through
virtqueue_add_inbuf(), so from that point on the device may write into
them and into the rings.

If either step fails, the error path deletes the virtqueues without
resetting the device first.  The event buffers are allocated with
devm_kmalloc_array() and are released as probe unwinds, so the device can
go on writing to memory that has been freed.

Reset the device before deleting the virtqueues, the way viommu_remove()
already does.

Fixes: edcd69ab9a32 ("iommu: Add virtio-iommu driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Changes in v2:
- No code change.
- Reword the commit message to explain how the device can write to the
  freed event buffers.
- Add Cc: stable.
- v1 was mistakenly posted twice; this version supersedes both postings.

v1: https://lore.kernel.org/all/20260911011249.1498825-1-oss.patchbox@gmail.com/

Compile-tested only (x86_64 allmodconfig, W=1).

 drivers/iommu/virtio-iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 587fc13197f12..fa72ae23b8afa 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -1227,12 +1227,12 @@ static int viommu_probe(struct virtio_device *vdev)
 	/* Populate the event queue with buffers */
 	ret = viommu_fill_evtq(viommu);
 	if (ret)
-		goto err_free_vqs;
+		goto err_reset_vdev;
 
 	ret = iommu_device_sysfs_add(&viommu->iommu, dev, NULL, "%s",
 				     virtio_bus_name(vdev));
 	if (ret)
-		goto err_free_vqs;
+		goto err_reset_vdev;
 
 	vdev->priv = viommu;
 
@@ -1244,6 +1244,8 @@ static int viommu_probe(struct virtio_device *vdev)
 
 	return 0;
 
+err_reset_vdev:
+	virtio_reset_device(vdev);
 err_free_vqs:
 	vdev->config->del_vqs(vdev);
 

base-commit: 7704c4c5bb127673b4f0ead839919db573559e38
-- 
2.43.0

