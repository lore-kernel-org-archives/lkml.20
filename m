Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AEA5581E9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959663; cv=none; b=EA35TiUCwYx4m6X0/JdGztNIPGq/fcblJ64Og74NSVNrG0coj39TtvGpb0d4RmWsp/HvaQOPV70YkQxZA9mN16nKYWeAFBNmB+aKEglQefzzpdtcCRXrtwkH/QASDuxXq4gsDRcz87sjJHo01zgX0iMtRx/qi9MjZc55z1bGhG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959663; c=relaxed/simple;
	bh=AKMhHGbu6wwvL+v2qkm2nawtiZ7eESFgO0bgi+Z3x0A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QTZ3ZT9nDk9ftPunm/D8FUjPVjodd1tlaept2CJXrPNcsnDvw/Zt7/FlLQ+VM+7hdVS/SC0Bn4m6Pif9iGcuTc9wptGDY9dva6k+yCyUVxjTnNBsSRfFXTQjFETetZj7eYLs+AQF1cdJibQWI95DxZEcALCoAO3/r8gzVHcu7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMuTJuxY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMuTJuxY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d91ded8174so48131985ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959661; x=1789564461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdxIn0BZ6mG5tW5oexMUWl9FnSMl6rOPl062FM+q3lY=;
        b=kMuTJuxYud2pWYrlAeE1qFoKIICjZEfX4ZWH1xelAplZn80UeBI9ceYg4NX+w+4IZN
         ia5gjvVju7H49ho5zLId1YljbBND1CnD7RKPhmjbkEFa/b1Wpk0KI84RgKai0mn8qQqo
         ApL/D8UTTHlif+h6L/GIHOG2guA5AO0U1BEsKzEAk/uhY8IsRlDmFT4wzJtNKgBt7yMP
         xI41OMZ1C9fxRYD1h3EGU2pLxDB6CDJVdSn6zKgP/lYs4yg+lvK7nVuwx4bfzaNARzsV
         PhQfsxf9waTZID87kfP90ZLYju5J8zTbnAtPM4DTmoTLlaDP890n0JZZOyGh2SSzP4g0
         b/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959661; x=1789564461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdxIn0BZ6mG5tW5oexMUWl9FnSMl6rOPl062FM+q3lY=;
        b=hVfhDEgK82pifrKs4KyeKuUBdHotwTSHL+s8wgWLCGgcZuKJo3aKWRp2ZPa1//ZZeQ
         nRznpJlVtDoLYU2UfDZCWc0yISlOdQNJxX7t/Gm4aSObTVxQufInI9/Lsm/4rjbP7T1f
         XYJWqAETDHTaY+VY7YrVvJAjgE9NeyYfo1p7eo2HZLSHUsvQYiifZPagrFTPeh+ThZui
         7OlAX/+vYoeQzK8iQuZEItJNfIGQ8AMG7KRosJbDMKXPKNqzZE4U4wk2tXStKp5f7fpd
         IXEirZGWkdu5rKMBzu+leQTSh0DghwggostOVWVwBpvcJ1B3FgaCA+gsfRiTjagRGvx5
         vpEw==
X-Forwarded-Encrypted: i=1; AKwUvBzzveTLsz3HSVpqeJCq+F8NMumYQI1abM0ivVU6HgwRASvrbqeEw7bVVLiyuKuU/O1cxsYZVfHoXhBOuNA=@vger.kernel.org
X-Gm-Message-State: AFuF++k96/NQCLf0XCn+U1wv+6sy/0qq1gWz3XwA9vOksIDhJBlKYriA
	iwC2aDbHlueWlExuRzb2nPsN0Aj2nuOKqxrTf1hcLklvQB3KXkZsfj5K8xZzO8iL/0semA==
X-Gm-Gg: AYBFou07diWcM+Ga9RXlNa/xqGCewoK26iNBVJ90mfssR1tlohlRDbAAIkePTdo/Vjq
	RHfDbPpkh489M66A+6sHDLsu/shQUohiSEefsNnS2DVd0B9gZ73E3uZl3CJPoCHxpREtfzZoyqT
	dcgwBacS29KSxfqrGblyrY2/85iKXP0FDi5R/I8xxg+iRAmzuLTYLo2GOL6LkpYODJyZl64rhbZ
	AvkY8Y6IW9Q2rpIpzcJtivptuh15x7ZCrTlBRYqQFn7Vg/jVxUFZvDT8MUPclJWGouZACLXDqlf
	HFwF/vAJMzVSNQcK7rZO6TqAWR07St41c8OLeSAU2gJTMbAep/eJSYc8kukAgs9cF6o8j/CnNk8
	nxGy+rwaiiT/E8Cdbo+acfcvboUPEjg/YbfuJjQEtmkwaZ5wb4kklrcqq1Yop9m7AfJcAbZ8Glh
	7x3opaGyIlrwI2w6CHxkQeI5xL4HeMwUPTe9TJoysSQOSChBZC3p3TtnzqODIcrIV/oTA=
X-Received: by 2002:a17:903:2c9:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2db12147668mr533464705ad.0.1788959660640;
        Wed, 09 Sep 2026 06:14:20 -0700 (PDT)
Received: from zynq-vm.. ([101.71.232.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72283255ad.80.2026.09.09.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:14:20 -0700 (PDT)
From: shaopeijie@gmail.com
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	michal.simek@amd.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peijie Shao <shaopeijie@gmail.com>
Subject: [PATCH] clk: clocking-wizard: Fix overflow in clockout0 divisor calculation
Date: Wed,  9 Sep 2026 21:14:12 +0800
Message-Id: <20260909131412.3051635-1-shaopeijie@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peijie Shao <shaopeijie@gmail.com>

On 32-bit platforms (e.g., Zynq 7000 series), parent_rate * 1000
may overflow, leading to incorrect divisor calculation.

The issue was first found on Zynq7020 with "parent_rate=1GHz"
and "xlnx,nr-outputs=2".

Cast parent_rate to u64 and use the ULL version of DIV_ROUND*
instead.

Signed-off-by: Peijie Shao <shaopeijie@gmail.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index edf8c0eaca27..5abbc6b83b72 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -881,10 +881,10 @@ static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	void __iomem *div_addr = divider->base + divider->offset;
 
-	rate_div = DIV_ROUND_DOWN_ULL(parent_rate * 1000, rate);
+	rate_div = DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000, rate);
 	clockout0_div = rate_div / 1000;
 
-	pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);
+	pre = DIV_ROUND_CLOSEST_ULL((u64)parent_rate * 1000, rate);
 	f = (u32)(pre - (clockout0_div * 1000));
 	f = f & WZRD_CLKOUT_FRAC_MASK;
 	f = f << WZRD_CLKOUT_DIVIDE_WIDTH;
-- 
2.43.5

