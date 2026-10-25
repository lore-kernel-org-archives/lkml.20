Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897571;
	b=mkbWws3qLjbcxeVOcmYA0F+YZmP18K1pwrNkMLBKQQekvlAMl6qnEyTr3ch10U8s6vYs
	 g/KddxZr/cF8DpagmI7r+C7x+wR6/+loRMTR0ZyX0g7PJMZf2Q74D5rxAs0YupI2dN6Ba
	 BjqMCSKUDp7PYvTTitjiUy7xJLleUK1e2/eLlWIoILpAeyXD6jQPnZ/jxH4AVChwJ/vaC
	 J+KZ9T5tVApPL9Jke+SRA4tc569t08kbdVVbsyM5DAfW9W0v01iBn53QILnFIGMm9tVh1
	 COB5fJz8TqXOKC8BAdUqBWI0beFWvPEzBRbfbjernCrWIVl1meXziowk/UJZdJ2FKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9rXit/G1B2KFGFxKlHMehzgVQ+QaItPOeQnpyECDLVw=;
	b=nkLGrBjPrQWAEqj3UbuARw6Voqa7uerY76dJ1nhhBBUfHo92kH218RSDN+tMid3HnWQv
	 D4QvZJNvYktLjM1pc2sba+Z162vq1nYWhTLoLfGEhxqyLpWbnMdvo6HDx7qgsd2dfVBzn
	 gdeQaJbA4JWyfS/sKbLBDawnkNKRP/QpLpItNkE8FNHJKGA7KCsuxgdlu2nVfM2rAfakj
	 TBnb1cQrgVxEIgrhz+av840e57v6M4ab9jcZ9zQHBTEefDL3ICqmNQfmEp+ljBfdYNASO
	 fxTFhgCt9FNaBZlYgrtlcA6sMarHaZjVr9A2JCF0/FE1ksVhkm0Ed6sXoAqAwSS2Otw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jh5Mi3y2;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072BC606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jh5Mi3y2
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so2684034eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897570; x=1793502370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rXit/G1B2KFGFxKlHMehzgVQ+QaItPOeQnpyECDLVw=;
        b=Jh5Mi3y25k+JdGKtxRjGi5IoEDsQkk8xyOn8VJeHO10iULHzWLpuv+WHQO0y46alIw
         hGG8GbRht+xXRgEC5OBARu9iWg0RNnY1SAaGyhnHBUKMo3FW8uEO1QjJn/8RxHGNnt7E
         ri51o1LxSztP70rsOFWP26ZiqmEU/d+WcoTNSQtG5uX1w1bLEgOqGz/HJS//0TX+drkR
         dJca+HYhMbNI5uArxUZuhvwAxBB8v7sJIyWGydg+GHs3FYwp3xPf7ToRxyIDiKBGT4gB
         D5h6XbZ379hc1BizGlhi5cVBl+BPkZ4Jm5NoNPCJyu78OT3EYSKXk1htLVG+nXLaBFnX
         4eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897570; x=1793502370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rXit/G1B2KFGFxKlHMehzgVQ+QaItPOeQnpyECDLVw=;
        b=0V6nVzZDO/4E+nlNr+iMBeFYWiyTtGL+LLhse5pfzJYJWV258hKKxILj5up8OhnzKe
         YsCFqO5f6vm0n3uycd1TQvsN0ygqu/bwJ4+yhsnDISkKGNrvwArB6RXur6ZSflx05DT/
         gqM7mE8otl8axLNVIA/rqq5FXlQmy5UPWTQR8vFGVFAFNJz+fKfdrsnFjhfGu4SbWduO
         kII262PGnqvBwxdzrfUZtprzYlwwmtpXA5XdxyEuphxFdH436PO6x538CoscT7Yc2ObT
         LT3yUSLBxJOTQDwidOPaMTSQKGr4o30LbUqgVEXpV+GzbjqGRZQUvDMq5PzSc1uzMPj7
         Zj4A==
X-Forwarded-Encrypted: i=1; AKwUvBxITJiU6im25lH9YiZHHnF+S9bRxtTfBbBZg2Mot6hBuCpQYsXBH+FB5bbO/ifwLEBs/+mfa15E2NMXr1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgPpsOb1stNjOPfkW7g/VFUpnK1ieQRQGRILKTgku1sDEDfcFH
	upoASgY0Ed+bcP9lGn0YNCgR7Df9JWcR5crt/cRmTotKrrOts0ANB/KZ
X-Gm-Gg: AYBFou1G/N639l+USMWRsNfq711y/KtDfQjDgCpZAOfG4A7YrurCOJFmCC2aVpotzT+
	rT8VhEywx9CzY0fEl4AzxME4cQOu1H7az6Do7SwMhgYn3dCi6jZU35xaLuq+zbf/GiQYs9Aduop
	uTahwiY6hjX0MN/bCKcr0L/EmjpAnIKInjq6iEQ8iGfpFWxTUCj6ubfgE3uw1FuC0BM2g4heVG9
	WuxRQc6AIT7FH8/PyvHFdInDygByjUw9bt00wdRrflQs7MoHQE1xxHthMNcYRO8QcxfTKCs5Fex
	376xdgZ9CZbGnvTas44Q6C1WHHczF1xEwDqE2LVS+psTO8dHhmprMYRkCGBv6zqZ3v65QOp60p3
	soEGOtMcr1D97bGJvp5ywICqy2ZjW/PVM8AIjjb1g8Btvipll8bJN55mqICHgdfeeVP18NBO1Kw
	50Vpdavd+dxiVPbj4vSbhRAgP7rlcTTchPDnuziYfQtx7ap6PrcMWNTPykcnrkCLHoDNfld1cvd
	pqNaDfJl96JREIKCW9uPt4so/7VwROHhpucetTrh8uvYYarNfKdA0/cUsmZQYZ4FxD2ZUaKWRqf
	9LqewF/VcXQqFyjDpm7BID4HBgK1JCUJnNvLgtq2Xnu168DO7WpLuspXvwC1+en6
X-Received: by 2002:a05:693c:810b:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-369e87cb951mr4033713eec.12.1792897570056;
        Sat, 24 Oct 2026 20:06:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:04 -0700
Subject: [PATCH 01/31] hwmon: (lineage-pem) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-1-e81941ad0cd3@gmail.com>
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

Pass the expected data length and destination buffer directly to
i2c_smbus_read_block_data() instead of copying through an intermediate
buffer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/lineage-pem.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/lineage-pem.c b/drivers/hwmon/lineage-pem.c
index 2553e49f8401..75a44b0639dc 100644
--- a/drivers/hwmon/lineage-pem.c
+++ b/drivers/hwmon/lineage-pem.c
@@ -130,20 +130,15 @@ struct pem_data {
 static int pem_read_block(struct i2c_client *client, u8 command, u8 *data,
 			  int data_len)
 {
-	u8 block_buffer[I2C_SMBUS_BLOCK_MAX];
 	int result;
 
-	result = i2c_smbus_read_block_data(client, command, block_buffer);
+	result = i2c_smbus_read_block_data(client, command, data_len, data);
 	if (unlikely(result < 0))
-		goto abort;
-	if (unlikely(result == 0xff || result != data_len)) {
-		result = -EIO;
-		goto abort;
-	}
-	memcpy(data, block_buffer, data_len);
-	result = 0;
-abort:
-	return result;
+		return result;
+	if (unlikely(result == 0xff || result != data_len))
+		return -EIO;
+
+	return 0;
 }
 
 static struct pem_data *pem_update_device(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog

