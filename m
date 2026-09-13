Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD731FC0EA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789262517; cv=none; b=Vz9jQef7BaNOLy7S2wCAanNDCllniIM/Bd4XRFVnAk9wC4bMpQ3E2Li38USSoD/Bx6Ic6fQ/GzECuheR7xQn77udfCK1CUlr3e42MKzIdBS+xKtLPjzJSqHFeQLFMon8aDy6GWboJmW6uwOiOdJtJ+Q6r7mvCs9YzA7O2i0/6ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789262517; c=relaxed/simple;
	bh=M+/Sx3cH41GiV+EpE5NH14xAFUejN/4RjKJFEcFm1xs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGmuyi8i/krAuFxK5rvsndEt5IK7xlQH3NaVNF6hFpKIGVAQVXP2t1eVVW7fSS1JOkHPBz4BRj4KbJwIZ3rAYji/3ci3zWQbxYGf8BCIVbsWmXLT+jOW21urvEvvymKTmPurCbhAgeJh0c6fUNAjwfefMMqjkOVrPmI7aVnrEdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLoxgULL; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLoxgULL"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90e9ad1a373so28097426d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789262515; x=1789867315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GdBFv1M2xuPh51rp36Gf7/Z2WPQfaG261Dqs0bEUw18=;
        b=PLoxgULLIowaWDKqISLn1LJSZY9iUNP05bklMScpWj9C+vZigvbPLM+pV4iucA1NhF
         y+OyF5LhlITH/eLjhBS0zYAnVdLp0rdd807kgQ1FT4qQFtwnGvA8/l4D6cbyPrrs1MOJ
         UrAKcruW/b6WBR1oeMYMdwmQ87MiN01PMZOA13XvMoTyNaGEnL3DeOfKGMNKj2bWTz5B
         5RlO2mWI7Bbs/6QmcuG2Z1amMdLfUkm9yKirzgilgwbLAy2I0VwCsoI/2Tgvt1URsvVo
         SlxJgbYQebJ2lFuQo6lO/r2zS188L9e0mgciL1hx42ivBRtKdQjPiuVJig7lwhneZLOr
         I+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789262515; x=1789867315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdBFv1M2xuPh51rp36Gf7/Z2WPQfaG261Dqs0bEUw18=;
        b=Hi3n3lAwCSPJfNd6lBHe7Zag3NUDFbOilIxTYZN9ye0ILm/u38H6c/rJHGYW/H3HKj
         QOcfHuKgENeZTsYiiGFJw0gnYNjwaOQiCGZ+cRCsed9QgbkkpHCDtOFVIWuF+yiLI/qT
         jSpG2SulnUF8frLsgYpJKZqS4p5d66iQSuC0Xh16jQEHDb/MI0IiqHKn7V52FDBHUPDD
         PNPAZBKW8FaNdmsz3gepZPThQccufiMKbQsTrssgbQEz+Y3KDp00hmfCSwx82Mprqizr
         Y8mnijc/tEKDvoL9WoooulHxTDm32YmV2VbQp3CQN5/J60iL+9yIrcW1h3v+vh65ZqsZ
         Fyaw==
X-Forwarded-Encrypted: i=1; AKwUvBzFUTnC97NF3zPRvCryCPP4NqCuwai/OB3WhXQeBciQZ2AAykdSYWRYboU4D7A5fBczrG+7GBQLlFcfo5o=@vger.kernel.org
X-Gm-Message-State: AFuF++lM1ihEnb7zGhIHxktjVcrT+MHSEw6GkIgS/RK48uLXxzi3xwfv
	WIlZ+8jqLs3E6o77pb6mtU7ADxoJ8HpymCMq4BTE/ozGO86f7sStck4=
X-Gm-Gg: AYBFou15QYEDAiadwKkCQcr2V9tRfsNeNmg5HbW68U+03+IPXqmcnPTZ7c/paJYJNrh
	6L8Ndx2DLE0bZvsc6Oav5zM+DuXruZLK/0WREz+4qKmLqn4Bme9vzoA8gUKFfKsY4DD22kViFHy
	3ALECZtrIpvBg+gw/koGymXaW9uPMbQivsfmlSpqdHtzMSa3XJ0atEa0Qnc6abYqkyBi5Pq/iBG
	pWAj1e2FDuO5LzQY3uCl8lpf2x4+Kktc+qAL3p449fkLH00gRJBMtyAbgF3JyQVbhUB5Vt40kFq
	HsemnJfbbw+Vuhwj6boszgUeQ/R/kZr9T5qQSVRTcwmkBiS5MsGTzpm66sH0SDRAlm0EOl3m2gS
	7jKKGllhAxOZOYAPfiHAqSBBOYjfcHVI8rVGVIojMtHp5N39l4W7sffo1oua+IgqC5YsQSMHKQ8
	zGq4i8cJtNTXHwWg1iEVs3JeP1LVJFWlQzPgYuV7XN+zpaIVEn4m/mYV+1lFAEFcnUAMFs+sYir
	+delmelj5XxsDkUm4gE+HzF0SzgSuV8bpsHSGf0l2aEw+1/Mrn098Z8RwnNZtSTmUgAjJvaul3k
	nT2VogcMT0QULKnKTZTxcVq2PUPchZM9Iw==
X-Received: by 2002:a05:620a:43a9:b0:939:3f4f:7254 with SMTP id af79cd13be357-93a185aa46fmr50431185a.14.1789262515033;
        Sat, 12 Sep 2026 18:21:55 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e8bf9d51sm616681585a.14.2026.09.12.18.21.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:21:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <mchan@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] tg3: clean up PHYLIB resources on probe failure
Date: Sat, 12 Sep 2026 21:21:48 -0400
Message-ID: <20260913012148.9800-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tg3_get_invariants() can register an MDIO bus and connect a PHY for
USE_PHYLIB devices. If tg3_init_one() later fails, its common error path
releases the mappings and netdev without undoing those PHYLIB resources.

Disconnect the PHY and unregister the MDIO bus before the remaining
teardown. The existing IS_CONNECTED and MDIOBUS_INITED flags make both
helpers safe when initialization only completed partially.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 158d7abdae85 ("tg3: Add mdio bus registration")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 73a4b569b..4662e0e92 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -18047,6 +18047,11 @@ static int tg3_init_one(struct pci_dev *pdev,
 	return 0;
 
 err_out_apeunmap:
+	if (tg3_flag(tp, USE_PHYLIB)) {
+		tg3_phy_fini(tp);
+		tg3_mdio_fini(tp);
+	}
+
 	if (tp->aperegs) {
 		iounmap(tp->aperegs);
 		tp->aperegs = NULL;
-- 
2.47.1

