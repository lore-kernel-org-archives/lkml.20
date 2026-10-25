Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792934032;
	b=ELWB56Dw3Plhf4i1eqEqxbfJ90m7IkO/vZSbanLcS8R4Jc5nNGWyRU8btkvOJ8vHVh+Q
	 JvxA59SUeHXO4Qz5l7E3a39Itr6L4Qj+zPFVWE/y2pb2EWMkOSO4OLhycXFqHgsiZ7XJ5
	 DTHVoO7dtr9+mkAEnlrqL4meCR4fQFjQpxzmcvJuKS/+x85cv2bcg2LlxMfYEN6pz06Mt
	 Kch8Nyd5g5er6TnixxTyFRuCZtGxErsPbMzEbwvxJQydrRJFIRzmwpHWzh9uqCy1aQLTH
	 n3GbKxw6SooszufeijT3eX0IW86ivUHS+m7ZaM3GGexPGs2/qhnjgjAUjROMtjFR2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934032;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=UBJSZai6LZJEAj8Sv5FqK9/FGZO5CCFa8xGQXFFlEMo=;
	b=LF3lwfM6qK5037wFPPVH+4yisfGv/LMFXG72afspfbVkEG0IcqCFbKxWhC2xXDHbKbxM
	 UsvnrKbJaO/z2V/JluRFzbdKRgoFrg6Tt/6POskw6hFYnTPlM0eTUh9gJW4o+xe7Vb38e
	 kk/wfecySYXj3DmhI4voYuPKK1I5bjMs4Ya84ohJUAo22ku+IpR9vA+ZCgfQO0YWP91sp
	 1iZ9CP65IFGvey4B5R9flLVjJUdBlq8vIb4LMDZBOmB9LeygMGRVxl+pgbX3FxVqgUZva
	 o+21rr3nVJ45mTfw9CfpqFTkNw3Hluv+6oFahvIrJqS3+zrmbtM5Xn6FLR19Y8/qRvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gkcc0+0j;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4059606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4059606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gkcc0+0j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UB
	JSZai6LZJEAj8Sv5FqK9/FGZO5CCFa8xGQXFFlEMo=; b=Gkcc0+0jNn1bOGfEvl
	MKguBtSwqxL+Wgj+JhX6Ak+OGI0JD3/D5J3xDCmT1b/UzxUxFtbP9oyanFmrE5XY
	cwJjY39NZvIJJKkj3udSj7NtIz1xPHU73gQcONOYjCwupADsaL4tA4NG2u1XM+2P
	qoBk0qM5yOuJjdYqa62QQ6Tjg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD339ZmAN5qYEOtCQ--.15842S2;
	Sun, 25 Oct 2026 21:13:12 +0800 (CST)
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
Subject: [PATCH] [v1] coresight: funnel: inport schedule by priority can not take work
Date: Sun, 25 Oct 2026 21:13:07 +0800
Message-ID: <20261025131308.7158-1-xuchao066@163.com>
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
X-CM-TRANSID:_____wD339ZmAN5qYEOtCQ--.15842S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4xJw13Zr1fJr47uF1UAwb_yoWkXwb_ur
	1vgFyfZ34kWa17K3WDGw1rGFyDt39I9Fs8ZayvgrWFkrnrAw43Grs5J3yDAan3urW8XFyk
	GF9rXFsYvr10yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM89NUUUUUU==
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC5whssmreAGj-MQAA3j

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

