Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305496;
	b=M1zBxF2qnM9ZNzr5Uu5yy9yj7YK5wMRM3RDmRe9opJbp/qrT0HRpxd53QuRypCe24dBW
	 yWr2t5KgOEy8HcuuvMddWUg6YdEOradc5AT9vdgvIOSxeXAhYTqROaq8HNUkQESV+qMjP
	 N9r5bnFZdWN48P0Kjll2VBpP8UvLTqZKKzM4+J3RwOp8amlDfBeKT6WhvWHSq22C/O1Q1
	 V9p9El48e9Y83Ba85FJBDktI3XLOG42iN56yeABOtpIMQHbhqMvY2c9zIFDTsJoRAd3NZ
	 kWC2WFG0V8MJ2FIAn/D2Q4868gAgs/gWCQ8PfP3BX3q0uzOXT2zOkVv2aEG9EXMvoGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305496;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Em2sJRpNOElFcNjFRLmtzTqgZy234orfIB2xhsberPw=;
	b=Jo2VdXlovk/WaO83lnayeb8fPRZfCeJYu7Nam26HBfaDfbFi+i/ArkFCbSaUXKmJ1FXK
	 MS92lwi1LHSBy/0Z6SeWYJ/Yi3Irk2oKIWWInedBxYAy3kuJS+i2sasGHUttRGHK/tSgd
	 +m748eQFc6QnCjZwykis3kUnEJqFahAvpw6R9dDfKJIV9Co5Co2QLMiTJkdDtQ3ZpUneJ
	 g1Y3zgkUYx9mqR8+gqDwqT11279cQb90cvV8lzpZgV9mddcsMsR8sV2Bp51BmiT5OuC37
	 YznveVYiVROpGQU5PZNptAKBZNrPmY4dk1wgYcLQcwnQSLnIcmELSkabMCq1F/mSo/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cZifF+1D;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AFD606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AFD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cZifF+1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cZifF+1DlDdT0/nc89d/5zBuT/vCn11CG5v24KVuRvgE166peC/z3EViBCmzqei2SUPS0MoxTuVC/
	 bbI361cPMA2xlOH1yrr/NegpAGWOkYcKq54/yTtarJpC2UrzWQEwPPwftFwueBcAjDlxtjiSYB1uik
	 pUCmkTT4wjXFgZj4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af2edd30b7-9a86a;
	Tue, 10 Nov 2026 18:11:33 +0800 (CST)
X-RM-TRANSID:2ee36af2edd30b7-9a86a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af2edd38e8-b16c4;
	Tue, 10 Nov 2026 18:11:32 +0800 (CST)
X-RM-TRANSID:2ee86af2edd38e8-b16c4
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: ti: knav_dma: Fix device node leak in of_channel_match_helper()
Date: Tue, 10 Nov 2026 18:11:30 +0800
Message-ID: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

of_channel_match_helper() resolves the "ti,navigator-dmas" phandle
with of_parse_phandle_with_fixed_args() to obtain the channel number,
which takes a reference on the dma device node in args.np, but the
reference is never dropped after the channel number has been read
from args.args[0], so the dma node is leaked on every channel open.

Drop the reference once the channel number has been retrieved.  The
phandle stored in dma_node is deliberately kept, as its ->name string
is handed out through *dma_instance and compared against later in
knav_dma_open_channel().

Fixes: 88139ed03058 ("soc: ti: add Keystone Navigator DMA support")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/soc/ti/knav_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -387,6 +387,8 @@
 		return -ENODEV;
 	}
 
+	of_node_put(args.np);
+
 	return args.args[0];
 }
 


