Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57C502563
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633223; cv=none; b=rHNwlD0p8lqtJ8dqYLcf0bmYcASN2NBAeUH1xMWRKlGaD0+pT9wBTrpgrXzI1/5NFnDQUBywqicVOmww0yEvqE1y4e+97qmNIDN43ph/vEVGz2GRuaewTp0INYpi8DI0zM6mJptN0OYwAD4Moag4ylKecRfbhRAG7um2xOKpcqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633223; c=relaxed/simple;
	bh=X41/cIbMvzxPRUI5NOfiDZIbIvjDef8SxPQiIMMnTi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDDNu6Y/EIZpy/kwHvcDTZUDPjL7yHy2+jk5cZ03ciear90a20lRNNbCR5gm3YRRsah3J5WOEZOTit7iL7R0g0rfbgATTb6Al1jXC8LH4ygoQ8KPW+FO96S/P3VzzInFmEjSq3+fHUdx0eO6FXq7+8cPGdmXNWt4OncjfQww2Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/N1UpI6; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/N1UpI6"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af43c5b0cso442828366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633220; x=1791238020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBXPUjjR8+JdvTG8x+WkgNQCyJpOtYcJ55dEf/OrhJ0=;
        b=Z/N1UpI6wlazl2/eggTKH31+4UEzARtIY8qX3/+G25ttsVOGsXUN/vj34NluSMETCJ
         0dlzDuuhrvTYFn2iIrHyr05Xyc+2YBFWcn5sZOwU1anKXCwsYNp3Na6SXVkwMeDRR3pc
         /BSrrZo7Qwku3H5fKLYaogSYdYF4xrW6M52XkhSm8bKt5EiQBhs541oeZj3sH3V8ERc/
         IUGIomPQTYpyXxA2HjxKe+FN9Vgb50db4bmYtTXrd1uc5uVtGJVoVVwlAGVH9vv+gtkq
         98E15ssYV4B793Uxoj8N8yNCkrCHs3b3imm9pfDWxd33S3D8sGfUUidt8f38ApdFnY31
         3mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633220; x=1791238020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBXPUjjR8+JdvTG8x+WkgNQCyJpOtYcJ55dEf/OrhJ0=;
        b=HeeJNCcNIR6uAC4aopuLvo72+ydNluHP7awoIcaWIat2EpTeXxxS1sTSSu51+bf4AL
         i1scLx5ZdSffCGH9pt4w4rZwe9a+nZfxC881BFELaOrI5MbHeq1g+gPLYWVUiVjsRhrD
         IV9FnThsYp/1t4Iq+C0s09oVi8tJV7ukiV5K0JZj06w48ppQTSx8H/0F6G8jWJVSifJN
         ghtEAXACaJ29KtmUrX5pfxIkqLUygIJHDRIZ/59mwckUNII2ia6zgQmZXTt4k7OZ6L2l
         11ymsb4yzxiI2tHa7o4LVqRIUzZ3Lh9BLZQjn9QMhu8LYLMeLtJJczp+NsQQfcZAxPwN
         wuug==
X-Forwarded-Encrypted: i=1; AKwUvBznoBqSHstdhnjxVG/k8jbk6Vj+YM8TZor4ZA4ytU2cpIV+H7kQ/r0HQ8br6JgyKuRL4YBgIezgOGawWiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nLacpKCx96CnA4DAbH5aZcFfKkjUQv8dE8ztBNHpS9OuyMOrOj
	K0SbDOwUblI4lP+USr/83HAFZNDbNs4rujUodh55GHdIjlLxBxQmBwHG
X-Gm-Gg: AYBFou1VY6Ipwpu85Vt01XfRp8nBcQGrFVo+nK9gsQlKx7aMfWWhrXHTogbHOdQc5z7
	2r02Ds/iHPhCI0yDkPG+uuyzYVp2geL1NLhBsyyi8HB0prCCWNTpCbWeMz9pZuZFi+7ZCDPCH3u
	9ENFmtF/JIsqcsSPm+J8sJz+KOERAO38/LZ5oHkz2lZ2yX63bZt3Ei0weLtdwayGgy3FtfBhccG
	CUdAmSJ2Lz7YAWgawUfYRYruLHglOPdEhnh8IbZniRzv1xg69arBlWHAjarZA14NvaHi5aviz1w
	ElOQyTuH4ohx7ZfZjwTzgvcBvdQqJCZmjkoBw5Ofq66rvNRU/fxldWUAMUGHjaBiQRR8a4JLbXI
	LVoLk4VXjf7q0/ImwOHLOfxybYbe2gXwGJln5fwJm+2Lfyl/KmWVl2J7gADROfnXCoCqi9C+8Bi
	06dqvEtdgBDvhMwWQLX5MmAf/WV/Xd0K/mdk/aG4VGvCTwN9q8hY19mW2VmkjgdGkN5eO9rdlp7
	IovVDXPOTktcX8h62jnmK3z48Q1euYZrwDqMJTiHUj4ZbAdjNFWZBx+
