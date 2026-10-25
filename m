Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897594;
	b=yJHPLhjUjXLktPG1TpXlCBpSRUp/xbTnE4PQR1gEdWrcIRo+zzFoWOIWYujpm1mdAEFJ
	 vHtUM9X9nJihbk6bRtYG5Aby6M4/yDNkdWFx6Eh7N3cWbbAVTmiI4Jyse0NOnS7GxrCmP
	 aoQhZcKV8icv7oYkBabsbrkoU2rPKowXl0pqSrFZ5kIIO00AToMApoPuhle56QP88UPmo
	 gMoSxK8HBuV62ydO12ZAr64/jCfq1E99uKxOTJEKeQtx2KszsrZaSxqpDdJDS+wWvF+Ou
	 RSzHMsMsB+M3TmZ7GWB21wkFhzF5fH99NLZhgTs5cg1PgbLcB7rYqBrYCl5mJUjvQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YNx+zirtnSG3n2/5SJ6TBRQJ3Q3MVvqER2bsi18Z5lA=;
	b=EhoyrnbLBVhufua4XKDn8w+N9pCIqjCenVcHOMNOIiUPI+Nsfi1Z+3ZZYgqcuXB68r5J
	 RGfACGopQNuyTlzmAS+QksLxLmFINx4axSf8U5fa2+I/HbidvmvFsyi0mH6JXZMmHYdxk
	 bsdRagmv/fBHroa8Dt3NrMhEFr7kD59X0nELBrKEGiPHHCdYWMyQcXv/BMGF0z0F+l82N
	 aC8pcUILOWkhNQ8eO9aFOSmcsfPYHub8JIEQ9knaCbmK1QcTJWUcYUQyGdDIMcc0V5CtR
	 2grLR0ayxY1TfAY17WdTIAB31GM1a76nrgYUjENwTSTyZHoYEKmgj1GaJ3Jqn4b01yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="L2oL+/3j";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CA60A6F62
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0CA60A6F62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L2oL+/3j
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso737979eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897594; x=1793502394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNx+zirtnSG3n2/5SJ6TBRQJ3Q3MVvqER2bsi18Z5lA=;
        b=L2oL+/3jDtkq1986Ixl4Peccd9BWu2QlppKaq+FnZbbduCt96S2+NatNAy1Aw+NXwI
         x1RpXhCmdiKBo0t+G+ktVcCoeoLqcLRCKVXWoFSe26rKR2cjAnvdJPbqlci5jyqAgZSc
         pIRNuo4RKXHKYplkRGNK49Dg0WLq4BuMci6r7GS4gA07PYQ/M9CNTt5ij16vGeSiOPi7
         SQ7LYn3dffYU5zqjvBi7GB45tUYgCUGu4CJE4H5bM6S3ePgirMvjRAwrPeZ/2uGZ1cTC
         EjraWnAsovp4TPYR2gwsDuvG8Mkbi3LQT6ubugnooLLx7YdLSG5HEAloMdo3vuWIYoo7
         SXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897594; x=1793502394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNx+zirtnSG3n2/5SJ6TBRQJ3Q3MVvqER2bsi18Z5lA=;
        b=dsGtBTgL5RjDYd29ee1KHKVYHepLwK7nnhews1wmdIV94F2bm8V3Q+WWP+hZl+n71x
         FZFTkT1QPY4JyINus4isy1Ihh/Gaepu4aoNON6n5qpT4u264ZSOeV9ZgAtHr8mckG0U9
         28qFDxfUAfSihWdLdCmS1sQM7jcnJfllhuHeYK8kKsBQ2WvtC7K3qup0DN8BrxN0dLHD
         IZOodgTmorljfhWpqLkLHs584lBVYEtpo25VA+r4aee3nkfheV3qYRS/rADZkeEX/0ik
         rP+pfby3Y7I7boQjjDZq8mN3FAuvSaFJ/Ap1U9OtPdCPR9ioPrm+NZazwTA1QoXswlN6
         lcVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0aiKOHo6DaftPJrFq/tjJaHFPMT0ZKitlfO4/5ytZ5KgsWzuWTcRLzrMUITpOUii5MKUibJlJfubTXPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfksofZEfLTdITlle+qOuCgC5wDrBbm6uH0z9MGOntCGV+kXXS
	XaF14sDonpoyfLOmcxWmt+4ZRnRdNpXrmLp/zxfGONQ5YWIPh9Mbk9l/
X-Gm-Gg: AYBFou2FBR271U6Dbc6ExYmGzRWDmr90Pok4E9ogrjJanfRWSYcbJ5cYRxHwxgiTqAD
	4Y/22RYqJ6VK8EDUJ/83xYCP1PmnoGrx+3K+1p0YYAgzhr+f3X28GhsVe/772VImj8c2tK0ifn7
	vlEgB1b62mbTRkk6emLhq9LXItVe2iNsndFaOh4891LZTbtRIpbqJVYEs39widTw++yyF14PFti
	rdMGvNp7D6heR6WcWLhudo7aGPoMK4NVGkfFf+Ne/iQB9yxsPqjY4FmvwYj2PwDmqb0lrl4BU+W
	VDJ847yFMFJzNQaNEHNl5SG75jrt/XmCLPRvS4CknItkf5YBPJzBi0xfRH6kC83YFUaS5aRqmZV
	UdGHo4bV1P6cksRF86WABDhUvajSZnvdLMoUsZchXhiVw80jyqEK1n3cLXo7leMLhlONqzdOvMl
	x2jg25doTgTA6JU1Jk2gqXviey+jQrIB+Dpvd7DxQVrLRpwkER17n3Ij65NzPrT0DKZmuev2C6E
	FUCQCacCmw1OtATShSh8ZzUZN8rkEv2EZKRjKSkoD7o1kURL9OiDmnErArI/Xpol2H3/GdIbbwy
	MW5CgUrFmiFEJ0AXVd+5bYVjTu2u6zoaI7qJtByy9Kk=
X-Received: by 2002:a05:7301:7bc4:b0:360:51af:3146 with SMTP id 5a478bee46e88-369e861475bmr7533497eec.14.1792897593645;
        Sat, 24 Oct 2026 20:06:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:21 -0700
Subject: [PATCH 18/31] hwmon: (pmbus/lx1308) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-18-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in lx1308_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/lx1308.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/lx1308.c b/drivers/hwmon/pmbus/lx1308.c
index 0c453393796b..37519bda594f 100644
--- a/drivers/hwmon/pmbus/lx1308.c
+++ b/drivers/hwmon/pmbus/lx1308.c
@@ -151,7 +151,8 @@ static int lx1308_probe(struct i2c_client *client)
 	const struct i2c_device_id *mid;
 	int ret;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read manufacturer id\n");
@@ -161,7 +162,8 @@ static int lx1308_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported Manufacturer ID '%s'\n", buf);
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read Manufacturer Model\n");
@@ -175,7 +177,8 @@ static int lx1308_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported Manufacturer Model '%s'\n", buf);
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION,
+					sizeof(buf) - 1, buf);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read Manufacturer Revision\n");

-- 
2.56.0.257.gf7497c7d27-goog

