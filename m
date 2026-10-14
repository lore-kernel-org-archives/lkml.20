Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628CB3AFAF8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946577; cv=none; b=JNwGnAT145uoU7ioDHx3n7gMBrjdX/a5H8cZ0OUVnwyfiSBD0A994nhYQBJPTLm12SNVxUIe+r1rsqYqDZ8GxxQuJok2c0e3rcZYBJ390uXJeW+GWONi1+b2QL9l2VTjlm7ABnhQpsYGgNF3M3h6nWmYz1RoV+Itd0R6bWEnwF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946577; c=relaxed/simple;
	bh=fBON41rkWJm+Nr5IP0+q0DD6zo5hPQEiHIFcCKvNNZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcKbgNa1CuPiYhRoVttF76RcjIWoCowLpttaSA/ABvj7nF2TWZupY8B67UQa4dMn03FUdggL7q6p1Cf9L9otszCb7ayA6EDLO9PQ6A19NSIrbBGGNiOxMks6QtsQMRcK+4qF7ePCsnWw2/5tjgo1WnPYGmzvUPB4K3qDzFrQdOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=Ywin/PwY; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="Ywin/PwY"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1517bda04a0so2272945c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946575; x=1792551375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=Ywin/PwYXQhTh4ucHoiyRD/1QKZQQJbdfFZzrlt5wsL4YgmFSGgtolQwOIx9XV6UXY
         hTNNDm8LldA/ryQazfzd5eoluVf7osUTyoZWIUKlhaTjwQrkBA8kws0+Du6g0/BS1i9Q
         4nqdCyaXN8Da2BjMDlwLHrai1Gt29+rpraXf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946575; x=1792551375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=dMQfooqADZTr0IaQwsfj+wmWqq4R8YmoYHIssSnUD4xce7Foxg1aIizN/WfeE9yLJx
         C0hble3LeiOrgUljntJOvbHULhpQ0I2UnORFezy5sp0ugaRTUr7OIny0r2ZsENm+x0hz
         RvmrOMfAPK8pTlxeOPyBncICpO6GcD1ezqRa1VYYY1ex2slG0Yr/YscvqgL5QaNYqrZu
         kG69tQgzb+mu7DzYp0te8X8Dju4TX1C5HXTirPg+3qFEeazh4pceAacm2Yi2lQhNXSPr
         4ne50OeUtaPcB703g+WSeizNAAwoSYoukIbm4ZREOiamqLF7B24U7Gqh4v2W3ijiFdCB
         YXHA==
X-Forwarded-Encrypted: i=1; AKwUvBzAwdm8X6J+B+pi+iTOzHkkXOrGZk1rsDw4NLEJTSIGKfh6o9Hcbjw7dBM3U2ZJfOV9+hpdb3Cr80cubQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJW0Kd5FruGGLOQXZI5GHpbPWyxcE2rFQPdinXNn0RBaNjvCPb
	Sx20dtV8YHm/uu93KTCKqkQoblDjIrInDYL43EU8TX2ZZI59d6l2jEPn9djmbBdX1XE=
X-Gm-Gg: AYBFou3wQcpZDkw8R8g8U+pnGG5LIja0l4nkoZ0/TfEdQndTZlSw85c8FK8D0jjs/MO
	9HP4M7GG/VOxGMCFOgB3nYqyafTaWwiIfOoDT/KYByy2+OCY2r5FqlYZLqggNLXYrksYyE6r9A7
	qdsqzR2HXFhmOblJmHP0Gk3bFWD9gxdzty+HxbCDK4pMAljE3ry/D60holHaennbHufgLlKUSHj
	WKwxR3a1+IW9pt2rez/BYZllt+BLSzPIcuN10lq1s8SHnCDLruLR2U/9O5GUkRCitXkMBViiU9I
	g3SVIWf8jHrInMkJM4k1naRkbORJL+o6vmUOujOwkvQLE1olXNyFg9cqpJrqRZCyupCFLripPr8
	x9W6KLORu30QUMSMXJntL3DxR4icJsbQnenHo0zA39f4Plndv7PaLo6QM/K6ofAncIMadVgaDGH
	hE2VtUlwtWqkWE2lOnsl9YI3YEZ/YAzaoRnEjk2zwQp525Lz/PgaJn5WggyrPnsjl7sbzd/TKGY
	HyLyf10TgfpCliDm0rd6pdVlWSayJNom1z9Yg==
X-Received: by 2002:a05:701b:424b:10b0:144:e246:a0b5 with SMTP id a92af1059eb24-16a5e968b0dmr19796817c88.40.1791946575008;
        Tue, 13 Oct 2026 19:56:15 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm2122640c88.6.2026.10.13.19.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:56:14 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Wed, 14 Oct 2026 10:56:01 +0800
Message-ID: <20261014025602.26334-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
References: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_update_stats() reads the hardware counters into an on-stack
struct lan78xx_statstage. If lan78xx_read_stats() fails, only the
rollover check is skipped: the counters are still recomputed from the
uninitialized stack buffer and stored in dev->stats.curr_stat, which is
then reported to user space by ethtool -S.

Keep the previous values when the read fails.

Found by code review with LLM assistance. Tested together with the next
patch, which makes short reads fail: with an emulated device, ethtool -S
then keeps reporting the previous counters.

Fixes: 20ff55655a93 ("lan78xx: handle statistics counter rollover")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/lan78xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..cb8204371f5c 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -789,11 +789,13 @@ static void lan78xx_update_stats(struct lan78xx_net *dev)
 
 	mutex_lock(&dev->stats.access_lock);
 
-	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0)
+	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0) {
 		lan78xx_check_stat_rollover(dev, &lan78xx_stats);
 
-	for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
-		data[i] = (u64)p[i] + ((u64)count[i] * ((u64)max[i] + 1));
+		for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
+			data[i] = (u64)p[i] +
+				  ((u64)count[i] * ((u64)max[i] + 1));
+	}
 
 	mutex_unlock(&dev->stats.access_lock);
 
-- 
2.43.0

