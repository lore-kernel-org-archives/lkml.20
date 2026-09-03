Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E6C4BA9FD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446298; cv=none; b=BVfl+tn1Akj2964sBYIYxcep8PBxRaVdeNHDRL6YUqdlm4PxHmZsQQNlpkYJRUxkcx2RKNAQhQTiSUChJxHJc0U1q4momAh8WBSOlzcmKAT/ItuAnQumzOqna8sQ+L6Rwe9mUgHfWqRZDqvwYNMvJ3Yf0OWOQxMeMCGQMz//ftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446298; c=relaxed/simple;
	bh=kOvpmlyWClc2Bza3wXQ2lfrkpZSO8egW7JGEuQb3cdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2PNUH2D5TQPlNQJumkAvVHcTVFh6WEJFA+cVFcO/Izv/f8UyemOZYi+lqlPGWtB1irvFRdu2BqDi7/4ouFW8D/O92EHmlQuV3l/zyXF15X2BZLA2bMISQSxXj2qhSA0BaX+1ddKg+rrqDD4h50anuhhF3m5pORelC0h0nN20VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4So+RlD; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4So+RlD"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so1974429a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788446290; x=1789051090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LSRJMb0iTwvInt2ft5DxEiXftUD8BefOLSSFLLUPsU=;
        b=O4So+RlDeumNarLmsJX8ereOSCVe/Sjj0z8olD003jpsRXBO23vPiGMux/CbeDcfV1
         7s+cw1OKHOwYBwt6l5f93r9wqeG1YK3Q95UhFHGXRf5XjmK965OkqdRPjVNbo9gLgbps
         83tUtq7mcP4buBxH38w1rT4T022iep5aOhIp2jWRfasxfPomR6s7x9uRMyJIPGVyRkc9
         Yfi9dpoQCyZQJwudaExvsNvFjL50sXe022gaWGF7FBMkRn94M+CnCiLYzFlDuodfTXyQ
         s9lUoCJeCk5ZD7+Jtwz8SQGLXrNDnVka+EaQGvfV5Nt3PgWQlwlXGD6l3VyzjrhrpgHM
         mi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446290; x=1789051090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LSRJMb0iTwvInt2ft5DxEiXftUD8BefOLSSFLLUPsU=;
        b=K8+hzbEY6UK88GCuuf3CNwO1nkHnl5B4wzCzpH3EDGgBTnTCh4ihxjueUnldvkO/Pc
         aGBOHFaZb2SOMntiaHjnz15IikMzfBQSWPRIbrdh44UoakmBL5ai1oJqil4dmQa2ArQm
         acFdtOl/MiZa62drgTHfjD1cfxvdZeb9/ldhMXsNcw4pHaoXpoOauel7idfkO+8u8ApI
         uoAOQ6R3ZOJT3gyNf1QhTfJImbqR1EmF7CUfnrvA8Czab9sCTzHfJMXTvCnKJ9JJ8mLB
         JwetI1zfh005RS+BdS8yzhh0gFgJlo/Eix7LcOOf5zpbMwx6CubB1Ld2JTZwFWs81Tew
         xZww==
X-Forwarded-Encrypted: i=1; AKwUvBzb5YC3JQWE2va6VwYO1774hnK3FQ/d7lYRELZEkZ5R/GS+y8HxoIwM86PBQtQCyecijKpXmqc954rIcOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l6QeUT3CC8uV3JhubZxsT/DXKUAlEwTbZcQV+rW2dwPWzoAFz6
	sy4hEQessRxwp7Cfypqn6lTian0DYBvrbBcFHLssqnaLGfShKJwD56ZF
X-Gm-Gg: AYBFou1q+GOMGjlmaFPL8xBCoI9H24Yo9hSSbRaVzzF7/jrObjYcYvLAe45qlQt+yhc
	wvL0R9fe3yikzBUCrVx7L525LgEHaX4r8ELnXzrt6O294PuDfE+gwKZzocFzPA+vMt8zZGYMGc0
	CP2zlnmzFZjdOWdcwZ0yG6VEfMfep/vDyaQ5BcHHNoSjJaSeqJJWvSaunYW30mU126Cxb1hUVbe
	iPCcN08xE/qaXbqM5sxq99t7ND5Jgs+ssvMnqgZjZYgBjyXi1oYuMyjejZyGq8ltJT0dmcaj2p/
	Xa6SkSVlmczlCQYE7uY+lB6qAeFETqpIKmkvsCJ4F499o4hj9zF2rRdA8bMNh1zEP+fT621XDnv
	CtaBNdZa9n9UAy/Eht6KZF6RPiXjbWGyh92w1L9GsQEneVqkzkpnCHQZDcLeMw8+2/GrSYN3QZF
	X9PnmEX+/JIVO2Cw57/RTYwdIBrt/qblF5HwgIyI/71cFKXcNMVNXw5AHHaEq58KkWDGXegXbcz
	BAvIMKwe+tWMuc=
