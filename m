Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1F4FE2F7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800654; cv=none; b=oYdhHhed7ZLkTVb60AlGBGwACstr5DdgiFOIQb+D09AApPuJJj2Di30bgqeqrQe1rR0E1Q3jj2W4us671rgAw4g5ID/XEAR4EJLWqne8Sa8ycpPeNOIT3aIqjO+AQyrkDlbSMrM/sGYSgTJcchepqgm3qUr9CBUe2dkaN4A4d0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800654; c=relaxed/simple;
	bh=SB6WfXLYyhvKySyyp3UErVUu3d/q02LxuAtXUi03Khs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ccflk06erhc4ljRtv8mS7xBax5P73FVkdaXv4v5fhRrbj2zGzG/rpxC9ssPlshgWX50fH/Se1AjcKNf877+CGH68NWJ2T43X/Y0hOa0uPhm0D4UW+6YNSUOw22SUoVWNovBgvc6S8dsVRQfBrYBGrZUdnABEOpS9ON2Aepr2zFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHGWpFqk; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHGWpFqk"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso6922326eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800652; x=1791405452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=li7VR5B3gFvDubjRrhPPXWIuFs1rEpEcUgMEBaEHuyI=;
        b=gHGWpFqkXUJa7ufH0njsTOxMVyner4cXn352rSOMUIibfJqDVudWISoFq6LFEoMbBC
         q+AD5xlyXhKCBeQXXzh3oHjGlGQL+JUTsIldflmJfZgJbu4E45x6gvu4GASqEZQWVrBZ
         RYg5gWawuFUd6PPtCYVOoDBzs1DGkLk3EyfCC2jxTVlLjuBI67mVQODmjYTEkuEXQelV
         6VGfxMgGn3oMWvBhVKFgOE2TZ9bPRfcbSE/jCP15Q44h7ckIzWMnI5GDphy5iszyMfbT
         S6R7bfEF2eV26mJwt/RIxuPll4M/hMKv/EKvTtB0Q+cE1CjFRC4tZutvNmHoyqoXe7HB
         uLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800652; x=1791405452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=li7VR5B3gFvDubjRrhPPXWIuFs1rEpEcUgMEBaEHuyI=;
        b=heoHlZdDZQt+z1eQ54dzt7vT5MVtGJP+M+AIO7k4qjoXi6i5SQKh/ZZUK3EheSfqSJ
         FjnUCsmKL9Wd7Mz0Q29WwKbNU80p4VKMl7hdG+sJ/dS7AWwkSXjvJ9/eYNIoQQz5Iz9D
         L7Tc9ECHg+Xugit370YzV6PeguUS/eChzX5ugDwhEynkwkzyKCrAkes1R80bXNdrA5hD
         EfAqDF9ZR/83Q2baNPTE10NyDxWJSC8iprnhbJD4tRA488mn7kYJ8YFus3bDPOSVDBgb
         grrEgXwF7cIExzMXzSjbIJDS7c1KBPAWmoRmAU5Gyd1lXlgpZtAPA9wMc75TVHmTrdVU
         m9iQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgyIPuviTE3Hby1dPgoflUVAQG2bQ/jINqeSWAwDmnwdUR/wZhH35kfF5otiVcseQQc2+T7ohkNIT/TS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtHdI5h9UIlIkv1keKvTmjfYt4s+nu5lLC546jIl1APOdF6GeB
	Jf3srKD6t8+3hfqkkTlO79HXSMvHCdh+mPTz7zvDvft6TighyhTl96DA
X-Gm-Gg: AYBFou1gl0tIOtg7JPx9tjdDHUjOn4ycG18YFgN6qy6bexSjfVVVn60SdSEuOIBaPKq
	Jh+Xlo9wlG6RI7TrjvmieLZLutCnu+mPvUJWoNQc7Zl3vV8Tr37kwcoWcUnfBwi5FdMIUPxx7By
	eD3T/K+cMpi/o5S/um5Y9ZLZDMZuI7ZmDg7CPPfGAJddJy8z50gcXUC5gDeWnDHL/Ve4dy33aJ2
	NpvKuCcmTlSQTvcYv52nGLeNfDDOrqkOymJCEayY++nd3CQCO5ZBI6lQ1mRPAkR2m+OhcH7Ys3q
	K8vPT6zNIiJFFnh+P853AiXS4uwrkX9k9LjiGyiJSzlXS93p0HK648qLSue+XB7TFmTLRzvqbEK
	DLZFYR8jrmjnNO8nYHnMPJyldBQEZGhjEP6eJgY3H74ZORnqAMDhLOOvzYwOWmwQJiSeIJ8IdXo
	Ik29L9PYpHqLgC+Fn9JKuSDqsdezxxd8nR1eGcoEDVEBZ7TKh8zE1JGGVpPnJjPAH2NiThF5a1U
	FZR88OBq4xXl4X67Vu1FAqN9LrAbCE/4frfyaPkmfu6Zx+LxYKnum0wgWonqqrw
X-Received: by 2002:a05:7300:ae81:b0:342:94b:aa28 with SMTP id 5a478bee46e88-34ce0839716mr3045112eec.27.1790800651707;
        Wed, 30 Sep 2026 13:37:31 -0700 (PDT)
Received: from arch.srmap.univ ([103.217.237.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db5016caasm1242147eec.30.2026.09.30.13.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:37:31 -0700 (PDT)
From: jahanzaibmir <jahanzaibashraf1318@gmail.com>
To: brendan.higgins@linux.dev
Cc: david@davidgow.net,
	raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	jahanzaibmir <jahanzaibashraf1318@gmail.com>
Subject: [PATCH] kunit: tool: remove unused JUnit imports
Date: Thu,  1 Oct 2026 02:07:07 +0530
Message-ID: <20260930203707.38766-1-jahanzaibashraf1318@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JUnit output implementation uses ElementTree directly, so the
xml.sax.saxutils imports are unused. Remove them.

Signed-off-by: jahanzaibmir <jahanzaibashraf1318@gmail.com>
---
 tools/testing/kunit/kunit_junit.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
index 3622070358e7..b76748947d65 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -4,7 +4,6 @@
 #
 # Copyright (C) 2026, Google LLC and David Gow.
 
-from xml.sax.saxutils import quoteattr, XMLGenerator
 import xml.etree.ElementTree as ET
 from kunit_parser import Test, TestStatus
 from typing import Optional
-- 
2.55.0

