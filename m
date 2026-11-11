Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360938;
	b=vdAtjgO3OeW4+vdrXcCQFCjhNtl/Guxfz1fxHHpkphSejOD43BwxLiksw/uNKkjRQWVX
	 1ag2JljGv/tJetyAYKbLUiWVAM1lnawvIzXli7ZnuyFBxEwrAmXBLJcZn5OnlFhozZ0OH
	 QAhri9NN83aF1xtUOzmlR6Pfq2CX4OBZFo5RKcNTOyghBuWkl62hqlhR680wbNAMZmoK6
	 pix7zrSGV2ql3nxNHv+SAkJBkzvxNTsW9cOMUVF+WQHwqmVsMZg0nFONpBNcZ8ep99pPy
	 Z0DwOraf8d+EhOQxzwSjYDac01yXplXHEIDdrmKfKWu8ZHo69WXZJB0PxNbFS+qxkHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BrmOR0k5r7xy31gHMJ7w1Hba46gBSd2dRL8+89dR1Gg=;
	b=YHm/AF3p7ClLrOnBivdBTqpsEGy7WqGpP0bdwIfBhHu5qEayxARqUZJZulgs6zRb570Y
	 NVmRmuBQMpjzJc6bNiPLtP1aqdUn/V52r6TBtW3o+Py/5zh9JE+rD5UI5zoh+r4DgMcuV
	 h8ROPn+Zh5imXjImyZNkNEgpOH+hX5ICoK5S7pZ1QmUIZgN3jYcGj97SutV2Rgiq/cs3D
	 G+hneCXsYov+lscMWY1OmEg/I2SO1S0gt11pfJIEHxdj+syEta43YH71x/KR23Kzfb9zx
	 RT8kpHk2vB+sALh7ixxy2jquWs/K/k90gB/xAeuXwiRrfXrB1UtTrkwhxVX+dv3TmWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=nrkZal5s;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3C7606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3C7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=nrkZal5s
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2242738c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1794360937; x=1794965737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrmOR0k5r7xy31gHMJ7w1Hba46gBSd2dRL8+89dR1Gg=;
        b=nrkZal5sa0m6AXQH099P8P+BdPNe+Bj+KHrznDlnWn4jqUPlQlolnUbv+FFxl9+knx
         t173qdfOVHrNjNdvXg0t3Albr5e8uCSHCe69KbQus3MT6xTBKvksWi0ATODsiwBkw7l/
         lcf1HWLSUegO/iNAKO8ftdKAMH2cNaJ6LQPJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360937; x=1794965737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrmOR0k5r7xy31gHMJ7w1Hba46gBSd2dRL8+89dR1Gg=;
        b=pQSBKWYxXycS3d9yTvMsxI5ktXF/LMSIKjvKpPzjHUVGLtUECS5NL+7xXdqhADKeLb
         p+Yxh4j8AcehhyL8a86iPuC0uGM7ZU4BX+jQ3osotUKAMXhMcBqfjezAfC0GH2GxyH5I
         mX5H6sav0FoaVl9LYu8HUNFd0zpENnhgDim1mN7oViy2gSRAWglRhNZDxGYPCuNZpQcW
         xwIa3OD6W0pXts9RghO8n5nlG1Teg+D8iXY6wmpL7x/XNZiNfr68POHXh2ve4wYOcj5Q
         fQ/BqMRvirH/5kwUKP7lF67J49DWvdC8v53mbXrp4qKl1ny+12wfyAawnFJ6BDFAW5zV
         q20g==
X-Forwarded-Encrypted: i=1; AL+hErHRqPjDxX4wJkx727CIY7SKBIPdC4NbvAvKqGh/Ix8N+XEOKRy1KNktODLULTE1yRhu+7a5oDyXd28TTY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p9IBShwXzXEX0gMNeuJLHnOCd/Z44ZfMfkHiPUK4dlayet/qK
	qhwZKZA7nn7Hwcm5pXsGs0Lq2i4G40F7D4fcpwVMwhCJcDPmviDF9ypFXurQk3IobcU=
X-Gm-Gg: AYBFou0bOT7NirZTB0kh1MmW1HpGb4upm3EFsyhSW1+M+l4U0ZfszZE0czC9miIPaxM
	TG6cJA3sj5t0IPcO6yzjOVTw9nEQWowPTG3EkgWeZ/txglSMr7hzuhmmWHCZTix4AgiFIeUQqoo
	ZVqkOD4i+YenHdmS062ut9M9Eco+rFSk1plpA/ETwQumeIbwbp/vXMYHEELLUmT48koWC6ei2Fy
	SoaHG7/PK6aUyD6S5xx0ZhGJC70gj7wZnmblP5mn38Ksd6SVaIwtXfq2nNc7mOpK7v/OPPrde1h
	YE2778z23IhLYuF49B5H/JMdZdPkFxTW752DuqZI66chVvnUNHeT5MLmH90CYEm1tl7/rm0LDwx
	srzaP/4EKkDd45uBu09yJar2KAohy/9hz/rq2PUk3Vly8T+FNVyq+nek/pSs4FQ944fyD3pCFfY
	0yycU0RnyEnERldA7Jmofvl8Y65ejCi/JKIaMLp3NDrkBhynTaNk6rWeoTtqZCDaPyY3xSz2OPs
	uIdjESPSylA8fkV81HQbWVlQLdJibcoLMILt+SR85jeQW6Uxz5xVBktYt35rKPsNQe+IGe67Xgv
	/LLgfJQ0ey9dJRr2K8tR6NDC20UmTUd2kIVFQr1kppyrCYrOI3KtGELvDw==
X-Received: by 2002:a05:701b:42cd:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b3bef25cb9mr1698072c88.12.1794360936994;
        Tue, 10 Nov 2026 17:35:36 -0800 (PST)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9696223c88.8.2026.11.10.17.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:35:36 -0800 (PST)
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
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v5 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Wed, 11 Nov 2026 09:34:53 +0800
Message-ID: <20261111013454.34542-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/lan78xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index d73002b2c21a..76c2d98b49df 100644
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

