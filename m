Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E8C4E77ED
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610852; cv=none; b=TOeW1f3vsVzg92Fa6GKoycjRrpeKwaQBiVLPrMPJq9T+qo+EQBTEWTjzFQPwuPMIFXmix85jlLBv93MYLUxzEY2aCeEtDO9Rp3L7thsfaMk0y8YM1mPkqa7ouvXJSOoRMelXSdMjVFJVeMpQ1w/T0hVpV5UnFIPcNK7ODo6kvsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610852; c=relaxed/simple;
	bh=tpRDS3QWQEz+EWPX/708eI/ejVeubEVNFCMjuV09I4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3NFUVEB2iAYy/6Gbr4F4BNAB8vInPuOCKO5j7pV38HNF6SuhwM788Zs2zuWbv6/k5Gtl/A3ydkOm9JSSeBcqWW75mJUsLCRwhK4EgQjfg3WNgrzrwzPId5tn2r1dYYQfGvmLqBRsm3Uq68HOHYRcSYJkaYB6IIJPFIkZY13Yps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibllbsM+; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibllbsM+"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc7c058617aso45435a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790610850; x=1791215650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2fwOkBrxfItcV7iU7YqqxJNyvpWradYv+am29lYRQI=;
        b=ibllbsM+vRpIIDgqD5yZhOk+MsIhbuZbpNTKeoahRODos+/uy1RBI63dP98D4Nm3X/
         TadlFDW93IHO2mkRnuyidyWmtmWaM7WD4dufV/toI2nQhZE/3TfzD83QVYC2/KKc0ORS
         tkt4w7C94QHZHfGl5lxplnu+PbC9jL3alRt/taqHF6EZ9gzGP+U29cfjc/PMi0fjasRv
         fvap/9TweqtF4GBMBN5qkUToPZ+7N5bODDcWKzS8BqodBk2vFy6ipMuJzP4ElGbNeoBa
         FEC8F2Q0e1rc0extEfFsu/EDPMjJY72XDFJisjysfwyjgphN2ryk6C8MipyHMJ6MT8SZ
         SUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610850; x=1791215650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2fwOkBrxfItcV7iU7YqqxJNyvpWradYv+am29lYRQI=;
        b=o1a/Qhogvxid/FqD+2kZUYwS/AWgDcuJW9q9E+wWd2SsTREUKbQgu+Bohoqq/tD8QU
         Ht4Cyv1YMtOH7/LTXTtdhn7IVyXv/IgCmnVjkQzQp56ogHXj8L4XR6IJiTwal+iJ6KCi
         TFgK8/zI7jC5kG8oUKklNu+q2s1oPDTfPLqRTa7VPhULBGGS8D6gB19vNbdhAYjnjf09
         FKU37G9E8duk0NtC4IqaSSkM0ZcpT5pyK5FQDpYjEO/BuRdpsBhkd755jZ3UNP5MXgPT
         DIvka3hGF7eddPvNKYjvR3KpTBr14qBx7di5qS+LFi9+wnFiah/zX5zXuSNyLOGDKb3A
         QuLw==
X-Forwarded-Encrypted: i=1; AKwUvBydnvXkvIaUhD/hyPZWam+iAdRQpbaUBiLgu/uA1OzFRgFf8cPaPXFp3Lx/pkEwyWHsQnvTMMDW2C5Le8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdhcHVBkCiT07w05c4cXZWEq6T5pTNtq26m69sN2QdS5JGYZ9B
	KISEa3fgd2P8V/zFj61GhltDEwGFIQTOlBAzDzFY5+w8z218Jnr5Cytt
