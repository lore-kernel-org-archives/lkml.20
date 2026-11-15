Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708113;
	b=AKGQw6JZsg2bdZqV33+Se+VR8h0GcVi1SgUiixzSPgKy1IYrCgTfQylddFBT58rCsDEW
	 iYLxhBg/Ec6EO1F3EyCxF2lyTMd1Ov2fZoWmsWK6yL6gCwyqvLJPQ2fb5kEyUtITPbJaj
	 8RHWU3ExHbFZJN0JD2z04rb62d80l1KfP9ANdlvKCkN/WqGc+7c/sbFM/jfbQ20prR4Cd
	 QHAydEzOgmoayszGnC+VRM21XjJ7N3RXyt5mgcpKU3IE8s9YBdkMS1Q4N0HBAwRwmaHdF
	 Ye9ZOX1cq/yCB/+mapWHsFdF2re9fj8hnCfUKtbktzsa2XdCpPnzSmvVmINipbeEKzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CQUJEsM41kQN1gS1eh8fcKksxwF/ZWRkcSj8ZZ5afgo=;
	b=Fs/w1Fi6OGErc530m42iNLMJGTQFTsM1oWo90BvFMfItCEfQFYpqAAM6D006RMQv3ZG4
	 8sk5h6Edbu7AvjVhSXq691MaHqpKAynTdXukr/mKWoTzbKwvDLQDv7tjnMnkQALNrLLKK
	 Rd668cvDDvom5eKQpq0sapPwN/8EjAxeIuflmZHrFrirbzQXHSTBlIvxed1dD5XQyUuxR
	 /mMSNqJj86J/SVXs2VJbA/+5a6Tk6EwkiwH9yyzDwPBJ+KjeUnpLPF/Cl5Kcuach6IASf
	 PARUM1y574gIPvAhYct+IXO2ZcYJ3JELW9d4uiS0YyZk3zoFm+35BhlYOWIoSnNLrNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtZWb36q;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41BE606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtZWb36q
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37d424f1ae8so562615eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794708112; x=1795312912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQUJEsM41kQN1gS1eh8fcKksxwF/ZWRkcSj8ZZ5afgo=;
        b=JtZWb36qW7JSsf2oREUwNmV0N73WQXL4ymDp3d3pF8nvydsVsmIvBN4L09dB5MAeJk
         pqpocR1/1pFMUUfgYwB56cxqGBk54gEgkLqjvCsO73mlaV/bgcbLB0+ifML5FVmouXVI
         RXSEZxg4xG88cT993gOJ4V7B1+Prn7mUs/N6iVgPcjC+5aPtFicwoLgr3EashKHfgEBG
         /wBS0xmQ4B9Wtvt1WGUgYPeuI55A74dGGySEjQWd1v/3Wt1RQNp0Vmx4liOZvC9I7s6+
         aCdm34i4ervs9AMsSvWrfUjp/qBoRU+1xUan9UUOw+E7DwGBfSxeiRfC/mchYFVm/o1Y
         3DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794708112; x=1795312912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQUJEsM41kQN1gS1eh8fcKksxwF/ZWRkcSj8ZZ5afgo=;
        b=q9g1Bfo7A9DG2Kczdk1p5221HH5fk5clQWsl6z1qlRN9U3QtLXFr5ucmXP/9nv/cP+
         qD91AY5sWlEKr75othEYTZTeVyt6WYu7le5E1A0e5JZqKre9tAmJ83+MR+Yy+hyTNTiE
         stTDrbEi0ZqtHIFaCwWYXpti0C/rK9pkTEeqedrcl3t550VJnIjowIq7fkRnR0KYLdvE
         faH/gJGG8iC+bJSCCfZO+02CxfGqTYX3u7PyRAaBsUl1FhGMXB/RJ3ZfmFIWbEHV7FuK
         QmfRzg9mE70fL1k0l3Lc7gFGImAMZNBnJ7/r7y93BA3W/PHcyXo2Li5P/jxvIlDQG+tP
         PBhw==
