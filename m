Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1D379C5D;
	Tue,  1 Sep 2026 04:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238272; cv=none; b=L1IO20JYWEN303AdL7oLssK6146vVPPjsEM6l7AvcbBP1kmdxZLQ1pAuifNswm22POjxi10USaj6xK+nWK8FD6mykIeSG3ohbtpzljTD36hT/eq0sUEsU01k4LbZwhVxEZk44sMTGJynhjZBMzEiovTtAWDxHygape3UClwj8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238272; c=relaxed/simple;
	bh=wqzYe/YRpy4q0I9qf7Y6/McgEc4YVuXA42RQYFJ9Tjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAVieIW4ND121E2imm+wjzUX5DRlPn9BI+cwVcBlEnIsTJTFntvgl1pAGqmPl31+YYuTNu2BeSadE8hM6OS1FrR537imdpmY7mff1NvyMv5EPwVOQe0DdLIbw4N/32HavQgXPdApMvKB/OdfVkryjPCZSZGbBy1jjEASlptcPjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tqgca+eW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tqgca+eW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DBD1F00A3D;
	Tue,  1 Sep 2026 04:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238271;
	bh=rtXV2gFb6gj/G6sjgrL9csr6ec+pNK8SZbRyvgyi5bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tqgca+eWIh64QeTX6RkUbVxECYURenTTyWSJOVTWksPOj/z0i6/6eL/i0p4bP1XHy
	 AM6Aj4mbiLplIgr7bWs7OF77f8jcnPGVT85OauAUcppYUnrQZuR7pSQ2dL86mdiZNe
	 s/+TirQ1rGIRii1jDSrH9qxrpDMG7zbdpGojDj5E6USYyGAoYoCKWB7kCMbhB33TBl
	 6Sft2COHCTHrrhyuSzqRW/aRMWZxFBdzHWkJAECDKvH6mUEEi63maJrF8vTwBsYQT8
	 wah2XeGneIucvuxPCrb+N9hBHI+Smiv9aCrAz+B5+LChiJB2mM5vykRMRAPvodi5q6
	 HQtKedJQB+AJQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] regulator: mp886x: fix vsel_mask
Date: Tue,  1 Sep 2026 12:31:21 +0800
Message-ID: <20260901043123.5401-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901043123.5401-1-jszhang@kernel.org>
References: <20260901043123.5401-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MP886X vsel is 7bits, fix the vsel_mask.

Fixes: 97be82880b61 ("regulator: add support for MP8869 regulator")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/regulator/mp886x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
index e0b62bc02a1e..a10f3a20d413 100644
--- a/drivers/regulator/mp886x.c
+++ b/drivers/regulator/mp886x.c
@@ -267,7 +267,7 @@ static int mp886x_regulator_register(struct mp886x_device_info *di,
 	rdesc->min_uV = 600000;
 	rdesc->uV_step = 10000;
 	rdesc->vsel_reg = MP886X_VSEL;
-	rdesc->vsel_mask = 0x3f;
+	rdesc->vsel_mask = 0x7f;
 	rdesc->ramp_reg = MP886X_SYSCNTLREG1;
 	rdesc->ramp_mask = MP886X_SLEW_MASK;
 	rdesc->ramp_delay_table = di->ci->slew_rates;
-- 
2.51.0