X-Gm-Gg: AYBFou1u8/oLsMWqAebkqiTPTNTNqBJ9PuhijhRSYiaOlAL1+SPz8ZJPofXnYF5MMi1
	amW8vcj43owuBsmvWRUIX4uz5VZFZDMAiHesicTIBpHomfvZp8gwOTNcZVy/64TadkDJk805osT
	E1Vq+2srk2cmLBzBFokBuQXQBrTT3BHKXCoP4giLQCLshNypBygzqKf5mkq6Q8MckdCvm/GctKq
	t9t6Q2oemnxLmQpS+4iWIReAfefbsFql5YFxjDCBVLNks2L8WkgNXz1kbZINvVtwy66WijFOg3B
	/5oOwqXsfcMYNeQITowMs6sjrzntMh3/KfBUXc543YL4fRw6E/sLsipWOWI9ylsjzRrT9HAzcDW
	b0CgZE5Q4VkpuI03CoiqBj8gYsbPzF21QQJ5a/X9xEuMQVSX0Q1RSx2yDcbQopMPJpWNJggc5o4
	fCXQPFS4/9jkKaETywRJAMj+xPGzeg/xUonTsb1CISInGs5Q4/JlUlB0mePnnsTLayjA57qB40/
	EIK7XM5JM4QPcYsiKl3DVaR
X-Received: by 2002:a17:90b:1c83:b0:3a0:cde8:1dd6 with SMTP id 98e67ed59e1d1-3a0cde82a7amr4463595a91.6.1790610849810;
        Mon, 28 Sep 2026 08:54:09 -0700 (PDT)
Received: from localhost.localdomain ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm44269a91.13.2026.09.28.08.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:54:09 -0700 (PDT)
From: Dongliang Qin <cccccccccccc777777@gmail.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Dongliang Qin <cccccccccccc777777@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bob Pearson <rpearsonhpe@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] RDMA/rxe: Do not force cleanup on pool timeout
Date: Mon, 28 Sep 2026 23:53:51 +0800
Message-ID: <20260928155351.3222978-5-cccccccccccc777777@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928155351.3222978-1-cccccccccccc777777@gmail.com>
References: <20260928155351.3222978-1-cccccccccccc777777@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sleepable pool cleanup path waits up to 50 seconds for the last
reference and then continues cleanup anyway. If a reference is still
held, that turns a lifetime bug into a use-after-free.

Wait for completion instead. A stuck object is easier to diagnose than
a stale pointer; the existing non-sleepable path is unchanged.

Fixes: 215d0a755e1b ("RDMA/rxe: Stop lookup of partially built objects")

Cc: stable@vger.kernel.org
Signed-off-by: Dongliang Qin <cccccccccccc777777@gmail.com>
---
 drivers/infiniband/sw/rxe/rxe_pool.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_pool.c b/drivers/infiniband/sw/rxe/rxe_pool.c
index d9cb682fd71f8..d5ff5d453f5f8 100644
--- a/drivers/infiniband/sw/rxe/rxe_pool.c
+++ b/drivers/infiniband/sw/rxe/rxe_pool.c
@@ -178,7 +178,7 @@ int __rxe_cleanup(struct rxe_pool_elem *elem, bool sleepable)
 {
 	struct rxe_pool *pool = elem->pool;
 	struct xarray *xa = &pool->xa;
-	int ret, err = 0;
+	int err = 0;
 	void *xa_ret;
 
 	if (sleepable)
@@ -201,17 +201,7 @@ int __rxe_cleanup(struct rxe_pool_elem *elem, bool sleepable)
 	 * return to rdma-core
 	 */
 	if (sleepable) {
-		if (!completion_done(&elem->complete)) {
-			ret = wait_for_completion_timeout(&elem->complete,
-					msecs_to_jiffies(50000));
-
-			/* Shouldn't happen. There are still references to
-			 * the object but, rather than deadlock, free the
-			 * object or pass back to rdma-core.
-			 */
-			if (WARN_ON(!ret))
-				err = -ETIMEDOUT;
-		}
+		wait_for_completion(&elem->complete);
 	} else {
 		unsigned long until = jiffies + RXE_POOL_TIMEOUT;
 
-- 
2.43.0
