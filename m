Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55325F7A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131625; cv=none; b=bNJVOJHQpBjBdChD7EZkApQ78eRn+EE5mHlW8drkivBMtghCIAKpeJ9pe5k+wypLsgx1FM1JBjYh+2ouEWdi3VXjpWCCAgjZVHJABD+mVbNsLKv/VSkhqbwrzcHR0uvjmEsPyC+zVh30UfSPOmTiKYZ2U5Hiqv+doRFtKwOA8To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131625; c=relaxed/simple;
	bh=3zeMyBKvLgLLXJA1V0VLUKtMJTw4hK3/UkM0mSPI2rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qi/F985JJfrCa04ZSukhmFasOiHZaUMMhSJsWqUJN+SN4Rn7E6bC2U3w4L1qHEIb+WKEt6J3T3qNC3ClWvBgPiB2NtX3QFQNzXo2/IG3VqVwjb68BYwGFelpddAkunHg7krlJJS0eE8F9HEYnrE1LHJIzU+5jMiDMr5+G8NGTgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QK5RE31a; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QK5RE31a"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6de1ca1b05aso4086713eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131623; x=1792736423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6SN/KpXYwqFGu/PcKsWLHvjOsjkk9fljQzCBFaBCoM=;
        b=QK5RE31a2bGoSY4IsAuMWKQlKlnU4vsSfFp5ytldfqGaj1RO75y62RpKqqXbUM8VNJ
         aUyAu29jEYHfsJ343nqXcc5XjuKR7XYa7rSNyspTP2HMbrb+ifQomHcY6W1UGyMUPvaS
         R+2GWyV+/8ulqDhf2oJPuh9FmqAWdnvOdG3aH7JjgFXXdDlVI0E8tg7EFsKPqhW2gKiH
         XmNby934dNeuZ0RQrfAE/MEaqJ37hF+Fqnjvtm/4z3bCGYCjhxSKoYk75M1ansAXYq/Q
         Ni3WqCw8n51hotEcjvMSUZwqBeTNXWbR5VKIzVSnK/MdKSALRaUImOQvDw9muYViYL77
         Gk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131623; x=1792736423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6SN/KpXYwqFGu/PcKsWLHvjOsjkk9fljQzCBFaBCoM=;
        b=zpfl/1vuc+SO+koMeeWSg8Mol51c1RsO/okx3/+mrqx2PwRwArQf66KaFfsQqU1FyI
         mEsZuMdDAPzfamXmIBPplWgEkPxheqsw/vzfuHcCoXVG3YIUiWfiblKzLWhBvQvFuAEW
         9o4GNLPgOfT0+Z3K0fZG8wKR9jzlE47A6mNcDh8vGQK2YqOxyaejMbg2nOsU0dIA3qS0
         ymO0d+aHtWmU8CTOh8uePS7LCQ8jD7gat9wM5r4iPjua+gPhKnUNwsDMjYTzteKK8den
         7I1jDWiDYyTGfhXd+kAFE2hRI+pgkfENt6YRStdw1MnB/XjmVgUnIk8gmcipQhnq6Tzg
         TWdw==
X-Forwarded-Encrypted: i=1; AKwUvByRlCl+XiMXe0bAzujjkeaIgiNj1sB+L8vAYqUaWz+jkaGp3yZz5DyND19fwj2tAGLhG1MF7XH1q+Ovlm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNXhIhtGD/V6IacW7dcb2vYXEApnVCBOObMEZZySmSS1AHngI7
	4BqW2NcIvrYuQNa8ZdfqJMAxbyaV3vXWiLCOhRrkt0E05ArgdWJ0xtkb
X-Gm-Gg: AYBFou1YkFH3cUCgNEYpI2tLpNtwJO7Rkz5F0Sk4127U3R0HiryWxJ491mF4ZrnTnir
	MYxwlgt3Sbivw6i5g0BrXXN7YW/pF+e+WEvHtNtPGqHdIRwP4Y5swWpX9NertlMiJJJIPgQGd59
	OGeRa5qjm/WIMcbSsBgVz97wHjVG06Bm955Kbzi1exTKo/5qBEHtRonG0MoeAkTVOxTfap+oSu8
	54D3VFill3o7FWwVTyKYAaqSQCTQf88mvJRLmkjOSx27bnBSgutIyoTt2kP16LMorsSGupChcLp
	jxUipKzWydgfhw3LHjGU3isv5SAN6cCPmpZSgCd1OqhkalMDcwbVTBswQalplor9skJtgIrC25p
	tPz/uYLiv3GuLvc7SDxCD+PgF7a2puxZhFpT6keQfF7h7vqe45dqoibk35bzetHT7jHAS2ymAjU
	V4I1LlZDb13yr/RJuVVp/bf1ccm7xIb1zUZv/dFLABonJrmkDNA3x2rdLVjcU48wq3HMdA8M+O/
	2qm3jn5aMoITSuID0X1ak8GqdLaMLq8gDkht482FTAfeNLvjc1BBFx65Opcig==
X-Received: by 2002:a05:6820:1844:b0:6f8:ba93:bba6 with SMTP id 006d021491bc7-6f8ba93caaamr8747789eaf.73.1792131623016;
        Thu, 15 Oct 2026 23:20:23 -0700 (PDT)
Received: from cr-x-ubuntu2604-client-2.dev.fyre.ibm.com ([170.225.223.17])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12e12sm1002919a34.23.2026.10.15.23.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:20:22 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: akpm@linux-foundation.org,
	glider@google.com,
	andreyknvl@gmail.com
Cc: elver@google.com,
	osalvador@suse.de,
	ckan@cloudflare.com,
	linux-kernel@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] lib/stackdepot : Remove logically dead code in stack_depot_init()
Date: Thu, 15 Oct 2026 23:20:11 -0700
Message-ID: <20261016062011.103059-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since scale is always greater than PAGE_SHIFT, remove the
unreachable else branch and simplify the conditional shift.

This issue was reported by Coverity scan.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 lib/stackdepot.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index dd2717ff94bf..0393801ab1d9 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -247,11 +247,7 @@ int stack_depot_init(void)
 
 		entries = nr_free_buffer_pages();
 		entries = roundup_pow_of_two(entries);
-
-		if (scale > PAGE_SHIFT)
-			entries >>= (scale - PAGE_SHIFT);
-		else
-			entries <<= (PAGE_SHIFT - scale);
+		entries >>= (scale - PAGE_SHIFT);
 	}
 
 	if (entries < 1UL << STACK_BUCKET_NUMBER_ORDER_MIN)
-- 
2.53.0

