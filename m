Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396321E9919;
	Sat,  3 Oct 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015110; cv=none; b=b+bu/nsQIiEAK3qkQLzqnTdZKRgL3loJzp48gYweGSivpqCSZMYDORM2QLqO/B2fxLTvvu3pf80CmhsLllkg9a+CEoghzSAfXDBPvaO1FesYfldPbMAgCstM9+XC15GlRAh/Gq1PELtsv+DFTmlGA9r7J4u7N08SiFN68LEagtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015110; c=relaxed/simple;
	bh=s0egbLf22DEJLAI9MUX4/iGOtHw7ofVs27d64xKhFiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HCEG2LJqGlHffdeIai9wVGZHCXIUIUbrZdHg37fJ1M3XrdAZNSPhsC4myh7Q+CEwXTnnE9VJaLuSGwLyl8QLfuh0CGO5Pb+F3MjdBntd6kyzOY/6alpc/WZDB+s64rFsMTiY1WgnMGV9xd1C9W26/P7PV7Miq18RwJ20KBVwpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Rrx/wELy; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Rrx/wELy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Xp
	ytUYsbIHREcW3rR3ASQ8F79igHsf/ilJL5kw7WwcY=; b=Rrx/wELykLGpheelI9
	vEHvwGklptBRnDwU/50l7TDNHCnfCh4P5EL+NwZbA/irlMOLpdPsxFSoP0V/Fdip
	F1V0Z0wKctpZJJeBlvqEi8yJ2ox5HkqC+tHu4AbO6XFNe/4OstCyncbqE2laSpYw
	k4FNyL0gyonOcI0014corlnVc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCn7YezuMBqWl+ECA--.7248S4;
	Sat, 03 Oct 2026 16:11:34 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/2] media: c3-mipi-csi2: handle runtime resume failure
Date: Sat,  3 Oct 2026 16:11:28 +0800
Message-Id: <20261003081129.433041-3-yaojiale02@163.com>
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
X-CM-TRANSID:_____wCn7YezuMBqWl+ECA--.7248S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7GF1fCr4fWw17GF1DXr13Jwb_yoW8JF4Upw
	4rXa42yry7tw40kw4vk3Z5WFy5Cw4rtayUGry7u34xZ398J3W7tr18CF9YgFykGrs7Aa47
	J3y8Kw47ursIvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi8hLnUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRYmYGrAuLa+6QAA3u

c3_mipi_csi_enable_streams() ignores runtime resume failures and starts
the receiver before reporting that streaming is enabled. If the power
domain could not be resumed, this accesses unavailable registers and
the disable path later drops a reference that was not acquired.

Return the runtime PM error before starting the receiver.

Fixes: b63ef604a28d ("media: platform: Add C3 MIPI CSI-2 driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index b9e4ef3fc308..4731d58bf2dd 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -431,7 +431,9 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
 
 	src_sd = media_entity_to_v4l2_subdev(csi->src_pad->entity);
 
-	pm_runtime_resume_and_get(csi->dev);
+	ret = pm_runtime_resume_and_get(csi->dev);
+	if (ret < 0)
+		return ret;
 
 	c3_mipi_csi_start_stream(csi);
 
-- 
2.34.1

