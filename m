Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730483644CB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440561; cv=none; b=cEjIbsBvHH0XrxTVQBqWC0JJJASOKGIb/mlkMPvs8Asz9c5P17sBXtDsutZG3xli+pYJDqon9tWosULOMjoXiyoKDfOHunkpFfgJUrl2UtJCqX1qKo6HaGw9y+q5ENUcxvYsItVApGnhs+zoUCdEkg10ZwqjPLjV4J3S9XE7zNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440561; c=relaxed/simple;
	bh=5VNrVx4ZKAIvebGxfLNqPgw9xDv0RVGMqeAFRyrl6Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g42nvQOsRkvt2zwAFMMDrpLY5Sqzo+Q8QfIK7QDXv2ZezjV3qyoanuvkOpjvTcBDnUNxZDd3CBxoX4xIe3qXri4/Qm4YPPIgw9F5mAiKO3p4VW/dHwkiN/GoRFzFnurzwH21Nk/CyylFOCJSQw2LIGNdkBe+/dQ3UFdRPrt9tB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMRKMigy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMRKMigy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so11190225e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440556; x=1791045356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92J4cdfV5TssQddcjnr52AW40i0MRdcSuU09rnmRkE4=;
        b=GMRKMigy15lhxSBtsY9tLDNnBp7jDte0j+9a22hpyfopd7WK/kzTZkyKuCrx3FDgOD
         QB62hxpqiZiEpg/wmJfp15seOyKZJ8t8M3+LpotC1nj7mwchNUw10R3mSKxa8i8ZZNbI
         b/u9ThPqkGvnDsDmuEe6Zsv4pTruh2Esy/PivZgp40yVT7/hf9XNRk5YrhByOlrkl54R
         wCUToG/F7yMPkEDPSu12arX5Iqj3LrIVuNzZ9SUO2G339eTPuq/PKvbWzDJMkNNY2p/h
         Ah1+crCdkTu/2KxpVi7Io+iyE/RJ7NVX2mWT7t7QTaljZLkZhfJeXSmNsXGKMol6+9lu
         fBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440556; x=1791045356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92J4cdfV5TssQddcjnr52AW40i0MRdcSuU09rnmRkE4=;
        b=ZIzRxAgv03YawGxsjHrFIxGrK4whl+kUmd3R0Un46gi0jXs5kMAI86Isjh+DgAVPDC
         DwRCUjiq5wZ0/rozdpmaEbtf/3Uel3OL9fBLqbwfbaSCnBmXQlpQHPYfeG/xXAdSSU4p
         R8ADYYhjz48VcUSwktIzTystLLsy7fmS8HTZcNab2N3jdLoueXnV5lzRBYRErBElBzKk
         5uprWg1DUsWvkx973FRAdahySrNI3X6tNF7WNBggaDBwdYhL47Wjj6HeEknbtICOrZvM
         wD6FSbKkN8fShqZsUzObIV2aMNjgTyPGvJU2WPP4MnLgPa2J+t2pIeruV9X6KZPuNB4b
         RJmA==
X-Forwarded-Encrypted: i=1; AKwUvBxaetFtryUAHHiHfD1MOwYd8PHA5hCeEkIDZ3U81YvGZ8PYEOdDUNehbzFpnw+k+RcEiGATdVCWilTDkEU=@vger.kernel.org
X-Gm-Message-State: AFuF++kmP11tywsojZsUyM15SKeQbijSe7hI4/MVVcFu7JOiqxMccbxf
	A+Z936Vhq6M+M6vRPiL/Uc4OAWzRQBH9TWSIyFixj6LvMR3NMWtHN6a5
X-Gm-Gg: AYBFou3/+d9eygb0gdQZlCHvBIeWmAxE/o67nznnDuimg4S2JIBHsRIfa+2KXoD06dV
	mKDaL6QVNIS6mfGi6rZ3TdaB6DpiV0a8CqLL42FTp+HsohhRYayggKATrhi4krPha0CXtoE0kzK
	/N9iKtyybRrywc/5sCxLCDMn9xaOh9JQazPFyxKzZ62bTC4bGQL6j3pZ/r17eaorNwvvfzSdM2G
	Qhd288XSf1PmkSocwzLgUIJqhi9+K9oa8K9CD86u3HcC+14dSQj+C+9Dk41pqhaFGsOByjQ98h8
	+f2GmI3WwZInNK3KkN7Mnew+tB6Z6PH5WiCMEeWF01c1Gs3XhFAHLJxC0eWl2pYMrb04KEDXK2N
	ut3+3ur6mSsloiOOG4W62+eo+l+2ob0DGexGRvU9KnbflE6uNEusIXphX4EBhuVL3l0Ay56wCII
	dqDuBZSSNPaaiG2nS97ZW/8z87e50VFm4UKcJtOLfCgQBgDCKRl+JmaFoKSjQGOAzzpoZVF72Ym
	Fi/iSmCuuMO9onXJfCVG59U0h2/0g9L/aYotNUnIFBecM5Gfq8/M4eAJ0J3Ws9GldSPpuByQIVK
	zQ==
X-Received: by 2002:a05:600c:1546:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49fe66bdee6mr155118895e9.4.1790440556411;
        Sat, 26 Sep 2026 09:35:56 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:35:56 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] rust: add DropGuard KUnit test configuration
Date: Sat, 26 Sep 2026 19:35:47 +0300
Message-ID: <20260926163551.52371-2-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
References: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit configuration option for testing the Rust DropGuard API.

The option follows the existing Rust KUnit test configuration pattern and
defaults to KUNIT_ALL_TESTS.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/Kconfig.test | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..011c72f14e2c 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -33,6 +33,16 @@ config RUST_KVEC_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_DROP_GUARD_KUNIT_TEST
+	bool "KUnit tests for Rust DropGuard API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust DropGuard API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 config RUST_BITMAP_KUNIT_TEST
 	bool "KUnit tests for Rust bitmap API" if !KUNIT_ALL_TESTS
 	default KUNIT_ALL_TESTS
-- 
2.43.0

