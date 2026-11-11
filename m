Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364555;
	b=s0mzgi58wZ28OnQiTFAbjqfKCTnqStQjP3upJ4h+19kYqqnyT2LYImlgvJryfxA244O5
	 FiahncC3SjMa7tb5KVwbXeH69w7cHY++JTT4unk96r6v/KLRH1FZBP4/utP3vB1GaK4E+
	 SirhPD/WADegLjpRewwGDXwd0NyEG+9jv0GiPPHPrfQf8zbivFX3awjVNoF7+2v9UnnLU
	 pA6SS1tHjuApN3xyx6H75tKhTfN+2A6CQaeOkUqtIeZ0bsCHwx1XJdUNHcVBJJo/aT5nz
	 zgw59YpSaFE80/TjrO10vxefk0QqsnZuAy/Hwg0VhD/e0UX8/b77YUQGX0mNmX6MNFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6zeVpQQIPxzRW921jNzANvtYeiWb1Rf7rLm7zqTskZk=;
	b=R1f1lFm6mO9VqdLyL0iPG2i9SX5pe3aBdbEDCU9s23OxOoEgLEE8x//4yuz7lqH8NX5g
	 T6LRxujGwGYVhCORkQucspLNaGvti+vR9cr7wsIdWxAX+51B1oD2zEo48C1Cb4ZpgZCpZ
	 cVZDHO3WubZnSOjGQViXwzoqDrJ3sIZMO/IYl0LEujarU5yXBtJ9sKGeDm3+hxHfdHLVj
	 TGmtac3IaGZn19a+xiG6tyaqeByC8pjGEpstfFztAYUHylz9rA3Ka2cz7yQN8+3Jo1D9a
	 biceWmdJGa6OfWkjM4E+IBTUSy8/Y+/nDPqaUcRjG2PxH4sPIY8iTbPRqPdHaa7dObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdpO8OlD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdpO8OlD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5373285eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364554; x=1794969354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zeVpQQIPxzRW921jNzANvtYeiWb1Rf7rLm7zqTskZk=;
        b=kdpO8OlDuqFGxJ6pYbm8Eaa90beQ0xoCFDd3zMa/4VEP+NaHxsAXkHAvgi28M/RDnF
         RAMYOXkE952mBG90pGuP/RY8/psMI/ddWvyJAzpCX3fLPcN/Ogr7/MzO5OYCLiaKOkrq
         pkr1abSKO9yLHD34ENOIJS668yBBCud4Ynmo0/7go9ggpgfrBYoAJWpevHj1NajYfiBV
         Ve2p5Zt5IdMTPTypm8YgI1HO6FrmFSPyR7COQbjw1G5jr3bRVjril9MOilyETwxtzBy0
         4KOEc+B3e0GTJiNasFdeX18tbLmKUu9CXgg6/olRgTsP+AJ8fDZvTFcocQOJuCv+EaNB
         p9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364554; x=1794969354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zeVpQQIPxzRW921jNzANvtYeiWb1Rf7rLm7zqTskZk=;
        b=sGLbibe0++6+JcQznRQdtVCUSSxGeOjsJTUHm+h8zQ6HCa27BpIXuRDDBC9f3UjnCt
         GbRZYfQBqBHZnDSVc3Val8ifrDDwk7Lir1XZm7HjKRDw5cQouzgkjGlH3rKawxdG7cAd
         /hok5+UCtFg25E2onkS3BSvOGy4ZHDQSZY3MlZP6gpjORPEZBOgn7nWOaxgLxKTk1fy/
         MCzZEqn9KKpRH1sLKuts0GPVCHDxQwAB0wsb0TDgj5tuNEEqANYaL5EYkyQ6bIjqDBDH
         Labxb80j9Ikau+uJus+88bMdCXnbCEEXx/qnR4uiU2fAccEAbrWOp2Ggqga5FHTgZxNd
         EGiQ==
