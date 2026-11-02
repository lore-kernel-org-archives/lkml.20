Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600392;
	b=wroci1Wu0o7K4XsgIV7Zog+n8r24b8GYkfF6hsoWuRzQyXITw7XLFPs9R/Wa9IbwvKL/
	 obDB/CczacC0N3J1gC4MQ0ld8uUrMVhD7JkzLKms2M6l5DHVvW2lowVa5PylqJS692oFl
	 QjSGYfkMRLcT7a3yasdVnn7G/N8HxZIsTCZs0VnHPVW1QIlEi4YM4ZGGh3sRsHZO1A39K
	 lTWm8ujJfcAci+pT7c2seXLeu3m/1Jwu71FfphUuXlnZVS2sbSpFdw+9dFtFcegFHDezf
	 iSdRhQHNqfQx7TVCUelAs2bAjb6gMyEiaWhzYROUV0hkNoayQ+nMGjuLCZd6v1/m1mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mElJe/DzwSK4Juni12Wq7XJkw3SOr9Pu1K+PozWddZs=;
	b=Q1KGKy6aJjbBqi1K0OLTEQFyUnt1MvtFW3SaNEJhwHOmcyE0RGIQD9uw1Hub+02qSpEP
	 6cQD5yLs1xBw35jMVuyzJcCU+GWIObuo6scmp71ICrIR5raKDoy2Im0NdEZbxVDpLPZzk
	 8k0TD/Wz98CxMDyGM0MfkUkEmt6zbih/AFIHKIhOQpsAp5s22BiXcBcBpAC2ZWQNqk2LA
	 lGuf+nW1wlx+VK/wfsNZlYMzbu2I1jOugr7EVTNQh9hiCk71LfUlVf9JmEw3PmmYegJct
	 UsFdhdGXRbBLN96gl0O2aPT0A1+gd5bZ3qePwDAQHqY6ZL4tPTnk0qOWKzqir7fmYew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iLdkvdVl;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5A606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE5A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iLdkvdVl
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1565975a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793600392; x=1794205192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mElJe/DzwSK4Juni12Wq7XJkw3SOr9Pu1K+PozWddZs=;
        b=iLdkvdVlivdnBEwdF4/PbU7RuQHrRTPKAvS/0RZAfYJPkd4Zz/n+kjh0RLKW7xXrdM
         /u1zi6YdXw0bUzOysZtLRTWe9+s7SWC/Jc0C7xwjMN4EzX9WL8D8CimQ4mNj79qUXTbA
         4NruuwiNtW0Ya+rA+sSvLHvG64WEUk9/pmglxT8AK1uqvt+kMgm8/mkiACHHb+bjjh8P
         8lE5PT3x8iXeDh+n/XIe/VgXPJ6yDygrbo1M2s7KwOdxRezkKhC0ey85XLThyFb+Kdk4
         zF1MrHXbSBkWCwSJsOoqrUNXvoJQPf+L4bhLLLvJmv2R5jmABe2+ug3X/OPAb8ia8BxF
         VSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600392; x=1794205192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mElJe/DzwSK4Juni12Wq7XJkw3SOr9Pu1K+PozWddZs=;
        b=rWEii+M4wLLQPHJOikxVUD8IKM26a7EhAJa3/Vzo4LLwL1395RXBeIaFnnHavEybK8
         RX/H8cCod4JEGZKE1GONJqDW1zaqjhoLEpQRDmP4qstXbReasowo16mzJtNz06qi+ai7
         7Ejz8hxdAiGSwCHF3CkX+fJS9+7mNIDGcan5CeQjE1iPkjxW6x5rkjnoSg3fGMdrxFtI
         6POUDchaPY7YlqXV398zJJuFrh+Ty7wbczd5ZaG3AboheUzfNruy1V59f2CmY3KCkpDx
         xwv9IQjEuHct673xs9LZWQZDdUTRroGEqUG5vAewqp19xyeP0K7PwiEeXbJbRsLoTwO0
         SctA==
X-Forwarded-Encrypted: i=1; AKwUvBxqHIW3LKl+IVYLWO8n9TT83iJmomFUOL7w8Y7oP8KXm2MZaPfVC6i5JLIwRq9TxMRHLO44Xmc8k391mhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VPlT3VlQR8z1kRAApwPyD5nco0fRcj6Gr+EiKet1JKJNw1mhJ
	hNZMAvpBQsXRR1vRssfBcJmF486NJysAVy1CoPQs3weHrZXd5DvXjy0OASs36skfhjI=
X-Gm-Gg: AYBFou0bYSyfNmzxUR52caIRxiA5NWpazkpxp3809aCrlPiGD6JYst1B4o70/Pjh98l
	ZNbKWx3HaKvXB5CtT/dlLf4fMS3IkZZJaWUnSz9zOJoURtWrExRK6amVzVaUlLHtFNQMSaCW5+e
	swQJqu1MYSJvQK1ZFI90C+VFdrHlsOUhhQD4XzsuPkyYPdGxoyjgObfSzwOYG4qO/SW4E6bi6W5
	wbauBo+lAQUyhgUSZ9qLv0g/yVORwnSAxge+n++WpKg19onbIvBB+h3C0XNFx1UutS5A7MxPz06
	zWIzsCqnDAHxpsvTm8gKlQ50Yt1XozauabcwSJ36J/TXV707LP5WAjSz+apDNpIjvFhblgbfGHq
	w6NieJmVmPf9TIfFk2RSweB0XeLlAxwaKQ/XfrQH6Oahf25XGlNczjtIYeibszpknLX3M4mUqIG
	g8EFuPc4k+Ahkg6q7+K50EaI0xLobvPTI7eyRXcg3yYMm2jJymmyLNqXOqp2szHO3yPkMNNFQoo
	UxCgIvDoMW2MQAdJHis5YwAtvHACpwzfL+alle8s0COFW8QMNIiU/zPZxiVWvHtugWUXdLkyhq7
	Jur89TcZiQnw3t2lVnIi8TCTdbhcyG4xyXRt2d8ed8LZ/mNN3gBVTNDPXD42hg7fithGPti+7Gi
	LDpiiZaH00wKQ0loD7CeTGAWB+lsU6iMxwy00/A==
X-Received: by 2002:a17:90b:1e42:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3ae897ce417mr7276437a91.32.1793600391928;
        Sun, 01 Nov 2026 22:19:51 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d115:e4f4:23fd:61df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm12927752a91.2.2026.11.01.22.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:19:51 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 2/2] RDMA/srp: do not DMA-sync a receive IU past its mapped length
Date: Mon,  2 Nov 2026 15:19:38 +0900
Message-ID: <20261102061938.617371-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102061938.617371-1-yhlee@isslab.korea.ac.kr>
References: <20261102061938.617371-1-yhlee@isslab.korea.ac.kr>
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
index a85d28b95306a5..159d6b6aa93e3a 100644
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
-- 
2.43.0

