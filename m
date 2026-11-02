Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652460;
	b=ybSX0JhsGTQeEs6+IWe54lAVtzQdCUhp0Z9qVsecd1jG8HJvziYWFId7OWyp6KsdU7Dj
	 S5NZnxeMZR3JCHoCeNssl5dNz1L1F4kRAZTKiLaJ5vz4RLOIufEkWu4FE5Daj3xrsDv61
	 9fgYiUSODhwZpCNOjERlfk4w6Ar84Q+IQp4lh1FnUYMGX+sI9Wj+7c4wr662vI18A+C3n
	 Jo83DqB1tdeZhO4Dub7Zl2fJMfNbos7H6xhBXdaf+7vk6NoKPfB9t1oMLnDFsLwvuIZ9P
	 eVZu9sxHI3IAR6j9mwSeKXp5trLrJDYKnjydk/SkfENKGQsgR6Cs/mJT0xgbPowZxaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m8mSi3IAorPrWHZPk3j86qqURTkDETtees0X+vPzQzc=;
	b=MQ5j4HdkzPNIYejgYGAMiSWilD2LCAE6I+p/gWQa0o/2cNezrjWCVG+thWqGIpDlV7aS
	 Qly4o2vGF650Wmxw7on1Tfs0j7rS/oRr6UgEjVEo0q81ij6Jkwngj3f57o6HU+kxwLf/T
	 dzuAPD6nMVeMbmo+aaMg++/AB9wT01kL6kp8KZDCJCumqJ+TaTkxVWehJYbPV12M0NPqC
	 G5h5cOrGtDmqbfEtD65KOGrGP1uVe7mVLtWTo/rCPBtdfxbSRSO/1ZgTvaFwqyrAtOaR/
	 /BBgakZX/aUxuTOzduunDSB6MXkCWTrhdt85jqHlK4B3lfL0T31v/imJvj9rliowJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZnYnqIE;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E6606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717E6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZnYnqIE
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-54465f79af8so24758101cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652459; x=1794257259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8mSi3IAorPrWHZPk3j86qqURTkDETtees0X+vPzQzc=;
        b=cZnYnqIER6ZM+LMqeGSs/kfAZZKn+eV1lvfVK+Z+kxB+6zBHSOQqQ6TyjYNrH8/2/W
         WmEhYuSok0kKu+i+wa2Eklz8aYBRBb0Z/fjoNipOKV6ENsViGC8CRBxBTp2YFkELGguW
         GZfqgdh3jMfY99gThNNVp0uj/qEtPvCt6eTvfcN+TtOULBp0WaFmSaqTK96zqIth8JMH
         mB/z82T7w/i6mpHcDKkA50MyvjzfW0a4OzXcjjOGLJiIrDmaqh0/qL4kOGl2IKlVf2Ob
         rgemahoauVwDN1txrOcjeu2VJbvtl/Tqt8YdhZKiQ7RrTc7fX+bfYLc0mWtvnY19ZNkk
         5/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652459; x=1794257259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8mSi3IAorPrWHZPk3j86qqURTkDETtees0X+vPzQzc=;
        b=wYKMQfbBejFF1ogu34Cd0KBQ4KhYd7uhucTxw2Z4VMRqdk1UVqnyoadm5AeQO1Uvnj
         dewjQRSIO23GZaFuxzPDeNrP6G+U+Q+CuFwTv7MnimTv5m+3II+ZKJg/qPgy2uhH4w91
         YJNG5GJTjRec5HQtN7Y8Stu5sZUnc/gfRN+aZSGP7hX9WnPZ2EXCgZueXTTB1bnpctmV
         u8MZ8A1tSnmVCuwFPQfBXoQRG6x9oNNn85tCNn95LoiePszjTwN6RtwyqCnTWkU3wwOJ
         zIpXbW+KDBh47FPRB8In4iDpT6nzWeqoDzJ9Zf80goBK3WPX+018jYPxyft0IaPJEsoh
         GXXA==
X-Forwarded-Encrypted: i=1; AKwUvBz08RzOB2tkut4+JFzkmy2oz2EuCXemhmUJqEzP3+nKAvajkMpON4pdIYgWSmkg9yIb/7pPH6u6dj+SjAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fgSV6BwQvku+Mc8CHl9YthAufLwfZspiHBDTQYkf0hfdE4fXf
	52VvAMYAF4nUy6RPg2vbsp0HZ7pKUaXz/fpJ7Bxn+eOvYGZls6QRmgps
