Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794695272;
	b=010OCBlr9J5h1PFdxhREo4qHBq7h4un2/BQO5jt6ZCoVu8cQ75r6fXYl3SFfdHVC3RJf
	 /f3hcMs+cDW/mCOvtQDPMkFf35lu3FdBXNg77XOMWKbRTfXBwQUx8eyuYViNwK4x8Ifyg
	 NasIQNO4mA1HFz+CbcKifMwej/IzbdmS/L6xgOkEvoZb6IX9rJQwwT830UGa1o/n5oetF
	 0QGn60vINRZY/FbBE0Ja/pi5Izzx0XXFyt5RhqEGja8zTowuUuGjC20zQirkyUJU02O8P
	 IHIA2e7z3R8GBLWyCnI53mecWKfVbOe+XRsIdpcXfOZqxtcfZIK+kUOebDW2M+IDtuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794695272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d8bnd7SDpe8UrkEnsKXdhWTdf3Rk+9zb9OfZ0A4bXQY=;
	b=lBndM7UMa3vhj7RJC7IIqtsbqh2Gqj4aJocup3rlqP2ELlcwlXAIB+9FmWyIa4XaEDBv
	 1hRbLKhK4dnGkRgZEXwC5l6cQ87btqcF8Fm6VVtxaAQsNm69woS3parAVSKaDcZAKsnNf
	 fw6TARMa5pgMLg17LR2KJG8qPyXo/k2QlmZBrJPtHLNEEu774AkkeRkh8c7WhIJMe/31j
	 /f4f0eKBsbKRIc9qAUF4USwiGb8lB4/X2S7pzS2gV39fJuzQGe3f7ZUUo2Pqm5ErlCIcL
	 Ap3AeWO4MFMDPoMeBNR0wXAqemnEGZwO06u+/aD6iI3ohxdIB8X3cZ4uOKjjHCUXDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NijiX8d;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363EB606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363EB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NijiX8d
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2091227f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794695269; x=1795300069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8bnd7SDpe8UrkEnsKXdhWTdf3Rk+9zb9OfZ0A4bXQY=;
        b=0NijiX8d1vE+GPA1QhDh9A/J5vIJnBdCXUdZpEarKfTpCsTOLwBY1zR+pW4vE1ywlL
         TTNF4KP86tA+LJfMV6RhsHQ2AaNlHym3c3wcZep2m/vouUOeVwZ54mJQ1Olwdu2V3l1e
         Qxg5QJY9gQ/GPL0OeHBvDD0yWcw9ODJygtXk8GXX3Z4cihkw/hmL9W7UnA7/qvX38CAj
         pHkPwdMDT/hqLniEOALp7HKWe6CZEoc0horXJvQk0SjeYVlOgk71KqgvsMCHWUH7k29x
         oHVy/uFhfkfPKJx8eWa6fouvmXYb/BBRlZZhaOHTkZ8++Bd2TzQrI+1uyO0RieLcqPY7
         IgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794695269; x=1795300069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8bnd7SDpe8UrkEnsKXdhWTdf3Rk+9zb9OfZ0A4bXQY=;
        b=HKedCrLtbStVXXBQbjj0/lEQq90injeVp1ui8cGVmrChRQ6Dg1wY3AS8XeVorsdV2X
         UYuhba6UCXxN6S4ANI37LZji/17VLzPaWQ6aO6kG862FXvOHCzZt66+BUtjzoP3bBYPf
         FJvuWkZDkvxezV+EQwsHK3sFQIeDDDAKTzLmbVPqliu2a81pyE+Z8dpfG2lY0aScvtCR
         qDNR+WDa/Y85reBkcdfW9QAd/cglQMckryRTk61sF2pumRVJ66ITgTgMEnlwHXwP/3gB
         D31XBaC1MvpANlMZNU3aM8aMnByPmYmSdXs1huqL3VaawExoqgfsHvdmA8QCJQth/Sbx
         y3NA==
X-Forwarded-Encrypted: i=1; AL+hErEkozCsC0sKjugSk3iON06GGcDSMRbL93mxWd5gA53gQe4ARIzsFqv4YudHa7s5t8NaQEelKXh30KP0HIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+md1tUSrLpSo91YcrghlJ6AbbUt6lEZy0UC9vEtWf8s/iO1ALy
	qErz+Exwg1EHQG7bjFlmMmLk3ors9yBgNw4U4EjJzqPxm4DwmivldIG7
