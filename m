Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45FA48BD5E;
	Mon, 19 Oct 2026 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398495; cv=none; b=cuanzqSOOwhy9UWXOeFNEP6yiZA31rBLXnf7s1xckYdeuNlKlaxIxbNmleTCtpQKaMYLPIXqhiXaR8qkvxqVlmcnrZjQsnbvxdqBf3GEaOXa2nVU4ETFgKbs2X3nQBGeM9yOiqSi6YZr3+QeHWCQg0RYYiLQdd9McM9Jr8DxGEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398495; c=relaxed/simple;
	bh=qW5MnbBEMI8M7YzjdENpCjkoUJ3AxTh3jeGmJ6S+JW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f7v53flTgym4t3O74IbH66b35W5LI6Poj3HwP9vY7ggv/QzxKZ13i1BPZzIn6aR5NVImgr66tFfMfrvh+MwdvGLf4u4sESrnxkNaFacmQhkYJnQP3cENJJkjnxuUpuWfI69imWslw1A6mtWrUQu9rMjdDxSevB3/4Onx4jHUDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OfxOGuku; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OfxOGuku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Lf
	sJqURvb6ojx1dXkNHrC2raxVgiZ7FHMcGGyqxaCD4=; b=OfxOGukuDg4deJBoBb
	XeofWHOXa1qhfhIfuFy9T+VQvgixwK7R5iRB+jjNbkP67pJko1L4e4GQwS+e9Gs8
	q9pDM+GZs5eGLCyplBDIcaEN9GyoUeNVZ/8uwe5XtvD0a8STKvWIHYTx66WNT5VM
	H4ZlZMotNagK/WS6kcIzTZs5k=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H8GM1NVqEBsIBQ--.60267S4;
	Mon, 19 Oct 2026 16:27:59 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/2] media: amphion: handle debug runtime resume failure
Date: Mon, 19 Oct 2026 16:27:54 +0800
Message-Id: <20261019082754.1806443-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082754.1806443-1-yaojiale02@163.com>
References: <20261019082754.1806443-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H8GM1NVqEBsIBQ--.60267S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1UWrykArWkKFyfGrykZrb_yoWkZwc_G3
	4SgFZrXr48JF1Dtr47JryfZ34IgrWkur1ruF1aq3W3Z3y5Z34DJryq9rs3Zw17Zw48C3Z5
	Kr4UKF1xCF9xGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UGYtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8A9oomrV1I9h0wAA3j

The debugfs core write handler reads the VPU power state after
pm_runtime_resume_and_get() fails. The device may be unavailable after
a failed runtime resume, and the final runtime PM put does not match an
acquired reference.

Return the resume error before taking the core lock or accessing VPU
hardware.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/media/platform/amphion/vpu_dbg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 497ae4e8a2..fff4df4f45 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -382,8 +382,12 @@ static ssize_t vpu_dbg_core_write(struct file *file,
 {
 	struct seq_file *s = file->private_data;
 	struct vpu_core *core = s->private;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0)
+		return ret;
 
-	pm_runtime_resume_and_get(core->dev);
 	mutex_lock(&core->lock);
 	if (vpu_iface_get_power_state(core) && !core->request_count) {
 		dev_info(core->dev, "reset\n");
-- 
2.34.1