X-Gm-Gg: AYBFou2NLFKmn5WcO+5DJe8z7gQ/7MTP57HIxOb0WxyDpRO5MBNAVV3Jq52nyZhbHUb
	EEV8AbhDKhR9E5IV2PDeFatxGo+5msUMbQVxIdoWN/YWt62QbJ/pqi77oL7mfHz+89UZ93BHc+Z
	4O97j/8w8HZSrmcpYHhX1il4o/Wo48s4RuHw/fFtt47cSxk1AQksGVG/OQHxzvuJByTkTEyyHqJ
	WmLoGOI5lRn/+cDQAkpsvVHj6MaLzA33mzPyPlfsrY/cJHfvCxd9wnNMId3UX0Gqed0yJ4r8i1Y
	PcEbIUBGePbctgQ9J1uZbbYP6c38lp/wXS0+/q8j3kpp+6NchQHonUMLzPi1/Puk+WV33y72yog
	eCxoVv8UECBxDe9GJ6v4HR42Y4v/yJDbrP3/RhZ4iYnCRdaQiBVuoVwXoqJVjL8rAVjDZVSdQ9P
	F4qsUCAzGD/f+vkMIorQaZ7K84l9KbrSO334kI8P2ak436u+ZPd92xqs461Qu3JMHep2lI8lrxz
	SDLy/k2ktFRSWxaJny2moLPBahmUxqmmoaV7uAKeMXbjDC/3ik6YxSf7CsFbdjvqfBY9ZODNkWn
	BwGHs4Zw7SG6qN86g05By8TbC/rtUVyN7ubSyl2WrT37dn5LHzAE
X-Received: by 2002:a05:622a:1826:b0:535:a5fb:645f with SMTP id d75a77b69052e-542b86e1d84mr191735211cf.74.1793652459409;
        Mon, 02 Nov 2026 12:47:39 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e23b0bsm99669676d6.2.2026.11.02.12.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:47:38 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] vdpa/mlx5: Don't free QP buffers if destroying the QP fails
Date: Mon,  2 Nov 2026 15:47:30 -0500
Message-ID: <20261102204734.443140-2-oss.patchbox@gmail.com>
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

qp_destroy() frees the RQ buffer and doorbell record of a driver-owned
QP even when DESTROY_QP fails. The QP then still exists in firmware and
can read WQEs and the doorbell record from freed memory.

Return without freeing them in that case, as cq_destroy() does, and
include the QP type and the error in the warning.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
v2:
- Shorten the commit message (Dragos).
- Drop the Fixes and Cc: stable tags (Dragos).
- Print the QP type and the error in the warning (Dragos).
- Rebased on v7.4-rc1.

Compile-tested with W=1.

 drivers/vdpa/mlx5/net/mlx5_vnet.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 8563fec2855d..20f4ff67c975 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -479,12 +479,18 @@ static int qp_create(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq
 static void qp_destroy(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_qp *vqp)
 {
 	u32 in[MLX5_ST_SZ_DW(destroy_qp_in)] = {};
+	int err;
 
 	MLX5_SET(destroy_qp_in, in, opcode, MLX5_CMD_OP_DESTROY_QP);
 	MLX5_SET(destroy_qp_in, in, qpn, vqp->mqp.qpn);
 	MLX5_SET(destroy_qp_in, in, uid, ndev->mvdev.res.uid);
-	if (mlx5_cmd_exec_in(ndev->mvdev.mdev, destroy_qp, in))
-		mlx5_vdpa_warn(&ndev->mvdev, "destroy qp 0x%x\n", vqp->mqp.qpn);
+	err = mlx5_cmd_exec_in(ndev->mvdev.mdev, destroy_qp, in);
+	if (err) {
+		/* The QP still owns its buffers */
+		mlx5_vdpa_warn(&ndev->mvdev, "destroy %s qp 0x%x failed: %d\n",
+			       vqp->fw ? "fw" : "sw", vqp->mqp.qpn, err);
+		return;
+	}
 	if (!vqp->fw) {
 		mlx5_db_free(ndev->mvdev.mdev, &vqp->db);
 		rq_buf_free(ndev, vqp);
-- 
2.43.0

