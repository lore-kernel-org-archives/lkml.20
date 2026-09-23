Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654237F309
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151021; cv=none; b=k2No+5zKF4gJXlHv2EBphcPrC+g6JWASq6YuhOjL8ScrTTdt6hThoak023cJO7cX8fI7AuViazfhFPAlIFzmtUnzopWyBMAwX4r2mYZbj3sJePygrPp5SQU9R5h7+viqcliHaHi262ruwS9sVnXOzqjcYebQ7fmCF0LNtcWO7zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151021; c=relaxed/simple;
	bh=OJ4lfeqD9im+Foc6CNC2HRl00ysGMYvZl2GuC3Av6WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJQH7V1o05okkLRDyhiAkMPSjGKbhqmijsAH0JC7+Vm0Pmd8G1dZyHn4cVmIAhjbGTkrhS/38gCWfyP0n/mE10w7aydG2a25Dn8GkPr8OnohPEJtva5yqLU+Q5nAnqME24s2GV9DCEekNsKDV3MDBOHQkaq/M8anIYac/ssFxbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+4ojZun; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+4ojZun"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so483206a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790151019; x=1790755819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhNFDOl09aEMZ8kpRAqjjIB77iovlB54t187rXigIoI=;
        b=c+4ojZun3mdW6kpPO46BQgosj7IYaOy4GssQXjc1BCueML8yl5S0FLtWNFtKi7/Nxz
         MMxdHDbHhR8/8uBGJMh4Zxf+aVzwDDAi+EYvxBHKoNwp7xgB5N2fJ8McEfgMZYhrAtt0
         7imlxbUr7GNGFxaqqZ9tg52KtjUloTjk1B9125WcX870Vfnh2Jesz8xHjiCEFR+HEX01
         WlNKFgK/M6SpFFqcpwM+Gatowip+cJuaAqBsaOeVsvWfJJlOswuy+JPW57h/CfWe0wYo
         tl/V1yXcBlYnVYMmprLR3zkfhOKuNtcaMmx6iIJmpuSud0h+F57GH0oHssaa8vkJx+1I
         vKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151019; x=1790755819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhNFDOl09aEMZ8kpRAqjjIB77iovlB54t187rXigIoI=;
        b=u1mF9IqezLa8+LmzGPpJPHoKHHnXAZLT8zGL76fB0goRgMuz8w5T+iKdvkDblE3KUi
         ZBHzDsZpIHv3EOr92gt1iz3SdwQuGp4KZwkHh7MLGwkso3AUkeJyvSrp8m9VnUYVHaCn
         5K45sWat8TrOdaJ7nLn0JLGboqldFGW6KX0I7R73lJMMm0ScERx4SPdDOGz4qcN1p17G
         Cmwj1bO8aEUF3VMk2O0FzRlvaHHsN2oCKL7KWjQkMlYE16v2rG3SPMLd6L7/N6r5lL4F
         eW4YuvPjlh3sOwuyzZg/DCIeWFZcs+9v+hxpIKA/+XGDHuLM3xGx/taJZ6ZDY/r+ZQwD
         6OGw==
X-Forwarded-Encrypted: i=1; AKwUvBwEvukY1NbtD+c5PCA8BayQsisblOL5PKy4KdVCeoUe/Zrp55Qnn0x6w1xw7eLQxTEmKAN0G709q1ypIbY=@vger.kernel.org
X-Gm-Message-State: AFuF++mW4clDR4qTkTquDruWwnNFFMEmsRiCuKyqtJANMJ5nj+2MXCfZ
	iaVyDxTSyprBODZHZInQE5zlIbMOjvhCj2PuqgxH8T4BlhClcid5x9F4
X-Gm-Gg: AYBFou0775NeY7nBsaQ68aQ33tT69VRjMAyzhcVn+lYTIZwqjUrGusKOCX48GnsZ/KM
	mhW5FPwf1ENgND6vRdbojvg99HWpukXw1FuR15tI6hjdmd7OaizpUFFjin5ytsBDLUExyRgYef7
	3cWtWavxOEZGp9YFWbdrLS6/eD34fSZuTHqVlq/KpWqSb+X2p81ImuW/UZDGgCz1JSyykGhK5Zk
	LwZ2Mgkf2P9dokvuWiukD+UJiPpiECMiJ7B999hHtdIB3nXdvjk288wBiMj2WXbD2COcy8+uejv
	al1CRl5URcEquZVb2JX4aByh6VOjA9rQAdIDvyZPo6VRmLZBTJEXvekMsIYwooVPHl/Qb+mxJ0X
	Yy7RDIrv7Z/5bEqDSDWGb+IZEyf8XopPoS23oudtAmZhtrxeE2c4QszKn8l9DJL9G+vUN2l19TL
	f2lg7vHTyZNIxMCyGp9afL4RS3DCslG2uWxUu7VMLg4eVpn/BVom1eYgs+7xHdjoQQADxeK2FEF
	IGdjmrOFn390TxuuCW+AFkhVA==
X-Received: by 2002:a17:90b:1fcf:b0:39e:b7:cbea with SMTP id 98e67ed59e1d1-3a07e5a0e0cmr1492320a91.18.1790151018934;
        Wed, 23 Sep 2026 01:10:18 -0700 (PDT)
Received: from flow.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc013fsm4314141a91.5.2026.09.23.01.10.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:10:18 -0700 (PDT)
From: By <xiaobai050@gmail.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com,
	By <xiaobai050@gmail.com>
Subject: [PATCH] usb: dwc3: pci: reject matches without software-node data
Date: Wed, 23 Sep 2026 16:10:06 +0800
Message-ID: <20260923081006.89175-1-xiaobai050@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PCI driver_override bind can reach dwc3_pci_probe() with the dummy ID
from pci_match_device(). Its driver_data is zero, so dwc3_pci_quirks()
passes NULL to device_add_software_node(), which crashes in
software_node_register().

Reject the match before enabling the device or allocating resources.
All static DWC3 PCI IDs provide software-node data.

Build-tested with ARCH=arm64 defconfig and dwc3-pci.o. The runtime
reproducer could not be run in this environment.

Fixes: e492ce9bcaa1 ("usb: dwc3: pci: Register a software node for the dwc3 platform device")
Reported-by: syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=665bae0a102933788e1a
Assisted-by: LLM
Signed-off-by: By <xiaobai050@gmail.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 6c1cbb722..d7fdf6ca6 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -335,6 +335,9 @@ static int dwc3_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	int			ret;
 	struct device		*dev = &pci->dev;
 
+	if (!id->driver_data)
+		return -ENODEV;
+
 	ret = pcim_enable_device(pci);
 	if (ret) {
 		dev_err(dev, "failed to enable pci device\n");
-- 
2.55.0

