Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611974;
	b=YVP99j4PotJOmytYAn3Nfbbei+Q//b51ZWtUNP4zL/QX5y16Htm83RU1F+RwBiNN4Ckg
	 +ai5Ye5ERDREtzDdJz31EmHdjlaoOgx552kdULJcaF+vfdlwWPWrIoY/c7Lx+wpmTPhpl
	 9/i/mUuVxvYGd+z9VEiHwSnLRL2U/VvbrwltfF9uGdrw9gnTUEdJejh+H1rA8fdJ0MtqC
	 MrMPbtehkeosm4XZESmUJabVdbBkkK0I4hW2XmenOqR9twAlVB6rQiDt+mraeg/SgLLEl
	 iXVsMtQFyKUCjRSNgWq2TUJ+hSBPBcr7/b9x5i8N+HDakhDJPMenwoO9yj+NFiLENzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
	b=h6HDjwhQyUBLFEDCzh4dIS/FMXhCF0i8djdWnxo2xKqWikJso9wRPhBUsuVqtcIUgg/l
	 9EQ/Ia/+If9G/ahrAfw22YOiuh96adAinSeKz5GnP/zUAxWx0AgA7iUbkHxoPfwsXgbLx
	 2EuHSKTPuLQ27sefAeJplLjuGhXpJKk0pqG6b70OAHPBkpjd2S2o/pVjEXWX3cnaDbaki
	 N3dGgMVOW9M7oGYmzhm3nNmIexPBjd4PdVF6rQIIVnVco0U+hbfycn4XyzfnJbmuc03+M
	 7kVl1Ort3P8GptGfWLBbiXIrTTczJaofGn/8SW1aEktBQuDL5ufVqlHX4LCgzHY0+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZcN2r9i;
	arc=none smtp.remote-ip=74.125.228.70
Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16756606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16756606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZcN2r9i
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6a5d790cce1so2088184a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611972; x=1794216772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=xZcN2r9ievYSpEm95jkBkRFxV04MOndzBITWcUHrPOYE2XmKvBy6oZOXZzzkA3uT+L
         spNxsW9mqXFhWfvhsXkoVvi6GLkJPWPHhgDlA8a6IqUVhQT8cuJyyKxMg/YdE67W0uHR
         VKIwAy03ByUGj92NdfeGVCbHGwwtJhbR2ezq9lXl9YEgRM9ztFTRqFSvZVqpA8aO97qh
         eXC8K1O+d9A/DaczOa4VJSSFe0UsDzI41af0SBrQsxJQidBZC948KWdf2BfOIkeYg6PY
         u/7zldp2slK4+vRiTy8Hw2gnbPDoMCpKbW2Pq2u+9I8jqXS0AXdEo+wlqCXthCUXEnZv
         nP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611972; x=1794216772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=Yl/sA3170c1GpedDQJqlqLaEPBtllHWmIbJ+yMA9NigJkE9GxrJmBt39sG1JsfDdaR
         AT2M++fNu1tN0LxlBgOuSzD1ocH7nTwCQcuqKT68AnCRZxtS+dYEzj5K2JsuwyWha05+
         R3rZWCXVn8aTj2b3JInZQmcPFVYQyEa+W6H71Otp3HWwkkdGF1d+Kd1QnV4SF/8R9sw8
         ZNjP2xfeZmzwSrORfbtqsWMnwtGSO8V0bFZnIm+lQzMX/pOaFKG8N4gIoC3RUFkmPY+1
         CNdFuQxZPaJtV288hxbpxLZTMqjccMT5d90DeMM5yODmd3OL2x7v/7P9qWyg5n5w9H+0
         lyqg==
X-Forwarded-Encrypted: i=1; AKwUvBxbNdaQoBPnAzSjGhwkZKoDwT5FRKaUWDpthiUL7Ah/nPhk8hbA53id7oJsqChxSXKUHga9rMQsho0CkUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8czSRWQeQucLml4VxxAlmkueqKaL0TjgA+iJCQ4NZ8/g7zPJT3
	N1P3sWsS9u62e8uASpgpovrBOvIxttxuODHMzsZB7WpDJW1KMOrVCUIx
