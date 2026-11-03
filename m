Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730657;
	b=MA0ozwDRe28vkcoLyn7CsdKFgPbxzTurzf4GPXujiinZim3pGw1wg10KnlOudoPLZARl
	 w064kEV6oh9DINI1WWzwztTG9RzchiFOvcXfvfw7NghT0Ohn7EOhVYVIMoRKO1Yv4tSxZ
	 05I0aQSNzwYAIzr+pvVuem6cM79d6VqVaBVrFRAFafgitQs4ihjLxe+gjtk00beLvu7KA
	 kEY+C6n+4Dsf+k/z+EmSrRwecr+V+gpk5iO8C0nRoajBTACoByJOAUt2Y5zKGyxfmKMH4
	 WUFGwvrwN++XCFGKtCAjgwskEwW8W18fYbOEdYVE9VzCDNplQfHVEtU/iRx+Ag1Aggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
	b=vEaRqJZ/oInq+NOwuW0nok3Pm4kgY1N+KkXlJvWtFybrcpYIjyDgtxRZqHJ6KFHe6kVi
	 G7rh/mGwHuxGJQ888gKBmeKxL+EhtSFv7o35rVEa7CJ5HHBERgyf+/egb0cboV265FDIx
	 01DxzQmrNkLp3mRa8M5KzYrIS4kt7D702ssJFVysJ9m/7+NY++NMjgv2NHQQjHSqdV8Y+
	 pTrpL7taNrMJquFovrpe9EDIWb6e+sQg2lF3XRg4U2/9HkesowiuKbCsHkqVa04TwLFGE
	 J9+IEzdUsU1aVfXIjEz1nAfry/+bfgnp7x3qy2ZAlalp/fZaojZPp4LPDA3eEAqc2Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO469B1O;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0F606D815
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC0F606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO469B1O
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so38597785e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730656; x=1794335456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
        b=nO469B1OhySyj4Eq3Nr824UOlch/dqrL435H0TKCuf2FvOnVvu8I9qaLKZD9zd76qF
         LeeVBGkEZwM1ZYbn8e9Rpyri0LPSaYM1v9UqO0S2xwvYptXskLG9via+8qrndPv7pXd9
         pNRjfoNA9adhVvtd3Z5EVIcDEjI2ch9WReTvXjN0AgxLovj+xV24pmNTpndHoJGdXh9g
         KawRNwONalcv5OKl5Huu1pAwt5bjfKpa2FhG+zA+EXi7p09aOL5PdFkg7IXouQwHW52H
         zH11ASs/mY1l3ES9+W7S1S82AxjJA05gG7EiVbtmpEQjJSVHgu0phKbi9Dn+or9FRq2Z
         y/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730656; x=1794335456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
        b=eWxEA22hXfEf3wEp3+D6adO7Woiy4Rqpp/yeOn9qQqT9miqf+7TbAcqH+vvNBWzcD/
         AIgHdCihavFTdBh9K4W5koPp6lbMF6cbdbHJKbItDb6ga99FDVSb/z9muL7S/gSZX60y
         D+vCu0uwlXryx6Al6To2J0WIRGZlfLh2vdtfTQqmmeahLyZLJAOaZSlmT5bHx9mS2c4I
         hSSChHhjLzEdxW4gLWHKkBA1H63QvIXGOnDxwOCBSAXpXBPLzXVV7uzxabFTt3zbr5Zt
         LE5M7YEgTwt6PmxYBMy0uYByaZ6MvkluJy9H53zN1DHJGjRu06DXe5cmsjUM2xCTEaSA
         e0DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC+5LEQ/Kg7G7XWeBIJ+j0AZsQZ3wxzbc9l0QPm8Ow2fy/9x0I+Tq1bh98an5dLi0NOS7YdHNYARU8Yrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HBwiA1mFJwzhRZ0lnK3+4R6aJRp4znh7KNvko2JwM6DnRxaQv
	jYdElVllMLQHyTxWDqFgzmwm4q4jnPPgBugzzr2gjUJuBaYka0b3IloG
