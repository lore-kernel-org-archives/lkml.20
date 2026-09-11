Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067C73E5585
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094491; cv=none; b=Npul75DiD7DBYdzykhh4Jici7unPwBQWpNXkWwnikpT4KOMktMWtXTtsM6P25McJVB00pkdMXP8v+LH3uo4zm24Qy4CWnT/nEVzPPJJha1j9qOkjga8OplKdBvuE21cHkdHA978EoDKkzNZzd1JwtC0Xa2UyHqYSnGkP+OBVkHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094491; c=relaxed/simple;
	bh=sjESdcS2EM2vEsLu6P8HDo2aEZEHCuRQIE8x3kwLsDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GPFYXfkBrOuA9GhD9WOTfJwjgxn9x9MDAGGp5s+WDuvSb5CNlhRykpv65La+M7M2Tq14YlEuJOQDMqev76McFXTtBVrcvv7Cq8XriDHTULZ4n301qJOsF2SNNcXlbcclObaAE4fB1nytdIe9b92suRg8mxY/hDIReu/sv4Jw49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SabW6JuD; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SabW6JuD"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309d6188e1so6031331cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789094488; x=1789699288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4Dzp3Tnbb5RWA/Zbp2U4elxI7yc4utkRSfWOSPNhYE=;
        b=SabW6JuDlLPKDN/Xt74mRP4jkxEufO3CnqlqZAipa2FOJX26/jxgAYMrVlG1bzm9hh
         QWujq8GnP8VCQJ2IaA4euzIDezx4d8CyRtbWdWPInuluYGBe8NrU6WovzM6+RQ47lxXa
         OGu1LTYtqUF4dQmroCCktPVlMsVqnQIA0hrHIIQnFva5lH5LrPQVek6PMfTcFtnTTRxQ
         Pio0Qf3wj++uZ0XejeL4lutw43NdmBxCHMUt6qk1qMBiT0luiP+GVc4uuXWZJ2/A04lF
         Wlivq5FgDfhrN1DnNUDZDKkMFwZ4+13zCG2/OPWTvbBHgGuqYUil+s4b5hzthl2vPtpk
         uuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094488; x=1789699288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4Dzp3Tnbb5RWA/Zbp2U4elxI7yc4utkRSfWOSPNhYE=;
        b=Alq3ROWIW5J4hjQJeWZ2vRD/MjuQmWCwCkJgvZU/EzXkE6PswP7Clw6VSbnDFwoGaG
         /55GLEf6r8V2ST5CiCirEMuoiygXBBN6uCRRVo8gHHrVp3apNYtXgyzv9cIAE27fcxqF
         su1A1drrgKJOocpVOwv0i1aJSI9QACrT134cg3K8xYtYFzPoY/zv4/vfDRLh09rF4hTO
         I8G36j76G8n7AhJl7Y+STk3L3QcMwhAkLXb53A2Hk6z5TfJeIa4qKZQrz6M4J1ys8TaP
         5boC6Np2u4ZDh/XoaK54G71lY4ripy2Y0LnptnuOX6d8Zwg+a1VGTFd5/C092Mio3ydr
         ZMvA==
X-Forwarded-Encrypted: i=1; AKwUvBzvrE7OLFT7mAS0H5hBRNuWG3c2JFSbEOYN4WHQ+IMHenUEY7qfFE78ZkSDWTb1PWvCUulwXxqfV0O7BGw=@vger.kernel.org
X-Gm-Message-State: AFuF++l1R2phE8zT8cvmwz/8FhMT+6N3LdShQxwPSGRMwHg42QxaXnfn
	+WHsK+wSOnf36NOUgabqh+4XIDL3DiCz3X9xSaE2JRl6xRL9b+CKUKPYfHG3NR+7XJw=
