Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA0443E52
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148349; cv=none; b=l3EuLxl9e81zVTYG0/MjXgq3q5gr2wWZdoE9htQGhCQC9u/LVi5rQt2hTrkn9ykfWo9C7NReCIRQLyoqWnUp99Rpghx7kjZvvUX4I98ewKaGTVuZeWcXqJlBsSLMUTjJ+3iJjZGVmBkO52+nLqGN7dZyp6stCc53zVQRu1o43EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148349; c=relaxed/simple;
	bh=FMFvu1leO864za4bNNq5n0XaGNSTdbX/fyBf1f/TriE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiLmroxAYUDU6oJhlWTuiTGiDD1T5fkEsf5CL3FxSQL38iSpEHB+DZLaXDxJyVadL4HrQiQ6dAAnn7Z2Jy9H6CIk85uar+z/OCIYz9WAxKmWG9kSfkgYcF1hHsJnAZzAgnCJC2BaznXHRkocI69DRZqKFTgSk2T8s2o1eXnfOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii2yvOxv; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii2yvOxv"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so354473a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148347; x=1790753147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayvYqvX3S4e1/XKaNC/+yD+owT/i5dd1ypLn+dC7fQg=;
        b=ii2yvOxvVByI9QX0WcIV1QTs3M2ejg+bRdz0atp3CeFyTTgs3C6UCtIOvqpONTkOjt
         NqgcnH9tv4c+QCMq14zNyQBnCM9hSEW+ZtSHQHteZHGxu2P67ivojFQJF3udcZWey7sE
         8rxH/djyX4WTjSw4B/5kLsEzbUX5LiFRlGrqKNznWi6RXS2ApszyiW0JjJ6Vw5UNRp5r
         QL9AkQNzP4+4ESwJ0HHff26pGR1XTb13Il1KFY0U3C390p9WhUyV/X3c6XG5jf5aXRG7
         XHI7MNjZCukqoElpU6+PJx7RFvZFOF8xKR6+xUFlFqn7oOXJCizpXptdv9Wt15KqboCU
         Uj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148347; x=1790753147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayvYqvX3S4e1/XKaNC/+yD+owT/i5dd1ypLn+dC7fQg=;
        b=daUvC+VbPRirlOwRmdTfovORugjqvk77KZ9DCM9osbUxFroIaopGWffxNTzRqn7hEo
         H8kT8Zq2YfdoPNWpZ5ekfNJtMBNcs2vKbxO2W7vkKKiMN3kgrDb8zjEz2wYCMWsyY0su
         4fNphLkFKnOSH4ewmYH0biWOysxS2UH6hfC/NKt2ojTjxBIAiT/sC5Bm8m7+ZD8kIUbc
         bpsBWPuocz+B8jE75nI5EUWOQLJpkyKT2QebwJJB+wh08yU4ahukTlhZo2Zh01238A9b
         6shmsv4/enlMUTcn+G3oI71aXS7KPzbz+gymDTz/sGcvMw+qbCdixnR8SLaRSCNI2w+g
         Echg==
X-Forwarded-Encrypted: i=1; AKwUvByfOSXicxHCcHzJ5hRRyehYZFSWCzh2svkUD/1plWoiKspYjJatjoOsA3pCipQW6QWi+upr5Qv9x5pSXjw=@vger.kernel.org
X-Gm-Message-State: AFuF++l3zEqyRHxXSTPvz+GH7FHj1cyk4QPujqTEe50/OWyOMsWgzSxi
	/FSUxe69Pj69AexamDZZdT5MOiZ11YCMnVqeC6etDFjhgTA97OobYMIw
X-Gm-Gg: AYBFou1xJP+uyCSr5oav6alU9w7rFhcXzyyxVzzB+ZHb5lraAREYGXs+j3R6akCkw3h
	/AB+mW/X+6gniuzklD8QK3cUuzTp7/7ck7ltgryDUxl+6J2S52QxXIXZW/EzedeDLLrsdrvfjau
	zsJrSzlcQ7D4A3H2ASREUZ1o5hqHbI6rY4PZyuaLq1N84afGnCF3PUIIwOwvxpx3AWlSCz4Kloo
	jbs8xbJgFKYwayL13bj88OVKiJd5ejQvU3IEzAVFF1WXy9q1wL6dlqUHkN+ZVMSomKUMIO53Xdu
	PfDlGEoMxbdSOav+LjwSBFtQOCVPk5gd1JsdxL5vKfldRqubXhqYaJfkZFNEsmE8BNxbRFeZ/Nx
	LIibhbbLXjs61OGZP/W0bVAfsTBwlOF/AAiZPEvPhTZ9xEXtbGZHfxRXKmZ3Z9+wjLQVyFhBmhq
	jMHG+aJGLMd/ZwGCKDFUT8k11WBWNGERVKoFERgKwKGcxz0YXys+ncog/oFInPcvatRpQyT+ahu
	J67ueWE3UH9uaM+YtVmfP8tmZl24gthRq5flMnknhDP4RR5H820uUuZN5pvSW3Apni7OASKEEMK
	MlUqByzUdCYPDQ==
X-Received: by 2002:a17:90b:4d0d:b0:39e:6a81:5a97 with SMTP id 98e67ed59e1d1-3a07e716582mr1529832a91.43.1790148346921;
        Wed, 23 Sep 2026 00:25:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db88298sm3940945a91.4.2026.09.23.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:25:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] dmaengine: ti: edma: fix pm_runtime usage counter leak on error
Date: Wed, 23 Sep 2026 14:25:31 +0700
Message-ID: <20260923072532.19307-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in edma_probe() does not call
pm_runtime_put_noidle() to balance it, leaking a reference each time
resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message: Change the function name from netcp_probe() 
   to edma_probe().

 drivers/dma/ti/edma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index d97db5af3555..8be9e71dab76 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2345,9 +2345,9 @@ static int edma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ecc);
 
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync() failed\n");
+		dev_err(dev, "pm_runtime_resume_and_get() failed\n");
 		pm_runtime_disable(dev);
 		return ret;
 	}
-- 
2.43.0

