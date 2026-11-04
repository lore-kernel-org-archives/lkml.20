Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785666;
	b=HHRAm+qQyx2vuasDAoMgiHPRGjMk1y8zh17HOMbxRa9pC7z1mPS29PTn/n2t3Qrxfuo/
	 C+r9GEGCqZgzNoylS4t/sDK3JAodcTl+K4AvEnlauFH/ANplAzzlq8+34p06AITfojUad
	 wglZoOtbltt86sp+Dknq0QC4CHO4pUcryxtzIt4PqJi094RVQURaoa4RqpAMhBRZzbDgx
	 oW4X6gQGIIbrCPDyJTZfaWYJMZtnDDXdky9Oqs4cMQGx55I2uf2UAf6q3yW/cTTqovC9d
	 YfqyjzB6ipU6KzWpIA22mMmOz8GSEHbeInKCQpyUrfJGessFRyw2DA8lIKxmcTUoYYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=Uh7Kzi5HknUWaE4263UOKqC/5G4430WqvI/t+055Hh8=;
	b=r8DfjVshN5sTV8MSLNZjJi7r8H8XA77tb/s9pwBN/mPNgIuyZYBe/bH3nwwGSiM1DxnF
	 EFIPQSNTuEBZSm7T5zt8Q+fNbCcoJ2HdZVzGsbqhDW/K5sBVSMGQN5w4PlnXru8dbDpgu
	 ZDoTIRJ2Fnxl0oAuxMgWeOfInm5/MRqWG2YxXSJzThSsKgGAMnw4mzRsq7BtiTXs4Z+uI
	 pmy+zH9b95uOyq7Bsv1PWu8EwVM7qMPIl78lvY3AhvkmH9qUe36RUploZmVilTsZQW6gC
	 IQ0Y11D6njoD7lYPLKXqy3LWPIZbJKQx3IJvCevH0LC/L9yj7v4R8vktJLtpb5J2SEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcUl6U+U;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F76606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F76606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcUl6U+U
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so912557c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785665; x=1794390465; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uh7Kzi5HknUWaE4263UOKqC/5G4430WqvI/t+055Hh8=;
        b=BcUl6U+U5Ou1V+OPIEa0wBAlKPH/Ca4ZNT6sIaYz1Iv156zEQdRXZgV6BJbM4PR9Ff
         HrKfYe2WJnPoOBJznPFr/TpofGloVrSSBO3crPlG51Ef4OcmcKZqXHewSNPmKDb/3/Nc
         nISBaemsAMd4wrBtLnKpKBWtvPWak3Hnb1K4V0e3sSYMH0EkAmhQKq80g3w0c8ruatf8
         mlz4cjVUxtKrFWgCe8XuAwB/MGToaN4p/W2U9QElW+s3egYN+SDnLydHZZsGPI4u2SHA
         p9/qC/5G/s+FyllFpaNq2Q/hwybrHAzYKLyUDZXBD0IX23LM7hiVKqf5skXHHLjVYOQu
         rcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785665; x=1794390465;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uh7Kzi5HknUWaE4263UOKqC/5G4430WqvI/t+055Hh8=;
        b=lWNFIqDM7fpCsRHXTk3eNjqA+gsJ5Qfr9kOoyx9R+dISoOiVa6QtgBLZSsWQA7bGNM
         ZliypTyJHW2vH7jl9JzNb+mhNs81aoTtmCzHsAlSVNe8ltjl1bWHkOTkp/9DSiTCogvJ
         VQbF552qbX3cbNiPnJCWg01s2qSZDx/tTAs/Oy6wLOLOWLPsZiL3o6JFcWJHGI9MUsQ0
         jO0L6d8n7YKmVOV8MGR72KyKj4jtX1vFW8mcpIV1FODQO3NgORRXs2dfTxvfe3MUGTte
         ynZHVZH6sSRhz9+j9MSNYgs+M68HQXAfIaTEL20iJdZn4RqPLZmV8rqA4l12kkvtYJO6
         rfAA==
