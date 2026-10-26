Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992047;
	b=HdJG0DfZXO/toeq+ETCp5sUFioYzDHUCa66tq2xrDqLPQ9b1RONnLdLTCbAGzVCucICi
	 Nx207E4qInvp/psDW+re082PJ+bB5Do/fpm9PuM+/eQCi2RZ30l/mrr80OpCKbz4zYGrD
	 /bxZOVtgWykU+6hcwVs6IwMaaD6UF16yM6pNfk4eq5KoJwo+trNczWSIEJcoMWqBvmehJ
	 XnoUAkv+LI5GFc8zqpBRKMVrzGONjTtTI24v5jr8s+YoHHPR3NXmRaMgcZ5RUt4gbxCCc
	 FPsrx6lkCxGh+Qvx3Las5/FPEZMYHapziGsSBOIHqIm0VgUMU2jRXc0yxYl+oCiiF1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q9T0zMsyFxP6+f5YwGyxdVkCFKS+Sl9bRWYPaN9yuOM=;
	b=5m96tkrTCoFFKn+zB7c0d5kBPdz38LOtIeESVlR4zPR+vVln35sIQWDK/ZZ41rcAjbAg
	 WsJtZ1GPA1QITNE1fQS8k1Y1R499GnNoap1Rt/wZQELrTwYbsjNuyWEgCjF3HlFXaUQ4N
	 5GtcKFprnZzbtl2tB5LAvylpsh3FnIDC9ntVBDoSPI4qL92dwggQDbOYkUa5YIokdcZ+E
	 /DrSHZKTc9ifZzemZBH8G8h6j/F/k+2XV7vxo7Xhumh12qsB2LDfCP7lSjc5z6jfJ8kv1
	 x3QFbqn8QA56FgWCG0j5WVqJfiPsaL67hhSE1hsfUyorWhunFU6SGBfreVRLITiAJ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q10QsAWm;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA11606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA11606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q10QsAWm
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so4453051c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792992046; x=1793596846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9T0zMsyFxP6+f5YwGyxdVkCFKS+Sl9bRWYPaN9yuOM=;
        b=Q10QsAWm0srF5Q4r1QBLb0Bzd9FxZQkHstgbsLD66/+S7a9K/1k3l2feX6J9KttYE6
         b/yBLxELzCRKYUCnTvkotE9pJZ5EVhOjCETTqV0lObDHdupmFFayQ2Fydwqyb6NOneAD
         pVhMjOA5TrCF8R301PrTqCX7XJfEWYD6C0+GHsMYbNGQpuzKHszwgyp4D/Qup5sGq+zB
         Q+gsVBy4iGqvF86HoaXLm5r2LTlWqZUNhB2JJFP8uF2gWHYkc5GT05A0f7v9WI9dQnsu
         UZwiW6dNfPlt12iTHYCiIWLxiPXm5sU1UywuzNhYyAEm4BiR0AmUxlZ3xQVqLaKqD9a+
         wcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992046; x=1793596846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9T0zMsyFxP6+f5YwGyxdVkCFKS+Sl9bRWYPaN9yuOM=;
        b=Vob6Rd339+Y3Z3nAzZqwdH5FsBQvUFuWun+shcYalzhgkiPJ2sEpuwhJvB/eKBE70c
         FhSjN5djZJodNKehHB1P19nBsaNTyr06+jctX/l1fYwrWqrKvxnqwW3tgH73Yrq2uAFO
         rVUP7+YXEp8lt5QOsYUxnC+DDFtC7Yp38frmrizBT1x3xtMSTFdpfr4dJQFlUnEOtWB4
         t088rMXu9Hd86tZVyrEqGuD7Z7mzzSb8npNwUWLBGnYJrbXzWkJrA8hKj6e7MtcHN+le
         SMCSnIR5cn8AbsdRQ0mWoxygKl0/GPQOgMPgnxPWMigm1RSPIKEUYH/gRVWnIz0qD39k
         aLrQ==
X-Forwarded-Encrypted: i=1; AKwUvByqpIEI9kwlq/Q0ZYsWDBxvQZH87xOGIg87+3gAe0nJqyzoijjKtflZVzO9tEKXy9i/Nrgetk97HARf2Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB6zcgzfBg3OV5mUxzBUolBhz/mKbhjrQ9qW9x0VL6MwGsX0sS
	hnGYjrn6vbBVUxM6agxbWpukVRBeoPj1KeIAVfSzHqp5xmHzFJLe888KiipL0rJa8yU=
