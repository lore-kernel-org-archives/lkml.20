Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9266B30C165
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908225; cv=none; b=tNHjzppbAp/1F1Gaks60Id9pKfR8WfvjFqdSMdDC3avZPso3uYLd2QlRjnffuCkLPGVHW4XhNs2DDvQoTQJ2rytlwr/iLeauipn3xJkU9uIGZcXxOtrqm2DFny9n5dG0M/I1YYdUjNAcAD2NID8rSMBWq78mx2dcl+CiCorXF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908225; c=relaxed/simple;
	bh=TGye9BNRMmPRjFF0yh3L7WJ5NnA4VLs2g9AOW3fP59k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=irsQeqAaSN9X2uMPRc495/ueex+Ob5SIBWXKQs29+3Q0DBCzJPOkOm3e1KY7ds//sJwKz56P+E1GfOINZZd7W5Z1m0/l1mMTHjmK93+cV9uPCw3+4ZdFXGEpYwkrpoRivbyG90e4S/EYkCPaXYLCcjaVLw5LK4u9dwXwNiygN+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cfr+XFCs; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cfr+XFCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VR
	3ZFpyqcQYdCGFkZ481QZ96cuSg23NQ/ZptelgogTo=; b=cfr+XFCswZYaDC6GlF
	m+C13hE54FdJtsNGGigHwhXRHrPbEfk7qicEnLqE4arO34bt2pth3pGoRGAKN6dP
	IJjmgfnH2tM0Znea1k/MVBygIYHJ0S9jUa/tgkS6Uxh7lhN/lt7epPUKj6tMCrvr
	K9uEqs2wtYwYimenYen087LV0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXnPpoUJFqE7YpPg--.52789S2;
	Fri, 28 Aug 2026 17:10:00 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] clocksource: fsl-ftm: fix clock leak on __ftm_clk_init() error
Date: Fri, 28 Aug 2026 17:09:59 +0800
Message-Id: <20260828090959.536669-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBXnPpoUJFqE7YpPg--.52789S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWDKF4fAr1kurW7XF4kXrb_yoW8Kry3pr
	4fKrs5t3y8W3yDKF1agF4DZr1Sqw4Ikay3G39xGas7ArsxArWUJF48Jry0vF4Ykry8J3y3
	tFW7JFykCF1UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UKLvNUUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC+Qkt22qRUGmI+wAA33

From: Li Youhong <liyouhong@kylinos.cn>

__ftm_clk_init() enables the counter clock first, then gets and enables
the FTM clock.  If getting or enabling the second clock fails, the first
clock is left prepared/enabled and its clk reference is leaked.

Also, a failed clk_prepare_enable() on the FTM clock only logged an
error and still returned clk_get_rate() as success.

Roll back the counter clock (and put both clk references) on failure,
and propagate the enable error.

Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/clocksource/timer-fsl-ftm.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/clocksource/timer-fsl-ftm.c b/drivers/clocksource/timer-fsl-ftm.c
index 4eed6cb46132..a344da771299 100644
--- a/drivers/clocksource/timer-fsl-ftm.c
+++ b/drivers/clocksource/timer-fsl-ftm.c
@@ -230,32 +230,43 @@ static int __init ftm_clocksource_init(unsigned long freq)
 static int __init __ftm_clk_init(struct device_node *np, char *cnt_name,
 				 char *ftm_name)
 {
-	struct clk *clk;
+	struct clk *clk, *cnt_clk;
 	int err;
 
-	clk = of_clk_get_by_name(np, cnt_name);
-	if (IS_ERR(clk)) {
-		pr_err("ftm: Cannot get \"%s\": %ld\n", cnt_name, PTR_ERR(clk));
-		return PTR_ERR(clk);
+	cnt_clk = of_clk_get_by_name(np, cnt_name);
+	if (IS_ERR(cnt_clk)) {
+		pr_err("ftm: Cannot get \"%s\": %ld\n", cnt_name, PTR_ERR(cnt_clk));
+		return PTR_ERR(cnt_clk);
 	}
-	err = clk_prepare_enable(clk);
+	err = clk_prepare_enable(cnt_clk);
 	if (err) {
 		pr_err("ftm: clock failed to prepare+enable \"%s\": %d\n",
 			cnt_name, err);
-		return err;
+		goto err_cnt_clk_put;
 	}
 
 	clk = of_clk_get_by_name(np, ftm_name);
 	if (IS_ERR(clk)) {
 		pr_err("ftm: Cannot get \"%s\": %ld\n", ftm_name, PTR_ERR(clk));
-		return PTR_ERR(clk);
+		err = PTR_ERR(clk);
+		goto err_cnt_clk_disable;
 	}
 	err = clk_prepare_enable(clk);
-	if (err)
+	if (err) {
 		pr_err("ftm: clock failed to prepare+enable \"%s\": %d\n",
 			ftm_name, err);
+		goto err_clk_put;
+	}
 
 	return clk_get_rate(clk);
+
+err_clk_put:
+	clk_put(clk);
+err_cnt_clk_disable:
+	clk_disable_unprepare(cnt_clk);
+err_cnt_clk_put:
+	clk_put(cnt_clk);
+	return err;
 }
 
 static unsigned long __init ftm_clk_init(struct device_node *np)
-- 
2.25.1

