Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186D546EC86;
	Fri,  2 Oct 2026 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931473; cv=none; b=E6039ivoTLqmC01JAPCEIO05o9qeQnujN/Qw24pNJDgtC/n2dAeUv+RpUqJ7p8hbQM2So6FzwyDe6mZbGA+vATS18FtuLdDenwvXv7AGfCCubQlJstTr6bTMMqEms3nsUhvxysHh9K7e0XUp8kR3JXVhy93ll6YK0aCsNMCt8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931473; c=relaxed/simple;
	bh=ojHmetZ9PkPuBLBVViyCU+ykWzQNyo82QiGwO1fyjyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrYid+RrmoUH12oXF8JK4TewsmbbrBtJKx9jNQ5qWDDmGSiO+EzopEccMf2Foac9j5IIty7m63S7kHs24S6HpEMK78V2WaUOZZ6XCd24jU4lk2Dc852ahHVQ1h9rYaRAYqZRJ5rO1XCxPXtXP8fmqXwCJL4ZUSnF4zVPyHK+fCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0syQMrh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0syQMrh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC02AC2BCF4;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790931473;
	bh=ojHmetZ9PkPuBLBVViyCU+ykWzQNyo82QiGwO1fyjyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W0syQMrhgc/GQsPm9h2H9NhdBtSX46Dv5mMuuV5N4iFt2CVH1rcy7Tp5LWkt7hduf
	 OP/khiW9peHxWnrOKQSo3rrFkwa9Z+Qob6SUILMARFYLJ3f+xQu4FTs7XZW2XYxU3j
	 S0DquOD4VNsVbWB55UqAgdTCK/k48/6WRbnuVPEbD4eYtLbKUmkKHzYCwi+3lXmypr
	 9hz9UYfrpxmcSy9tEf1knJ4OhS844eWF8EuxprcttErL/ifUJJpzJYxMLFKCA0l+fC
	 UnpUzAmPTZ9DFt3X/Pk6VxcE0io41EQJ6Bi8Y+P/yyGuJ/23jwRLzA6+1pnaWCl1mX
	 3xd7kQfQBcaJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA253CA5FE2;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
From: Maurizio Casciano via B4 Relay <devnull+mauriziocasciano7.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 10:57:49 +0200
Subject: [PATCH v10 11/15] media: ov2740: release group hold after gain
 write errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-submission-media-yogabook-v10-b4-final-v10-11-817ec765b257@gmail.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790931470; l=2378;
 i=mauriziocasciano7@gmail.com; s=yogabook-kernel-20261002;
 h=from:subject:message-id;
 bh=9PXvaAP42CHg4TjVkYrsaCUcOWYiL3Jo61bccDNs8zY=;
 b=IHhihaYFNMuTgKBJINC637ZaAlzhzWN3luTotJQwMMmCEv3g5iOPBTne1mie2jeVtQiPF9gpJ
 JB/fiEbHJeLABL1WTvWBCjuM7k3Ux6G6hHACv158derMTzrruKRfI1y
X-Developer-Key: i=mauriziocasciano7@gmail.com; a=ed25519;
 pk=ODC2oSPBqt7ukC3AEDZNS7LIE21D8ke8TEHoNlxniNM=
X-Endpoint-Received: by B4 Relay for
 mauriziocasciano7@gmail.com/yogabook-kernel-20261002 with auth_id=1099
X-Original-From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reply-To: mauriziocasciano7@gmail.com

From: Maurizio Casciano <mauriziocasciano7@gmail.com>

Digital-gain updates start a register group before writing the red, green
and blue gains. The current error paths return immediately when one of
those writes fails, leaving the group open and never issuing its end and
launch commands. Later control updates can then be accumulated in an
unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
Cc: stable@vger.kernel.org
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index ca33ef30267d..4479666f17f7 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)

-- 
2.53.0


