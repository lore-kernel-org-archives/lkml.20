Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC034A99C3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765635; cv=none; b=Z0XzoXKnGKuTPiIMR4M4T8EpYejg39clehC/ws0/hPNcwM5CWCfiG0CAUY1WTYYha7O8qUYDyRGddR92U+lUfJ1JQmbW0WdGUQGHzUU1tsUDsCiaJR8uO7foBAf5rp7FaCw1yTjKBQNDuTNFT92g+o7BohTpN0R5klS2NkyjOWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765635; c=relaxed/simple;
	bh=lb6gEf/21kZKV9cz1QriYTYSED2/a97q5K/C9CtoXSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hETBUHbmKqU7RwnlUk8x7y4cCs8S2d43nj3nZy/6r4RBpTCZdTxjMUxaBV4QS3491KY1p1hR/OALfDl+F5CscoNvBcb6UMJBYpDvMsUuNv5FfPwjWVBLjdcnvOsJ/KOSE8woqGpMPXE2mA3xpa5it8li/pdspZokRotaNYPDcCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4h+mXXp; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4h+mXXp"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c0da0145so381135a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765624; x=1791370424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgJIB0bMoo4nkNRzK+zBMt7lqFO3N9sH9lPeSDZw+pw=;
        b=k4h+mXXpVNYQ/d2DntWMg4GDrZbGsyufzXP3/HTN52WVmM9M3EYRDi8sNgaWFi47G4
         d+gV9v9LTYIb7dmX0jvTEIG+lb5wSgmxzyN0Spa6FfxH6T9X241uZkU+bUtgA1S+vrdC
         UCncZU7ni4DorD6g4MUOzb0JpChYqSghxAMZssgDGJ8s933++Mz/DW15BWqyeklmdAWs
         yTrkh7pIzD0SS2ihAMyzklFriS6ZbxRCul4iBS8m8ygha6NOB4zxZO6robT7bHMMj4vw
         6fml3jF//iif8JaT2n8xKvQnDdna2I11QqBtnwoVoozN1l1Rx83Sj3K49/em5g0ge5Tt
         WA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765624; x=1791370424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgJIB0bMoo4nkNRzK+zBMt7lqFO3N9sH9lPeSDZw+pw=;
        b=0jjyFnqPhImVQnm3sxiHmbZl+R4ThPYoIAXw3zusBWOiMomNVvxzcBIkVRe1eNSw6n
         hc3x8veGGGc0GhJWq8FHjEhmHShO4EeCao4dnRli/aKKVbG5/KzH9TQfkpuLXFok8VQ9
         aKCoPimUjcc5rJJpZXbA3GSyU6TQFvfldPBYABvAYniLZHF+7zWdc0KCLD0JvLpzOp2f
         pK3N7pTvbBOdXp/rMt4LdfsHGLy+esTl2KCgHCz8eW+Mnb4lTuo219aJy3JzTKcRM/3P
         1E01zmutNcMEkS8qaS+iGsTu6YqGueRNj7XzlXRlEzz6RQikU8mbXaBggllGURNvEFvQ
         nNUg==
X-Gm-Message-State: AFq9FYLH7oapoffL3PrioNAgtzKwBGCa7HF1mRtxcY7PCBbPjVljSzfp
	MDoBP3M1ShnOA1U1kCb3SHJ945poE/Uxo55FJNVk9R/39K3iXnntgViU
