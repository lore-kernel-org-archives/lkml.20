Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246177;
	b=KlKxlRLO1l1PuAWa7G3BXhoI+z+e7tK0KXWtUbP0js5875Pit8Pv2AHyz/6C9iVkp1oW
	 Jzta0ULHTz9jsc5JN25K8qeIPMnWh54/KLRRpn2iGE978H1xq7CLhBp0pwpO1cyUWUWNY
	 +WusJV5MJlDx8MjRjFY4ltaMHo9WUgg0wKbJ3tY5DTJnf/WGsswALZ9ytRhMSDZD4jGOf
	 Gotki2B4pfmvJZXiw/QUkoxIyU+BP+Ofu2AnhqFA03X2+0sCU0ovaFSJKf0nUHNIHXn9W
	 mdlvtGHb4cFu/qKwJd052xjKeBgA6MjJsWTodB/PmdGm1m2CRp8H8qd5uI6tDO0APwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246177;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=yUigRQqTo3/1j4a3tP4JGb2NgcnUphXqp5Zq6+v7jbI=;
	b=HaiXgmWY8w0TWV1EkCvYsktChXEwkgTB1a/+PAY7s+wMFY3K+ZPjbbq7xzLTf/2k3G+D
	 EAusdRyMLNcDGPWdGhwQvBYVAD7O36LmnEfxw9/x6iffeAJDDB+0fJ2SaIypu7sLssD4j
	 tyaLZMnCVI2kPCStQsneEF+b7C8TUMVxqwPsF7yu8yLoHT9BqCiH07GwYFSuRgN5IZigS
	 6idxklgPBuXiSuTdDuUhHz7ZAO3jt1OsBMJzE3fmzb2lSGgPaEal+ziz8WDAIvdnLkn2t
	 uqcrTFyjqgo27FLWLp0Zb7W3Uye2A2f9XSaEGfh+fyCFyNI+vyTzHn3BGBHihipzsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b="lU8s/4BP";
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AAB606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=lU8s/4BP
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jNcYy40HDzKqHf;
	Mon, 09 Nov 2026 18:42:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794246166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yUigRQqTo3/1j4a3tP4JGb2NgcnUphXqp5Zq6+v7jbI=;
	b=lU8s/4BPgQwvlM7fBbMEmspBBOnyhifCJydP9oh6Mg9sDs2LrdC6LvNjLfquNbFRzynTMF
	gWneFALdAsUq1p+4YdaN77C12nhgpyWLhkW+bqRnRWQiDI4CQfRpBSKqGAXIwyItHh1pvq
	QZoRSzjhggKj/dlGCdeYzaai/GB352rOGWITfJ/4WjR3vtz/nQbooPpyF4nKAlnG9Um593
	9JVaqjHmZzFnVCcgSN0YWg8vFXyAVBLpW3sqPItH48JmNCqq58dtGS/uqszMTSE9mamQfh
	7KPgDWz/eXGuFho8v4iRs/YcGOJsO51BZu7tHesYx7ZuWfzC40Q5uvAKnDs6QQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/befs/datastream.c: fix typo in kernel-doc
Date: Mon,  9 Nov 2026 18:42:09 +0100
Message-ID: <20261109174209.338749-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
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
X-MBO-RS-META: p63zc6gkgqxtmi9w4ithbpfnus1yciy6
X-MBO-RS-ID: 6d56d15e3b5aee37019

Fix typo to fix:

  $ ./scripts/kernel-doc --none fs/befs/datastream.c
  Warning: fs/befs/datastream.c:131 expecting prototype for befs_read_lsmylink(). Prototype was for befs_read_lsymlink() instead

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 fs/befs/datastream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/befs/datastream.c b/fs/befs/datastream.c
index 97719a7c7e..d4182edfd7 100644
--- a/fs/befs/datastream.c
+++ b/fs/befs/datastream.c
@@ -118,7 +118,7 @@ befs_fblock2brun(struct super_block *sb, const befs_data_stream *data,
 }
 
 /**
- * befs_read_lsmylink - read long symlink from datastream.
+ * befs_read_lsymlink - read long symlink from datastream.
  * @sb: Filesystem superblock
  * @ds: Datastream to read from
  * @buff: Buffer in which to place long symlink data
-- 
2.56.0

