Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288577;
	b=qf1jXoQBmO9Qjd7dgH2piHeURwWApYvrj3pWIBHD/OJnDnJVST1JlATgd3+ThGIEHxmb
	 WxXAJT/hjALYuaYmp0Q7oi40O6w4bonMK7TkodChBVfI8ezeV8Yv4lqTTG/DnPTI6Fnda
	 9irusH9eP+f6jTFkBOUUeRi4MdB2bTDQSe6rgqci6DWTmSqwPasYgpfI8A0LgqhGREM+E
	 nL5JC8sUKM7GOkscZVlWbw3ocQQJQ1223ihqPVl0bVwy+BaYyvmKzPNghMC4X212vM500
	 Cuf+wwsS4wFBk+6jqbCC02G+URyWsuacslFUxnmuHgFS2R7eBJL7pzQry+q4PgdvjUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p2T/Tnq0wrJazsgzibf7bEuis2IKzeDcfBGA8lydX14=;
	b=lRtsYlSrShGwRHCUfmdO+Mfga9/Tx/fbPaL0LlCO2y/q3O0LDdM3C4SmxyqQ5TCYaq+C
	 1bNzLXeA/3bgWBZnxpsOV1desXhwu02Xlcnw4EVVlpQ8YjAdCYOvMq9BDhw2rYs9QipQd
	 3q9p82Rcet5ozyOkDHYGaqTfV8K2kHX39gfgu0UG7vQxjkmdH4jBxJ7UWQ3CmOI/7+DQh
	 T7MO3sgNfw5QUuyV2WdSGXD4UUoPSAAP5O36jaP1Wht3cMcWsvbjx8W7wNPHBDLEQBpSA
	 MHkOrc11fPo2ODi2rAMGlX1bZo+GozeaWp6gCHLwf9BpiigeWHlQVF15WTguIb4OFzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvIrSLnm;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23876606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23876606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvIrSLnm
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a9f9473029so1312891b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794288576; x=1794893376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2T/Tnq0wrJazsgzibf7bEuis2IKzeDcfBGA8lydX14=;
        b=GvIrSLnmuwFnsNPBX/JyOUrvoXMsCql0KosPD5ppgPaPqcc6R5CxsHsikD9OU2PMvP
         ZZdJwsdIW5Ow1aVXIJeDuHZKA03ifzweRfP2uL+MFNias2IwYZH+M0HUrL3b5JA6S8hU
         saio/qh6Vi5j69eII53NZXVIVuUKXV+xSco+gMpvToX16L0Kv+CsX/IJzYXZfoRxlfQy
         uS6BRZk+ouZVMvp4AB8n/eqkjK6Ok73T3aCSRrVdzMFps6tMHJxu62NNRyMZk83w0EqP
         nsk6eydxgvE2TZhX7WmV0/DM7HH8v3hYvd2T8ongfOHOfCiko2RJZCr3KUQDcM8GUM1q
         tzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794288576; x=1794893376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2T/Tnq0wrJazsgzibf7bEuis2IKzeDcfBGA8lydX14=;
        b=qdTZMqtreATZdTfiwlvSeETkrPp+AZnB5sOxMYNyD55dXlDmodcnNgICAOwjM+m7dX
         oXkfK1M6G7732/Mh/otDpTl6x5oWvlwtWIPh6QyBJMpA+MTn5TUvGu0B5OhCE9Ngudyv
         xTjpntnBAnG2xGWcf5oiKm8RelY8myMkZVbEJQcPYGHdp0FdhuFzlIL/3pUBjHWDWKUl
         o/g8V1gWqI3JJxaKpW/30NVWKPb9APHEJq/YircegnjYyK+nzlnVl0xsShNzsZW98N0W
         lbggXJTMkKBGYkbTGI7ppQ6EWVWCmfD1+lVcTJeOGImnhBCX92Yza08v7KvM3IHYmLMl
         0yCg==
X-Forwarded-Encrypted: i=1; AL+hErHTk6Lu4x7EWVvg4UKtxliM5yPd3xWX1EUSYzfOBV3YUBlP7NpGUHU/YwXurenOC2jvex6BHv94HYGveyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oAaHVvj5MEmUYpRs+fsu4rmc0vmtnSIZKmDGGYopHtIYF/NSc
	An1Jsm2QTSQ1sUiVvvGWISIc6TowweGxa5yS8htPrrQ58XIuss2GeoTV
