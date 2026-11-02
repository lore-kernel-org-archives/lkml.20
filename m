Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603514;
	b=3SibjItVB5qcjsbmVgsBN/wrrSXG5/Q1N+Ec9yNtaolK2wNkC2npPzt4iw/bIqw18yF/
	 A7dAb1g70lzaR6gjbn4KbDmimma6tiVYVrhRG8gojBWSgKVQz65iBO2NXHskZ64FONDl9
	 uGUjk5/uW+68JuBM9+MKTubQU+zfqE0dfcLKMSoaA+fqOxiy4qQ2nZ3G01326HbaVUPEb
	 AiGBMqA19X2T3yqbR210thT+Ovu7zQRGlwMHyPKQ67hubo+2EnGS08sOLMZ19j/V3hPqW
	 D/F8oGCSjY884c0L2fbhwpdfOrJfcgFuyTxs/UDiYwRIye8tqNcBwQu45Y0liZPH2tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=swzQDTPZIeN00KpX50oQKBjJw+xj6Dwfh/YZibjYnBo=;
	b=1Y6eH/0JuMT4b19kDOm7FxOHyFVcOCgMkw2q0jZcoaKcvDipVnYB+/ynXekixzDz7GIF
	 9r9ChmCVgFMSp771ovq6HTi93kAg+RIR5oT+IS2jtxqlv7Q+guNjWdzOO4+vXTRUE7ws5
	 jNf38CKkX2x+VIdIXAN114L3P+hRRb0xAjEFGs7b0aLt/2Zxvqm38Kzk5MZm9nyzY9JOp
	 D4EC1iZ+K9anKoR3JrQnfKNYBDcC1Oq1F32GfcNhRrzVeuHRPEhkghRxenluRmyooHSN0
	 n6LdTddWfzzfOe9xsZUF2IFYXNZe2uok4rvowGiFfJEU0u3J97rK0RORA3ozYoJJGEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wXAC7Otr;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F20606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F20606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wXAC7Otr
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06c60065fso1744907b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793603513; x=1794208313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swzQDTPZIeN00KpX50oQKBjJw+xj6Dwfh/YZibjYnBo=;
        b=wXAC7OtrlblRaVI7i693Z9pM5n12p2nkW536YkGIUZPZ9oF0L75JwccygZKG48nHvl
         ez0oght18JoxbhZ9qMomjbNt/SjGB3VER2WLdVrVyN6HH7/LnVXDkiS7XW2Ey3kbzb8k
         DRIS+xvIXVNipuHQ6iYFA4PMINTE/wypFquDqpU0jZ0VITjRq0qYZ8bO9+mZ3Od4AgyH
         rbX7Ulfxsn+dn3b0cMOycjuaaqNI+lD08Db34nhTU0KAlJdNQGWuNaeJZaTFJV1vfu41
         WL8h4wF2sYxInNTe/cgEMlDwKMvvb+kLabZA+Sbd9WCboExvyhpR+NRFxNs8rmdqdLTp
         UhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603513; x=1794208313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swzQDTPZIeN00KpX50oQKBjJw+xj6Dwfh/YZibjYnBo=;
        b=LtpSfi6gNK+IGYJ0dF47eEoceefBTwshoRvRbJgIExoZjB099nf2Z+rEB/6t9PodDo
         wSqyLcqmdDaNlkjYJKZvcVP47ytQPIwSob8jmfv6YnV5iPSuGz/0Nlu7o6RbFjz/tn9I
         h6T97N/C+LeWu7quhzLW9Od2GD0g/AVUptIQGsIXox6G4PLEM/fuFD9idn6Xi/QkNy86
         x/kXKWRsmeytD6YKPvyHch1GGpCYepTN84I37TzlubsnZcGCGu67ison5AdclenXmMMz
         mIJzAX6s6YHEF6pbXGBrxl7S5lIFCfHRDY3QDfKQN3PSIo8ZspEZp0MWoHxw2NtCu5CI
         Hm0w==
X-Forwarded-Encrypted: i=1; AKwUvBxqpglhxpbUhmxkU3dXz3UeczIzNEX5WnXCQz3NNsmSSsRYjug5LXQLztEZQ8En3eJH+qDu8ses0OyBsWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0QtjcNhMrcQ8vgNlXFrQ+hwku6jal5F0Lo+LaGU8K5aUyas6u
	MoOvOshNo0PJRYTEHuad0QlUxTPHWYbjBkXCYW0SVkphRmmrhh3FEDlz
