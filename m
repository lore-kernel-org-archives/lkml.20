Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552EF58F06E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965991; cv=none; b=Uf0wF1aSfZVgbVOnH6INA/mik9uqYN5+07jaHqF01XEBs3Zf+ykdgG4UsDEKon/Lf+6WzW307vrH46Py1rq2LLQ0AADl4e4M7k4EkUPyGjHS/jbIiFxMSajndUZb06tPjuok9ECFneSCtwMDH2PPgrXy2HLg1b8E0ojLZAHRRpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965991; c=relaxed/simple;
	bh=D8twqLykkH/3utuoYpG6eBQDJ2BzqNr4M76mpcFNAhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEqKrkL+8IZJZLukY6g0mYuRYiM74fWrZGyfsphCgdjLTji7oX2n8TMYpNgbp39oP/BwkL/2ul3NymtP+lmAqe+Rvo26C8EDq6o2JNS4yrtuKR2matV3R4YsLDCg7msnC6eCivY0o3q6MpCJfALZFeUlHVRt0piGGXVaroMEpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nuf5b9s6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nuf5b9s6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62941F00AC4;
	Wed,  9 Sep 2026 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788965990;
	bh=prdfQnBIquLm6bHsocxwuwWszpCsKOGj33SNSy8JvEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nuf5b9s6ynr8wELijxv45dZPQ326MGFuV3pd9dbiRGgOnPnkUuxf4zkVdMhFE6wZs
	 qJvmTku9vgRhsuDOhmZX/XVrUNp3pV6LMhJr/C9Te4QHJqM3PXnwPbkk1z2pxMRGyc
	 of+iKhdT/ciUB/CMyxrlF9CQrCZUv1IeTb/wGwwil81Yps+8Ggtdy2YwrBs+eM7mCC
	 yvJEKliyD1Ttlfu2Bqy+BkLQmGOxHBKW3edA+v3U6jCyZ6vFWk3HtZaperZUtq/OmE
	 uWJOYNoKcbytbM8LwWRb2RhF1nXVGtdhI5bWEIvw+FM5tvM7bcxB23F8ObjREXL7bh
	 n0Mi9Y5W2y4wQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] regulator: mp886x: check get_voltage_sel() return value
Date: Wed,  9 Sep 2026 22:39:56 +0800
Message-ID: <20260909143957.9284-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909143957.9284-1-jszhang@kernel.org>
References: <20260909143957.9284-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The get_voltage_sel() can fail, resulting in negative error codes
stored in unsigned integers and corrupted state logic.

Fixes: 97be82880b61 ("regulator: add support for MP8869 regulator")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260901043123.5401-1-jszhang@kernel.org?part=1
---
 drivers/regulator/mp886x.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
index e0b62bc02a1e..bc25cba33c8b 100644
--- a/drivers/regulator/mp886x.c
+++ b/drivers/regulator/mp886x.c
@@ -256,6 +256,7 @@ static int mp886x_regulator_register(struct mp886x_device_info *di,
 {
 	struct regulator_desc *rdesc = &di->desc;
 	struct regulator_dev *rdev;
+	int sel;
 
 	rdesc->name = "mp886x-reg";
 	rdesc->supply_name = "vin";
@@ -277,7 +278,12 @@ static int mp886x_regulator_register(struct mp886x_device_info *di,
 	rdev = devm_regulator_register(di->dev, &di->desc, config);
 	if (IS_ERR(rdev))
 		return PTR_ERR(rdev);
-	di->sel = rdesc->ops->get_voltage_sel(rdev);
+
+	sel = rdesc->ops->get_voltage_sel(rdev);
+	if (sel < 0)
+		return sel;
+	di->sel = sel;
+
 	return 0;
 }
 
-- 
2.53.0

