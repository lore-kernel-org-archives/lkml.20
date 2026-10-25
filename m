Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897612;
	b=0nrR/omyRB/6bLBwo1d/WZu4P8D4cL8kAHomxr6etJjugIhqCAjLQbt/JnnbS5k0+0Y+
	 GAupek8MN4SJ7w7gEEVvrU5WrzynADZC/vK7g7MMj6I6x2p2A5rzuy3/q75yWkMXkaWrX
	 cubltzyYgwFHxrn6xj3UiaOE/xKcrA19b6XpBP1cCVklgYCZRVrTxIv+9PqzNdwyvabMG
	 cZFjdOFQ4m6PVfsbeTb8sPrhSQE/1jZtBCd0MMFFpfmC+kNJcpwMq5sErcj57CMJ75kjF
	 XoBENsRTzqABN5Ccsf+KBVmUZsiNTHqTEV8cMqVv0vpcYaREQ97oUQZ+ahCuntUZ8aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YpWj7AiIuB6xaQ0oaBCycNsZPeJVRg9R37QQkrbo70Y=;
	b=TKavghX468kgGVUeMEjGHFRz1jL2xaLwZXQXuwHOxXmw14+gTE74JgBlDVPxKrqCox6O
	 ecZ0ivHQWOQ36uJ/WL16T70VxsP8sWd7Nlr7WY3tIDUrHO6XeKm1ADI80K+kjDMz1reU8
	 LLaA1+5rSOnul6m72GiSqnQTMelDpSjDjglvfXGL3WpVc0a0eAsCds/Luz1cjezSt+yee
	 TulB94k13lA2JcK5ayxrcKvkKXOgbkllRiafHNiwv15uyBucDsIIW4ySgyD1rZaGPlzPs
	 iBKOPXyzMc+zuNzL+3MDcMgtIddZIAlm9kyeCRLhOIQnMlcZ/8evD7SUHQB/h+ntoDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H3souHxQ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7432606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7432606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H3souHxQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so3213578eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897611; x=1793502411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YpWj7AiIuB6xaQ0oaBCycNsZPeJVRg9R37QQkrbo70Y=;
        b=H3souHxQGe4kFOrBdklHTue/lqFIuDpuSLodKSEu/2daF7hhs/HPTqhCELZfUFgSNe
         /GvNx1038e18RY2ezOga7h8PxaC/uGhurd2Gt+F+usWwaanzDl/DFG0I3l8zTR2Jl5Jl
         xowM2d1QPoxmXp+ZL8zQPq5UByu5lxO0NrJp2BiG5uqpoCnE+rpNU8Lsu5fWhZvMm8AL
         VNflWShpA0fUM98g0AoremcPtDLd1FADzacNI144DSN1IP/SkUjJyzPB9lsazBthrWFe
         KCShUPzwhCchMG/YjHBSzmTDX9Jm96/GCSJL2KqMH0RTxdA736q0a6fykttkYi0dWrGi
         OH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897611; x=1793502411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpWj7AiIuB6xaQ0oaBCycNsZPeJVRg9R37QQkrbo70Y=;
        b=ZulK1j8tJAzy/7b7UhoZGkqqg/CqIfmyAIkomHs8bps2ekIwZ9ioQTEEqGIHIo+Jlk
         3zVuH5yIKXC7RSHnSEsOjpfAsoTdS/gEEt5YAFePsr5FvxwaDS1dw4UdfZQzBpIVZS40
         p7HYQ1Ce8F1LD2Xi3xRTriixAbxr4k7gI/Ak/b1KD2QH9MOBtqTGk0jaLmQOWNncnGuq
         4/MsenV3fGGJNrxxIe4zRMzXk83Cln5YBaL0ODeh7ZLkmvDcoakibtu99i+uN4bvS9rr
         UDzwC8ytIBjgsT86GZ39Al8xmooiz3f3GQdOb0nQN0iKtYSdzha2+u6d7wF6WGyXLHSD
         mJ5A==
X-Forwarded-Encrypted: i=1; AKwUvByTSOOW9aRulba9/0TFOARUV3d910Z0qYP3qlMie3xglBAKiYV9+Q/EkIJPWUCOQ5xRXxZ1jcUAWCHDCRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKieZOInrQJDXGdGpa5EQryKGXwc6pH3i6ZuE+W7MDwHg9YTqum
	Q/RkFF8znVoYnEakwbGL0U+TIWqB0DtB7XKNUHRtYxENln4S2f5B50cU
X-Gm-Gg: AYBFou1In8GwZG0SZd1b1Ti7PcySRrl1TGpZBXVwY6q5RT3yoG/xUlK6at/LfsAmWR7
	aqb23wkRYDHKqW7wxZTHlumhpN+DDnEJUl+zgS71P3wEq3CY4i5ycuAj4FfGUW52N9gKUyONUjk
	Oda9FT4/T5htpLLCYIUNscjNHNJRjs2siaBpdZNKDfMvvxZUhUVaMQy+6D/yZpgf1Y5jzh27gK8
	d2IJGaImSEeX150k05oqiiVTnDTY2YMiU6SNRH6t9a6RXFXXjakweT1+p7RE3RJLyVn8RB9fg97
	j+OXB15HmT055qCJZCJNmnvq0EjswFL4KG+6Lvsqk+Q82wJut2P5wxkHX5855FR28AipX+PSHVw
	xufrNgxwGeEdZ6w9JDdDNq7XDb5vldyx8DxBAiDBkPMmlJ3FRq/0EulFLWfQL8gCZXm1e3vqwEY
	AXkZGr3605HVmWRZNaKb0Y8pXVe5RZHC0WmeD3uUCDQ7TcA4aI2AluMKZzZNXQk+o1NNn3Hhvj6
	Xmv96dRF+Ku/i7bjc3bONboLa0LA/1TxJS5auqnVxxOosuAphCJG7ewiJXXGG960MSid7Q0aips
	HXRv2n5LK1ByZd3h15yh8cxzzZCt8KMtXnQw6DKHjis=
X-Received: by 2002:a05:693c:68c1:b0:369:f2d6:4108 with SMTP id 5a478bee46e88-369f2d66dc0mr2292304eec.10.1792897611019;
        Sat, 24 Oct 2026 20:06:51 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:50 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:33 -0700
Subject: [PATCH 30/31] hwmon: (pmbus/ucd9200) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-30-e81941ad0cd3@gmail.com>
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

Pass sizeof(block_buffer) - 1 to i2c_smbus_read_block_data() in
ucd9200_probe() to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ucd9200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 5e07bba111a1..08bb91e095bb 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -85,7 +85,7 @@ static int ucd9200_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	ret = i2c_smbus_read_block_data(client, UCD9200_DEVICE_ID,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read device ID\n");
 		return ret;
@@ -118,7 +118,7 @@ static int ucd9200_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ret = i2c_smbus_read_block_data(client, UCD9200_PHASE_INFO,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read phase information\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

