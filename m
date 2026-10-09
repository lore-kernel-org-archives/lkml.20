Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A4483BF0;
	Fri,  9 Oct 2026 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531111; cv=none; b=VVGUmoIEhyQqZX+x4t4cQi9Bn5XI42utd9B9K58JLLIPPQfp+x2zbacurlBjqyM/ukiiYUG2KTIQVIFULSZjnL1Gm9Xsz58StqiLzTu/+0C9YP6bhiH3wksbc8hcQ3JuJOT+phxAXEmap+vjIEwoe4P1OUpQXAFujZdw0/WLCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531111; c=relaxed/simple;
	bh=2IxCEOKKjMHvLmpnCgI1SGHmqvFF8yLBlmTGqtLvMS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Clj1GYxB2p0xzK/zgz1WLkeKDZRI1H3rjm7gCmB9rogP9zPtKK6gVrpA5GbLqSlk7FOW9JzAvceKPGH8f3TtHsk/yDZTiZQJhS62Rmshk8a93Q1INPh09DtuZqvWakFAkx3vUQDUhXegwPzMRDBPfmpXyscsNxpNgcsbuHJ9Juk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TyLK3ltS; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TyLK3ltS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531044;
	bh=2AkTQKYvM79m33kLtZNYPwQIEwo2w87FfSkeBFySuJM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TyLK3ltS6ZqaTuzJlv7Q8NWovmQOs+N8mwCSbD1+oI5YLTO/RYRPKgFCncUT/zeMY
	 uX1k60u3f3hoJ6fTHMg6mqXhwwErhYwCF6TIbOznQ2tHbqBARt5JqshNkRav7zHSAI
	 nZffzzal7vMVV2pXeAGErKc7ltXrjNSaxCL1zFwg=
X-QQ-mid: esmtpgz13t1791531037t4ac2aa76
X-QQ-Originating-IP: jnojmnhWkhTmf41VMHwFt1lQEonSHKmuIEqZspJ9H3A=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10186281489538183657
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:26 +0800
Subject: [PATCH v4 3/8] usb: chipidea: usb2: add optional reset support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-3-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
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
 Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1690;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=2IxCEOKKjMHvLmpnCgI1SGHmqvFF8yLBlmTGqtLvMS4=;
 b=rglPJRW3wV0146sLKSxYi3B0Zhyy1EPpIIgg5VELo8kj6hsrHFtN/pY7VZxjSjhTQKN+YRZq4
 qXXX22n+hzbBlvZPmyLKLTwz8T4lQ2/pR20OylINOFbzezVg9eJoV2K
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NTllfIjJ3Elk2EmZV4PrDakm8b04Y01/W8B7lxHzUH1yirzDeEDSrwc8
	8vTxn/WIH/lXXW1PxoM1ap8B4g68No3kGdf2IU2vmAksT3lllgAWK6Ncm6+xncF7AOi8qwn
	bfG3beGa1M7ic2B9VEhIClhRKlkeVy+qWnXu42Bos49YjalfMX+3uxMfuel4Hs8fPlPnODA
	Cn/JIJno07HuqjxKy4XY9wAzStyy4jQ8qpxC25vSWcY+Vml8nzFrPCPiXQFzj2iunpXHQQi
	DIiQf9n4LhPrBPexpEq4RS8TWsC+D7jUirc4uG8RBf4NI0/wftEQF2JZfZVrzrgHc4Y27qg
	CokFFyKs7lbjfLm15UqAHffpC+ugNXk2Wg00AF9zSjSfKReUDFNa3BIOBjxDA/F+lLPHFTZ
	cQA99JemSWprizEWN183X5N44Uk5ndB7yetNeNe6NF8hxei6IdRUPNbYG8wGbD6ugL7NVOg
	3/H5pFzSyUXWnSKkUNKzgoO83Wwccap3agl4xd79GlCI1gEFxJE5MMZP8J4Gt4FOXhU7Yf8
	QvOTcx5XWUSdzzIEpJqYWGu6ntwrt6R2gNMN11WuFsm7DlBOGDp3sbMxgcorbIpgdUPerY3
	p+NENggFtMt7WFq433Dj0nUDRfWGUlLrjYKytB2Roodk+bwzru4nTdVD6z0PZhCnJtXs8YS
	iIwacnghWrNvrKbx+DMNStyri6JFXRENNycGNNXGfbr67upDMUImekFAlaPaBsR8lELeMh4
	Kh765jSqTipTXijR7tFWk++zBqqhMINV4H8c84GaYFME30TlsSggBG+vdk2oeWMaaL3GdOd
	Nrpg3NKzBW+R85tzJZsVkl4A84X2+t7yOzV2v5sB2ie7ce41CofVHvkN/RbJGaNCZrFE6KF
	HCJ4wI8HQglI5LklrpsqWJP0zVr/+0hMC+Vo3aYOA6OLoanQIDe+zFEIzHRSPAms3bxt8dd
	YA3/AhR1PA1mzjsPMrvWfmKi+NFNbjraalTIxR47h/uWlTvYDNI7HIrgMPsLRHAySkjwDhc
	AyUVq5fH2YaFn4HaKVpRUim6fmzH95qMwzRyCOEEwnG6hUodlXpJtBY+GlZcdL45n91xjvY
	63EzSBNeuRc31pMae5/i3t3YQvOCr9JTEHKA/b6L1w1idznLeqGNDg6APSoQYsMFTpOygL/
	M46xkrEXW9MyQ8U=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
compatibility, add optional reset support.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 9cef902f36b3..85244e8bbc3f 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/usb/chipidea.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ulpi.h>
@@ -52,6 +53,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
 	struct clk *clk;
+	struct reset_control *reset;
 	int ret;
 
 	if (!ci_pdata) {
@@ -75,6 +77,11 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(clk),
 				     "failed to get or enable the clock\n");
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get or deassert the reset control\n");
+
 	ci_pdata->name = dev_name(dev);
 
 	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,

-- 
2.34.1

