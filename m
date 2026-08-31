Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB60374A06
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199279; cv=none; b=cldgxRVMU0mZ7kzhgayh2ThhcvB+EYL/1i7R2Wkw6o1YJxkpFCqHV7vFX6JIKl2Z/Tb2mI4wMkZuQlqdn8fRoAUkMdNYM/Ps8nkL89fgrhNuzlJIZzlZnO3+u1e7zUfi1cFeOn9OeLt1ZOlQw2qZBGImhwJTC/Hc84EjgE98wnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199279; c=relaxed/simple;
	bh=sTTdJ+a915WjRhsMxkVa81I/Ww6U/l+JAdnO6byk8Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuNIzZCqORN+X9/l9/1YylmDC5N6qL+851sgEFShvcYWNPZtUyloteHnvwvXXIsh6AelUyC5YbVV3zGByrestJCid3ZJJ4cWf1+dI6DKF5ywPHeO7i2aORjD0yeu9fV9cnQFFtSjXHhRZnV4bLJuqpeSAhsghfi29KdhG48sbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/kuU7q7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/kuU7q7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e5733a5aso2243536f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199275; x=1788804075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O14LPPXLUHkibdGlwfhv5IQQ+lgmVBBTlfYVPR5q/qg=;
        b=d/kuU7q75vrWH2t1z1IpGS1n/BfIVuCCnA1g7v1Wk2j+DLxGYQ9z+bQJjxXCNVKJnY
         5Dqo8tK80c7sMOFkFl5fDR3//JDQKjNFcPSpfqXLKkc17w5ljtUPJDsISmGWMQgooOL6
         YJNfQ41kLpNO7umtAwh+9GdGKqQnqXijJS43cEHC+g1vUkKdGPV4EOpk2+WsuPyudgfy
         QUhMtJYiPCBht424dStTKbS4LU3LdZHa5prnh8i63Fkp3JoMRdmoelJzGevY0z8kcTzS
         o2ByYriA8T8OFqDOb/jZExrTNVGZZFb5z5cQ24ZAx7mlIisSSWvtxamf0qI5wYjGMy4g
         d1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199275; x=1788804075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O14LPPXLUHkibdGlwfhv5IQQ+lgmVBBTlfYVPR5q/qg=;
        b=s4tAThRUpJ/ji2tJSt4uViNQuBbmXcyaL39T4+0YR6+1Clye+NEp2I8j7bty8DsRlM
         ZNWvz0AyHwRAxEBiH/BYssQEiaoqCK79d5TcpI+qTHsVQuqVQyZPPKG0iS4vj9WXkLTE
         kk6BvTFEc9HiKuvuZJ7gkIVHyU38hHvj1I8epDRklfPJV+jeYHAVV66gLLmEodJ5+rJj
         0/IOni8Ag/HOFE74UQ7HssBhbnh0jwcaoQTHjLtw8f/MbBvJm1855yr4cU26dE16l90L
         1YkAoa9Ov9gZ56DFu73LKOCAQj1Sd5MAzb/ExNIKopktxPRgPghGWnx8NtWSn5QbT+m0
         hUfA==
X-Forwarded-Encrypted: i=1; AKwUvBzLqdGj3l9cMnncDshns+KtLE0jTkBuILiBCUn0K7jreuQSfNqAJVO4e5ldNsMOnf/88eqGWapIbLSSffo=@vger.kernel.org
X-Gm-Message-State: AFuF++nT7UJV2o+eFHWbBQM5Pm+xak6I//XipZzwxQP65+h7bBsPPdOj
	3JTSFJ/Ci4FO6W3F/NIt2DxBt13r5q+yFC6OMLDhkXuBYV1PxSzrnGrT
X-Gm-Gg: AYBFou1cPumRBCIqy/CfpIZD1AbSnKu5T74As9Lhwg38+uDcEKLd1/ZTwDVVxQNEOx1
	kGZibVAaTvI+vXvY5EDI0fcy0LYqvpJHL2msOn5S8MbSD6MFH3TnGBho/5JILtao7hbQv1ejYwa
	brjnrW3mMPnR5br1R2X0A56EOiuo0n/+OqfseJM4XJqQxzz5l6Oyg8K50nU3LeaYIZLM0I+oWM1
	gVcLnrX8pSZnuEtydUZNq9/W9hlIsCbL3t/HW4tBv7c8mpRD7rP+TOcCBEAsvp1Y6tx7SGWhBV7
	mRWlZs57Ktv9flvTkDfbP6McVpvx2WardugGXX0yKDE0OogzrFK5Wx3UlKTcgYEik+HtGx1ZKqp
	x4CaIc/C/u8PTrsC9oEuIG6qxcaPCDg2i+5yceAWGtiRlsw6F7eiFWB4SzNqwPyXNBSXhaLBJqI
	7pneVvE3FZ1CMmxfknfab4hUiosVMBEhrCRyAE79jJKrayvOczbCuRuAg7nirKBpaQZVrJJCset
	Tw8agL/HiC4biY7SOg8p9ocWIzoe2Z85EeOjmLkmik=
X-Received: by 2002:a05:6000:64a:b0:484:3310:710d with SMTP id ffacd0b85a97d-4844102ad9amr4771790f8f.25.1788199275336;
        Mon, 31 Aug 2026 11:01:15 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:14 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Mon, 31 Aug 2026 20:00:50 +0200
Message-ID: <20260831180101.3109854-6-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index d45659bd5dda..e48902d517aa 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2087,6 +2088,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2097,6 +2104,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
With Best Regards,
Maurizio Casciano

