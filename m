Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900377;
	b=UWT/t2EIZL0RBJeoMa4ykguND/StATAYqMft6bJZKIc3lJdg4Njw4Pd3J75xoAZJVMOs
	 RSRNg0a8s+YE/fBoHQWvtsEiVcQcDN/NoKnock0WKRLU+xu/EjNqWDoDVUMNYt4JJg+42
	 tMw1obPQnbjoM4V9RO3h84GDBxYOrf4GSnIuM0vGZGkfov1W9v5D/ATGyVBCS2yizb6GE
	 CV0vaBEYF5ufe+WZLOpofrviZmm1uXgus+7AucOadqtj007j98IaD5GLfubx4skbVHTa6
	 SXNCQoAKceC9aqiykullZQ14ckiSXXFEhbi3TKEttrsPb14G6tKOdgtN31D0eySviag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900377;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=UBJSZai6LZJEAj8Sv5FqK9/FGZO5CCFa8xGQXFFlEMo=;
	b=ZdL1I+qY0PIfHUUrHBZQWxBA9hUrFWH+8+GzIB/22YLH7AS4csEWEmNtvaqNoXgMCjo+
	 QN+m2rLNZDrmFPqOAcKkNqOsZfm3g8W/GuK64LDYBjzrlh26vfdNlogduQYFWj18b+Qyx
	 i2nmnhDMzD0x8YZeXF9fNtSMCSUa4PXZXFmdlhsuv0y4OHu9ZsgkEpaWSUcRKX4kDvA5X
	 lSTE1rM6VbxhrGwXIcY997Vpp+eJEMUxJT35TMolT7BGSEPd64b8JS2LBb27rsJN0HXiv
	 Q9FhFHKBXJCbgpU2zKyY+xsdQYJ2CPeqr20ExoL7Mv7RFsoae4kZmXn/afJNCIsA0lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BrNlkFkJ;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D7606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B57D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BrNlkFkJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UB
	JSZai6LZJEAj8Sv5FqK9/FGZO5CCFa8xGQXFFlEMo=; b=BrNlkFkJnhUAE1n5nK
	za7jbdrmQ/DsNLCzC8lrezdtX4YwnHAxx0/T+G8YLBI5JNeTTUGV0YRoNyglsOWI
	GBZ9lzSXmsx3RVty9t5vs5OFUKUfAwhtpoTCZtjx2B1iRLwDUSC6gZXW/zt/ibSz
	ezkUErSrWe5wHWM2hFoM1EsZM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnbx3vfN1q1cyBCg--.48884S2;
	Sun, 25 Oct 2026 11:52:16 +0800 (CST)
From: Chao Xu <xuchao066@163.com>
To: mathieu.poirier@linaro.org,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chao Xu <xuchao066@163.com>
Subject: [PATCH] [v1] coresight: funnel: inport schedule by priority can not take work
Date: Sun, 25 Oct 2026 11:52:12 +0800
Message-ID: <20261025035213.3913-1-xuchao066@163.com>
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
X-CM-TRANSID:_____wDnbx3vfN1q1cyBCg--.48884S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4xJw13Zr1fJr47uF1UAwb_yoWkXwb_ur
	1vgFyfZ34kWa17K3WDGw1rGFyDt39I9Fs8ZayvgrWFkrnrAw43Grs5J3yDAan3urW8XFyk
	GF9rXFsYvr10yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZPET3UUUUU==
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC5xBts2rdfPCCEAAA3A

Before enable funnel, priority must be set. Changing the port
priorities in real time is not supported. If the priority control
register is written when one or more of ports are enable, then
the write is silently rejected.

Signed-off-by: Chao Xu <xuchao066@163.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index af40814ce560..17f985798d7f 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -66,8 +66,8 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 	functl &= ~FUNNEL_HOLDTIME_MASK;
 	functl |= FUNNEL_HOLDTIME;
 	functl |= (1 << port);
-	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
 	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
+	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
 done:
 	CS_LOCK(drvdata->base);
 	return rc;
-- 
2.43.0

