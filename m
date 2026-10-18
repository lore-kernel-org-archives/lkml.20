Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF383E49C0
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304677; cv=none; b=gL2UJDpbXkhLX9/95SQpzV2f3Rm+jEVEsDWRcVpfNbsBQjE1bSXHZtEtDMSmphkj1Cd0PqnAkbj2RWNqAOjFrvBEMSExxGEb+h2aZ+Oa0Ib7fYIjNxpmDyVoJbHwL+EycV8A2+IZn9ICwPxp1ZL3cHMJSx1KnZd9z7NY1sAZCkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304677; c=relaxed/simple;
	bh=fBON41rkWJm+Nr5IP0+q0DD6zo5hPQEiHIFcCKvNNZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMMGTjJ7JcZ20Hh4dtrrMOf2s1WUZG+7ML+t9qa8x2h98vWWNtxxSgkGp+GEb5Z2/fKsCztQzNx+iKK55u/XHjJwTIJRnoaSuuGG8goPqtNp6v31K2Jea3c+RqG/1VyzHFcq9irJGTgmGfyLohqmDe70Ai2cIRHLOqyy2G0aQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=oVd0RvdH; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="oVd0RvdH"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1031244a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304675; x=1792909475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=oVd0RvdHSq64KyeFs1iLG4eTFH8OLdu4gWJ5w8y+79BPq+xg1l9KZvzlj/PrNzfnfb
         zvFjmCi3gPHUIjVenkw+vveiB289G/mOD567chisUkm9/8uvM5yUOrhCdOYLC2MLhq+0
         NuyapCx/jcvcIRdUi3CetNdmDeVeZnEtiTH0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304675; x=1792909475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=nnhFZrxKxE0ACcInFRgf9Sv+y0t4nB0BULEWw4KcWNc8fhgWD1Ss8iKDNCqCWd+/rs
         5eq/XZHpQKwV8Y9dIQCIB7xZS4C/rRa6rWrhY/ZoAVBHsEWEXpcavhTtgen0SfbL+u4o
         Cc/aY+XdLs40gC4Daq+sbHOfvZEwhEyuX3K+tIESzVHniYn0Q+wV1+T8bFpZUkJoosX3
         wJgipvGlgwcyzAOy+HsuNjrGkl99U6KPg2MVhmrc8klKQxJrVvmqRL09rN3FA3mKjlY8
         mOk9aRArkyuZ1GU8uxRMe3lJenSpIeaovDTpSG95Q43QNjBa86JIUX7GK6zeyxZE0sib
         QjnQ==
X-Forwarded-Encrypted: i=1; AKwUvByy+jmAiY1mL3NU7dSUj52M9rGf8l0/2/ehq+c/Cz6YUDRY7oTZhkeKff2wwk4hkdi8FXHKf/doANyQwaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdgGfwJFKlDIWkOzWLJ7dcIGPc1bKD19Umljox7h5hInFVkHIj
	7NfVZR0TZ+RYTt+5F2tuSGOMJB9q4MRFXjAhvMGzH1QdYW9sOKlHb8Wyn4PJ82uWyYE=
X-Gm-Gg: AYBFou2YZDII8RwzZ+Dq1wGYxwQaTPJkmsS6oIm7NYFnAltb7v6YLmXCfDh7a5PELlj
	H+jt5nNMwBvRO1Bb1g2Fbm54xCtR+pgnTSYHozokLkxhxX3hxXzI9uVGFDUfp7XF4wGHGIbnYNr
	Yby27asC3KG6clDW/nw2me+xnIMHfHAdP5u1jSvSoG18iFXpmFz5fd/QT1ntOyt0GsZYemmLhAm
	/D6Ehnmq2kHs2eB1L9NdySho310+5cV78OHFgiKm6IZ5RBI1h1m7lCApCjK2mr+/G/PkKagroSY
	cavG+z0iNqQkEALmXsOBkVoxR7mc4qgKiO8lHJct8XQmcZ8nPm4Q40LUNPPxDcGJyK3SUgZAlCg
	wRL70uU1NfM63UamOTdl5/jqC7eM5rzWgrU2hbwCqkYgeDSMRBTbGJ94xpAXZqCTqT2Wic+RBHd
	dGDn7CaKxP1RBrFR7WdHsQUmA66JurGBo2Q5cAkQx0qmsg7Bf1+mkni6WtHPDdrp95lpPcfqKM0
	huZwdS/gLf1Ksn4j6gMg9yWV+e2jLukysIkRFsT7RxP/ETH97ppI0zrgh3KFVSBag==
X-Received: by 2002:a17:90b:4cd0:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3acef104296mr3845305a91.11.1792304675254;
        Sat, 17 Oct 2026 23:24:35 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm10513293a91.4.2026.10.17.23.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:24:34 -0700 (PDT)
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
Subject: [PATCH net v3 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Sun, 18 Oct 2026 14:24:18 +0800
Message-ID: <20261018062419.21921-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
References: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
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