X-Received: by 2002:a17:906:7946:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c2ac2511a13mr1112807466b.38.1790633219855;
        Mon, 28 Sep 2026 15:06:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm520177266b.32.2026.09.28.15.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:06:59 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Crispin <john@phrozen.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/3] net: dsa: qca8k: propagate MDIO errors
Date: Tue, 29 Sep 2026 00:06:27 +0200
Message-ID: <20260928220629.238-2-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20260928220629.238-1-yongzhao.derek@gmail.com>
References: <20260928220629.238-1-yongzhao.derek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qca8k_mii_write32() ignores errors from both 16-bit half-word writes.
Its callers (register writes and read-modify-write helpers) then return
the earlier successful page selection or read result, incorrectly
reporting success even when writing the switch register failed.

Propagate write errors from both the low and high half-words through the
regmap paths and internal MDIO master transactions. Attempt to clear
MASTER_EN even if a transaction fails, preserving the initial error, and
report a cleanup failure if the transaction itself succeeded. Preserve
the existing Ethernet-to-MDIO fallback order.

Propagate read errors through the internal and legacy MDIO bus callbacks
instead of masking them as 0xffff. Returning 0xffff causes PHY
read-modify-write callers to treat the failed read as valid register
data, which can corrupt unrelated bits on writeback.

Stop polling when reading the MDIO busy status fails, and return the
error immediately. Because the read helper clears its output on failure,
checking only the BUSY bit mistakes an unsuccessful read for transaction
completion.

Fixes: 6b93fb46480a ("net-next: dsa: add new driver for qca8xxx family")
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
v2:
- Removed the blank line between the Fixes: tag and the other trailers.
- Cc John Crispin, author of the commit named in the Fixes: tag.

v1: https://lore.kernel.org/netdev/20260923215748.1336-1-yongzhao.derek@gmail.com/

 drivers/net/dsa/qca/qca8k-8xxx.c | 51 ++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 4c928983b86..0851e4d65b8 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -129,13 +129,16 @@ qca8k_mii_read32(struct mii_bus *bus, int phy_id, u32 regnum, u32 *val)
 	return ret;
 }
 
-static void
+static int
 qca8k_mii_write32(struct mii_bus *bus, int phy_id, u32 regnum, u32 val)
 {
-	if (qca8k_mii_write_lo(bus, phy_id, regnum, val) < 0)
-		return;
+	int ret;
+
+	ret = qca8k_mii_write_lo(bus, phy_id, regnum, val);
+	if (ret < 0)
+		return ret;
 
-	qca8k_mii_write_hi(bus, phy_id, regnum + 1, val);
+	return qca8k_mii_write_hi(bus, phy_id, regnum + 1, val);
 }
 
 static int
@@ -462,7 +465,7 @@ qca8k_write_mii(struct qca8k_priv *priv, uint32_t reg, uint32_t val)
 	if (ret < 0)
 		goto exit;
 
-	qca8k_mii_write32(bus, 0x10 | r2, r1, val);
+	ret = qca8k_mii_write32(bus, 0x10 | r2, r1, val);
 
 exit:
 	mutex_unlock(&bus->mdio_lock);
