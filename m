Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3DB3A901D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459803; cv=none; b=mwqCJDZPVNuzBqEOAseokWStBf+Eq06C6T/IuWy+gzjtDNFRXJMVr8uUS7A6vqc6L3z3OmoKwTfkasTv87EUzO1dEFEfpBT7AcpqoHSjxNZz/By2dD1rhLjAEWHNT+1hoRR8zxOcPBoe0cDnabdFDqA03ZoNXEH17AzwJT2om7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459803; c=relaxed/simple;
	bh=Cjb0hFk+lYAxfdjkO8gmpN8O/Agd+iJy0foNMq2/kIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGOCMfXjNo3ARN2UDJGF2M6PwCvt74AQbCf/Hcr4d3CWpSvOK63I5RBHWUfLj0cIJJZdnktSgH/eXcfWpBMXkY0mRiTRCVHSaB4x1PJLl3OiGkZlgn74doSG0IGwOSN6QbBvhQXXpYXRbI776QnkJYfUcOmAL1MHpLkci9q8nKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQBMNBSA; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQBMNBSA"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-5332b967eb4so5438261cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790459799; x=1791064599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=prCdYd82dRpV5/XCGhA/DCM01QvpeUvoZ3P5eCQY9/c=;
        b=SQBMNBSA0F5BctiUKIYpoIYylqT23AzryuNWExNUyiEXuI78um2c3BaN94wmkuaF8e
         HMEJqTcJhZYIrRPCDSWuq0Uvd+jMztOMkHJTMaFEalTGCWB7zqrav9CYhMPTp8nNd79x
         SLy4u3oStq5SwY/IdgAoUbiGZRysPmiivgDBnqidjm2YmYr/TnjTnTaia8Y1hhHi4qxe
         LRvVPvypZ6XigGbTUZHbMRnEZeK7tVDfKRxW+od8EHkQogEnecJSqfbEe9RusyAszTDn
         BesziaQhnhpefQMcG3t4ns3B9EC5KvUHs54JfCX8MDAZGv4EsimT0rTLNy+DDz9nwtv0
         nJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790459799; x=1791064599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prCdYd82dRpV5/XCGhA/DCM01QvpeUvoZ3P5eCQY9/c=;
        b=WxJ5F7205/RAkHUiYlwWpnT0pELfmvnWhYhsZc2JVNnmQBWCJC1bvF1tyZEqQ8wY6X
         F//h9B+4VC+8kfxc8dTFGsNl8yxEVBLhW1ywuskikQDONaL8/OUNTIUKY5S0dHcJfC7C
         23J8GJR6KR1LekbAIvJbZo7h8R8BZyVnE8n/DmSZifwXaYAnYZ08GCrzkd4+0Cdex3xf
         weYQ9MkkBVlJXH1WQK5gnX33WmoAxoC/JMuzQHaO8yrArGQWsK25E1CG910vjBKjON3S
         BdhYVgoSjIoGq4jIjjL+ldlc34F3al1gGqcxap+jBejTZXkaa80OsyzjqV7oTMP74SOX
         jDNA==
X-Forwarded-Encrypted: i=1; AKwUvBzdvAgVl6YvrdO8qJJub5dxSCytuEncXjd1XgehaImAyhjqbI85BPmejAHpnrdnKu+ly8tVporIiog1WXY=@vger.kernel.org
X-Gm-Message-State: AFuF++nqAUD0I2UbJPWV/KxWy9tCTfs0DTk7yD18Btkaqbqq/5GQ/nEA
	Kn/r4r4hncRPwDnbTzobZWvpO9MY0xVqlfTWfqap95YardpGNBv7fXQR
X-Gm-Gg: AYBFou1BrF4MnHrAcbGRETFMzQJQVkH0zhZqQLfG1rKbVeJGd6BB9M/JNH67ewpNRsI
	nvGCm6tJ3vKTagksqda9OtMXf0ieiL4nqgaOlK/nIJzh8iHSFdXVEkCwQwMfpzemCwzlfRK4LHO
	+m/ferJyqtDN3jjOkoTruTddkIOTni+gJ15qO5AYMpPvRR7rk/8s6UwXoG/OAtURaR8N8JChs4d
	9dmuyMFOoF79rpxZRQraTUXvtVFKUSCsLEysOO7x0l+l5nDm/TB+XmH/fJmfuNLDT+u3rD+IKhH
	iq5nrta0bwixNi09aTyvA5QfCgnA/Omy0U14CuKFJ7/4Y2I7Tr1nF8FpthP8MrDtwg603/kDrh2
	8s88M/ZsdMTlv3M+FDvKkfILgRbK/WVrgiWN9yQSy+xMSVf1LtyLZ4cyUWkMc2ij7xSmNQqxn5f
	3GHK2412r643VCgpGWCgP0+U1W3p8aTA22SWPI1MOJk2ezJUHwCEVzuO6uGbFe88cWMgZCOmdDB
	CdicTr8pPz+5mtEplNofOk=
X-Received: by 2002:a05:622a:6115:b0:533:33a6:8739 with SMTP id d75a77b69052e-53333a688a8mr24895121cf.7.1790459799409;
        Sat, 26 Sep 2026 14:56:39 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332201fa44sm26850071cf.4.2026.09.26.14.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:56:38 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] vdpa/mlx5: Don't free QP buffers if destroying the QP fails
Date: Sat, 26 Sep 2026 17:55:17 -0400
Message-ID: <20260926215632.1343807-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qp_destroy() only warns when DESTROY_QP fails and then frees the RQ
buffer and doorbell record of the driver-owned QP anyway. The QP still
exists in firmware, so the device can keep reading WQEs and the doorbell
record from memory that has been returned to the allocator. This is
reachable from teardown_vq(), which destroys the QPs even when
destroy_virtqueue() fails and the virtqueue still uses them.

Return after the warning, as cq_destroy() does, and leak the buffers
instead. A device in internal error is not affected, since the mlx5 core
reports success for DESTROY_QP in that state.

Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 8563fec2855d..a01cd890bb58 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -483,8 +483,11 @@ static void qp_destroy(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_qp *vqp)
 	MLX5_SET(destroy_qp_in, in, opcode, MLX5_CMD_OP_DESTROY_QP);
 	MLX5_SET(destroy_qp_in, in, qpn, vqp->mqp.qpn);
 	MLX5_SET(destroy_qp_in, in, uid, ndev->mvdev.res.uid);
-	if (mlx5_cmd_exec_in(ndev->mvdev.mdev, destroy_qp, in))
+	if (mlx5_cmd_exec_in(ndev->mvdev.mdev, destroy_qp, in)) {
+		/* The QP still owns its buffers */
 		mlx5_vdpa_warn(&ndev->mvdev, "destroy qp 0x%x\n", vqp->mqp.qpn);
+		return;
+	}
 	if (!vqp->fw) {
 		mlx5_db_free(ndev->mvdev.mdev, &vqp->db);
 		rq_buf_free(ndev, vqp);

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
-- 
2.43.0

