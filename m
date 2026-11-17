Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919194;
	b=vVHkL6VVXtdwu7OWH/uFMpvi0TLsBLr10Jns1j9Ng/mp6W+spvRu1xmdYnfbKgpDJSm6
	 nl7dXeS2AXwTRoaxFwFyppRlVKWDQ7G91ON4vEEharuwt44IDr3RbcDc1xo66Lt1VKeIY
	 K64XIv0u0KtSuFIl8q4+muVurEAB1rddtvaIyrO0GgqR7eaYQVDZp8VVy2ya4VPkjyKCx
	 nFQNjL2I89Msksm/pxjSZranirSVwWZSSMQJzRYOt03CKc4uHMPtczVIBWc/4QGPR1Gep
	 625qkLriOlOmh0HBrPDV+RIc2lKeq8aCPHDAer/Vz2bV8oL/yPzUxvG8K6Sjamyv25g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919194;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=SlFR0PDsgHPx89VCrn9+DZvoy2M4e3AZJnHn/i2DBPE=;
	b=Qwh8vpsnqkNo0xDs4ZyMV9AxxzqcPns+bw/AfZpYlGmuwUyDMoBSw/UWL9y8OwNyGkdX
	 V/AVRxOzptYhh+gKfJGto+dYjn0KsvEeZdygqmopu0IuLCNDMG3mEw5LxfKNzvUM5jm1H
	 ZInGGgz7wPQX/AxolMl3H2y9DWdvjOL18KYEB05qNo4k8zAuHhApPmrB0avVxwD5wME6I
	 ajOM+LZAs9Vy5BSYzy4mXRKC4Or6UnGXD0g+RTGxlCk7ZRAlDrmwz9FeAIk/oDQPme4sg
	 KvbdPxlNyE15qaaBcRB+J8gsLe4jGa3sxuYQQgESasfkXYjcEquUQelYFn6Xtg2O94g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WDJji3XJ;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED46606A8AD;
	Tue, 17 Nov 2026 12:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED46606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WDJji3XJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919146;
	bh=SlFR0PDsgHPx89VCrn9+DZvoy2M4e3AZJnHn/i2DBPE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WDJji3XJj/b+QM2r7dKpdv8EC9RMgFvchgqtajhLhJucW+dbbaqyO98wD6ggUiYy6
	 sJ0G9Vh0hseCXT1ICHCzFMQ32foitqcwzeDr78kdC+wmBxvV6M9qIZ85l6aD0iCYvW
	 58q+/DUNrHySyDQSuQ7EqFFEtaJ70SRQJx4/NokU=
