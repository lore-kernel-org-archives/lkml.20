Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832326;
	b=1HlVOaikPBbZvI7fkilfuwB24ikppKj/rbWXgSNH2t8Tp3sML+JsbwdPr5CEkAe8HnAg
	 hmbv5O9nWTHqucafKYzsO9/UzExDtaDsQcHepEoOjF8g3+5yKgP/JZmeeTj6gdncCgc0F
	 0Ie0UbZ4L93qAmlEyHbFSU9COLqYQLNc39b9zKOkvRLD1MIzFmsZ2uscKQasyj3OYuH78
	 oqgyluclB8BeNbO0mHA2nuh597xPdvEv50vjseCfDKBz0AMy4wGw92Z79r34djG6GWOpY
	 rlJLJzaiDOLYR7JWWFFRDae7imowo159ff4tjb+H28A/lqd/fK+RrYreJsHtwc0wM2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dKvbUwWZ9bjs+rv3bgan5D2HrfRSnQNu5fDFTDBMNpE=;
	b=wjdRwzoT76NPFIxcfgfI6IR+j6mzHp9Wkgs4onX3Wf62vjM+FiSxlLpyJTLIWFsy5t43
	 NTXYpJQdm//tzV1YgiKJvXSqSDAVTHe8E2R6XOrN8p7rrMo0TSb+YUuZPceSdHML7soed
	 tVZAgdyNMU/Q7Kp/sPLXIHfEB+IYOnEez0hqrESOFPVPx98j/Ih1h2mIuIqCmL705YfaG
	 Kv39vxL+C14lamUqFTBuvhjq9JM5uckKTdfci2V/sUn8+S7Wv8gmOePbuMhEtn6lDq316
	 /dvdFOhFKVEUI1SOrkAWjoUHSr69nceCzpadEL6iG59k7+kesqRL/xOeZQcNcXs06wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUESKkci;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F88B606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F88B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUESKkci
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so11723035e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832325; x=1794437125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKvbUwWZ9bjs+rv3bgan5D2HrfRSnQNu5fDFTDBMNpE=;
        b=TUESKkcihhHdMZw6nXxR79lG9KQghqkHAdh/7XlWk0qxd2lkBwOnJxcgLFYt7Qfkj+
         CqO8F22K9Fgm3xiQnMRVuwZGvRCUdvk3FUeghsl/Jfpq5CW9C8QZzV1X+U3cefLHOwn+
         +XnBBZY7/fy92/7NAs4PDGvh0qJPF4ObcPrREb4A2/tOOs4SkGpLf8fm/kw4Glw6XQlm
         ME5yrhT8SPrCm23wq72uLEHUIqBoTQZOl5l156xlTH+6M6LrQh12Hy9zy+T74BWrWUpq
         q2+l6S07vJOqabMoSP8ld0fSy1unv5iwM43bdMgwf5n0U8jj6SFRfoeqaKikLY2aFoEz
         PesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832325; x=1794437125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKvbUwWZ9bjs+rv3bgan5D2HrfRSnQNu5fDFTDBMNpE=;
        b=eYtx1kJrLoCyCiMmnMrBy+onfly8cvekYvEEPO9KbTFZqO8infCmyXQ6RX5ZQPlJkU
         r4JIswKbcoOyRtTPBH2zouB8Wu79hP9EXXTkM04HcLG4E4AYpb3KTqAP1Nt+wOZCy7A1
         8Stc/7eG+BNYnNDMjbVYfRHQEi7vWZOF2bbsvDOwbcUy9tkxQMZ4A3t/qVs5qE1T81OH
         f80Ta+dpdsQfB83/4III6Z3peXhek8auZeo1VTa1n8d1wE6U4w3IZyrp+Iv9PQ8LqmYf
         RhIK0gmCtx/L5UCUWraLU9S9eGZqT2fQ3yjtOSs74ysluBo5CUZLZF8fRxPvmvU2xlyz
         q8bQ==
X-Forwarded-Encrypted: i=1; AKwUvBz97oapyXaNhFsdT86I/LGlfXNerPcLZxH5iQhdc1hTE+MsoWjea8qDjvTQm8xg/1KSxSTP0yDfAbKCuIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c32X5iHoLRBWv6mUc+H93MGbPNGoaXFO5aQMbtogBYzK9m6Mo
	rk+RrEFdTVdorGHEBpgigWtCN2/DOblCZ6tBcPxD0IJA4RLslv12S73g