X-Gm-Gg: AYBFou3CKp7Tm6VYQgjm4839WN7tz7YpzHSKPVwVlQ80wl5r/1Rti0k5aXRb1B791BQ
	f7DDSnha5yqbgzEgAzEWTi8YtAODAqy5iq407Hn++GUzqsIYbDGtKulxVhuJR8dMFKPFJ5PUN7t
	ueBkeMsx00tw8whb3Y07WlWrXoyiow9r3Auos+s7R4O66LANs0z1qyUrft3qD93/OavMA0NIDyo
	QYVGIEuX4xUiurNvoa6nyHRBTWHsKBdlnCvVCynXS/9NG0ZSXiPl/hqC2QtOw/ZqswJPaxgbLjy
	L7Fjr9d+Ki2l19GMgHWsNZJneAcusgWx89SzyB9Tg7pD0L5e4gAl1ZDSf6Zs4fA+oqA4OHCYeQX
	K6RXo4Q/v7B7JemTzhibziYSjwFythhwKs3o8PInFyyGsKVqO2/dmBBQWFPEoSOP4MY4mlxLjkx
	PIIdwr9CZ3y5QRGF0WWYq5AP+hXEzQfvoE0GmhnNGIvO1VdOtQ6Xrr0Yx2yTkOs7dyeQzxBm0GI
	KbRPR73q+kAWqNDT7NP3MLBwyXeRoZF7hJntgCPE0N7skFKxfHIMZmfSaB1MYItlaDJn4oJLKRo
	mtET799uOpfoxa1n0ENItNs+8RAsdNfWrjUns1wTxg==
X-Received: by 2002:a05:6a21:1f82:b0:3e2:6f6b:467f with SMTP id adf61e73a8af0-3f18eeaa3dbmr1587066637.33.1794288576305;
        Mon, 09 Nov 2026 21:29:36 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67adcfsm402224a12.8.2026.11.09.21.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:29:35 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH v2] RDMA/srpt: Limit read data transfers to the command length
Date: Tue, 10 Nov 2026 13:28:26 +0800
Message-ID: <20261110052827.963143-1-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110030809.913063-2-pkfxxxing@gmail.com>
References: <20261110030809.913063-1-pkfxxxing@gmail.com> <20261110030809.913063-2-pkfxxxing@gmail.com>
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
parsing the CDB. The resulting RDMA WRITE requests can exceed
cmd->data_length after target core shortens the command or when an
indirect descriptor's buffers exceed its advertised total length.
A backend such as rd_mcp fills only cmd->data_length bytes, leaving an
uninitialized tail that is still transferred to the initiator.

A remote initiator with access to the LUN can therefore read
uninitialized target kernel memory beyond the requested SCSI data,
potentially exposing sensitive data left from previous uses of those
pages.

Limit the data SGEs in every read response to cmd->data_length without
depending on SCF_UNDERFLOW_BIT. Keep MR operations and WR accounting
unchanged by retaining excess RDMA WRITEs as zero-length requests.
Clear sg_list when num_sge becomes zero so that providers such as irdma
do not program a non-zero first fragment from the original SGE list.

The issue was discovered and fixed by Qihoo 360's Tulongfeng multi-agent
system.

Fixes: b99f8e4d7bcd ("IB/srpt: convert to the generic RDMA READ/WRITE API")
Cc: stable@vger.kernel.org
Signed-off-by: liuyong <pkfxxxing@gmail.com>
---

Changes in v2 (addressing the two issues reported by sashiko-bot):
- Limit every read response to cmd->data_length without relying on
  SCF_UNDERFLOW_BIT.
- Clear sg_list when num_sge is zero to avoid stale fragments on irdma.

This revision has been compiled and verified to fix the reported issue.

 drivers/infiniband/ulp/srpt/ib_srpt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 43c3ff1ad..9257c6beb 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -2907,12 +2907,32 @@ static void srpt_queue_response(struct se_cmd *cmd)
 	if (ioctx->cmd.data_direction == DMA_FROM_DEVICE &&
 	    ioctx->cmd.data_length &&
 	    !ioctx->queue_status_only) {
+		struct ib_send_wr *wr;
+		u32 data_len = cmd->data_length;
+
 		for (i = ioctx->n_rw_ctx - 1; i >= 0; i--) {
 			struct srpt_rw_ctx *ctx = &ioctx->rw_ctxs[i];
 
 			first_wr = rdma_rw_ctx_wrs(&ctx->rw, ch->qp,
 					ch->sport->port, NULL, first_wr);
 		}
+
+		/* Do not expose uninitialized data beyond cmd->data_length. */
+		for (wr = first_wr; wr != &send_wr; wr = wr->next) {
+			int j;
+
+			if (wr->opcode != IB_WR_RDMA_WRITE)
+				continue;
+			for (j = 0; j < wr->num_sge && data_len; j++) {
+				struct ib_sge *sge = &wr->sg_list[j];
+
+				sge->length = min(sge->length, data_len);
+				data_len -= sge->length;
+			}
+			wr->num_sge = j;
+			if (!j)
+				wr->sg_list = NULL;
+		}
 	}
 
 	if (state != SRPT_STATE_MGMT)
