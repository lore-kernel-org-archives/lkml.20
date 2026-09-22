Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E793535A3BF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047249; cv=none; b=OjXgdGj4a7LqW4LHNF2u0ZKWX6tmu4kv+CdaL/wXETHz4Qud3v+H08ro1DwxMxMTnNTfwn406eVyOMokJD8GdHoOT3rBbPsQfwCm+OQvtKdJFhVtxfhtcxtvtK/UHUVotdlhfHTdLDflnwjddhOY82xzBUnMJqtHEWLpnBEgan8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047249; c=relaxed/simple;
	bh=Zx/9MBpB+EgUJFor4JlLXdd0yHAV7pvEgKtDi0YuxnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pf8zIU97+t3mIbHoKVdmngTMuwjOMz4ehvwlOjxo/wC6oX+LAzAuf0RjiDMNJzdV9414M7zKsCtcdwJZ8DvI9UQZB9vJ13F4oPSqpUZZaI/tLywbWmg7A2hmB5BJFOV714vyPMNwgZAOd6vJ98AzSpZvkpwCXQsfl6bwCRpEylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+ocE7WT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+ocE7WT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so4328515ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047247; x=1790652047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYeRwN+G3teKav5DbRF0AzCOQ1OUDJvL0VrYOUOutI4=;
        b=F+ocE7WT46dxwamlFixCMDoD4JZAsBdGqm5HLBtXXlrI698tlPpWRuHpCK86crMeUJ
         yB8DUDIy4i8j1qUHFx7TddWVuoFFRitZ4jX3a6NOaD4G9q88dO2VM8ZCIYi7bTA7Dmji
         HRN0Q5WmnxWD4FLwg0TJ6AdGKwyjebwjvaXvY+Eaf3U0sTylePA15uQjziFqPjZO+kSN
         zIkTSjiuXAByQaY+Ccshmqy0p/2d+ntKJ180aW0ntDff5EvadS+D0noQlRV+0NY+om9i
         W892fj0MsjGDPjzsgCwAmcaZ/FHk4Ooy9mORz7SXWGbdzUrPIUUwlPqvlWu5cILDpKSV
         oE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047247; x=1790652047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYeRwN+G3teKav5DbRF0AzCOQ1OUDJvL0VrYOUOutI4=;
        b=VJlrcGvfZps8pofUdN0Jfu+v7MR0VNjCIGC+QC5rMPgWzqaSf0/p2IEDsTHPgYIxxy
         Y50a48YPmwm9f1D8xS24Iay03y9xtY/WeVU6Ft424gkuQB3nscBAYG77p5luplvgkHXF
         SVc712XwPwC8IRSwWOw6XFS+6lXsl13XX5/dIaSWqwNoQjsFXAoqV4p5aqeNhoG9eEop
         VbmtI+e0MhFx7CnvJiprulkxYVoIa8jEVCLECwK4X+BitDSgQQj2TZUGeh+BFlBYAgwy
         ireDwY7+1ZoEP79/rwMlR3+YquMGUBkNteqBx1VBtry9XIcbJn5Ehr0s5YuyPgxJuQaZ
         DoBA==
X-Forwarded-Encrypted: i=1; AKwUvBwmb4K5ijXQUtliVPyKBohMU+W7tyE9jCo/libBzPp8yXdrNZIHi5D5rYYnboSWEALRLoDXJUBXEFSpyMU=@vger.kernel.org
X-Gm-Message-State: AFuF++nD42vWwqiFVzl7TmH8ZwrT0fU7S34QFeVt3nXXGs/1ba5gGBC9
	Q+uoIRXl/+IV4gwte0DJWxSbBbBSz592Csd0w1QUxENbxc11fABIkOtk
X-Gm-Gg: AYBFou3bGDfMpnsK6b+wKIviLRARi9e081nA+Gw/bXuVV55D0+ZzZbZy85KyIEPxfyt
	sut0Drzwg/oHwbjMAwd+3YT3nrRNtdeVgG3BvuB/vMpyarH1jEBuzu38IyqFuBCX2u/4uvINVYi
	klVhiYLIPsPHn+gZMe3aoHB8YvA0NueuvcKSWv/UZrv36W1Eks9LACfSwvlSG344ZFgQkqNGtCA
	0+Scr3J11wmnLNTdbHz9tgr50ChI86C4mC6YMKxwbvDrgSgb3N6WJ2AcTEf4L3ahI65Ws71Btxd
	HiMPjD7xylu+ca04++Ixqbd6d1ZAycwPBehootm1GuTYfECqXCOnRJtVARYInqQczZiqNzX9fs8
	h8OTL8mPMDP7NZIPwXaw/RKXy9Yv5k7c9dH3OXWX4UqoWcKAQHJeamWffx7TIBHn0RaEWs+KI83
	/I6ttbYh/h3i55QlreAiCg2br4jfR0mLqxoDlxeAV0JyMEET7hUxmeWJWfhKs5M6dZ84+coelbA
	RWCVUg8i8mERFV/O7DVe0tw2rZNf4orJxYo1Ap81v+Ykp/d7BfmzIkDQ9NJbVy6Yn3s68BdSFM3
	4Kp427F+2s1AXQ==
X-Received: by 2002:a17:902:e741:b0:2dd:ad7d:72e8 with SMTP id d9443c01a7336-2df59a9ce29mr14324825ad.31.1790047247091;
        Mon, 21 Sep 2026 20:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] crypto: ccree - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:53 +0700
Message-ID: <20260922031954.320895-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/crypto/ccree/cc_pm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index bbd118f8de0e..666866119588 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -66,13 +66,7 @@ const struct dev_pm_ops ccree_pm = {
 
 int cc_pm_get(struct device *dev)
 {
-	int rc = pm_runtime_get_sync(dev);
-	if (rc < 0) {
-		pm_runtime_put_noidle(dev);
-		return rc;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(dev);
 }
 
 void cc_pm_put_suspend(struct device *dev)
-- 
2.43.0

