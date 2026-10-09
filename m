Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37113BB10D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531082; cv=none; b=iZBTt+0+nxSeVzBIcnHpXG1/DIO0slHyntqEzARKhbFYlCg/gTPNEUYOZ7lW9eZWVv4tIlTw5rREJ2RBaCEWyK+ZRAWtuT6w+VKE6H6cMlFxCuY9E9DqIL235s6qgAc2+bbtXtzbgQzjQwtwfQd9WeMTNqCk+k/BT4F+bzB8rNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531082; c=relaxed/simple;
	bh=BcmW3b91oM72Iku0groZz6A77z1jqK6pvYSJRHrTcLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rM+AIgWgr3zUhaFvEIF/q/GzhM1tPtYcx4SOgPDeRHQzInEXSTDQBDU1Ntiabd8DhCnC0LuwZY55jZWWU3WNNYo9JKAdLdfDRcp16OciaapUDjsAB6IFbA6eKreacBS4Iw4HUZ9MTaPM29AVtZpck3zOdBAMO37AUHu4DqxuZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDGPd5Wj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDGPd5Wj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so6116066a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531081; x=1792135881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2kzGm0pzKQj59Ju5/ds69Z4jxb5t44uQPLNR0z8/S8=;
        b=YDGPd5Wj1a8PBGCk58z1K51JqtVRj3d0jJGZiBQ/eo2KEga9YJNEPIUVrpxE7BWCzm
         fjlhuPLdGQ2K2ZkcBUg+61NMNkl27oCx0GMUB2GBIIbKAlvW+U03eOs9AVPHxfcUgr+y
         T6oeIiC4NfBb3fH4dYobpgE+bJzHPo5iSx/G6b/Gs+Ca/NR9wab7HptrwDzr5HMA0r/P
         IGCxoDq6Ey42OHi7SI96uPNfSxghLxSNJnHjRpmLozzlIb63V1JxQMiwzJxyfcTrqySP
         +aUKjN9ei7eafYQ1YBsNBpQh/GWrRcXWiYZqnNVuM4Xpum7Nz9CEd+dvpMPRwir6kdqh
         aJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531081; x=1792135881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2kzGm0pzKQj59Ju5/ds69Z4jxb5t44uQPLNR0z8/S8=;
        b=L5OEMd9hTqFhlKCA0DEUY8RkS5ZycEa2bToQiDnFqEn0cpT19yEFVcNmd30xPJ+JNV
         JB6CG7PIgDFLK5i3o3gAOkJdgTwHpiK5zhGbTIQCUbnIIdWxs+Cd1ChEyWwA+NyPcFHf
         26I/sNyvA/UYd5wii/mHZ/lOlpnvfwvlIUzaU9i3wJq37+N8xs/86LHZLrComEh23gdG
         GAHNysO2x+e3IBTHxNwi7yeU3MMJoX59yGCxLBRf3zbng93sz0atdYH9q3K607Vd3wv7
         qBeH3sDDk8iF2iyPYjwvpD56vknAlmsA71MoK9fNdkwKZzduT5aq/rSJX8OYf1JHff2f
         hTgA==
X-Gm-Message-State: AFq9FYKw0bokeUqGrg0b032E3zbjxraOUoXBTK8maxp4W9ak/QMPlihY
	eWOXy96Ar9G97axnvica6MA1qHzlogI2w790l+uBTjL3iqYGhhmuXZ6I
X-Gm-Gg: AYBFou3bP/lM7PGn7P5cQZZl99+lS0TejkDUcJsnACQwDiROWfEM8ADC/maRInez+M3
	AsvohmGyB2Jkb1w9qGB4LOgB8H40JDzOD5L6RBoHA9A65dEmXKKvWNSR6jz7NJgPCaK2eXa+zMo
	vwP9yVhUQEWLvoZj6HebeF4dWz+FKuEeakRXjzp4qdmKDwANySirISx5GATVDbMrBDYajq4pV8q
	Bsb/fTc2ms5FeECq+ebxMIcDzj80lq6qJptScIkVsEyI64VKY/p2ceBX+B47aEIJFLdd6on2/jc
	gemt3yKLiywaAI0z9eFMjFaba66/JMbj5saXpgZgnT1SWnP5ok5yqK1F60+Gm7CJHLngy+oTFCC
	BRfEzOz09Uq6C8zPCd9/z8nU/yrfsVB6w3UPF3xPsU+fdhqS+8/EtxJ2xjDkTopcNvpAxQLq/NX
	Y7/nmekr+REZSzjg2hV+pXumznIn98N05mkH/T3Ki80oHewvzWZwdU5D36Hf/dy0/PYFPHJ+U=
X-Received: by 2002:a17:90b:2d08:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3ab3ae36b1emr1096672a91.58.1791531081056;
        Fri, 09 Oct 2026 00:31:21 -0700 (PDT)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm1433458a91.0.2026.10.09.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:31:20 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] lib/test_meminit: handle kmem_cache_alloc() failure
Date: Fri,  9 Oct 2026 15:30:40 +0800
Message-ID: <20261009073040.2995938-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In do_kmem_cache_size(), kmem_cache_alloc() may fail and return NULL.
The returned pointer is subsequently passed to check_buf() and
fill_with_garbage_skip() without being checked, which may result in a
NULL pointer dereference.

Handle the allocation failure by marking the test as failed and
continuing with the next iteration.

Fixes: 5015a300a522 ("lib: introduce test_meminit module")
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 lib/test_meminit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/test_meminit.c b/lib/test_meminit.c
index 68c3b9da090e..db4b4398e1c1 100644
--- a/lib/test_meminit.c
+++ b/lib/test_meminit.c
@@ -241,6 +241,10 @@ static int __init do_kmem_cache_size(size_t size, bool want_ctor,
 		}
 
 		buf = kmem_cache_alloc(c, alloc_mask);
+		if (!buf) {
+			fail = true;
+			continue;
+		}
 		/* Check that buf is zeroed, if it must be. */
 		fail |= check_buf(buf, size, want_ctor, want_rcu, want_zero);
 		fill_with_garbage_skip(buf, size, want_ctor ? CTOR_BYTES : 0);
-- 
2.43.0

