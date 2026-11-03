Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699771;
	b=rdYKvw+YTyuoaZMpc/qDZXjOn19rfP/+IOWx11M9iZEACQ8H2MU0a6yE6Rjp0YVCo+Mt
	 yyyehhvOF5puFPjAm6oSa58h8XuIC4Ud/tnwTFTCHe1wt/oTuOb1VfdFqcGsBowWnKdaZ
	 xo9smqIxH3ncGku46zEAxNPmgT3zg4PIbx3ZyPm1riBHOQDEix5Nlvg2iyhfTwX3HN7Ry
	 nY+U31gblEnIq4Ge7gATXzl8Sze0q7jP68SY4PWaiuNWV8q27vO4+slhC4smE2wsqS6Pj
	 bntnsbS78B4mU4NpCfm2ezD8I0x8UIc1I7qxyYyt2GtYum3D2JboIV73Jm8ZZcT0CAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RKc3AxVEeK3hYucX9TDMZhMBcN9uYGhCCb4Gc7p2Cc4=;
	b=z1k0xT1E4b1M2AXfx8KDkUCL4s9BJMSrrvky5bkTXhT1mVPOsvahVlzBTjym0vBXjMF6
	 wxPr9Y6MR4kVStZU2pVzoMC5KaPckw6cXPi5KYjdTENrICGX6loGEv/thj0517l3kPFs9
	 ETLpfM/UhOOysB1KIdxat8A8N9F9TL1L7elbmTRP7VWiesBQYW5uH9PJHko0FxPMYF23C
	 aE9gRlXARE8RksnB6IHkSMnUPvTJhXKc/9SPM0jNVKZB6UqPqjDYAtUu0gSqdJ1QwyqNT
	 FehmLTd/cM2anbCPyCTaMXh5YtjwQIEoemt8BOtSo3U/z/mfEpzChg2m5GyFX4UlUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QURYRwYR;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EB1606A834
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EB1606A834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QURYRwYR
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2884935a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699770; x=1794304570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKc3AxVEeK3hYucX9TDMZhMBcN9uYGhCCb4Gc7p2Cc4=;
        b=QURYRwYRlzlhJ6/y2zjMSzJSSX3Ty5YMdiiM5u9JPSfocAGyjN+SO315am54GjIY0a
         mSgVYrcz3SWCy6ynvVqts4FmMrzrYg/lYW2hO22I1F4v4FjuE7PkfXKj02TqqEicIqv7
         sNf46RxLTPZd5p1/ligw1cLt+wuNKoMQtX+C77I2od73PZJSxoyTbksXPJZ4D5vM+84Q
         M0nB7PDzL6LDsRe9xOi+Wwt+ob2WbRE9Wi5kz/irs3O+ngj9uQ7/nFPFyQUFBlvp3bW1
         qy0+2PSywCVYgBCvp6waL33ZM+QYndYCUCPM/DSXSQRvx6hD0kpUq4hskF5UuIFXXygy
         9JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699770; x=1794304570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKc3AxVEeK3hYucX9TDMZhMBcN9uYGhCCb4Gc7p2Cc4=;
        b=GLQdjfcpr5PO7gIcq3slw28U5s/RmkQ8R/erMQTDvOSrGiRg0fDGTUMtzST0H4/4+y
         v9hdOt00oh+oLHIcA6WzsXlU2uHnwsOpfE7aP3Zo8t9tyjmEqV6cwJdPvOmPcFCW3z2Z
         NBJ+Flb40ctcfbAl9+397sANnfKMFeOYX57GjYz/teuoLbiGcgq3JhncjC9zNeFp/IcA
         XejJdqkvMxjmmoVLhRJxBjgO76abmn8kqGiGbEW/PS4xhewlxr+GyhOkAXDPZtntS0Zn
         e7MHqG5M6dAq8+xISWMrXAveKdi2Z5qMKA6Rcb1ARgmjnRaZV5NsZl8rANgNGrwFGSEF
         f5cw==
X-Forwarded-Encrypted: i=1; AKwUvBwaqarflHazqnCmqQW+PYZPGSZ/TcLqiI/Altt7fgmPi1h7nLZuRDK1MJr392NGUGR98AN3GHPrUyJPk9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pJYpfD6p8Ms2+Cb3MVJ29ImgR4g6xap8eJRWSxYO7jmzkReIl
	qt5qA0hmOE7SJ07nXYQ1oRitiAYe52zp0Ayu4r//GWz8u9NHpI7LF01+