X-Forwarded-Encrypted: i=1; AL+hErGtEyCjstL5C+S9/ZloGUKvPQs+MMBkwWjKthkbruOHPkGqnYmoRhoL4oQUOp4UcnEBfHGN5v7KmDQjjPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xBfl45c2FoyrcnKCG7TVohOMhFAFmWLPXDcipZx+3WCNkF4AB
	cdqQp7PGfhajuiN0ByrbqPf2Yz2PFjC25Me7GEV3b0bD8tB3jx8ZURK9
X-Gm-Gg: AYBFou1Fazg4/h79SqXn8CmzI/B4bsIjFciDBhXpDp0UbSt63A5xwGcEM5l9XOlMXE/
	9fRTMX6Y9ovmyAjKu7AL0DkkbIRZPcakJV6PtkFAW8+7/52Ly0FpSjP3u7rAaNNdwkp4+FtuHea
	9k9CglrtUfYFVSOFxaO2TWw7ZL2oD7+6mtXKBIEO+U/2yrP/2vhn2d840l+HldGFThSwwZw5URZ
	Gyq5viv863PCpKMleEInb/sa+Yo9D9QZ6mnDCqb5YbfsEyXXDZ2rddtSZoEaoF0QmAg8TYRSb41
	WUPWFnbTs3FAP414P0M+OEKmICQip/B9+kVhOJQf5996trboUM36WzrRE7HKqPFwh43bVASrZSz
	D9RK7t89Qg0f1C2B6K0tWbSutPQ9Z6Qez5S/scY7Y0w273KZ+VVNB6i1F5k+AkqqW6XJ0IYgwvy
	ucecX7MqVQG6G+wiEGcIGNP5w5Pcc9b6ons53sNPBlwYce070eUnHlRzcijec/x1Q5mmbUAnmpg
	mvvMnHBA9U7ABPA4Tqktsea+WpS2G1T7E3pwL+jztnwamqF1JNVJWypn49W7G7wHhfI5wzCyz6v
	SoeTV2jtY7hUX5oEoPrn
X-Received: by 2002:a05:7300:1486:b0:376:feb:2df3 with SMTP id 5a478bee46e88-376861801e9mr2280854eec.20.1794364553911;
        Tue, 10 Nov 2026 18:35:53 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm20493219eec.18.2026.11.10.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:35:53 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2] arm64: perf: Drop the example the userspace counter section points at
Date: Wed, 11 Nov 2026 02:35:50 +0000
Message-ID: <20261111023550.1971639-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234551.1474417-1-takano32@gmail.com>
References: <20261106234551.1474417-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but the file does not exist: no file of that name is in
tools/perf/arch/arm64/tests/, and no commit in the history leading to this
base has added one.

The section already describes how to use the libperf helpers and points at
tools/lib/perf/tests/test-evsel.c as the example, so the sentence that
sends the reader elsewhere is redundant. Remove it and the link target
rather than pointing at another test, and move the instruction for running
the example into the How-to section, next to the reference it belongs to.

v1 pointed the reference at tools/perf/tests/mmap-basic.c. The review said
that file is a confusing example and that the section above already covers
the how-to, which is what this version does.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/perf.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..5b9cc2aeb642 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -131,7 +131,12 @@ changed.
 
 The userspace access is supported in libperf using the perf_evsel__mmap()
 and perf_evsel__read() functions. See `tools/lib/perf/tests/test-evsel.c`_ for
-an example.
+an example, which can be built and run from the source tree:
+
+.. code-block:: sh
+
+  make -C tools/lib/perf make-tests
+  tools/lib/perf/tests-static
 
 About heterogeneous systems
 ---------------------------
@@ -140,14 +145,6 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
-
-.. code-block:: sh
-
-  perf test -v user
-
 About chained events and counter sizes
 --------------------------------------
 The user can request either a 32-bit (config1:0 == 0) or 64-bit (config1:0 == 1)
@@ -160,8 +157,6 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

