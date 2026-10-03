Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A38B39185A;
	Sat,  3 Oct 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015110; cv=none; b=tL/NsauryaEMqPgMTZE3yYWDhdrfQ7IdRss3PN11rtojBbWxUbdiVEusgZH2j5NDt0fzBI6qe4ak7sIHurS9rXZ653dfW+wKw/E9/3chRYPlw7L83MxXWUuSBYuHQENlcNLTrrvK2SbE1O+8nc4s6VsHuptphN6rnhYGx/3rkqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015110; c=relaxed/simple;
	bh=EPBiYH5WbqoOBg1HQh2rLqHHvr51QG+wz2zEEPsXjwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzMEVlBttK2ViyEaRbsfqAWhiLcG71nwakO59nOZ3rbrYCu3vIV3CiT6RjkjZWiS8g1SMKG3hxXNbxcjqIbJEdfsKQvryuuGnURWDBHJvrqZaQL2TQBOksQ8Dn+lmiKNiI3uoq09Xot8qVsJMchZd/ycny7MY4kjw5YIrTlM3cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dqUUbqlM; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dqUUbqlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pi
	rx4ZW8s0FaBkzA/ElofqErChmjGjQYi5NJ4sRjV2Y=; b=dqUUbqlMxXC5gntQ24
	k/vMUhJ0EW/0QytMNV0PhcI8P214K5Z5PWSG7YmWThPz6mp7Vy5tCvQ/eZfg1mXK
	3OamciYZkdRlDCtQf3pTjJpUPLhtVBEim0zC+W2AT7arXq6wF0z/RvfI0f/aQVvM
	yFHGDMw4DYc16rPpuOarBJJz8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCn7YezuMBqWl+ECA--.7248S3;
	Sat, 03 Oct 2026 16:11:33 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] media: c3-mipi-adap: handle runtime resume failure
Date: Sat,  3 Oct 2026 16:11:27 +0800
Message-Id: <20261003081129.433041-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003081129.433041-1-yaojiale02@163.com>
References: <20261003081129.433041-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn7YezuMBqWl+ECA--.7248S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF1kur48uryDZw1rAF4Utwb_yoW8Gr4kpF
	WkKa4akry2qrs2yw47A3W5WFy5Gw4rt3yjkFy7uw1xZF15CFn3Jr18CFyIvF95uws8Aasr
	Xw48Jw4Uur4Ykr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zENVyhUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRUmYGrAuLW+1wAA3Q

c3_mipi_adap_enable_streams() ignores runtime resume failures and
continues programming adapter registers before reporting that streaming
started. If the power domain could not be resumed, those register
accesses are unsafe and the disable path later drops a reference that
was not acquired.

Return the runtime PM error before accessing the adapter.

Fixes: f0d2d8062cc8 ("media: platform: Add C3 MIPI adapter driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
index 4bd98fb9c7e9..750b301f4bbf 100644
--- a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
+++ b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
@@ -455,7 +455,9 @@ static int c3_mipi_adap_enable_streams(struct v4l2_subdev *sd,
 
 	src_sd = media_entity_to_v4l2_subdev(adap->src_pad->entity);
 
-	pm_runtime_resume_and_get(adap->dev);
+	ret = pm_runtime_resume_and_get(adap->dev);
+	if (ret < 0)
+		return ret;
 
 	fmt = v4l2_subdev_state_get_format(state, C3_MIPI_ADAP_PAD_SINK);
 
-- 
2.34.1

