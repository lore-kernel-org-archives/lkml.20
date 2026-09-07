Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29F375F6C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793323; cv=none; b=LWP5affr2clwAmJiSvBg8q2ykg+I/+oG7nMfQOclnezLOLZpcP/n7u6JuDzJVMViqopkZSDYb50+3/jJO1XQADkKDbo+vg72WrUXgU4k6GU0w8H4aBGdhL/Clf6zqq1+NHmcFuLBtQlk1Y1w3lrvxHarzrbO/2pLo1yvb/nINyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793323; c=relaxed/simple;
	bh=/Lj1bzOltbe0TShD0ZkZdsIYxLxj5M1uJ4RcZYV70+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFv2KIHIOt8DzZDgba45iYu0nr8dFv4XtNsr6qEHWaESZFFkV4DStEmvs2OjDnqfhVUG3bM5lgP925QWMcTgvJD1+D4hqbE2uHRK7A3L16DVi76H8Ck6RNI84oVQCQ6cDjPotsaIizI4Oy33h44QXvx4BjK9AI4GjVusEIsME8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=aXZHTEed; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="aXZHTEed"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b965570d7so43257305e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788793320; x=1789398120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELIdnmZ186QZy3GeHErz5sisEfjYu32lHLlVPnyugFw=;
        b=aXZHTEed04Re1d8cB2ZCRcY75cIJ6nlxnqHHtxOoP7em1W6t8+cVAkx4ejrEn9KXee
         jk2tkHOzbjyo1pjAeQv6gzlpBRst41UEsFonCcooRZ4YRy7mpazaTvv4HGfwCTY/fDh/
         dNvW02SaYxQmlH9P5pE1Sepk3p19YlSYdiIRBhS/tbXPnXfXZFH9kMC8TAzqJ00pSB4Y
         gGcytUzWkNNrYl5aQseY59hGmwhNWpJGUC5j773LqCiF4568Y7P8NKAv6WauvWxkJyu/
         nwaGxPtr4G+PPoCX/C874FuoKqLw2cSii30uh+l261tD/wy3zeRna/jM23SF89UenG2K
         k2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793320; x=1789398120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELIdnmZ186QZy3GeHErz5sisEfjYu32lHLlVPnyugFw=;
        b=QTg10egwS16pV0414vceQ6YVKrfVvNnO1kKSV1WyVlqj+ThgXlfxKZJWxeY4bD/jL1
         MxwR3+IPng9+vxoVgsH5I7Oee5SHkz4DsFmEaCj6QrjrJC28fF8QHXpUw4PllMrqXTMQ
         n6yrjCgT1juOupoEPyttW8RXJpTdZHA9fjtTAjnUgAyAGhvcMCzVG0kXTh6dLe2KGfdt
         47pwhzpkEqY8ITJNDRsC0s2L6tXhrWb8BaE+enMrX9F4UI0QdhdL0Xz4SAELq3GhZXFO
         1vL6ahmLHFfR1S5f9PKbzAfUWm748pIYx2UU64sGosHRuXQP6h+Y0PU/hdBx9ymFvheW
         QtvQ==
X-Forwarded-Encrypted: i=1; AKwUvByJPhO+jWPQ+L8aDVexjsd+jMN1sxlDQOaRFAoJC/Gv0Z8lhu4yzR2HNhLWzvqyFSdG2teJcU345z0v6KI=@vger.kernel.org
X-Gm-Message-State: AFuF++mr4rvuFFZ2BdTsxkaQENjG7sd2pPDeHR2wTxkUeN0NEHHt1pUV
	g9Py51z4yqfz6C+amobct+sMyS6K5D5nAfrqgMsFTjhRcPA+dpySJG48WVkLj6Jw/oE=
X-Gm-Gg: AYBFou1vClufjDuHgd78AFDTxlSyqjLLNbaaEo/K1SkSzzTHgTdOswax5K4BZiq5+5y
	7Z0sVOY8rZeNW1PmdFEyqJJd63a/Q7AP6dme4QbyG9nyCx9IU/jwplTJYqMiGxEfhtKYl4ss5Y8
	CS+pD5JTJs5FaPm8iYD86jM/DELb590JPnygRilpuUs7q02Y1HIt2UEr/tvr1OeA+pdTPfVv97b
	PPYd27MKEsKKbFnnclpo7SuD13YkNDcO4DOo26lC1yQKZvjoYca9UAmetZpbi7rkbZRlOmWrgEo
	3mdOzl4JmXBVhM/2K1PIfrgR+cNygQKPIEaH/9GiIHQyvkk62jvxFhmjz/Z05lY1O3yMH4S7iIu
	SWLw5KP2Yd44STT+dPEr/X823wvZiZjAGGpXHDrwNpVU7Y5hjXA8hq5YsIcciROhhFLba5A1kLy
	FMza9tNeSqw4tWcMZ3zBJYbZ8MIejdi5MNE1aBsS+7UP5LwSSCLje/azuO8NiwCb4KkNvUzoH7y
	Ae4yyU6X3QU6CQp5wn+UVkxaffAXYOKj5TQ06bX
X-Received: by 2002:a05:600c:34c9:b0:49c:f729:d757 with SMTP id 5b1f17b1804b1-49cf824f757mr233492835e9.11.1788793320085;
        Mon, 07 Sep 2026 08:02:00 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm262992705e9.14.2026.09.07.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:01:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 07 Sep 2026 19:01:44 +0400
Subject: [PATCH 4/5] power: supply: bq257xx: Use psy directly instead of
 driver data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bq257xx-init-v1-4-1a08b29e1a68@flipper.net>
References: <20260907-bq257xx-init-v1-0-1a08b29e1a68@flipper.net>
In-Reply-To: <20260907-bq257xx-init-v1-0-1a08b29e1a68@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=alchark@flipper.net;
 h=from:subject:message-id; bh=/Lj1bzOltbe0TShD0ZkZdsIYxLxj5M1uJ4RcZYV70+g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNu3jn2Nc7fM5/J89eXTJh/uQb3y6U1bstmyLNc6lAv
 CvPokRuasdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTXfaD4X/Otd6I3cs03FpXnbFWctA30jhQUXXT8bPfLdNHbLnJPjMY/kfXpvV
 pTfGojKh8YyLU0MB7O/nlPAW7rQaHbtr6Mq/yZQYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Improve consistency in the bq257xx_external_power_changed() function by
using the psy pointer directly instead of dereferencing the driver data.
This makes all power_supply_*() calls follow the same pattern instead of
power_supply_am_i_supplied() standing out for no reason.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/bq257xx_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq257xx_charger.c b/drivers/power/supply/bq257xx_charger.c
index 355c59f0bbfb..8a645859460b 100644
--- a/drivers/power/supply/bq257xx_charger.c
+++ b/drivers/power/supply/bq257xx_charger.c
@@ -1057,7 +1057,7 @@ static void bq257xx_external_power_changed(struct power_supply *psy)
 	if (ret)
 		return;
 
-	pdata->supplied = power_supply_am_i_supplied(pdata->charger);
+	pdata->supplied = power_supply_am_i_supplied(psy);
 	if (pdata->supplied < 0)
 		return;
 

-- 
2.54.0