X-Gm-Gg: AYBFou0Z5fgNvxNn4oOTy7H7uAgczO6nUYNfKQRNhkF9BK/EwIitmF4W8/FgjaiNYXL
	U1W8CFoZmBqa0FwEhMysr0otjhRV/V1taG3yzDxhWHtCTM5mr4d2LC2/QqzlRlkaigwo/1gxr92
	72V7ZplA/eLgEhIDMt437THlZrOHuURpIk98lpR3jAhTS1duDNwohrWwkkRER0ERKzH+U/Pq/7+
	co++5WrmBL0IpnGrEdz9ETlJkdVjv1FN+8j94cqmFjLQa9q+3ckCuPNrNJEQsrCocAySUzld7kK
	06EDRik5j0DVkiYeaHsy2dKo7kRFRemUEGQAvKlynig90kCyqKgvjsY3Igy+0lldnAzDHIGZK8j
	NTSCKPKB2S21+28SL2bYc3DrWHshaH+J2nIrjV97af4Q2WbuXqGoRoyj4LZjzFGqoa9XyCuUWUY
	ItufamR40inFz6lwOmSROwcUjaZcJ4VF7pnKCvZTsG3uvtm7NZu/XpJyk2a3LjoSgbGx9Cr4TIx
	ymEnTXAOlzF9WvQRzPfvOPVYia0/dK54x/6LJlv9R6D9ZXACWzsAbQILoG5hxnHFeGT21Vjv199
	wwHS2nVVvU090D+8bKG53BumilNEyXnknALeEfDMgWo6/iytdpOUm3uXXG/k5r3ba1D5yJ1obQ=
	=
X-Received: by 2002:a05:6a00:bd02:b0:89f:e248:ac38 with SMTP id d2e1a72fcca58-8a9b9a4ecbcmr6706187b3a.6.1793603512935;
        Sun, 01 Nov 2026 23:11:52 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8abab0c6c6esm1140566b3a.48.2026.11.01.23.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:11:52 -0800 (PST)
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
Subject: [PATCH net 4/4] net: dsa: motorcomm: Delete the ACL rule of the port being unbound
Date: Mon,  2 Nov 2026 15:11:16 +0800
Message-ID: <20261102071119.3435180-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102071119.3435180-1-mmyangfl@gmail.com>
References: <20261102071119.3435180-1-mmyangfl@gmail.com>
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
index 87c04f0dd736..235ecc1eedc9 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1223,7 +1223,7 @@ static u16 yt921x_acl_activated_ports(const struct yt921x_priv *priv)
 
 static unsigned int
 yt921x_acl_find(const struct yt921x_priv *priv, enum tc_setup_type type,
-		unsigned long tag)
+		unsigned long tag, u16 ports_mask)
 {
 	for (unsigned int blkid = 0; blkid < YT921X_ACL_BLK_NUM; blkid++) {
 		const struct yt921x_acl_blk *aclblk = priv->acl_blks[blkid];
@@ -1233,7 +1233,10 @@ yt921x_acl_find(const struct yt921x_priv *priv, enum tc_setup_type type,
 
 		for (unsigned int i = 0; i < YT921X_ACL_ENT_PER_BLK; i++)
 			if (aclblk->rules[i] && aclblk->rules[i]->tag == tag &&
-			    aclblk->rules[i]->type == type)
+			    aclblk->rules[i]->type == type &&
+			    FIELD_GET(YT921X_ACL_KEYb_SPORTS_M,
+				      aclblk->rules[i]->entries[0].key[1]) ==
+			    ports_mask)
 				return YT921X_ACL_ENT_PER_BLK * blkid + i;
 	}
 
@@ -1361,7 +1364,7 @@ yt921x_acl_commit(struct yt921x_priv *priv, unsigned int entid, u8 entsmask)
 
 static int
 yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
-	       unsigned long tag)
+	       unsigned long tag, u16 ports_mask)
 {
 	struct yt921x_acl_rule *aclrule;
 	struct yt921x_acl_blk *aclblk;
@@ -1375,7 +1378,7 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 	int res;
 	int ret;
 
-	entid = yt921x_acl_find(priv, type, tag);
+	entid = yt921x_acl_find(priv, type, tag, ports_mask);
 	if (entid == UINT_MAX)
 		return -ENOENT;
 
@@ -1550,7 +1553,7 @@ yt921x_dsa_cls_flower_del(struct dsa_switch *ds, int port,
 	int res;
 
 	mutex_lock(&priv->reg_lock);
-	res = yt921x_acl_del(priv, TC_SETUP_CLSFLOWER, cls->cookie);
+	res = yt921x_acl_del(priv, TC_SETUP_CLSFLOWER, cls->cookie, BIT(port));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
-- 
2.53.0

