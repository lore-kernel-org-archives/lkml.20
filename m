Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558756;
	b=KXwiXDPzc5IqFVJc9U8U6a2U1FyOXn/YwM1bhZ5FiKpkNzAfap7tzIxel8wrYrfq8/6x
	 EzA0I3Ti41fNndsKp+uZMWoiiBlpZb19eB30vqKCqFFCBkbnVcrWvh9xhqtT0Y2n0rbue
	 fSFudZiOYd8pmn5EUb2Uuqb0PpgQiH1oV9GloHFAV6OBiEcPFFoSl2AZRyk97B9XjDZCJ
	 0c8HLV9cHyjdt6V05ButELJAuPivK5eMZ0bv95t7nLZwwMt7ngUQ7I/nVcZ7CtfO1gaNm
	 YReILM56+vtCdrJTvtOWH7+GiYD+FEIcHkdoEnGgM2TTj/dp/tup4dAS9HmvZa2PnDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kGNdHjEa4vRNWwuyZwToyKUED19fBzxo8nKXU+sdJBU=;
	b=zlXYPgBCiHsJ/SgQCV9WpckAc3OV0IVFFSsHrzgPKAXoLs5DQ1fTBwd08LZXa7PhUA5F
	 htcGJ9PmuItjgdoxcU1pjVrDLlx9RcgY/wzHgm8cflz/AjEja8y7yXPA44lIyzKFj4VK7
	 POr2OZ1AMKEmQP4F3osZ/roClQuBHT0XLu3ynxKf7b3gzKaEMrGD92BcSILh2fXsPzJMp
	 wYoXa77OlyRLv1DCESS2D+8YKuvuOmERhpv5+Y0zDgrz3nJ/xx2u3gGL2TYrVBWegDm7s
	 +fmaX3tJ3ka5CxcYlB5RARzjQvfpQSwYs14KTv6WAPe5xFQm5WI5yYyCvs+suoOf9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G1YzsQwR;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1856F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1856F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G1YzsQwR
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e98798cbddso1428485ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792558755; x=1793163555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGNdHjEa4vRNWwuyZwToyKUED19fBzxo8nKXU+sdJBU=;
        b=G1YzsQwRcj2dAThCInl/b1U1xXwHSBgdUOLik6J/MxL1gHWp0lIXX8nvppqRum4FBz
         /ghmu4nRKCAnDSZJ+eR4JoWk+D4KN5la7SBdoiz44GXFsBHC5gbMisSiK6Mhh+HKkJF7
         RBKazmQWyehkcXUPItTT2h0vBxp9o++wq2Pr6SNogBw27gRCxLjtHyUtxyfhAZDmDf8a
         1kIrAC21jt/u2y3XyLju6FIVZUdcVNlZzgINVsLMie4DNbdbptwP+xdUlyPkH6wYHASY
         Q0Eox1O20ghiehe8viHL90lIpkcvvu4sCXSlcw7OAWJczt3PLrPB69wZwjl32DEX7ymc
         CxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558755; x=1793163555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGNdHjEa4vRNWwuyZwToyKUED19fBzxo8nKXU+sdJBU=;
        b=NzG3S+dnKAEUPIona8q/IsdLj5VFjSAuHzWUwnHuTPIDWTPx3Fkrp2iV1ui9mK8EFh
         VkrVRswpGHL4aDnHmGHH8Pp8p/Aa+YOQwOnV0Xu0KSWQAjs5sjc7OMXtCAl33+qYAf0b
         ODdxO7h28hM41MTw3s7NQJ9MNoK9LzwC57MG/vRG/LquwEsOC6tpYRSW/wxYXgVVhAPk
         KPfQEVp36sVEypM/xtwQXojvoLKw5FozhMNk4MWZfGq5LOjZCk6e8NxgbIpY7rT/YEbY
         0GQ+TdXCpOt9GCujuB5CRbriXy95udM7PeSGIAOIP/RCTudOQTbb74Cse0KabZ7YG2kr
         Bt7A==
X-Forwarded-Encrypted: i=1; AKwUvBwdBxSqlEZlnrSWEFwF5JcWp1bFw4Z4qwY0TktXbcoEpTW5p8sfLVfLoELNIqXieGnErgBxBpwKgjIwSlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIryV/pbZ64IoH9GORa1FZFj3HH0hoVjzCqcSUnTZHRbFXCBE8u
	jQ4vwtcHYwkumeLI5iFoiw7h0JaWlHVT4wehSKkrjwZMF148wDVtWxCI
X-Gm-Gg: AYBFou1vgPwtOMVzzk95NmiTZvC4dfqSzz3rr7DS11VQCORcrL0qmr3Oy21Op07Lzbk
	6rh3p3qBJ2TtbtXsxWVz+PlvKwELioZOTO/4adSnT8s6X20feAw3foJVsKBfokOFVdhej+ImKgR
	H58NFssW/OUoV4vdrxoCQ7DyiCwYVIdsXFXSLZ6SwdbjcyYyFKVbXcoiOLVGJG5UWi/WOLJTA9t
	5cxF12NbCxmYHI9rVIlJgh3xkghRB+GbHCB1A/ytYsmXYMahk71c/A1uyEXNcThVUtlwZlLnYog
	+slg3sXLkj60xgSoKUrjqO8Wk8cnT7vCEEUIPkbkQ7RHHUWUWuF0aF0VLedpp7IElRAoi8mUCKv
	DG2U+YfRBT5Nj7S+r5ynJL4yu2938Z2P/nZeQxeb/T82Iwqv4o+RXIiATTpAbAlhdoMu6wGEhkf
	FQ/wD/M4DFoRSmn61F0IPCvIZfkhCIlhxeodcnsYrYDKOlwlYfAm+Ry6V5VVY2eoNfYQi48D+HG
	R/p+3Z6h48kwMkfTNsElF8nq/PdP0HpRlh1bCKp3IowQvIxOm+RoY54TO+A0JFVKcjzosm7uK3C
	O64cRbJHJJoq8itk3zPiGQ2zMoLD/TshWCSu6ee/7X/pPLu+EQi1C3mDcIXYFB9QIPdetFA=
X-Received: by 2002:a17:90a:d883:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ad86cc2074mr805091a91.53.1792558755404;
        Tue, 20 Oct 2026 21:59:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a871dbb9sm313903a12.24.2026.10.20.21.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:59:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/2] leds: lm3532: Avoid duplicate error messages
Date: Wed, 21 Oct 2026 11:58:32 +0700
Message-ID: <20261021045832.16356-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021045832.16356-1-phucduc.bui@gmail.com>
References: <20261021045832.16356-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Most error paths in lm3532_parse_node() already log errors. Remove
the redundant error message from lm3532_probe() to avoid duplicate
logs.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1 : 
https://lore.kernel.org/all/20261007104915.507801-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20261009091059.25729-1-phucduc.bui@gmail.com/

Changes in v3:
 - Remove the error message for devm_add_action() failures.

 drivers/leds/leds-lm3532.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index a3bc9680dc4c..a050e4350bdb 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -708,10 +708,8 @@ static int lm3532_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, drvdata);
 
 	ret = lm3532_parse_node(drvdata);
-	if (ret) {
-		dev_err(&client->dev, "Failed to parse node\n");
+	if (ret)
 		return ret;
-	}
 
 	return ret;
 }
-- 
2.43.0

