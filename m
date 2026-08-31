Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552A4B26F1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191655; cv=none; b=lLEguL3/pspZRXm8kK23spAvLrm5nMsUXVuNFqGXU2TqnZKAy/soGEatno+bNseU6rO0GtPxyrkFth8lwO9uxWJqSs7AoncRePjdNDp6pqL05AAaBSQWcVKTlyo4V+PE0ay3KoTtu309CnKW7wP5U+zs2si9at8fR10dXpMAJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191655; c=relaxed/simple;
	bh=om3QiWY1bTxRKmG/KBVTXUqJ0HDBqwKhfhK+NItOh7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3ImyfuZNJKvNnuVJnLf6yTkvMoXu2NGnqJC6yk3Mlce4n/fYkNVjJMnRaiRjxD9mBQ3Xvbx+yCk1uvAbgkjG0UZOkoc38toFjwT8xTBz1Q4g9lHGUVh3QguCcu3LMKjO0+LoOaZUq+q0J4CxKeEbl7pvjkgDS0LLIfK+5RSDHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ4I1VKr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ4I1VKr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-484374f54d0so1012383f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191652; x=1788796452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpSbNGtSqoQ6lDNF7R+qXd/5b5Ix3q2rK7Y9Mk6hanQ=;
        b=XQ4I1VKr9QUsOGESojUAKw/N3A+sq9oiZ4RquSt2X5UerYtr3Hw8B9A02GmFmHBVHs
         ok6n3uVUTnKU2qpHvgAoOsGN94EMKMaBjHZTF/oiuJJrgSdU42dfRHa/beXwKiYz1PaH
         s6S7IEVBxt17g7pYXJ+YDjLju1FIEx2O3IWajTYWQ7L6oY65I0Vz+rND54/fGR3Fs5b6
         3c9E7RlBbMEYOvk8UW8l9m7+vRAh4yEQLYMysGh3vDQwNtiv6c61PcisALdh5iSJJGde
         cz3iDfyi6NqCZ18UWT/r5bkYeTMIPBUkeK1JvbuCZh0dkHePJT1caOdTXrF/wpnNYIht
         J0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191652; x=1788796452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpSbNGtSqoQ6lDNF7R+qXd/5b5Ix3q2rK7Y9Mk6hanQ=;
        b=ISaBU68LLMpJI5kAC2t/V1JAePxw5mXJq3gHFr3OK021yKo1m9wZVHKiyAE6Wew4OU
         SpKMprmWxh955VXtR5BQSirU6L+HFvnhB0Pm7mKKHINNOTe2Sy//H/GPINXc8TIhJ6FF
         aXm0aSenE+pf74JtE3+W6VmRJYhcWYncU9rHXUvoqKAe6lC6BgOlBKi3K8WlVQNsirdW
         Fprvh6QgDQ2rs215HmHTSPi2ynBIYKBIiqhqXnZh8Iq/rprfH7AhpzKXYuqC6gsYge3q
         oOmlQvwgN+39lwJoM60kRi6RWzsEhD8UOhkVM8n4oqNhO1jknTc6651IOm38/EXkNoYt
         8S4A==
X-Forwarded-Encrypted: i=1; AKwUvBzN9wQv/9MNN9sPX2eHpHX/gJFHB0/+AgSptNlr4b3K3LH6sG2gg7/bLB69v2UNxFURbdyccizKP1B68jE=@vger.kernel.org
X-Gm-Message-State: AFuF++nCjpV4WVZPOccgvOIPiWInrrF8lvHSaJ7B+MJhznBv/XHldZOu
	qKe6VvW/q4+SVpPP2HycYieDKz0F9H7L/GLzVV773UwICPjtnwwV8kfA
X-Gm-Gg: AYBFou1TQLLnrbaxz/JDPJYpRT3O1i5ykEo2KOhQ7flWGUZxrFLi7dZtpjoTL9U5AFv
	zo8YoEYT6wwbSCF21wiIOJKZd2MeBSTqBDT30SH6BlG2E+Uke4Slzmm3V5x04j+EwBvHY76Ylje
	6TQWI37LT3a3s65LE/AYGjlnHX78Wuyuxdz0prgvoqdQp6kCC8sn76Wfc+NDK6HDQgx9F5gU8uC
	p1epb2+eymIuuNi+AWUyP6SX7Jt3FeN6XKbnGpr+ySMUXVp+1tCivLydesX6tgISyv6HVv4qzVT
	sp3aGoNhOZNwyBg5sujW1eZb6afqrXNnRu8s6dOSgUDu8mkZLOQaFR25Fes39ZndTGjMT89y21M
	y17hjtd3C0j9I7SCKpZ4GgPRxR/kke+HWVjf0OiGL6yGzNWgh3V+XiqqpLK+2pHLZUnCuC+DNus
	wl7QF3lFeKhLIDFp5XkO1Fl1RIa5SO4evo9h+0oW4WcIi5PaXrNf127oVsQ/LRqjPvTE37Yedwj
	kM+0kuuCkleuYd58WNzY9ZgOirBWuAzcwc=
X-Received: by 2002:a5d:464d:0:b0:484:3310:7110 with SMTP id ffacd0b85a97d-4844103d18cmr2807354f8f.28.1788191652336;
        Mon, 31 Aug 2026 08:54:12 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af3asm12949099f8f.12.2026.08.31.08.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:54:11 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 1/5] power: return -ENOMEM on OCV table alloc failure
Date: Mon, 31 Aug 2026 12:53:35 -0300
Message-ID: <20260831155339.181487-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831155339.181487-1-ivanrwcm25@gmail.com>
References: <20260831155339.181487-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

power_supply_get_battery_info() maps a failed kcalloc() for the OCV
capacity table to -EINVAL. Return -ENOMEM instead, matching the
resistance-temp-table allocation path in the same function.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/power/supply/power_supply_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index 00d8bc98d588..f550f70ca586 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -907,7 +907,7 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		u32 *propdata __free(kfree) = kcalloc(proplen, sizeof(*propdata), GFP_KERNEL);
 		if (!propdata) {
 			power_supply_put_battery_info(psy, info);
-			err = -EINVAL;
+			err = -ENOMEM;
 			goto out_put_node;
 		}
 		err = fwnode_property_read_u32_array(fwnode, propname, propdata, proplen);
-- 
2.43.0

