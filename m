Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897606;
	b=UWS/EHBEhLeY/MzqPmQTQ9SPb/jOSUVlGgsRUjrQADXDJFtk29teEDikQhoSdLPo+/+g
	 fJAHOJZEkZ5twD5do5oJsRFkYe1UqKpx2GGywA545eOjsamou750tVRaaWl1DS+PB6jij
	 POsBep1MyPKZdW4Y7o4Fn91nJx2rcHS0ZbsHx4zaHrihrcI2msYR5v0RL2JiskEPAzw7z
	 11iYQOZXiPtEL+A8IGoMbI/eepMWYfTMZ8WaqM0j04p9qdBU6fNjcZq8m0G0cqak6KAwQ
	 zWYAFDpwvDeuJfswG7RlY9tNKV9vCh/VhQiFWvEhGvOPV2WII9dR0p8vMkzRMFvD59Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=l6L4FA/RuByNvMSHE4w4JlpLOZhuu2yw7v2+IF1sZF4=;
	b=uNOe+CZ+MBI9w4TiBuWb+uZ65BkuYzqJOo5QbVY6y796uvH1y+wZfvz3l/EvclcPhg2U
	 cDYV35tv5g9p/2zepj3s/JIHW3QpjVoE6gdNFSCGym68Bw3gNiBU0NvGBuw9ayra7wBzp
	 tEo0Y+oOQQJAb+hKtqfnDDoGuBSpM4qqKeJ83wQyDghjtXX+CpYAQ45qrxY7WvzdRLgLl
	 xCPWL4T6kbhHvFqE/7OqRVumc8nrEJ2L9Lt/LXSjQawZ2bZsivEELLcmqVAbuG0bwEXVN
	 GNTPwCtxdPi9u5wdWmNoqy54+aHO/pykSfx6g/GuWEztXJP4H5JRqmlqDV86RVchcOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W/Dw4INJ";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B668606AA62
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B668606AA62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W/Dw4INJ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso3604441eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897605; x=1793502405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6L4FA/RuByNvMSHE4w4JlpLOZhuu2yw7v2+IF1sZF4=;
        b=W/Dw4INJ4+VT90jUn9FMT03ImMknOKU8HROgJr6UZNKDQtgoH60S/uA22b3qzzbU9z
         8VERCbL1IhRUYi4dXArvcjJRTI4O7cjjHwwvjRETl0eh9usQrFMgdvnI3yNhrznwWhEt
         q1vz34L0CmBjpGCGLhMKUn49JCBbojmc6+ii3L8M5xGwU6kco5r6v9Xp0PQGELVrsetI
         mwtW7J30OfAMFQtK/TWILv7upl7C3HL5JI/xqn2fegdmce4opfMqTz15EZBV86p9jyuk
         4bfz9/UjIxsrLToCpDJW5dIQIgT3szErEk9zxPCXK/ybTCulIpAb9Hab+ocUXpRmNKlv
         F/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897605; x=1793502405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6L4FA/RuByNvMSHE4w4JlpLOZhuu2yw7v2+IF1sZF4=;
        b=RkDRfoHAjXOiRs6e+IDMH3C6LQz6yP4rAKKzaSyUx7I1Ulvv/lM40RztKVff2UaNqH
         KBmFd0gUiWDq0TSx3qzwoDeN0emcueU1cZ4omkQl/6/r4p1j8l6u/SeD1xRjkNdw5048
         8LPiCHNc6Dfe7s48WaxaHhcDo50V/LoughicEyLHEaI2dQgkwXUwLNHq5g4Ug7Zs+8oJ
         y65aoM87elt4duJkZQZh0jhNF790SoBc01spbWE4E6Gd68Be5QiZin25TecmvIQZqm0L
         atCkZNkFOKuZduUsv7tUH476uq1NWQgO2NLmDe5VZcLehRGmRDsnjUpn6XPXqhIth2dB
         /N+A==
X-Forwarded-Encrypted: i=1; AKwUvBxUkLMPEfVub/PfudOdnQPgqn8uBd4kMC4iOueG4gw20JWT+K16psJpqeFLxM8480l0s4goAZPFyHoRvts=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpzO3s4OXD/qSGbBoQQWwYkGG6p8P8uKQHeWsbLnZx/0Aw3o/2
	3xHuWSqgHeolPRTsSGUCv6vSmBtH2h2PE/ybxguwy7AvWJiGflp2SwC9
X-Gm-Gg: AYBFou3lY7XyM7GNyenAHS72uN9YHpytiFzb58FT1EHN6bq9Rj2cSaUHLVtHDALeBOn
	8jWOYpDFuOfH5rsJJIDZOTejWHSx/hctVSbylOkfbft1zWEEqhOjJFGjjKaLPDP0hy9b5ZTG7LA
	JD9c/RE47yqmJbPkmxaUaNNyupz+k5/YQc2hBQ1tbrLkWbebamaud2Dca57fhjbXuGhIXZFvXZc
	xAQhqD4Y14Pef6ICECxV6q/IEAbVzy54VBjIWcrBFbYHTGKcCK8KRBRs6m8wxUU3k8Y51oN0xcj
	Gl7Hg9PtsrjiNv3NJqqPIZx9oTsOtFua37dga9UQvC6TP277W9fxK/p9tdiglfCIwg6NMKINLvq
	flpyWLkJ1S3VMSdnJJ0ckB7ud9/ENs/jWS7gYC6WX8tK6J5NBd3UW6OUGxMNxTR1iA1ZQqcKALR
	X8MTExbAFHxXZexKjTRtts3cGEYOxX0/F4W2SlLvipWi6WVdhWuT89rxaEU9Wt/g3EulGD02GiJ
	dL5wrmX86npnWTL5lbKCiSUymwrMuZ90/JwiLvOVojtQc0rY3ncMMAwtsFoz6qcYiH4BQNavQzO
	7Quz/mQWJ4VB30tBSeMxttR5fNclOpxrrBeSn/AGHYUwE1FR0CxD4Os2BXHhAb/y
X-Received: by 2002:a05:693c:6399:10b0:351:595:750b with SMTP id 5a478bee46e88-369e851ab36mr4950075eec.36.1792897604898;
        Sat, 24 Oct 2026 20:06:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:44 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:29 -0700
Subject: [PATCH 26/31] hwmon: (pmbus/q54sj108a2) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-26-e81941ad0cd3@gmail.com>
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

Pass the buffer size to i2c_smbus_read_block_data() in
q54sj108a2_debugfs_read() and q54sj108a2_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index ecac405d7536..8ce1824249e7 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -120,22 +120,26 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_ID:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_ID, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_ID,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_MODEL:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_MODEL, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_MODEL,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_REVISION:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_REVISION, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_REVISION,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_LOCATION:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_LOCATION, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_LOCATION,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
@@ -147,7 +151,8 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_READ:
-		rc = i2c_smbus_read_block_data(psu->client, READ_HISTORY_EVENTS, data);
+		rc = i2c_smbus_read_block_data(psu->client, READ_HISTORY_EVENTS,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 
@@ -156,7 +161,8 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		out = data_char;
 		break;
 	case Q54SJ108A2_DEBUGFS_FLASH_KEY:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 
@@ -297,7 +303,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 
 	chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
@@ -311,7 +318,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	/*
 	 * The chips support reading PMBUS_MFR_MODEL.
 	 */
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
@@ -326,7 +334,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Revision\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

