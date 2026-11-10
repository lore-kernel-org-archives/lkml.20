Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280217;
	b=NJVnaW8ClX5eqoP7whZoRXbIOPfvoWIEIFjuF4fKJTQERLtbgiGvEO/7SM7sITolBvZI
	 YdbOByaZLPVfsHK3c1u6MJJWahCeBhxoPvkHWPmvABP6OFrQY4bdCtrVGXhuYiaBgw1pb
	 pUCrN1c7NdR6gilmwPA3fbEfBuF99pQcIJM4vjHpizRdNpPfHuc3K4UAbNx9pGCrIKxAS
	 BuGNqm/RqSe+K/RF4zkM8EJHYvjZvENrLkPQ7eD9f+S/VGI+GxPChwH5YMCXNtUCYdrUK
	 gkdAEYRa+lyqMHyJYD8bXuchh9zjE/OmESPl4HYpYy2oTcv/IKseZdC8yhVNQ62OA9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n3sfGKW7S9id4w6EJ1yBLSVpVy17lWswp5agSoZ8nvI=;
	b=TJfDU3kmJC3HdNIw+/e4vH4VhM4gS0/D9n96H4JdoAyVs+ea4waYpNfoYI7ccM6IerrG
	 W/sFJGrZ52ZxtWckKy9Z5Lmo9SLB35p8y3g2EoXqTwm+vvkh1sozgFksihbl8G49QgTGT
	 g6JGTrvBI/4LK14hxnrWIAOMwoyrhAhMOXhIGNcK++E36kec7IhHqwcswg5ttZj6sFM83
	 Q56b9M/WviMqNTFO0SY+4/2y+P9KyhLFIa0VzeLiHhNAG6JiIiwbEesA1mVhDDE2keH8S
	 2iO+u9z+m8xSKTsppQxv0EvwBPSj0nF3L22RoKQ3HsXH2ZsXRycoM9B0PhBa3s7A6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYpm3Hpn;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4782E60A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4782E60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYpm3Hpn
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so857048b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280217; x=1794885017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3sfGKW7S9id4w6EJ1yBLSVpVy17lWswp5agSoZ8nvI=;
        b=DYpm3HpnJ+GzIwSECRt5WR39dUsLBo3DTMselW6Zj3ZQjnSK/25qvLf+DxdTelq+Mz
         pUYKNlXEe7iDHrX6QoX8QFmxgfjV6diDh8sRgYR5gkBGeUqgI+AOcifvgqT4qFcfIpH7
         BjR1DDaD5ZUYYPJsSwINXE0JwgEUIR8Lk0R2NcWsXbrvekrll7UItUNWO9VPT3XQcOTa
         4ipLv9+uYnMcIlzfA0zTJ1Ru50EGS49Xqm1y2pKemiG7QmMd2Bp4WCBzlx3kHZJWfvEN
         yerC9JHPW4Ba8Bj2GRXkXNgPwMW5R0og4UJCHQ0u+PR7twNDzOdus4biyT+Tl1x2MbJE
         YevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280217; x=1794885017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3sfGKW7S9id4w6EJ1yBLSVpVy17lWswp5agSoZ8nvI=;
        b=yWNeMSPJffs3MkG9r7KZLlhO9fKw7AtQ9SRRhgSzXfZMaDsbX1qfhI4d1alO3eapSL
         j8rZfbhBHYJb3G+1atuJ+MjDxStAD9uzvnv59p8JUQ55PO90Xe7y9JIyLd3d7vCearA+
         Ion8RNIrPU9g45hLWOMUDawz0hCrXW0RLgIULEPiPuwdM7jMiIwJp/KCCCd5q56dAjSt
         xAdbsdPxVnm5u2hsKgmAU4jWljmk2pBpTaFz7hsS/vpg3YHL4lzmaUbxxL7vMlfZhyiI
         1tILa0vcpzp6u1qkjB9zAmnOst3R5xbibGdRCTTlgKVSRgHvSk48Wy7pfHHv+wk4JFEe
         MHoQ==
X-Forwarded-Encrypted: i=1; AL+hErG5+RB7kK3bNQs64nhC+HqeuB2mjCqp1SGYjW7RCV8ooi8quaiQYFR/duGWs06YgIetsHtS4ha4/y4RA7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8egcQBslFT5n7k2HqfZrBz0d5D4Wj4eww94mfU7sXQ4LqXXCkU
	89nOWzeyu/tck1mKrGfB1bLY2xdRvYTJmbXFhCH8vcjC7QnvhUmtX9fc
