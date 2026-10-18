Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D2A367B96
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304270; cv=none; b=JBnxDrD6z+C7fPx1hPzr9HBd/9jgON4+5YwkYfIcw1PoZJGyOic1lufFGt8MVlgLLx0ZsvCEiskkmu9D/bk4W5OxhCZwnpmfF3M2fpsY3K6F3hs9dU4nBtEJNHLB3jN2bGnv7lUO+RYjZ/yd8mv7q+SeHWmOiwA8vU8ORX5HHjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304270; c=relaxed/simple;
	bh=AA4CFCI/T0Ewszphaoo15ML6lrPZ6nLxKoibb0yiWds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kw/6AecCeAU++Wfo7Rp3cuFvZhpnpkGyNEjaeD2spdK29G/Cxr4H67/o2fnLnbnjCHjDuA2oxvsZ3zKDe0i6p4vTCUaqvQkHlyGyOdKJTMCnPKgTJqvfHp1U2LeFHF4JfZyy56IZp1aOrltgWzy/+Xm2SD2S4I0iJ2kNx1FNpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=Dtlfntjz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="Dtlfntjz"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso887858a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304267; x=1792909067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaonELdcVf4OUI2YJCgEvAYKPGQioZd6te9YEzY8XbI=;
        b=DtlfntjzLEdOCfUOgBuomjBZSoGFilba39LXPLFRJm8I29WHiwQbUmdE4K43K3vD9Q
         KWVUOyEcs7MtwE4e4Q63F9wRAxbjq+t33arNw+NWjw4N2ywegiK+AZ4tt0Ak3UibM/xI
         43tacmr5e061Jqy8Cq7nLVd8x0RSPpYreW78U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304267; x=1792909067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaonELdcVf4OUI2YJCgEvAYKPGQioZd6te9YEzY8XbI=;
        b=aTQq1NCgIrIurdx3f/NKQmTYoEzK+owA+2gAVuGSfVhBIJKw5HWirMc9gRS2ryFO6D
         hqDcOXDbvgKghRC8GsJno/sHXvxsowXT84Og0On59YX9RGueCJ1eodbUMo4WSunbbPX9
         2Hxo2QddJAtREFYDGB5kZmyCXj8uiry7PNqHjGUFS/tAe24/MbGtl1yLxYGOBoaaBY1L
         ZX2elKIvzHkEht5FBFIb2dVniaCVznE3LnVsEd1JoUsC+nArEaR4z6pR0p6v8i9CJDUD
         u8wKPaoYHHPN1XkJlsLmP8pVvowYZnewRiFiHho+pF2nhaqPM92vg+Rep99ICX8uJA3M
         7ytA==
X-Forwarded-Encrypted: i=1; AKwUvBxK0ElfPgFb4Ed7I9TUPYbtDXUm1Dv+DxJk8EKMCwG625Nfq0Fwg+uJJ93ZBWkHjpXEoMb9Ne5C7O1/LBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW+W9Gkawg+085XdooMxbHY6zDhTMnonvUUdbpULmlZVPAucBP
	rYaIVMtjw1Wlm+8aGVUgmbDT46vx+LK6ucftSZ1N0yMtoTXonGBYKh/vVFqn/8UznUY=
X-Gm-Gg: AYBFou2FTd4wVdqCMg5NqwNY0/3BE/Hdn4i81H/EPLQqdRDz59xI7k0eWKBD1ca2X+3
	Rd86SHsRk5Z1FvqY1RHaTFTVKj8cSz1swzs+a1QnbaoV93HtvilZD2uF5VIqwSjAz0B4tDT+h4W
	l0tbbNQP38B+6a25/0/9G74RSid9wynY5efiItP/Ro/uerwLr4J/KZETSnpLM/4oG2bWRrfFK+a
	Tpf4VycU3LaLmNQsnUVR/WTXJXigjoRVnZlCLQOJbpBn62bA17foPfTHoY1vE2teb7iKPUjn0J3
	Oh+SB/8eN9DSxqTQMC72+aWE21MfN2ChknFKx9v74RL4G9xi6p20+6LqQ02NugoGzG+q6b24hES
	ARR2s/jmUtESvLkMQAlZ3jhtkuh1vI8VuO3e6VZmTCH8w9JBUIiwEUnH8B6ebTOW6h4XT7C/D7/
	IAGko4I5aBc7NuKPVWd1scm8wiK79W7rHrRhoeubKDQWbrmHNeO4TlC6bq7KNsFmfG9o0/E3KAK
	uG/NJ6Wdi2q2YdCjWj4sGFhSTXzkN9BiBZrC6N237FzMGRxsbZYA8Y=
X-Received: by 2002:a17:90b:4c49:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3aceeb95f82mr3978010a91.10.1792304267228;
        Sat, 17 Oct 2026 23:17:47 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm11025963a91.3.2026.10.17.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:17:46 -0700 (PDT)
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
Subject: [PATCH net v2 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Sun, 18 Oct 2026 14:17:33 +0800
Message-ID: <20261018061734.19488-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
References: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Jie Law <98lawweijie@gmail.com>

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

