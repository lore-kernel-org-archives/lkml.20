Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950739;
	b=GQdTYTs5oRPhIhwoL2pPsvSVATFVePFb1PmHg1jb4KkGdA4i61JQeEDozHids6FD9GUf
	 mgCfsnplhp8yFmS2TrwaCyChNtQcFqe4IDeZVNHops45WWfjGe9vlLj9ssKF/HsfCLJ93
	 8c2bl8O4CSuLW1JjuRStW7y7+4tjvlJhXsOZrGFVupFBTYNehOI6gxKlend9bNEwLyFN2
	 liZztOVH7fbJ8V755h1AWxF5cT/yCdvHIJWIxxgw9mslBD4g79oSAZRC9aGJFgGllRAMz
	 juOxvYp19I1HGgvYjJ6sFJrPrlQIz42B2J9ppj0cxHZAvI+fS1MJlTg/GKX0bPa+XVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8gASDMr3+aiXaCSJjYAmL3vSarYyK9/zWHfxGyG7lYc=;
	b=rC/m3wKxmAZYybqRkQ8RFkXHjPfIRaXOKL+Pd8zBjli5geQ8QG95eZXXQZznvIXzX8t4
	 mGGq/8cEcQ3AuPIRkNLAyzTx1r1iYsm0QbFml7sEMgN+FHpJkFXX1V/HUgRz6JontNvB2
	 R56Q29UnFhav5xpCtartGScN88lK0ppO7F9oL5wJenKhHUlqDV+MftEbBkekpszZNLGJs
	 ltbRTLMm1xVrewI0aOFbwT9++Opw8rJ8V1wQKs94AWvmuLqtpi4d7uVIJgxaQ/VY3ok7m
	 dB/2iEQcANXQ29JMwShm7lxCxyHhere2U1XieeJiWwuBAdgOLQeinpjLr/zT/SI4bAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaegnGB3;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFA606D808
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DFA606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaegnGB3
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so162139b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793950738; x=1794555538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gASDMr3+aiXaCSJjYAmL3vSarYyK9/zWHfxGyG7lYc=;
        b=JaegnGB3mHQIvxJOuQCfPVoM8jxNUknxlsCKaFPbBoFXH+DU7+2HgmVOpRKX6oHc35
         dhimufJT16sMmybzbin8ZTG8pC+vXMwqRTmh1KAATEa8dkhCoDGD11jFqi6Ug/kUhhgf
         zjY+o8o+wi+8lTZhaODjy7nAsEMbe0n+7T/5s6VNd6Z3vctAq3KpNG8rb+jnT7wKikqM
         h1J+/rABXM9SQc3kLzixZGcOkn8l49WOT3aYwOjY0KQ0fW7hz/84oRs3g6Z8wuxQAPhh
         cBb9gG/ALn5O9Qd6GEvPdoVBkRt1eNc+uROPEeZZ+QpltXUloEwsN9Sp3y/KFua1i0E5
         D27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950738; x=1794555538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8gASDMr3+aiXaCSJjYAmL3vSarYyK9/zWHfxGyG7lYc=;
        b=RgOw0UM6hcFkDdy4N0dubpQI7eBkSQRmSAAyz4o6INpZ69t2C5FQxXPr19QzsuL1jT
         3VDZ2pBAAViVsw3hFL2eqNeEtTInbX1uNIRg/fwEwHfi8QMqcPMvBnvDKxARVxMhQri7
         skyD+9JD4qYE69+Pc7Sn1ImEpQbLMvRmEZEmxkri22YtiqdkdtmHveMWbyJB99+iUU7b
         QkaMkXKnyOsqJU4aK2kXndFsIAwd/SYMBzlYuIMAZIJ8avaM+Cbp6tBxJgwZGO3L3yK3
         HBfVx1xLWyrwiR9mnGhPy8BowkGLRGTDotkQMS6/aI2vX9FZ0l0ywsCk4/FxvDvZtpsh
         /5iw==
X-Forwarded-Encrypted: i=1; AKwUvBw8lsKXIx2NGxhFaEU6H3W7xF+9BGHxz5lKw4u4iG8+JnMd+hfvCO0HOq62ZWZXF8iTPhomZHnqPl0L7e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AtVQxKFi0ZnYCJfxlXEXyORlPtRzhvpj3o5hceGGwVoiihy+9
	MrieAVKhCyNrYpke3R8w6Q8X9VlM+2CZVtXBkCz/aLrgqPRZsnuHdtTV
