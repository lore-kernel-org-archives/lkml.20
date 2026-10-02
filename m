Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71E46DFF3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939609; cv=none; b=XoPPUNtSSft7diEwuV8H4KXXzu8rBQupQ2POIeFaf93U3szRqrpJ4WNCao/6U5x0xVa4VOkA7uweoNCdnIBjhf8ZlFYossJELpiX0NpRSq+lJfJO5WpMDGYjgrduRLFwQWGB/weVTkitDPyIqrvJbeY8Uo8kqXbQmIJRfXp+1uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939609; c=relaxed/simple;
	bh=FZWzX825zJrb1USiIQS4rUG1Mq9IzB9/JQUAunSG1G4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkDrILq1OObq8MphwzCfk0OD0xUOxDJIuBwgtvuNNn5L+pNW6A7Y2Ar4JKimgxA9KhmRBVeJufn34Xk3UKvhJhS95Iz/N711cBLsx7iQux6TOtSAIuCpX4J60JptTIcy2H7NuvQgp/Fv3Ux9HhWfaKKNitSN5PmzLU734Uv9Wck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RSDjzLkZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RSDjzLkZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 168744E40645;
	Fri,  2 Oct 2026 11:13:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0059603DC;
	Fri,  2 Oct 2026 11:13:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B13D2103284DD;
	Fri,  2 Oct 2026 13:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790939601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/beqPuZls6CZjqOI8Uc8bT40X/uRwMJAZAlf3s1KA1s=;
	b=RSDjzLkZwMPdls0LHXY00x28rN6kwkcwocOWMcZkgHLxUvByAFP1j3XPtvL3jDT19S9lEU
	Qf2gGXiwcilFBmqFS7b0O+eXfBP0Z1gwMSUb6TGEeuqyfkKENzDRcCXQJlHUX0Gn1KlRSY
	SKVzv4wRxteJl4Io4LXizw1BwAxvttQ+FhrDcAebhhbdxklog19fFgdjRY6d/MGr1tk8bD
	iNxqMVZCQeggbv/R61OZH+ojxgKa8SOnj5r32TX0jcit9RZCWDBVSqbY1/zerV5lnarS9h
	pApLyhP1ATzy8yAZS1aGQKDEmqFHGoMteXdXiPhxcaulbTNoBSDjZzLh6+d/Qw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 02 Oct 2026 13:12:43 +0200
Subject: [PATCH v4 5/9] mfd: cgbc: Use real I2C bus names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-cgbc-i2c-storage-devices-support-v4-5-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The adapter names described the expected purpose of the buses ("General
Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
rather than their actual names on the Board Controller.

Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
the naming used by Congatec, and update the variable names accordingly.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 8522df882509..a58d9ffdc277 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -55,13 +55,13 @@
 
 static struct platform_device *cgbc_pdev;
 
-static const struct cgbc_i2c_platform_data cgbc_i2c_gp_pdata = {
-	.name = "Congatec General Purpose I2C adapter",
+static const struct cgbc_i2c_platform_data cgbc_i2c_i2c0_pdata = {
+	.name = "cgbc-i2c0",
 	.cgbc_bus_id = 0,
 };
 
-static const struct cgbc_i2c_platform_data cgbc_i2c_pm_pdata = {
-	.name  = "Congatec Power Management I2C adapter",
+static const struct cgbc_i2c_platform_data cgbc_i2c_ddc0_pdata = {
+	.name  = "cgbc-ddc0",
 	.cgbc_bus_id = 4,
 };
 
@@ -71,13 +71,13 @@ static const struct mfd_cell cgbc_devs[] = {
 	MFD_CELL_NAME("cgbc-hwmon"),
 	{
 		.name = "cgbc-i2c",
-		.platform_data = &cgbc_i2c_gp_pdata,
-		.pdata_size = sizeof(cgbc_i2c_gp_pdata),
+		.platform_data = &cgbc_i2c_i2c0_pdata,
+		.pdata_size = sizeof(cgbc_i2c_i2c0_pdata),
 	},
 	{
 		.name = "cgbc-i2c",
-		.platform_data = &cgbc_i2c_pm_pdata,
-		.pdata_size = sizeof(cgbc_i2c_pm_pdata),
+		.platform_data = &cgbc_i2c_ddc0_pdata,
+		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
 	},
 	MFD_CELL_NAME("cgbc-wdt"),
 };

-- 
2.53.0

