Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384235DA47
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134431; cv=none; b=PmSKJj/Thl7+GmuVRZKH8kHMQZW/NGCJTxoJ+3KuOpZVTwNIH9LmR5f2gwUYNxaabNZUi+avLCyj+wr/+u6jhHbrLe5U66G7L4xpuHyG+o8IdZKDr1RHsFrb819vgddED+uH1KbK7ENVPGzZzn3q2qtrtDJ3jJscoeP5bF1qkmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134431; c=relaxed/simple;
	bh=KAXZBx+vMoqzIwrf2B+z+XaUwa7q7Z784M6ZiaaYhy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JnIpEDaTKAc2BEzoSRyCWKdQSxpRJZRAnHt+w2gJwlw/4ceDyGBCPE8AcqwH43+FeWG7WiUDtkixDaCR0VgvM0ZV2uKFWGBSVuRh3dJ8/KjHdMDVHxieGCGDL4YGa2jmZFWz0IlIGsgOa2kkdhaqGCU0zr+58+UoOGE3gN5nhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=MsdH2Gr0; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="MsdH2Gr0"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-887c067c816so235604b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1791134425; x=1791739225; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9llYwK8ATqeQ0l/9KM8Jc4lwes7XVac/+xvUv1fpjIw=;
        b=MsdH2Gr0t07rStMrr5r2L1mwvjNMWKy6sohb8bwE7Gqyyb+WukYwkhGzZyAcBD+LIY
         BVsEF2PIH819OEQgiU3ioL7rCO1oBpnxuQw2BmUilf0i8ifjmUeEmRuuhA1HUJuy8mGY
         F0KdE+byBJ7BjQNyc87fX+Vrtb3eRvFNsZvlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134425; x=1791739225;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9llYwK8ATqeQ0l/9KM8Jc4lwes7XVac/+xvUv1fpjIw=;
        b=OryaahSJfL9FcK75sQMzlmmuFXBZXPUx4g0o7JzxryBt8FmDbSzZYiNNpUUA+3IKVi
         uWAn8K7csydF933ZTS6/QijrCrt88QXYvSJkbXBykBGSfZlvKoGdqlYvaS1zNXXLnnOv
         n4JZ4dUrLYMo7+w5lsENkQhux91R1hNfXoxBMXI2VFDb3jKfCiv+y9GdlEErW5BWI+86
         7AzePeZMJNYeMIt7dAkVVr3KTWiOf3moWr9bPM/hCBM2tO59yWvXHkskJDm1tlD4EYNS
         51VDDYtYGWET3PI0GU8i5vFKVEMH5cQ0l8vBYxgOEWRkRjry2Hjco+2hiq9ti2bEbOCL
         WjPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvBZunrB4GFmjqLg2dNKu0RO6TRlYVSYwnt3RlZ03EG9fGrzdTpbCbEWBn+5fWs6mUaVvpuMO4Xkw89Po=@vger.kernel.org
X-Gm-Message-State: AFuF++mOmRLzWGj9VnpTBaMN7Fn9Vz+YkmYIKufRyOyL6WO+EWp0MZH5
	J+S+F+ZI7dF17zJj7UHyW9ZeUJaWxuQXrDVcSBQDyaysszO74ZGy1hKtn7rAKPJUTrU=
X-Gm-Gg: AYBFou2yY8rkLUC6z/pvEzwG/ghvM4B6FwALPTFOGMdwYS1dIvTyhGQazpZA9pAwyab
	C4ohJG8uq+IGJy0pZZDIKcMLsDNpbXn9fKJsniw+4MSJev4I1BPn1YBRNRnyXSyv2EF8GD/39+K
	wjZGbYX3SMTUIM8Q1PhPWah1CofwzbPcf24FhCy/MVDtQe/B9yZX18ewktD3KhQgPoy7KKagHdZ
	m6jC1tZ0O81MiwfeICzbRUKpAywEsyBb1hk1Mi/t8S/yfqGSaaLSrbChJ2mLnKcSYRI+R1n397h
	sFh3VbOSMUqAT3deyJ1b0yA7+mtUCk9ujJx5cT8Tk2MQsLf5IgcAF4BS7k8YN6Pg9d3Vr0tkoPX
	Rs/ZblU7Bz2/71Tjot4DaR3t3g9FSvLt4E1Nh3FVL71HjSxbgR3XJs64v/580kSzqzQdFKj8tUi
	CjCGAKhqXNSJwHkq6rXkvPsC39VwNOHlyZGyF0kDUhdUpRY4VOBkAfPIEf+orMOual
X-Received: by 2002:a05:6a00:1144:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-88af8377fb6mr7571704b3a.59.1791134425036;
        Sun, 04 Oct 2026 10:20:25 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88c88759fc5sm1263302b3a.56.2026.10.04.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:20:23 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Date: Sun, 04 Oct 2026 17:20:10 +0000
Subject: [PATCH] vfio/mlx5: Fix boundary check in set_report_output()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-vfio-mlx5-fix-boundary-check-v1-1-1d3b8e55e23f@snu.ac.kr>
X-B4-Tracking: v=1; b=H4sIAMmKwmoC/x3M3wpAMBSA8VfRuXZq5k94FbmY7eCETVtE8u6Wy
 199fQ8E8kwB2uQBTycHdjYiSxPQs7ITIZtokEJWmRAFniM73NarxJEvHNxhjfI36pn0gkWdN6Z
 SpAeSEBe7p1j9+65/3w+PkIRwbgAAAA==
To: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Seongjun Hong <hsj0512@snu.ac.kr>
X-Mailer: b4 0.13.0

Use > instead of >= on boundary check of recv_buf to avoid the bug which
the full message in the last slot of recv_buf is ignored even though the
received data size does not overflow the recv_buf.

Clarify the second boundary condition by removing unnecessary division by
entry_size. It directly shows that size should be within qp->max_msg_size.

Fixes: 9c7c5430bca3 ("vfio/mlx5: Align the page tracking max message size with the device capability")
Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/vfio/pci/mlx5/cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/mlx5/cmd.c b/drivers/vfio/pci/mlx5/cmd.c
index 5fe0621b5fbd..a49531666e6d 100644
--- a/drivers/vfio/pci/mlx5/cmd.c
+++ b/drivers/vfio/pci/mlx5/cmd.c
@@ -1644,8 +1644,8 @@ set_report_output(u32 size, int index, struct mlx5_vhca_qp *qp,
 	int i;
 
 	buf_offset = index * qp->max_msg_size;
-	if (WARN_ON(buf_offset + size >= qp->recv_buf.npages * PAGE_SIZE ||
-		    (nent > qp->max_msg_size / entry_size)))
+	if (WARN_ON(buf_offset + size > qp->recv_buf.npages * PAGE_SIZE ||
+		    size > qp->max_msg_size))
 		return;
 
 	do {

---
base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84
change-id: 20261004-vfio-mlx5-fix-boundary-check-4839d6aecbe2

Best regards,
-- 
Seongjun Hong

