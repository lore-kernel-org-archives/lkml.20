Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986642;
	b=ctLUB3QgmlpNoRXA8TvvarQs2+ccaqd8fNPsBv1C915E5iHton/x/aT8FL0GL3yReef9
	 pveNeZt09TEm/CN4nTw/M4RxgwwikbfD7ZPzV1ZvU41OOrBG2/J4Ud4L1GivQGVwP31I+
	 4dRo7wOKMj9bxodBPWlbpo5smOFswj3m2ZUIv8fzhM0+qotkd7SkXpKWnxlEnkM4RVBcD
	 hq06b/cA5zwLmS3Ox4Ot3i/3nKoL/Wj8xMSu8FPYuLidISO9UWBwgFNzwXKX3YHQzfdc2
	 dlmdbLrq1o++LWeys1YP7hkyKtIj2FDFs2KqdAm/bNPkj/uTWiotmVKkLQeWV7hhlpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q2QE+OZptzDZGsYhruEEL20JBe+99WFrn4g7yRcm+wU=;
	b=FEUdnNGUY8+6hrrn9nLu4d5oD08FO7sh9Irnf0uJ5B86RQzRJIXKhPm7is2sSYwVZqnP
	 BCiKKb7neye3+/o0a1r+IAhoP9PrE4KNvNeQJSTxiLPxX8YfauFfV0rpk/689IP6kvNjy
	 tD1M/DlNL8yLKbE82l/qf4deTcohoKOjmDCibSXgl//GhTGIIgYqFo1DAtQwnUzXQqJIt
	 A5xPIhKhsTY5JvEkuhqiysN0eiSZpCvjFqwSChAiHSo8mFPwSMQSS3r8uVyC9lyskm3aj
	 LGtW6C9cZXRy6PzRhzHViBiwCi9enbZ92yuC38Rotgz6vQZOFcpWFSZ5eEZBmwTRZmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cxhBtIU5;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE58606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cxhBtIU5
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7a6e560f580so1753846137.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986641; x=1793591441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2QE+OZptzDZGsYhruEEL20JBe+99WFrn4g7yRcm+wU=;
        b=cxhBtIU5tn+qytGiM+Kmu4TfoPBsXWL1lUl484rWOdnlmx6Qjrna7WQxq6S9R2tiWP
         nsDPPjv5BBxr2BOv3tX+mdQNN/soKE+uT18AaMl6Z/f7L6CyFHCLNCWUjOEMaoao/hg8
         9xXi51QNL/4BakMjUUfN1Ue+gHX7nICWrEYaaY8M2N6kIdrHkUgUuY01iONu5aTG7vUY
         T7MRCupXvrC54I2moXMHY1ipqFkA8d3boTrU4RO7k2gQca0pqLDimogEuWUzCiVfTKC8
         rKbD3qaU4pKnXGemRZl5ai5cj71yRt94FApVAakKhTMcylJXcFpKEz7Qx1iRaLULZ7na
         fI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986641; x=1793591441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q2QE+OZptzDZGsYhruEEL20JBe+99WFrn4g7yRcm+wU=;
        b=yFesra6HONNvRZuGCyTW1HSmq6HkUEKW0BI7zn6zKoibPQkArUpEFnRkou82shLpaD
         S3f4gEwH+njs5iZHXbQaoPWwquG43wOJP5tmw9796+xMyO+f1c9xo2jm7Lks2E17uktI
         GPowu66nwnVBPgFVrVyXUHT9ueQ92uEMOCr5mE019dymlLxpW7Z7lksajvtK2btxSXWE
         LkzWXsor3SK+9qZgFZQnQ6Zd/y6znoQ+s6d/TVEXs9bDY9B5p8mLubCb7wv2OW0PzOiu
         mP8K+kK9OGgqhQuprbC7q+xrFRTQRHa7V4ooiYV8Uq/LWtK3wn6UPKu6oYWxG7fHKjjF
         T2RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC5/G7Mx/YEnjhrne4LeOmTzM8tTb9ksjGET1+vO0wWgv4MTjhRXQjxcdCaiz+t+Z7Sp8AzPxBhQ3o0E8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCJeYCPDzR4PSYL+buPyC3h0CMHsOeeU2LBMBgZdF+hGdPGC73
	F0KrwuVyrVuHaHjh8NfR+OIAlvyw2NkZc+8DALN9VvoV179/UnaGJVx+
X-Gm-Gg: AYBFou2Hv8zD5GPEGGvQCExdnfgZRK74fregyMrHzM6yiirrZge9F2Ff1kA1mq1YYr7
	xHCe0CgBKjq+J61Q49etdHHQAY/WZ4pIDdw+FaBtTM3PyL7wF3fXWHGy21gVNtqkXgJD8LDYGjS
	oe1dEtjaqsTD7IBi/paXCl0pX4jBdm+trhYOPIg3kN6H8XE2yEDZb1G9inQ+1znXyawqlDZ+ia7
	ejgwVYtZwZjy3HjKcxnrso/9MqrZWeU85+alYdfKjIqRqllS4fu204MhMBvLabm4F13p4cWyfqc
	xj15On3SLlpOxufI7lE2lCUgvTB9jaPLLu+dGVpibRvXSxZnOL4y2oGwn3Ly44AR13Qv7iOckL6
	rCM3WhFxwqYqB9lkSE/DMbhWT1elRQnLNRTGQRpOdzvOjsoiYMjQXBFob3dTBfaX66q51bacWDZ
	FUb7keshIkhFW4gbdkVsXynNIV33S6uxQPZMWsPx1TKjV66TyIGeaBLdJDB5u+RWTNelnx/cm1P
	Phcx6FzVO7ZkwDYba0h7u7bH8MVxlg3bT1aHyvegiTzoTywWPYAcciNJiJgKgyrDTPKEJF+Z2t3
	TiF3QUHR81LmOgXehAsP
X-Received: by 2002:a05:6102:2b83:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7ce5cec77eamr1900572137.35.1792986641275;
        Sun, 25 Oct 2026 20:50:41 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:40 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 1/5] media: ov02c10: Drop duplicate register write
Date: Mon, 26 Oct 2026 00:50:11 -0300
Message-ID: <20261026035015.110903-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---
 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 8ffe0a07e..80edd025c 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.56.0

