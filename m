Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF6A39CD1F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211366; cv=none; b=ikXW/AOAmhNH3Wl9iAQhbREEMLDyDVTqn8UZof28v05PWV7JqJ0w8QBv/zEBfNql4pMMRiyFuWbxyeUI5+r9eWE1oGmygfvRWQlm3LVY7agYSQKelMqO5KDnudTn719Xv5HFiMrn1QCjXWi+69gfFHtZ3UNAQO4RoVT7f2FLMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211366; c=relaxed/simple;
	bh=VylVE97urOnGo1fKhA1IwM8dNjVc6rVPycHxhapEvGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCKcqOvNW8YvI/xHlrEVtwtt/jje+qN98fcU8zLF0Bu6bDzfrNrSR8El8vXbRSy2G+j81MbR0QZ7Dy9soKuvODkP7pRH9rtQR7CQjkbXxqlIrKVWtmZVAIUnzRKANPlVxsG1pTF/utIGCL4xb4nMoCCTuosdyfOfhbYdz12+gD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYcIZQnG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYcIZQnG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceab75934dso47160425ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211363; x=1788816163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=EYcIZQnGJtMS0MpMPLpanWN2p3GAJtGW8WuCGaFlnXiaZ37hQ1f1fXqmzs/9rZRWgK
         VS6LHbR6bn9cQmeqdN4NJMMpLuyXqoOy50/VnxLCFf6aXUx5ZrSeEPhnnZabfKdjMOnW
         i0lgC2tMmAWG8a1qRJHziRpln6r43p9yQARde09Qn838yznOS/Us+1EErZtdhcd68ZvC
         nmie1m/RPlCTxiXIy9faJ48rvXujXK2wbhIGum6yBwG54jyEQBsrS9ALo1RZJ33aDzZa
         L1PuLY/SDkoW1gqs2QC7cO0SJr6tAF/WCllorAh951QKaBpgdLHMcflkQ9DswjkqZg8F
         PMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211363; x=1788816163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=RVidqo6t/GvkXGIjV8Cho7Ct9M9kS8JvTuHXkaMkiWCO6J27fLhkhoR8gbHyUIkcpf
         OCpRq/7+4bszs0KnIMhKoGEpjpNtrifBNNYQoBPXZbMSIDbWNb5qdc5lU4CirbedhW6p
         u6NIKZNxl954WmDWkSOvsgm9bgcSBS8sSVFtMqAxEEPNsXjDE+1lQAywCK+7R2DoMoLU
         0qEQTFs1HU0prCnC1vTfKz5jxTCp257TDbOqsxPmhQ4ITXJczBBiYz3lPMj1c0o5ShJR
         tBRTc3cLS5r+1S0dcE3XVEGzS8NltxKAC/zYsxzM0hXDOlifM/Cz7RruCRNvwM4/HI3l
         voCA==
X-Forwarded-Encrypted: i=1; AKwUvBw1ZSNC6SkS36dKLhXvV9wxSW/daO2VFA3xSzcIQ5afLHNViCt3DtSa8zw/7HUuP7qxhUz/3ivvfJpQRK4=@vger.kernel.org
X-Gm-Message-State: AFuF++kgXwKZys9oXo64AQeFtX4OLOmSzqLghhWtVhWK4ej7qe0QFO8+
	dl3Nui0Ha5TNBcs4qFAB7pmU2kEe4gJCwt2sM2p44vDs7haY2gSau1Vi
X-Gm-Gg: AYBFou3nVsf/tKJBfrmfULaK9EmPaIqju/sYulJZecN4/LA5OVDNpMmcY4EOQtuSDWO
	2LK2fwKSCV84/UB6JgkPsn7w/PEioGl6uDK6jqQUTFlCG3ASmRGsOnU+/++B/GSkp2Ogt1cx/AN
	1NnNI1MQjK8hsiiTTxXN892ASrM6bZvYGA/hU7HytmI8pv6WwJhQAvbMFGbuPnFr39+4JxE6EZ/
	Pv1Kpz0AmkrJlzDObSySE4HYrMwJs4U7g8G0blY5M1WFt06kUr4G11TXOcfl7ZxM8hx3IG41HtK
	vzov5XkNr2h3o+8yUD59gaZ5pJ7SdO0n2AEysZRVAR6LGPAGp9V89PSAzwheOQeMWd4uPqbOOAM
	1+uOJMtOFVieqb06iLPhXb7oVmija5eDfcgTZUiqS+oEU6Dw8eRGtJq/QuI5/DTfYFTLfdMSMuH
	ifab4bvTWCMb3Pdu9QG7mRH88nt+p1tbQPP9852d1IYSwEsZ5yuJfdl4BdO03yYP0VjQU=
X-Received: by 2002:a17:903:196b:b0:2d5:ccb7:12c3 with SMTP id d9443c01a7336-2d74dc2b30amr430405185ad.2.1788211363412;
        Mon, 31 Aug 2026 14:22:43 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:bac7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm37102538eec.14.2026.08.31.14.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:22:42 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v2 2/6] eth: fbnic: expose all hwmon attributes unconditionally as read-only
Date: Mon, 31 Aug 2026 14:22:30 -0700
Message-ID: <20260831212234.1212971-3-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831212234.1212971-1-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All fbnic hwmon attributes are read-only and always present, so
fbnic_hwmon_is_visible() can simply return 0444 for everything
instead of matching on the sensor type and attribute. This also
prepares for the threshold and alarm attributes added in the
following patches: they are exposed unconditionally and reads
return attribute values.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 6c8c66ab86c1..38bb26cb8e6c 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -20,12 +20,7 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 				      enum hwmon_sensor_types type,
 				      u32 attr, int channel)
 {
-	if (type == hwmon_temp && attr == hwmon_temp_input)
-		return 0444;
-	if (type == hwmon_in && attr == hwmon_in_input)
-		return 0444;
-
-	return 0;
+	return 0444;
 }
 
 static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
-- 
2.53.0-Meta

