Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06DA39A812;
	Fri, 11 Sep 2026 06:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106964; cv=none; b=nIeXu+t31HiH/bGLlZFiVyBZLjiFgS+RZMJ+A2PpnzNQqNRdihBjayKhMYyZbJizT3xjiDT3PBT4W7/MsaP6ySpTK7oms2Bh3T/BlpfNFZqdTTBTczaOrHg8PMWQjB9IP2i5djDho53oSp1vx7r9l5HqmXSToRbxZkV+NvnG2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106964; c=relaxed/simple;
	bh=AXCXCtQftG4PGWzUvWP4IJTw83Vc12C+3HBPpJAsGHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E5ikrzr9YEPrlczcKAAX3n4ouswtROJwhBI/OHJFXO9CKdf8Le8tuKx8cmod2Ctcvbim1rXC3ZnC6f2qqdbmlvIe/dZNxLTudJ5p3w5RgjvskJH2Dzw2qc+nRNmB1+HToq3cjPuNlcw/5Uc9hRCPxX2SrzZOfsWQoxoZFoFkWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=ezvt7e5L; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="ezvt7e5L"
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fac;
	Fri, 11 Sep 2026 14:09:12 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] media: gspca: mars: validate controls before setting flags
Date: Fri, 11 Sep 2026 14:09:11 +0800
Message-Id: <20260911060911.94246-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15991e03a1kunm88bb99a41c732b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSBhKVhhLSUhNTx8aGR0fGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=ezvt7e5LD9GW1y+xyVxzDxscyyERDt4/fH3acf/CGjjUcIeOaUPb4a7qLosez/QgPYK3pkcICwz1X6bTWfAYmq7d+Qg29lzrSph673VX5gLQNeyESys0g5XxGkz99d2y9VY8o1YDR0vPkBKAIL2mTKfWKFteRzC54QyNhsYqTi8=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=ju3SDPssSrqq4FdDgR3LYumX9aRA6tqAP3PO1G/+uDk=;
	h=date:mime-version:subject:message-id:from;

Both illuminator controls can be NULL after a handler allocation
failure. Set their flags only after the existing handler error check.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 98684298f9ed ("[media] gspca_mars: Convert to the control framework")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/media/usb/gspca/mars.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/mars.c b/drivers/media/usb/gspca/mars.c
index eb9342ee32af..e3b0af11be15 100644
--- a/drivers/media/usb/gspca/mars.c
+++ b/drivers/media/usb/gspca/mars.c
@@ -204,14 +204,14 @@ static int sd_init_controls(struct gspca_dev *gspca_dev)
 			V4L2_CID_SHARPNESS, 0, 2, 1, 1);
 	sd->illum_top = v4l2_ctrl_new_std(hdl, &mars_ctrl_ops,
 			V4L2_CID_ILLUMINATORS_1, 0, 1, 1, 0);
-	sd->illum_top->flags |= V4L2_CTRL_FLAG_UPDATE;
 	sd->illum_bottom = v4l2_ctrl_new_std(hdl, &mars_ctrl_ops,
 			V4L2_CID_ILLUMINATORS_2, 0, 1, 1, 0);
-	sd->illum_bottom->flags |= V4L2_CTRL_FLAG_UPDATE;
 	if (hdl->error) {
 		pr_err("Could not initialize controls\n");
 		return hdl->error;
 	}
+	sd->illum_top->flags |= V4L2_CTRL_FLAG_UPDATE;
+	sd->illum_bottom->flags |= V4L2_CTRL_FLAG_UPDATE;
 	v4l2_ctrl_cluster(2, &sd->illum_top);
 	return 0;
 }
