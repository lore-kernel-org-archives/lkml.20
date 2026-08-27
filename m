Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163F93803F7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851103; cv=none; b=jPYkqddQ+ZMJjM3jZ7O9twCBpIFmj8Zzsucg5epRyCyL5AdRdxcvFBGYHqqkcxt82p2PgY/jmWNjtkS/LqqRVxz99NIlgm3hkVT1oKktZuYhEoHMHFOFvvxMSn7bE1iyztzEaNmFBXOPpPQ9eC1lac/Azde2uvtC7a64KPJrfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851103; c=relaxed/simple;
	bh=LsMiDXjkerVTOWQnAF0ofr+ci1u/rnEmYltIw6dBU/4=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=gOiufYDee467ICrftPn4pmHK1WFYifI2j45OkwSBREt3knzD739j5GYNh+PUIhSspMl8oI9Hk7KFMsSuDEL4rZlNIBicabLyKYvnUG/HmWmy0HzNEGOa4dkSp7kEqivWORbQKtMVVOmOFn+0/a5CjhSjMpGj6ZFwuHKokgYkUX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=MZcGyA0B; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="MZcGyA0B"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b14637dfdso69615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1787851100; x=1788455900; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i/oaHxuX43NHIxwgv4BaP7ocJk+hI4zJpfLWe3Zp/c=;
        b=MZcGyA0Bk70iAdZ+Hluzt+Jf4U4KuS9oqqh05/bLOItmNbHKJ0LTcBXVrmOuwfOaeg
         /UVogKeJ+CM32vCC/gB3xKW2hl8G+6JpnPPxt4FImNn03KwxFj77Ca9eou/yqBgJwsHP
         NSGBdxKKJGz4L9Ayw2a9/25LDQ6spRfqSDTXDGgbikMlV9jyGBlTe87EfVMI2P4ZRBMj
         sjY2V6mvkdWoS+mQWqF/yhlBGRTVrNHF7jt8NzN847oaruoTR9yGoQdDFmf6U6Eb+lOr
         8D27B8c5TWKoKASKPJg4bdoIEd7vEkQib0PToKQlQghSRC0QNT7iu/tyDEVAoTOEmjJ0
         4YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851100; x=1788455900;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i/oaHxuX43NHIxwgv4BaP7ocJk+hI4zJpfLWe3Zp/c=;
        b=TVv90IG3ldpYY98g9BCezqSvvsk7k8kNqVXusl+ETQXG9woHgX0Sx+NJyBxJ+cITJf
         mwaKqh4TkDtSapPBV4i+QOON/6J3GuWFC784MgnZsKFHAfjUyxx00ZeTb+4kjsF3QO1y
         izPYwCiUAPi1UjtGVzPIk229EiGxML2qQ2A+lFoR3apIWJetCl1rrIlf4cCK/xvWI3YO
         4eDM8kdb7f/WlWz6mp+EqiJgwxRj0okJbBfc1q9+vQ7f1p33fn0G0nvNUzY6+mrO16GY
         oBK9kWKzGZJf0+nE4P6tuB4m/h6qFfhMuktBQdArL4hdYGVMsmNRGyCk6ySlIXDkmIzE
         /1Gg==
X-Forwarded-Encrypted: i=1; AHgh+RorK0VItVj5W1bEiAxhXoyD+qn4alVocN0R8SCLsVz32BmE8BHaMvOX/5MLQaJ9iimnr60HxDwx03slXHE=@vger.kernel.org
X-Gm-Message-State: AFuF++kK8qq208mkkF7l4TLRa9W5CnD4VgqQcaeujegVsr5sRcC49qU2
	VCrmmEsbqBN4Uh4I7iFnPeKjBDsdkwmPmX5VGtK0Vlh5LoNSACX3uyHGjcYLPfHB1r0=
X-Gm-Gg: AR+sD10gzwmJm7BIEqFvq6zm8geb4OBisGp+VOqh57/pf+vnqTYwBh6J/GMX/tFzqlr
	oEeIK8yQ/NIrJelaLSqHYwbNd9OoZJEa+s+flyHEHgEOenz8y1IUwdcEVfLbRnMplRBg9X6BaDQ
	CEl0EIo1ZOGCvGZli/7fvrf8dg2Sp+vAHq6dguz3EIFLa/qI/JUtt/s1hYNZ8HdxdgltotDIADG
	EHWgK6SlnK07WjGjKnLsfCmiBnMt+dn6+fiJVzbuKfvBjV17a0kJMQrEjfej6uJ3MvXast342XZ
	Aw/AU5+zbIDuUOi3nl32aHbux5HETAoD/CXE4pEvYs8hj+z2OWuGXsLyhAbNRQe7Ck0ecrAHkdQ
	pdVXUaKzfWGBsCQMT0rATo0JXi2tzDD8ZiHgc/8IXIKDw7QqRGrwDrFcs9TMH9s/Y+jwsibsZa1
	pMpag24ikuq8PmeqSS7tuBGtHGLwcoeK1u3n7QI73g+uXxNZMzz4sRfisTutOD5EaA/LLyhxXPF
	fX+6/J/rAx0HNBoWdLEE3opSSjkPGfLJ/dQewuzfTFvXtT0Omg0xo3G4W2JFB5AONnhYYzv0POR
	khaHnx0UzgYXxUefGezcPBWeRSXVJPw0QwXi1g==
