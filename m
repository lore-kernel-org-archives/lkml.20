Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E05A5136
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894643; cv=none; b=Bzw++LQcc+1HfCevhJVXeQ8V4KeXkEH8fZymSmf9rpUPKV9dm10oAtStmnRZ+4cZl2pozemEgji0F33YWYMVDpG3nEeX+AlapSRSfwoY61chnX8CPUKTlyrAVqj5gFVovfnLi8CoQbeQLH1YNKTAs1K9UD7le7DojSoKxhxbmcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894643; c=relaxed/simple;
	bh=/VPU7Rkj6vLIJ5qAiVTp1qZlJHmo5K0QLBH58A5WbIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDmIckWfXazgwF2XicPR8UbMDtMhL/7yBxGYxDHECnuJVFpp8wp3NiwBQ50JCPuhCkdwXRDjW1IqjKoej3ctOa52tIqR1WJ6VItbD1byThPlTHeesc1BopuxPVGPqR4od0AmEQz+IQ0apxfwYRXrI7JbKqMFLOFuOiR7CT0BwWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nho+t5dj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nho+t5dj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48586861639so3200093f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894640; x=1789499440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=Nho+t5djmFBjlzuc9iUOfvFpHwed0UrOd05woZ5UBnyJHd84mGzmfdH8eYXtjpMkx1
         YR3vr7oWYcaT8Qf0ZM9eOWgSfYqGGFSo7aNDbWPFFj6/AMYt/NGZu1y4jvic+CBAVQLd
         VTY2scfu/YPLy1lld0GQXhLJT/kngdMe32B7uy7HtZxUI+hPAopQ/C2zUX36ayOs7OnR
         4aulaazAdnGuoCqbMAktN2xXN/c56naeAJdBxHDfVddMU2f61hNNubMLQ/+n2Th0jwoj
         p/dHDhKtRHLGzBue052ytafm6sNSy3JjOPwfsPEz2py04FWKCa70c0fOrtlUUwLZc2LU
         Ne7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894640; x=1789499440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=elGqr8mY//GegsgECpPfj2zM9Ccp4ZZnaJnBVt/BdRTOm+GEjxGto1q1JhDWPF1y6L
         raFhT6UXfl5JVKmI076Rq+jigI78yoquDSsa/9421AzsIvstg/YiWRX4zeLjPbVjieEn
         qPM0PBryDJ8EEaTKncGB9p4dODTEd5QoLcSsTdAE8GYPEOH+BNc2ZulcEJ4S5ySTgqIT
         s+6GpFl2rKo9auCO4ZWIYQHNahVwIyBywBKsP20ONGMJAA2Lyri9RGHxS++ydSqejbpV
         wSGh0GxLDROBXP9JUikdVnM7M8bEKEu+Q5Db1DZ3K12j1Y/Z+ykVwURW1Ph5hLnTnNXD
         oc2g==
X-Gm-Message-State: AFuF++nmwPOveQwk3t5TBrncv206Bn66iS53YTnJ7DaCNpIUJfp1OFB3
	W1seERs4hhHwnmek86nosuuxRKiopzXBErgNFlBwtPamU13Sc/Sd5kR0
X-Gm-Gg: AYBFou3WNvZTx3G7KGeX3dkTpnLo46Jc3Fy71dsBMqo688ntCLCbVDZro2usSLdU3j+
	PmNkYG8HXc2fvRhtJv8Q5jOCYPMIN6bBqsME3iw9s0hXbiWTxU0muB6gJIq04g1hpbTHlfX557K
	anNow2irNDvQKujTNRO0G2WmpOd0b7YA1dQtgOI5K6nJrHmflaU4h8VNnxj4jIAfOI0MwUPMU0b
	Evvsa9eGAjAKHVGkhpXOKKSGPWmr11AhhAmS9JcBD35Nwd6Zw4k2Q54K+FcfJWHFqqAWtsE9ca9
	EUNvL8YNN9FpG7/jCwBTjvF8Jx4LebK/bX7n4LZm2WT87tUwBu7BjshhDAtcha9vWPeEj+3MsEu
	a2/PLQqDfn42wCNliBO+CeTwetcGyPRK6IbtZDXg9BJ/8lZs+86oKiEg+khRuZQZv/AQCdkRc6R
	N7nK2eiybSGufu99+kfL28KOuQQH4o7MmV5sPR3LVcd/6ON9BVK7BZRH/4BhZPWCeEXg==
X-Received: by 2002:a05:6000:2008:b0:485:8226:c69d with SMTP id ffacd0b85a97d-4858226c991mr39156459f8f.28.1788894640245;
        Tue, 08 Sep 2026 12:10:40 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm36778622f8f.16.2026.09.08.12.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:10:39 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: update TODO list for completed cleanups
Date: Tue,  8 Sep 2026 22:10:32 +0300
Message-ID: <20260908191033.13798-2-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908191033.13798-1-predescuciprian99@gmail.com>
References: <20260908191033.13798-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/TODO | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index 34c216e6d..8de062b47 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,7 +1,10 @@
 TODO:
-- find and remove any code for other chips that is left over
-- convert any remaining unusual variable types
-- checkpatch.pl fixes - most of the remaining ones are lines too long. Many
-  of them will require refactoring
-- merge Realtek's bugfixes and new features into the driver
-- switch to use MAC80211
+- Partial: remove remaining code for other chips that is left over. Unused
+  non-8723B AMPDU burst enum values and unused 8188E ODM fields have been
+  removed, but more legacy code remains.
+- Partial: convert unusual variable types. The channel control APIs and rate
+  helpers now use kernel fixed-width types, but more legacy types remain.
+- Partial checkpatch.pl fixes: several overlong callback and scan-list lines
+  have been wrapped, but many warnings remain and will require refactoring.
+- Merge Realtek's bugfixes and new features into the driver.
+- Switch to use MAC80211.
-- 
2.55.0

