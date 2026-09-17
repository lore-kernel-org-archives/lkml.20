Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3394B7A4D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657620; cv=none; b=hcmCgzkzvU4Biw9UE+2plp69v/N2cfId/F109XY/312+bcSIboCsRDKL9g2Evxo0ZHoF056l1r6Tu/DPQX6MhF9KXIb8w3zl9RgmP442hkAPflKtt+Z1BfSU4RcBl+mZIa3Ux0NDdgVBsCOwllvrkp9+bNAsxAK5ac/3Nf1gDPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657620; c=relaxed/simple;
	bh=mQAoM0VPcy2oVkQZSz5EAfz/VbLzU1q/KtRiLhP3gXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0xYIgtgjWNaGmLPiwTuv5ULUQiOBpNXW/nQcIpUfu/m6X5YyseJr2tMboHw5VStyrBWECkj/EosJcj4EQPH1C27B/BZ4MmXXtO1fgviJ8OBZcNMTmm72ySi5413otNnM5FqDLptnhfaeFn0nN4eecJxYPqGlsqGWKqfyWuH1Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPVdIFap; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPVdIFap"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0766cbe64so504162b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657603; x=1790262403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zHs5HAyUucVjtHvZt4rt64j5+dwbb1H5FeS2taXPLw=;
        b=nPVdIFapwFZ3Q5c8Z/geEi5ZRNq4WVpjLbTY+VOcMqEGLe9MiXHwcnVaDBkThvs2dk
         awN/3T4goSy3EyEIbtrArEltSiLmzit6Y+OHaWIBYx6fxLG7dUCA34t5U99nqXXO1J81
         IK3rOHBWz8KxeQYS51LsoCjwEI43X8qRdPYq4fBjtqdySD2Od6CJb9b6A9XwVAzymcpB
         qL9oiAUn8jHp8UmYhcMFcSJZd5RxpBLXUKtOX79TJT4Oxf0VarALyXPD7XYOS2X2NB4n
         Xjx8K71zaRtmZmdWSS3mfXPK7muZzEvpXB22d6D+8VIrAouFMpwxMzfr3mBY6qoQlNMJ
         afJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657603; x=1790262403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zHs5HAyUucVjtHvZt4rt64j5+dwbb1H5FeS2taXPLw=;
        b=qseL1iB8YcLv3g/2pLlbChdc6sHj8AwqAN/MXwKkYKr1f9pL1HbgJpWsU2jX/HikXm
         5sD+NYCNQFOE8zK02ZA/88VPemK1nWx9FrUR4P1c79Vhaq2w0qGqSRO6o48TBf13DjiS
         jJdLiQErDg4iTPBFZdzclW+wxNWjxll2gFV4tRergrIRNBuE0Gponi4IHYhQPvSIw9KJ
         k4uYJwmSj635ydcm5GdZdhnVe7hRWDffh/lAFY7myW9aA2jJpHX75exIFt/hIGzzBamr
         9FXrTbP+u6IGf3j6j5qrCfPJxBIr1cLUIwwnUHZ1R9e9PFaWoCPBzsy1E8FKA6R0aI1l
         Pexg==
X-Forwarded-Encrypted: i=1; AKwUvBy9g3LCnTmi1EIR7GO/rhKYaAovxnfy9PWortiH6lFf9sk7aVWMNCrJPLK2LQ3rhaOgmrkPMOULkjGjA8w=@vger.kernel.org
X-Gm-Message-State: AFuF++k3B9Oqtj+5sBIAFTJ6F2hCQlx+pEzC6Q2Ga4cYX9O2bhhs1qWK
	Gbj6b7F+m9JWcTmj57XbIdBAN6bjuDasDnxCHFi/uzxl5QgMx3ABN2Su8vfHwWaR
