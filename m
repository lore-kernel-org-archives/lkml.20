Received: from va-2-43.ptr.blmpb.com (va-2-43.ptr.blmpb.com [209.127.231.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F04D0A17
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558062; cv=none; b=VPGFNSfDnyyrQqnXKTr/wkBNxrxVIz38oD6bBembJ/Va4UwFADx0AO+FSr8jAmL1yBukq5PwA+t4mr4p8HX7L9OsFphmWlgJ0sxT4OWKI3wSc/Ak2g0xKMo8ESJ+RrI8YOlxH2tkuYJu1BpBP0dkFAe4ZANmxSM4hGETkqn6/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558062; c=relaxed/simple;
	bh=IrZ4eVbsv4PQUJh9c4N50MRJH3scpRZ/iALwIoF1FlI=;
	h=Subject:Mime-Version:Content-Type:To:Cc:Date:Message-Id:From; b=UUdORNufm4DATs983RZHhCP0r2lHTeGKOp3OLdSWTlFmDVh0BIgdm66UVx5J4JcZpV0HfrNfh6rIZt+PRnPkd80fTp4n+2Su/kEcWFI4ziXZdXN6s5/4kFMB0hk1rmVyiMaM5UAwtUdZv5Al2Nsho4cYRb+/x68enUYERhpwIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=MEyxarDw; arc=none smtp.client-ip=209.127.231.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="MEyxarDw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1789558043;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=5oXZlKLbyfic0rzx6a7/Yewkbeu2GdtKNRT5PP9pZY8=;
 b=MEyxarDwrIfJi/4/gg2GaFdPsuap3xFVYmHUNCovj/ACzXTg1WV8bJHeppdHibbSLrqLGQ
 zSwb1ZYKs0PMPwAaZj8z7K7HU8HurWI373/Gw4svSIrYibP/u9wQNYvyhmCxQwGy0OJ0G2
 znA/8+daMIU82E8LRCE7rSIGSOXVFcvsb9geuXvPEW4bt1/+KTM/ZSd3C/j3gNDOROhk/8
 Re7oBl/mCiNTsh5jS7OXKlPUPbDPo9KB/Y/E1BhTv4i6RYTkJh0lVelHKXKIjxYH0XlKMc
 Icny+Ze+AuOQVzgLm5Ot5YL3Q0KwNxwXFS6GXn0SKgwo55YedGYU/WvONiVJXg==
Subject: [PATCH] riscv: iommu: ask for ACS to be enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: <sunilvl@ventanamicro.com>
Cc: <rafael@kernel.org>, <lenb@kernel.org>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, 
	<tjeznach@rivosinc.com>, <luxu.kernel@bytedance.com>, 
	<guoren@linux.alibaba.com>, <jgg@nvidia.com>, 
	<xiangwencheng@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
Received: from lanxin-ThinkBook-16-G5-IRH ([123.120.5.129]) by smtp.feishu.cn with ESMTP; Wed, 16 Sep 2026 19:27:20 +0800
X-Mailer: git-send-email 2.53.0
Date: Wed, 16 Sep 2026 19:25:45 +0800
Message-Id: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+26aaa7d19+6a7470+vger.kernel.org+xiangwencheng@lanxincomputing.com>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>

Make sure ACS will be enabled during PCI probe

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 drivers/acpi/riscv/rimt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index e4538fa6c2c8..30d2d0211d5e 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -525,4 +525,5 @@ void __init riscv_acpi_rimt_init(void)
 
 		return;
 	}
+	pci_request_acs();
 }
-- 
2.53.0
