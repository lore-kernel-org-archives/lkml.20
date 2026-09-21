Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63764908D2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022706; cv=none; b=a2oG5KfUpRl8Idi7zXxLB5S7rwaBsuSAK1LoIkzitSZvi9kU5+gsnCvV4eEt1Ieme0IbJpmIgZuvaGcrGRAxgiwAxhFwpEQzRo3M1tcrJcM929J2aRuf4TmaHl2G/0vk3lT10lsMuui1ocj3TExEiF8VwIaFGXR+mBYVs5XUyPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022706; c=relaxed/simple;
	bh=KxcqtCvLZZ0FyVbRd+9oxq5AkeO67/xxT1gvgXU7Dyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrmNeZTagHFQbFDNCTDQZyKZ5ERWIG4NFQNiebixJOGUnaELQvh/+PTN7+q6mBeo8D/jS7gzYzEp9dP9CYmipX/92EGBxA33UJc8KjEVwiL1beQO2xKmUraRWfuS+DKEejTFs1vdROcOLlzrCOXYIH6/LLOKezwAY5HWGCe/I/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmbby6a2; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmbby6a2"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2366179a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022704; x=1790627504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oy7EV2JGAs9rxMIj6O8TddVtVASSLTNO0sqL2nzDGY=;
        b=jmbby6a2Ybi+OT2ZPFgx76sTrDbSJC6qPzFO+odIGyMDFUkhBQKE3k0wFzttd59kzV
         RZSensOLP0o+2mZNHQdmHLNab0raYpTwAU+7QAAsbIRw/IXCkWTZk9GcUQ9O9xXS0VHV
         c2KzLnUKnyQtp/1zokCZmVgeFiespbrEEXLMaqcsI4jl659cYMYWHfYMSKRjBn25abIJ
         6hSfotU1srumsk3LAvS0oxC43IDQSCPtnt/J3L6SJ00CWMhp1sgxr5Rcik2g7KdC8OQH
         VazEsAT3ArtbKeH/9wj0D/E8jFlQWZFuycnidGlpzZFMiC94MMD9nes/LYh2851Q8+QE
         cEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022704; x=1790627504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oy7EV2JGAs9rxMIj6O8TddVtVASSLTNO0sqL2nzDGY=;
        b=TPdUy96T6xAADCR12NGk+A7243vxOPoiQqRvTVDD+uDpTY6C9DpjV0CTnqI8EOtJpX
         log54Rso/Tu8tKhxgHc9Mavmpdg2SzkRt75xRf12tHrB37PHvoooDHeZsEsxQX13+XnL
         JjM8Akr29JdzJq2XHT6dW3ihNEJ/pt6B/exnu6vpIzGmAk1rhDHwpvg2o5TLS31YYdpJ
         55ZpFhHdhvUE9GNF9wzzrkRsFudQAjfG7z3f4QtB3UNVbND0UP1NmQlccxn2d9YwHqj/
         sX+1xeA0ZYkGPcACQe8LSk0SZ4ZPcy9mfk9YAVLDv7nZWcupklKAUYxD9PP8DM+Y+Kwc
         95aQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYtYCz6x3Q+BHXKTFxZFdjzAVjMGEL1RT1pjAwjrVz1mYiIc7vWB9G2B1nBr0vepBVUqrUI4G54aHar1w=@vger.kernel.org
X-Gm-Message-State: AFuF++n+qctSIrogX3IrcZoPRy7QKHSwwB3+yT5wmhBLlIywwIGdIsh/
	uTI/lvTB6z5xGtwsMDnFbUTVAxnxghGQPNg9Ub6kv8b/IHaI+ZUJ+0RV
X-Gm-Gg: AYBFou3lPP8QXPjOcvX13N0MnEdpv6+FCypvtW/g/YgowVRx7hd2YY3tjiRDvU/Wl2F
	L7XYCutLKm9UWsI6AoNbyjhAZTqcofQX3NVFCTxfWOlN5Ic7o6EuHf98jKtSoJDU1nXsS4/bQkk
	TtkrZ/s14hQVZl4h/kWGeKaIvovQ6kyQ9msTCzMxe8CHTAwUQg0zqcJsG+uJ4UK4DZ62G8gR77a
	aWRXi0/vi3vnwGclKVxJ5hl+sfF+N3iGcUCr5bBA32IaVfI+qWb+SubiOppXQ2UlB6rvIQJ8w5B
	XVop7Er93dVWcWktiIXnThkydWLgD9E0IqP1gB1gOauj4DW1HKnx+NoHswXr1b5o7yIWjjVlGdV
	07Z0oyRbVXiaSXqmBPTCcj8TEJfBSOZEK11TLsNfd7my3IiyhWg7G1sHN86M8966BX7gkcL6Ret
	+mqF/87R0IdZfNcLMRzgjH8j5uVFccNqknwyOcbr0jsPozXrt0IQVG2/CJvmuyjAHCWSm7DA777
	6aNt6OZK5RuuyQ65QHhhX0As5f/GTSyTAQ=
X-Received: by 2002:a17:90b:4c8c:b0:3a0:58e2:db0a with SMTP id 98e67ed59e1d1-3a058e2e23dmr2585368a91.27.1790022703454;
        Mon, 21 Sep 2026 13:31:43 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069918587sm447247a91.4.2026.09.21.13.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:31:43 -0700 (PDT)
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
Subject: [PATCH net-next v4 7/7] net: dsa: motorcomm: Use safe 64-bit counter reader
Date: Tue, 22 Sep 2026 04:30:24 +0800
Message-ID: <20260921203040.1203911-8-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921203040.1203911-1-mmyangfl@gmail.com>
References: <20260921203040.1203911-1-mmyangfl@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/mib.c | 21 +++++++++------------
 drivers/net/dsa/motorcomm/smi.c | 30 ++++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/smi.h |  2 ++
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index f5197c1d2d7f..2786d9ec2932 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -105,29 +105,26 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
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
 
 	flags = u64_stats_update_begin_irqsave(&pm->syncp);
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

