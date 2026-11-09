Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209096;
	b=Ty2wDvCCIahS0WxYRtBWkShNY0xWCE7Ppq9KvddB3F3irNfvW3z+9hrN/bndYwXiutmx
	 Tqe09+OHGvtGLYS38pI2eTkGMzgTBZhwLAn79sMpoZKP6zAh0nA/HZRR605V2l3GtPRIE
	 uNVm9+GddxoJ/ke3sQHU22QhM5RE20faYA+pn9Xkw+z/oLqp2wU18EAEzeV01p4MsbzSN
	 4d27XCGwA23ZflpuUiXPzhXTdgq6iNl1WL7B72lObO0fjQF/L0YSiyM/iUqw4XhfTsY0h
	 pFUUmf90TyYLd86QNvy5ZYs0+cEajzbfD34Tpl+CCm0FySFlhNMFYxUY3jsC8ntPYRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209096;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MhW0Q23ZVys8O5dvOlmOPxvunp1nU92KAQ/DMofhkqg=;
	b=nFIjjYpGbEW6oQ8gB/5So6fd0nOLry8uwM00zfQO7+wpKrDiufokqqgMJCP0mggpTjip
	 WT8YXBdhtiJAZrmkm2pSWVC+CewYZCD9OtL6yf9Y3+by5vQ3fvyp0Wp+Z8fgvxPs0PMi8
	 K0iwY5OeetrNMcUVlcHFHUDZ9vDXskdbLPndtgtQaorhyjVbHmcgym2FOaQ2dITawGoIr
	 NVG1ew/AUZmI1eiQq6nFF9nFq6Ejb51pojtbBDIkd6IOs00UwbdZvBK4xem0QOE8u8VjK
	 Mg81jMMChN4+9kjiFzcRlw21I6HbH37tci1ab99VOPY4BlTUk6JU/5M0Cf6laRI2zHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=B5sgBt1K;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40200606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40200606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=B5sgBt1K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=B5sgBt1K6hlOjrNziZXLsOA/OmDv8aWDdRUsc+keAVKutHXlsYv732ugGQnibE53xuDrS9h+6AfRV
	 mVEuOa4y8wv1+ky7inzk957J8lXjbGStQdw8jB0RDGjfqfQiEl45FN3GwOARzRwhmeZ8IunHXNfhqB
	 6FToYJ4aM3fnSr0Y=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af17543f5d-8e698;
	Mon, 09 Nov 2026 15:24:52 +0800 (CST)
X-RM-TRANSID:2ee36af17543f5d-8e698
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af17541290-860be;
	Mon, 09 Nov 2026 15:24:52 +0800 (CST)
X-RM-TRANSID:2ee56af17541290-860be
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: Johan Hovold <johan@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Subject: [PATCH] phy: ti: omap-usb2: fix OF node leak at probe
Date: Mon,  9 Nov 2026 15:24:49 +0800
Message-ID: <20261109072450.1005-1-zhaofeng2@cmss.chinamobile.com>
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

omap_usb2_probe() obtains a reference to the ctrl-module device node
with of_parse_phandle() and never drops it, on either the successful
path or the !control_pdev error path.

Drop the node reference right after of_find_device_by_node(); the
device reference taken by of_find_device_by_node() keeps the platform
device alive and is released at unbind by the devm action registered
below.

Fixes: 478b6c7436c2 ("usb: phy: omap-usb2: Don't use omap_get_control_dev()")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
This is a resend of an identical one-line fix that stalled twice:

- Miaoqian Lin, 2025-10-28, with the same Fixes tag, which collected
  Reviewed-by: Johan Hovold <johan@kernel.org> with the only remark
  that Cc: stable should be dropped (done here), but was never applied:
  https://marc.info/?l=linux-kernel&m=176163256031244
- Guangshuo Li, 2026-07-08, which got review feedback from Manivannan
  Sadhasivam on 2026-09-26 (wrong Fixes tag, cut-off commit message)
  and was never respun:
  https://marc.info/?l=linux-kernel&m=178349844443656

Verified against current upstream master, which still leaks the
reference.  Not runtime-tested (no OMAP hardware).

 drivers/phy/ti/phy-omap-usb2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
--- a/drivers/phy/ti/phy-omap-usb2.c
+++ b/drivers/phy/ti/phy-omap-usb2.c
@@ -427,6 +427,7 @@ static int omap_usb2_probe(struct platform_device *pdev)
 
 		control_pdev = of_find_device_by_node(control_node);
+		of_node_put(control_node);
 		if (!control_pdev) {
 			dev_err(&pdev->dev, "Failed to get control device\n");
 			return -EINVAL;
 		}
-- 
2.39.2



