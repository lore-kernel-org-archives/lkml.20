Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506226;
	b=UumX2PYzwjhvDDXQc14PyXGxRWIXqdWAPJDEADFdubeMnGsSzEuOR3smq8CqZFaH2hyu
	 Mmbzq0f/Ai79rGNnz6AlCafiWdJECGighDIXjTtfCFSSoNI92addj0ISdzd76/2bc16iE
	 YBUGGALLMRSRHgwcgLpxBfZA4FSySymwyCBDFZ3T+t6UJwHRZCuYAAjWDXLTkeWxwOOqS
	 DSvw/1h4Ez1qH1+cNJ3m0zhs437x6am5Tevy86XfiZdv8HSgW6EsfRKGwR+eK6/x2gHP/
	 k7fS3AesHfOFleS0AuiY5tK6fO1iX8YxpU/kS6eIQOsy0IMwIP7za8+LvgTD9+p4ufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c2U1ozXjTAQOgzzVeR9AQpZIkT5n1EJnb4FCuDvRTJk=;
	b=oY74WItmle/lFiBJe/w4s+mrDWoMumUeBzK4ovez2yJ5GKGplEEURSslhw/BXruCpPWb
	 /3qFmzQxFAOr/qE7PG0DZjAnH9K3ltLnJ2EVNVXxALwJZ7VqLCzdjPeydVW7lmBs+O2TN
	 UieZb8gsMAi47jyNjwErMrxsH8Gk5dBLLb5Bddof6GoQytAzpPdVhA0qshgVTaeGsruIZ
	 87AIdXrWb0tdjdV7zkMLJKu/FrXPIHkq0x7J98m5t9US4pmi9kic9SjzCIiJ2gmyva7CP
	 JgAntyADDi4Z/sTSyvLtFCSQ9bkPiGN2H36PPKXt3brCBZ5iwpG17kWbuXteN1r5YXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kni8Y7NV;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7645E60A6F4F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7645E60A6F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kni8Y7NV
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so748905e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506224; x=1795111024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2U1ozXjTAQOgzzVeR9AQpZIkT5n1EJnb4FCuDvRTJk=;
        b=Kni8Y7NVEZhLlGNl3R1GkxCoWpyzu8yyz8lYzwjnUsWYFJyXEM33LEgcQUTfy6IFB+
         RtTVBrj3LVbjZ3Z2OYemk2zi07U3VwEMnhUiDlI/s6ARkiShhLDbqC4QgHFdUwUddQbW
         YuB5qTxk9J0jOkvDtTePfFb9HZUXz3YtJG3quEEqY0/fx2NAb5EyNf9iNr6zp+BU5+pM
         K1M+tLA3RphuIL1ZX069pJz+oOAgTD0AK9oAk/Golbu6Hb+UT4+Zfws1rQClV+mYV6Ki
         u6OIbA52Btw6OZFLs+WdcVfUKMC9W9qoq+A/LF71U/C/6GDXJBOpVmpQlhNgUbqJCHPA
         I/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506224; x=1795111024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2U1ozXjTAQOgzzVeR9AQpZIkT5n1EJnb4FCuDvRTJk=;
        b=Q+hyJfOkZYOre9CGaB7EQJ6qfP8iSISGKoI5+g1cFPOd7S5cZDIr7DvJbfc/q1qhhr
         qhE1EJitLIBQ0IslI5Tk64EvwLbPNb6WUbbgGgHu6qjI6+sLXajq4Vvtgupi33bEQg25
         WMIhc/j7mH8jHKDCw35i/krq3yz4u2QrK3mQWUA5aaSRgXglQ3McE8pmeWtpYlf2BFX0
         QTxr+h1aay6Bg6PpEmcZ/NMPUVLDdl89K9VsIkIFa5ysjrAjkyAkYJL4c213X7jT8ZT+
         fbiiEnWcAgodAXTSc+PfksDRbB8sA8R03YZWCMsceq7SP8ZHn5ATLhzpflfO+x7vYqdp
         622g==
