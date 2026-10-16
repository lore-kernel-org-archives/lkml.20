Received: from mail-ed2-f11.google.com (mail-ed2-f11.google.com [74.125.228.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3604A43FE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155164; cv=none; b=rTNkiWL1z8qJr0LvyM9PF8KXGed+EAwOUMGUfi4y/n0QpsGv4CBFy6MmzALpLdYLF3Wl4eqJQ2W4YSR0bbcaLk2bEycF44eGtDQpaSpf5fnlDWP1cMPJDfQhpjQFV5YU5bWU7q7smS5GsQ3604GES4fOCviD6rlShgKff6CL5MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155164; c=relaxed/simple;
	bh=PHKzI/DaDGeG0UXrccrwqI/qjKAvZq6HiGbjGmmX6Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p489CQ/7K2f/2il3Wv6Uc8k0llDqhcvhjS4B3KSuGsyErSuT4qvBULpFltrx5z6Mz9tzOlEvSv32xDAVWCJ/eOLfpsnM4DM+PzxCjcb/PZdVtCVSUmAJYQyg0VvUcQnoYFHq1ChYCE8i13JhgsJryyGiXZBqVVKuf1rCHmgORi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXu/gvXW; arc=none smtp.client-ip=74.125.228.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXu/gvXW"
Received: by mail-ed2-f11.google.com with SMTP id 4fb4d7f45d1cf-6ab01685260so1404090a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155161; x=1792759961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=SXu/gvXWM1umyElGQdWJfYtfOkzprDVdQVATTVHyvU9TsZHg/10bPwQZk0DW+aRxAA
         DIo1ByLWofOwyNAPgMR0dNk/QJrsE1aipJdgrQMJIi9GXU6jHieEHlIV7fZoz4VGMWny
         O80W4VAZ3xbV4OzUk1s309mSkTJ/HLpDBdU4saNCqd9AoZABNkl9qrhbx8U0jHxnjAZy
         G/gcQe83kuLAJdM+az9mFe1pHlGexDLeScyMdvI0ZQaGxXkJn/C0qYu+pi1X7V/bqG2C
         961UGAosd3iuRGR1god5YAnOp3KzYiZpeVw26VpO+cuZnIU9OfePbmGgT/VdAqgCHKKc
         yNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155161; x=1792759961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=FEmGvj1qjuWGmUgMeaWfx5X/1fTriKWi2tvQDTJ71Oufg7C2vZupu2C5lyupR0uUdo
         VLnqO/vFELa84sy7HiOYrfMZl4c7uywp+r/5dobQXUjOmKrMjbIvaPrf9Z1ByLbWENkx
         c/e7obVznifwF7JjM1SnsymwUwX9CWztGnv9fkSOckTaIJRQTv39hpQicRnHmcuTwsc6
         sKYPxwpW7dANkGXmoIpshDmv36RHJGtYJZSyYvxAexqKyjLMOtqYwqRLHg1JtcDQAkTm
         pQKtBDGVTg4lazKuebZXnk6v1fPHgJpthf/OffKS0SXP9/6HRkZBCKuM9LXsgLvDkL7M
         T79Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7124jvpbrIwDD3SG21mfDbAX0Bpk4k8rxds1ajBnyxrMx9lIJvbImVfGOPC9bZfpDkAz+L6nAF1y2Ieg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG2LqvbST8igNEqf7r5zB7DgukuJo7gpk4gMRdSWQoQaOeSOrX
	OdqUBZGuqH/oVi/8K8kTAdgW6JqVHjegY7PtsYYVrJmUyL1zNn51Dwao
X-Gm-Gg: AYBFou2wLp4Wf2aPdDT4Pf3nZszaHeJFA556uWXKubolPFeyUEuJBknuVBtrULT1TEv
	NvAWb8Pywou6kuJJEzIBguwpFGrgy0nltfYJb4NcVz6w/JAt5cxzsdWNnazpyrhm3ENQynl/Ps8
	2VnKccRQkqrve2qIsBX1a6+9SDvxMYrqhGEQ/SdKUMouAvtPorgsR+//Ac+gnD/aGI3CbtEWkY0
	8RPjPAAHKIvVVNp40RQ1XR01HJ1U59ZiTGcCMV8vCTRAFIsJ9YGEckmHcFCe7azAQHeqcmVCWqr
	UQZZtKJ0MJ7lC0lO9+C2+Dqg1H4J1FYTqtieYS1Pc/bQpaa0wDFPsMJ4I/Pt1Qgw3fYchDwxkjF
	5DjOdDNHOq2tfq6iv4nvHSNyHhaIGneZy+MByKt14UACk4G9muwn+lRsj9c/lbgWz1O0IYKzmCM
	4PZkz/3MR5le78Glo59MlaeL+hrgu1zCQSPLtbNvlGMWoBV/zUT6JbxA2QA0kJbU08Y5PJo0FUj
	oKlZk/2RkPaPfnhDvxh7Kg6rzX24WSFbmEMUK6jiSAslIspGIIojvxZ8XNRMeB82SMXNrOZdtrB
	UOesYL+0bfkHlDTdMLfoMF/WoR8=
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr1954672466b.21.1792155160445;
        Fri, 16 Oct 2026 05:52:40 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm69433966b.10.2026.10.16.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:52:39 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v3 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Date: Fri, 16 Oct 2026 14:52:28 +0200
Message-ID: <20261016125229.1798791-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 40 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d451..e68e17bdf0ba 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -233,6 +233,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_RESET_MASK             0xAUL

 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -394,6 +396,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }

+static void xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	int ret;
+
+	isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+	if (!(isr & XIIC_INTR_BNB_MASK)) {
+		xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+		return;
+	}
+
+	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
+			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
+			i2c, XIIC_SR_REG_OFFSET);
+
+	if (ret) {
+		dev_err(i2c->dev, "Failed to clear bnb\n");
+		return;
+	}
+
+	xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -883,9 +909,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}

 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);

@@ -1030,7 +1053,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);

-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1097,7 +1120,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);

 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1181,11 +1204,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));

 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1227,8 +1250,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)

 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+				XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}

 	i2c->prev_msg_tx = true;
--
2.43.0