X-Gm-Gg: AYBFou1kYax+7YhCSMvz6lu/EKGwsu3VN/qkQv1flFo4KSIXeHtjvTxT8Uwk1yTcmBS
	ISPR3KlLgDunwUJJa6mD6OIeCfDi59r2yqo5y8CeATdrCYmmR8kc0dvq3hy8V3vMcfM+0raOCJJ
	ySD3laoJGrMPkFwc84lIGGgGV7xZ5OYr/7roA6EAXa4R5pUBsqSPN/CO7HqtLdy2s9ljJAe8F7V
	f1dvnQin3nA6OV9nH3m37NOltN3NZPBP6WHV0fLPNJIwJ7XYbi/sMaXHBsZKDuhHYKCmmoCzma8
	uAqnIVH+Y9AC3C9FV52hu/9iglqgKKPstrdbIlvq4RKCQGszFPvqzobzPxkzQCW2iqHAOTEaHz/
	73GtD+tvogP1aW/dlgMENm4CQ+SDh9agTJP5dhY5EnBHRn8nhl5QGH64huuBpJTJvCCi7kegeSy
	BBjbS9/Ge5P9YVGoHWlkYEIfD+uh7JYqQVdVZflE5f2h6+OMLrF5YGLWks96d2sr/bdUlylC+fD
	WhveksvOqWez9lrhvPvCw8SJrlB6kjNtMjjFu2R5a4YdPyQDoVT3Ho5N1f9rYQSjqes8Bhs98JL
	3Ya88yMmjzHRwqQ2CUQTqdL+EDA7ewSvTQAkxFaPVcejA7OxFWcTew+q50PS43DgRLqbslkN+js
	UCj5G5O50LDPTbH4vtO1d45eOWN45YkNmFxqaYiH2MKnmQgeJ/5mZuo3HcunJaPgbnLUbyrY5G/
	Wv3vUEey+wQqoqxD+Pqr8vXz28A0Ws+lbQvc7KVfCtejUebHo12Sz6wAHBy+xAfP50X6+qJg+mC
	CM6q5Yz8IpstVA0t00ukr7MNcbXU/aTwYdGf7wSxjipQ1Nv+Q==
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr329609245e9.30.1793730655752;
        Tue, 03 Nov 2026 10:30:55 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:55 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/4] mmc: sunxi: Distinguish CRC and timeout errors
Date: Tue,  3 Nov 2026 19:30:30 +0100
Message-ID: <20261103183030.81078-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
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

The driver reports every command and data error as -ETIMEDOUT. The MMC
core however relies on -EILSEQ to recognize CRC errors, which mean
that the sampling point drifted, and flags the host for retuning when
it sees one. With every error reported as a timeout, retuning is never
triggered.

Report response and data CRC, start bit and end bit errors as -EILSEQ
and keep reporting timeouts as -ETIMEDOUT, attributed to the command or
data phase that actually failed. Report any other error as -EIO.

Currently supported SoCs don't implement tuning, so this doesn't change
much for them, but it is needed for the upcoming A523 delay-chain
tuning support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index b875ef4c2b79..eb1b7883a715 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -537,13 +537,29 @@ static irqreturn_t sunxi_mmc_finalize_request(struct sunxi_mmc_host *host)
 
 	if (host->int_sum & SDXC_INTERRUPT_ERROR_BIT) {
 		sunxi_mmc_dump_errinfo(host);
-		mrq->cmd->error = -ETIMEDOUT;
+
+		if (host->int_sum &
+		    (SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR))
+			mrq->cmd->error = -EILSEQ;
+		else if (host->int_sum & SDXC_RESP_TIMEOUT)
+			mrq->cmd->error = -ETIMEDOUT;
 
 		if (data) {
-			data->error = -ETIMEDOUT;
+			if (host->int_sum &
+			    (SDXC_DATA_CRC_ERROR | SDXC_START_BIT_ERROR |
+			     SDXC_END_BIT_ERROR))
+				data->error = -EILSEQ;
+			else if (host->int_sum &
+				 (SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR |
+				  SDXC_HARD_WARE_LOCKED))
+				data->error = -ETIMEDOUT;
+
 			host->manual_stop_mrq = mrq;
 		}
 
+		if (!mrq->cmd->error && (!data || !data->error))
+			mrq->cmd->error = -EIO;
+
 		if (mrq->stop)
 			mrq->stop->error = -ETIMEDOUT;
 	} else {
-- 
2.43.0

