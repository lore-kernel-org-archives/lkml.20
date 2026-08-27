Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F23E7653
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827896; cv=none; b=Ih7ACjdMSwBTkvPky/20n7pFn37IigI/QkmukSjLvL1Kq8uAaMWCWwr4OV5RJgIFw+De6C64agJvuLt6ZZ8kuIJydb6FYIKrbDcRZE9Vg67N0jOneRWeOUhn2uuhG39xFyZeD65p2WVarzWhF4aVlVuC9oOnZDqVpxuYLimAn68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827896; c=relaxed/simple;
	bh=NDQK5kwpUVD6obx/yy5Frm7uZq0lf62K9bp2v1Vc1yI=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=SCROSJoF3OFnvcdc5GC0MHCH73jPaCUirXnpdegy3ke7Q7YxlPWVtFc9RbkOoy6QCd+19TqHyXP3j6yD60gj9WxXd6Xlkqh7SwRT99P6cl5RJ6SAA8NC6jU8g0SaspaC5ivzcWskPGQfrJx47rOKZrrPdw+hSkrcQxtwZ6LvG08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=DKwuhiIg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="DKwuhiIg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f96c5b722so294471f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1787827892; x=1788432692; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSbx46qQDT+S0wnvtgnGbS9yof1KhN8VuOkEYs/TPLI=;
        b=DKwuhiIg6Phv0N9g+cw2i+PR6wpOMr1rCkjLhRr6JgisDDz6mnmEbKFF2x4m9LldHA
         Sy+Q+4wy8SgVIP11qmLM3Dfc16PbyKpng3yzQxRbiPI4l51cLXljfW/Xt37HuMO7LgLr
         3lN60d1/r59HZaNdxLE+zSDkWlFmzNN1GR8oxSFELrNb6m2VDf/dX0L+lrnR4TH70D7D
         p5g2iK63NZ+9U+Rk5F0t8rfIqTda1v4hmp3E/GYjrsElHT4MILtlFzslvKtJShzUDsbp
         5CNMaWNJg5b0gbiHhu5bO36tqXQ17caLZsXE9yAcO9oeAAhWYy041IwqZ/Adl9z5mfe+
         xTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787827892; x=1788432692;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSbx46qQDT+S0wnvtgnGbS9yof1KhN8VuOkEYs/TPLI=;
        b=T6xzloaxdGLrX/dImUDY/KtxuGjpkMTbEuoZ9o+22FirBDLkY6jn5LRly3UoRnDhAq
         48nLvX7KdZeELargtBAGcpFBM7UOFgdmuhmG+D2CSeRk4IlJ1KbaeLRdQm096k4L8RjV
         akHqSAl0/6ggYnpBtE6Uc6lLcEG8kjqQ0ZLlY8sjsSr5NJNCGrL9JK5WVGsqT/wIwjDe
         aRL7gaKwX7wrh81f8pZQwAbDQYkRToSkBbzUEmXi7cRYYoswasHu3wA4zFn497ONvART
         1V9+nV9WQIG+H+iAfOoHoBzqpCkbd+gXhG3mQw+jG0Ic+o0hDW/UNAjdHNBOlUPkZv1c
         fV8A==
X-Forwarded-Encrypted: i=1; AHgh+RpNkrb/EcxgN6PM7CiXNG0XYNrWBw2PuCfMP09rjJ6SX1NWVer3Lu18HHj1Bm6DsRwk8q5ftyf2E9vOfeA=@vger.kernel.org
X-Gm-Message-State: AFuF++n0AwOKRz3hbcWppr7lWeAB0ywBXpqssK888ATuv44eAjQUguZp
	EtIvwqoQWJxuh85QDw45ocLRR5KTPZ+IoYvOZ6C25fQj8O/uJYJnszTffiahp+vu3Mw=
X-Gm-Gg: AR+sD10U+MMymWVA2psN7uogVoZj7KZilLcbun7wIae2fYIuHJE8Y84kbsU7+an1tqe
	aZbdWhjfq/+Eqwl/U+7aDrZr45Dp2X03Oa0Ibk7KX5Rk97YJ1NAEDZbN8E7vSjng2ITwjqqHvtL
	yNDkZ0LWpB9q3YyLRC33hHyfGqlYrm6XR9VzcOdyFCIT3ps7OQn0G+Q9QuM+wQmNE/KVMm8Qgqw
	SGCXB/89Z0k72HaCHd2AmZCfv+Q0YNyJ+GT5BcwC6MRdswcSMtOptQFM+TKVNJjKXTgu1A5vjRd
	/1piqeZ/emL+WYE3/ksxJC8bSPkGGXgkyehskSZlvGO7NWaxnaV6y9YtuXLwmJxDXorlsA6iuTb
	gQnvzcPB3bbmUHzbpQWXxrGF/RCGy79NHZxd+OtdDHWz2gUmY4Cuq7tD97pc54oRITIe20ADjBy
	84EBJs3QCzOTjkeZlgWEaNYAHPgxacgjSsLmVFt6Q2ANSMmrHuOHLq/vQfB9EQ1CzkK58/TcWkk
	qC8vXCIWGJtfy3KICC5vcHsc7aH+fE9fVyupe6r7jedSLjv7tB/TaIobKAANCqzo++Ev7s5xxDb
	Xa88ZdUB4KBVonZiraRQ7vT6K+tP+q33//fuRg==
