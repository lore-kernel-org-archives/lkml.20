Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291285;
	b=R2UGzT2061t1/e76QYHP7LtvvueeO4WJoHIInMPdBZRETW2YhQhI/69rPWnjIDYaAZea
	 Oulqy9r+iZYllNg2TlcjMINJrsYY0IvvVVuJuQ83o4IP4Joe/9U95teq3+QJmGS2stLlP
	 himG193oh3rTu41DOybC5D3D95ypVTbDWx0ElR3PcqoVy6RdpAwLXt/YEXgPbzKb8dpzS
	 JBWAHozJWwAX19SENCcmEP9mTCad+SYcrAH1IFYiTHcg0FOi16TTttuLW4ruemCEe31Sh
	 kY0ho42deDEpj6Yiy9M2YR40gKOXJpHx9YXnvHFTxUTaPYb71rIVOKCKc0Lyn7862mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
	b=nSnl/cgchn1f0zEUQUd1/Vy2pnqpAJtyBhxRfovV1iix/mCl8nXc9Cuh4PzhOmBKb1PQ
	 yPaHL6QdGoBgvSQC32LhePCFYNdZqKuPCqA45bUwpaWIMtJBF403dNVWr8GAX7WNWelev
	 7MlpkwC+dK51t+iJTsDGtPia3t36oQxbYzK4BVPuo4Mb4zgtv5IqXqANBmKkX1z09L2Sw
	 +jKAZ7mwNWLn04gdlA5z/VVZ2vlP973UBeLjHqDl4zaDKSeTzJy94VU+/f+/5yfeyrpb+
	 Q6PEt7xPUMkS0eUhVJSHp5x8tGJJoWkxJN99rc6OzShJksYIMjGsj2dNsJcgqUv1Mrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YHum3B/j";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F67606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F67606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHum3B/j
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so381489eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291284; x=1794896084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
        b=YHum3B/jKzFxCesg7+Ct7CPnwxHr0nrJAYz+jcYt1wC41y/pqChO3cemGyDqaU0WYi
         ZhrHQHR+K1Da9LhsBEUrVWbvL2gWmaQdaMgYKWqh17gYHHUD8+DkzHB+ntUDF2lRwVzs
         s3WQRy31A++D4hh081Nmn/QvCHW1XCaCsx0pWfJUmlKICljEo9YCuXefvQoUVmAznqfX
         gBPwUs7cOtjvTU37V6rBUVifr67VxETH4kcmTT6f4dl7uN1zLFST7CCg8pH8JgBgOZTh
         OZJffn8MWCr83MlMWrkJPuslh8yd5fuOebAj5cmk1UXJ6Gzb4JrryKbSpoGgyuaduvmw
         EzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291284; x=1794896084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
        b=YeAPvziYj5g/pk6/QyI+lb/tNzIg9XsHeRQX2n8d1uDz2rTDARgnu4dGANQI86bAAU
         bVRqH/MgpsrDTa13x66fSO1l2k7BRqDi+CEh4B0ku+nXb2iQe0jYR3ZeWZrk+nxm5WnH
         dfISyeYh5QQM4Y+iSYU3JVn7l5kbSmSjjert5oLM63x7lJNCSAQjFZZ/Wt0eYSkB8bIg
         LBmEKTPXHkFeXog2y0IcEJlFBB1shiQFtZmcb+W6Ga4iFRfAf5vJdfKnR/w670x8K+Rl
         xrM0YO/DckyeQmtZdhQzK0HpZS4lMcz4D5i3RSclltfMTa+u3wxDJFa0Bdp87vfgRJNX
         rvEA==
X-Forwarded-Encrypted: i=1; AL+hErGGtEtKKypm9mZBGiCt2xsgponwZMdoL38OpqxKn2SrxKuOrYP1RCUO2XUfQXsVzBR6t7SCoBFqCEatCwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u9+vinVmxFGgcoSYNWktpfrIlJFcLR5ZNvE4NGNNqntMNHA+Y
	+VQ3t8LUr3eTr44oU7HJRpZlqjm8aMcBp4xxvUU8NsGATpb4gHiO7NlA
X-Gm-Gg: AYBFou0piBDREYM8NBSOCs7Q2TSPRUTlEW5IP6qMZnAvTUoX4cB+DznVb857wL0kDub
	HlInj3JzJrUVzqA+QQdtuv09jxWgfVBA5WfMxjgM/6QwCPwobbNM7At73GIH+exsptBl0qVmXV3
	zNsPom0CnGQa5BTEvj475kljOOnO/q01HzZXbdc2i3yCfs4wOCiV0DAoomJgp+UUdKGk5o4a/IB
	z5cGuYw4Mkob0J1oxJPjqH/OD2AVIYhpzKFzxG05fazMJdsUO339sC44TTyeJlWQ3wEAQOKTGCM
	flLoKX3GBYIaf3++BYfXCH7HtPRW/ygqJkiRHwmyA0r9nd0o6vYo4aqe6LkCchDubgY6wgC3g8Z
	6uG+TzaqMJWCJNrf2/T0heFgj9qruyjG+GLO8SrEcJxD7COOc8cC5HzzBRGF5xOvCY+3IdmZoen
	hMvBU6KWrPFGbQfTf64o5hAGNLUecWZMesWEsJ+L+jnuJJvFg/zvTNIeFKux5ZFXYrb0ogtIfO3
	d7yYVXT2kpVm9nVUWOgFjh20vd9m85QNCgNUX//NEDAfaF8I0jYSapvfO0Z3JDpisGL5jxatlvo
	uoRg2TyiDEA6dqYtsLojLroRiOeT5xvN
X-Received: by 2002:a05:7301:488b:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-3751c53546emr2305164eec.4.1794291284219;
        Mon, 09 Nov 2026 22:14:44 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm3802316eec.28.2026.11.09.22.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:43 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in atomic context
Date: Tue, 10 Nov 2026 11:44:26 +0530
Message-ID: <20261110061429.2036-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
to wait after triggering a bus reset request. However, this function can
be invoked during atomic I2C transfers (such as power-off or restart
handlers running in atomic notifier chains), where sleeping is illegal.

Replace the sleep operation with the driver's internal helper,
spacemit_i2c_delay(), which conditionally uses udelay() when running in
an atomic context, avoiding "scheduling while atomic" bugs.

Assisted-by: LLM
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index ff32876e24d3..f4b21d7efaaf 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
 		       i2c->base + SPACEMIT_IRCR);
 		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
-		usleep_range(20, 30);
+		spacemit_i2c_delay(i2c, 20);
 	}
 
 	/* check sda again here */

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.56.0