X-Gm-Gg: AYBFou3tKfXEg8Kl750zp80lUAPLkimdPfPKFlV+Xdt3TZ2zlftjfJ7+UrSe7o7pEiY
	9nwCy0ocnSfpM6jswgQwmucovmogHdp+NwPu/z0n+FVQ3WBH2zM3tbBNLNyr8yoUibKx3XIQ6f/
	uqBD8EA/SuyENBXoKOd7cvfUBTATMhK/NF1O0A7iG5HhNEfOGa50+PQNCgjEs2sSO6ojeq0Ouhg
	FB88n7uQi1c67UTjtUxkYfsVjQih3MryGuaBP8nP9DK4i+6sq5zmIZ/P7wl9ClYokiEv5u+wFZo
	eYXdMkeunTJLjyZa8IVXx2Hj1etkkajqesUcUP/jjWUE1L9G018ixylzSsfaivCnucxabSJbhYb
	xYpR9FwtUwGHGRRY0CDB6cQA7K8Xh/6oNEXZsJl8qy5QdWPMadyLfTbrQDyvKy+dKVfA1+AyKbU
	AF24+p9NPoz33Px8EAJHmKURia573oF12zjspqeO5SrX5NXxCZJNNYsq3Fqx1j9q4smhDmnpoSj
	xYQmzcE1h9ZWtbWqKUNimL+Rm6bVgnNempnHABfstvaogRiqFJZQM2VObeG9AHbrB0iddOKtHBx
	r+k/dfAJ9EJwCOTWJ280IvSgpq1WxJ74e8cet9qp59R6gRu1XQnF
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7563921a91.17.1793699770359;
        Tue, 03 Nov 2026 01:56:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm3488954a91.11.2026.11.03.01.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:56:10 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/3] net: dsa: motorcomm: Delete the ACL rule of the port being unbound
Date: Tue,  3 Nov 2026 17:55:10 +0800
Message-ID: <20261103095514.338700-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103095514.338700-1-mmyangfl@gmail.com>
References: <20261103095514.338700-1-mmyangfl@gmail.com>
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

A flower filter on a block shared across ports is offloaded as one
hardware rule per port, all carrying the same classifier cookie.
Deletion looked a rule up by cookie alone and could take another
port's copy: with skip_sw, a filter silently stopped being enforced
on a still-bound port, while the detached port kept enforcing it.

Delete the rule matching the port being unbound instead.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 5d2db04f3385..159504694158 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1226,7 +1226,7 @@ static u16 yt921x_acl_activated_ports(const struct yt921x_priv *priv)
 
 static unsigned int
 yt921x_acl_find(const struct yt921x_priv *priv, enum tc_setup_type type,
-		unsigned long tag)
+		unsigned long tag, u16 ports_mask)
 {
 	for (unsigned int blkid = 0; blkid < YT921X_ACL_BLK_NUM; blkid++) {
 		const struct yt921x_acl_blk *aclblk = priv->acl_blks[blkid];
@@ -1236,7 +1236,10 @@ yt921x_acl_find(const struct yt921x_priv *priv, enum tc_setup_type type,
 
 		for (unsigned int i = 0; i < YT921X_ACL_ENT_PER_BLK; i++)
 			if (aclblk->rules[i] && aclblk->rules[i]->tag == tag &&
-			    aclblk->rules[i]->type == type)
+			    aclblk->rules[i]->type == type &&
+			    FIELD_GET(YT921X_ACL_KEYb_SPORTS_M,
+				      aclblk->rules[i]->entries[0].key[1]) ==
+			    ports_mask)
 				return YT921X_ACL_ENT_PER_BLK * blkid + i;
 	}
 
@@ -1364,7 +1367,7 @@ yt921x_acl_commit(struct yt921x_priv *priv, unsigned int entid, u8 entsmask)
 
 static int
 yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
-	       unsigned long tag)
+	       unsigned long tag, u16 ports_mask)
 {
 	struct yt921x_acl_rule *aclrule;
 	struct yt921x_acl_blk *aclblk;
@@ -1378,7 +1381,7 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 	int res;
 	int ret;
 
-	entid = yt921x_acl_find(priv, type, tag);
+	entid = yt921x_acl_find(priv, type, tag, ports_mask);
 	if (entid == UINT_MAX)
 		return -ENOENT;
 
@@ -1553,7 +1556,7 @@ yt921x_dsa_cls_flower_del(struct dsa_switch *ds, int port,
 	int res;
 
 	mutex_lock(&priv->reg_lock);
-	res = yt921x_acl_del(priv, TC_SETUP_CLSFLOWER, cls->cookie);
+	res = yt921x_acl_del(priv, TC_SETUP_CLSFLOWER, cls->cookie, BIT(port));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
-- 
2.53.0

