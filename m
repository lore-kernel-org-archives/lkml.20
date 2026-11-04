Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826484;
	b=c4tB5qiRHrerdMjDzIxxQxH1fdeBtsnwBWUYHHuoM53VyClGBcPJhquzzoqIg8F34zq9
	 lAYKBxOGAiKykVA2g0XCOjLVkyumYU7hqHzOe8ANWIma8Yx7hzaH00fYAMHAaQtHgTwCy
	 4sljkueDOfwvaGKUkHMQbm8udMZRC8EVglXhwSmbK2fja3BnZlJsivNLSewlPRtfJ+AW4
	 I0dyAEigGn28usConvXmZgnQMlin/HnfKa1jm7NPEJbJbFY60JhyzQdb4bLaa8I+R40UR
	 Kch8q53WqlL7NnspBX+2MiF5XePbIh56R5eUq64+2lc1yYplmGYv3Mhremu3y96/5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+rJsZnbhDkmWhQLHD7xKdP1XlwnqJnabAk0+PXTaRU=;
	b=I2+Oi1J1RahU1yU5YwTEFnEFT+QggKEDxPttU4CN118cHaIyaYSY2MVf5x0pD3h49CFg
	 q1PB1vrbMAlJBQrFO4piq1ahNEKFsrUyB0+TGzKPFj2BEl7VwIt0UYGu0T45TKOWIsTZM
	 iu3Sj3qbaOhMDPuWdmKSAXbLszQIYZoGlUiPfWs+QZnqtbuXHEesneVu7ZVecw2kJuoS4
	 bVh+gr+nFWOP0s+ojvjAnF+taOxOVMRFM6uQYExevkNLjDztvJKMJfymU74zKPcCAIJE+
	 meAd9xT58cjAOUUL4mRWRrqBngsHsYshNhsypo7tJfNiKPBTICKv0/VwmBn1Rbs5MsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w3hBO3nj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509376070E40
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509376070E40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w3hBO3nj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9295065e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826483; x=1794431283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+rJsZnbhDkmWhQLHD7xKdP1XlwnqJnabAk0+PXTaRU=;
        b=w3hBO3nj7L1QxCpl0VN0c7aFULGMBPeL+I52Ef4u6BaELl9LKm5wxHhYnIfO+QRVip
         jtr/gTnvC++DSgRt+KPL4pB9ewJrdzqVq4dnYXvJiNgSSEku4jjXv8+TUXTv2d9QDTT9
         jSw7pk3iJ5oKV47JtOz1fYLxg0FbdoONeGrDGZX9di/43J6L1StvS8jXTZ0mdBlh9xLc
         T5Qpt0KiAt0VWn3BQO4P17LZaYjicVYSjlbOQG9NiJFzRB7TEBCMnk6d78ADoF8h2WEo
         k0zJNyaJgIhTCuxempZyLP1/xWtOAk/ThEgdhGA3Y/GCWbIbS11HFpdzfMHslEujZzCi
         Zkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826483; x=1794431283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+rJsZnbhDkmWhQLHD7xKdP1XlwnqJnabAk0+PXTaRU=;
        b=Y+gDiNG6zp0YLZNvLsoRuxJM8TKGydLRvQdS+7QScgFvFpg9fKtELx7E+YYiXpV6Uz
         og11T3RpgX8FJayzbeYN6/wE6Gd4SkTBXAxcGgPrD86mXUMaletx4z7XrVgX+4OoP9L5
         6PaB/vWvpyqSvVk2M7LMYp5NVFlJZpXt/M5+TRhpq1rBTPRi98KdimFjJ5/E9keI15WS
         uRbmdzekK1GjU1JYsSVwnA7Cheer2T5xtgC34OvGpf6tBkr+gEedQWZywrHwW/cXRDE3
         02EckW2NdXpTUVG6N8kaBeex7jA2vehUXvMTWf7/Mzl5WgUijHuPGahsA8WAYqCddS9j
         DSyw==
