Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307798;
	b=FPy0b3w2NN6Pk1FF2lF7jn3PT2g9L3t7o8FMMXW5BohHeHtPuKONkAS//NXQg0gPqE76
	 1rUcIb8nIKhwF2/yq6+pdBDnr2fwPo/X1yg47Tfap72i3jl2noXefG7oAeFtpOwsnS6cx
	 SDL1nIwgpq4VmIa8R+d17ar0DGP9UK40YvbnuIuwvLm009k9/rIJXQ2RVImYzObR+XZ0j
	 enPaDHGp80I9ot59lEV5iKhhzZYA8FCKR+qxf7dt7ev4PcgHf7eedJLuv2VHsMgQF85Bo
	 Qi2eas6/OE1NtZ0qxT5tHDy2YUvp4/IfCK0eP7C76dQamZ4qRxDPZ7hqBeaAn9f5BWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBuo3746wle39j4tB4qABMZkgvKNVlkfWjVtPlqyf5s=;
	b=MmAhZNq3TGXFYMgiElbzXbJ/dfG+hFMNSUMgwGUQjFQJXDr24fIs9winB6TmowAxgoaI
	 Epw+WwJN6xlTO8xl4U/kpZSzlB2ZfTA8GTjDfnDMGQ1rylMiDJwXv7katMlOX9S/EnNFN
	 YZMjlY2+20kBgg/uWX19SFRx9x8YlKE12BoZbWGcgUuWnY6eCX1IFSShqWuZc7ZWofRAS
	 /0WX+ERr4u+Pnwl817E/1Xz/73F9XoGpnWPmU4ntUhoClV8iEXaUEYjVg6j7SYZ/6h8uq
	 3wGwV7mVs4i7bnuCBYNtVbi6LtoIZepyuv1p8aKfBLDdNYu+Tg9Afxlf8ZGEQP+X8Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v+/BH2b5";
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B6360A2620
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B6360A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+/BH2b5
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e96502e447so15400405ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307797; x=1794912597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBuo3746wle39j4tB4qABMZkgvKNVlkfWjVtPlqyf5s=;
        b=v+/BH2b54+pvoF1P6F3VrMhIi+jzBpaWE+ckSGRv/1lFtP55O+WAOTzxihP9ulZEoj
         fjjz2tCnTDwNQQSutY7eXih6apzgiyLzikNZgLinD2ov2khIPu7bP0h2Wccc/TF5N0vL
         beWZ132nnimNsHWdu+yTfyeir7JUZHRzSwYG4V1XirlW0YV7PA2+6FXfKM5XM+W0PSBM
         /ynVx2IpOJFZ6nTWoVcYbpjw6hDkPUeSh/XN2uPFz1H3x8dPrua9SA54P2W60DlKltUC
         VbQuRII7/YEMZbvGdeHwJLN6RCGHbYhOCYOHXBJJx65OQK+Oe7YefEmGQJM4cQk5gtoF
         1U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307797; x=1794912597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBuo3746wle39j4tB4qABMZkgvKNVlkfWjVtPlqyf5s=;
        b=gwFHIVzH30n1dwhX6w2n8PabHt88OgXaOHnr4xDYbK3gcN8lyq5UZtTTFYqFVG12Uv
         b73ezecvGI1UUAIKfMa4srohoJtpXKBDOj5e6yLo/QygNRlidtlHfQDGQChESy72QjPJ
         HIciwoY3yLI5+hR+edL3Da+ha0XiLNuozzK1lDHB+CJRY0l7Q1KDyoLQqzwQgCf1A5pm
         4bJh/7G+oK3WfumOqV+uDch48PzLCLmGXcM+eq8wWuUNwt0RaRMOTgpz7tu23xstoAeQ
         jpsZNSooGgv/dq2yTVuqGxmGLelpxmvfq90pMHnm1Ri3DTU3eVaNGvS9CrVu5hJgo6SE
         LVqA==
X-Forwarded-Encrypted: i=1; AL+hErF40SplmndeTgGu7nFiQCBAugVycSVkR4DLXb5vZ6zv4gXnWuUtNQ4p++C8rd8QOo+3JyKclR7yBfuPxlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A4tvxFFtu95TZa619Jj8hhwgRWLK8sjrW/ApAwEJ3wsRvXrV6
	2NVlj84azveVEGSUG4Q1gWQjS6bGwgFAPEgTZeDwZk4gOoQmsBV5L7ii
X-Gm-Gg: AYBFou38TifbUZtNNGnaItILhdDgXLgNOKPdRTMV/bgYFv5iO6xjef+PYMJJXdhnl1R
	Dm2xG/7YaXyAUCUpAe7cYOIwao4vFuDKWHr6dty/KVf9zUGDhtPn3eAzrmUDO0r8iEd6maCy+R4
	23Qu5beO8sFy+bluW+OGavIfTzJsofRSeOGuYEwM5UYobx72ll+97G4pepO2zcH67dso4Frny+D
	i9//UV5hZ8aIknJZSa8aZboCZcyncuoQ2HEuurwBLMIir/emIBGJ9p6rOD4GQvGB/eaC65URg4I
	kwhLrSogKnhH+rplMmf0du0Uu07MiA+TeR10zTkpXeS4noKcUrjDudVLPXk0DkNHvrKXQOa9GJj
	anQmFvSn/fTrJ45UGZOlQPsB2SnZ5bcvZtm3UDBDty3RRHB1VxUkkFWErGhkzW5uglhk6qgJ0sz
	XafY0VG7Znx8uDR2Yg5n85STjMfx7uthfctFrchmmpO3VpuNmQXCYGNCm/0m7r1eQhghYdZCFZT
	w0Rv3rdqCHuSRW9Znbf8jmFJ1IpYopQl0v1SQ6kNfhJ8o5hUmvp08/+sKcsxXCn+OWCZnWVikeA
	QWd5UWFWLiUOkYbWB2LhKjSVGvSHMxXLT2jZH/cuu4UBKqV+m0ivIbyC
X-Received: by 2002:a17:903:41cc:b0:2e9:776f:66b4 with SMTP id d9443c01a7336-2edb92f0722mr20908875ad.44.1794307797151;
        Tue, 10 Nov 2026 02:49:57 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6214:1250::1d3:d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d906e4sm7337815ad.40.2026.11.10.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:49:56 -0800 (PST)
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
Subject: [PATCH net v4 3/3] net: dsa: motorcomm: Delete the ACL rule of the port being unbound
Date: Tue, 10 Nov 2026 18:48:55 +0800
Message-ID: <20261110104930.223598-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110104930.223598-1-mmyangfl@gmail.com>
References: <20261110104930.223598-1-mmyangfl@gmail.com>
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
index 429345ad1eda..e3f057ed580f 100644
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

