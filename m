Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679998;
	b=c+f7gEJ/hu9Ea6ZRL3WFy7+qxKU1U5UDzyGimHfZTbLkT1LzQTpD245odQUKtZ4IlPz9
	 FK0Lc2E/7nKKwaaKj4gnRjW5z2yvY0QlwK05bknSQLEFXCTeYrk6a9GOY7smVdcYShY4w
	 XIf81PeRdO5G4BIcFxic9D4SqgK3k/b191evsokCHIhF/vUcR+FoURRf/f3hIg7qLcD6x
	 nvB0eTCDXB83Tm9iuW8d3oD1FhGishRVpILg9wvXwqbioATZVzXicYhG0DEpQ53USCnAR
	 pBW4GmRC84igTbLxMqMKoiGZzqPgWAgMTVX+DRLUHST4ixByaC1gvht9O2MwbyUJa7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TsVtZqyGS71E5D3pQPE0mMNVJWhaOlaJlReFBXIDzUM=;
	b=HSprZHFBuqOBNx81GVIbN2j/vxuTPXJGiSH2tdzNFHida+Eps5NPS7/P2PGelZW8HN0W
	 aBM/4jSEhZdM7LhKABD+3oNL19gHlM+/K1xs497Wc69yVhLbw2rIlDcnxm27awQTh/i3D
	 tEgg3RPhCQKOAQm0STKb7ew2D0zb2W+/i2Q/pCMEAKReHNaumQO01KH36Wio0NTqONXd/
	 PuNVcuL8gpDH5Oypbdk9gt0avdXNhajWCAB+BRY5qGVa4fT5aPjXAqB/kjkZfCxzC5wjf
	 SPE9jUuA8H/8WhAoFwciX5PhQ/Fw+PtNWCDN8LRxDxjjvqVqLzZfy1l3RMzytmRlp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=tNSU7zVm;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27670606A338
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27670606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=tNSU7zVm
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1709208a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792679996; x=1793284796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsVtZqyGS71E5D3pQPE0mMNVJWhaOlaJlReFBXIDzUM=;
        b=tNSU7zVmKU/HHHTlxBVkbJL4t8ldBOPRMROq9Oi04M97HxCp0LXAHBz+iPTY4dLD/L
         fNstykDXUyb73Jig3KTA5TbQMFxbXDAYVuYy0F3RX4oUovYfvaFwnEE5R9q3ob4MvzVI
         Et70Qab4D2y4GSVsjXl7H8uqI6uYZ3LlFZODL/K+Cq1xAx4uJsgs/pbHCjwCF79rTENX
         8Ma22JDiGppuqf9QItmr5u5nNEebkn5hZv9dBv0mZb962UZLm9RDEUTfAz+wcuRn4u/b
         jyQk1ZodhTD6z+ekWV5+5lKhGJ/1Fxfgq0GJ/eR86E7HDJjVyu1sQjVCqlCHY0tf+P2t
         XrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679996; x=1793284796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TsVtZqyGS71E5D3pQPE0mMNVJWhaOlaJlReFBXIDzUM=;
        b=Xu7qwB8Y0nx5/7T2R+3f+qJHUUgRLzGUJtI7qrq878qZCmZigVonW0LmJvmZjJml/2
         VR4MdCNfrLvLuCGmSMNTuHWXGjgwpdlnwj4QoRVxa0q/iljY/EhNywPgMUPzKYYJeFR3
         Vi8t8EvlvvY0XGpUWy0/sm+wnL2bi6J0RZVu+Ve00b3N55SPDBlu7FLlDO3CEJqIBDd9
         82VNihB2o18yXS57OnLUrFWEu1+DuX4gOMj22b+PawSPoR4CdH4bToHW18VKl9NCrXwB
         M4tF4J4UpuRYePEJKIcOCPTWNy0XVbABV8gugVCz/3SceEvwYzD+p13cXKeDiwWCkpNY
         RVYg==