X-Gm-Gg: AYBFou2j66SrJWVu+pJiA3sCva2MQ2I0J+sgQqUxB3ucDEFvDfwQjadnTUp+1xgMvzj
	ExRZN3Hsi72WQj49zy4GlNUx8dH0DLbavEoJyBC3akXtkxPltnAI1TXL8VIqiX4kLG6R+F2zlGs
	1YrVcJyIUCOW3QEjGQuJr1EQbvZL7KxkXit76W7HQ7pLYMexp08vUjz5C6NPxHiVOCd/lzNJG7J
	MlxNMK2XZjYpIYFUZrpOqVbyIXAWheOdzYZsXmEDlZ4WNxeJ7HfcilbcTvJmAF5xuyC8V8nER4N
	Fn6AoWMRXFkGP282pabaDl+rSaCdPOQqUgOBcgUbgSPALl74C9ykonhsWV7dQ3IX+zRXfyb6nX3
	7AzyAcTP8QyQ68NC1iwjPM6x48rWgXY9mMgkG+NB+0rdkp3AZgGAJ7eAOyX2hHGGz49MG/MolGF
	IlPeOIbLR1UM6QGNkFzsDB8NGOIA8Mv19UPsnkzKOznW48T3JUp0CaVlRUeWTFk8Za2v2TXXbf4
	VB0YLBp70cXHeG1F/RRlzOFu+2NeeRfXJtkIMgsgJFP1/N/3Xwc57YmoCP+fPyn+nIwl/qsPfzO
	s4Ofx18lnGXKetkHMCSkCnAf7SoyUmjA4+5YxWj/mv3iNaOZ
X-Received: by 2002:a05:7023:b83:b0:14f:8e70:fad0 with SMTP id a92af1059eb24-19935905e61mr10191002c88.33.1792992046172;
        Sun, 25 Oct 2026 22:20:46 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f83cedsm26765774c88.13.2026.10.25.22.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:20:45 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 2/2] RDMA/srp: do not DMA-sync a receive IU past its mapped length
Date: Mon, 26 Oct 2026 14:20:29 +0900
Message-ID: <20261026052030.296361-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026052030.296361-1-yhlee@isslab.korea.ac.kr>
References: <20261025114155.4007867-1-yhlee@isslab.korea.ac.kr>
 <20261026052030.296361-1-yhlee@isslab.korea.ac.kr>
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

srp_recv_done() syncs the receive IU with ch->max_ti_iu_len, but the IU
was mapped with iu->size.  Those are the same value only until the first
reconnect.  srp_cm_rep_handler() takes ch->max_ti_iu_len from every
SRP_LOGIN_RSP while it allocates the receive ring only when there is none,
and srp_rport_reconnect() keeps the ring across a reconnect, so a target
that reports a larger max_ti_iu_len the second time around makes both
ib_dma_sync_single_for_cpu() and ib_dma_sync_single_for_device() run past
the end of the mapping, which breaks the DMA API rules.

The HCA itself cannot overrun the buffer, because srp_post_recv() posts
iu->size, so sync the length that was actually mapped.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Fixes: aef9ec39c47f ("IB: Add SCSI RDMA Protocol (SRP) initiator")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srp/ib_srp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index a85d28b95306a..159d6b6aa93e3 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.c
+++ b/drivers/infiniband/ulp/srp/ib_srp.c
@@ -2111,7 +2111,7 @@ static void srp_recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		return;
 	}
 
-	ib_dma_sync_single_for_cpu(dev, iu->dma, ch->max_ti_iu_len,
+	ib_dma_sync_single_for_cpu(dev, iu->dma, iu->size,
 				   DMA_FROM_DEVICE);
 
 	opcode = *(u8 *) iu->buf;
@@ -2148,7 +2148,7 @@ static void srp_recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		break;
 	}
 
-	ib_dma_sync_single_for_device(dev, iu->dma, ch->max_ti_iu_len,
+	ib_dma_sync_single_for_device(dev, iu->dma, iu->size,
 				      DMA_FROM_DEVICE);
 
 	res = srp_post_recv(ch, iu);
