Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238734;
	b=ltquGtVHIKAtsGZkxZmE8LgnKYIgP+Z8d7WD3aNBhua8JrzjW1V5UP7sz7RnmGo6yHlO
	 qgHINs1tOs30rStUe6HwEPQAI4BgJMXsxIL1R5u5RTkgrxDoS0Hq1dxdDVkurEm+G8E+d
	 qpqprl/bT2n4vu/HtxuybqQvYyM4ZFU/jyYRkCa2Xrl7cC3tBrUSdtsy32Rq5ow9/VgTM
	 IBw2dyHde4T1K3LklZ7cinJRwW4OxUtnYzoKylIWLoUlbfkXLJVCJ4NECYMKIHDXRDBAF
	 tZe6gx+cmCvI6HWDQZlQSBwxxJUv0+HmTfZe5uHrguIaIU0MBxuqFK5tFll/SUqlk7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4zWJW+JHe3yaJaSnmXKgn3EyBlFrMRC1zmkIqG37kkA=;
	b=zRBm8C65U2gteJyLu8aEwFCAH4sDaj3Cw9UgBEvw1le1/jxYljCDdyg9xFlx5OVvTIlj
	 4HEefKO1+mb5K82RJ7R/1tod1aMoeunFzMVYQ3oAdDOxLuD1yvXyJ+oe3TAP7EVpmhyCb
	 zruWq/p0CP0lLGq4pNzXq/Av9ktbJ4YlvxsC0xsMW9yltRWxSJ9Uv1n4D8/aHzyW6xCOf
	 MvUszK1EtZyJjX0MwBSxXrEn5hSNQApFKVoQDHgpudxIcsdxkG28z9eXRB2S4pHawjYmB
	 LU+EQtD4cYVFtlUHZYQSUh8okawT1lHi3v47E6dU6ApneDtQNt74FfPbiBwH+rr3P0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqgBKu3T;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B76606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08B76606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqgBKu3T
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb628232d2so571495a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238733; x=1794843533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zWJW+JHe3yaJaSnmXKgn3EyBlFrMRC1zmkIqG37kkA=;
        b=KqgBKu3Tb23uNp8jd+Vv9KNds1thY4OJrPh+dnAaLkh/k5DcLOtw6DlIH65AWzmHKw
         jmXKX4luUsAAwFqoCAhRxL50o73KY2ZnpNL4kasKFznjor8Zjqt3sgoyZXU4Yi7mUCLV
         lREGLnvNTffgFz8uPNUJ13P/foqIV4/iHtrjuvXNZgdBQd3Ymr1SgMLuOk4934sbjeYN
         0I2x9YUXbasNrZZ8jF7Ojl4f6h6DaAM84xu5aSpAAGVp+DZc77hCosdHml3AQvQvKL92
         lQycN+NMOdDNyM4P9pU83zxV2QRdX02QM5+5rmYMg5tYagqdmBvp9k3VOBdYOctuVG3R
         9u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238733; x=1794843533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zWJW+JHe3yaJaSnmXKgn3EyBlFrMRC1zmkIqG37kkA=;
        b=Q3Wx1PGgRwK0wo61WP2RUn4e8ZgmmOTEoH8vZ6BrzoIHjJt/oAcsbEuEzMyJXqOKzo
         KXi8b/YXc009o9X/l6fQECTOvviZp1czMpXrttNFRlcOPpygrtRc3Zbf/koEK2XZhmiK
         1P4WoqnOwfcmvWRQSiRv3ElnRM3B4efRzet6QVQW37nWnDxDstNoxb1hyEUfLvZFb7J1
         kjq1FFTbhUV4UWITPlG+Rie3MMmD1nBI6zA032PrJscIJ4wPCTIBPfeKewLhzUlm/H+j
         IwkVqCBGwjppgoYQ9voEzLoSSj1A+tVlEIJw96kCrNnWX9rcaZazSm07ZeyuIEgIx5hV
         tCsw==