@@ -492,7 +495,7 @@ qca8k_regmap_update_bits_mii(struct qca8k_priv *priv, uint32_t reg,
 
 	val &= ~mask;
 	val |= write_val;
-	qca8k_mii_write32(bus, 0x10 | r2, r1, val);
+	ret = qca8k_mii_write32(bus, 0x10 | r2, r1, val);
 
 exit:
 	mutex_unlock(&bus->mdio_lock);
@@ -799,14 +802,13 @@ qca8k_mdio_busy_wait(struct mii_bus *bus, u32 reg, u32 mask)
 
 	qca8k_split_addr(reg, &r1, &r2, &page);
 
-	ret = read_poll_timeout(qca8k_mii_read_hi, ret1, !(val & mask), 0,
+	ret = read_poll_timeout(qca8k_mii_read_hi, ret1,
+				ret1 < 0 || !(val & mask), 0,
 				QCA8K_BUSY_WAIT_TIMEOUT * USEC_PER_MSEC, false,
 				bus, 0x10 | r2, r1 + 1, &val);
 
-	/* Check if qca8k_read has failed for a different reason
-	 * before returnting -ETIMEDOUT
-	 */
-	if (ret < 0 && ret1 < 0)
+	/* Preserve an MDIO read error instead of treating it as ready. */
+	if (ret1 < 0)
 		return ret1;
 
 	return ret;
@@ -818,7 +820,7 @@ qca8k_mdio_write(struct qca8k_priv *priv, int phy, int regnum, u16 data)
 	struct mii_bus *bus = priv->bus;
 	u16 r1, r2, page;
 	u32 val;
-	int ret;
+	int ret, ret1;
 
 	if (regnum >= QCA8K_MDIO_MASTER_MAX_REG)
 		return -EINVAL;
@@ -836,14 +838,18 @@ qca8k_mdio_write(struct qca8k_priv *priv, int phy, int regnum, u16 data)
 	if (ret)
 		goto exit;
 
-	qca8k_mii_write32(bus, 0x10 | r2, r1, val);
+	ret = qca8k_mii_write32(bus, 0x10 | r2, r1, val);
+	if (ret < 0)
+		goto exit;
 
 	ret = qca8k_mdio_busy_wait(bus, QCA8K_MDIO_MASTER_CTRL,
 				   QCA8K_MDIO_MASTER_BUSY);
 
 exit:
 	/* even if the busy_wait timeouts try to clear the MASTER_EN */
-	qca8k_mii_write_hi(bus, 0x10 | r2, r1 + 1, 0);
+	ret1 = qca8k_mii_write_hi(bus, 0x10 | r2, r1 + 1, 0);
+	if (!ret)
+		ret = ret1;
 
 	mutex_unlock(&bus->mdio_lock);
 
@@ -856,7 +862,7 @@ qca8k_mdio_read(struct qca8k_priv *priv, int phy, int regnum)
 	struct mii_bus *bus = priv->bus;
 	u16 r1, r2, page;
 	u32 val;
-	int ret;
+	int ret, ret1;
 
 	if (regnum >= QCA8K_MDIO_MASTER_MAX_REG)
 		return -EINVAL;
@@ -873,7 +879,9 @@ qca8k_mdio_read(struct qca8k_priv *priv, int phy, int regnum)
 	if (ret)
 		goto exit;
 
-	qca8k_mii_write_hi(bus, 0x10 | r2, r1 + 1, val);
+	ret = qca8k_mii_write_hi(bus, 0x10 | r2, r1 + 1, val);
+	if (ret < 0)
+		goto exit;
 
 	ret = qca8k_mdio_busy_wait(bus, QCA8K_MDIO_MASTER_CTRL,
 				   QCA8K_MDIO_MASTER_BUSY);
@@ -884,7 +892,9 @@ qca8k_mdio_read(struct qca8k_priv *priv, int phy, int regnum)
 
 exit:
 	/* even if the busy_wait timeouts try to clear the MASTER_EN */
-	qca8k_mii_write_hi(bus, 0x10 | r2, r1 + 1, 0);
+	ret1 = qca8k_mii_write_hi(bus, 0x10 | r2, r1 + 1, 0);
+	if (!ret)
+		ret = ret1;
 
 	mutex_unlock(&bus->mdio_lock);
 
@@ -919,12 +929,7 @@ qca8k_internal_mdio_read(struct mii_bus *slave_bus, int phy, int regnum)
 	if (ret >= 0)
 		return ret;
 
-	ret = qca8k_mdio_read(priv, phy, regnum);
-
-	if (ret < 0)
-		return 0xffff;
-
-	return ret;
+	return qca8k_mdio_read(priv, phy, regnum);
 }
 
 static int
-- 
2.43.0

