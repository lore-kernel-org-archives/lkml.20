Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D22882AB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986918; cv=none; b=HdDncoCPQ2dq6G4yQlHsW2qVVPxmaF6/hiibM93cQ4jMJF39zX9HV1LFic9ZsvX1Lo0Ueh9XNv3B+kY3A0PW1g8ii5kDkIAFRV/W4o/QsBCGDkgUKBzbcBqJiLQlvSKk7d/ZK5++Qj6ykX6qccDme9ldWbGQT9lCLqlCFmCOsu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986918; c=relaxed/simple;
	bh=gmdJhuSDn/5Fcf0Bx6krJHLn0/JjYDjM40D5C7iJeO8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aVdpxTRF/yU2ZNIn1QvI5w0Z/kCuLFjiz44QX6gYJ/Gfa8CToVIWTBZqnytbF84tfMayLg7vBMd+fpHkqAEVPvy6grGzwIP9l+agQHaKzLCrWaoG5df3EzOkm5PIJ84F5PTf6OHlflX/qQcZz7qn9Ej8RLqaNxp81mZJS39tt4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G2/wH60Z; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G2/wH60Z"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7e6720b31so73405a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986911; x=1791591711; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoV13e3nXsd3llTg619zxCPg0yBMRrfboFWdssakaXQ=;
        b=G2/wH60ZY79uFwm30ANWYI5KBfapWeQ5hkGmyk27+QQvsjBnbUPSHAHd+A9lqdKhJC
         goANF/PRX0QsGPSM/J0BoUHJV8r0s/EvEu9cpJ6kCj4xWIuv9uaG10KpCLjGahYuBSBH
         ipOR06ku1mGuyVYfXTFxmBtOvMTl2E/AjnI1kZVI8dH/LloKiElIZompJ1/l7itoG64d
         wsFRck4jpCoycIMGvU9HwwfWoRhCgYGbu8PdLwadYlYGn61yBmV+M9ZAsXfOpHWgG3PX
         Sp7X0vKdJ3RBb1BnNykcNuWEmIJIsdEFGZ0aA7Gbg+h/y9hxTnGfLpxOX978xKAPlluy
         HWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986911; x=1791591711;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoV13e3nXsd3llTg619zxCPg0yBMRrfboFWdssakaXQ=;
        b=XF0ATj0S2oUI48gEbfrMqjVPOjynXoeGhuxXfT7P69ZWpBmJALW+/yIU8B1nvK9Fjl
         ROvYqt10X13EGwVfM08gFXEUlzRqhke/vuZwL6MhoJ2m6pRKnr/cmr8vzmKu3jck+Doi
         b/6End8827jkDn6sB707r5QGAAUjKfE8KNALKDz7LJ9IRKLlHWqeEnSUN0Zd2ZVGhrX3
         +39Q8WmaaqotINVtwsvRgnEHIOAOoiCZw3m5Jsrj3VcFnt7uwoOqd8dkv71Jizu5t3a8
         MfVREhJrWI/ZZFCIbccSbNn4yCJdH67QiZaJgDBrzDaXDacXyj0UV+Ji1g/vZBXRq+6e
         fvtg==
X-Forwarded-Encrypted: i=1; AKwUvBxR2tHxl00AQ+jhWRnksCXSIzdxIMExU0DMbc/npYCm1XxunMxriOUIceItw6NzFmv6uS7+gBqTRk08Vi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzpDKYaaGxD0AavI5OogUta4FO/zLXv7sfcEUKff1z9aEAjZwe
	cCMOAUtDDKMM2HyDHGv0RKi+uqiCFRJaSKemJO6TA5yBrg+jW0twrLpfCcHMwEd22JvydRdtFCV
	pIYLhI3MivjIV5e+i2UtKdA==
X-Received: from plbmm8.prod.google.com ([2002:a17:903:a08:b0:2e4:a5f7:883d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:181:b0:2dd:c053:d73f with SMTP id d9443c01a7336-2e49b681d7dmr43902775ad.38.1790986910713;
 Fri, 02 Oct 2026 17:21:50 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:21 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-19-jthoughton@google.com>
Subject: [PATCH v2 18/20 DO-NOT-MERGE] arm64: Drop BBML3 requirement for HVO
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

With PMD updates being done with the Access Flag trick, BBML3 is no
longer needed.

Dropping this requirement vastly widens the pool of systems this
optimization is valid for.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kernel/cpufeature.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 448d4ef085de..f3fd6d0b0e41 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2206,11 +2206,10 @@ static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int sc
 	}
 
 	/*
-	 * We need BBML3 to support Block -> Table transitions without taking
-	 * faults, and we need HW AF support to support changing the OA without
-	 * taking faults.
+	 * We need HW AF support to support changing the vmemmap mapping level
+	 * and OA without taking faults.
 	 */
-	return cpu_supports_bbml3() && cpu_has_hw_af();
+	return cpu_has_hw_af();
 }
 
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