X-Received: by 2002:a05:600c:4f86:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-49b91c4faa6mr5036425e9.12.1787851100141;
        Thu, 27 Aug 2026 10:18:20 -0700 (PDT)
Received: from smtpclient.apple (host-79-57-139-67.business.telecomitalia.it. [79.57.139.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm67145705e9.15.2026.08.27.10.18.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 10:18:19 -0700 (PDT)
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
Subject: [PATCH] RDMA/rxe: validate access flags before swapping the MR's PD
Message-Id: <46E1D5C0-24BE-4D01-BDB3-634FE09B22C5@doyensec.com>
Date: Thu, 27 Aug 2026 19:18:07 +0200
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org
To: linux-rdma@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

rxe_rereg_user_mr() reassigns mr->ibmr.pd first and only then
validates the IB_MR_REREG_ACCESS argument:

	if (flags & IB_MR_REREG_PD) {
		rxe_put(old_pd);
		rxe_get(pd);
		mr->ibmr.pd =3D ibpd;
	}

	if (flags & IB_MR_REREG_ACCESS) {
		if (access & ~RXE_ACCESS_SUPPORTED_MR)
			return ERR_PTR(-EOPNOTSUPP);
		mr->access =3D access;
	}

Both flags pass the entry check because RXE_MR_REREG_SUPPORTED is
IB_MR_REREG_PD | IB_MR_REREG_ACCESS, so a caller can reach the access
check with mr->ibmr.pd already reassigned.

mr->ibmr.pd is owned by the core, which adjusts pd->usecnt only on the
success path: ib_uverbs_rereg_mr() jumps to put_new_uobj on a driver =
error
without undoing the reassignment, so mr->pd =3D=3D new_pd while the =
usecnts
still charge the MR to orig_pd. ib_dereg_mr_user() then decrements
new_pd, whose count can reach zero while a memory window still =
references
it; uverbs_free_pd() frees the PD on that count alone and =
rxe_mw_cleanup()
writes to freed memory:

  BUG: KASAN: slab-use-after-free in __rxe_put+0x31/0xa0
  Write of size 4 at addr ffff8881301dd690 by task rxe_poc/591
   __rxe_put+0x31/0xa0
   rxe_mw_cleanup+0x42/0x200
   __rxe_cleanup+0x115/0x370
   rxe_dealloc_mw+0x4c/0x80
  Allocated by task 591:
   ib_uverbs_alloc_pd+0x258/0x540
  Freed by task 591:
   ib_dealloc_pd_user+0x174/0x210
   uverbs_free_pd+0x8d/0xc0
   ib_uverbs_dealloc_pd+0x18e/0x1d0

Validate the access flags before mutating any state so the callback =
either
applies every requested change or none.

Fixes: 544c7f62cf32 ("RDMA/rxe: Implement rereg_user_mr")
Cc: stable@vger.kernel.org
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 drivers/infiniband/sw/rxe/rxe_verbs.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c =
b/drivers/infiniband/sw/rxe/rxe_verbs.c
index 96c7716057fe..3864284522eb 100644
--- a/drivers/infiniband/sw/rxe/rxe_verbs.c
+++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
@@ -1331,19 +1331,20 @@ static struct ib_mr *rxe_rereg_user_mr(struct =
ib_mr *ibmr, int flags,
 	if (err)
 		return ERR_PTR(err);
=20
+	if ((flags & IB_MR_REREG_ACCESS) &&
+	    (access & ~RXE_ACCESS_SUPPORTED_MR)) {
+		rxe_err_mr(mr, "access =3D %#x not supported\n", =
access);
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
 	if (flags & IB_MR_REREG_PD) {
 		rxe_put(old_pd);
 		rxe_get(pd);
 		mr->ibmr.pd =3D ibpd;
 	}
=20
-	if (flags & IB_MR_REREG_ACCESS) {
-		if (access & ~RXE_ACCESS_SUPPORTED_MR) {
-			rxe_err_mr(mr, "access =3D %#x not supported\n", =
access);
-			return ERR_PTR(-EOPNOTSUPP);
-		}
+	if (flags & IB_MR_REREG_ACCESS)
 		mr->access =3D access;
-	}
=20
 	return NULL;
 }
--=20
2.55.0

