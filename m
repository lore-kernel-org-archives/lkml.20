Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511928;
	b=MMRnAWtCag9fug+kBkx/1vqCNx1/gkdu3uzl871E97isSKcWR8eQehWCcydB5NdFcF8L
	 e8fjMsLpvHHjz7F4kIYUPqbgIrXdn/4Isaz0FU1lYIhdlPaxI63Qnpw0+M5ytecsv7Xa3
	 xorsJoYR3wcTovXsh5V24+PPVzydAmmbw7w5+grDr4M+fR1yH20trdIg+3QdKIYcSZAfi
	 HPDb6DsRI+g3aIw4YU23HrQXi/FXWUPei63eQ+L8Bb3nHXB6+X4w2cs12tJr5ZatPCWr4
	 nqQ2MCWV/IbJPnmXW/KgqjhPNvh4khcDu2lkjNs00KfTr3/N7LnqzyrCDX6Wyn72utw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jwwf/y9hgPD/4iYQyhF41CmYL12LaotsH+U0E6c+Hyg=;
	b=i+oOEbrKVFidQADWKrtxfl8Kw7HY3KxL4AaRRHEzJlmtAJpTwdCS66LnRvsuBisxFabH
	 Wf9WGH9Wv3FZMWRd7h6fh4kPAEfs0xgtrC973GraFklFQ5DVYUnve9Ho6VXJMPjFwCeAK
	 AGh1vDoY0qc4RMScpPZFwzHbQm6iGYjE4GK6XPK6TxLbXNNny5sXfljes0vUdGYX0iKy8
	 kDXowc3RAvIlU1ZZFqc8kEV7fxT/XAxlsHabIyCuFeTQBhi0V/71iliCwh63nQXJ6q2yY
	 y4W+0LYljpjgKMHDsH6UqkzmT2f+Inie12H78/3bKGKAVNKAREUMcVpefXD8KTsUOsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="dWs4F/yp";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B0606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4B0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dWs4F/yp
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2993157a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792511926; x=1793116726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwwf/y9hgPD/4iYQyhF41CmYL12LaotsH+U0E6c+Hyg=;
        b=dWs4F/ypBs2AZ1xwmLiUvBHFlCmf8R90S+EjX+Fr8o++IFJHNgJROWISLM+2DVcbyS
         dpw+SVWSiqE9luRzM2CY+51yYYTnOTpHKt1WkTfQwJQfk3ulZyMsLGsU1y65jdjmEEJT
         fFBz8ibm7omXvqc9BsEdrFc+NpgTa/qI2L2fNG6JY+arBT2Lql13qc47GGK8SBEdqi5j
         m0op8io6miOsGhjy8jODfAQU07B7lBEqsNA75zzXBKy1EDbsL+ApqSgc2d7gaED3+anY
         FGwTGl2lxO2y2TcR9qnmFabtUR6T1FCoGNkLBvH/QH1p2JEYVJcTp5aMUJup9u5Big2m
         mK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511926; x=1793116726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwwf/y9hgPD/4iYQyhF41CmYL12LaotsH+U0E6c+Hyg=;
        b=bljaPgxuZoxRqzYf9t4ZLgxT6qy8KOI6+eJ5MgAz/dQor5CA/zY7lizPF2ZtMicdFc
         baBYNHXetZW1MgR4vw0cjXPWXw4ucolgsiD08u9fh3a6+X9YfP9w4a6rBfhBO7+4Tbau
         WrDtjiSsdUlnqFo0vmQHkuImHb9QXPH0RlXfPgb8c25hLlK4ZLpVLKmsDRKbpABNA+5A
         zGHy8zn1Kx3zoChD+czUEBVL595lrQSaYIpzuq4d3BxCnULDlIRyIPnY2+3oJsb61Ttj
         KKalgtUXlPJLu8LI6s/y9QOCLjeNxFgxP3MkuZpUGPCq3uqXjryxjIiTneTpD44zyBJw
         CfTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRHVmbmghIvxj1vyNfTNCWfX0x6QkqfwztLiMlPpaiSDwuLdIxKtajEE0cvouIPboCjSmuJxnTh1IE+5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPlVnllhlL8c6YZrl9Crs1t2RwSJfJhyMEgjScNOaGj7IF9Zqq
	5owtwa9h3YfbMbmGeECF7BFXux1D+4czmIQzig1/QKypc64Y0tK+3VyVKbJk9LRGBqFmdfC6NXq
	+YTB0
