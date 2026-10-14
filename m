Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D502368D5E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948120; cv=none; b=mwCD5/EprEu8wlCyhPXdGCVks8XWEGjx8Bz3zOfqNvmmDDQ0Xmv+vI04+MFmHQ1QljvzaDRGcpBew+sBqvjqg8Cg/BpdP7dXvNQCXwIMhSaLzpPO3NLYUk+6JbbBp/4EDOQScqUhYXt75RvXsmKplaqVpo7zf+cxpp68Ex2cAu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948120; c=relaxed/simple;
	bh=iekl7tzCtye+68fs2dce1vzkwBaAxF5b04SGQXyGqcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XyQ+l8mTy77rMxbSqUpv30NUSCERpizsqRZFu3UdyJIGXerc2f+QZOnOJjMU3eBU+t2dUhA+zbXsO3Bl8J4r+YiAADkAIQ+9vviI9A+3am2GqdCF7HEs5cEwFSyRFE9zxR9UYeGz2XvCPa8vAoe7DWGqMG43omlrq5dWhUil4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Tguv3xHn; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Tguv3xHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gb
	xUOBZ2J+0dV3pkBWlzRdotHBZOkAUp+S0JXc1KS6Q=; b=Tguv3xHnveeemmCbwl
	DoeK8Tu9avZi/rAKzT2LKJB5AmJQRt55/PtivW89Dxk4XGFaYWfCC8zLh8ep6RID
	bygIXqC8nwqmNQhyXc6Yd7pUgzbqgzLBcjDUOflubBjUJ2g1gwC55AMI24BZefZg
	7n8ru5v5PIqAUeiPhxSf3jnt0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBHjrxF9c5qWv1pEA--.22882S2;
	Wed, 14 Oct 2026 11:21:42 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Lee Jones <lee@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aaron Kling <webgeek1234@gmail.com>
Subject: [PATCH v2] mfd: max77620: publish module aliases with variant match data
Date: Wed, 14 Oct 2026 11:21:39 +0800
Message-ID: <20261014032139.10971-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBHjrxF9c5qWv1pEA--.22882S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr45XF4fZry3GFWkArWxCrg_yoWrGw1kpa
	y5XFWYq3y8XF129FWDGa97ZF95CwsrK3y7Gry0gwn7XwsrAry7ZFyFvr1YkF13AryrJr13
	tr4Utay0k3y0yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piF_M7UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QbcpWrO9UaVzAAA3c

MAX77620 can be built as a module, but its I2C ID table is not exported
and it has no OF match table to provide OF aliases.

Publish both tables and obtain the chip variant through
i2c_get_match_data(). Adding OF matching alone is insufficient: a fallback
compatible can match the OF table while client->name has no corresponding
I2C ID. Dereferencing i2c_client_get_device_id() would then be invalid.

Use pointers to chip IDs in both tables. This also keeps MAX77620, whose
enum value is zero, distinguishable from missing match data. Leave the
variant-specific regmap configuration and child devices unchanged.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0d084ee9ba87 ("mfd: max77620: Allow building as a module")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- use the author's real name
- address the matching-path issue Lee asked to review: populate OF data
  and migrate probe to i2c_get_match_data() with a missing-data check
- use non-NULL pointers for all variants, including enum value zero

Previous version:
https://lore.kernel.org/all/20260905134051.66545-1-hppiscas@163.com/

 drivers/mfd/max77620.c |   29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index c4f89a9681f34792d24c5b75c4b88df84b3c2c66..4947ee96cc62cdeae37a15f65497d7f1013dbf11 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -496,7 +496,7 @@ static int max77620_pm_power_off(struct sys_off_data *data)
 
 static int max77620_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const enum max77620_chip_id *id = i2c_get_match_data(client);
 	const struct regmap_config *rmap_config;
 	struct max77620_chip *chip;
 	struct regmap_irq_chip *chip_desc;
@@ -504,6 +504,9 @@ static int max77620_probe(struct i2c_client *client)
 	int n_mfd_cells;
 	int ret;
 
+	if (!id)
+		return -ENODEV;
+
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
@@ -519,7 +522,7 @@ static int max77620_probe(struct i2c_client *client)
 
 	chip->dev = &client->dev;
 	chip->chip_irq = client->irq;
-	chip->chip_id = (enum max77620_chip_id)id->driver_data;
+	chip->chip_id = *id;
 
 	switch (chip->chip_id) {
 	case MAX77620:
@@ -693,12 +696,27 @@ out:
 	return 0;
 }
 
+static const enum max77620_chip_id max77620_chip_ids[] = {
+	[MAX77620] = MAX77620,
+	[MAX20024] = MAX20024,
+	[MAX77663] = MAX77663,
+};
+
 static const struct i2c_device_id max77620_id[] = {
-	{"max77620", MAX77620},
-	{"max20024", MAX20024},
-	{"max77663", MAX77663},
+	{"max77620", (kernel_ulong_t)&max77620_chip_ids[MAX77620]},
+	{"max20024", (kernel_ulong_t)&max77620_chip_ids[MAX20024]},
+	{"max77663", (kernel_ulong_t)&max77620_chip_ids[MAX77663]},
 	{},
 };
+MODULE_DEVICE_TABLE(i2c, max77620_id);
+
+static const struct of_device_id max77620_of_match[] = {
+	{ .compatible = "maxim,max77620", .data = &max77620_chip_ids[MAX77620] },
+	{ .compatible = "maxim,max20024", .data = &max77620_chip_ids[MAX20024] },
+	{ .compatible = "maxim,max77663", .data = &max77620_chip_ids[MAX77663] },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max77620_of_match);
 
 static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
 				max77620_i2c_suspend, max77620_i2c_resume);
@@ -706,6 +724,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
 static struct i2c_driver max77620_driver = {
 	.driver = {
 		.name = "max77620",
+		.of_match_table = max77620_of_match,
 		.pm = pm_sleep_ptr(&max77620_pm_ops),
 	},
 	.probe = max77620_probe,

base-commit: 319633b06ff2bfc2a7a60d2cfcab2e681a343b27

