Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897599;
	b=M1FfcB+q99Ac+6YggiAVNnPfBLuqKzI1xPLCDf43QCcRRAaIueADcqoPSKjir6ymLyAf
	 KrtclFhSSi+7hr1SME8xz2R9e/4nu15pNc1VtMmU/i2/BPUXnxCR7VTnQZgq8Uh8iMnMk
	 C5PtX17oFpMfaw/2nlrEQR3h8w/LjzlaQjOqFhPUchjJBXj/yltNr5ZucpD72wAryym09
	 idwW/cRK8SP4d1NnIXBHnzWxF4+7A5qI8sHrAMGYhnBocUtzpG7qmSzDuK6nDdvsOJdIJ
	 qIeBXIXfPxlqyWgqoZO8Km4hlTtb9cvkuKNPIjsldXSIGTQHw1Q/rlWaKvxqd7UHgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SOrZg1ktdK2KM/edar2GDErVdg3LTi45fqJLbqiERsk=;
	b=UaI9tPDJ05iPuMsvmdP1L48f7PZg0yqIdG5lfiMA1gW57lybLxiFdiBYAHvlWwAGV348
	 K2PD/cxysqHg7vZQG7tby0jUi4tnuM12XUonZ1Al+2n/ZzkdKBXNDXBHVcwZdpFRzq7JL
	 SB+MZnW220w829O0sIDX+dgA1Ay2sXzOO/HRsUyreCDRl8eGhlIL3hJ+VXEEfArrbktsE
	 0eujivMpJME6A1VdLtec0EhkuMStLWTFwnUq9ETYhpa761VnZEhzy1xzxFiVKiEY160N9
	 skseqKwPwfvXb6xh5FxYbCpU7MJwHG3rrbVgrEoFWZEzLMh5VS0TWhW/OsMT8N/J2PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q5lwEuct;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD1606F5C6
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DD1606F5C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q5lwEuct
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35d0be18c71so3484012eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897598; x=1793502398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOrZg1ktdK2KM/edar2GDErVdg3LTi45fqJLbqiERsk=;
        b=q5lwEuctUP1RfPGmICf0Z269MITZeAMbAdA1BPTs7i+iFAXi2LV2/S9kn3diOOLYLC
         bm2EdSK4WuM5eNPofG7fAePTzaQX6rl9e6mPfIIV7EqiNJQ9Jm4eldA0TOk5loywGfgy
         3KB3T4l42guM/mDWPWPRKzYavD5/exKCQ18WS0648w2dMG9lwYdq3bioWeoqcrvidQox
         lpfiqqofSgrNRXEDKJ+Sl1U8qmX4LIewnjmr3f1PBSXuRx8yLyJVIfSQzZQY+oX0Tj87
         Yja5J1/yNLbrwTm7PC5G+EmV1E4bsrf/kwRPFH6r7+U8agAMJHNP649NNTyRy1Ro8Liw
         nO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897598; x=1793502398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOrZg1ktdK2KM/edar2GDErVdg3LTi45fqJLbqiERsk=;
        b=oIX63YwRLm0+fsO32/5hzsHWxp8+lhnbupnGMoLGzUw6A33MLVrIMLTM5UIF0g6UAp
         x9iNlG+4MUvDLzJV7pQvHDDMvtFjcI0GUngHOL7XMr/oitMOk361Vhdb0PSdhTmvfuwb
         pGefUmlXljtC2UKqbpb9lJta9Q9ult5YGDJrG8GjeOZdjL1WJCEnfDSvceOz5sy8Rgai
         0T6nPq7D/p6uQDHfjpQlM4yTXYJe1lF6wSXXjmVOkKc3k9ClrXABQqqOPMWBIddTRX4/
         YoLlCZOMXOc5Rm7b06uGq1KsDl9oexJzwbZrcZSaM5x/xMgxtTXWXA6mcMI2GhqWIgFN
         t1xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb9yUNcMIXonoNSqvJYZ72+wmGBmaHa6++XrmKKpQqmDViTWtf6Yzy+p/TOgDLl1wqcYjqIrFrfPgJbhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjSsNTPxbbZJUNpmw6fkcGjCnMcCKS6i4jY7u22Y+MNlTZu5je
	g45QyIMZSkJz+sNhgovTvQLSdm5GYp1aaA/L8gB5w9/DCNvGLrIXHWQv
X-Gm-Gg: AYBFou2O8q5uHhAthws+Bogkd9ebwiKB9ekcVpfDg4yDl0aYaVCOz1R0nvm0BVzu3af
	+SW0cBNAEJ9D/tmi+arBtMUIxyhIlsGIFWIyqEw7WuX0wyCemt46fCp8ZltIJgyokwf1ai0zJmG
	vy+Q+zkWaEWX5HeZZqTBkPmYLdWn3m6ZH+mEbYef/JMqtzm2P8bBKLvBW8ovfhLi+dGSJHC5Y68
	N69Q6iYL8A+P2SURFAf/12KmeMhQu+3k/2biHZQzfycf46GnHuZG1ZFxv4KsOinVdMAmg7ZWnOn
	xntcBr2qCBZcskZrTUS1R44WsKtZaHuCd1q5y5h+qJzCts0bm6tU1nQK3ImxMp+W3PoDytc+mZa
	5HrQVg5xSerSPdkOuoCCkxsUUaqZzaR/A64tAaoCN2blPP7yWGpo5nArw4XWbDVwvjJ8M3Wdrii
	AkYW9VYLRm0P2RUUIc7uRWkT9ruPp7HAkV8I9NBk9b3+/vjt4zSIxgWFvSlRmdEhBWifyLqEPHS
	cczm6+qP1NHknWk7odmUaAtCcEL0uv9jE8T2ge84cqzNMKgH/M2x79qff1RD4WsLqZlVDhqpiXJ
	UKNEr0ceGOmlAPH3omJntGi5pcSoDyNpHarXMtnyVU71h6m9r92m/qgeU0VEp4qP
X-Received: by 2002:a05:7022:7f15:b0:199:4d4d:d3c9 with SMTP id a92af1059eb24-1994d5d1754mr4556600c88.25.1792897597889;
        Sat, 24 Oct 2026 20:06:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:24 -0700
Subject: [PATCH 21/31] hwmon: (pmbus/max20730) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-21-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in max20730_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/max20730.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 4031f894e6ae..b48ae06e3fa0 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -672,7 +672,8 @@ static int max20730_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
@@ -693,7 +694,8 @@ static int max20730_probe(struct i2c_client *client)
 	 * a mismatch. If that doesn't work for all chips, we may have
 	 * to remove this check.
 	 */
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
@@ -704,7 +706,8 @@ static int max20730_probe(struct i2c_client *client)
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

