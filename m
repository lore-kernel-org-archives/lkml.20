Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710239;
	b=mbq5iCe8VFuyg2wGEFcGVlD8aLmXRGNzBrYfmrzOC70tbFctLVB+dkoVB2Mpk9KUj1h/
	 BBp7es9fF/XquCCTiLUKJRqnSKjzu4HOxClkXAiLKQifw7/UYbQ3/mAIanfblwAJNaqVA
	 u16yEzH2Gp8vGlzOWQus2+IUe86kyWcIiMPby3n34AJEJpmxlE+DL1MyvVJ4U0iDt6ofw
	 thUnwTAzIhFuWM2CsfH7WjjYcdLztnduIAwosZuJrEk6quL57/WFBRTYq0itTJNpAq/pS
	 YnHgWquH0YWH19pKPfgpD7PbJiL1KvN49sIOlrP7gj0xvLZyDLoFppBnj3T+lJzL5PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jVrnVM5pKch8ALP4Sr423DqQ71KjBHkeHchxHqx7jqY=;
	b=Ler3RxkvXaz6s3oX9juwYon+qUaoAK1fyGIQ0QIxzWdc6fEN8yD945vFC33IswiFVWKx
	 kgkOsv7fRSUUohSmDBqiwakX96nAkG6T1XAR5jqPkxaWt4EDNh6ppqezOndO/yvKecGga
	 lOLaniZNlZuGEOWQ+HzG7/iW28lKFzFoFoa2JjOThNV21/8ox5ZVidLPno/bBi446f+1v
	 f9kxgAIF0CUBR9Rtv2i+96u/NXCnN6m54fo4hIlYClGEmGJ8s2lFKxWM2w8ynUcjPk3Gm
	 niCwmEpkocPzrZdhT4VjhRCuDdhx0TCekqPmu1WwF2g2IZGQYRuFYti+2CMpFWBZaow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J45r0QLa;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEB7606EE9F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BEB7606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J45r0QLa
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso41638525e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710238; x=1794315038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVrnVM5pKch8ALP4Sr423DqQ71KjBHkeHchxHqx7jqY=;
        b=J45r0QLaMhUFKKwtwI6bskQVY90x7FdFASF5uISpHDP6V6oS6KTPJ1UO92kskRsrd3
         oR1hkNSxY3Oa+FwxaYvqgK0zYH0pJ/AfhbrMbSBKZI2jOBwyxuVln+6Z5gt78z7xBjaI
         GUK8QXt7jQw0jFepYcYUzPv4uznWDH813mz4UCJWMHnNcwx6cvB9bjfT5UUubGOBsAGZ
         08+Is6PyHe7nyoS+tS6DOP1ZscTEkuG9/mNxNuirIIoNhVW5host1JJ2KVqgvpygV4dJ
         W5eRsPe6GCLs2GmPu0ln/oemZd7U/L9hgviRqhmB0QXfHZj54koh7zHfPQMrOdHLXiNW
         BAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710238; x=1794315038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVrnVM5pKch8ALP4Sr423DqQ71KjBHkeHchxHqx7jqY=;
        b=aNEYRGs69bB0Ozch4qLV+2Ul+k5P7f627fJWGR1QnW59SPfBQVJdAB2q1zhNH0935l
         erIUws7Xpgyu4hqtYe8B8pD40NHT6+6FZfVybzRTR7rcB29ghynw4/ON3nrZV9L6MWIw
         L8nuuKdcQEIt5zHBvLEoTUESENWBKPXMBsM6BZD37fmmVbLMxP9mDaMbZ1/ko4BhZH+v
         FmNJndgW5FugYxoPhN7VBolzgzvouPozWxizT5BNQMFHMxXCQedF9gn9Q0qSPfEm0wS2
         uR8aSlFSlq2Y7kfXFxLDPvAj0OaTMdhksG/i+Eypzq/npfLB+dikyKGOLZvWQNbX1M8l
         VJ+w==
X-Forwarded-Encrypted: i=1; AKwUvByvLzFowsR4fjF7A7qxpaup9G4lxz7d5LSb8o+XM7HGVxCEd7SwY0Zd1AwSIrzN7EuR5KTMhpey33GQTOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mYjpNAHJKNWGWL9FF+PgoGcDBcOMPnibI4W/fBjTySgNKfeVM
	w0SEYnju2MFxl9wrtd28aD6SquMycnrfu/bWmhJo+yPbR+/xN6DmnxdW
