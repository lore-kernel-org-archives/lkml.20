Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509150;
	b=Gwk82y8btsTyPVdbZpMlvs0wSS7QgMDdn6zkBZyr+2cI0pBJgpjVsgUb5KAHfKl1DE13
	 ptbTyvfViVQid5D8SFztMforIKgJ0snwPP4i3f4NMWuS5MFmLFYQ63R/zlV2xpdan+SQA
	 kHrU2gFe8gMbXPKiVFkJEI3ct//Ls7sZqxkO3QbiAZllaH5UKZrxPAp5plrCIGb48U/Cx
	 SwitGMIEpmDuInEhbD8lh1p/NsmGofKGNuiirYJSyid5SMEnhsEKkEZxTCz+gOHz1aG2B
	 mypCJA4BLoeVb5uMC+DKiyxtWsDm/okmqwIXtHdGgiInJxyLS4Nxcw/rQc4XAoyFyQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
	b=DK1rXUcGrqcDJVVXHKWBfeRREqDTd9hsAr5TT59wtr7QPbswiKyZHgod4jxZYSUpQUq/
	 +/u3/GqIVZg3f9dGcrHJbQjLV7H2FQfpn1E2R6yyusjfGnFFJp7/S5NQaHLIKWZQ5ziUO
	 5v/BGNKBylWa/Sg24Vt4hST7wCtsCoZow7XqqY/9wUzm1DLW4VLtdydOkr6OFdIzlTUGE
	 9r+NdFfO/za7IrozhkcZJ4ddrczWWwPSpuDebtO3tFLphyfM+ZFjeCai8Ov9rOEMo5DUD
	 +DzjZ/h1UOkZ7yEZ7yhdvXt6B07ZryiRR8gh2ogHA4pYQ5voEEPFtJ/5JpgB924PZbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvqCJG4s;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91A606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B91A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvqCJG4s
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-372bdb942dbso227182eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509149; x=1795113949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=tvqCJG4sadbpnO9DnV+uFosM78XxQbI81mrM9a+WHoU2qGeXvav0WbusoVQ6AnJpYj
         tZd/x4021EFc285UdhOKNe06ZSJi8txJuYz+iANhdPUat88400IL3CNIQotARvfES6NW
         Xd0gE5Imo8+N21hsoZJnXanCSCSrPvUJLWdLo4UpR4tp3qyu/CX+nfDV1R6iUrde4tdU
         6Q5cQtl8j6sngNzYfyeeW7QcO8Hn4RXclW2JVOgz3wpyumLZjbD6G3BcUkIkL+moEKOV
         xkUV0ozBi2XNL+QLf/EtSLKqXyJ9F96PcSaHiSd396HX2MyoK6sJJIWLdncNDXW7VihA
         TC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509149; x=1795113949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=juRqpVjka3TrMZTD/k/iwmGu4DloV2R6bSj2XP79kBTk+R4jpCzD0C81XzY3yjnmUM
         zr1tmYi392ivo10VFsvSS8CeTyPog06MiBHZYFEHf3hFCiCLG6OvpZBPmYQ4P/XMB91G
         sfK6Y0fR/PNYyzB1mr13dLA/WFxK8KwXErF6IdshvRmlZW6iO5FtQjiomCX5virmsXei
         6FrGTOHxUxRNDWZCuMRStGxPx+BMu2NA5O2XdzMaqQVo7N/7zDV2yvtKzYNSDTGnYbc5
         QfSWd81+yK3RZY40AsSK+2cXHnVl0rBmCrONpmTzrl1QYyxF03bWgI8Tg81T8U9Hhtyn
         kQwg==
X-Forwarded-Encrypted: i=1; AL+hErExoXTDplP/AlmFnotbl23niDE1cZKUwhuwCzW1AZucyAmYTh3CPAASUelIgN+iFhk+JsHmRc0JZ03Dhzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ld3F+vzhHiD3GPPV2cV3J+93T3zKEoLtM9tiF6sNUMYhKm/UC
	856JXDq7a8ujV0eyc9hCVXeigNeva676acbgCfN23k9UP+Dk96p2VIqW
X-Gm-Gg: AYBFou2Sfy5e85gZcm5Amo5uzLyGMtNXfNMJvfw2oW/EQKuOvNMC1DuZ5vI37ulSNhh
	KMS9JhxVPjFvXp3tyhFUJuZZyjafRmk16ZHkXvdvvTIwrsKFnrdW5pL+hdFB129MUiiEi29GFyf
	I6dD8+6OPzI3Smt3tPi4wvUvv0dMEEIo0vRDElUTzmwADbii/WNzAIpzUKkRtn1u1no1OtFF8n4
	fw1HdAxindCx1XkAFLJsmhgIAeYAvAKCOykttCGodjC+JNV3hlmw5m6WQ+l2kCxwDbZJy2jh+Qz
	hdiTl1YpZL4oK9QoMZVNcYa8FUT+LPuoZqm5oN27xzO7tR+J+88cWXAHKsy2pSf7PJFaWmPota/
	B8pUn+FaKqq8SIqe0HAg2x7hFTdsuon29hPVD4DNdwxgWJ8rIgm1sCCkQBRxsUjXiHk06dZnLNu
	IBREzuJzFGA/qD/UVgrsW303ZgDuV34e+puy2PCmIVUxIHmmRa1xN+M7JY1O6C8kCVqvw9JhDfX
	KYBMyg2WgimPywuq3nn8UDGXl3WVnPXYUy+jIaHeYrBByZX1Pn5s/oHJ29i4an7uNNCfsCl8w1p
	PdQ1tIbp
X-Received: by 2002:a05:7300:d181:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37967cde7c5mr17495eec.20.1794509148932;
        Thu, 12 Nov 2026 10:45:48 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:48 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	stable@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v4 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Thu, 12 Nov 2026 10:44:39 -0800
Message-ID: <20261112184441.3724150-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112184441.3724150-1-f.fainelli@gmail.com>
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
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

The CPU1 clock enable callback runs under the clock framework's spinlock
with interrupts disabled. Its readl_poll_timeout() can sleep between
reads, which is invalid in this context when SMP powers up CPU1.

Use readl_poll_timeout_atomic() with the existing interval and timeout.
This is a prerequisite for the JZ4780 SMP bring-up path. The original
CPU1 clock implementation by Zhou Yanjie is already upstream.

Cross-built for CI20; the subsequent SMP-enabled image brought up both
CPU cores. Development and validation used Codex assistance.

CC: stable@vger.kernel.org
Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/ingenic/jz4780-cgu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..1809f8859c7e 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,8 +242,8 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
-				 !(lcr & LCR_SCPUS), 10, timeout);
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
+					   !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
 		return retval;
-- 
2.53.0

