Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F52472AF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813747; cv=none; b=Rfy+f6bjL6COT7yqOGarkJiNKs13qDRlB6+LwpG6aVeS1eR7DZqnLPM5YqVfxeRSZcFck/hR8aScmuPc6Q2RdKdf0n7G6Ig8Qhzayo5hDyDarNTo6Zh7m7GeMmcuv/3w8Q43tzIRrl3RgIpnO9pO1BKUzv7dDXjLLEhnC1XAfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813747; c=relaxed/simple;
	bh=gOdxdAdgfT+lDwRxuvnqY6Qmt/W+UFC8uGlAIGjNFHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lMnZyVUeWRDOYC1wbbf2QDy/7aXeI7JBKVpy1hHZwYjEF1GtwE88WQJwbyezMeOy/iAd4hK1e8wOf/268kMQl9oPTorLWKZa6tV2uAvyHVNb20Sxe+58aYSzYdnle7qOJNShUSCLc5x6wGrvPFDwL5tlPjCrb/fVQZXFCHRiJDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=axG9gDAn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="axG9gDAn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so820632a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787813744; x=1788418544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/98K6HfAltFoLz2cK1JewwCkCtJGw16wbBrVm8XK8Q=;
        b=axG9gDAnFVygOqlS+tRc7W6FCha2PmPBG8AUYuvz/wN4sS/z4RbcCwnqq7mkw5UmF5
         1tMQCa4eVoRoMx3/ZheG2lr0Wtj6hGzLHhaLqPo/7NhNDQPBE7ceHtNmsNdwfAVmJnZL
         VhHuRPpeAMw8ToTHZS4yu3JU2saBwGRGDEaUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787813744; x=1788418544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/98K6HfAltFoLz2cK1JewwCkCtJGw16wbBrVm8XK8Q=;
        b=pMOtQB63aTfnUSUdrA3Rrd+bcBFbAMMsJzj+ZY6ZTCVmubLhqInauplGXBed0+UKpc
         6kTJkekmLBMSyrFDxz47IMyfoppX+Og9QfkgGag1sKTW6HH5W49TxmEFdEULXaFMSo3f
         ezU7u2SUCv7VjEvArp05cMM7cBwLgryvzB9RXh6tY0K04feN6vTqEa8ohmfyjxwIEinx
         Z9mxyCe8qDeGlWPdGQ0kLKnkeOE6B32fNGlXNqMoisryjpqvYxwaj9EqG+7/SiSBPseh
         +7YQum8mXzrJ3L731B3Tdv85U67dJXJroyRKdZcBfYRpQteKlmXd2QLoQ2uvUlNTr9bA
         MC0A==
X-Forwarded-Encrypted: i=1; AHgh+RpBJ31Fu8G43WUU/fEmKuTgFlr+mJTeJJL3ptHvgDJvkE6XRFlxufPZgEa1QmgwPCcCrJlWnSzdlFi+K7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k9FCRlbdKbMsJ1q2xt50+XtJMh6Z4MUh8mQtzfKXUC+RzNGhrt
	17AfvOxLuaQFMu9rr2ythmDC+6x/hpDFv7UUORNeSuNIs8mTKSBkGx585Fdi9+v2Eg==
X-Gm-Gg: AR+sD12lkPaZKaOBa5XM94wgBw1CFAIJi6yK0M/p/fhTDeLPWBPk2LNoYtnijm1IzGF
	dHT+4uLjsgmA9QV6qZi99D0Hq4FajgUGQBKVJ7DXgBYa/lwJ+Z5epBzx91TBPucsZwLWuDTCi2V
	ls2soJbX8LFNXlJzGYiEz4BZkuTmIu55AxaMdGqmgKfBae7FoUbNmN7lWfHfgvnB0gS2rJV8xEd
	4W3Wypr9Drh7nN6lLMWf0SALbKiEDWgkfOeEYe5o2Xbkcml2yhg1loRtFFkaHyLKeYskgBlEolz
	TBPr8V6cS7eCHpiTYeArf/+OGQGJjXHLGkjX900KPMHTU02hpPMdqjDFX2zlpPTf4EwHvYiBkIM
	vOL+rAThvmWDHAhVLEc2l3sxcAvW2mQDyPFiEGe1/cXoliWBVlamfoiQLzcrQb/vLsyp4rhfpdS
	GDPp4CEDncxcc/WcSMrg+wOnf4+iIOiTHT1s+6Bq7vHYmdxC/67S7OK7ZIvI+Rj1qb8wRtLpZJH
	3JKnWHBAq4+k+jkqbidBazmrAPuGbdZDAGzmqjfQFQ43GKfVnA=
X-Received: by 2002:a17:90b:2884:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-3969ba558eamr5421490a91.2.1787813744520;
        Wed, 26 Aug 2026 23:55:44 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ff0:ad84:24b0:9e52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d81682sm1501920a91.7.2026.08.26.23.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:55:43 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	x86@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC PATCH] perf/x86/intel: downgrade alloc_bts_buffer() WARN() to pr_err()
Date: Thu, 27 Aug 2026 15:55:10 +0900
Message-ID: <20260827065529.3835720-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We see alloc_bts_buffer() allocation failures under memory pressure,
while those allocation failures are non-fatal the WARN_ONCE() triggers
our fleet monitoring.  Given that alloc_bts_buffer() can be called from
various paths (e.g. syscall() or kvm_emulate_wrmsr()) and fail multiple
times, there seem to be little value in that one single backtrace (for
first allocation failure only).

Downgrade WARN_ONCE() to pr_err_once().

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 arch/x86/events/intel/ds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 8940f0292229..29c24b2925a7 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -918,7 +918,7 @@ static int alloc_bts_buffer(int cpu)
 
 	buffer = dsalloc_pages(BTS_BUFFER_SIZE, GFP_KERNEL | __GFP_NOWARN, cpu);
 	if (unlikely(!buffer)) {
-		WARN_ONCE(1, "%s: BTS buffer allocation failure\n", __func__);
+		pr_err_once(1, "%s: BTS buffer allocation failure\n", __func__);
 		return -ENOMEM;
 	}
 	hwev->ds_bts_vaddr = buffer;
-- 
2.55.0.897.gb25b4bd76c-goog