X-Forwarded-Encrypted: i=1; AKwUvBxuo4JMHp1DML1KeNu4r1LFdus14NiE9OfiBFz5OynhJ0hZJ2i/4lPc0RkfpLYFwOdVx9jDRJ70eDpEK/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lOzHqQPzxmqEjKmchFpBEn3NhC3YnFs1cp5g/i45SN9O5nEDd
	T0EpFnaX6HS10WWbdqv/zPeA0mb5d5POyK6B63MsXXYo4P0syS2NKhL0
X-Gm-Gg: AYBFou0ynzxOpQRREWfpeD+CgJLO+BbOb+WLdLeaGLaWFMzmz8vDCCbgcRqpbdXgtSP
	5P89ERbE8qBrgIvl1uVzgRgMcdDuqEZEQY6jGVn3gGqSgHk5BkwME5EK+7PEbFitDzgT75lQL9W
	x06xh0Y3snrwaXJsSkFrCqgwL6SOvlUeLW1l8ytpXMJM25NM10bg3T6vgFaQFDAH+b6mW52jGHp
	ziYLyZKJ2BxHHSM9GPwOQJP8AiCQHOoLK+6ns1mDe6KKqQVfuOGDJp0/Wj7D4R+d+AbgmqKBL2I
	cwtgtkP1gJVmMUfIAQKGrqv9duLdJhono7lElj52agyUWmSOTz/5wevFA9o1XYLWQatWGSV6Jse
	sEQMS50OIB2Qi8z3zpqfR4GjmjdPskvK8GZJODxqg5dnma0fCRiBmSa38ngLlSavFXrNVdJhea/
	424Fq2K8vYO455cmVJifsCof5P+9Z6HH/Lh4G42EagMwnS3QuQcZ4Dh/HLocxks3JRJk7XUV8m4
	eNUbNT1shcbyglyqANpRr68xc19dU4DACpkf4XXMcbnGCuy4RC8OF5CNickvlTj4bU0tQpHf2nx
	IQhANEZgwNrmUt+cpaqphW/nNx4QCkRyF2/KCYB69VXLpXCVpFJbxI8B/UKjtg57MaI=
X-Received: by 2002:a05:7022:7f0b:b0:13b:3132:6e99 with SMTP id a92af1059eb24-1ac5af2da84mr21527601c88.20.1793785664520;
        Wed, 04 Nov 2026 01:47:44 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm6065186c88.12.2026.11.04.01.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:47:44 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:47:31 +0800
Subject: [PATCH] power: supply: bq25890: cancel pump work before supply
 removal
Message-ID: <179378565123.72475.2497991563887142080@gmail.com>
To: sre@kernel.org
Cc: hansg@kernel.org, marex@denx.de, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The existing devm cleanup for pump_express_work runs after the
managed power supply has been unregistered. A delayed or running pump
work item can therefore call power_supply_changed() with a freed
power_supply pointer.

Register an additional devm cleanup action after power-supply
registration, so devres reverse ordering drains the work while the
supply is still alive. Keep the original late cleanup as a backstop
for work that might be queued again during supplier teardown.

A KASAN test using a simulated I2C device and the real bq25890
driver reproduced the use-after-free before the change and not under
the corresponding teardown sequence afterward.

Fixes: a7aaa80098d5b7608 ("power: supply: bq25890: Ensure pump_express_work is cancelled on remove")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/power/supply/bq25890_charger.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index f7510ada6b734..a3e35e036b97b 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -1459,6 +1459,23 @@ static void bq25890_non_devm_cleanup(void *data)
 	}
 }
 
+static void bq25890_cancel_pump_express(void *data)
+{
+	struct bq25890_device *bq = data;
+
+	/*
+	 * Cancel the delayed work while the power supply is still alive:
+	 * bq25890_pump_express_work() calls power_supply_changed() at its
+	 * end and must not run against an already released supply.
+	 *
+	 * bq25890_non_devm_cleanup() stays in place as well: it runs
+	 * after the devres-managed power supply has been unregistered,
+	 * catching work queued again from the supplier-change path
+	 * between this cancel and the unregister.
+	 */
+	cancel_delayed_work_sync(&bq->pump_express_work);
+}
+
 static int bq25890_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1531,6 +1548,10 @@ static int bq25890_probe(struct i2c_client *client)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "registering power supply\n");
 
+	ret = devm_add_action_or_reset(dev, bq25890_cancel_pump_express, bq);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					bq25890_irq_handler_thread,
 					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-- 
2.34.1

