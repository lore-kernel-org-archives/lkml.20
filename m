Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC573290D1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416681; cv=none; b=S1PeyeIOGrshsU+BqC/I+EPBuIYSVfHH1gEDzuspP0YQWAcX4ISbm/DcjkwBoXm6HXSXcDti0uhQPuZk/5z0Z54BOuFxmrMgmIRy584XWUJLvX5/iYcGrF9Z6tIkDevBb03mQBMCuOqegCz60QWH0ZDxEczPJ74hTHc6ziF4P7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416681; c=relaxed/simple;
	bh=YARXCShK/9vVXfiD1gwkK6sm53zPdGGWb0rudFpHQbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWME/a/1RjRqmg4b2aA0qaf5/2Lt7K+4mlJvosc2vLKAf7TmB6N0EtqTXUxf+CMgyQtiv9rNPhkTwKHwzx9G5DOLfdkHnEAU3oHRgadNvJNPFyfnK906WE6AXK8s0aJ3hAsJy0u3SuMqmk7T4nxZyKPxJ4Uobq5ix1eJUALCoM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOIspdG0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOIspdG0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so53261505e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 16:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791416678; x=1792021478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVyDlZ+Tk8cP0JL9kHRLRfhLRbrCqUU0BJbBP7MDZts=;
        b=EOIspdG0YMYc6fC8A7mEqcqUIfuLRLfSr36KWWWAOthJszpcPRAvx820SRXYi9pzKa
         Ndgoj9Ibr15wWDazal2Nz8qrMsXaGgXvBGG2BNVH1LZSGzqmRdpOTGBnBD6LgMPXX9br
         qfUgwEYjsBNd0byzGnypwOeLtpSLHhgv6nddgk4+6sfyfwHmme4QV+Tqm4OXOs9/P6Mn
         Z+JXd8WzlIv6OFilHhhv5iWo/KAvM8bEWZXI0VAyA7DlCpbLHzRPrkYmShrcZAdGdUAS
         1NceryOYI0aRZNWjgpIYKBKcBIZNtShV465vbxqNievzviOnoXpACSTBFHFc3/d4CrMc
         hKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791416678; x=1792021478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVyDlZ+Tk8cP0JL9kHRLRfhLRbrCqUU0BJbBP7MDZts=;
        b=o8Luuh07xot5uaAzf8K1pXPSseIJjESaCeknB/fK5dZmfpgWH9K5RyVbbnc77fklZa
         f92NIrhPYifnABYB3On5O1zOzcsmkXw4QQv2tqtXQd2WSmD+EIUbKucRTwd+dtvXGe5O
         MI55kkAPc6z4n7gzPnPojjOYAsH+eBoPF4BUw0q6jxIbsn8TwJiIKXhbHu1HfjMaaIR6
         QwgwW4V3jgf8zfOJbXOrkyZwoAAce9g9/WbnxDfGOTeixyUF6fQZXEbJMlcr6dzrup0K
         DoK1iqR9wHwRiPyYdjYinpXu8xmVrLTpHdGxxlL7ue0MynCng8o7NG3bmLWLQ90mdOfr
         ZLRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwerBjZSUjerNwllIiG6cDMdmEgN3UTuMXaVYUBfbYaISCXBTflwMtGnCpSRRNOZfmKQ2CbxTmYiJf3jGc=@vger.kernel.org
X-Gm-Message-State: AFuF++ku4hyrGkcA5vAzL7bnj42mUfTKB2/U2NyhZvKGsrU2XmtvmYrd
	d0brznh9Jc0TxpwyZkmVnjZquniOA8z+KYVTa9HYdZYcCGgwhLoFUlm/
X-Gm-Gg: AYBFou0DoLNo/HGZ+tnCkAG6ZxJsPH/AE8Zb7OUG8qKyk/TsyaQt33Qu+EibKqZB7iX
	lty+0hbynWCMqwYTo3eHBMr2EO3GAU6Lo7tGOiPIP9egRUhQ+JgSjr/iGRnoPjwMPA3oDu9FN85
	y90QcJl1hoWndOWgIbV/IMUK8Yan1RwTgd6tf2f1isCihakw7PR/eeuE8hCKIfawFnSOiG3ls7T
	n3LTlpbv3vQjfMCNr8F/VUsQ1KLLzhMXZx4JZYH0Cv733px5/LtWBQDGEVCvx2R44JUTT5d5t8l
	/DrebgijwDv1ZlXkNm2+cYR8T1j5AhIUw3tYl0Wx6/9xTulngirjShUUKBQNWaODLrnZ/qOsGcy
	7oNgOz3qcSqF7/urbQQVZO/PuFh19pdjc+hkioKI+o8b3HlM1iuaj2rVZmMbeyoiXHD+k6cqRGa
	lDbBLTZ/d3sNuq2lSuvZTHXa6Vh/o9vVT2ZcD6lVLEZR6bx13zBZlGLaJa+n4Dg3vFmzbfUOEgE
	0XMzl+Fj1qlAqkxEdCiis5fAkcc2WtX9N5qDoetAVRxBK01X7FLERYRdKE8JbJZkx3Mm6RPj/3f
	080BY53zCwhecg4=
X-Received: by 2002:a05:600c:3152:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a180650fc6mr61558085e9.35.1791416677952;
        Wed, 07 Oct 2026 16:44:37 -0700 (PDT)
Received: from SD.localdomain (heme-13-b2-v4wan-167795-cust403.vm32.cable.virginm.net. [81.108.45.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4480a4sm76816995e9.0.2026.10.07.16.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 16:44:37 -0700 (PDT)
From: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
To: Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@mellanox.com>,
	Saeed Mahameed <saeedm@mellanox.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: saeedm@nvidia.com,
	tariqt@nvidia.com,
	Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
Subject: [PATCH rdma] RDMA/mlx5: Cancel deferred page-fault EQ work before teardown
Date: Thu,  8 Oct 2026 00:42:11 +0100
Message-ID: <20261007234216.2765-1-prathameshdeshpande7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Page-fault EQ work can remain queued after the notifier is disabled.
Destroying the EQ before cancelling that work can let the worker access
freed EQ memory.

Cancel the deferred work before destroying the EQ.

Fixes: d5d284b829a6 ("{net,IB}/mlx5: Move Page fault EQ and ODP logic to RDMA")
Signed-off-by: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
---
 drivers/infiniband/hw/mlx5/odp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index b8618610737a..1f28c30095dc 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -1885,8 +1885,8 @@ mlx5_ib_odp_destroy_eq(struct mlx5_ib_dev *dev, struct mlx5_ib_pf_eq *eq)
 	if (!eq->core)
 		return 0;
 	mlx5_eq_disable(dev->mdev, eq->core, &eq->irq_nb);
-	err = mlx5_eq_destroy_generic(dev->mdev, eq->core);
 	cancel_work_sync(&eq->work);
+	err = mlx5_eq_destroy_generic(dev->mdev, eq->core);
 	destroy_workqueue(eq->wq);
 	mempool_destroy(eq->pool);
 
-- 
2.43.0

