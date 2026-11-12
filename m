Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491954;
	b=Du1PPEqjGPqYMY+YOtECJPChqYps4M3sWOriPPUxqT5f32EYWpM0/LQKK0QPg2/LwSmJ
	 n8kxpA54ATraDukKiumOGVhw57ZatBaIq0KWkbjtqNGnpDB9PZfXeW2DMmF3N61HH0J0v
	 4fp8aOOKgAImWyPTDc0NlSbo/2PHW71Zty1Cmo6TFRBIe47N06ZhS8KLrQxInKCsSXNPN
	 hvh/siRE2gx+/63vrIKGsiG4Fb5mLjPcNuDQxBZhd3rf8BkjfY0YvbkIn8begsNWNyP2F
	 qrv0uyQxGk4iP9GXtVNa+S2wXUBMmLYxvSb94huYfyjE33j8t4fn3CKhOEHPEkGnBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491954;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=C3Pum34PmCwY1bw4qi8a/x5ZBUCPkicMr/MwqlimKu4=;
	b=r6GIOSdPdj85muJC70rN3qRQheNY4ySMwroeqrF6574obOlL4uoDRK+Ot4UBgcl+GKhz
	 mXi3K4y3h2p0FIEdnIYgJ5LaAGbnKXOiJRf9NWA2v1fc5L/aZFPrq7j8IUZaCTts6VPUX
	 seFFKzeX5k3bfJrV/DRD8UhvNqaCvKZwHRzdJn+3eCwTt+K34JnPgR/aTZQo6tpj/b1uH
	 Gw8KUHUwpANbVOXT+O6TlK1+fxgJqD2xnvdxMTH9JtsHERzlnPGOVUWBYsu2Qvyn1iUVa
	 C3ayb7bwMI99or8fKDqCWlsbfglBSg6bMUNVEWPYJ2itJbvs87pNnFp/yFfC7K5LUww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fZc2HTMN;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609B606A323;
	Thu, 12 Nov 2026 13:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C609B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fZc2HTMN
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 547738922;
	Thu, 12 Nov 2026 21:59:02 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: tw686x: Fix potential use-after-free on video registration failure
Date: Thu, 12 Nov 2026 21:59:01 +0800
Message-ID: <20261112-88a3a7ff32-media-tw686x@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d00e062b03a1kunm16083b5829e4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUtJVh1LQ0gdTE9MHRofTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=fZc2HTMN0iz4eValiAmaC/vonsH8P/Xngbae3nKQPMau0Atvgn2Y0cxA2qexlLmzTkJ3nKBJ+47GD66mYKkJkM/8q+UNNOhelniNYHZ0lGBywXedrhCECE6Zrsz4Hp4w5ccLB8iYbWHnBL3K4Z7BPJowPFt4vpqDi35+5tR6cd8=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=C3Pum34PmCwY1bw4qi8a/x5ZBUCPkicMr/MwqlimKu4=;
	h=date:mime-version:subject:message-id:from;

Failed video registration releases vdev but leaves it in vc->device.
The common cleanup then passes the freed object to
video_unregister_device().

Clear the channel slot after releasing the unregistered device.

This issue was found by our static analysis tool under development.

Fixes: e0b212ec9d81 ("media: tw686x: Fix memory leak in tw686x_video_init")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/pci/tw686x/tw686x-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 785dd797d921..3ffbf462d353 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1281,6 +1281,7 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (err < 0) {
 			video_device_release(vdev);
+			vc->device = NULL;
 			goto error;
 		}
 		vc->num = vdev->num;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
