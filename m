Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6253E763E;
	Sun, 27 Sep 2026 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509296; cv=none; b=KRhbtTVcN38qwvI8k5fFIro0JH3DOl1dcm2PAq9Ibbl1gVKRQKaI7ymet/gk/Ffm6Ur70+mpJl2E2U/5WDL0pEgtl/1EokR1jZioysuUR4dlhO3GR8bjfRrDAkroAGGCxzBllh566A4DxPmSOWG2OjvM5u9dtONDbFT+Gy7WS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509296; c=relaxed/simple;
	bh=WJNNnhw9SuOyDD7KBWJGiFYtMqM0pzOrzncQjG5c4MQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joub6Pq27eoSgrSfJrleHSZQWBGyudP7zXkKzDXSIANbj51wm8XPNv+LOOuabirz62lzWglkQ6ZbJwAxTLuB4ucNzQDM/j+X/VPmC8l99pQ27IAi4TQ7iXjwzEiUJy+RAcbHVMW5zV2ejhiTv/M0xHtBjSM8lZwQJFOYJUBJkl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=W0h71WfZ; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="W0h71WfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509219;
	bh=TLRLqjW1x8YTY/0T2XY9umcE5tW8ef7Jls03MhaHegg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=W0h71WfZZP0yYYNQMPuE67yMbNhDdOjzkMVSKbA3Tx2OdVwRZASdvJAjdyh+Nwdy9
	 bXWimKMC8XR+TVYHkJHAIGFffo2hSHGDa3hyknBMgy2p2Nob+oS2i6Rb+aTdWIaZQT
	 t6wtdKWrSlfwunnPiLm1S9I4+r47AeFt580OR6Do=
X-QQ-mid: esmtpgz12t1790509213ta39046d4
X-QQ-Originating-IP: 9hALGiLvHSuvbVXipsKriok703XlNQG1hITgQW7rk5s=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8910793222094051143
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:04 +0800
Subject: [PATCH v3 2/8] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-2-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=2369;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=WJNNnhw9SuOyDD7KBWJGiFYtMqM0pzOrzncQjG5c4MQ=;
 b=O92PxZDVCZ1CDvpckysjDnLMdoWeHS+9gv7qZm9VSc8AUUqMsojaeWKyx2GKvtu6aR+NKyWxL
 FqFeNOVNAr5CUYlsca5uUUyZtYjdCLQGNljtrcPOQqfRg16FloLoEnW
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MlGdF4rLL5pYaw/yb96KBC8qfbPO+mscC0MqA8/s5sKyTki3/min2pqr
	KbkXr3hC7Z1nlFeaUR3mlTa6iBLej8xWZpeRmfRS3kvtjxdki51z/btQxGsgdgKX0AufD48
	X+AYZ8wIJ1HRPCtSKOQ+DTCYtRacnsvwkpsQM+RoPaOFGjpWp4ncyeoyplPFaq1CePtKCjD
	s1oB16zHldQe0n+f2gzOt8LqQN/kInzyurX3fZ2/YxOw2W1WAzOeswAIfSimHsunK14G9Y+
	znnR8tD8j244heaKDpzqzE/v+18cYOec/HAPTmSP+IfUzXk5UUmh3IJ1MKHeMEhibhGq0lw
	4FF1+gwwxw0QAoVj5OsN8b4OhANpnpbQ7y7ZO0ZelVG+LkXpBpvLrUpY02M9pkvz4b5rVf5
	GKI4OxJy1CCAV/C901BlT3MaIJiTTAlyJP9BDqgSX6ITeFDhUPB+RpRMHQ/5j94tg9IgWYo
	1+TB6ur3HxisrUj10Y2XPCcBj2Rkb5DZGTSIhk0g/LjZJn++rClVx2Pp7of2NNNd9TJsHDQ
	b726KfWdw3HIIBd1dE2J+Mzw/WYhlCdr1ZPE7Jum0PrzDJz8Fu9ncc16Ms8veIOV9W8q/TZ
	UJ9i+oA9MffjlUyvOYvij2SWdQ7C1+fQ5vKwg3zUmZZ6Q9qRccJb9zV68PooP0RleuuM3Zp
	vw3GB1CIUSLDQuxbfhdLPkRiK9T1qaOqKagBlPSZfc8eE8AvAmEL6rJ1BO69RzZmTCKG3xt
	R0mAYwNCQNImwo0EKfBgSJAOFzzjwsD48ItLidtCPSgRLtR5q7WXrrYtOdaC9liBJYSW+P/
	jzZL6OwF18AVVMQyN1/XYUFwauMkLZTGQy9RP9N3iJJVnjcHzMyYNdLr17T7+PhL1uzefED
	6WblJUjzdH7fWm5OIyP6n303PiOD+021s/zuA4fXIluxDn5Q+dRNG7DRL5aIj8+s1ltbzZJ
	qpM3mv6kweGkaij6N1EKpppskIK0pbYXhDW0SOkG23Q9yy59W9pxZZoUF4L4/oPU34NQW5i
	dLxFa5gVNqzBb0aKZYoPe6uLGWMFTckfgSCLK5G5dSpjkn1l4t8rvzAC99g+CDA0RDoM5zo
	AN2ncprqRWd+wwEVhBilArZ4ke+rsBMBp3f+5xvbEzGBTvzUal4L1rxrvyUXvOzGIdB9O4t
	YLm8PtXbjReoXmo=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Convert devm_clk_get_optional() and clk_prepare_enable() into a single
call devm_clk_get_optional_enabled().

Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 8ffa1e95d8e8..9cef902f36b3 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -20,7 +20,6 @@
 
 struct ci_hdrc_usb2_priv {
 	struct platform_device	*ci_pdev;
-	struct clk		*clk;
 };
 
 static const struct ci_hdrc_platform_data ci_default_pdata = {
@@ -52,6 +51,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_usb2_priv *priv;
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
+	struct clk *clk;
 	int ret;
 
 	if (!ci_pdata) {
@@ -70,15 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable the clock: %d\n", ret);
-		return ret;
-	}
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get or enable the clock\n");
 
 	ci_pdata->name = dev_name(dev);
 
@@ -90,7 +85,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"failed to register ci_hdrc platform device: %d\n",
 				ret);
-		goto clk_err;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, priv);
@@ -99,10 +94,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	return 0;
-
-clk_err:
-	clk_disable_unprepare(priv->clk);
-	return ret;
 }
 
 static void ci_hdrc_usb2_remove(struct platform_device *pdev)
@@ -111,7 +102,6 @@ static void ci_hdrc_usb2_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	ci_hdrc_remove_device(priv->ci_pdev);
-	clk_disable_unprepare(priv->clk);
 }
 
 static struct platform_driver ci_hdrc_usb2_driver = {

-- 
2.34.1

