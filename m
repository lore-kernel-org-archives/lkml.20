Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919216;
	b=HQNJXL5M2ReRZBTbXHoZJ3/8FbPqpDOOe9Mx7tgZEr6TGHf6gr4ZU9/uDGCeRfduYLLZ
	 JiUH0N9l3x7vNW6YcTg6JAlMyl+kRksnUUFlI3osJ53I8XXu0xpVxwGEiGvGkXLqA0k8Z
	 DGoCotAIhRYGfjLpF7VjIrHmJZQe9HlW1QFriRldtJdI/GCjR/IGvTf0nzIgXe2Q2swrj
	 59mnpTng3zO7r9hnrW8S/MMy5OHtik93hDdrBFll1PBY4OeiRcIO+/GdIOb6XdigdjLf2
	 leyZU6vxMF41jvzsHiShhRwPrWpLBYeJ1QIy2zCoOsCBT/eNIkjnEUh3exbhIYVgGbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919216;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7p7Pb+f3+26BR0KMgF8tnopJHqF0TPOrtCKj4Okhm9o=;
	b=a9fSitlBv2JqxMmBvw92xX1wPY8JgXgdNNybzEJhr1lUIdyNtYRfzvp95mpdVEony+YN
	 SWeVpFp/LvCGMdGuh0qyejhS/XfvHvH06MhLx4PH8ljjIMtg15T43jZhgEmEVAcro9hZU
	 Dl49ceuIa1xf1kC6jAHimWJMXCNPl+tJTXzGrX2lW1fICVajGXWyZmPye3tgAKT1UyFfM
	 HiY5C9AMkIcn6gxhHmxYK1bMvLrBD7/TtKm+MmBwLHb7/iU6M+MpKqUAqzN/v484uNd91
	 7zqaqepN+qptoJ61G9AK7kCf6id5KuAP8IHyStkzHrmWfZSBS6CtEtQnm6uowU62atQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=e9BT7v3M;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E960A3837;
	Tue, 17 Nov 2026 12:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3E960A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=e9BT7v3M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919165;
	bh=7p7Pb+f3+26BR0KMgF8tnopJHqF0TPOrtCKj4Okhm9o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=e9BT7v3MsC99gVDnGgFKIj2oKhloAVvbVZhOxSLC+CprTQhf0x8aKYZmuVa+tcnmI
	 KW0vz91ZuLabqgHamCmmM+w71ftCWnRn+qfRnzkM8ncHw+vuCJ3ro0T2x/8cqtxiYh
	 svOKYG08K6+bMUI9IqjgStCrQMUg/gFuUJneABHY=
X-QQ-mid: zesmtpsz6t1794919160t47160cb6
X-QQ-Originating-IP: G3YnxjTqmHWEqOVoZbVi8fJCVpijP52i68C9QpO6E78=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6784433204915299541
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:51 +0800
Subject: [PATCH v5 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
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
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-9-52c3829cca69@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1116;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=NhXTB+6LQeBDPdlKhQEBituQTc95+pqg5YH7EZfmLUo=;
 b=QUdPN24BuQF+95BXzm+DDCfCJghmFtjy08DbMyYzrC5QXvJaRgxzicO2wk0+SFr0RhcoCv8HF
 N7P6gcMHU11DRH1PQLTWyjeQimu4VYukjVqUfl0dhepleG1IxbaNp/7
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OKhy7fcgXWEZOKCbU3ZbOYj9HEMXxZS4/TuaLaWrHOZn/sScxJVbURq1
	LSeSIEuKR/w/Tu6o+7+tgvi0rbDYw50oVoCQh8KrSQ40TAMtqa7tp5X0efwwiFtfsAtc9ha
	b5eWJMcDEWz81Y8sVRJKjT09DG2qSdVIbm1kD/9xJ5J7nnyo/E5wGwBkBfo/XT5JA/+k7If
	qymfXY9yezSpyODUZA4SR1tnlDDQTGMO2a6eHpfAhhwrPEZ+zhtwdmRNsITMLmXPdXWSkHb
	nxKynTm47BDjVCyZ5nurqNuemTwGRfd2p1pr5s02vmJT+iSaWnyl2mPY0Cx02KBroR9CsFP
	iDC/T7bxBXq5e9trThucKkupPvJ+pcdgMuSC8FMwP9XRabkEhsiqKi3NVJdEr1ImKYDz9Vr
	0v9FlBunxq9Ig0yPIoqgKygr30eS3j4dlmngKCMdrz0BkiESdFEzWxu+QdwWDRbZO/yJfio
	W6AYDuo14R11+x3jybXDl71XZlSnsft8W9cLiOGM3FyI0MN3o1/3fDHlAWg6jPbAKyimZnv
	n0fvhmXFtb50HOidPJJnVHQNHHVE8G8rEScA2F7ttrWFjwnGg3wxUyHYQWt4noLPEiDF04h
	pHeC6adjcROGs4mQCE7F1M3eol3baenx8T5Hnv/+zkAsKQZeCEKKz4MUb2WJ4HrqUH2Ko5e
	4lqYFjTsueVuCUEBhUdDJ+kbC4RqolUwsFODBvam+MVG0D3d+JOUNBqrp1NzLu7IzI5VbkT
	DWRRPloyHrlhDOlkiJkBR7TFWl0PcqUTkyYIifxDDHmOW0AWrhtMT56SIyTiQ0S3PjeQQ4F
	gaoar0WcjJ+w6VZGdN11fM0NSkHGukdS3CtOEbVxNzAMBeZQVyrQNZ1uKteu6zorzk+Q6QT
	rvQr5li3a/yt5ABqnWgtzjT7sjBimhEX4SNGp9x7SMHMzSWoLgeR1up+26+gCrtqW9F/i9y
	1X5RIsHpqUiJxRxguVtL0dRL/XvbJyQR7JcMhbotV91OHT5v4T9Zo+ETtzJIb9jkqAQbP8J
	CHq8MxDsCwsUuuHXSz9GdpkT6DgJD7gMODka8/vYAaTIbZUsN0RflBOU71QV4VDhtT5/t56
	9SkS9C2q5S95Dbls8Q8JIJGd3ykD2/wMU/f3MDqlTEcp828x0RHWaIHNrCYPdOO8co8U5rm
	SRIKlkGhE3czjlXs/231dHBmjBB1u/F24kL7WBQpnv5eS5E=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY
as module to support USB2.0 controllers on the SpacemiT K1
SoC. The _UDC and _HOST are bools that decide which roles are
support.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..9a0b3847ff43 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
 CONFIG_USB_CDNS3_STARFIVE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
+CONFIG_USB_CHIPIDEA=m
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_CONFIGFS=m
@@ -272,6 +275,7 @@ CONFIG_PWM=y
 CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
+CONFIG_PHY_SPACEMIT_K1_USB2=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m

-- 
2.34.1

