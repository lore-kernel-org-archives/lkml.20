Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A45572673
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962967; cv=none; b=KXmbLLYJ393KrVlKridM3HZxkqm0B19yz5dAET+6MY2Bd05JHwkuooUwyrHwNIqKl71/6HDkaxQIfkpnJ0PSDbF/+33dPIJ/qfO+z0JaJdg8m+rxy142Yyegf0q71Xygh2+FOtHaa7U9QWi09IjBkLjH1n15m2JE3ETIhahQjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962967; c=relaxed/simple;
	bh=pGxxZsY9KZLEzR8VraG3v9cwqrmNi65Gdmazcx0cWpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PV0ndM7EAIlakAXHvkGRHueIMLs4Hy+zLbnaoNrRZmhQiDHuQoPQF99YvJKmCQs4dZl56iqL/6AjiV+Dqc1W9kpuOadEBjQmu1EhMJeblYwuz3ZW9fLvctzR/fF3rwJlfvZr7flXT2/7pCJiuvNZVMfr1JuzXd5XsOGR3y+J8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kT7Om0Nf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ABUlePLp; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kT7Om0Nf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ABUlePLp"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hg2jv1xkyzKnSv;
	Wed, 09 Sep 2026 16:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G7T4460B7t4XQqauaJoMawzv9zDw23gbmRbuYIPBjiw=;
	b=kT7Om0NfcM5emX5OfiqeT5xl5z9Knp4fTPvED5+lEmVGgJEjONESiueOGpvYoFFb1j38Yo
	s4yHbKjp+86FyP+KgCjr7QWcx1YAtkZn9a1PGHVgyX5K2UzOChHOlD/z76PXbpz7y7kxXI
	9V/yAJYJX6A18RRI1Xy0/Y29xtAQWbKhx/SUoqR8VIOP6kNjPFJtymqSnbFQUg1Cwcfepu
	ggDdggk2VSfERS60oE9isXqwal+ufSqO4zdA4rij5OgPZnc+26aXYWJstG+QK0B7f0I/R6
	KH2bRlf71ZmJjw/fUwPxsfcqCNt9CF2NH67mnOuHIICahNRKymfltHaR5V9Bzw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ABUlePLp;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G7T4460B7t4XQqauaJoMawzv9zDw23gbmRbuYIPBjiw=;
	b=ABUlePLp5CK9WLYiBSABiVSxvAcfiXrnTLQdMXmIka1Vm/unBSxLmqmXBm8CBeO7OnM28/
	pmu4ktEBDeQ+k4AllGp1A2h1a1YnsQGD/vII1z04imTkQ6VqzIXi1PeieTOZT1ZVIg3gfh
	b+Q9RtWiIKTT5PNs47N/F6vPeK8+T4L6e20/dEGRlqhkI6KtJUt9PFPN1FGf3HQwhVLjcE
	xovzkGL/RRCN0Ty/RpgWac/3kFJ3YMdPHK9gpPpLw6wNlbtyM05CItlcAfJKGPLIwHXlib
	hePCR/el9DLTfHgU0BeOUeKZe9wsHfD2bQaQMgpJHzeIf6rdnAtJDwhvKh9ZVg==
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] checkpatch: adopt new coding style of type-aware kmalloc-family
Date: Wed,  9 Sep 2026 16:07:37 +0200
Message-ID: <20260909140738.1367024-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g47jnf9z64hbec9fjxns1n7wki5dknwu
X-MBO-RS-ID: 3d0caa46e25f4600baf
X-Rspamd-Queue-Id: 4hg2jv1xkyzKnSv

Update checkpatch.pl to reflect new type-aware kmalloc-family as
suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
and family")

Add suffix '_obj(s)' and '_flex' to (km)alloc regex-term.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f424dafce..66e2b5a01 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -639,7 +639,7 @@ our $logFunctions = qr{(?x:
 
 our $allocFunctions = qr{(?x:
 	(?:(?:devm_)?
-		(?:kv|k|v)[czm]alloc(?:_array)?(?:_node)? |
+		(?:kv|k|v)[czm]alloc(?:_array)?(?:_node)?(?:_objs?)?(?:_flex)? |
 		kstrdup(?:_const)? |
 		kmemdup(?:_nul)?) |
 	(?:\w+)?alloc_skb(?:_ip_align)? |
-- 
2.54.0

