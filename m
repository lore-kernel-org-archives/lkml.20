Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C344E7807
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019867; cv=none; b=JaQoMjtJ2oeM3EfBz7vUfr1lHyRqW49O8hKobevk5u/W+Mn1oreJRht7NEMWLiFljt5zKv24KgMb0hCeQBdEq95KwKUDaXTDnt4UY4y/QPmGRGds9zbWajk+plKTq0ZhZ++RvrJNhDuNyhXBFKR2Y46PPo0slx3p8pkhrHTR/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019867; c=relaxed/simple;
	bh=oREsv4Dobxi+xg/AO/mVrGbJ4b7yLR1dTkzD83jWLg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+ZfaOf3WLQ7KTsp6eOeemko6KestZEhjK3mIzzeWDMwnfoEs9XGf79rI6+HwMApWpgy/rt2hKrNsE9p+tLG5Do+4HT9MWJ3FteTqNfkyG6q18gRwFNA3KkQquAQhAfJRVCEv7C5mLrFArfkWOrUPdAe0AxdiGzakOzXYdBgxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Ie87p4pr; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Ie87p4pr"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so10844397eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792019860; x=1792624660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P77DSLmjf9BNg1qoDutUFotzQwzSnuHY1f4sq3P65HY=;
        b=Ie87p4pr4SjwkQYN90QvaFZKXVSD2LXUX0w1p3EYDqPEDCmnUETB4Eb/n8nNUzxnxh
         TbNqCLhtvCXhwr4VB2H/lGYn1+iO8BNlgDvzuwJ96B09TRX4qyEgBSTFRYDXF3+z/ANi
         6nE62e0YK+L2ZhcC7Rzd8utlxVQFQ3UH0d+zyklqMq1R3gQ+nXBt00hBRwwviBXF80+T
         7E+P5qHA8DmLobK6wU5dMSkAo/wTs2zdb9HOGkATHBvQjuzv0aXEWhUEmZW6s8rfn55F
         QtzPw2FVRL9nQLwi753GctkS0XGh6N1Es0XJqoE+xZVqd0stwn2CIIzl7JyPeSdKiwoW
         ULuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792019860; x=1792624660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P77DSLmjf9BNg1qoDutUFotzQwzSnuHY1f4sq3P65HY=;
        b=SJdI0L9M/nxllb0FlJJPaaZ3F7glgkHtEzCcQfNYhVOw0qGls8HUxq9txUtZsQdi/n
         3xZ8WFQqzlfUbMZMTy/CTwUV04vHbs/YoCnoRFkp7qK40tXg3DNefqHJJI53wLXU8adS
         qcvyCySJORxOsQ2UyPJZzD1jHHMyha+6yhMhamyqtVhzJNGImGOr499qb0IZT2HCdJqN
         TCxGCRb3vNQCReLiVJTGhRFbHml4F2LCcUXDBd27yKZR/tST6EA38M/efcps8PQVzY0Y
         cubQWuXRGGV8K77IoKqPsnS5PRc+Fd9h8l0wSq507HwMtMSlL0L3rXtK5GQ+swJ4C/8+
         ZtmA==
X-Forwarded-Encrypted: i=1; AKwUvBwSJsnwXOxW7A+rytaFcDzIKHWpmh+W+KOpPQhZbT0QjebOKE6WZ6WHSpkEWIXzkZnRAOdoLuiaZpcTHPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl9K54QuEG2CKroLt9DAFUxOHoiLSucA6Q6ErlWIc/nbo0wRVs
	hGZsprtWTeFjd3yvYXqW8P2BxyY6+H0vxCFdfX+ofX9L014RuMrP300Tpq2RBmvTedo=
X-Gm-Gg: AYBFou3fgqtQK4VJIUgFWycJ4btDKdmr1wxlW8aUIiUpDAoqZfdjrzrdEzcVrydKpnY
	boxIk4JKWJmd72jZaRxaADP34s7th1wir3e0XgQ0sTayDADQOH5ZFIkgqIlARlMWGWdhUX4ueHW
	m5tKAB2mMf3F0fmcWxUkI2SD0ULYjpsmrBSAG6lD8yxaYptGXJUuu/Owh5p5hL+m7goISf2ikYz
	RMGrNDGuCmJ/posjxT7Dos7+oTX73RDE/sXHrRGcy31gjpe5ETqoeVDdV7EfxmYz+UJLF9oo2sz
	Ar6ero80kfz2ZaYduO2mh4sPVDQr5UxeOYgECJzn3WlfDr/eBThwCyQkPMIjLh0qts7JyxCQ1iq
	1nmzPeyAhTsp6lhiBM7CR5j9ah/TXafPPL1/v7rjK2Sie4hWHgOAAIxL2SerPWLao1ZN+pvpO/u
	etv2PMvY1SOnb8CjxImYIN40nfX50ZhuveWPOujS4ds3AMaDIlf2KLeBphC4kIz+az2USmLAI3f
	w==
X-Received: by 2002:a05:7301:541a:b0:351:4564:19d3 with SMTP id 5a478bee46e88-3537e107c45mr26450463eec.27.1792019858967;
        Wed, 14 Oct 2026 16:17:38 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10678679eec.25.2026.10.14.16.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:17:38 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:17:30 -0700
Subject: [PATCH v8 5/6] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nh-of-alias-overlay-v8-5-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792019849; l=2318;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=oREsv4Dobxi+xg/AO/mVrGbJ4b7yLR1dTkzD83jWLg4=;
 b=e6sQEp+anjbcrT9Pk7Tfdh3nZZfrS7ZW/a8fr+8E9pHhQEUbjYI8cppSv+r6bDAeifl55fRmu
 2Bdx9cCjq2CCER+3msUZQ8UW0Y5j6AQovdlkPOJSJvg4YC7LdcGEV4s
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

An /aliases property added by an overlay references labeled nodes as
"&label", which dtc renders as an overlay-internal path such as
"/fragment@1/__overlay__/i2c@40000". The value is copied verbatim
into the live tree, of_find_node_by_path() cannot resolve it, and
of_alias_get_id() keeps returning -ENODEV.

/__symbols__ values follow the same convention and are already
rewritten by dup_and_fixup_symbol_prop(). Use it for properties of
the /aliases node too:

  - a value that resolves inside one of the overlay's fragments is
    stored rewritten to the live-tree path
  - -ENODEV (legacy string aliases, absolute live-tree paths) is
    copied verbatim, as before this series
  - -EINVAL (not a NUL-terminated string) is copied verbatim with a
    warning; consumers validate before dereferencing, and an overlay
    that applied before this series keeps applying
  - only -ENOMEM fails the apply

Pseudo-properties are exempt: the is_pseudo_property() check at the
top of add_changeset_property() only covers live-tree targets, and a
phandle of a newly created /aliases node is a cell, not a string.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index bc0c879dd807..2af9ffb08691 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -370,6 +370,19 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
 		if (IS_ERR(new_prop))
 			return PTR_ERR(new_prop);
+	} else if (!is_pseudo_property(overlay_prop->name) &&
+		   of_node_is_aliases(target->np)) {
+		/* rewrite overlay-internal alias values to live-tree paths */
+		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		if (new_prop == ERR_PTR(-ENOMEM))
+			return -ENOMEM;
+		if (IS_ERR(new_prop)) {
+			if (new_prop == ERR_PTR(-EINVAL))
+				pr_warn("%pOF/%s is not a valid string; alias will be inert\n",
+					target->np, overlay_prop->name);
+			/* not overlay-internal: copy verbatim, consumers validate */
+			new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
+		}
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