X-Gm-Gg: AYBFou0IAybo4IlbZKUnAjKeLqh/Y475lAKveec2/wP77ZbqhOcmXCReRvrKyQMhAhZ
	RHGXv8S/8iyJpOrxIBufCM+RLq8hy/iYqxp34QHUmpa37gqbbaeQQVdVOssvXDAoWMm5QvX0GPZ
	PzzXBhJEz3cn9mSFZKitrtSc0rjwH1oHhmt0Jt1iqQ5ZBtjL7kPiJJX5tlC5J1JpGXQghUm3RBp
	W9qRwSokDV/f+zsWSfB6q1CB4uZfN+Eo0pD0o2QcTAlV25aRbdpE5BHyo2eR+cQamBjwLMyYXfj
	QdkYNd0R+tETmw+vjQrxV0XaX71OWwqnOvfg9sRCxwIl2o1vnzgmAcfkv9Cz2qCz0h/SGC3lyCZ
	/yaMjZgDRElMzo/ZkRxA95+7+OVnBt13fmUSgZta+ZBrdqAl7OuvFhWiaC7QMkuu/XFVpwhF4Zc
	f18BDkaQfAn5xXiQGfJdTpA78rnNuLr1Q6JV0EdiZbM5+sJoDas+aLQ8EUsUi63pe2Nj+xWWjyh
	mZ16LpNAOEDzhaggBXFCqk2gptSFz5t4CfztV+0I6Zy/HbLG0EQST9mPpURB2Mw4jJTbHx8luMs
	+//GWgYDwfkKrEamqtLJN9fCERO61bh3nYZMCAvyNvTuQkSXTW//
X-Received: by 2002:a05:6a00:4b13:b0:88d:3f61:20f3 with SMTP id d2e1a72fcca58-8b37c531bd4mr1401050b3a.54.1793950737992;
        Thu, 05 Nov 2026 23:38:57 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597efd53sm373484b3a.23.2026.11.05.23.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:38:57 -0800 (PST)
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
Subject: [PATCH net v3 3/3] net: dsa: motorcomm: Delete the ACL rule of the port being unbound
Date: Fri,  6 Nov 2026 15:38:02 +0800
Message-ID: <20261106073806.112122-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106073806.112122-1-mmyangfl@gmail.com>
References: <20261106073806.112122-1-mmyangfl@gmail.com>
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
index 5c82719e461f..6192aa9f05be 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1228,7 +1228,7 @@ static u16 yt921x_acl_activated_ports(const struct yt921x_priv *priv)
 
 static unsigned int
 yt921x_acl_find(const struct yt921x_priv *priv, enum tc_setup_type type,
-		unsigned long tag)
+		unsigned long tag, u16 ports_mask)
 {
 	for (unsigned int blkid = 0; blkid < YT921X_ACL_BLK_NUM; blkid++) {
 		const struct yt921x_acl_blk *aclblk = priv->acl_blks[blkid];
@@ -1238,7 +1238,10 @@ yt921x_acl_find(const struct yt921x_priv *priv, enum tc_setup_type type,
 
 		for (unsigned int i = 0; i < YT921X_ACL_ENT_PER_BLK; i++)
 			if (aclblk->rules[i] && aclblk->rules[i]->tag == tag &&
-			    aclblk->rules[i]->type == type)
+			    aclblk->rules[i]->type == type &&
+			    FIELD_GET(YT921X_ACL_KEYb_SPORTS_M,
+				      aclblk->rules[i]->entries[0].key[1]) ==
+			    ports_mask)
 				return YT921X_ACL_ENT_PER_BLK * blkid + i;
 	}
 
@@ -1366,7 +1369,7 @@ yt921x_acl_commit(struct yt921x_priv *priv, unsigned int entid, u8 entsmask)
 
 static int
 yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
-	       unsigned long tag)
+	       unsigned long tag, u16 ports_mask)
 {
 	struct yt921x_acl_rule *aclrule;
 	struct yt921x_acl_blk *aclblk;
@@ -1380,7 +1383,7 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 	int res;
 	int ret;
 
-	entid = yt921x_acl_find(priv, type, tag);
+	entid = yt921x_acl_find(priv, type, tag, ports_mask);
 	if (entid == UINT_MAX)
 		return -ENOENT;
 
@@ -1555,7 +1558,7 @@ yt921x_dsa_cls_flower_del(struct dsa_switch *ds, int port,
 	int res;
 
 	mutex_lock(&priv->reg_lock);
-	res = yt921x_acl_del(priv, TC_SETUP_CLSFLOWER, cls->cookie);
+	res = yt921x_acl_del(priv, TC_SETUP_CLSFLOWER, cls->cookie, BIT(port));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
-- 
2.53.0

