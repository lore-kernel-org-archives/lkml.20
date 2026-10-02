Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5649D14883F;
	Fri,  2 Oct 2026 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971335; cv=none; b=CWYjrDxnN6mAUpL3CA8h6z1sraaSR3ad6PS4efuGJ8tVEGX4nUMHYVWMdPzjF/qyjTItdHPmq7vTJso7s74+KpekTb97iQ0EIuqV7OGSXP18UBt1aCmv+aptu9jNpmvlP8Luf0CP6IXemSI7siUQJGjbSJE66KuXUPbivsKnOkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971335; c=relaxed/simple;
	bh=1679evKgXoYGg6TPEyv9GM5pqSpCftjpT/+/Kn/6nT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNsEroiVuSGMjBGYcYHw/JAXDSyjP0An225jsnZJ37DHQefsDEPbEK/Y44cfrS/Vnlo5W1wfZIUtpJvz9+nqfX4KLB7n0pxEyVr7Av3fcUMyXHDjSi3aLvdkc1+eXeAKC+Dn7jAMmrMbCirSFSafBUXpX4TdpVenVGquO+VvbcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dR8pqa+1; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zanUCxPo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dR8pqa+1";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zanUCxPo"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790971302; bh=tW2a/Ckxu3eFtEhj7vR1qMj
	6QkE/6fJH3wdcpMU7dkM=; b=dR8pqa+1h2vPuzRxb7cd2UUlXUpTOFZvKEED/oEDnksNFRdOuk
	V0VTM7tU1KTV2rf+iN2HjIl63LgglncyMjgeQEc7xxtM4s8DuNWn/akkSZh9nJpi+Xdgs0AgOHK
	IKbYshl/HJwCDv6qSZazOBWS3fhC3Fcsc+89ZdhvBrBPLTnWND6mXDr+hEafWEqKs8tqMZLRBRX
	eqA3kI/5O6SgmZlgrDCl20pl9xP6Xku985quSmlrChcTRvF/WUuHoKxgTLufs/qp+ONz1CjOw3L
	pTyPrHN5tjUbQCXOTMS4CR5cykcIBUora/U+xBvSzPWZ1BgyRukETxa621p0U8kjyNA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790971302; bh=tW2a/Ckxu3eFtEhj7vR1qMj
	6QkE/6fJH3wdcpMU7dkM=; b=zanUCxPoHWkiAqZcTjBUIDUXjVMIUb4xqvd3T3RV2LB0GELWpd
	kdRzq3W5oWdfeNu8hpUypaZpSDbH6pbKdqBA==;
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piyush Raj Chouhan <pc1598@mainlining.org>,
	Robin Snyders <robin@snyders.xyz>
Subject: [PATCH] misc: fastrpc: Allocate message buffer from remote heap for sensors PD
Date: Sat,  3 Oct 2026 01:31:18 +0530
Message-ID: <20261002200118.138837-2-pc1598@mainlining.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002200118.138837-1-pc1598@mainlining.org>
References: <20261002200118.138837-1-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensors protection domain reaches the message buffer directly rather
than through its context bank, so it requires an allocation from the
reserved remote heap memory pool. Using a context-bank buffer allocation
leaves the DSP addressing memory that is not mapped in its address space,
triggering an SMMU context fault (e.g. 0x1fffff000) or bus stall.

Ensure the remote heap is used for SENSORS_PD invocations even when
a stream ID (sid) is present.

Suggested-by: Robin Snyders <robin@snyders.xyz>
Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..8f39f4bed20e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1099,7 +1099,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 
 	ctx->msg_sz = pkt_size;
 
-	if (ctx->fl->sctx->sid)
+	if (ctx->fl->sctx->sid && ctx->fl->pd != SENSORS_PD)
 		err = fastrpc_buf_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
 	else
 		err = fastrpc_remote_heap_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
-- 
2.55.0

