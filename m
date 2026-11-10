Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285099;
	b=OZq/MDdvVvbjacSZY6JYBjXQ9HKqxIsd/AYcBaPpn6lW1lEEFutkuyOtRe753u4X1tPR
	 fJnPx4xK2yxPiwsI3BIJVnHjGvlv5dvkfSEZxOiH842vQFwU1jrxK/Z+j1Tustcrj7pij
	 w+hs8gyYliOEt077iCtvhOyBKJW1JT1waNXxgoYXt4DCfc4vlrOiKPpHhTQrHDY/vcc3A
	 l1KKiLRzJoAHpYqn7EA4sR8WUBONCZD940xDt9Ald/NsnClYnVDjCHjDa3SIHEyfr56RF
	 /BGtRxaX2ujr1nNDKyI+HKun/t2V2rAQQdYtd4Uann7v9AQALlrSTWhAnD1X6ZSFPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
	b=SFnC8vr0WzxXnQicB+yeYTRwDvJGWt0r+CPl222p8yfvW0sFwh9HQnlUWCgJ8U5GgtOu
	 uXVcIIwvhHdTrO5fkpcJT5j+NCWKgl6yHrXXngcQ/0uetTxKpw/j64wSj2DxR+2XD7G+p
	 I1jYOwBFnXXF+R94hNu5KpQBqoN7VJGjrpbS1bMucjJnMEJvNRmwgyFbGM0s7HiLBryaZ
	 35jrQAleuEp86++AbzAkiQt/aqiJNche4ScBrPANkp2sIL0pk8wbcSs0hUtDs3Lm5dBfw
	 TRTcVWbykvzJK7BKxle5FrLrG59vt1nqKYz7/uuel/g+Nj5f8wtWAW6KUz1nwVzlcKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr+UlU0Y;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC2F606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC2F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr+UlU0Y
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f6295304dso2100160eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285098; x=1794889898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
        b=Cr+UlU0YsbuBiK+1U8LGqZRzrg1WNx1QTf46Xfbo0OhrVBJ6QtuPbhqW4PYWL0C4Xs
         nf0SEfw3rq/0f/Jd+4TaTHMzV7Pdeu4XXuXwGGWcocIHFJEtzoQu2vTT6/CZ0Axr8dMe
         phUx8BIQn1Xqz5dGoU3e5DE6utanDaKJ9AqaNNY0UtyUtjDfZrvuMTN29tKIpcZNa43T
         KFQZK5rFQZPQOVw3DPAFUSSiKnKHMfNvPAfVdV+95wqHR2v7KGMu9z7KGMGQ8X1RsYhs
         ff9w5u5g7cBLj3+tIaX+kGtTFU+b0ikcdKGa8AYIg4ckgW2Bi0o9v93Qmq3Msu7VU6T2
         b4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285098; x=1794889898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
        b=oQ72rg3qeY/v5gRiWllRmrRAu5zvSmUN3j8j/1O1bNOOBEqaZ5DLBOql7fs/3P/V7r
         0cQ5yQ9hgzOBJV/31MkfSm25IOQTSGyATjlQ7FnRmogFg2kWnaNuQJzJ3ERvV7dcFIXw
         NaO05j1KfxnG5ffq78s0Xp6FgMPt5ZLs0ncW/OJKqKD0bHG1q7T4wAEYFOJk8eJ8nCYg
         4oCUtB88E6Xm3xnAy1SY/eBxK4jgjAm/VNvvZbtKL6GlNd2taunFyd8jJqKOLFggRAEo
         VPSLo3ZKSaE9b1Z69vgaFFj/wpofygZwvkRX8y2/lJ5i0n0MkwMSfysksShvyCVnnUWR
         DFKQ==
X-Forwarded-Encrypted: i=1; AL+hErHfRg8iFHunD+kdg3eyToq83U6rWt2WEVXHBnyrx3RhSHOO0aY4ZixgxCEb//YBBJe+HGkGM2ZQymgebLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LICTqoq9SPY1gDeBw6sqI6oECTD8I4qHgzuZRW5qOZ58Ki+WW
	JvOuVEqcjPqtqHsci17J1apJD3K1RS+zzJjsxdV4aGV/bgkE0vwKZtk0X7I67g==
X-Gm-Gg: AYBFou1f0yXPFNbQsnwVXpa4S4cPUBG19zMQyI2FfrIMr068mU2MEYswIOwUYdejvoP
	Eb7InRyFVjyfLBE4WixcyRKNFXZm1DQo6hiNRBbFrHD0uafBF/0OXeEq1XSw883/AmaSenEnbOx
	OpvqRReHoG4CL53ymXOYzkPwcUL1O2Uei+ZXdUz5wtPBVFUlOxfdXcPLm0ey9NipeuTCiHJBpxc
	4q7U61MjFwc0ht71dgZSRJzsB32+ssQYZu2MzsMjKaqqa/kc2LFZAE0CiZbCFz1nhaRigrOqkD7
	oOgfeJv5WPZ9bHwK9A938c7mBjfm0sgYD2vZTN8uo+0I41Zb3CWjZBDAoEKaFeg2bqhIrrWY1Mm
	NGjx39h938m2BdHwTgSTlhX6uiVyxP6/dZBORZLtIybMxOxOnZ2pyjF53xGlir1VXEnPB9G9tpt
	fd19fMVqQWibpbC6wsJ8GQeiugwo4bITK1ayaAl++s+5bR5aDfirfiet/4K9CZNxxY0Hlaur7Ik
	3VN7IclJJxKMQanT5sPEFvrXVU4i4bPvOfbp8hpItc0LNApmWNEnhrrK/wI9ar1cZEuua4RDkDS
	9YAkwG8X
X-Received: by 2002:a05:7300:7f21:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-3751f55f6f7mr1851301eec.22.1794285097632;
        Mon, 09 Nov 2026 20:31:37 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:37 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: [PATCH v2 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Mon,  9 Nov 2026 20:31:29 -0800
Message-ID: <20261110043131.1985993-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110043131.1985993-1-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
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

Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/ingenic/jz4780-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..f5983033583a 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
 				 !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
-- 
2.53.0

