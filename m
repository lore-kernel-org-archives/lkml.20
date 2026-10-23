Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778240;
	b=IiUYqKQslIVLQjesu0fhMDANmKy4G+nqPo0YgCVYehQYKUCECwMb7ZzfhRQ/HzaZVbUG
	 3DnQcmr0S/m7+CZM5/3dNkrH9uO4ohdXkrBSVJs+mKtmHMBzKvvsXikM07e6+bw5b8do5
	 J05EZ3E0qq08B++xMq5AzjOWHisBQYyEJlGrE3s0M+f7kRCgcjBaxknmd6HKrXDfknGL3
	 qZ2pkbP8qO7PvSxMdcVcHwbMqP3tR/aWp39KWCQWWcNO1asaqDgHiPXxRo72VekKdJ6sR
	 GjSy352X57nXRAUfSofJ3hL5ebnbXwHVkBw70Wll0iSbX5eqSiXqM0gV1K9igsLwHrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
	b=4N3My0gdBPY/pDqtjNNNCFegMVoc6fiJfKyBkqmXdfKn8icDFYShJvBr6f23WLk4fNoo
	 4RtLlgWM2dom8nN7nrMSHqwye6lQr6RAMdlXDNTlIlhhEfKRwXVPeUhfnOsuIQ/7pVTkt
	 aT+bJi/iNP8YMtskSir+7XCCyEr+QSxj4GIrnWeC9OXXpgnPrefVI/tBI09S1T14S8bP8
	 QZ3utmz0Hh8tHAaDukkhJwFGwhyABmUgA5YoMm3guJUvl0x6Xo44u9RfeVyQqlkBJLyoZ
	 4UBxff5FC+ADYik4FOvejnwk41LekBKkqBUXEIN1ghp3OkMmjtkcza3Soeh0nHi5k1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bj0ur+m7;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF037606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF037606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bj0ur+m7
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so2629787eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778239; x=1793383039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
        b=Bj0ur+m7k4e7MizKwnGdujkcRSCNB8Qh6TlCtyipHzPPtcn2xXZ+MH8tbKC7p6lKH8
         k2I0FXBC5AaCCbuA95AMu9Lz5cdCvwir1zR98X56nWyhsVACLuE83StzhtUgOb/VP1N+
         kEsLBmNAop0m9MCi/QB6uLeBkeT10wx83p77HdTGb3k6sHfMHP1nmtgpAFs/h8/dnCbn
         uosA6muR0sgprA2WA419vs8ppWd0KZ68CPihJpF9or88vZOtmxzuQQrCqO9j1R4dUGZI
         DPGSZDSwP4XdWpujQ8YpfKlRNhhYWW4DrZgeWzWbF9k4mNBLiSCjPEGCYrzdpRiB+OBW
         QNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778239; x=1793383039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
        b=k20wo0JMVt3kcuxqu66Sf9A4YR2llW2JR/bJEpPJtx2w3XSGVH8+LTIeh9AHfaI6tn
         xj2DJMD9KVR//q7TUyjKW7p7GehCe+Bcms6482TM2/YY0nnwKbqyiUONJ12gpj5Y5Ja/
         8WJ7V3B+K7/EGMoOGRTV1Xuql4vPwLtsmpW3DRNj0ZffRGQw6MpqX7/zEUX7les3GX9S
         3WJnWujlffhgKjkiScRZ2qER2mDRXq6adSoehOhbQdIgRkBMWEn6uq6I+7ojVq+pdbLz
         +xyjyUesidUiIrtapZ3z29YU/uhej1DUbCm47QuhsBWsWGSCOUBomAIkoY6TiOQz+Go+
         C7/g==
X-Forwarded-Encrypted: i=1; AKwUvBz1TC2p2tnenJs5Pn/qySXcldckurDMRAVQCjrHuebmXU9OehEvSfKJB1K2Q5xYrjA1PQnGqQheGG58Eek=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3GIFqQdxGHmy0qJ8Wf/3aya8C6KBa/9Cga0qHjnYjwa/VjHYx
	9DkwxKKVK6Ct4hn0uobn+LDpE4j06ZD7+Hf3M9aWUzAMLooRxN/lrzFn
X-Gm-Gg: AYBFou34nVIzPyic+MPwlgs8eCsUn1pgxocT6VO1LwA0xF+i4CIRJ7KL7R4NnL2G/tM
	hGPwyy+52sQrWeHn2SR2JaFGCbYVOykSxeYLLS7QfUbEPGjnzYMYdytHnwy3kJvezq1jV09KkTp
	t2MaPyPUOLATDYoXHJ3IVTGW39SzHeAqX+exCKLvupdkfodvMPPtbPB2MHLIsM0htIUNizvbGjI
	UPI0+c0W8bRAifYEKZB2CfWqefz6CnAq4PhJVFb1QBwmy81fUYGsdV0XHSzVUiVEYG6moXGJovd
	/sY3pzxL0SpRFzTYEMDDcPNjS0kz81xfvXuCaDq3u9xvZh0yYoRxOMloByKXhf4GswhQtq9ucO3
	glXOw38i9DWPUsS7I9q8vNyI6iRsfgv/iWyI13phHGdRLw1QNF5w7qDSHGQ9+/m+GFvEMfFX3oA
	kFSBFJOM13o/sjNoY6jK4zlqrYKXUxPTb4g0BgpuRh/gJlZJjjgw7JW9gnEVuplrL0DrE5s7Hwj
	6KyyuqzktHrjBLBr+Xg2ed6ed66uI5ENMChJrxQpKSv0cxUGcEeJFVzV4xCIocUdrZCEsK4bv4D
	64uc
X-Received: by 2002:a05:7301:1a01:b0:356:23dd:3c72 with SMTP id 5a478bee46e88-369e834e1c3mr118671eec.4.1792778238706;
        Fri, 23 Oct 2026 10:57:18 -0700 (PDT)
Received: from localhost.localdomain ([110.235.239.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6c7dd34sm1139656eec.1.2026.10.23.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:57:17 -0700 (PDT)
From: Vikrant Yadav <vikrantyadav4802@gmail.com>
To: lorenzo@kernel.org,
	linusw@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vikrant Yadav <vikrantyadav4802@gmail.com>
Subject: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
Date: Fri, 23 Oct 2026 23:27:10 +0530
Message-Id: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
X-Mailer: git-send-email 2.34.1
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

In airoha_pinconf_get(), the last branch of bias check
"else if (pull_up || pull_down)", has no check on the requested
parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
reaches this branch, which returns -EINVAL. Reading back a pull-up or
pull-down therefore always fails.

Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f505a3f69c5d..8cf4592cbc73 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -554,7 +554,7 @@ static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
 		else if (param == PIN_CONFIG_BIAS_PULL_DOWN &&
 			 !(pull_down && !pull_up))
 			return -EINVAL;
-		else if (pull_up || pull_down)
+		else if (param == PIN_CONFIG_BIAS_DISABLE && (pull_up || pull_down))
 			return -EINVAL;
 
 		arg = 1;
-- 
2.34.1

