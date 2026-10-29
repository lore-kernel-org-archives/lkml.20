Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297382;
	b=pVQ0gNCDukCbbH0fWfgBLMJ1FGO46/JGhhvgWHtRHUQXqYvP2kZl8owM/2w15ywYBMBl
	 WBWkoSKzNgsT3o84joMPn+1oT4m3ISL8g0fq1lb4pPY0Yn0ksLSwGyZBG12bNwYyODeVs
	 uVXdjhwHTdk2vkFX/L+AfnnFXEJQOSBt6AlRrjbF3o7N9ySaPJvvDrfnaciotpr0Es+/d
	 sUHU1cm0HyW/Y2V2QZz8f1/vtF64zkgEHqU3otGrtzy2N+jYLf0kRD9XNflmsWPYiL3hU
	 CEp7n6fdTVnsfApAwmXxTK6xg1GepcpkuWSen6ZE9bHm2MZCpXx8KOTr3S7AJpNzWRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297382;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=YkgqtOmgm5pSQNfcr107oNijONylJ41PgACdSs5lpcc=;
	b=K/bckqXPsUyyQHzNYceVGQ9NKxUJhehauYSyzAz+k6DKE41JpsVbg1T4NIDNxV1X0WU1
	 p0wHoXPxcILB97RVfyGzTCCSZFvb15nQPaErafFG0s1DeJLOsKMPLjFbJlUbkedbUeu6J
	 CItxGGejiVJCK9hoopgiA4J+2asxNGqo6pUvKLU7P+r3BaQDJivSFIN8TL1tlb6a0ugpL
	 W/tmQYgSHEPPhIiR3nkhlgQOfwLribUQTXgk9cSsj2U0Q+7wp+U8T2aB1jwiUaUI1U0Gl
	 SF9HOAKOk4tfaiBsf5XeZSOwQD03fVXr2Q+cU6kGJesnh2dtsQYTP9LI92cW6YTIwNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=jLnl0iOA;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57C606A31A;
	Thu, 29 Oct 2026 18:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC57C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=jLnl0iOA
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jFsh15bW5zKnCX;
	Thu, 29 Oct 2026 19:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793297377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YkgqtOmgm5pSQNfcr107oNijONylJ41PgACdSs5lpcc=;
	b=jLnl0iOAii4gHQvNbF3QTWNEVWm7TRgF0l+5Q8UALQFJisx4FvosgTD7ZqH+DTY/PqQpd2
	SNo9bF9DXHDtRtBRr4yvqpYoBZWPmbTWx9fWGyfHHAvihg1VO1SP8TBspWhnB7IcrEDKoD
	bn246nwyHwxZM821ESvslhR0yiOkxQmZNZQGZuILqEo62r8LWI74zakk8gVF2cD1pEYFX4
	d13Sfm2M1P0713vOt5nrqR9Uw3+6IGykqQ0n2NVV6Z2cFpak83EOntdSKPnKQiTDU2Sg18
	p3qw1TsxgzoVSSZRQT1QgtRcZEL8NG+OpFHcdE2YYYlRPFxh6/b/2hJPvmtJvA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: changes.rst: Remove obsolete link
Date: Thu, 29 Oct 2026 19:09:00 +0100
Message-ID: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.55.0
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
X-MBO-RS-ID: a7055f8b7c7f39ad845
X-MBO-RS-META: g85oo3py6aedpcemgz7gxnajpnng9wx4

OProfile has been discontinued as of commit 24880bef417f ("oprofile-removal")

Suggested-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
@Bhaskar: Let me know if you want to do this patch yourself, then I'll drop it.
---
 Documentation/process/changes.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 28f2ca633..cc9a16543 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -564,11 +564,6 @@ Ip-route2
 
 - <https://www.kernel.org/pub/linux/utils/net/iproute2/>
 
-OProfile
---------
-
-- <https://oprofile.sf.net/download/>
-
 Kernel documentation
 ********************
 
-- 
2.55.0

