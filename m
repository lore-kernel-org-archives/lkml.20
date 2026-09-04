Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F829898F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525134; cv=none; b=GYrOtX6QJiJ5qDxm1OpZpdHtYF76dRu9SrAb8oziRo9qYiBW0mwT0RN7z/1YoH/nHs1frVJ8hkKdeYJeeZ5Dt50ShYTUr1sfdOTFOefA1aJI9ORAfBSIQz5poNxkOKtZKN2n1ZWj+AMdmTc1hlJpxN+tOd/BB4GLtC87chcLVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525134; c=relaxed/simple;
	bh=/VdFqbxI+O0ZixFcT1LjOZJ+yNNNUo8ON3GgDpLZOJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNXqZzpVdclmlc4mvdLkMjgMPuEeGrhH17IFqskQ6hnGow9D57RJ9YP2PlYDIXG/5OxJzP4CAVkLBWQTcabbYZDW3Nx76yeF8vrs3ZzGo27HWkkZI3Uaq/EfqDNK+HNeSUeGROuSzUziqtTczYb7JNnPGdsqT4vqcFKqLPzCUl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYvFrbMV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYvFrbMV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso681583a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525132; x=1789129932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxOASbJNctMhSYA5GtnhgOb9hrNORKE9UeLES6b/op8=;
        b=YYvFrbMVQa1EInEeRVdG6bNEpAvTLYXchYi9R8KWGV22hjMTf1jJdL5bjzVhgtMLEf
         DGLNtts0C/s+PCVifbVfz0/MOwum59/dVYwtIxmsd3i6X/BnjJpsJEDrT6VQBQu4/+Us
         GBTqU7xISgoE2lI8L3D6MAwEzdfdRYnvxWsF9i/HTk8RkSr8M50cm2XaZL1k54OJkGJt
         p6RM5d2sRty/JB8R8NkF2kDJYxizOR8Whq2AHHizSkuGK73h0OnP1a5g2AgVMpCuL9hf
         E6Y+6WKfBDpBrNRYgccLW28QDSPfD6PhkzZnesYmSYk4rtPFZDWgiOzs9lW+Xv72yPH/
         yJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525132; x=1789129932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxOASbJNctMhSYA5GtnhgOb9hrNORKE9UeLES6b/op8=;
        b=W7k/amm4XZwygrYuTvr/yVPl6/5wK1ykRlQgrdUJRDmsjRAxlAw7IQZ0MwNTjREFyj
         PFBFGWcLe3npklx+l2FKC8cIFn+pxDj4QfPrdDzPcPv175dWIA8aUqouAmJmFaM9vEmi
         b5VgsFTCGY8Fp2EIVhIK+ntw3Tor52jVrltC2nVtqNdTBUu2ZpTQc0mPu4LwausiNnuu
         F1E5t58PO1CXm42sNWNXC1o+X01/uDow5rzeeER84noRDNS9mfHLfThUfzy6ubCicBNg
         HXKXn6hhiKSW3cgz0OoS0c/BZxCx9GxVgxZiAJkpRMqOwNe2lA+hkwQ40zCiADWb1USb
         EBCg==
X-Gm-Message-State: AFuF++n21vf1905xMBjfs1qgzFSSR7Bqh5FCGNPGDeA3LIoHqaPamiWl
	3AjU2SIpV79gxEL9vSIQZ2aRAXQsfGRCRMdFFCqa7lq2aDkGJuXln4E9
X-Gm-Gg: AYBFou28SSOCIt8w4Y2Rx6aLKrnL+Ge81BXCPCp0gukO8qW/JsHkylrJi0NwYSJUSYy
	pkkPps7S79tAEUa67WBdLOFye1dAyqtQjAeQ+miQYuxnwq94K6XvXT3KYMz9mLeilfs7vVpmsf6
	sbdW/yOeWtvXDlJQmn+hQm8zgqMLffm/JHAamGqhfKmBvYMM2tEk1PBMNxm/0xJZMuN0oH0LCIC
	k5DkvokqQ2aJ+tTNzQpwwwJbT9WOUimt7xAeT0xoM43Vw+EZ4r1FfpwGpkzNH0y4m0UM9fFKxb2
	M/KcJLuApNmpP7rEm9da4VXN3mU3Owe0Gt2e5bQrL73tAvE6yXrJ4SESFnz9HhOSoPM3YLn94x4
	KymT+PO0Y4RA51okTUQDWKlKRfP1VdpK+6gh+zAi7IVK8rR4lQf5cRdFcegrNSwyzGc3YCcFabP
	tsS6Dkx+7hHdITt/WSljb4sr8iMdH5djce7M2n8ruetjHiUvqVl6/GvbvtiDniHtHm8AxNFMvOO
	zJwIUKapl5WxvE=
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr10115258a91.8.1788525132084;
        Fri, 04 Sep 2026 05:32:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6262420c88.0.2026.09.04.05.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:32:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev
Subject: [PATCH] mfd: fix typo "interupts" in comment
Date: Fri,  4 Sep 2026 18:02:06 +0530
Message-ID: <20260904123207.36203-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/ab8500-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..ceea1ae34dd8 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -125,7 +125,7 @@ static u8 turn_on_stat_set;
 
 /*
  * Map interrupt numbers to the LATCH and MASK register offsets, Interrupt
- * numbers are indexed into this array with (num / 8). The interupts are
+ * numbers are indexed into this array with (num / 8). The interrupts are
  * defined in linux/mfd/ab8500.h
  *
  * This is one off from the register names, i.e. AB8500_IT_MASK1_REG is at
-- 
2.48.1

