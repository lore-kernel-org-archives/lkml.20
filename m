Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238996;
	b=49DjmteJ9mwqLoqp1nRNdOVavMQa4jMMm2sJ9VVzQt5WdAp+g5OABsXTHsZ8Ep1jgPcL
	 Fx3t3LG/+PnbW/EY7X+aPU4qYdzjTX/yU9KeaQnPzw4vEhpblJacdo+oiMhK2FDOC2UD7
	 kODZ/FToGY2N52yuT2LFatdzAYWttPYa0izLft0vOXaHM7iT8uGjAbvmFGdiPX1cwU+H9
	 NQj+CvN1O6znjC2VcN0S9WvPvN1uV/YhD0tv/5vWSKnl17Om67UsaWs3+nMII9EDQNL4S
	 iJ1coI8glUYOv/n1Tjle1T3H0oBLC/PcnCapmU+6Tqq4d5nWXjI8zTtHSjck1OcaPEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238996;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=oTln7A/rnDoB+lqRRdsTm6LjpukRLhjqNrKQ0tZH1Zo=;
	b=Mtv197W8cGJNE2w5u+GNUF6ECUT9R2/ZACoXFr80c2GE64cOwCxA9hccr2+o5Cc+MFxX
	 fFWE8uW5/CzbW7eXp3lrBGlSlID5NFGOotqlPoMybWYg+gLJOWzh9H8ScRSHi2GgzMjhz
	 r3tnmMetWvmxZerEgcTsvkR0HILbTEGxxDIU8yz6UoZJb8yf6+ZGatl4zfouJ66mBPd3b
	 WrNEJCJ++jn5i6h6KhxkmK8Yggd3dnJP/d6gIpSEadYZ5EQcW0seiCf0rx3UvgyNU3tCT
	 Viem4TyF5EaGf34VB5sBQufpNns8OBvRukp+Ot/X4pXlhrMiESncI8V0FxXQ5mIXgcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2501606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2501606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8CxvtLQp+JqyE8aAA--.10679S3;
	Thu, 29 Oct 2026 09:56:32 +0800 (CST)
Received: from localhost.localdomain (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJAxW87Hp+Jq7QwxAA--.11701S2;
	Thu, 29 Oct 2026 09:56:23 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	chenhuacai@loongson.cn
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	wuqianhai@loongson.cn,
	zhaotianrui@loongson.cn
Subject: [PATCH] vga-switcheroo: Allow VGA_SWITCHEROO to be enabled on LoongArch
Date: Thu, 29 Oct 2026 09:36:18 +0800
Message-Id: <20261029013618.3558115-1-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
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
X-CM-TRANSID:qMiowJAxW87Hp+Jq7QwxAA--.11701S2
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

LoongArch systems with hybrid graphics (integrated +
discrete GPU) can benefit from the same GPU switching
mechanism that x86 laptops use. Relax the dependency
to allow VGA_SWITCHEROO to be built on LoongArch,
consistent with the existing dependencies on ACPI,
PCI, and FB=y.

Change-Id: I84d38fdfe5e1591495fb3681474a7f1f64281fa8
Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 drivers/gpu/vga/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
index bad4bcee313..89edd1211aa 100644
--- a/drivers/gpu/vga/Kconfig
+++ b/drivers/gpu/vga/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VGA_SWITCHEROO
 	bool "Laptop Hybrid Graphics - GPU switching support"
-	depends on X86
+	depends on X86 || LOONGARCH
 	depends on ACPI
 	depends on PCI
 	depends on FB=y
-- 
2.39.1