X-Gm-Gg: AYBFou1novZgR83NytHXsNXow018RdIh5SDpSaqAVvaSxf/y4eIyKhxVIhkV5F2Arni
	KLwkDiRVMmwH998Evk0NUStPNU26aYgVboL8H/yE4qFtdAsU2Zdn+Wm7fMlJ7TdkuvtN/SHkiB6
	T0g9oR79coW0bJ4OWTl15mHCPaP6jnyAEaCzX2AdET/6n7nUbNVAeUqH+72Bwt4Fk91XGnoghTV
	uRVLSWNr38a85wqJLSMN1p9RRDLxNwIUk1n4lIeRJWsS4TzBOp3UCyzCxqY73R6bN67/V07K9g8
	JPf4l5sZE3/KMdVWRUEjSxpmb5RCcITlfcBxurfkX58kmg92x+vk71sIiPywCeC4BgL7A3LjmNf
	fz9e7szfMFy9xQgmLJdy+LgNSFYsm+mF3+GL6CWtCeNwBI4Iwf7B/CnjQZe6G+jPQGm22xSk2lO
	uKUKprviSlh3KSyo/OfFJp7jymla5SoHdDLV1ydSZqIOceK4uPBPgs5nEnSlmp1fhEhAXLGcmvx
	Dp05mwcaDofdx1zzTfBIWuO8gbG4D+U2xwP00i7yHhf5gSvNJ5REt5rffnUax7JejezUirNe5AC
	anaiPDmMWU7UOiQkvORHlJbHHNcTwOnWvWTx11kiZLReBw==
X-Received: by 2002:a05:6808:1b9b:b0:4c3:e608:ade6 with SMTP id 5614622812f47-4ca4cbd4551mr9330216b6e.18.1789657602989;
        Thu, 17 Sep 2026 08:06:42 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.182])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6a3d7a4fsm2741322b6e.2.2026.09.17.08.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:06:42 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>
Subject: [PATCH] mm/damon: reject zero sampling interval
Date: Thu, 17 Sep 2026 15:06:31 +0000
Message-ID: <20260917150631.1138698-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_set_attrs() already rejects inverted intervals (sample_interval >
aggr_interval) and invalid region counts, but it accepts
sample_interval == 0.

A zero sampling interval is not a valid monitoring period.  Sysfs "on"
and "commit" both install attrs via damon_set_attrs(), so kdamond then
calls kdamond_usleep(0) and busy-spins.

Return -EINVAL if sample_interval is zero.

Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---

Hello,

I recently started reading DAMON and just found this one.  This
change only tightens damon_set_attrs() validation, in the same place
as the existing sample > aggr and min_nr_regions checks.  It is not a
crash, UAF, or race.

sample_us=0 is accepted today, so kdamond_usleep(0) busy-spins (about
one core).  Sysfs "on" and "commit" both go through damon_set_attrs();
one check covers both.

Checked on v7.3-rc3 (238650ef6c7c):

  unpatched: echo on with sample_us=0 succeeds; kdamond uses ~97% of
             one core.  echo commit of 0 onto a running kdamond also
             succeeds and it starts spinning.

  patched:   both on and commit return -EINVAL.  Valid sample_us=5000
             still starts.  After a rejected commit the same pid stays
             on and does not spin.

aggr_us=0 with a positive sample_us is already -EINVAL from the
ordering check.

Thanks,

 mm/damon/core.c             |  2 ++
 mm/damon/tests/core-kunit.h | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..376c3e2cbe00 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -1060,6 +1060,8 @@ int damon_set_attrs(struct damon_ctx *ctx, struct damon_attrs *attrs)
 		return -EINVAL;
 	if (attrs->min_nr_regions > attrs->max_nr_regions)
 		return -EINVAL;
+	if (!attrs->sample_interval)
+		return -EINVAL;
 	if (attrs->sample_interval > attrs->aggr_interval)
 		return -EINVAL;
 
diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 4a536d41cdb2..ec8ef71956c8 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -658,6 +658,19 @@ static void damon_test_set_attrs(struct kunit *test)
 	invalid_attrs.aggr_interval = 4999;
 	KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL);
 
+	invalid_attrs = valid_attrs;
+	invalid_attrs.sample_interval = 0;
+	KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL);
+
+	invalid_attrs = valid_attrs;
+	invalid_attrs.aggr_interval = 0;
+	KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL);
+
+	invalid_attrs = valid_attrs;
+	invalid_attrs.sample_interval = 0;
+	invalid_attrs.aggr_interval = 0;
+	KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL);
+
 	damon_destroy_ctx(c);
 }

-- 
2.34.1