X-Received: by 2002:a17:90b:4e8f:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b22cb977emr258795a91.7.1788446290301;
        Thu, 03 Sep 2026 07:38:10 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae9087d3dsm2741889a91.3.2026.09.03.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:38:09 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/4] net: dsa: motorcomm: Use safe 64-bit counter reader
Date: Thu,  3 Sep 2026 22:35:09 +0800
Message-ID: <20260903143514.532023-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903143514.532023-1-mmyangfl@gmail.com>
References: <20260903143514.532023-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

64-bit counter registers are read as two separate 32-bit transactions.
If the low word wraps from about 0xffffffff to a small value while the
high word increments between the two transactions, the recombined value
becomes ((new_high << 32) | old_low), producing a spurious ~4 GiB jump.

Use a safe counter reader for this.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/mib.c | 21 +++++++++------------
 drivers/net/dsa/motorcomm/smi.c | 30 ++++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/smi.h |  2 ++
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index 73b2a9f52996..30478ce71c10 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -101,29 +101,26 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 	for (size_t i = 0; i < ARRAY_SIZE(yt921x_mib_descs); i++) {
 		const struct yt921x_mib_desc *desc = &yt921x_mib_descs[i];
 		u32 reg = YT921X_MIBn_DATA0(port) + desc->offset;
-		u32 val0;
-		u64 val;
-
-		res = yt921x_reg_read(priv, reg, &val0);
-		if (res)
-			break;
 
 		if (desc->size <= 1) {
 			u64 old_val = buf[i];
+			u32 val0;
+			u64 val;
+
+			res = yt921x_reg_read(priv, reg, &val0);
+			if (res)
+				break;
 
 			val = (old_val & ~(u64)U32_MAX) | val0;
 			if (val < old_val)
 				val += 1ull << 32;
-		} else {
-			u32 val1;
 
-			res = yt921x_reg_read(priv, reg + 4, &val1);
+			buf[i] = val;
+		} else {
+			res = yt921x_counter_read(priv, reg, &buf[i]);
 			if (res)
 				break;
-			val = ((u64)val1 << 32) | val0;
 		}
-
-		buf[i] = val;
 	}
 
 	u64_stats_update_begin(&pm->syncp);
diff --git a/drivers/net/dsa/motorcomm/smi.c b/drivers/net/dsa/motorcomm/smi.c
index bf3adfd64165..27086602997b 100644
--- a/drivers/net/dsa/motorcomm/smi.c
+++ b/drivers/net/dsa/motorcomm/smi.c
@@ -63,6 +63,36 @@ int yt921x_reg_update_bits(struct yt921x_priv *priv, u32 reg, u32 mask, u32 val)
 	return yt921x_reg_write(priv, reg, u);
 }
 
+/* Reliably read a 64bit counter */
+int yt921x_counter_read(struct yt921x_priv *priv, u32 reg, u64 *valp)
+{
+	u32 old_lo;
+	int res;
+	u32 hi;
+	u32 lo;
+
+	res = yt921x_reg_read(priv, reg, &old_lo);
+	if (res)
+		return res;
+
+	for (int i = 0; i < 16; i++) {
+		res = yt921x_reg_read(priv, reg + 4, &hi);
+		if (res)
+			return res;
+		res = yt921x_reg_read(priv, reg, &lo);
+		if (res)
+			return res;
+
+		if (lo >= old_lo) {
+			*valp = ((u64)hi << 32) | lo;
+			return 0;
+		}
+		old_lo = lo;
+	}
+
+	return -ETIMEDOUT;
+}
+
 static int
 yt921x_regs_read(struct yt921x_priv *priv, u32 reg, u32 *vals,
 		 unsigned int num_regs)
diff --git a/drivers/net/dsa/motorcomm/smi.h b/drivers/net/dsa/motorcomm/smi.h
index 212e20f71d80..d34240548af7 100644
--- a/drivers/net/dsa/motorcomm/smi.h
+++ b/drivers/net/dsa/motorcomm/smi.h
@@ -35,6 +35,8 @@ yt921x_reg_toggle_bits(struct yt921x_priv *priv, u32 reg, u32 mask, bool set)
 	return yt921x_reg_update_bits(priv, reg, mask, !set ? 0 : mask);
 }
 
+int yt921x_counter_read(struct yt921x_priv *priv, u32 reg, u64 *valp);
+
 /* Some multi-word registers, like VLANn_CTRL, should be treated as a single
  * long register. More specifically, writes to parts of its words won't become
  * visible, until the last word is written.
-- 
2.53.0

