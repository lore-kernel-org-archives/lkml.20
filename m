Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2615B477E40;
	Fri,  9 Oct 2026 07:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531109; cv=none; b=cvfD9BO8OgEgtrekfgttXiLMeoz1lpwJ4xx/2pli2y7AXn3hblgFsMRq6t/lC1JWqcoYY9ujCm4Rw8dHdz554OHCIitWpy9r+T5oHalsla2e+1fC3cHD7B0wrcABy5YmHFVgNJJ01l1OLSV2MSTB3q3sxFcTJnWdXSR9Npe1dBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531109; c=relaxed/simple;
	bh=zbXj26zXno+atJnbbmylm48F889Dbwwuwzg9UKMq9Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OvVCBHyQrNh/Oftwuc3yjVDYvvSjgiJNMsUK3uIS44ZFDpmCYX27qm6KNqcCLl67HJay1eDVk0kSJ/ZmM0NUcBhkiuuc0W3FbalZczFptOcXUuezCYUeof3lSp5Uyf4xW9yJjY9Md6Vsbq3oJHUUb/ZigN4VpSoBLBMRxk+6S68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=RvJHe9RC; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="RvJHe9RC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531047;
	bh=36LVwmIphhVaIHhFR1rx1ZN+NuqsGrJ+k0gwm0wt3jU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=RvJHe9RCqTZvSmWPkCz+KQlbKlsMJM235jPBbzLNF2NzYQwA3Xne1Mouui5Jk2dCV
	 EI5knJfz/0snT21wgUWJDgYaiywmo40IAnvSvj2LxXqhzSWWKcRM23tK3oTkpxaLhV
	 6lLC14/Ewjy0OFpDk5FAf03nZbhQ/3PQV5NgPac8=
X-QQ-mid: esmtpgz13t1791531040tea0089a3
X-QQ-Originating-IP: YbmnKKlF33JDTNYD+4VukpU3nvn1nyLOAbnrTkDP020=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17300880968877318002
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:27 +0800
Subject: [PATCH v4 4/8] usb: chipidea: usb2: add SpacemiT K1 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-4-2d98e5324d9a@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1441;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=zbXj26zXno+atJnbbmylm48F889Dbwwuwzg9UKMq9Ws=;
 b=yUXnKICubpT5RhsVMro1YnR3UasVnUQh4CkRfUiaL0r3/13xRgqC1XnanX7X32oVpGVnsjcZc
 MBMo8h50eUvDxvJZjg55cA99MOUR8oGGzzwHTerkGP7R2p/24IsShNZ
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OZw9wIELRY5O6nzgIm4e0KfsUXq1WTaTiZWSMW9lj6fciClAmADgnNYF
	7dg/BRvsbU00sI8XKNIwMats/HE2+5BWGBA7KD2xK7KMeNt+QIEYiaJCvudo+XHYUi1Pxo1
	kHxHWlGf64kxYA2C/xg8gnqg/2zX/SSmEbMvsycXAidIayJKbJda8/QEB2OQVyXcBU4g1M2
	ibMAPMkHtICSNmzN6aq0DOUOBKA2KlbdJSMYaI7isURGD0r63kJioI1NrHySFgWkqGLcglO
	ZTPL+r9OQ1FE3od7WLhgjT0dUszY1qv0TVOcyS+8ZwJd8l2j7nY16RvUEr3VcitwSPlAld+
	tAjhTpjp1YzsSopBjSNYcpdFvg3EttrofFfmrr3kVolvvQH6vWSqFIHJp7TzNqFpkA/FHUQ
	AkUrWM3V4C+1IQ6PiG03uCOgaHhIaTK3l0kBGa7+L0lWzSj2l0m+yQdDKN+eGzQYBsJjRnG
	MghaGnWejXKD5Em5nh7pMtVkGNMjxNbT3t+Utm/uyj42/mMdkRM0nctFEdKAryYQc5TY60A
	0DVdVediBAVGsnXZkG58AMBTwHsbYbfmbFyXxIFdFnSMvqvu67Udis2MyEE05TzsUZBS0Yx
	wY+RxJE9ticPd8mVQEVzseZnGWFERuGkDVzVZTV40k3wPW2XZCyPAGggDsM8WEJNZGgtysm
	ldCvPsL73lQmbkhxdcaGuyEEySiIOfqZi5Oggy5PJJK5C8E1t1VcxEp4dYLcHoLrmPVr2YN
	m0lvNxNQ5NFYxbNL9xs8E/2w53WLI2ecXKR04S0tg39Jo54AFqL/0LOGVMBpkOK5PSOcEck
	189Iojo0utPZPV9ifRB3H+iwmmlMDi663s6wEHyTj9EXlnDXanpj4o0CgtVZmp6AnTvy26M
	/+d/tTgO7E00xVw3bryFR2A1uY4ms6h0xYHL7ijQ6lnfJxklJeMV8Hg7Ho0Vvx+Q0v33Hxc
	HztgAu2nHfRnaDG383Bb8zI4wPUcNhX/mqKE5bEK5KqeTRTqJc3e4En940Py38f6SlwsExk
	pobdOP4iTOjwKIM3O3VazLNwBLqx2wP6B57ZlYMlY6FH1KH16lcZQLFpH9mBbilmhGobi/c
	mfpcfq+eZt3x9SAoSAMAOVpgaMhtcKSMoGa5UmIPPQSqqViXPdYCDMhB1uXfBYznXcC/nL7
	fotPvR7+wl3H1jKZlZOWcyhixLKVmBV8FrhI
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Acked-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 85244e8bbc3f..a5ed2bad5573 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -38,10 +38,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
 	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
 };
 
+static const struct ci_hdrc_platform_data ci_k1_pdata = {
+	.capoffset	= DEF_CAPOFFSET,
+	.flags		= CI_HDRC_DISABLE_STREAMING |
+			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
+			  CI_HDRC_DUAL_ROLE_NOT_OTG,
+};
+
 static const struct of_device_id ci_hdrc_usb2_of_match[] = {
 	{ .compatible = "chipidea,usb2" },
 	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
 	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
+	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);

-- 
2.34.1