X-Gm-Gg: AYBFou0I10+LDgL8LWOexaFSu1l/on/iZZB5wuIrnhWqxXJ01Zd9Q5y8nCZz/DY6YGp
	qsjqXXVOaW4yNnT6IjRH5NNt12nypXVMuBy+Gde6w1LUPCh17rhCthLtihnYdc44JCSszmL0p+h
	bgRbPTz3WygzCvvZr48ybWtexG6fIHGf4WJvFQAj5WFrX7z1R+Qo27jSQyscYj4/Hb48mVXl/2A
	82O3T2jAJYWB1EgaUUy8kot541fLxrvRbUMFd1mvj7ycEIi5xcXpCuBiHLwg21l33mrm9wYwjNg
	YiI7d5cj0j8+vFdys8HvFTNDs3FizdLqr5rKGhMG4b/PLPK3YBEKVaC+DXVwrTlXLxDtX+egLYf
	XlqsJAnkUuCDAWXgjmqqbnX+djJKAUkQLoYbnBUReGyvYbEw/TMuSReaf81stdYA7nYFESPrl3k
	rL4UI5XmBELUcDjUwH3GnTe8bkRINAOa0AF15MsJxx6zM5VscosJFza+DHhnI5kaxsUADv4MSwG
	AQPgaOGTphsmNiALzk3dzFzSoLhgyGky3867I+OPatGSXh+cb2VelpusayOTDQcYSRo7DrmyO7s
	GRAe3hZQQTcijdUlZvq2tVKGq2c9vgCpuhXxHF3g0FFk3EZV6vTUiO7rYa+enuhwchCadAiYUd0
	lfQcckfUnseLLrVFzDp2RgObta0XRRRtPvMkD1nSTLL0XU3HQKF5koIRU
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr16824578f8f.49.1794695269403;
        Sat, 14 Nov 2026 14:27:49 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm12835727f8f.58.2026.11.14.14.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:27:47 -0800 (PST)
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	wellslutw@gmail.com,
	linux-kernel@vger.kernel.org,
	Janis Edvarts Lacis <janislacis06@gmail.com>
Subject: [PATCH net] net: ethernet: sunplus: check budget before calling napi_complete_done()
Date: Sun, 15 Nov 2026 00:27:44 +0200
Message-ID: <20261114222744.535158-1-janislacis06@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Sunplus drivers currently do napi_complete() after each rx/tx poll is
done without checking whether budget was exhausted or not. Interrupts
are also unmasked before the call to napi_complete().

Replace napi_complete() with napi_complete_done() and add a check for
budget_left. Call napi_complete_done() only when the budget has been
not exhausted fully, e.g. budget_left > 0 and unmask interrupts only when
napi_complete_done() returns true.

I do not have the hardware necessary, this patch is not tested on real
hardware.

Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")
Signed-off-by: Janis Edvarts Lacis <janislacis06@gmail.com>
---
 drivers/net/ethernet/sunplus/spl2sw_int.c | 26 ++++++++++++-----------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/sunplus/spl2sw_int.c b/drivers/net/ethernet/sunplus/spl2sw_int.c
index a37c9a4c281f..1aada11429d4 100644
--- a/drivers/net/ethernet/sunplus/spl2sw_int.c
+++ b/drivers/net/ethernet/sunplus/spl2sw_int.c
@@ -125,13 +125,14 @@ int spl2sw_rx_poll(struct napi_struct *napi, int budget)
 			h_desc = comm->rx_desc[queue] + rx_pos;
 	}
 
-	spin_lock_irqsave(&comm->int_mask_lock, flags);
-	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	mask &= ~MAC_INT_RX;
-	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	if (budget_left > 0 && napi_complete_done(napi, budget - budget_left)) {
+		spin_lock_irqsave(&comm->int_mask_lock, flags);
+		mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		mask &= ~MAC_INT_RX;
+		writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	}
 
-	napi_complete(napi);
 	return budget - budget_left;
 }
 
@@ -198,13 +199,14 @@ int spl2sw_tx_poll(struct napi_struct *napi, int budget)
 
 	spin_unlock(&comm->tx_lock);
 
-	spin_lock_irqsave(&comm->int_mask_lock, flags);
-	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	mask &= ~MAC_INT_TX;
-	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	if (budget_left > 0 && napi_complete_done(napi, budget - budget_left)) {
+		spin_lock_irqsave(&comm->int_mask_lock, flags);
+		mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		mask &= ~MAC_INT_TX;
+		writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	}
 
-	napi_complete(napi);
 	return budget - budget_left;
 }
 
-- 
2.43.0

