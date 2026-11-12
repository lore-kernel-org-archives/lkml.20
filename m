Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450683;
	b=Kb/MnMhoPm3Jd81sqDniG6mOrTb2wnHVEEWwAFNfEAZNGBC/ch7lHixwIqpNl/grxZSF
	 El1yoq4a+HTnWhKu1oUCCZIahcpH5mZbqIwEHhZpft0a4IKW0lduzYZFsj91xrCRxiMAu
	 lh00VjmYQ9hayzDdsLQtqTxGgAbaXZ7n9C7pVATaS7MiClIJR+MWbj6gOPg/1jOcuJgOV
	 YLrPwXQthwgv5ufiozeD631sAxtN5dXwHP3iWSx7DrTap2gctg1DhyZ39mBjlVm654fdp
	 VQ3pO4i6FukdJN5k7LMbhKlTGQLCFJTnFpXagHbx2OyvW+2riZBmqdku12sHUhP55Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450683;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4aQHBiqJ06U37j0N40/YP+bLbY78zhD+Fcv1k2FBL0c=;
	b=SL1pbkhXmXtxlBtlr5lTYey4u2e3pQ97gG3GSzM5Ag0zzBwEJIcAF0QX2DqY82xYzSgw
	 Wg3nNo+xh+xYpBc+CfU9QIOru6pOSrlLuVrZafZMrAimknxBsLTlszHjQtIXNZIbZvz8d
	 Eb/jMZ5do/8zZamUXF5mU2RD50T4aUt6AkMW+zl/h8+Ig4Bpa72TsCncLJ6xgtuKWz+Ls
	 Zgl+aDTjPUEWhUxBAjNSxTm/JY1dcuXC49qcZZ2sJPppkbIDwa7O0jk8lo6HtQH9K03nv
	 WX+s4vSW0SoPkKto5zd7hQfCk1dk7iFZ8Y2Fz4VL8LOVEU2NuEZiA1tBBUH2YyXA59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WFx08cKh;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B191606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B191606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WFx08cKh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WFx08cKhj65W8B/25YY/WT4NVFKCWadtE15HrlGmeAgx+8pEvWHscA6ss2Lvt4kuzDfhGPzu97kWr
	 RNC4ikYTPlpRGuKLytaY4fSTTu0kLGO+n+8nQZ+rR+7LfXjiv276hMmfags829gatR3nIBxT3skzL9
	 oA2nKudcY/+BizMA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af524f8601-7c5c7;
	Thu, 12 Nov 2026 10:31:21 +0800 (CST)
X-RM-TRANSID:2ee46af524f8601-7c5c7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af524f610c-ef34a;
	Thu, 12 Nov 2026 10:31:20 +0800 (CST)
X-RM-TRANSID:2ee66af524f610c-ef34a
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: chleroy@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] soc: fsl: qbman: Release the private memory node reference
Date: Thu, 12 Nov 2026 10:31:19 +0800
Message-ID: <20261112023119.118215-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

qbman_init_private_mem() obtains a node reference through
of_parse_phandle() or of_find_compatible_node(), but never releases it.
The reference leaks on successful initialization and on errors after the
lookup.

Use automatic cleanup to release the reference on every return path once
the reserved memory lookup and any reg property update are complete.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: 42d0349784c7 ("soc/fsl/qbman: Add common routine for QBMan private allocations")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/soc/fsl/qbman/dpaa_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_sys.c
index 3504ff557231..e9c37c45dd58 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -37,7 +37,7 @@
 int qbman_init_private_mem(struct device *dev, int idx, const char *compat,
 			   dma_addr_t *addr, size_t *size)
 {
-	struct device_node *mem_node;
+	struct device_node *mem_node __free(device_node) = NULL;
 	struct reserved_mem *rmem;
 	int err;
 	__be32 *res_array;
-- 
2.51.0



