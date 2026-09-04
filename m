Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E572650AC36
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539489; cv=none; b=DBB72NGCbD3tTHKD183JcqEWXIApoRGWZY5xEK6qnExmdp08VKGR9UE+1j1Dfg8Q8cu94ya+dvP4UjXdzANP7QLe70nguOjws6bFwXSwIWy0WJ07QXwJesVXmW1+BZK1FcngWSkonmBewZaDWVvDdYguhe/i+UGunVuV10bFxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539489; c=relaxed/simple;
	bh=v6BGTskfyYdAzw7ivySRKD5EqTbHTtrOxjyyM+NNpUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9EdMgXfjQa3AweUGvvSSYnOHi00Ra/+8AAn4IHynnbvr2z56MWh9kau6Q+DWlJlC1SIm6BvxbnKQvt4z3nxcYeSt4x8/3hP3Z31Wm8W88edxK/QqHo4DgYjz4jvUc7QvYTys2tN18/KQKbwRWQ2w55ASo+jydQyCJncZxFCKlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUmJKJCz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUmJKJCz"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc149372c14so689097a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539487; x=1789144287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7u3jRd+MzxyndQi5AHaCjt2uZ5jt3CwjA+sg8R0AWQ=;
        b=KUmJKJCzX4xewi5L89+oxty9tFyODo751x6VKtNj2HUuMZ1CmQipIO6rrao+2f6va/
         WLE8Zh5bkX60JsmOBhTsxm8aduwMPTHUEkrBoOr3x/6i7TVMratzT3ElixBcVc83GPtS
         AX9V9u2RmEYHTd9gdoc/jComEqFm+0NnkgyumPTFOCBGC5G8WIvqcevZpUqi8/DBarTQ
         plJePtNiy6QLBZBnvFhl2tjMmO9BTZOT9l/LKglWHRcxYXv3donthtY6Y9NG+YTRP+q1
         6z7IcvslfLBA+TT3hfyzdHLqnT6/KEcyxd16kASS6/RkM7JxtyBEGjG5fT4prSxV82NW
         95DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539487; x=1789144287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7u3jRd+MzxyndQi5AHaCjt2uZ5jt3CwjA+sg8R0AWQ=;
        b=XoPdjSx4N1lu/0CWDnugDptm2qVy66nEY7ZDjwM1o4GBJEJlTfzgpDkg1sEC3kb5dQ
         G1kPUcC2bID8HHD6uqHhDgHqHq1Q5L5ZudGKUFtSLQP7Kfji/i8HvATE9VLU+5v1ltKr
         TvmNIGX20kOS/PwJErptuRR/2D3k4mnKUZyBvYdQaSiDvzjs9FmPeuG6q+cAU3AV9YGe
         RZAJGm/xgoyuXJWMkvfCtrDT0lip/W/iC3fW2at4WiPvdQzLZ9Okf49NnX+Y5PQLtzW8
         CnOphzOEs+7s6rb15SteU0aAxz83zL3ec+D3SQjANtCkQe2Bj7ob2R8sohb379j/cNJB
         YSDg==
X-Forwarded-Encrypted: i=1; AKwUvBz/xKNTggovtiI6szX+OW4nw0InndblhQg/fdLsLH+P2MKJP3YwdGlprchm9YCnPFcAIVEanbbG57Hgnw8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKJb4ZRMk9svYauq8Q0pssd9VBp5yI29MLFRpaYspnQGs+sm4+
	IhIVYlHDvqbceTHEH4LpU93e2liJ0Lr0/vQ+amilkTyLVGXrSCiPffOa
X-Gm-Gg: AYBFou0yQSkYIdKt/cLYSwPlZaxg7dJPhAZbLNQLGQcm8qQHRtk0XTz9zrfdW9nWfOC
	Coz81xzWeGBNU4jy0PJE09sWbzrb7SchpDIaEXCH55z1DN465ieQO8Jtswcq+cgFbEJICbWAKEo
	ifyuVMKkEIRAxYULsD556bXuN8G8yIuJBDKM7aO8Sad29okqzTyYuGudxd8yNF8/G7dkMzTmpcC
	nFEh2KmRiKFH3T9aoA6QCXWbgNSO+5YqtWalJDSfsm1Tkix0YnScV5NI2hvQbMYReWDJijB865C
	Ch/BTIqMm+q0UBZAUtA5dYiAdu0mc5XoCcf3P1m45UJt+95qVuR1WY1l3kCWeYxk6OeNBnXRzkQ
	qh6SjTIoWp/4PKma3ySPVJaUzvkMJiHwI+Dj4phj3ABkNYof8mSRQMj7MLvZtIcOcU5DVRy4JeZ
	72rghze3nHb1A53II6742jAq8n2d8cwN5mXlkYr1h0ObvvkelJB7r+zaAbtEJq8/5baSen8EYIU
	PkD0WHfjBiYPbQ=
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr11726379a91.19.1788539486428;
        Fri, 04 Sep 2026 09:31:26 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661b:3050::4d0:46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm5383010a91.0.2026.09.04.09.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:31:26 -0700 (PDT)
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
Subject: [PATCH net-next v2 6/6] net: dsa: motorcomm: Use safe 64-bit counter reader
Date: Sat,  5 Sep 2026 00:29:48 +0800
Message-ID: <20260904162952.709368-7-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904162952.709368-1-mmyangfl@gmail.com>
References: <20260904162952.709368-1-mmyangfl@gmail.com>
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
 drivers/net/dsa/motorcomm/mib.c | 19 +++++++++----------
 drivers/net/dsa/motorcomm/smi.c | 30 ++++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/smi.h |  2 ++
 3 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index 31d86c3122c7..8929476a976f 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -102,26 +102,25 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
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
 
 		buf[i] = val;
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

