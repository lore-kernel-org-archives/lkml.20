Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344423;
	b=M5ZC1U9LVlUITCEA8ehBoVUQumOPik9a60UOQAFnYEIptrZh5WH00kM4555ajbAZtar5
	 Rim57D7y1bV/iXne0AsgKUiw7S4JNOiO6HsN7QBT+ygMa7KMpq6+jp3ItZ/ccfWJhva+v
	 n9+FcIBLhU6dgKre/d4lOswRrpfwL5xg8g6m9C07Tm676Sf6tp/3Y0M/xKUr/b8veG2sB
	 D53t81C1xfyUKOIgbZy6IEv/DA713gTBHj3eP7PNY1hQOOraTxyFRACyBJjMlpwTRfnxd
	 UdO7Baf/GQaIQXeuTxdghs3IRRdploAsO2dkUJ+2yqdXLn2tefPwriMjYCxmi7hGAEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nXilgdS7CLOmcdrjW/kYGIwI3BWhhi5w7jGBtQxBRhY=;
	b=yDP9/NNyPnQpkr/HAXfI0d+GmljlAXD5xBTn3CzQzeTQzNQ3eZu28bn/Hqm/J6ZqPDVf
	 Or8pVYBJKpdXDTkziyWTqHMlQ/sIVwKHqBGbJ/YnNPArOEunZNTrhMPutkY5fNcM3EV/u
	 Kj6/QDOwU0pGPQH5hF/74g5CUAr4ZANokMaH6mY/6z3YlNv2LazLb+2/lAtusl9uK2fsI
	 jlVS47TwVXZgrYPZtbhSFEZxQdpAAJKTSjlBJ8NQff7KVLojhNrb+D2gRAlGwFP7FuSJP
	 QhBANuvriwV8Oy8F7pfic18afzQHFFyCzN3bVHEMMX00OTCZibEtlGbcsyZX5cLi/HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SogZPJn4;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SogZPJn4
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso165817f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793344421; x=1793949221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXilgdS7CLOmcdrjW/kYGIwI3BWhhi5w7jGBtQxBRhY=;
        b=SogZPJn4pjuqS0ad4WFyDqQkm3xx/fne8DbFcoLgwQSV1WFC2uUaMFtCDLp5u6QJuT
         G7r2asDFVbqo72YzbXORE9y5DJwoUTh6u97N8gIQ/vFEE3MYFyoe4X6J+hfiUut8JL5m
         W9WbHHQgMl/RHvedeCqP4EnBoTMzVR6K/darLWm92cmv8EnxkzC1zkH1bCBrJcP+VJB4
         BZuLU1n9epXKgHrEf8prRZpyv3GNi5Qu22hr0sfBQ0/rgakdiwTJK+u2y+FysfRILl4n
         nUay8W3lcRFWmZz46G2oHhOELPzlRLMgOrxucQ3uZsHcq9WKk85DEdUQKQaU/w8QaKo7
         t6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344421; x=1793949221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXilgdS7CLOmcdrjW/kYGIwI3BWhhi5w7jGBtQxBRhY=;
        b=EsCqUjXl0GFtFpZ8GZrVRhUv8exnSKE7gNl9mLy6fC5CodZmAlhwew1W5xm7xlz9BO
         BpWIa5Sa4gFQfW4aX8XZw54aTNHOaSAu5R2zCWOKYwRU4S3W2FfkhuEuQ7KNkw5jvga7
         MtImYlGBgJShk8uniO9PxjudE8J3zKdMA+SNDbjVK7l8/4AhQSAXavrhyccB1kG4gVJK
         /MfUDGEdoy5MDBRja+Eu5+vhtNCHu3QUL0Cgof/r/b7Mm/097tcWKYPELE74tMxx85ly
         G561QWUwPewm5G4wT6HAgbMxJjUvYFBiXlqNc8lwNInTSwXbYgWev13DY0iFRAbIwJss
         apIw==
X-Forwarded-Encrypted: i=1; AKwUvByuRP0N7KMdb3cdPQKnZ5DwdM5KO3YCBNGfaI4IZoT09ZOXZW0UzYWKqNoE6d03XvUIK/jX/GMSdT9JKzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDW+a3A4PoHQkIh6zCTX7E+WB2i8v8L0uIzx33BFG1TC4KeVc6
	INVoJA0eyKu9BxFPzm5HcmNgJkbkOzV6Fck2kL5CA1hTTUsc1oBgg4FZ
