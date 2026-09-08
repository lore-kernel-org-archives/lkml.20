Received: from mo-csw-fb.securemx.jp (mo-csw-fb1122.securemx.jp [210.130.202.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60646530DEA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878215; cv=none; b=o3iT6iPihu5KJssrxnp4ml7LsmVexQ+MQXWHUmd+r9b+sQPAEfazizNCWhhCRQqs2k5Fu2Z1FRMUXJeXG90sspJfbxerWGxj5AzZ9LPrauD4VnxqIb4RNn8HBSbmexbNRVzR/Cr45E3Z5rfcDb1/14TlnIgj4HhD0o+BnKmMSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878215; c=relaxed/simple;
	bh=Zw6CDH1SqvRAOoGf6u6YMlXMcatv/Kq25DVxobnhcVo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=dQF6CSpcRttWLsyzGe6pf+J3Wi+VWQi+CT42jBZ0nbHPLiI6SoB5P5gi1jAElOT4bWeuAIAHs08V1OxOzGDhn/2ctSVXjaCmM8Kd0NcGpHmDL39+GUbYQIZZs2/Zxn7lmk4dPpl7VJnnMlB2PQk3FNoa8nMDbFCjwxcsJsAZdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=iDVf92uZ; arc=none smtp.client-ip=210.130.202.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="iDVf92uZ"
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1122) id 688DK6Vd3629921; Tue, 8 Sep 2026 22:20:06 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id;i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key2.smx;t=
	1788873584;x=1790083184;bh=Zw6CDH1SqvRAOoGf6u6YMlXMcatv/Kq25DVxobnhcVo=;b=iDV
	f92uZW3j4c8Sj+1SNWNiBKXx2Vdm7w5cxI4a6yJchePBdebhVRneJbFUKMHOassGG6d1v70q44u1l
	afJUXtQKE6kj8JYV9rh+leLKLrRsAbZsWwDyUSoAFSeuZC4obFmyZ7iSwxuNRsqVAZ6IRtE6YaDTg
	Ww+5OGWJnfpbIo+OKzYMNbUXdSTZVIlyaaNw2nM+efTQlRUFQBaSAJbeFHMYnNwUQS2zTfEt4IAag
	ElsWxxgB35omr2WdOAD3fjTxmPOofzBA2AINcdYSLxopDVX1C+xPVcO3LooCc1nFAmmU+VhcPIpoI
	xV9WrECN0+7eOm1ZHV1p9+xnpiMvA5g==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 688DJhR5390204; Tue, 8 Sep 2026 22:19:44 +0900
X-Iguazu-Qid: 2rWhoBnMSUnbwtukGv
X-Iguazu-QSIG: v=2; s=1; t=1788873583; q=2rWhoBnMSUnbwtukGv; m=CsCSc32dUtUyIfxbQTWAKz096b3n0mVzQSY5v9ck4zk=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4hfPg263Grz4vym; Tue,  8 Sep 2026 22:19:42 +0900 (JST)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH] MAINTAINERS: Change ARM Visconti5 architecture maintenance status to Odd Fixes
Date: Tue,  8 Sep 2026 22:19:26 +0900
X-TSB-HOP2: ON
Message-Id: <1788873566-7765-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

ARM Visconti5 architecture is not currently actively maintained. However,
if patches are submitted, the fix would be applied.
Therefore, this changes the maintenance status to 'Odd Fixes'.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb077705..f4d678bbf0a9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3806,7 +3806,7 @@ F:	arch/arm/boot/dts/nspire/
 ARM/TOSHIBA VISCONTI ARCHITECTURE
 M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Supported
+S:	Odd Fixes
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
 F:	Documentation/devicetree/bindings/arm/toshiba.yaml
 F:	Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
-- 
2.51.0


