Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586E392C48;
	Sat,  3 Oct 2026 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015110; cv=none; b=BoUtLA2xYFCCcLz/1MZMu1lkax9TmAz7DR5njwRze4FRL2tecTxgbS01Q+GfpcNQKf/6Oown7k3hrKc43HO0PQFcegYZ/xAdmYPK/bbvQ6bdSboylGENsSotWE9vYg/AIReuZRqKtgTT5JgWkhBIMhMToxbO4YGeJn2V72002NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015110; c=relaxed/simple;
	bh=sQLC8zAjHGJLTtq+pnIMl7Is5tZO7vXEI8lkBh9plTA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T6Qe6u77TXW72qEK7e1bL8d2VNRhFgWOr2Mpcof7GCx23FjE3tKFoYgogS6q5rHh1GCLDdqBp1iEwDI3dTc5SF6AqXzuZVzG/52tx9OI7e1/r3diay53bNNFJijmJHkYwbBepCT0yHqX7Y4z1yiNebLPpbyrynXAcnDJ14sY/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WEY5l4PQ; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WEY5l4PQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EH
	v60u5BuuA45V1hliEx+YzR1TmCrXnco+uFhbFt6TY=; b=WEY5l4PQtClAaFgcvF
	dtihg0ueLWAT6biNe0fqC/hw8heYDwEpNHFVfuKmD9rVnTiIXVvCLijUa7RNq/rY
	2ggmLC4jsP2ZugXE4Rz7uOzfbZGxLEURyStZVnIGhiBdO2OjG+SzfNt7ecKhqiAt
	8iJpq2XnskOkw8jiUiHN91y5s=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCn7YezuMBqWl+ECA--.7248S2;
	Sat, 03 Oct 2026 16:11:31 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] media: amlogic: handle C3 MIPI runtime resume failures
Date: Sat,  3 Oct 2026 16:11:26 +0800
Message-Id: <20261003081129.433041-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn7YezuMBqWl+ECA--.7248S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF15ZrWUCF1kuF1rJr1kXwb_yoWxKrcEk3
	9YqFy7Xw1UXFn7C3ZrtFyfZ34jgFWvgw1UurWFvrsIkryfZr1DGrWIvrn5Cw1UJa12y3Wj
	qF4DtFy3A39rujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiVbyPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRMlX2rAuLO+vAAA3H

The C3 MIPI adapter and CSI-2 receiver ignore failures from
pm_runtime_resume_and_get() when enabling streams. Both drivers then access
registers while their power domains may be unavailable, report streaming as
enabled, and later drop runtime PM references that were not acquired.

Check and propagate the runtime PM errors before either device is
programmed.

Jiale Yao (2):
  media: c3-mipi-adap: handle runtime resume failure
  media: c3-mipi-csi2: handle runtime resume failure

 drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c | 4 +++-
 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c    | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1