X-Forwarded-Encrypted: i=1; AL+hErEWrCfvvSLWHlDmHYpeKuuu7RpAMJHiLVpM+UyNRsJzSUNbVBs2f8mcFtuaDAegLkp3J4rQ0RdKtcsC35o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R28obxOiAaDENabjATyY8QQ+nk4WX9FRwe5el0Bk5+5hHGZvP
	MIHAeTb+TCIhHn4vFKMyRNNPAL4ExP8H4eeUpHxJwemP2ysUirE+D6kH
X-Gm-Gg: AYBFou0o8PGapBHMl1Om83RjMGMKV+gdBQSWsbreE/MfWA4/DjIPVG4DdSF1rbS2/Sp
	TarEJVkyfW0vW7QB9ZpusOOHvE3RaYw8OZzwxdoIqNeoh1ENK0hjhEIEHH4sFysEVojBm5uIQ6S
	uQ8fc4nMpV7L8WrP/yLxxHzgy7dmr+LqWk6FIw0DDNHpKpF0rCwM/A/PxfqE0nG56J1BYqdXF7F
	22sS1XNh8EcuZVLGctj7gZItSLeTrxWT8q3txBzOMJiBQmAm/sgmHpAH8a931Ux+1dI3An8NbZ6
	EN0IezobMEa8uZE+z0p9ckRJh2Q4I8sjQ4UubpT+GdbIqaJrs6Dbm9+sivAU94xC1q2BpGvbqV1
	+V7FGuKrLQ5YkZDyroRx7GR9iCt9YfeRpgBnt80u6kK8D6Givu76rcd2ivOnUYUvhxqSyv1kfzv
	IpY00uRHmxBC0Kr8IySYw+yDydWZfLT0k3h49eHJTzeNyzbwkvN7uZ86+022WmXuh4/ZUyw9r9p
	jjcYcgZxkqaN6xiJ55u7Tq7Oz9nhG0ku1ERGov3e9tSzZKBhtDwmr5UXV1mZDsErjySyf/KGVC2
	H/wC/WwUw3eFaQRaUMgxk2P3Ibsu3eLlGGrEno3JJG2OdFMS7UZnIyBc3iQ2QrVkpWUOlNe55LF
	bqNU3T+OTxiMwdpUNUxUyLag/I5ni1L02esH4nipfV/79nlWOvWx7NT7xBD4jXBM74ZEKelMsU5
	agmjSZuQsAxOJ1QNSPjuaiDUYviGOly6nRpCYljqrpshFmpgJ+V8a0XaoDByUupJY=
X-Received: by 2002:a05:600c:8b24:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4ba09383fd2mr113475005e9.35.1794506223952;
        Thu, 12 Nov 2026 09:57:03 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb527c755esm31491425e9.4.2026.11.12.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:57:03 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 4/4] wifi: b43: enable the AC-PHY support
Date: Thu, 12 Nov 2026 18:56:56 +0100
Message-ID: <20261112175656.40686-5-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175656.40686-1-gonsolo@gmail.com>
References: <20261112175656.40686-1-gonsolo@gmail.com>
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

The AC-PHY now brings up a BCM4352/BCM4360 on 2.4 GHz and 5 GHz and
transmits and receives with HT (20 MHz, 2.4 GHz) and VHT (80 MHz, 5 GHz),
the two that were tested. Remove the
dependency on BROKEN and say what is missing: no TX calibration, no TX
power control beyond the hardware loop, no hardware crypto and no power
save.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/Kconfig b/drivers/net/wireless/broadcom/b43/Kconfig
index 4559549..a8321ca 100644
--- a/drivers/net/wireless/broadcom/b43/Kconfig
+++ b/drivers/net/wireless/broadcom/b43/Kconfig
@@ -149,8 +149,8 @@ config B43_PHY_LCN
 	  Say N, this is BROKEN and crashes driver.
 
 config B43_PHY_AC
-	bool "Support for AC-PHY (802.11ac) devices (BROKEN)"
-	depends on B43 && B43_BCMA && BROKEN
+	bool "Support for AC-PHY (802.11ac) devices (EXPERIMENTAL)"
+	depends on B43 && B43_BCMA
 	help
 	  This PHY type can be found in the following chipsets:
 	  PCI: BCM4352, BCM4360