X-Received: by 2002:a05:6000:645:b0:481:5b58:c589 with SMTP id ffacd0b85a97d-482e26b380amr15868293f8f.10.1787827892118;
        Thu, 27 Aug 2026 03:51:32 -0700 (PDT)
Received: from smtpclient.apple (host-79-57-139-67.business.telecomitalia.it. [79.57.139.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28fe2ecsm8191582f8f.37.2026.08.27.03.51.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 03:51:31 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH] RDMA/rxe: Reject prefetch of a non-ODP MR
Message-Id: <521D5E74-89E3-43C0-81C7-AC0BE52591E7@doyensec.com>
Date: Thu, 27 Aug 2026 12:51:20 +0200
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org
To: linux-rdma@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

rxe_ib_advise_mr_prefetch() and rxe_ib_prefetch_sg_list() look up the MR
by lkey and hand it to rxe_odp_do_pagefault_and_lock() without checking
that it is an ODP MR. That path runs to_ib_umem_odp() on mr->umem, and
for a non-ODP MR mr->umem is a plain struct ib_umem from ib_umem_get(),
so the container_of() in to_ib_umem_odp() lands past the end of the
object and ib_umem_odp_map_dma_and_lock() reads its ib_umem_odp fields
out of bounds.

lookup_mr() validates the lkey, PD, access and state but not the MR
type, and IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH is accepted for any MR.

  BUG: KASAN: slab-out-of-bounds in =
ib_umem_odp_map_dma_and_lock+0x884/0x8a0
  Read of size 8 at addr ffff88810a3ebcf0 by task advi/921
   ib_umem_odp_map_dma_and_lock+0x884/0x8a0
   rxe_ib_advise_mr+0x543/0xad0
   ib_uverbs_handler_UVERBS_METHOD_ADVISE_MR+0x446/0x530
   ib_uverbs_cmd_verbs+0x2b3c/0x3b20
   ib_uverbs_ioctl+0x1e3/0x310
  Allocated by task 921:
   __ib_umem_get_va+0x13e/0xae0
   rxe_mr_init_user+0x2ae/0xb00
   rxe_reg_user_mr+0x337/0x510
  The buggy address belongs to the object at ffff88810a3ebc80
   which belongs to the cache kmalloc-96 of size 96

Reject a non-ODP MR after lookup_mr() in both the synchronous and
asynchronous prefetch arms.

Fixes: 3576b0df1588 ("RDMA/rxe: Implement synchronous prefetch for ODP =
MRs")
Cc: stable@vger.kernel.org
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 drivers/infiniband/sw/rxe/rxe_odp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/infiniband/sw/rxe/rxe_odp.c =
b/drivers/infiniband/sw/rxe/rxe_odp.c
index e870efa7a0a3..5c9dde3501a0 100644
--- a/drivers/infiniband/sw/rxe/rxe_odp.c
+++ b/drivers/infiniband/sw/rxe/rxe_odp.c
@@ -472,6 +472,11 @@ static int rxe_ib_prefetch_sg_list(struct ib_pd =
*ibpd,
 			return -EINVAL;
 		}
=20
+		if (unlikely(!is_odp_mr(mr))) {
+			rxe_put(mr);
+			return -EOPNOTSUPP;
+		}
+
 		if (advice =3D=3D =
IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
 		    !mr->umem->writable) {
 			rxe_dbg_mr(mr, "missing write permission\n");
@@ -536,6 +541,12 @@ static int rxe_ib_advise_mr_prefetch(struct ib_pd =
*ibpd,
 			goto err;
 		}
=20
+		if (unlikely(!is_odp_mr(mr))) {
+			rxe_put(mr);
+			mr =3D ERR_PTR(-EOPNOTSUPP);
+			goto err;
+		}
+
 		work->frags[i].io_virt =3D sg_list[i].addr;
 		work->frags[i].length =3D sg_list[i].length;
 		work->frags[i].mr =3D mr;
--=20
2.55.0

