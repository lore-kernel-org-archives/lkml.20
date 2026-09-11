Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D73E4C7A;
	Fri, 11 Sep 2026 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106965; cv=none; b=jT3BIBKzYTUakfmdD+EeAn94xZmr/ncvO9LF16452/Z3QCXMJnMHTsqmizfgIRLIt5JbX0+ByFtEOV1uByuyaq/5mq1FRY/FMviKNhDEl/mOSX79zZOdu2RQGjvhDTGmmMj2s0cpnEPsJ9LHSXnDrlDgidSah0b2xtCsdD6Fj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106965; c=relaxed/simple;
	bh=D8Kv4v2gyrj4qUT2U68/sdAzWRgC/88CDk1gFkP+4pY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OmeraWpi+4iVQUsMQehPfDPTzwp+4sZ4NL7EokPZoMonv7wXfIUiVBLoea5VGjeZBGGEuLNTadWrbWNr2rCFqxrbqb8TLKfUyln2RDxO/iRdtanNueQRwkSq9shHbw7/tyeD+UZCtLkkFCr4RayqRm5LLjVC3K98dhdU2Ly4F78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=M+ONjhaW; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="M+ONjhaW"
Received: from seu.edu.cn (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fb0;
	Fri, 11 Sep 2026 14:09:16 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] media: cx23885: check MPEG video-device allocation
Date: Fri, 11 Sep 2026 14:09:15 +0800
Message-Id: <20260911060915.94287-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15a74403a1kunmc4d17def1c7338
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0JKVk4fThhLTBofTxhPS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=M+ONjhaWz9A70c1wRUaXNas5B1Sg9WVrs8Tc+V+AZJY/5yuZs005ku1tH24re5eTY81rdQUPyeWJcq9N6CR7oPrkgePVqwwcLrgQ9fnSaDx0q3q/WtBkTx4Y5N/17OKnYr+Oj4V2CmxmA7nlGlwmbYZW+FnFHd/CihUUICdlS5M=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Q5PPTqnx2e1jDma+Moaaw2+wOjKGefe51JBY9I2F1ug=;
	h=date:mime-version:subject:message-id:from;

cx23885_video_dev_alloc() returns NULL when allocation fails.
cx23885_417_register() subsequently passes that pointer to
video_set_drvdata() and accesses its fields.

Check the allocation and release the initialized CX2341x control
handler on failure. Import its controls into the parent handler only
after the allocation succeeds: the parent retains borrowed control
references and survives a failed MPEG registration, so freeing an
already imported handler would leave dangling references. The successful
registration path keeps the same controls and video device.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: b1b81f1db73f ("V4L/DVB (7725): cx23885: Add generic cx23417 hardware encoder support")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/media/pci/cx23885/cx23885-417.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index 219937a153b3..13fbb1588e5c 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1514,11 +1514,16 @@ int cx23885_417_register(struct cx23885_dev *dev)
 	dev->cxhdl.priv = dev;
 	dev->cxhdl.func = cx23885_api_func;
 	cx2341x_handler_set_50hz(&dev->cxhdl, tsport->height == 576);
-	v4l2_ctrl_add_handler(&dev->ctrl_handler, &dev->cxhdl.hdl, NULL, false);
 
 	/* Allocate and initialize V4L video device */
 	dev->v4l_device = cx23885_video_dev_alloc(tsport,
 		dev->pci, &cx23885_mpeg_template, "mpeg");
+	if (!dev->v4l_device) {
+		v4l2_ctrl_handler_free(&dev->cxhdl.hdl);
+		return -ENOMEM;
+	}
+	v4l2_ctrl_add_handler(&dev->ctrl_handler, &dev->cxhdl.hdl, NULL, false);
+
 	q = &dev->vb2_mpegq;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
