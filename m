Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8F732B110
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123138; cv=none; b=NDeYjwFekIpUfAZFCSy+djTGa+JKsJHlFfFLopcWDd0EM5DGriyqpkvQf16SpVAqTHHfH6+EQT6I3ehw8Bn3Qq76LAs4AUpqh/fHKSEWRk+Ln2AQNk4umJyD/v4ANS9Jwydbwqev3FqcRuK7/JI1QU0ZwUht4oJFbL9QGrlYSMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123138; c=relaxed/simple;
	bh=N+A6ai/vFvUwNv/kA2P3kWyIElTpe7zizyMn2yDiULc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+Wy7GVv20E7Z6EHXpdLm7vZMBmqsmhLN0Vo8uWKR21ex43FFMQD0oyGg3XAk8TCqzQKkiemey0/EKutkD/1KLXTKnkv3ZCTXhZ94d8r9xup5JKu/ZBpS0LXlESDrU2JwteJIGnjjdfFnQyNd+zj6LhdlZkH1a3DyMv45v8MJNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiZrihbh; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiZrihbh"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e63ee7b4cso504636585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123136; x=1792727936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4/QUaf0CkV4SNeRpp+SHFXjQfr9ekLh8jCWnPK82ew=;
        b=AiZrihbhz17fkCqivi44u6cJLaz8drkBYV0gpxlLNtTXhf+Pcusaj7HmTeFIaFof0c
         RR58BgG/K86YTTHxLh/qltdvuVX/wUmRxocstHJ6Dq3UauTKpvNUHET+WrOJwdnXri9P
         EWy4Jck32eAto4hM/QaiVXvkfLKG1iqxOpy2eF5bGd2Nc5kiGOkC/3pOotC52c2mKAy6
         dHEnriMEjY7mT6mR3K0GTxAmxKk3VkqbPg3zTizgfdUriukTUaUOfZZBRs3RcQBsOQyl
         e1VjvPT17t91mcYfeJ1uDtvHRIIuStjhdxGJGHXnotziJTYKK4rT0RBsKLUkyBELLn8W
         Ey2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123136; x=1792727936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4/QUaf0CkV4SNeRpp+SHFXjQfr9ekLh8jCWnPK82ew=;
        b=QrMBOzGagMS6PVWdbcTnxBeOMdPmn6X4faPTcuDKgrZ+Z9w0LLd/HnxWnmTbqH+l9g
         Vi68rJ8PfARhy+m1S1N/SyT7+lYuEkWSw5Xc+JCiczGgbpbUZ4/IOtUMHSegXn59HrH8
         GFFBkI+V69frpzakF6ERiZ6q/RBfQ6DLOtBSL0U/PXAS/LCaD/qzL2hOkiseZR491xVT
         a6AvfsGdnDw/atKGtuiDASoo4eBZHQEAx8XQttLpLSNPOvwmovNKLgMTH1pYK42EaIq0
         DN5UfEvXrB1o7bSdKocLJ5bmriWrvTPJmlRHJWe4DtP/FEECtjJHTPFq7WAzgWp2/NNI
         DhoA==
X-Forwarded-Encrypted: i=1; AKwUvBzFlhmpgLBRH2+W+fvHaJABNOzygNwgaAeQOgmo5A+o182mYT1KE9VBQJJu37kEcy0p1Qd0tzXOwBCksjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrL0zqfIAGgbPfYOGjdJEotRPGboNcgPpOuJxGU9lTIgbDQ0rN
	oBHzemNkHvSOZexv7oF8741P3zsa3aG/fE/M/F63E3MbikyVM8qx18xX
X-Gm-Gg: AYBFou3iHf81/vus/9qE9CXO9D/ctgU5EJpqFm1JFivmMymmKAHNNAPkCBCpkYQpWAm
	XDP8HIjaM6fxhL9b3vF3Yr/GwuZw+yDAVuwD5cxRwj1vMMi9cjbMPKfdlcaXDpC/D5S8AWR0UxK
	VldcEasE1Wk8KhcfD/17LLeRCxqPYZ9Y3s55ESXv5Kv5SZ6rpw6adVh3HB6nEtRDV63a8c6b0vc
	TeURaCG/yDXRBkGrX4Drfdq1IX5X0pe7cApYzC+YQbqyMpE5m2/wrL40nRG6ZSFKGVLrdnIQvX3
	WOujQPihsAVc9QnDDZ6oX8hiO48thD7+rmHVYrRQvwnE7ApElGRKc57FySKQpJbuqc8VmcOfBJM
	5xkIGUBwbW10HJ0NksIaUCBdjbLdiJmO1QPHpGsBKuHWD6bEwDEb92sHQaFK9MSx552yEPFcskT
	A2TOsXW+Chzv8CgPUcdgSg9ojffSEYfMvkqKHPZkUw0Km4MN0w7CA0vU/laWqtNSA/RISrZ+BsV
	r2jIROuJovJ0vFSQOkz7QbQx8IKXd8A
X-Received: by 2002:a05:620a:17a3:b0:93c:89a0:bf82 with SMTP id af79cd13be357-93ebd209171mr3554739485a.43.1792123136506;
        Thu, 15 Oct 2026 20:58:56 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1c1d29sm105968985a.43.2026.10.15.20.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:58:56 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 RESEND] vdpa/mlx5: Don't free QP buffers if destroying the QP fails
Date: Thu, 15 Oct 2026 23:58:28 -0400
Message-ID: <20261016035851.771496-1-oss.patchbox@gmail.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
No code changes, only added Cc: stable. Resending as the original posting
got no comments:
https://lore.kernel.org/all/20260926215632.1343807-1-oss.patchbox@gmail.com/

This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware.

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

