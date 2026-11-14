Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660127;
	b=WDf00iloij0igI57t+ngvF5rb52WJKpkfWilEl2qwwm3MlBCEge0OFgZxgGSFf0Ywqep
	 AtVsQTRlf3zrOB9P2oiw5ufOYKSYsGE6Mg0CCISKjJhfojiOKK8n6t7jYH/1qfJ9Z3SVX
	 sP5m/P330sFi1f6RyaKircv8IJx/mVtT8eYkvMDQL/syxicCh/ZpSpxnZyXLYd0EsXV6f
	 Sqwuoj+bef/rExlpXYnx6L67eyWCiW69y66EV2JrR18wCpdRowqPOy8ykmxqOS1UFdHwk
	 mZhtPqDn4beP8LTBets+FYUv4zmM3Rbee6SWQ6z4Ur+XJb0hx/w04pxLSWcg9RBPXRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660127;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OLGP0ChfuX8yScgxhPPrkadHoSBbKqMfDAL47LIarJY=;
	b=mGLll/hfo2JvaZrhsG7e7UythEGCbG1Eh2OoVQuEkFkETVwldNKK7lFD8lX9gzGczbo1
	 X9hzfzcKqR+t93xXUP/hZ+UWMfwRCzy3SxVWzkm02CnsnWXPu4kTJofNpwoR3c/jsh157
	 5Kf629129VPX8wKNnspbe5XZWDVyWFZBW3ysGXK2FRfovfbSft0g9HfafuFKS43ONcE9t
	 Oo4s60Cq9clIHNe+Fz6qMRFcVKyfz7D5vDvaIEYZLUdZZts+wfQOrpH1m3AUMHBKEDkD3
	 wG9E8+wnnzhMi3XMIKFWqyO9glwhMHRIrs5Dn2fRHS03tOOB96Qu1js7ntAto94dxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CWqfabZr;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD92606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD92606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CWqfabZr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=OL
	GP0ChfuX8yScgxhPPrkadHoSBbKqMfDAL47LIarJY=; b=CWqfabZrfom59vS2zV
	20EWZL36lxB/9Iwl3gXvf/iwudvLVvgCe70v3RzfGEiqvnVphLu2nPFfWXvYqzDn
	zn9ELRPCAVApBjCcF0WzkqPC8H435l+94rd8B365hrjHDaeIrMICWMm0abbjKbnB
	9fx4ALL//vnm32mcgFMNygQSk=
Received: from Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD31SLuVvhqAxhDHg--.250S2;
	Sat, 14 Nov 2026 20:41:19 +0800 (CST)
From: Chao Xu <xuchao066@163.com>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chao Xu <xuchao066@163.com>
Subject: [PATCH v1] coresight: etm4x: Fix instruction event 0 enablement
Date: Sat, 14 Nov 2026 20:41:13 +0800
Message-ID: <20261114124114.5499-1-xuchao066@163.com>
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
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD31SLuVvhqAxhDHg--.250S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1ktr47CF48Ww4rGr4Durg_yoW8AFWkpr
	4Fkw1Yyws5Gw4fZ3y2kr1UW3y8Gws2kayDWrn5Jw47WF17ZrWYgF1rKr4UtFs7XFW7CFyf
	Jw4xtrn0qFy0kaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRJxh9UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC5xCq8Gr4VvBVcQAA39

According to section 7.3.30 of the Arm ETMv4 architecture specification,
TRCEVENTCTL1R.INSTEN[n] controls event n.

event_instren_store() uses TRCEVENTCTL1R_INSTEN_1 when TRCIDR0.NUMEVENT
is zero. For an ETM implementing only event 0, INSTEN[1] is RES0, so
writing event_instren cannot enable event 0 and no instruction Event
element is generated for it.

Use INSTEN[0] for the single-event case and update the comment accordingly.

Signed-off-by: Chao Xu <xuchao066@163.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db9e603f97ba..420403dc711d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -566,16 +566,16 @@ static ssize_t event_instren_store(struct device *dev,
 	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
 	switch (caps->nr_event) {
 	case 0x0:
-		/* generate Event element for event 1 */
-		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
+		/* generate Event element for event 0 */
+		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
 		break;
 	case 0x1:
-		/* generate Event element for event 1 and 2 */
+		/* generate Event element for event 0 and 1 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 						   TRCEVENTCTL1R_INSTEN_1);
 		break;
 	case 0x2:
-		/* generate Event element for event 1, 2 and 3 */
+		/* generate Event element for event 0, 1 and 2 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |
 					     TRCEVENTCTL1R_INSTEN_2);
-- 
2.43.0

