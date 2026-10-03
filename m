Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B06339719;
	Sat,  3 Oct 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039997; cv=none; b=trHSyrOZd48j63szbISvEhIu5DEHbEAnRBxc7yFB+6GcP4eKxPpobrocIJAKsk2OY2gt5CR+izOUYr1Bem3bW2gT+ohDvjb+KWOPdBPu0z1RAh7Sy7WqPAiPKhHpx3K08mr+dAfKZt7h1mX93Mn/049Jz/OLrnxaUlnIcKN3rmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039997; c=relaxed/simple;
	bh=DL3b7Vus7eHNBKpDJ1Djvkoc8OfpofnJDnnzFIpFU2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1Vi7G8M6+BEl/XXPWRs5i6duyOf3M0WTQYTYeorzLfn2ZpXZ+dWP7biYe/7DPmVbjiZkAsu5BVM1KkHo81g7W/BWqH/5jNCzzAM5zOiHSMYoeYTa3+nubG2fiFhZPwbtpchYupOvyxQSnpPIgx+WWbG7IZYu+rHcg3rjJU7TUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YTJF4Bwn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZUtvlGhZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YTJF4Bwn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZUtvlGhZ"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791039978; bh=NLDgl9YFw3oqWDtCyHy91dX
	kuGUDan/WPVolS9vsTZg=; b=YTJF4BwncoknklqhYiARMHA0E9O4Sr2l+8Uy6RJKAS9ZtjhcYe
	gMQOXL+V/P2zn98arVQUASBOISITYEDPbZU04GP0VBxPgXIHdh4wfSmLjPo+hJievhcLTkMI5Ul
	6InbNO1+M/Bsa/GQCXZZsALqjkCXsjnZnhMRcA5d/DvjQmFR7xfHonLgu4DsX2f32b/NZwzMXQN
	+lCM+aF9P7E4g4kfxzPBos/aYbwFmKjj5I7VFhGHOOpYNaf8egkPE9BxxAN86ROw9zG9p6hGYFg
	7PLnAzzOl6jB/JYMdox8BxyZzy7ygwhY13Ie8KYXwkbdRS/ct02Iq3C+QATl/gxfXxg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791039978; bh=NLDgl9YFw3oqWDtCyHy91dX
	kuGUDan/WPVolS9vsTZg=; b=ZUtvlGhZBRI3zxJJ/QqQvp7h45NKWWCmEjDiCp0RSg48SYAvek
	M1ArznQX1J2T26HQlSmUMaKZIe1VtQ/LdYBQ==;
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: srini@kernel.org,
	gregkh@linuxfoundation.org
Cc: robin@snyders.xyz,
	ekansh.gupta@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: [PATCH v2 1/1] misc: fastrpc: Allocate message buffer from remote heap for sensors PD
Date: Sat,  3 Oct 2026 20:35:59 +0530
Message-ID: <20261003150559.6926-2-pc1598@mainlining.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003150559.6926-1-pc1598@mainlining.org>
References: <20261003150559.6926-1-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robin Snyders <robin@snyders.xyz>

The sensors protection domain reaches the message buffer directly rather
than through its context bank, so it requires an allocation from the
reserved remote heap memory pool. Using a context-bank buffer allocation
leaves the DSP addressing memory that is not mapped in its address space,
triggering an SMMU context fault (e.g. 0x1fffff000) or bus stall.

Ensure the remote heap is used for SENSORS_PD invocations even when
a stream ID (sid) is present.

Signed-off-by: Robin Snyders <robin@snyders.xyz>
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