X-Gm-Gg: AYBFou00Hl+GsaV2Dr7xU6gbfjdnUl0Gmxxh6znHuFE192P7RCGB1QswhCZdmJpzHvC
	/shsnalA/o0HXbi5Cky3QRFbz/EmHgo+kIwrDEWGJ0M7pN/eMMNPt9ujitH4rgKVW6WovXRfxda
	q83doQN/yMXlSupYYzAzZGPdF9IdMgXI8t53Ment73dtg/QbPhYKMoT0Ny4OFnIiieZGDBYKB0y
	UdsG27tjWGEUcN2LRfxJzfkcvwiajvw8YGcgVj0LwBjucVcXoDzmHoWVGrJxft6vFrZ8E/ISinQ
	vARixgVG6PRyTbAPsMUTNe5vDMNXfjxLyQTeGnJT6D02DRgU79/MGVAowDsnvvvctg0vYykhqnF
	DKXHCZw0JaD8c3oxAhP3TOxeErvc8nrhP//SYQywVmqfxb5Xw+ykG2wfn2+AupaoyR9/EDkOU24
	SD6cNz5lGuZqDD4DhznBOQZDUpVV4EPfRyLf8aRBBSJ0v9B128ALdQly4S5UHzyHhV3JzwgZfSf
	10abX3OYqdQr5E600l/AxuswtbhCIvQKKrxVo3m3JqY4SpvnbV48xpioQ8g7Y5EWbsDNEiA2Doz
	zMsgF4AIFCHxCxM/cJmzPA/fH5xRvcwryD39VOJdZ2U=
X-Received: by 2002:a05:6a00:4009:b0:8b5:b292:85e2 with SMTP id d2e1a72fcca58-8ba95e80f66mr929417b3a.26.1794280216611;
        Mon, 09 Nov 2026 19:10:16 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dffb5sm308939b3a.55.2026.11.09.19.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:10:16 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH 1/1] RDMA/srpt: Limit read data transfers to the command length
Date: Tue, 10 Nov 2026 11:08:06 +0800
Message-ID: <20261110030809.913063-2-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110030809.913063-1-pkfxxxing@gmail.com>
References: <20261110030809.913063-1-pkfxxxing@gmail.com>
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

SRPT builds RDMA contexts from the initiator's buffer descriptors before
parsing the CDB. For a READ underflow, target core reduces
cmd->data_length, but the prebuilt RDMA WRITE requests still cover the
full descriptor length. A backend such as rd_mcp fills only the shortened
command length, allowing the uninitialized tail to reach the initiator.

A remote initiator with access to the LUN can therefore read
uninitialized target kernel memory beyond the requested SCSI data,
potentially exposing sensitive data left from previous uses of those
pages.

For a READ underflow, limit the data SGEs in the RDMA WRITE chain to
cmd->data_length before posting it. Preserve memory registration and
invalidation requests, and retain zero-length RDMA WRITEs beyond the
limit so that work-request accounting and resource cleanup remain
unchanged.

The issue was discovered and fixed by Qihoo 360's Tulongfeng multi-agent
system.

Fixes: b99f8e4d7bcd ("IB/srpt: convert to the generic RDMA READ/WRITE API")
Cc: stable@vger.kernel.org
Signed-off-by: liuyong <pkfxxxing@gmail.com>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 43c3ff1ad..2f7857ef4 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -2913,6 +2913,26 @@ static void srpt_queue_response(struct se_cmd *cmd)
 			first_wr = rdma_rw_ctx_wrs(&ctx->rw, ch->qp,
 					ch->sport->port, NULL, first_wr);
 		}
+
+		if (cmd->se_cmd_flags & SCF_UNDERFLOW_BIT) {
+			struct ib_send_wr *wr;
+			u32 data_len = cmd->data_length;
+
+			/* Keep MR operations and WR accounting unchanged. */
+			for (wr = first_wr; wr != &send_wr; wr = wr->next) {
+				int j;
+
+				if (wr->opcode != IB_WR_RDMA_WRITE)
+					continue;
+				for (j = 0; j < wr->num_sge && data_len; j++) {
+					struct ib_sge *sge = &wr->sg_list[j];
+
+					sge->length = min(sge->length, data_len);
+					data_len -= sge->length;
+				}
+				wr->num_sge = j;
+			}
+		}
 	}
 
 	if (state != SRPT_STATE_MGMT)