X-Gm-Gg: AYBFou1c63rntTqXWWu+/Nv5qoUcJiv/dPPQE3NvENV9bLSHTozM9A020+vVW0EZc3k
	J+i+S+yo9qSyotwrVLBgIFA61DGtQECXhYoh44gKr5coO9cTfLyECf5oBasWaQgpBqixsH7lJPs
	0bgrKA/MTR9uc8cXY23hG0iTQX5EWxNex2DmVO5hBRTdSHTvRV/R/KzuOV7J8kLJ7InEjP7qGcZ
	zQJ70IIfXXK9/qc8o/6NZ40iiHfhg6RjMD4FOSonFTgYjaSTYFPHtyf99OWctKbSP5R8Jraegl6
	BPgIlmEP9E04kyouuR6rpQCCousGX3XYztuh5n+WZTBL59VrFOkoUC6RedRKyc7GdF+wnM4kmAN
	NwFbdOspUklsolbCGOEzCoilbOmL/Yk6MiLcNuWXF999LkgmdVKUURmhpoDO0xqEmn9wIWIQHeW
	6/IdEXZDToBed4t8abuAHfeieapJvsYLzpW53rQpRaH7hXRNGueRu05KWpTZlX3GwQO1m+nbau8
	9fgeFuNkidsem/Ms2Zp
X-Received: by 2002:a17:90b:5743:b0:3a8:cc4f:3475 with SMTP id 98e67ed59e1d1-3acef60db08mr10119028a91.60.1792511925477;
        Tue, 20 Oct 2026 08:58:45 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e416:85ef:f22:6c5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813de463sm41188a91.13.2026.10.20.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:58:45 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH] RDMA/srpt: widen the RDMA context counters
Date: Wed, 21 Oct 2026 00:57:25 +0900
Message-ID: <20261020155725.2251969-1-yhlee@isslab.korea.ac.kr>
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

srpt_get_desc_tbl() bounds the number of indirect data buffer descriptors
by the two counts the initiator put in the SRP_CMD, and both are u8, so it
admits an nbufs of up to 510:

	if (nbufs >
	    (srp_cmd->data_out_desc_cnt + srp_cmd->data_in_desc_cnt)) {
		...
		return -EINVAL;
	}

srpt_alloc_rw_ctxs() then builds that many contexts but counts them in
ioctx->n_rw_ctx and ioctx->n_rdma, which are u8.  At 256 descriptors
n_rw_ctx wraps to zero, and srpt_release_cmd() frees the contexts only
when it is nonzero:

	if (ioctx->n_rw_ctx) {
		srpt_free_rw_ctxs(ch, ioctx);
		ioctx->n_rw_ctx = 0;
	}

A command carrying 256 descriptors therefore leaks every scatterlist
target_alloc_sgl() allocated, every registration rdma_rw_ctx_init() set
up, and the rw_ctxs array as well, since the kfree() for it sits inside
srpt_free_rw_ctxs().  ioctx is a ring entry that the next command on the
same tag overwrites, so the array pointer is lost too.  The descriptor
payload sizes are the initiator's to choose and the command can be
repeated, so this grows without bound.  A count between 257 and 510 leaks
256 contexts and frees the remainder.

Widen both counters so they hold what the guard already admits, rather
than refusing counts the guard accepts.  int suits every existing user:
the two loops that walk the contexts backwards use an int index and stop
at -1, the sq_wr_avail accounting passes the value to atomic_add() and
atomic_sub_return(), which take an int, and the three places that print it
use %d.  The WARN_ON(ioctx->n_rdma <= 0) in srpt_rdma_read_done() becomes
a real signed test instead of a test for zero.  The error unwind path
walks by index and restores both counters, so it was never affected.

There is no splat to quote, because the result is a leak rather than an
access past an object.  A KUnit harness that is not part of this patch
calls srpt_get_desc_tbl() with a fabricated SRP_CMD and counts the
rdma_rw_ctx_init() and rdma_rw_ctx_destroy() calls.  With u8 counters, 256
descriptors build 256 contexts and destroy none, and 510 build 510 and
destroy 254.  With int counters, 1, 128, 255, 256 and 510 descriptors all
build and destroy the same number.

Fixes: a42d985bd5b2 ("ib_srpt: Initial SRP Target merge for v3.3-rc1")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
 drivers/infiniband/ulp/srpt/ib_srpt.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 7197d95f2216b..b174d58ca98a3 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -959,7 +959,7 @@ static int srpt_alloc_rw_ctxs(struct srpt_send_ioctx *ioctx,
 	struct srpt_rdma_ch *ch = ioctx->ch;
 	struct scatterlist *prev = NULL;
 	unsigned prev_nents;
-	u8 n_rdma, n_rw_ctx;
+	int n_rdma, n_rw_ctx;
 	int ret, i;
 
 	if (nbufs == 1) {
diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.h b/drivers/infiniband/ulp/srpt/ib_srpt.h
index 4c46b301eea18..1dce9bcb490f0 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.h
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.h
@@ -223,8 +223,8 @@ struct srpt_send_ioctx {
 	struct ib_cqe		rdma_cqe;
 	enum srpt_command_state	state;
 	struct se_cmd		cmd;
-	u8			n_rdma;
-	u8			n_rw_ctx;
+	int			n_rdma;
+	int			n_rw_ctx;
 	bool			queue_status_only;
 	u8			sense_data[TRANSPORT_SENSE_BUFFER];
 };

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

