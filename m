Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63376499F10
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637120; cv=none; b=s52f/dl/rGVQ0/gF+rvhx+GAzLnYwC/2qCnwFKXD9OP8/4JodbEzFDUYU9rk9VWTzaE2yZaMdziINFch0gcJ6qJmXJcRnx10uyF3bAY00PPNGQRl/wG2vxgaTU76QnBN4rRlfJ2o8MQt1Xp/k4f4ZqO2jvPx8RTnhZbTP7RHBGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637120; c=relaxed/simple;
	bh=FOd/lN+WTGBBU0dbhuQ13HZwwAhvXksKjcEozBmX72g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ia+1803ocEgKKeP5UlLZMPupIAAxEgsVxB7i3eCO08PqOxIV8PrrJm5xqWxwFg98jXlLCnn53E9oy0Tn+2Ttq4Znv4E8bYcOGvOt0y+5coY4nn/0NIjrDS3G0+zcSVdgMCi+Q1mdFXq3hQfhDFgkgPq2SgzUgf2mkBOP2a8adoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A8Im6rLQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A8Im6rLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=hju8wbh/GOITTN
	R2tODC4s3hFrmplwgvVWbSxG4F71w=; b=A8Im6rLQaCkM1RzSOiMmX5b12nAf3m
	73ZOURswfnNbAreJMbjmdmAsATJmUyQXWQE495AojMgPl25g4q8mi+JhmZJE7He8
	wHRwKP267iohATFTwzCtLog0XbZtDsbbS3CGfVWHfhHQHVOsdzorqkMATcpbRtNG
	PJjWbCUxBzU98Wuj3ED+8qjH4U61TxpN26KcreeBxbbg+Jk/PU3MFJxOxAo+qt3W
	zW8vL/WT+/iym09IRRxTkKFzmgssjRxtvQmcdyGm9q2VW+aPR49eJwys1yXjyWrL
	Z5SKe5MMiWwo8HD2a4jH4H8dk2OgooqtMN/GkSoZ2cm0PWCKDS2BZiKg==
Received: (qmail 1551750 invoked from network); 10 Oct 2026 14:58:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:58:36 +0200
X-UD-Smtp-Session: l3s3148p1@zUXeBXxdeNDV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-crypto@vger.kernel.org
Subject: [PATCH] MAINTAINERS: delete entry for John Allen
Date: Sat, 10 Oct 2026 14:56:44 +0200
Message-ID: <20261010125735.19609-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email address bounced. I couldn't find a newer one in recent git history,
so delete this email entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 252b6d7ee163..e1e9f6a7b737 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1086,7 +1086,6 @@ F:	include/linux/cdx/*
 
 AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER
 M:	Tom Lendacky <thomas.lendacky@amd.com>
-M:	John Allen <john.allen@amd.com>
 L:	linux-crypto@vger.kernel.org
 S:	Supported
 F:	drivers/crypto/ccp/
-- 
2.53.0