X-Forwarded-Encrypted: i=1; AKwUvByOM8R54wNeTQZ2MILXKu7Foea1aFcApw9jPpYRU0r/KXDxyI+czlHgvuF68jPJ3aSX7QNSjk0hW82GIaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UaDy8k7Dh43QrLYcciJdu8aypQP1Bwgw95EWFCs6K8w1iszc5
	lDX1w5nTpdCfPQwz8q+D6oMrgEdphiqszjGvR+JaIwi+Cb7/RzNmIndP
X-Gm-Gg: AYBFou0TkNIsJpvas9B2j+UNPn1K4jZGJ2ztqu/LfyEUgFiR3ZgPUNxTTcVKJCiPcTD
	SyC3GTaXhy0myTmqSK17Qhz3F4HLbEHdeCrcixdAscUx180wjGUe7eSOJmaVZ+dA1eYalu1jQA0
	WuLrNwSUg6QiYkkUIdqiSD4bmTLcWjXPUUapo3eilkRFLlIM9joAMOK4HuAiG90x+qKfc+BM+gU
	CkGanMs7FU8qnBMLJuXU6ArR78+jY/0/bSpSDqii7uCyC4UvUx5Akh9eCOzCAb/XzYBYCwyx5nL
	e1o+2wdC+v3O9C5myrOyJvJd/oREkYymG9kUaNebIFY/SDV+eDv0oUJFzYN8VQ2P2v1PK3h9WaM
	UF12jMZnaassOyKPD0H8av7FGj34SA8BFgNedTMtQLZ9fO/IYjMA2oWcaQ9BEoDtNCbWsuMCPm/
	wfQkaU46JkdSuH6V2ojrj9Rm1UBXOmwzFhw4PIQi3CJC1C/ryvEZFFxX96zYXbuEkaMnnH13uw2
	oquAoPJlW26+mpbiM49vnkJ4O5DcJofaX0xV8xwwvqvVc0dS831QbVUDFMEADRGXZyq26RnhqXa
	77tgo4u7BTiuT2kuOeWdytAfWn1V4Djqy2QwDggRaQgXyKaADFk=
X-Received: by 2002:a05:600c:674a:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ac14ec788emr386503895e9.3.1793826482549;
        Wed, 04 Nov 2026 13:08:02 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c23:788d:6769:d03c:c916:2aca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm11998855e9.1.2026.11.04.13.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:02 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/4] net: dsa: qca8k: read each register into its own word over MDIO
Date: Wed,  4 Nov 2026 22:07:54 +0100
Message-ID: <20261104210757.467964-2-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104210757.467964-1-kuncy7@gmail.com>
References: <20261104210757.467964-1-kuncy7@gmail.com>
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

qca8k_bulk_read() is the regmap read op. When the Ethernet management
path is not available it falls back to reading the registers one by one
over MDIO, but it stores register i at val_buf + i with val_buf a void
pointer: the words land one byte apart and overwrite each other, and the
last three bytes of a three-register read are never written.

Every multi-register read over MDIO is garbage then. qca8k_fdb_read()
reads the three ATU registers this way, so the FDB dump shows MAC
addresses made of the VID and the aging field, the search reads a wrong
status and port mask for the entry it found, and qca8k_port_mdb_add()
and qca8k_port_mdb_del() write that port mask back into the ATU. With
tag_qca the management frames carry these reads and the fallback is
rarely taken; it is taken every time when the management conduit is
down, when a management read fails, and on boards whose CPU port is not
port 0, where qca8k_conduit_change() never sets up the management
conduit.

Store each register in its own u32.

The bug was found while bringing up a tagger without management frames;
an LLM assistant (Claude, claude-fable-5-1) helped write the fix and
this description. I reviewed both and tested the fix on a QCA8337 behind
an IPQ5018 (GL.iNet GL-B3000), where bridge fdb show returns the right
entries with it and garbage without.

Fixes: c766e077d927 ("net: dsa: qca8k: convert to regmap read/write API")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 07227ae8bc..1242ee3469 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -519,7 +519,7 @@ qca8k_bulk_read(void *ctx, const void *reg_buf, size_t reg_len,
 
 	/* loop count times and increment reg of 4 */
 	for (i = 0; i < count; i++, reg += sizeof(u32)) {
-		ret = qca8k_read_mii(priv, reg, val_buf + i);
+		ret = qca8k_read_mii(priv, reg, (u32 *)val_buf + i);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.43.0

