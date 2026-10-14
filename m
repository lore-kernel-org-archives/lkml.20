Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86143568FDD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999277; cv=none; b=RnGImBxpE2XwwoXN6ijIgS/dA0nrMB/SSwCbCTIf20IyIKwBMadT8cylVgp3SqG8dE2It8oSj8OuS6RjpjAg0gfvGB3lkDnAa6sV0/MS7QRPnCcT85Aabct8jKEZmeFOyAwZ4RrIxK3tWQg/a8/Kj6wFghCyozinDk1fbXes5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999277; c=relaxed/simple;
	bh=Ykf+THWd+wwdgtBisDTMGKg7qHYCcw/sjql5oejhnnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPI8Rm5pBBmP5/ilrl7yXLvB9XbN8D+YJ7yZc7gL7eddAtM8CM8GEDw7kTdHmswBQkNwmghZMChL4K4pxnaMlR362h5QzJn10cx29dyIxlKpaIxDfECwXBJ/CrBE8ftwE8BPCxj4g353ioVpOYZXpoM0760siciRVM9sFwXTSuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy+oW7hU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy+oW7hU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e3846d1caso711495166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999267; x=1792604067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmwpXY0pkazAyjk8nr8JLuf2WFindAFqPQA6knsCB1s=;
        b=Dy+oW7hUiHgBkmmHY0E6bAR6VFqDJ6JOveMyBQg3XTZX2fd2rHbknSS1Gl53z+BRCn
         AXVt7DX9eZ5nC07nO1IyOPlYedkqvsEsAXsFdYtsmA3hjSGZ1iFFIbnTLpw9SD8NRpiw
         uCKOdlE07drXqKVe3fcDpb8vh/nGS+2YHQjQwq1+EN44FU7iGkVrXYUwv0IjF3dG6n9T
         Fnhkhu5ttdQ747V6MZZLUJc9joFvSd9agHgONB81p+RFrnrMfjt4kdL3OIbE4eEYNl+t
         PMykS8+CaYrgMwa5gyaNg2AnJt6jgrdcFe+DUVyhbLAr5pbeq6xI0iTXdjUadDNzEO9P
         U3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999267; x=1792604067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmwpXY0pkazAyjk8nr8JLuf2WFindAFqPQA6knsCB1s=;
        b=dxHPu85P7wpmTeqfHZTq3RApiE+3pMr13Z4vnxszSXCXYJG8m9KWS/0xn5jJ0PmWna
         YDdPAmJygmjTRCHkBzayuQhpOG4unnsd6jM3LIdZo4cXqWBHwZNF+xkq89tm36SyBtnK
         s6br53vti0Y5CqEXqqipnRxmn3frssjC1XTSkKafZ2XDTPGTRuqGttpK+XE9S6foHTDX
         NopWTDEPqlkmILNYFm0uV4vDKr0swImx0LLJ1OhQ0gT5t9yrElbY/7t1RSg3frTqrMiJ
         AGmFbRAE259VBHYeJPh6O1wc/iSQqf8PtJj6p8gTcHNy/dxiALPNKkYwUedrgV6h6jpe
         NOfw==
X-Forwarded-Encrypted: i=1; AKwUvBw4rbgof8JpABVWJkDddRK2IJWLaMVvetJEWIXKC/z5sv5dUpra6fN4arEDO26GyM0vnFUD3chpG31HJmw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEOKCtQVUBjIECiKrok5HOVdk8qwUxwX1I9rARcVkt68fxg0R7
	gu09nhw3Ok0tnuWuPiNReK7WtxQmTElfm3YnRJqmkvXwZs0tPYX+mbEV
X-Gm-Gg: AYBFou22x1XqLkXtYCfgsvU+8P/UPVpos8wojFRxYR3x99WgOwh+g5iXE3x4/Catiml
	3pBTooDPRC3cDaNb+Po029Nfy8suwrQ3VIAMdsFxQBb8XX8ldp+SHgU/xEjr9MCSakBemRzT7Tt
	wFMlj8gFR+GmFDxdpQ8y5f1jTaKbcPcwKcNNqvDdFpGTHd6QccpqnEWp7bIB74wuZ8CYK28DVkO
	NNhW/xomKa5FkPh7dFmRBa3RX8iOoU36ADcXrjiREW3rzAqW+eg9QB7wUJMX+AGPRG1wZ2TOosz
	ZnL1RBFydZCsIz27cotkcZWbVozcAudecRkPUvC3fs9jQ+ctcPGt0vNd59KoqGYxVPCQYhmh1XT
	k+A43rwsfjVOazLdl7k8bWacP/L6bnG7RWbc0QzsaB111bQQ65AwD/riT0TQFZm3PGO/IVTbCqt
	n6hmYdUhXZODWVgO9DxvMarCZraPAX9ewSUueBhfI/MJos65wGLC7L55kush5eYByTw6o7oPBIq
	DHC27Ghu4pB0Gy1SHQsnOLWV1A=
X-Received: by 2002:a17:906:100c:10b0:c33:cc6e:1058 with SMTP id a640c23a62f3a-c33cc7d5811mr649024866b.24.1791999267535;
        Wed, 14 Oct 2026 10:34:27 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:08 +0200
Subject: [PATCH v3 09/11] hwmon: chipcap2: do not discard pending alarms on
 disable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-9-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1461;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=Ykf+THWd+wwdgtBisDTMGKg7qHYCcw/sjql5oejhnnE=;
 b=rPohMS7f4C8gD/qGD/7EKwN795k5pUHWIqrYc1aW14it7pL9S5jKSjA1/029RW2pOCBWJFZH5
 jqTPS3H0+PgD0hpdiVMFcLt8mmKQaou2RK3O1xMX4E3P5QfMn1R/kJh
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

cc2_disable() stops processing interrupts before the device is powered
down to ignore the alarms caused by voltage toggling. The handler of an
alarm raised by the last measurement might not have run at that point,
and the alarm is discarded when it finally does.

The sysfs read that triggered the measurement can then report no alarm
although the device raised one.

Wait for the alarm handlers that have already been raised before the
interrupt processing is stopped. This covers the case where the handler
thread has not been scheduled yet; an alarm that has not reached the
interrupt core at that point is discarded.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 952789fdb9db..eba6469940ab 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -146,6 +146,13 @@ static void cc2_disable(struct cc2_data *data)
 {
 	int err;
 
+	/* let the alarms already raised by the last measurement be processed */
+	if (data->irq_low > 0)
+		synchronize_irq(data->irq_low);
+
+	if (data->irq_high > 0)
+		synchronize_irq(data->irq_high);
+
 	/* ignore alarms triggered by voltage toggling when powering up */
 	data->process_irqs = false;
 

-- 
2.43.0