X-Gm-Gg: AYBFou0Qajq1y6mBYDzKQv8ARI8F9DEsS/P5+VRpSRQ6yLqOqEE5tAELLiYsmZG6rId
	/Zmkv/ejrmsGH1ZuajCKWU0qMNLe6E1SxBakbkFML15vR6MG3oaYWg/4vvr/JOyCR5sIdlnzRTq
	DYSuelyZ3rC8+ArOxspy2quNiPdvmqDkXnY2L/CAERksgRadieIqMHO/bCNHjBfrN5zSqmEeaEq
	ucfSEueCc3V8fOBFGUK4KQMTK5CQBTEv2TD1DNMhd5vPs1QPO483nc4KoFRTmkDgRogFpIWu72U
	zRirZXQaH8UVuVVuRpmkzDKTjWtA0vPn7h+0WQwbfZvs8grBX3tOAeHu5trvS+gpLqMO/33k3fU
	m7p0JhPn6pTDgEscIrXGl2DNKrPSWPalFkAGw1RRhlV+elxPz7X0bbt+xfozVY0tkkFEeM5NJVx
	Ld5pLCA9vBBbO39+qm3dz4/QD5A4b0Yitf9Yd6YIgRgu5DqLkpqSv2B14zFI43aLtgTBE/Qe7/d
	mcAp0M86Q01fjwhB+f5bSk2VhZK5prHfy9bzQINPxfNKVvF+g+2UV/tRytQEaTL4mCQ+5VJR4ZX
	m/SeWww6tbR+dr/5iPY4HJcoXOzS++pNg+z0q3CbNTGARLV6AyGMfKujr5xJGk9zFkZLRonxMo8
	JG1MKIXOYjjwCZC9ETwrspThY3A9HpjevaA==
X-Received: by 2002:a05:6000:430d:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e6e2c3527mr3261224f8f.2.1793344420640;
        Fri, 30 Oct 2026 00:13:40 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm1489936f8f.25.2026.10.30.00.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:13:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Fri, 30 Oct 2026 08:13:23 +0100
Message-ID: <20261030071325.2678-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

It was reported the need for atomic operation on some Airoha SoC that
makes use of I2C bus. Rework the cmd/wait OPs to suppor the xfer_atomic
variant. To support this it's needed to do the readl poll in
atomic context and special handling for device_reset.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

Changes v4:
- Split to dedicated patch
- Reduce timeout to 250ms
- Disable device_reset in atomic context

Changes v3..v2:
- No related changes

 drivers/i2c/busses/i2c-mt7621.c | 75 ++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 9ea5e3f9a763..0283191ac518 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -67,27 +67,38 @@ struct mtk_i2c {
 	struct clk *clk;
 };
 
-static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
+static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 	u32 val;
 
-	ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
-					 val, !(val & SM0CTL1_TRI),
-					 10, TIMEOUT_MS * 1000);
+	if (atomic)
+		ret = readl_relaxed_poll_timeout_atomic(i2c->base + REG_SM0CTL1_REG,
+							val, !(val & SM0CTL1_TRI),
+							10, TIMEOUT_MS * 250);
+	else
+		ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
+						 val, !(val & SM0CTL1_TRI),
+						 10, TIMEOUT_MS * 1000);
 	if (ret)
 		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
 
 	return ret;
 }
 
-static void mtk_i2c_reset(struct mtk_i2c *i2c)
+static void mtk_i2c_reset(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
-	if (ret)
-		dev_err(i2c->dev, "I2C reset failed!\n");
+	/*
+	 * Skip device_reset in atomic context as it depends on the
+	 * reset-controller correctly handling atomic operations.
+	 */
+	if (!atomic) {
+		ret = device_reset(i2c->adap.dev.parent);
+		if (ret)
+			dev_err(i2c->dev, "I2C reset failed!\n");
+	}
 
 	/*
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
@@ -117,27 +128,28 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_start(struct mtk_i2c *i2c)
+static int mtk_i2c_start(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_stop(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len,
+		       bool atomic)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			int num)
+static int mtk_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct mtk_i2c *i2c;
 	struct i2c_msg *pmsg;
@@ -151,12 +163,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		pmsg = &msgs[i];
 
 		/* wait hardware idle */
-		ret = mtk_i2c_wait_idle(i2c);
+		ret = mtk_i2c_wait_idle(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_start(i2c);
+		ret = mtk_i2c_start(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -172,7 +184,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			len = 1;
 		}
 		iowrite32(addr, i2c->base + REG_SM0D0_REG);
-		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
+		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len,
+				  atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -200,7 +213,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len, atomic);
 			if (ret)
 				goto err_timeout;
 
@@ -221,7 +234,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 
@@ -229,17 +242,30 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
 
 err_timeout:
 	mtk_i2c_dump_reg(i2c);
-	mtk_i2c_reset(i2c);
+	mtk_i2c_reset(i2c, atomic);
+
 	return ret;
 }
 
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int mtk_i2c_xfer_atomic(struct i2c_adapter *adap,
+			       struct i2c_msg *msgs, int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static u32 mtk_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
@@ -247,6 +273,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 
 static const struct i2c_algorithm mtk_i2c_algo = {
 	.xfer = mtk_i2c_xfer,
+	.xfer_atomic = mtk_i2c_xfer_atomic,
 	.functionality = mtk_i2c_func,
 };
 
@@ -265,7 +292,7 @@ static void mtk_i2c_init(struct mtk_i2c *i2c)
 	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
 		i2c->clk_div = SM0CTL0_CLK_DIV_MAX;
 
-	mtk_i2c_reset(i2c);
+	mtk_i2c_reset(i2c, false);
 }
 
 static int mtk_i2c_probe(struct platform_device *pdev)
-- 
2.55.0