X-Gm-Gg: AYBFou3Nic7Ic4NHu6NSt08dT+NSUN2sJCmU8xIU20CUoJSFOQN7pRMXyk74RKh1aYo
	SDCPZ4ce5U5P5/mLLo7aQk5N5Ka9s+OqVgIDYoUxYjyinBmfUG+qjt0UoMjRYUGTBz4KWUi+lKj
	UExfB+fe4CvUHRWQi6T2mpbPko3xuqjSHWg48V3wd+o2eP2i/0862OZS91aR8zpbE7NzGtE4AS/
	Q6tl4s5f/ETNDclSv05Qt8q+cpZd7aBeL+hCg2xlsufUGv+pn0MO/m9EC1QVwy13c3vVPXrQPWa
	muPudcOsf9uagU56+6ntkyZkUbPfkUKv5OItwnK2RMEFtL7MTBTcji0owTPZ3rNCWKYJ9WyIKJA
	L/uBpNwpjf/DooviOLIZVXTdBRrAINV3+1C3sZDWzx/SR3j/zKgTlWYUpkcWR8u1pP6pwQzZ+s9
	Hb89YLRLU3vV2y0ufXQ0d+0Duy7Nkbt1j6nulagidYZ9V+La055WT3sotpArkgHxMMayA3qzlKI
	WSKCmSBxA8j6ck1tmXzpca5EaiCkP9I9/crWDWj34NGFgzH2BakmJ0uvqfk0Tch9EkZVQdMAlMV
	ek57R9D5GIp+rtl4J2IhleSFM1UxE/Lyxu6maHk3MFmAcXjbUDWuci8y/JhyNVdw1g1aUSEV/Su
	SnH1ItriPrlR7/lgl8tdmb74RwfoUYyrtPDYlYA9ghoRSSKMoYO8LTOU5
X-Received: by 2002:a05:6402:b26:b0:6b1:ca87:c588 with SMTP id 4fb4d7f45d1cf-6b4d4d74c9bmr4790145a12.37.1793611972469;
        Mon, 02 Nov 2026 01:32:52 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2a0sm3214273a12.25.2026.11.02.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:51 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Mon,  2 Nov 2026 10:32:28 +0100
Message-ID: <20261102093228.2751576-3-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
References: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
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

Use non jiffies based waiting functions,
if in atomic context.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index e68e17bdf0ba..6bb8d66e8969 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -237,6 +237,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
+/* timeout waiting for the controller to respond in micro seconds */
+#define XIIC_I2C_TIMEOUT_US	1000000
 /* timeout waiting for the controller finish transfers */
 #define XIIC_XFER_TIMEOUT	(msecs_to_jiffies(10000))
 /* timeout waiting for the controller finish transfers in micro seconds */
@@ -359,16 +361,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
 	xiic_irq_en(i2c, mask);
 }

+static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
+{
+	if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
+	    XIIC_SR_RX_FIFO_EMPTY_MASK)
+		return 1;
+
+	xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	return 0;
+}
+
 static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 {
-	u8 sr;
+	int rx_empty;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_poll_rx_empty,
+				rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT_US,
+				0, i2c);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
-	for (sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
-		!(sr & XIIC_SR_RX_FIFO_EMPTY_MASK);
-		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET)) {
-		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	while (!xiic_poll_rx_empty(i2c)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(i2c->dev, "Failed to clear rx fifo\n");
 			return -ETIMEDOUT;
@@ -383,6 +397,12 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	u8 isr;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_getreg32, isr,
+				isr & XIIC_INTR_TX_EMPTY_MASK, 10,
+				XIIC_I2C_TIMEOUT_US, 0, i2c,
+				XIIC_IISR_OFFSET);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
 	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 		!(isr & XIIC_INTR_TX_EMPTY_MASK);
--
2.43.0

