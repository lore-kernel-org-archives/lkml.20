Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE7748CD59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526174; cv=none; b=TdiLt59JC6Y8sN9LFNcZC3PMEXsDuNshbm8W9oNhUwU5ecjLjRU2uVgqunogHoug2t091se6/PX52NtoTdk1f/1aptE4P4C35fKut7G4jlo5jw4/tqKyx4j4HHEdiHYv621Nht0X7Ik4yZ5yx5AML/6hzNesc1R8H/VicmAXR4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526174; c=relaxed/simple;
	bh=wiJSAls5dG/l/lqMBo30eyrMskBWYHsQm6S11Wjm4Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3NWmgHcFrIm2cN+auMg/W3aSUJGpK30/yt80N6jlTRQIIxbAqoEUPB9JX8gvB0WCgtTztUr1dNNTlojLozz/jE3PukK4x6GT0jByRLW0LP8sohnqcu1LMraDxJDSD+n1ovswL4mZ8qvry0ACsMEbgp2oz7UXTcMfIap+la1vEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/E0R1aa; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/E0R1aa"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso8279865ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526172; x=1789130972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z75uHTDJpbnqzAUrkWajIutbgvqHAjtR2ftrzWoM/Fw=;
        b=X/E0R1aaWMvFQQ7xTZLM/jtw+B675PqzKfYzsWVqmt4A+f4sxtBrlruTNhrlN17i7H
         8B+wwLRzqcdg1TEGem2WKVMGmfG5ttVwapWmW9BGRu9OAQNqlv9zZvmtGNPB53EbTTv0
         U8T1Z7jwd+61xVUXBj8Fok06LTLzTizieg1JvLMB8AUgH5tJZsmzZAuIvk/CrgftBnCQ
         7vzwbmdRce67wDxBE6Zj1MttKs/aADnz7YPkpFhGdVaUw1OakQdr7ZwgbwdKGi70af5u
         dYS66dgUdXRuYAwY7cdquOw8uy6A56BapfNd0ju9QIPq94cgBaSNtvrIX0OD2MGaSG1p
         KKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526172; x=1789130972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z75uHTDJpbnqzAUrkWajIutbgvqHAjtR2ftrzWoM/Fw=;
        b=aBw9pFWoVFZrO3eKhQ6BTaxzqHdWkAK1gZcXQi4JQk+mUFun8GWp9N/8vxgpIiXeJW
         qdvqLpIQzVL2hxXWAROVhz5eFYPHapNG06RdvGcfXYqk4QANnY9KmmkGwlszvVts+wuM
         nMFpUpOytnXhpHcJ1gb5coNCj/bqkxgs9rfEJPbk8d4Op5bK/k6Nk7cjaZFk2X2AZNxQ
         3n1k1JrcKJtrPjlsgOa82ccTaqyuRsyPILosp4ote5hhIkmlRaov8puKqVKyzOYQSHqj
         jKc4euHVQ1oims1Zf8CfE4Bv59awzv5t1tm2lV4W722QZRiZtpjmrfv/z5c0ie0T9jbN
         D0MQ==
X-Gm-Message-State: AFuF++khga6faWKOE2ZwLfARycf7mTmmPBmAEt3VPtL3k9baUk1JuDZN
	mo4dKiHHOdTRbkl1HiWJgwDQIgchPxKm521d5n6WQrrijyaBQ3vGLbw0C0GbGXN2KZ0=
X-Gm-Gg: AYBFou3X6Yz1kK04qO1tgjvo8ghdOfHqNCsEup2r9N8xhtko8mPju1gyq/74l3sdFtI
	rGaalFYdmUPGEIx/era22pm+7BxQB+tgs+o1BgSc5LDBosumIIRJlovBvAhNT1kticMxOCL9jF0
	bT0tOwrIgTGZhdR8naRlL9mLTT5Hhu4906gIa/a9s/MYT1LQlDAPmosKe6E8kZYNiFtUlEDYqB1
	Y882/cEXI7PWpiN+8T8DurKmsr0pqg/bUP15nws8cAr+c1VS3Hcj9m2dIrNpBMslaH7yCkD8tXp
	1uA/40FWbrPNSuyrj+fvq2VAWxSm0hS0u2HnANWMPObxOmAlG9OlunKnX1hi5t+4OgmXVFt1bH1
	yRP2Hwc3ZVOYka5oLy3b9xLejjFod3PCBLdq6jNUtuS4Of22tPctk0igHUv6pKRIEwhDPswry2S
	CIhXfRki4vgPeAME//V05zQ7rFm0VV8vSZvpThtfXEpvsOOnSnoPbsIpjbZKKc7TOpn1p3jEdAd
	wHrDhsdnOHubdo=
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr9955857a91.2.1788526172098;
        Fri, 04 Sep 2026 05:49:32 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7328079eec.30.2026.09.04.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 2/2] MIPS: fix repeated words in comments
Date: Fri,  4 Sep 2026 18:19:20 +0530
Message-ID: <20260904124922.10256-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124922.10256-1-hemanth.selam@gmail.com>
References: <20260904124922.10256-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/mips/cavium-octeon/octeon-memcpy.S | 2 +-
 arch/mips/lib/memcpy.S                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-memcpy.S b/arch/mips/cavium-octeon/octeon-memcpy.S
index fef0c6de3fa1..fb27126afc56 100644
--- a/arch/mips/cavium-octeon/octeon-memcpy.S
+++ b/arch/mips/cavium-octeon/octeon-memcpy.S
@@ -60,7 +60,7 @@
  *  3- (dst - src) == (dst_entry - src_entry),
  * The _entry suffix denotes values when __copy_user was called.
  *
- * (1) is set up up by uaccess.h and maintained by not writing AT in copy_user
+ * (1) is set up by uaccess.h and maintained by not writing AT in copy_user
  * (2) is met by incrementing src by the number of bytes copied
  * (3) is met by not doing loads between a pair of increments of dst and src
  *
diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index 84f85aba6f4b..49408c0049f2 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -79,7 +79,7 @@
  *  3- (dst - src) == (dst_entry - src_entry),
  * The _entry suffix denotes values when __copy_user was called.
  *
- * (1) is set up up by uaccess.h and maintained by not writing AT in copy_user
+ * (1) is set up by uaccess.h and maintained by not writing AT in copy_user
  * (2) is met by incrementing src by the number of bytes copied
  * (3) is met by not doing loads between a pair of increments of dst and src
  *
-- 
2.48.1

