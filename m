Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E4521219;
	Tue,  8 Sep 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860996; cv=none; b=IakVmuAmTLLBkQHV6HW5aWvmrds/loHDVRBxIMhONxI2hB44muiiA6uesqJq6J4aYrImsfba0EOpYn22XTkZwvKX/MWGET+pm2UgVSjYW92oPj1bfquuGELnzWooF6Sc68ULw1Dqz6IgHnOzLw0bI/9npqRl4VALrNIXlbTGdoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860996; c=relaxed/simple;
	bh=PvTzSAJtdhP5YWAJI+q4Qp67FYlvmKZcWQpkL2xA6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzAPK7+sWoz8HsO54VURuORc7CE13vXygYgwlDoB2nCsB75vTlH7idPigWjimzrIRRKmitjU7RSrlh4sCPLuang6BfYUfCrIehbRtsW3r4wsMUEcc7AG6ytbFjzDHTbJ3wdAlYcO266N9njL8Z/t2LYQRtXocNxtYP3luDFe+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Sw12djTR; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Sw12djTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860940;
	bh=Tch98AaAJ3XDgB8l+3SEtB7NiM65GaJZiyHJoGmMGV0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Sw12djTRdeYXdjUBooDIN+a/HwTuBIx71xIJLVJbMiGcgE3IVidvr8grnFMAKHk2n
	 uzrR/od/lPKcu8ppENkaJGeJEzNQMf3nWRrhVYYVDs/Q01mupFSDWQCC3J5yRsoHO3
	 YkGbF5i6WcgObbsrim/3pWlXtIlKcN7XiuzC79l0=
X-QQ-mid: zesmtpgz5t1788860933t90cc2e67
X-QQ-Originating-IP: WeHJkMxHX54qHHcT6BGmd8cFdVdKNJ/DItu3dCS1eYA=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7592890586165417823
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:40 +0800
Subject: [PATCH v2 3/9] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-3-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1590;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=PvTzSAJtdhP5YWAJI+q4Qp67FYlvmKZcWQpkL2xA6W4=;
 b=+N3402sTZp04lcIhJ+Y9LqUCZmIsy+KGlqS85LQvk0DqETGZBCp/WY19ypSBzth7rAW0tZdja
 hvPeNsscK3BCoFzVvdm8rvLPlmTTO18kOjwBVQNi1akxsh2n2GlFone
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MOSESSKbYHU3pTxmSjTOzfLVkeq9SphcxWxMu8PEDsFGhxX7HDjN5h6k
	gaLe9awR+ehzDDwHudI5d4x1XoswkK8Iamx3n9KRvkZPIrrg8hja3DaSW7jXCwaT1aTYiIG
	cIPO2yPqH/f4uIURaqwfKYcGoDG+Nnb3jaEPJGC5WMpr+QOlglzb+n2iMKy0rXwoV0ONpeJ
	F5LrV1LAwecNgLPDLR1mYJM/fIVuY11RR5qw1l0Kzs4oKBRjdfk3kSa+2QfAMwMhP9W7kWJ
	qYH8g/pshnv4b/5U73jbn8rr3JLqutuLLmFwNyGA0dfp9EqVA40CAOWMilq05hUpIHY2INu
	YE9s764ZAkc4Gl/Mv7AYpJSBvyngLsiukC12i/PM9WZdUIt5ytc8jsu3lhknReie+x7kwNa
	frkG7fDcggDzbgMItmXyYl5tzZeLx+2Mfp4791tQ/HOhUqBWw4LzyDGzMUo+ou9Nla3DpiW
	J/BkXpzPTreV1vfKqev6Dk/AyNRHHIJHbKjmqp6G97D2FE0SIVZEtRH1PBic9cdGnfDmS7y
	UpTfIJYEhU6ioqhyR3YFaFyDXHzPx9ucTPExj5waGZfLDd3FQGa1KznFRLizSZ3TqmJLSyH
	pDQ86QtirE/lhLpcJEWRbZPmJtDmC9LiNv8D9g82+8JKlFTfN4kNv4xLCGBLgdBxDqzPE0o
	WSPqesxxFPlHiVGWOT7pR6qRHnyTYTHj387ZlcXfniLp2HHL1OYG2H1rgqUopCsyefw12JA
	CXu2YmhzpnaTVeXBeIB/KoD61ACYYmBGiK5EbwsGYRYz5rTmhHUrXQJ6DIFFHwFv8zhc6XL
	huwARJOjo2uylvoanVE63uS7rJTai2/xGw4L/WHLl5mw8mwvEcYLXZwI/5AddUB+l4LW9K4
	XhJFKB3NrwGrhKq7/Zl1mteA6gavPpZSgP6zBriqrFTbkbD+jJhDM8ETdUWdNyKW482jlr5
	zuVYqwnVLzkTgJdYCY9lHe60bzs22PG+K7WkUyYkCqp+N6/erCashY23qA/WutuzMtiN5CW
	kvvFHWOmWHvjdJm3sa0Zq7zM0TNK7lWyo/lditgHv4Uyl44aAhwcv1dqyGuMoIEXrHs9WDI
	yhq96XBnW5MSsVA2OmEKkNMOleKWuj3Y/oTPo+LdN44RcUbEv/wj60vwKzUGdrz5cfjAjq/
	3EVdGnUUBjAT5H2FZw6y3MOUKA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Convert devm_clk_get_optional() and clk_prepare_enable() into a single
call devm_clk_get_optional_enabled().

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 8ffa1e95d8e8..6fae2d4a053a 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -70,15 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk = devm_clk_get_optional(dev, NULL);
+	priv->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable the clock: %d\n", ret);
-		return ret;
-	}
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
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

-- 
2.34.1

