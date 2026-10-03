Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09CA39185A;
	Sat,  3 Oct 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015144; cv=none; b=XNtpyHo0Nk23Qe4haSQYf+WrC9sPxtKAb5wuE6vr9O8CFEFD+WVxblgunnkKb8IGIKE3NyJRXoGGKj+7BEA2g5XJ4u05CK5/SZf5Db93zbUhUSKHSF5fSHkFc9WKZN+dPxmW7NPdAnODnyMsuNPnbMmgadtUcl+WDo4cMnKIp8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015144; c=relaxed/simple;
	bh=LMNPDONGndP6gP4ioUF591m8M+U5aTfwifHOk6Ogssw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vDCh8no2AMB9JXX2gUfpyCEAz/FPJJIOWX2P6yRvlOx5Tfu3OBnIh2U6Jm8qFDUhsbNA5X5b0MCPs2myA4DzDfb6Kjz+smSwtNB7W+GJdUKCCL3d9/LfXN8VWjrS34e2dOETMPxsq/cK7PVPAgo8euWSgomoFit7p0Xfxxeul6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=opM27iVz; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="opM27iVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=XI
	ZjW3R+IzI312StdSvC06DOyVyk1Qc4P5DMVC5otb4=; b=opM27iVzxuQQaGuhb3
	zz0PF7OxG9F594fhlHtYcRcQalmunFALoYigwtAcbAPLnegZ5+2easPmUkKw15XD
	ywNugTgCHHeucc8Plw0rFCktjHIdADMieXNim/h26/1k3uXv3WycKzEs2JKq8oV3
	7BQMF7r6U4COSlDi15h+Cqbp0=
Received: from pc.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnT8vKuMBqmSemCQ--.57746S2;
	Sat, 03 Oct 2026 16:11:54 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] usb: cdns3: report endpoint reset timeout
Date: Sat,  3 Oct 2026 16:11:52 +0800
Message-Id: <20261003081152.433499-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDnT8vKuMBqmSemCQ--.57746S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtr1DCFW7AFy8Ww1rJrW5Wrg_yoW8JrW3pr
	4v9FWUA3s3tr98tF4qqFs8Z3y5XF1Yya4kKrZ2k34DZan5Aw45Kr15t34rKF47JFykGr45
	tF47G3yrCF4I9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEXo7XUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wsrZWrAuMtWxAAA3h

cdns3_gadget_ep_disable() discards the endpoint reset poll result and
then tests ret, which is still zero. A reset timeout is therefore
neither reported nor returned to the caller.

Store the poll result in ret so the existing diagnostic and return path
expose the timeout.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 42311c1bfada..53cc535309c5 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2530,9 +2530,9 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
 				  !(val & EP_STS_DBUSY), 1, 10);
 	writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
 
-	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
-				  !(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
-				  1, 1000);
+	ret = readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+					!(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
+					1, 1000);
 	if (unlikely(ret))
 		dev_err(priv_dev->dev, "Timeout: %s resetting failed.\n",
 			priv_ep->name);
-- 
2.34.1

