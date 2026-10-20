Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455629;
	b=ThubfLGM0Cwhu112mvKMu9uBlIfmgKhOmz93N6V6Zma/Jd6AsUmJ1yo4AiWC4z0XvKa7
	 tqsB2E3pjJ7jlPd/manWm49ITYfQwKnBGAIYen4LiuraTvPi5bzgzRGm8hNzBbUjC1wi5
	 LCl6WsoiqE35ARFVk6qrP5FkJZPt5huwqBr0eBR1M2MzVwuxwvKc/v8sRZRlSwN0X9uSG
	 Ua++yTWVMnVQIhHyjSE7uQO7GOAfUdyPO9VAcSPpBJ4kmiktd+JbCQHIIaLKHq10gsFn/
	 HL24qP7sPStCmngwbD0itj9VQpL9sG40Hm4I7QFED0u6G6FBxK1B3e4SX86SgU6kY1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
	b=f6LdGc2ukRRvF1OYhf02qf4poybOLPVI5oD8aKAeNJ1HxXasVGxh/iKhIS1mbIhrgZvB
	 s/ei0HEo5b/4Jeump7IOvB/X04EqMsEu0SDc4TiAgkAjPzeAH1snSgVtkWP5xLJfjKVfN
	 OYmuzJR+mt4LemLzWLJeGEDctChVohUv02Sw1Z4YtLEkchVZqnaBLEwCwAzgJ793QdeBA
	 xY8Ciz9uZikA3COp73hfWVeJo035flv7qV1WWH/Yqb+BlJKb3StmvdY0p1R0M1fK7KPYo
	 lKfLu4YN4Nx44nHcvyYVt9UgG6/EyZzonIMTqsKpTIvA4mDbEwxvfTkPe1anP85hOWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=TE84NacE;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424E4606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=TE84NacE
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso13875705ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792455628; x=1793060428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=TE84NacEl3T3mzY4W5rPDIpq+6Lfc1rNcOh90s8Y5vYh6NNcH93ogskkvSMh77tyF8
         4LgFPp6S8w3qhRfFgUZO6pLVeeEpPlMLrzo2n/BkMLZovv8DeaxJ8aK4m3wedYOi82BH
         ucyhxq8lB3pkJ7nIltsjr9LJGTBFRRQWYWF8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455628; x=1793060428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=R/e8eyoD3KukmQMl3oN+0qaCJxQUy1nmDoO0lFZpMy3IhvfFwj4atSEt9hqjT2RNnP
         weyd3vlz6ZdB0Z8pNC7ashytup7IDYpfGiyNGz4sIRC1iciXsX0YL7Swm7Qmhl4FtwJL
         IySLwciKAAUBpNL+nxvv+4Ww96ITHK/JfDWuW0Otl1sbyHrY3cK9Y6J6vfasPLJFCSls
         DRvaW/BA603b6nWxEX7GfD1pdtMea6xn6KN6C0e7X2YWEmJFBdBtvQASmedP1AmuRIE9
         I8p2iWHW7I6IQhMZL4YAzb8sn1GqHu79zdjEGw81uqtNv+xvu1tbNpLvRGfVR2EXgszV
         2v8w==
X-Forwarded-Encrypted: i=1; AKwUvBxyQQRu3Z3wEoNZWgQVElZz2p6KoqA4ttz05g5nQW8jxearPKeMeuwk8RfP7mjgOc2pE6cY2VsgefWVlFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxKsEOOhlJRA/zebb7K0EBgOQWeQskLqRqGQ5unXgpkFL5E7ND
	Ek+BCRO/8+q4ptJYxWXx8dj8CumfeD1dct4rqotReFT25dBTpBCtv5RVHl2Tzj9GJTM=
X-Gm-Gg: AYBFou33UYqWgicrlh1mwdh/gleGb8Aph7JT4CUrJNy6bYOLtfXJ9UHxca2EkpwW9It
	YdSobhVvKWPpNICdWIkBGVPjdxhsRViFAGkVo6FjDn2JIma8gQCpFkV+Vkr8F2EEW2y7ci1fgu5
	Vqs7l3+KgVFXwYZmlRkiHeAtOWoKNtFj5hxJXj66IBI3V1mEIiZTZwGlXVEiqVV11jUHfBxBYgL
	1aEL+kbZ4nwAoExs6m9z2fo7m5ER76McRahD81l/gsd44KCwl5n3E+NYm8fECRzjb1PhwOwEQ3g
	O1yTpXSoHNLU87+s4eubJQ80NKUeRe+a4fBLC7O+xq79bM8WBLy20NeuAZdMStDetMwEa3LYPO8
	jBvzMOQqA9H7Rg63APKnr5rVMHNVWbdcgzNcDPMugLNCTgS107KvGYplug2uLkpjS5eCTJ1XDdk
	8yqOaqATRRLBXvNaKoSKsPEWX4HMgoR37faU4YoyL5fgv6ekmIhlTWBALsyqOqI0SXYbOnKF39n
	OFyVyKP311lUOssRXt0mXz6jEQrXMmvquFDIILyXvKCpxz90E0K03Xl6DU0qB1oraRSbrbcT3Wb
	1TwnqDgGfmBwG3gEER6JdN7yuZMzb1uUsG/L
X-Received: by 2002:a17:90a:d44d:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3acef19cb63mr7592251a91.25.1792455628530;
        Mon, 19 Oct 2026 17:20:28 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1694273a91.11.2026.10.19.17.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:19:20 -0700 (PDT)
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
Subject: [PATCH net v4 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Tue, 20 Oct 2026 08:16:20 +0800
Message-ID: <20261020001621.2920-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
References: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
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