X-QQ-mid: zesmtpsz6t1794919140t820d0e19
X-QQ-Originating-IP: MmFmgRDGf5eTd/NHT7qz9+Uttn+iIAYHdtoJBV7JuZg=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:38:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3418822003545151366
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:45 +0800
Subject: [PATCH v5 3/9] usb: chipidea: usb2: drop the ci_hdrc_usb2_priv
 wrapper struct
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-3-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=2825;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=rIIJYXK7bYXmfluAtkAhdq7IU0LZ91JsHGnnEZIYuwg=;
 b=DAlqmEnlRaCE6X1+vVWproY3T3PZxS7QiHz1s4aEzTa/KODntU6WisYjyuSzjbTY6ugB7Caan
 wzPphS5ppvxDtsCaH7akhoe51TsXvdYggLuUGHm4aBT6V4RuK4QuzEK
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: ONv1NUxqI77I30PpJWZXx4ZCNYh0OMOWwKFWnagp6HqOx2r4nYjyVvWR
	rfYcNL1NrtRnOf1HVn9fB8mUZPZyQUeMT/VTmSRVVc7o8bMBtjfuq63j/+01zmqke1c082v
	lqrcLjfL4QC13C+m3uStnnTmjsCGAXHxFYHU2c9VjSLNgvPFnpLYiRpnLZPMUFPCWgo7xf8
	AAJPf3kYy31ipvgh40JdWeGt2S/wqwjqws1+JI79kVRpmXBUTlvFGaYMI7zbxlS4eJaI4AF
	cGACfRVl8hGINMLi6dFvIqTB1sQfWTQ1yPUSz3/Jip+xSzoZQGxnpo7ZKYYYKe9a5GQUuf3
	45HDZCqm/Edf4A1tVjFXGuiZ6KjQ3IwuXB6Ft7E3Siwh/p2+rQW0JbGoszw7cch4XZ92q8T
	KHA3Rspk+62vNbsJQYWSQNWAjzoLemDvc2PQl1AqPe4T7Ewi9iD1C56gAwu/JPsAeZLrL+r
	5NwA0v3/rnPY8dzYvEu1yHGE9imv33E7XLWBkgYkfsuWaL+7pwt5eZS4BkWJe4DHs/YInA+
	h3kzA/nrnDCcjsUuObm0k4GCaJGbQ9xE7Hfx1dp9ijIwh0FXwFPRUJDr5u3f4be9k+to9Yx
	HebfeEqEk7XrqOvGW4Js5sGnUd2ek5YD3UhdQjkvEoFlRKH8rKx8dhThqPueioGpym8CK9m
	MYErfFb/04YL6XRzN5bcKBUMXVpF3Qv3rDBxhfkZejV7/zgwj06iWG49nZdyvTKaQNybs2F
	/QhLnEHBvtEoY9XvZistqFhOkRlky6NqnkhIzfpu6YP5/x9jD90DV8JE/WYcuE7EVlOikhE
	tlmx0f2AG31hMHAQs6A3jgV8jX6Jl4O9sE1W7CrsRHcQnjqNXCL4oNt1O4ygnrtzzZTpDps
	XU6tjvJ6uUFf/kji2311E+b542mAJg7kpctpGGLzE5kcgr4sMrIbJJRP6156lPHJNYJ9hLt
	vlUPA8g1pUAoQu+No7V++/NA/PUYRmnDLuX+WaVrmznVOFxxAk2FhCjbi1/Eu7JApmxiuir
	MXIQYeYKX/C1BFuLtV0v7Th3jdLdPPe8iMOEKB/nT/9+4HSIzaNQgvE/pJC5CDNM/DNPuvj
	syLpo+GHVt4E3VmxVYVrhSzBoQUWCN8a9zVUH4C3pFXvwYzdXFp9C19SxYftu+K+mFlLRYE
	j0ui
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

With the clock no longer stored in ci_hdrc_usb2_priv, the structure only
wraps the ci_hdrc platform device pointer. Store that pointer directly in
the driver data and drop the wrapper structure.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 9cef902f36b3..a353281e4e37 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -18,10 +18,6 @@
 
 #include "ci.h"
 
-struct ci_hdrc_usb2_priv {
-	struct platform_device	*ci_pdev;
-};
-
 static const struct ci_hdrc_platform_data ci_default_pdata = {
 	.capoffset	= DEF_CAPOFFSET,
 	.flags		= CI_HDRC_DISABLE_STREAMING,
@@ -48,7 +44,7 @@ MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
 static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct ci_hdrc_usb2_priv *priv;
+	struct platform_device *ci_pdev;
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
 	struct clk *clk;
@@ -66,10 +62,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		/* struct copy */
 		*ci_pdata = *data;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
 	clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk),
@@ -77,10 +69,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 
 	ci_pdata->name = dev_name(dev);
 
-	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,
-					   pdev->num_resources, ci_pdata);
-	if (IS_ERR(priv->ci_pdev)) {
-		ret = PTR_ERR(priv->ci_pdev);
+	ci_pdev = ci_hdrc_add_device(dev, pdev->resource,
+				     pdev->num_resources, ci_pdata);
+	if (IS_ERR(ci_pdev)) {
+		ret = PTR_ERR(ci_pdev);
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev,
 				"failed to register ci_hdrc platform device: %d\n",
@@ -88,7 +80,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, priv);
+	platform_set_drvdata(pdev, ci_pdev);
 
 	pm_runtime_no_callbacks(dev);
 	pm_runtime_enable(dev);
@@ -98,10 +90,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 
 static void ci_hdrc_usb2_remove(struct platform_device *pdev)
 {
-	struct ci_hdrc_usb2_priv *priv = platform_get_drvdata(pdev);
+	struct platform_device *ci_pdev = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	ci_hdrc_remove_device(priv->ci_pdev);
+	ci_hdrc_remove_device(ci_pdev);
 }
 
 static struct platform_driver ci_hdrc_usb2_driver = {

-- 
2.34.1