X-Forwarded-Encrypted: i=1; AL+hErGrfBA+sDJ9QcCd9SgObYKQqAMEXVD9logsGHMJV3cV4iEbhTZkvHBtl7SGyEVIoUV8KAOQW/+4h5N2Jls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bdq2HrmoiR+KHSmBXrLE9fR2B2Q3jMPKewW1dLkaEWmX3+CH7
	YquYYm00ZGPtGvSdO32RLrgHsfP/ewDP1jBx+citerPvaQRCPs8XsWs5
X-Gm-Gg: AYBFou1Z8CBEEWvafY5hpX66NN/QKCoxZ6w+gNrweZ5ADADiVyeLfPrAeyDP+df0D0C
	AlZActS4ZQOcb/HSay29hcmY99pmm3ryKzFC3LV635yjMp33KCC8e2ky4VohqIKVLxbVs9HCjYX
	95JJ0p2+dc9amPSQF3uioO/sdMva6JeQXw1ld8o83po3ntXMj0eUUWD/eh8A7ODo60+O6eEEDxo
	NkdAgDXTrm/thHSptbfHnyCHJPEWPWNta9KHFPcL5NBrgAdTeqFUfNVf/IlwltU56Pbtzdy9wR9
	+Y/1UKlUlPwB7d5JYgsJ2mb0f+jr0Mx17Y07PCsMKIfrRe59x/Fuxri/Ia7tIzXUA2wsQ051kXM
	T+IvD9CtbEclBqoEFFrJfGV5MWUGLZ6PAqRzOi0WNAS1AEYxSJKsysURlG5ZyNR5jVN6eR36bwc
	PdPKjUZ/4YxUkcQTrBQC/AjBtXwCPAScwUilukFgb6iK5gQqpCchOOwCJH49Jw+odg7AFQkmtE8
	9yvcfSPlsOTI6LCVxyScX/4gUIVRLF4dm0TWYCN1AkMZnHD56KrdSoSc6fEu6xc0ufj4p34ocFP
	HpMvbF+iuu65bMqb7jg5gVrmp5hMrInAylT64+RG8Vt8hx9JqlgdSPjcO1NOFdHj4BKa/GsykQb
	BMdr9
X-Received: by 2002:a05:7300:ff43:b0:36f:6b99:f963 with SMTP id 5a478bee46e88-37966d408a7mr6873878eec.21.1794708111511;
        Sat, 14 Nov 2026 18:01:51 -0800 (PST)
Received: from kdev ([131.179.133.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm30588433eec.18.2026.11.14.18.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:01:51 -0800 (PST)
From: Niloy Meharchandani <niloymeharchandani@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niloy Meharchandani <niloymeharchandani@gmail.com>
Subject: [PATCH] iio: accel: msa311: use devm_mutex_init()
Date: Sat, 14 Nov 2026 18:01:29 -0800
Message-ID: <20261115020129.10259-1-niloymeharchandani@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize msa311->lock via devm_mutex_init() instead of mutex_init()
in msa311_probe() and propagate any initialization error. Include
<linux/mutex.h> explicitly.

Since msa311 already manages all remaining resources with devm_* helpers
and defines no remove() callback, using devm_mutex_init() ensures proper
mutex cleanup on probe failure or device removal when CONFIG_DEBUG_MUTEXES
is enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>
---
 drivers/iio/accel/msa311.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
index caf9b1b6397f..0e1af4761b7d 100644
--- a/drivers/iio/accel/msa311.c
+++ b/drivers/iio/accel/msa311.c
@@ -29,6 +29,7 @@
 
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -1156,7 +1157,9 @@ static int msa311_probe(struct i2c_client *i2c)
 	if (err)
 		return err;
 
-	mutex_init(&msa311->lock);
+	err = devm_mutex_init(dev, &msa311->lock);
+	if (err)
+		return err;
 
 	err = devm_regulator_get_enable(dev, "vdd");
 	if (err)
-- 
2.53.0

