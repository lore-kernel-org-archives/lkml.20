Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B33A1D05
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929018; cv=none; b=f9ckrOCNxoTSNTyqeENYt6Y++vWLEFGQG1iSKh2qKJFD8dGKLYAcfZmeRFoDyRUHTg61Oz41HzyeRgsdj+R4fC3nfz44rUzjwu2NQm2e67KPy8ZvVH3LeG2UMCErV0twie9F9poFpsR7e+96kjDxxDPt858D2KNVV8HGoaiM+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929018; c=relaxed/simple;
	bh=Y+uNAGMudvrHdDiBQoV2xsB/Mx+FpT5jpoxEEuAJklE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=M2FK5P0tGLheR2hq3qcl8kmmGnUsF6YzF3QT02sETNTTgkqdWiTEYhFaPQDUTsn8P6qV7YweQrv+d0JMqU6rWl437nl7y+yyDN7Z3c/TfNxzblSosqbVIG/K0oPxymNuMYpSAj2sV9nkF+w1LdrVEeZ8qxmc25N0zlsYHj4O90w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=FGp0CV6b; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="FGp0CV6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788929004; bh=9MwCPmGkuEpiLPrVTEPN6igquSgolWK4gPZRi2gHA3c=;
	h=From:To:Cc:Subject:Date;
	b=FGp0CV6bA/Z8W1S7tZ19ftstMoms6BUEhvFEvAIWfpdJeK9c8k3IF/NgnmdzJXjxe
	 T2IKLGH/WAa3c6QC33i8IBFNAuoCVdGMDduBYRdZ9xc7YaWazGp0Xb7sOujjwbvfid
	 hzacA1IuDGjKbqe4YpQRgY330yAbadGujc9NZr/U=
Received: from LAPTOP-7R15B00L ([183.220.99.26])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id AD63C618; Wed, 09 Sep 2026 12:43:22 +0800
X-QQ-mid: xmsmtpt1788929002tx23gpkp9
Message-ID: <tencent_81DAE01221B65767204B64FA5A31B3AF8407@qq.com>
X-QQ-XMAILINFO: NX3IH4pixvQAXpRH+GIz2YX6CgvNjkMdgLRn70t7AdtY26SFS6T7pgjhf2YxQY
	 BLBYkAPPBArUvelEcK3AE92VuoDkDXmRA3zRqiQ65sSV702peF8q3cO9WqlnAtcHKhsn0Z2QJ39y
	 jISkDDOwsoBhf2v3iVPdbIdtW+jLpGuNt4AsgjTX/Zu6Uh9IfjNPpnMNJDXy4lYbJH/AC+ANMZDM
	 0dfYvGaeLzu+sSgSmQiyt2ohYS3o7mGd2hH93KvdEightbjE85BYOasvTGb0h35bAaaK37KDTk1q
	 J3t5Mf89+tgxPCg9tpjwfHSaab2N/0dVVYOXRxKQl1n99UhYH8FBQhgwjIwYOnkzswfoznoM3jNr
	 /D/g7QvmX6tjUtHpSsLmziwxdyL9BNeg0E44e/O+lopuOQWcHZFADQbCJSRC2o64JpR4lByLiF7h
	 ZWkYF1Y8xUdGYajEn/T8AtDtUUmuztTFe2WKdv9R2UG5oAauk6NLz1GNrwPDjXtuCXfcTD56Cjih
	 YRkz7t16n9SBa7z4vgOgZdovXbdH9bUvgyag14jond+zZGWOShumMpBDMwJmF0uuzecIZNaKZNvw
	 4nIJ8P08inNNjQqX5fFgshzhvpQXUJLW1EKd00YfZzOuhJZ0CLu5uofRm1lY2RcutvVUG64tk+fO
	 7O6Om6msGagtFBPY8RKlv6YCGBwwt3w6OxXyTKRHJ5yd4DHI1bMsRISvKjmNr32z0D4VYYGluo6+
	 3RYxp8nwTXAzoobsoFb28/oaj0hiFhacAuu+SL1gCpGQoPm5r3Gz8O0uEwuGJUWDCb/2sFBILSDK
	 cP48ZbyERQZPjKdQBf46FOqRmax3kqxfSFNgj8idvlvmGIHkfdo1jh8OnUS2YKYrcltOqbyxnwZJ
	 tuy0sIq7w/JAaNPuAHQGUYUfxEc+0b6ssvk/5/qw6JvS+NzQ6oZtWcCJs29BGXrvOOvrayWBjrTb
	 b2jb5X3Hl5bz3Kmh2A+XJtWfRpVJ4do9owQOGsCIdsklukWSofZjWoJk1MVqzETPtFFF/sbHATrK
	 aaM8QAs4AIlihVz2wlS6eugg9LOPzy1bgp4LBnC32xzw+m1fZoWLXySFeYzf3Z0IcplvkU+uSPvE
	 QSn+n5f/T6AVvoa28=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: blaze <1466528493@qq.com>
To: chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org,
	blaze <1466528493@qq.com>
Subject: [PATCH] xtensa: time: Fix clk reference leak in calibrate_ccount()
Date: Wed,  9 Sep 2026 12:43:14 +0800
X-OQ-MSGID: <20260909044315.1700-1-1466528493@qq.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In calibrate_ccount(), of_clk_get() acquires a reference to the CPU clock,
but clk_put() is never called to release it. The clock reference is used
only to read the frequency via clk_get_rate(), then the function returns
immediately, leaking the reference.

Fix this by calling clk_put(clk) before returning.

Fixes: a1f31a21e0c1 ("xtensa: add clocksource")
Signed-off-by: blaze <1466528493@qq.com>
---
 arch/xtensa/kernel/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/kernel/time.c b/arch/xtensa/kernel/time.c
index 0000000..1111111 100644
--- a/arch/xtensa/kernel/time.c
+++ b/arch/xtensa/kernel/time.c
@@ -152,6 +152,7 @@ static void __init calibrate_ccount(void)
 		if (!IS_ERR(clk)) {
 			ccount_freq = clk_get_rate(clk);
+			clk_put(clk);
 			return;
 		} else {
 			pr_warn("%s: CPU input clock not found\n",
--
2.43.0

