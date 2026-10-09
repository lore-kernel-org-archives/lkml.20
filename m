Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A6B4E13EA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552985; cv=none; b=i9eKBTtGGFZorsJOhiLB4EosIyxPpKS6RSQSuAU4+p8BLVa6Mf6SoanT6/0+jdiVRE4j2RNpM0IgCRrYqgucnbDX9qAMgTcSgZ3IVVIha0ipi3YeqzJ9c9uqWrBg3zAEJ6INxci2N9QmhGsdL2P3jSqmwIfdi9aXY1yYV85ptPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552985; c=relaxed/simple;
	bh=NT3qx5vGtTcBOqmB6Oy3LSJ3xeFGYtKMsidrXboeJMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4PJtD0+wd2MWeGCB14HnpQkB7/mIogHWLNkuzHyyDgoakOKZRIKq4/2JuxAcO+5Au+4iALEii6VJyokB8kmrm2OT4laZ7NgA2DWr8K9JWZhMKyfTd6ZgR+QlwbMpf+Cykz6yACJ9i+CdQoYl3eam2aZ3UYazuSLk0CajfwgATQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e82462a3f1so9169175ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552983; x=1792157783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrCjjh5RLBECWwL30aDBZqZ5pEoiJnI/InLjq95dlJo=;
        b=bZU0Y8MJCKc/FpRtO+uPQZ9xi2qartVmalI29MGT/kjnQYUJ2cxHR2OW1NqFsH9V3V
         G3OZIg/8hzQpoNFrILKRHPCbPt+NWmwfVC7s2npff48ht57N/TQjaFqWGkygX+U2OOYy
         nTAYJbZaMbBeGch1Asmn92g9xXrNsHk3fVsLix+DCJ/AcewNDWHQG2HyePtAVDdzogIW
         LoXkEJeS+PHf0hN/x4b3sZKnXMYecoje6NJxF8MU38NF3kRFXge2S8vSQIt1/AAkLQ/M
         r4nSyv2aSZ1W5O3JAMuRWbgbh8ft7ftpSCpMg5a3L8o2CaRVeiZI3Fx7keau4WT0ieeJ
         wrYg==
X-Forwarded-Encrypted: i=1; AKwUvBwswrEbuKDQXvjer9xj6dOz00O5QZujCSWnligU5CJsoEUEQaraK6UiaukgD4d/nHeSVbT5QpL7tJQrLSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNLszvp2/Mad6FmmyRlGrOV+JxCLHBTgrnMfKEeN6nwcnf06+2
	bzvyiRdlnhVWunKoYiX7foeeZvi6t3TDEP+gTcBhnzAqs5JjdQW18fF9
X-Gm-Gg: AYBFou1KL3qUDEwX2bFNkVO+Q5hHDXkb5zKEaKatd6mm13Xg5V16m/lQlCHyBBcQah8
	VPj+0ZxRz67UXJLapMxE+gX8hu1LtayiUPOrnTZOG1U9vWFIfhcbMtb5ho8r0l9DdG9jMrM84J0
	k8Gki6Jj5AdGkrG2FSOr8QKSfdTby7XORaty75Jq26Oo1TGevnk36cWC25aiL4Wh+nega8qBiW5
	wPJUHrSaS+glcS/WOj5Ke3KV5SXxIUMav4bELshDhb4Yck6C8hEluR9qCEtnY94PfG5JSvNEHLv
	X15DhAVJiTJ5/OsLZ81byhu5dOWXCFFSHIw5fpglXG2gyvNL0mM1qVbCbCuxcQbc7is7813iCJW
	ZlOtEOOuq7MqBVTztXlFp/d0w9BSM8kakoVmgm7N9myCLV/blqUskGJry4wsW/L9f+WjfyPOB5U
	RG2DtCbPtmXT6KuIHrxURmlGaZ9mJmu0N3SJxcnEmfNdRu8E3DbvcpKUCCE6mw
X-Received: by 2002:a17:903:40c5:b0:2e5:7b60:981c with SMTP id d9443c01a7336-2e842715c75mr17983665ad.0.1791552983044;
        Fri, 09 Oct 2026 06:36:23 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm7656985ad.15.2026.10.09.06.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:22 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 3/5] spi: tle62x0: Use kstrtoul() instead of simple_strtoul()
Date: Fri,  9 Oct 2026 19:06:07 +0530
Message-ID: <20261009133609.579046-4-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009133609.579046-1-code@aayushk.dev>
References: <20261009133609.579046-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the recommended kstrtoul() instead of the deprecated
simple_strtoul(). Check the return value and reject invalid values.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-tle62x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-tle62x0.c b/drivers/spi/spi-tle62x0.c
index dd8bfb3f3..986d78ab4 100644
--- a/drivers/spi/spi-tle62x0.c
+++ b/drivers/spi/spi-tle62x0.c
@@ -151,10 +151,10 @@ static ssize_t tle62x0_gpio_store(struct device *dev,
 	struct tle62x0_state *st = dev_get_drvdata(dev);
 	int gpio_num = to_gpio_num(attr);
 	unsigned long val;
-	char *endp;
+	int ret;
 
-	val = simple_strtoul(buf, &endp, 0);
-	if (buf == endp)
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
 		return -EINVAL;
 
 	dev_dbg(dev, "setting gpio %d to %ld\n", gpio_num, val);
-- 
2.56.0

