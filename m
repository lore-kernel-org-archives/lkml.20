Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776695;
	b=gvMQIANI37Wr9cxez4qGjMQCjBCzZYrXcGAoJN/ORtCcANjiUCXC47nRAP7KvtdsvEDC
	 G/B2h5RxOFxyeuGlnLm+LRyZY9oV4F6RyE4k0mF7v783a4jufUphF/10+Q5GVvXw3fFaP
	 k9RVGENFvlHsHTmnaaV4CdF8aAeMwNp+GVUmbCop6Bx+aj/6STTeHpxJM90LeysmPiwmJ
	 x8xU55SaBN8fNS2kdEsCTrHCKNR8d7TTRGNSfeWzFE4NfhwUfRRI66vmL1QuumMJj1CXe
	 F8NEzi7+gGNrNciiGKMPFC9wZGG5AE8Scr4zrji/3rnLAidVr0UHQ/XJSzIe8jgDdpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776695;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=DykgM5NE4WdLFCVY94RfUrWegvpeMHFMFL7zj7//kZY=;
	b=i5bn4SnnNmPKyviH+qjEUlMC+nkxafst5TYk6W4pbsdf76+ZAVLuIQ5DQ5BxW54Shnix
	 fmRojVOKz+Dfc1ImDVr1t40pejP/zhzBcKq7iM0zV/Ce17rGlHEamuV9sMbwnkgbnS/zW
	 SxBtgY8WSGbMkPbEdvyHHRCkESGboM2+2IA4hS9FHmz12/jPARjiYG8jTiF95xaFcx+z+
	 EssKs2tsdysFit3AV/3k1ye0YHvTx31pICTEuWwStTao2GOlpuL36t+J4HHLVdnwN1APm
	 RY0VtegRbqe1Mt/X2zSHLvUVytMdtq3PJg+hMUWrmZhxiRWwSr9VyBNaQIzTDw3X4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=bxPqqgrh;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E2606A332;
	Sun, 15 Nov 2026 21:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2E2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=bxPqqgrh
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jSNmL6GXDzKmKZ;
	Sun, 15 Nov 2026 22:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794776690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DykgM5NE4WdLFCVY94RfUrWegvpeMHFMFL7zj7//kZY=;
	b=bxPqqgrh3O4NiaOx5bDtdk9uM3cutMTSwniGOFbKzfkoPvXAHKfw/posdGWJNaLfwI1EYV
	lrCZceSzcH+UU02aKQcTa+vIRrEI8odb7/cm6j4lq252rS7IMgABYzn3UtHBkdOc5fcrpL
	xqDNCz5AW3e82ivV8NRI+C0EHP1xr1P130aF+zDl4LiC53bIsZ6Qahnw0NR9rKu7OSCPi7
	Tz4iMDJz6sXWFXIrxEeCIHHXXhRzJaoOZmTAqzSoMQWk0S/Wodo5a85vnjuknvz1xpRO6e
	3phIhas5wVCG/iiEV9QJXmDXn8kmK0YtPypdfl4auj7VoV4v3Yw0XXLCHFMaXA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: doc-guide: improve language
Date: Sun, 15 Nov 2026 22:04:23 +0100
Message-ID: <20261115210423.1089716-2-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: dda047f22aaeb684f0a
X-MBO-RS-META: cdo3g9kenkbd8xbexsfdai3qzo5tdi9e

There is no 'kernel process' thus change to 'kernel contribution process'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/doc-guide/contributing.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
index f8047e6331..0f0804f82d 100644
--- a/Documentation/doc-guide/contributing.rst
+++ b/Documentation/doc-guide/contributing.rst
@@ -14,10 +14,10 @@ it needs to be to support a project of this size and importance.
 
 This guide is for contributors who would like to improve that situation.
 Kernel documentation improvements can be made by developers at a variety of
-skill levels; they are a relatively easy way to learn the kernel process in
-general and find a place in the community.  The bulk of what follows is the
-documentation maintainer's list of tasks that most urgently need to be
-done.
+skill levels; they are a relatively easy way to learn the kernel contribution
+process in general and find a place in the community.  The bulk of what
+follows is the documentation maintainer's list of tasks that most urgently
+need to be done.
 
 The documentation TODO list
 ---------------------------
-- 
2.56.0

