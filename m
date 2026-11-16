Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817381;
	b=RVZTp0uXOex9JEcn3Uea5pDQPETX35hsHwCitN4luK73oHh42tQuFQhsavrmT4MyeREi
	 2mlqTFzqibv2fLnRa7NLXCyU3zPrZzbrvVNBkkAEFA2pUWf1KgbwZ3oOIMkHV+0Rz0Q5F
	 CsJPTr/gAayWalDB/7k6jt0zBNhCFRcSo5VkHhfAgklUeIqfd+ZpQG6I9xC6CdLXyyuuY
	 SdWXvDuKwbeEcZUEeUhZZiLC0F6F866+xTpM8nIMakbjZJAm6JLcmlZnA4o6T+EEUYA/7
	 JbuW5YahJQyUcqckO0f0c7NG7BjLQYLHK84/hdPX4boqL5gR7XcmChpzvddj3Zx91fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817381;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=elrgTYMgb7CkcrA8oXLm4zhtrvaVqPh3MMgk1ZPJeJ4=;
	b=kplI2jIw7y/WFhFwdRzPglTVzi7ltN9YMvRYFtQbM3Y0u/fnxUEgK4hGYurW2ciFhqZF
	 EnemYxt6QspQWKXnYdWTmabCxWasTgjLLl4dojrffDkArlwRn1lJy6BTArSitOMKp/NcO
	 hknxvfOHuPWHV+wXDYCgYNLMcY+s/G+e32dLS+Vz2LuD5jiSgJS160X2VFpYar3/Yc1Cy
	 NyeN0ZIRssi+4cjGvBLgvL8b8zGZCWhpeKxfZq7feAQiA+v3Qu4ZYaXwBcCs5iW/H+P4F
	 e8bldA0PLdBcvBmH3xV+tUozf8dzWvAH18EpvpZaYdbCEWg0Cm70q9P9JiO3/J8mZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=T+rCesQ0;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FD606A32C;
	Mon, 16 Nov 2026 08:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=T+rCesQ0
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jSgpg1jb8z8sWd;
	Mon, 16 Nov 2026 09:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794817371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=elrgTYMgb7CkcrA8oXLm4zhtrvaVqPh3MMgk1ZPJeJ4=;
	b=T+rCesQ0VeQZEZ2+n68wWgThUeq4Xjkm3e/9ixLn4WUO/lwlq3vmfFNXushKWZF8EGjmsd
	icCgR0j7YSSLkbrSt5w/1DgKhUGdPIwtcwi/JZ0G/JcDuq7a9HXISaO1q0GxJbBox1izKV
	o1NZ8OJz1n6fqhyOlwOWjWyStIuoRZ1jSfgHSj0rtV7rJj+IyZ0cCFnGs/qdpzYUoRp1Yj
	jyMNJ1B6KSoZl/eyho4Z52wZAPjpOKuxk340XD3uLjFspM1pZ1MJJaX7ek9g1QfiTJglz+
	/whhXt5j7x4xof6xgvbR6SUsGzx8EXG500iXQStrsDWOiXkjtM4EuZDz5J5cBw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: doc-guide: add hint to review patch
Date: Mon, 16 Nov 2026 09:22:09 +0100
Message-ID: <20261116082209.1100175-2-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: 63dd15cd46057b048a0
X-MBO-RS-META: 6j88goxqwg6mr1we5bjdjwbi3ss7s5gy

For the case of a duplicate patch, review the other patch instead of
sending own patch.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/doc-guide/contributing.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
index 46a44b39d6..ee2f896a21 100644
--- a/Documentation/doc-guide/contributing.rst
+++ b/Documentation/doc-guide/contributing.rst
@@ -129,7 +129,9 @@ looked like this::
 The entire process only took a few minutes.  Of course, I then found that
 somebody else had fixed it in a separate tree, highlighting another lesson:
 always check linux-next to see if a problem has been fixed before you dig
-into it.
+into it.  If the other patch isn't applied yet it's good to give it a
+'Reviewed-by:' tag to help it get applied.  This way your effort is not in
+vain.
 
 Other fixes will take longer, especially those relating to structure
 members or function parameters that lack documentation.  In such cases, it
-- 
2.56.0