X-Gm-Gg: AYBFou0a1iVSoau5KbHovz5MgYGZhrIni7ogQRnVXhiUDTDB9ZU9mNXcqjW297hJEGO
	FEl/060nH5WZH2ojHMYmDy2EoLIEEjrglENOD9MUxvryYh/+S8AXSXjIYQpudZF97PV6R0aGjfW
	+N7LrU6pEgktSFHSXOSQUL7ccPHQNChbCqowJuyeKw0OcgXdtHMbAgHBR73oTKqGjA/Od1D59jF
	RWzvqylPvf1DfMkmSHj8noyMCaHhFRMmluadGoyjwoVP6n2eXvEyWOp5a6DbLFqQJBXVQD8N7nT
	eB+g5VdlZrTcGQvMX0EkBxn6Ouf4ObEbXpPSe+iNwX7zKJXZtBvs2v2orKWavFhkLwib7N4esOA
	rsTUawFuW84WYFHOZ4iIpleUJKrFQlSMKxItVKY9CTeu0EiUm+DIKF+qx2AI3yewWnaz4+gMmX4
	0jpodbF29tfTIbc/GhXTNHeIz6xd4F5a8SKDwtwUh6BKXp0/HIkOCAA1FtgFeTeIMLcn97tPIFb
	aWtvfP46B44CblO5RF7ksQuCVaepwIUp/Zeo/SxJA5ZUpKjcJ2sf4wdbqQV87VyCPpVXBPrNEzb
	n0fEzuDgl3RzhTGaVJ6/UCB3qBLdJ1OV3yaB0eS5giWgtUTIDdeIyj8pZ5P5JUKNTCQzt970myt
	mc0WcdA3+X/f8NtlyP0azmzfhhdE1Nl5IZniF2IUsYsoV4EL5F/BBi2YHLhN+jgHiUba92FZTW8
	hvE8ezs3IS3tun6FSriVPJ7GXmeIHfDShbGW4KLGZjk3Mj+V9Sjdr6PA==
X-Received: by 2002:a05:600c:5397:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ac18b7e65bmr382188585e9.24.1793832324746;
        Wed, 04 Nov 2026 14:45:24 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-947d-5f15-1dc3-a8b4.ipv6.o2.cz. [2a00:1028:8388:a84e:947d:5f15:1dc3:a8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4320efc7csm36604235e9.2.2026.11.04.14.45.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 14:45:24 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/5] net: mvneta: lift the per-queue TX rate limits
Date: Wed,  4 Nov 2026 23:45:14 +0100
Message-ID: <20261104224518.66487-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
References: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
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

The per-queue rate limits set by mqprio stay in effect after the
shaper is turned off.

mvneta_disable_per_queue_rate_limit() only changes the mode bits in
MVNETA_TXQ_CMD1_REG. The token buckets keep limiting the TX queues
with that mode as well, and their refill rate still holds the old
limit.

Refill the token buckets of all TX queues at full rate when the rate
limit is disabled. Deleting the qdisc reaches this code only with the
next patch.

Tested on a Turris Omnia (Armada 385) with 10 Mbit/s limits on a
100 Mbit/s link. When mqprio was set up again without a shaper, each
TX queue stayed at 10 Mbit/s. With this patch the link reaches
94 Mbit/s.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index ea755cf05b9e..9b9efac2846e 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5204,9 +5204,16 @@ static int mvneta_enable_per_queue_rate_limit(struct mvneta_port *pp)
 static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 {
 	u32 val = mvreg_read(pp, MVNETA_TXQ_CMD1_REG);
+	int queue;
 
 	val |= (MVNETA_TXQ_CMD1_BW_LIM_SEL_V1 | MVNETA_TXQ_CMD1_BW_LIM_EN);
 	mvreg_write(pp, MVNETA_TXQ_CMD1_REG, val);
+
+	/* The token buckets still limit the queues, refill them at full rate */
+	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
+	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
+	for (queue = 0; queue < txq_number; queue++)
+		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
-- 
2.54.0 (Apple Git-157)