X-Gm-Gg: AYBFou1gc8tIHmrZCCtQgIUf3vvaRRim1M46EWbboi6Y1SRt1H95f0LpShb1YnDURli
	0Wd2a1QrxueJxnvYw5BAIxm97AFsc4U406A4ayiR0tcGXJcmnOqOhbhS7iMkqJlrJNGdeNSvoVp
	YmYoJEDTabdnfxzOzwDLeo6X3/0A/tFc6got0sp3p9HXCGFsPg6tlj7XMYYl90xFCaPYrfQybuT
	ef6gS4izk5RDmrGeJvpKu8wLa5+63mqTn7k0vxq0+Fu/PFefirgukpYHiU6DfH8r5hudmrZuNxO
	mg+fSsPgmlSHyngXSjh+6CwW+JgmR060vzfh6sD6gLVpqXjeOjwuEqubNo8kThRd0Bmc1A2lRHE
	R2dJ5577sg2h9j4UJotTTHV++j1bv8EDYtmKtay/4UNWHA+qpR7e78QZox8dBFrm3AcbxS8beDp
	QY9BLbF3akSqCddQHNIKJe2H+E9AvYz/UUtvPhRpptKFI/rHmejH9+xyXawZBuzqMpZNVsdq3ab
	0ifAxSvRMH33vf1GK9eJRTm98VzHYrKkUJlCTnT6cmB3isY+Ur6obGudvpd3xgqHYVQfm2Ozw5F
	xmSbtTFbst3J6wNfc89PLCrJ6GtT+o5yJvfhVN8HPYadiJCLmKZlYf+TzPEFZZPymGPwbv2paHy
	B+bYuN+Ef5/56sA90SWSnV1wj6XTaEswkXuMMKN+6qLQbw0Aa1fhIM2ISu0XlMw==
X-Received: by 2002:a05:600c:19d2:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4ac1737c51dmr287915995e9.5.1793710237655;
        Tue, 03 Nov 2026 04:50:37 -0800 (PST)
Received: from localhost.localdomain ([2a00:102a:403b:96a2:e8a9:f4a7:ed37:36a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm61406425e9.0.2026.11.03.04.50.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 04:50:37 -0800 (PST)
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
Subject: [PATCH net v2 5/5] net: mvneta: keep the TX rate limits across open and MTU change
Date: Tue,  3 Nov 2026 13:50:21 +0100
Message-ID: <20261103125021.70845-6-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
References: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
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

After the interface is brought up again or its MTU is changed, every
per-queue rate limit set by mqprio runs at 10.23 Mbit/s, whatever rate
was configured. tc still shows the configured rates.

mvneta_txq_hw_init() writes the token configuration of the legacy rate
limiter for each TX queue. This also sets the refill value of the
queue's token bucket to 1023, which is 10.23 Mbit/s at the refill
period that mqprio uses.

Remember the refill of each rate limited queue and program the rate
limits again when the port is started. Resume also starts the port
with mvneta_start_dev().

Tested on a Turris Omnia (Armada 385) with 1 Mbit/s limits on a
100 Mbit/s link. After the link was set down and up, or the MTU was
changed, each busy TX queue carried about 10 Mbit/s. With this patch it
stays at about 1 Mbit/s.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 29 ++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index d3a6bf8f383e..92a2ea930002 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -686,6 +686,9 @@ struct mvneta_tx_queue {
 
 	u32 done_pkts_coal;
 
+	/* Bucket refill of the mqprio rate limit, 0 when not limited */
+	u32 bucket_refill;
+
 	/* Virtual address of the TX DMA descriptors array */
 	struct mvneta_tx_desc *descs;
 
@@ -3773,6 +3776,8 @@ static int mvneta_config_interface(struct mvneta_port *pp,
 	return ret;
 }
 
+static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp);
+
 static void mvneta_start_dev(struct mvneta_port *pp)
 {
 	int cpu;
@@ -3782,6 +3787,7 @@ static void mvneta_start_dev(struct mvneta_port *pp)
 	mvneta_max_rx_size_set(pp, pp->pkt_size);
 	mvneta_txq_max_tx_size_set(pp, pp->pkt_size);
 	mvneta_txq_wrr_set(pp, pp->pkt_size);
+	mvneta_restore_per_queue_rate_limit(pp);
 
 	/* start the Rx/Tx activity */
 	mvneta_port_enable(pp);
@@ -5234,8 +5240,10 @@ static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 	/* The token buckets still limit the queues, refill them at full rate */
 	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
 	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
-	for (queue = 0; queue < txq_number; queue++)
+	for (queue = 0; queue < txq_number; queue++) {
+		pp->txqs[queue].bucket_refill = 0;
 		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
+	}
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
@@ -5261,11 +5269,30 @@ static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
 	val |= (MVNETA_TXQ_BUCKET_REFILL_PERIOD <<
 		MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT);
 
+	pp->txqs[queue].bucket_refill = val;
 	mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 
 	return 0;
 }
 
+/* The TX queue setup overwrites the rate limits, program them again */
+static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp)
+{
+	int queue;
+
+	for (queue = 0; queue < txq_number; queue++)
+		if (pp->txqs[queue].bucket_refill)
+			break;
+
+	if (queue == txq_number || mvneta_enable_per_queue_rate_limit(pp))
+		return;
+
+	for (; queue < txq_number; queue++)
+		if (pp->txqs[queue].bucket_refill)
+			mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue),
+				    pp->txqs[queue].bucket_refill);
+}
+
 static int mvneta_setup_mqprio(struct net_device *dev,
 			       struct tc_mqprio_qopt_offload *mqprio)
 {
-- 
2.54.0 (Apple Git-157)