X-Forwarded-Encrypted: i=1; AL+hErG/pTdikb0p6kVIVidUqOH8tkw4422LF/Bx97wesBDJvWnMtxXl94zvfjcNGGhMuxtK4QWlBnU8Q6bexvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JvRPtcgjlzkbKcKlajzG5Im8jRLQdZ+ozSI7So77P2vxIxglo
	RQ7seqvXHyoK34Z6cAGK/rTsR+ts7nv1+lwvJRm5d/Ju6d+rP6LWoUJX
X-Gm-Gg: AYBFou0NbzL5Qlv9tl5tsA82lTjE8Wz3NRfgbXcYqSTgmHNH2Hm7j2xtXaq+KPJ9KNH
	+YVINvuDsscCD+Z8bEfvs8WVkJMrpm1Gz9KAQkJa8T6WZvMRpY018jAkUfBYgsXR2moLaBukFL9
	bJ7VassDYPrk/hw8WSpNxVnkJsOgJmudhDvhyTg0AmXS+9FjqeII/++hNFPXvTqJEhcYdm+eAlh
	oZX0r3J3+YAWM8oAEXm19NONpvLh9iQZQSvqJle0jckjFUBfV0ofYMt5moEKKMESC3PNlzihZic
	arBeBvMG3QAJqbRqYuO775f7FqMsyaW5ZQSt6iZtSUIPzfJ9zq7nwcsNiw5wEnftDayHcnWS9Xv
	1S1UY+EktnNUHjxIpgOH4iUz+CIuAVQRiIOUnr7/hdqvFgk7ss5eUOAzhODFMYCNlBfX7PPzUk8
	F2S/+PKe0ybmDEXl0dwx5RHLHPYHDOCzX/PP+2kdz+Etwva5m42O+TbBOpCaZEbVL9w3M4PkYMM
	Fjxcg5QVvkSx+Snp5fSqrItesMoVXnhYlAR+VdAPahXlAEXiuISA3oIpeTRKiVMffpW1UJa4Txl
	TfiLstVyFHrhIMFqMUNGQebZclYOFzVi3NChncdoUgW6eNvYG2HiKsf2zP9ruW0lCjAp+rKrCPl
	xozHZXGzyAbMiFPDMMabJIU60
X-Received: by 2002:a17:90b:54c3:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b166ae44eamr28170a91.9.1794238733346;
        Mon, 09 Nov 2026 07:38:53 -0800 (PST)
Received: from 0.0.4.7.1.0.4.2.ip6.arpa ([2401:7400:c804:b668:b272:9904:c32b:2ee5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm11062029a91.0.2026.11.09.07.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:38:52 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.com>,
	Omar Sandoval <osandov@fb.com>
Subject: [PATCH 2/5] memstick: mspro_block: wait for running dispatches in mspro_block_stop()
Date: Mon,  9 Nov 2026 23:38:01 +0800
Message-ID: <20261109153832.7377-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109153510.7161-1-hjf3108@gmail.com>
References: <20261109153510.7161-1-hjf3108@gmail.com>
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

mspro_block_stop() only calls blk_mq_stop_hw_queues() once it sees that
msb->block_req is NULL. That marks the queues stopped so that no new
dispatch starts, but does not wait for dispatches that are already
running. In this case, a request can start just after
mspro_block_stop() has returned, causing a race condition.

Stop the queues before checking msb->block_req, and use
blk_mq_wait_quiesce_done() to wait for running ->queue_rq() calls to
return. The existing loop then waits for the current request to finish
before mspro_block_stop() returns.

Fixes: d0be12274dad ("mspro_block: convert to blk-mq")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/memstick/core/mspro_block.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index fe38b42431219..215f4c3759c41 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -727,12 +727,13 @@ static void mspro_block_stop(struct memstick_dev *card)
 	int rc = 0;
 	unsigned long flags;
 
+	blk_mq_stop_hw_queues(msb->queue);
+	blk_mq_wait_quiesce_done(&msb->tag_set);
+
 	while (1) {
 		spin_lock_irqsave(&msb->q_lock, flags);
-		if (!msb->block_req) {
-			blk_mq_stop_hw_queues(msb->queue);
+		if (!msb->block_req)
 			rc = 1;
-		}
 		spin_unlock_irqrestore(&msb->q_lock, flags);
 
 		if (rc)
-- 
2.56.0