X-Gm-Gg: AYBFou0quoJ18B6KYfVMl7kcj6mupUzbhJnsJRnGcqkjtBxi5n9XYlrnT5EQBIV7Fsg
	vuA08jKhJd8mLf1VJH4LnD9QLcHYNdXxDMc4UKvCgUC2bSZu8ovR3cF81VKiMBOTP/RKJav1Rv/
	HZB7Dkacpn8FFFs9abt05wzptuItNdOJWF9gaXP5tWXjexW8rO7abF+Lvh5xd1Tu2yxzp5FxSih
	/FcjHv7Lu2hpdq0JWfKR5doNnCXGDHSiZNU/F3MSquH3+bucUUhc+Dy6F8uYp7N5IZXttEq8MBc
	g/2sqHH11quFFdlSj2kzlKcjVZQhkDXkL16Q8SyGkbxgJgViqxsMEZWnb8EqX+NRQ+f4RiFo+ki
	dgSlHVKC3YVriCXaijE9NR8NbGomkh/E/qdoKsfDor9JhOd1T0NrwHGbXgPUn8GvWkhTTPJlD9G
	HJ1MBRKYlMApmI8wekqiZdiXuUDQWKsBbecfxHX6SQn6U+ekeMoKAIYyAHoeM+6lSwRhwqK/3DE
	jBpo02E4SK10B7jegc=
X-Received: by 2002:a17:90b:2b44:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-3a4d1510453mr765358a91.17.1790765624466;
        Wed, 30 Sep 2026 03:53:44 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce1c5972sm2799185a91.11.2026.09.30.03.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:53:44 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>,
	Bhargav Raviprakash <bhargav.r@ltts.com>,
	Lee Jones <lee@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] regulator: tps6594-regulator: Fix n_linear_ranges for TPS65224 BUCK2-4
Date: Wed, 30 Sep 2026 10:53:25 +0000
Message-ID: <20260930105333.3522412-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS65224 BUCK2, BUCK3 and BUCK4 descriptors pass 4 as
n_linear_ranges, but tps65224_bucks_2_3_4_ranges[] only has two
entries, covering selectors 0x00-0x45.

The linear range helpers loop over n_linear_ranges entries, so any
lookup of a selector above 0x45 reads past the end of the array and
treats whatever follows it as two more ranges. This happens on the
normal registration path when the core checks the voltage constraints
against every selector. TPS652G1 uses the same descriptors and is
affected too.

Use ARRAY_SIZE() so the count always matches the table.

Fixes: 00c826525fba ("regulator: tps6594-regulator: Add TI TPS65224 PMIC regulators")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with W=1. Not tested on hardware.

 drivers/regulator/tps6594-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index a54d88c58e7b..84974531822e 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -242,21 +242,21 @@ static const struct regulator_desc tps65224_buck_regs[] = {
 			  TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_CTRL(1),
 			  TPS6594_BIT_BUCK_EN, 0, 0, tps65224_bucks_2_3_4_ranges,
-			  4, 0, 0, NULL, 0, 0),
+			  ARRAY_SIZE(tps65224_bucks_2_3_4_ranges), 0, 0, NULL, 0, 0),
 	TPS6594_REGULATOR("BUCK3", "buck3", TPS6594_BUCK_3,
 			  REGULATOR_VOLTAGE, tps6594_bucks_ops, TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_VOUT_1(2),
 			  TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_CTRL(2),
 			  TPS6594_BIT_BUCK_EN, 0, 0, tps65224_bucks_2_3_4_ranges,
-			  4, 0, 0, NULL, 0, 0),
+			  ARRAY_SIZE(tps65224_bucks_2_3_4_ranges), 0, 0, NULL, 0, 0),
 	TPS6594_REGULATOR("BUCK4", "buck4", TPS6594_BUCK_4,
 			  REGULATOR_VOLTAGE, tps6594_bucks_ops, TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_VOUT_1(3),
 			  TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_CTRL(3),
 			  TPS6594_BIT_BUCK_EN, 0, 0, tps65224_bucks_2_3_4_ranges,
-			  4, 0, 0, NULL, 0, 0),
+			  ARRAY_SIZE(tps65224_bucks_2_3_4_ranges), 0, 0, NULL, 0, 0),
 };
 
 static const struct tps6594_regulator_irq_type tps6594_buck1_irq_types[] = {
-- 
2.47.3