X-Forwarded-Encrypted: i=1; AKwUvBw9StdBHeG1l0+CKprCWf2fZ56aehSdG9YjkanmRdSoACQqGfse8YwT+kN4VUH/ct68pPc9o/oU2Wjgp50=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCqAuStENWnJqPDXW6rl1/3LixEBG2n6PNwpSZmlYHFjvbK/Zq
	3hvAuKs4uroNzJNu3AbziXHx2HLgMaMGph2cG87usMmHpjz9rHuEh3nxrmD9+1CDAZg=
X-Gm-Gg: AYBFou1Dy1/xYb3fv8CCD7MHA7yBJYSolnz7ecrRa0KgXpPRbfuLdMpmAN2BgJgdvfb
	m8pZMsvpZN9LDNYKbZRmDM54j+23rHfgDkmpGwBUCqVJij+78UnJk0X5IGMWsJ+fD6/SItxYCec
	JhF/kuCcSXsOBWtIBhQg0LWyDEYkwhvZ+kLGZm0FQhXjmIhEOkpq3NlGgEoTFkmtiwbuisauYSD
	iHHl5DM6YcyygUpR4k/5SeyihdBPbVHQGOB+TZPrc1gkZnBgdsNh1btgf9cweGNiUBoqdMvP/zN
	3fZUV70yacUy3KWZe+evi+oDe2KjjzrNjycoL1Bpu+Dh2cHlRpeT2D6H94MSoZu98sRq50lxlb6
	1vWUpgPCSyXoKRltbW3NKXZZDqwJn87YcMm4fim8YxMgDmtykYmnsIk8yjRcD7eHNlwIodZQqfD
	z5vX/w/DLpPRKiguJ1yYe3+R/kMC8wVt5uRqLaJIoW3lgq7RpIMLRweYzk+nqkyN2t7HwHQWO9P
	loEcHri321gGRd4ino6PgA+hIWQHMfbthdgycjegi/K8ymVwgN4tBFrSdw0NEyGxSuD9TmvqMe+
	NJs=
X-Received: by 2002:a17:90b:5908:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ad86f44c42mr4641606a91.10.1792679996527;
        Thu, 22 Oct 2026 07:39:56 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:13e0:b266:5a7d:e119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4719043a91.2.2026.10.22.07.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:39:56 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 2/2] RDMA/srpt: widen the indirect RDMA context counters
Date: Thu, 22 Oct 2026 23:39:01 +0900
Message-ID: <20261022143901.2991062-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022143901.2991062-1-yhlee@isslab.korea.ac.kr>
References: <20261022143901.2991062-1-yhlee@isslab.korea.ac.kr>
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

srpt_send_ioctx::n_rdma and ::n_rw_ctx are u8, and neither of the values
stored in them is bounded by 255.

n_rw_ctx counts the INDIRECT descriptors a command carries, and the count
guard in srpt_get_desc_tbl() admits data_out_desc_cnt plus
data_in_desc_cnt, so up to 510. At 256 descriptors n_rw_ctx wraps to
zero, and srpt_release_cmd() frees the contexts only when it is non-zero,
so every scatterlist and RDMA context the command allocated leaks.

n_rdma is not a descriptor count at all. It is the sum of the
rdma_rw_ctx_init() return values, which is the number of work requests
each context needs, accumulated by ioctx->n_rdma += ret. A handful of
descriptors for large transfers can pass 255 on their own, with no
unusual descriptor count involved. A wrapped n_rdma is then handed to
atomic_sub_return(ioctx->n_rdma, &ch->sq_wr_avail) and tested by
WARN_ON(ioctx->n_rdma <= 0), so the send queue work request accounting
drifts too.

Make both counters int, the type the values they accumulate already have.

Fixes: b99f8e4d7bcd ("IB/srpt: convert to the generic RDMA READ/WRITE API")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
 drivers/infiniband/ulp/srpt/ib_srpt.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 97758082f71d2..bdea47316539f 100644
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
-- 
2.43.0