X-Gm-Gg: AYBFou0PkwQah3pkbtM71ksdPQgEDtp+trmwWDXrNYCpcc5ORG3d8H88eIZJ1zgz05M
	mNfJymHC1lyde7KCwYdmEIkjKLAC1vTle5ja4cNa4oZZTPDa6Bz8WqZV1OI0r9HEFcz0MxQe56Q
	74pfK2/AlC1aL5wp1aQbuH7b6vxSgG5Io05PUy2fgRk/hwz3PBIj3b+A0dEgANi4+HpFU2HBMwt
	cD5VZ5klUWFrfVA+cCId56igGxGq6D0oc5LSNKqFqgyjCqx7abBI/7xmTiA3ell69tndO2nn/+D
	PLgD3SJ8oGt/Q4T2aE9GtaiwN2RYohnuZ82FHfwqxf+Qg3RNBC4MZmP6anFmWD8gg2Ju8MYERas
	2w2BZjXvYA828YYhFS/xfzKoQgfonvUV1X4nHKx/2fd0N8v5jvJkDVerUQTzCASSIhM2Y6bKFTk
	382zf7eqiVyh1emNdZlB0b9I6QbIhxqxbWdR2MkuAN+fOPS1RdX8pOiaiCU8SGRW2LNaX5m1RmL
	N/uw49clbMyD3CaRA==
X-Received: by 2002:a05:622a:5cf:b0:530:9ad1:2f75 with SMTP id d75a77b69052e-530c876eb9bmr36932711cf.42.1789094487939;
        Thu, 10 Sep 2026 19:41:27 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d89f9sm10651196d6.47.2026.09.10.19.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:41:27 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] Bluetooth: virtio_bt: Fix probe error cleanup
Date: Thu, 10 Sep 2026 22:41:24 -0400
Message-ID: <20260911024124.1527637-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once hci_register_dev() succeeds, the HCI device is published, a
registration reference is held, and power-on work is queued. If
virtbt_open_vdev() fails, the error path only drops the caller's
reference before deleting the virtqueues.

The registration reference keeps the HCI device and its callbacks alive.
Therefore, a later HCI send can dereference a freed virtqueue through
vbt->vqs.

Unregister the HCI device to withdraw it and drain its work before
resetting the virtio device, reclaiming queued buffers, and deleting the
virtqueues. Also, free vbt on every probe error path.

Fixes: afd2daa26c7a ("Bluetooth: Add support for virtio transport driver")
Fixes: dc65b4b0f90a ("Bluetooth: virtio_bt: fix device removal")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/bluetooth/virtio_bt.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index c20d54088c8c..8c55b538deef 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -315,12 +315,12 @@ static int virtbt_probe(struct virtio_device *vdev)
 
 	err = virtio_find_vqs(vdev, VIRTBT_NUM_VQS, vbt->vqs, vqs_info, NULL);
 	if (err)
-		return err;
+		goto err_free_vbt;
 
 	hdev = hci_alloc_dev();
 	if (!hdev) {
 		err = -ENOMEM;
-		goto failed;
+		goto err_del_vqs;
 	}
 
 	vbt->hdev = hdev;
@@ -390,20 +390,25 @@ static int virtbt_probe(struct virtio_device *vdev)
 	if (hci_register_dev(hdev) < 0) {
 		hci_free_dev(hdev);
 		err = -EBUSY;
-		goto failed;
+		goto err_del_vqs;
 	}
 
 	virtio_device_ready(vdev);
 	err = virtbt_open_vdev(vbt);
-	if (err)
-		goto open_failed;
+	if (err) {
+		hci_unregister_dev(hdev);
+		virtio_reset_device(vdev);
+		virtbt_close_vdev(vbt);
+		hci_free_dev(hdev);
+		goto err_del_vqs;
+	}
 
 	return 0;
 
-open_failed:
-	hci_free_dev(hdev);
-failed:
+err_del_vqs:
 	vdev->config->del_vqs(vdev);
+err_free_vbt:
+	kfree(vbt);
 	return err;
 }
 
-- 
2.43.0

