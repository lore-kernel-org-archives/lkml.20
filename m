Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF43AE187
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016922; cv=none; b=dGs9tzTqG33nFShjLMcmR03MHUBG2kuSF6faAhU15v+VR36b8iGYzuMxTsYZbAwBkScRes2MA3d8vFnCmksL1TOwZeN7SgBPNlV7kTpau4iiVvf16dDEWhV5hupsLn4MkdRpN46qgqp4fU1MUlb+ZxF03lbf9YfAwnZ3UdJWivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016922; c=relaxed/simple;
	bh=MGfk8TVEGy5E6+9EKw3N4vwae0gchAGBQGSGEW/MjvQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=KjZe6x3b2BJC/MgFZJPOt9Jz5XasYWWCj2nqOooBjp8N9A+eSsNtlgjixDVijkr+KlIGwOxmL+7hdy+/dWhLjBY/vqZaOP4y/ponXOcu8SE0RSpPrM/hWL6H7pl7LrIHB2uA1LvwyHoTNhrGjKPwnEL1Miu/cS1XCAcogOUqmIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=y3lJ2i3t; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="y3lJ2i3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789016909; bh=lnqEl4hZjoy9+qvvykRevxH1sXEuzZNl5oWAovQqQPs=;
	h=From:To:Cc:Subject:Date;
	b=y3lJ2i3thu2Y29XTfkVJTxjp7nVRuNnBKoKw2MHXtyoop0sjOA51fDWm5I6uolVQC
	 WSJlWvsZSMi6juPyrhwbMgYkf8tvfhw8Zl8tkMQct2bYdN7dRm8BnvNdri3kdsxk/J
	 MHERV3Z13/omx9dYrq1CTFb0AcOlCPahUqCqOKDA=
Received: from LAPTOP-7R15B00L ([2001:250:2003:5f9e:3dc0:f915:b3f3:169f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 1D106A47; Thu, 10 Sep 2026 13:07:17 +0800
X-QQ-mid: xmsmtpt1789016837t5yspe8zd
Message-ID: <tencent_7AF43562265F45B58A25576CAFCE66967708@qq.com>
X-QQ-XMAILINFO: NvKPbWBbh1DVRLI14bsufCF9z91AEAVxUu9fozi+es6HYm5QDn7IHToUuLW/zY
	 PhvAAWMCMlNEoE9tFpwIYkG7srZ0jnkDlm0PQCCxI8nhPWvfcvHQtocrwJlI8yTUfUy4b2z41Hlu
	 NKBoVbIK2zcHreOqfosFxJn9HT+nmoIB4wUjF7HzjG0wDMqTRBR+g1jei2rlz3tgP6MDWiNwaUKF
	 aVC+3jGH8sZxzSs3m7+DLoj26zGmF9S5Ekauh+FZxApglivXnk7ZpnNt3egItmIQ23XW20e7C6gc
	 0GSxH6pHzFEcfSq8sKibhFMYvWGWWgTPzGyRBBep9z5BYV+6a1UxJj5/FxsmU+8sT3pTniqHIz0k
	 WSLAfzjlidQHJ5Xd4AxCDILUuh7oHBEOAYXSrk+hqj/9xDPBFXNNje/m81QTqY69tozKJzwHiZCk
	 3Ee6lmeeCrkRTDRPsBNYwmVrTD6i27m8+3XSvS6Bh1f6S/23H3e3C1qyB2gUj9LM9Olb7W+bqmS+
	 rtPGzwzAkxXMsdDRsMbAJog2QIYC+rtSkMi8KSjetV25ioYlmnOChWyErfkD/tihAWMyVsBBwAnB
	 SE+CZjYZYOtQ0/KJ7dquM7oWQBEADBcE+AcOCmnP/+lS0PqJl6GzihJcYiPc5fWyuYAgF04dHxaA
	 lAhUYySCRQKRXsIFQy/DTl1cyLRDN8Ke0UwKXzWuMYyyujODJEhYKYsXfqOsBjqNnf2xh9erGMHl
	 UYmgudEPn2spGGUWu2Ns90CdTz9k+Wj6lzravYWBBLq5k6I/AEJZA8YU3PJrNvcYlHLfm2yBngG7
	 HBH2MZ/TL8kGGRriPKBLmAk5tWbAxfFdRZfQUSlnRZgyL4C142LdLagzWvTWHPdt8/ODvNOuyPuB
	 JMjUzYTUjGmQF8tEZczK5t3N+XRE1bWhGg3iXyaTCI7x8S7HOdM0Z3A/J4G60nvZ+ollilymDZu2
	 R2pus10zTkU0qCNrCbyyhYfxR6ZKkLPiIkLDvJvc8Gbi3pxrPDF5L4XI4gjmoXKbOjNp7fmetgwH
	 S5wiPrH7SlR56xpFLzFylLeLq4d0au7+ZI3CeVSfahXz3vUvNv9H5sBqieMO0kTMXG0Gdd7vaq3z
	 8onAYf0B9Q1wDKjB3fa7CHcpWeZg==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: blaze <1466528493@qq.com>
To: jcmvbkbc@gmail.com,
	chris@zankel.net
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E8=B5=B5=E5=AE=87?= <1466528493@qq.com>
Subject: [PATCH] xtensa: time: Fix clk reference leak in calibrate_ccount()
Date: Thu, 10 Sep 2026 13:07:07 +0800
X-OQ-MSGID: <20260910050707.1406-1-1466528493@qq.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 赵宇 <1466528493@qq.com>

In calibrate_ccount(), of_clk_get() acquires a reference to the CPU
clock, but clk_put() is never called to release it. The clock
reference is used only to read the frequency via clk_get_rate(),
then the function returns immediately, leaking the reference.

Fix this by calling clk_put(clk) before returning.

Signed-off-by: 赵宇 <1466528493@qq.com>
---
 arch/xtensa/kernel/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/kernel/time.c b/arch/xtensa/kernel/time.c
index 09fda6a..bccc0e9 100644
--- a/arch/xtensa/kernel/time.c
+++ b/arch/xtensa/kernel/time.c
@@ -152,6 +152,7 @@ static void __init calibrate_ccount(void)
 		of_node_put(cpu);
 		if (!IS_ERR(clk)) {
 			ccount_freq = clk_get_rate(clk);
+			clk_put(clk);
 			return;
 		} else {
 			pr_warn("%s: CPU input clock not found\n",
-- 
2.53.0.windows.1

