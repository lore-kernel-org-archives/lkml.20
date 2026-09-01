Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0743B059D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226178; cv=none; b=IiKyzn/6STTsX8QPaUmM0L7p4phL67qeAb16P6XKbod5LAqp4V4FrWbQS2WZXBH2VAl5XP3K5A2c65dA9vZNSExGiPQh0I/yWkC9S3KUI+/13DQgFbKonbdet0NVUHdswDJpYXz5tiN9l/bZF5C80MSh6GtcHofCJsBRXoD5tlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226178; c=relaxed/simple;
	bh=c8pB9/79+XYKtscBDwUyoyHe2iFW4MM6dHj/rUuEFC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMoEqDib8Dyo1YlY7eLfHbK3RfoD8LM1254JQSjnoPXAdnFlrH7421SfC+/Ts0QP5fQPg2QU/f+I+rDKP1vDQcaXm0naJHT2Q7hoH0ZahtQVGWv3A++dQk5OamQUPZKBYWHlWzUCu4gNEcna15v0+hwVRu5AF5k4IS+3Aij12qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=WXPPZu7o; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="WXPPZu7o"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso5613255ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226173; x=1788830973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrWkqhCDRL28YaDgCKIDr3MwV/ILAwu/h+TdmEyaV8I=;
        b=WXPPZu7o2wmRtOgs3QOhDknZVd2upvzNq/O+SARoPASim1et1fOhCVJDcsVQGu/eRv
         otUaNKFMbCfi7pGQpFyUw4vqBGDJfHovt/Lu6/el35tiuZlQdiaKY9jQbULyYu89YZib
         fINsCkbLpYczcLct9RtCkRgA7UbCvpfal700b+eKKA8bVJUg+L9U2PLPdwVuGFuW70Cr
         5FVjBgZv2g1f2vJZ0KuywvX1EFlrhQmRX7dl07Yvo++82LCAyKl8fIzGxvyM5yVmcHYA
         h3X3KZ8tLOedCNfyylitdPLLwWbvM9/91T6mnWm9xwEtdAAXltW1HhDh8HPjPDu8w41s
         29+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226173; x=1788830973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrWkqhCDRL28YaDgCKIDr3MwV/ILAwu/h+TdmEyaV8I=;
        b=PB8XAS7Ygiree3sqmk2ejWt8N6pie8c4EboJ7bBhAR2vdKOJosnK348VcpBOY5D9ad
         6M3/ieBZHikZ0P9Nncjqh8uUKRjn5zJ6Ztfa2RdUBRgBYVQ5Y8EaiGdxmBBaUuPNX4Er
         pYV/dpGLy+TvzkSPgXi+9KmnjhndgRDxgZQh97ebXKyz/To69xjBIqSqmW4AsIOsydmJ
         AhnvcVNmyfCWQlA8dE1XIa8fMh13AdBru+UTLwe15FnUK1NgdZdqPpGqbKvWUoiulBGi
         M4o14MTJ3ApDBGZQ+eDv/nhz4P8WC+Ng3IH3ZqpJV1Vs1k92HJpC8ucXQXJ039D4O0PW
         O+ig==
X-Forwarded-Encrypted: i=1; AKwUvByxZXAJXC9XIyaVedauMXB+NVxGak7scpaYXn6Vbx67P55uwKKluVLvjnJGVC3EZHUjlhTxwlTIw7y7GNA=@vger.kernel.org
X-Gm-Message-State: AFuF++m0yJHZTBxN523OmUAkFaPHdfasEzPo/T+F0qoo/RPuUdy2Xu73
	4swoR0SWJ8liVgyHtV75mLuZ3IBr7Z2j15pjWebE+4XzeYW+ND4r0KjpFUXN4o4m59k=
X-Gm-Gg: AYBFou0X8tR+v+1Az9+mQmd4eUNtm58vNSA5jQ+2T3asPn32v0cgxh0yF64Yk8YdhIo
	kU8W+5bNk51zvmZ8B1nuyMZUIJH6dhnj2CR1J+RdnZKnseu9EbuFGqqfJ8MpjRv+r+umoiIwPk7
	mfChh0yGRwnJOWY87nGz6ojXfFcGNI9Nq+Po7PK6Ud/4UQeRyDVi9g9cIIaRkZLRxWbgVZuvoxG
	vZYiwvjiF6ABWnydf1QGtx1o3bY2gw9MIpZ7ZyLP6TwU5OUDttfOd3HKioXpe5CTRqlpMhrAeg5
	1XVn9pKuOHS8Y9S0Jude7z+AhhH2VOM0g6efn9gWs0VeFFOfEodn8g259GTzwqzVDgi9Z5gSb2b
	2baL1UYqrtgdxN14IHmtbTeYAnMX1lPMPg+AFLdBUprDofGdpzh7O+hfAL9Wtms1IPWrCsKeOKZ
	JD/W53ijQrAn2FZKn18yG5IOgvEbrnqEYsrdL8y7vskqS3fdSZ5lYP7BBZWL4UC2E=
X-Received: by 2002:a17:902:e747:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2d952687ef9mr19828275ad.2.1788226172799;
        Mon, 31 Aug 2026 18:29:32 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:32 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:25 -0700
Subject: [PATCH v7 07/10] of/overlay: don't create "//" paths for fragments
 targeting the root
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-7-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=1298;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=c8pB9/79+XYKtscBDwUyoyHe2iFW4MM6dHj/rUuEFC0=;
 b=CHdKOdNJTmjOFM1h9ye84tTbvlftg2IuaS9THOiluVGc7bm3lAnxJj4PH6CAymm5OmpoAaLA/
 7/D10xxlD9IB7kReP5j9yNWsuTFHV/R54It6ZncwaDyjUnbbXWH6G7B
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() rewrites a symbol value by replacing its
"/fragment/__overlay__" prefix with the fragment's target path. When
the fragment targets the root node the target path is "/" and the
result starts with "//", which __of_find_node_by_full_path() cannot
resolve: symbols pointing into such fragments silently stop
resolving.

Drop the target path when it is the root and the tail is non-empty. A
value naming the fragment root itself (empty tail) keeps the "/".

Fixes: d1651b03c2df ("of: overlay: add overlay symbols to live device tree")
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 51241f16e87b..6f2d7872028a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -256,6 +256,9 @@ static struct property *dup_and_fixup_symbol_prop(
 	if (!target_path)
 		return NULL;
 	target_path_len = strlen(target_path);
+	/* a root target renders as "/"; drop it to avoid "//" results */
+	if (target_path_len == 1 && target_path[0] == '/' && path_tail_len)
+		target_path_len = 0;
 
 	new_prop = kzalloc_obj(*new_prop);
 	if (!new_prop)

-- 
2.54.0

