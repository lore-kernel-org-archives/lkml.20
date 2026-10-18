Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8308D3CEB8F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305016; cv=none; b=gyLI4yog/R8XSTbvNATchmbyFyg4JUYytQTAhTex9joXcfAuIZiIjxoNOIBS3HYK59wTosRsBzgkS5IiCQlGBxjoPxvlNsPqPVm5mMJ5/yJrlicnzjrvfEe0P9nKZky9py8wNfPa2IBxaMWQvzapb+LhApczeGoMTIG0czk0QYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305016; c=relaxed/simple;
	bh=wSNWde90JrtaRSWcvSp+umDo+bnx1SJz+8iHz+uMxv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHpy7gEJXrmpTiN64svwN9h0QtJLNBK7bhnCGlrItcm1EksgkleWLnhsQUEQ9vG8xp3M20q1uivHUEdl0dh1i0L0jkQsZv02cL8qYP4HLf5kjmwln4VSQaYsTKjh6NYovz+l5r7QRzKp508RZCR4tJDRb8rLPV8Y0jmmiyf5Fic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IODkR8Dh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IODkR8Dh"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-872024e2b4eso393654b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305014; x=1792909814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqtcQxwiQFEVUn/7ZWc/MbSwssB++a/RUZGjFOKEzqY=;
        b=IODkR8DhvhG0AUfgL2V20u3qEuNcR5fuFIanfRx1SvlzNAza4smacQBGe6ChHDYHrr
         ueBD1auGXMTLiN+NZFJ38oveBmIhdbnO1y3bH88PHM9RWv41mFrPlo6a2IGZvNifU79A
         ml9mhcW18d43lhtErEaGCMXqpTfMlgwsB8lGlZjWVbP3WDXv1EeXlJuUyL6qsSeMSHLZ
         Va1uBtknilzeND78efmJYp+fMDQUvxqmXpYUBMZCqqzqFHIescaH/O9r1cydZNvKsewk
         WNWulJZ7/9Bg99eqYbkVOWNB1ULMZ9aVHj7ALw7ntIg5ddFPLXqeQrFx4F2nz0xOcSls
         HWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305014; x=1792909814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqtcQxwiQFEVUn/7ZWc/MbSwssB++a/RUZGjFOKEzqY=;
        b=rBifeB5sF5g8/JtOdakhv6UFVXGjgajWThc8T6LcCSRPSrTfhSSYUqT90vZTGahZrX
         CHnaX9N2OxqbU4UcPvCX0nP9UVutQFiTS/VtdRhM/Rg56qXP/I+T//YD4k4hzY4UlKnh
         j7z5602U17KebKThjgYk5vjdtXY7gLm/W3VI+Cr59UNQhveIl+ZVMKRcZZ8jl3gCCrFk
         sGzHpCdos888wn8f9vNiO4bBqPNeEIvCVNhN/ryfsX/f3U/Y5oyRBZIqo+shSTvAnkEZ
         f3KnnrMnOq2YreYtFOJ2vELU+iAtcZHg/fy9afECaAW+ZPc1nD5sK/8kGHO7Ql4lDbaJ
         /DfQ==
X-Forwarded-Encrypted: i=1; AKwUvByOsSWyDsymb+z9M6huifSfi16Utzr8J3O5IKbzuqNEqJgez8zFsRCZ+dHRFNEZEajTovJ1+a6n1GoyuxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdkzWOIGBYHJIvwckqyTgiYy2KNp50wKDRZ8QnUW3cCv8vXZtc
	qBSrAB+VfMtOTl0yhKXZ9w7B7Ry/BKIQKSWUi0wdOX/X1IY1rxZCjmDb
X-Gm-Gg: AYBFou3c4dWlYmAF17ks1qsl6+qjyR8rLXUb8oxHRab6Ikj6r1aBdPusnRqB3hBImKq
	tohgt7f+rIL7zKDVW8wg6grAhv64wzYFehF+kvAO4XM41gaEXzekvspP8vGj8Ddcs9vmolMU8uC
	oMM1BQKxClv3WA/irzp2zPl7kn7donTkMqI6OtmHT7U9B8BdZ0aqSjdY1g4kUFrVSIyDiNJlsB8
	xIBGD2/TeAvWKgXc/cXhpONfo+8SAAS6cy3r488oPnvRHNEFut/kBP1piy7ZF6O6kFddNjPeo5l
	A2oU40QZX7AHpqk69C+Y5GT9uMsIXDbLWCkbaY1fPx/0psQjbnknn81zkHKul7vU2/q9LSLYnoC
	SwYkepsssFfirCHfsL5gUwxjZMCNcvsHNLF9P83cHI5B+0qJECX/fOuiTWK7jsHPBODf2/NYcLk
	YtUtLnlOKC91jqOV9JtMFHMx5jKgjcYoHiPk6bcFd8buHOAo0/838Ir+Ij3eySv12yI2v2XbKEP
	R22YM/AsHFDG4A=
X-Received: by 2002:a05:6a00:2386:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8a04be695fbmr2612651b3a.45.1792305013719;
        Sat, 17 Oct 2026 23:30:13 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57268ff1sm2714978b3a.22.2026.10.17.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:30:13 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] clk: devres: Skip cleanup action for absent optional clocks
Date: Sun, 18 Oct 2026 15:30:09 +0900
Message-ID: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get_optional_enabled_with_rate() registers a disable/unprepare
action even when the optional lookup returns NULL. If allocating the
action fails, the error path calls devm_clk_put(dev, NULL), triggering
warnings in devm_clk_match() and devm_clk_put().

Return NULL after the lookup to skip the unnecessary action registration.
The state allocated by devm_clk_get_optional() is released when the
device is detached.

Fixes: 0d4d262c1664 ("clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with KUnit under ARM64 QEMU using a test clock provider and
failslab. Failing the action allocation for an absent clock triggers two
warnings before the fix; the fix skips that allocation. All nine tests
pass with the fix, including cleanup and error paths for a registered
clock. The fix was not tested on physical hardware.

 drivers/clk/clk-devres.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 4cc3863bd7da..35fa34a961e4 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -112,8 +112,8 @@ struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
 	int ret;
 
 	clk = devm_clk_get_optional(dev, id);
-	if (IS_ERR(clk))
-		return ERR_CAST(clk);
+	if (IS_ERR_OR_NULL(clk))
+		return clk;
 
 	ret = clk_set_rate(clk, rate);
 	if (ret)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

