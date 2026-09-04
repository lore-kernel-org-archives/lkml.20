Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEFD37754C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525663; cv=none; b=OoUO0IlNjKRKtZIg4qpKmUjADo0LJIp7bXZNhXO+2GT+U68CUsOaxH9BORJcrAwz4ZM3YbjXmsHPHUBDrWIzF8LVw5w/TmhL8YMI1TjS3q6zFO2ezwDGCR9VpNbNx4s928X8jxNuy5f6ed9lqCSEWFOgDLgH0gImFUQkTjEl5j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525663; c=relaxed/simple;
	bh=W9E7oTbSIOoSr5ROfBnqOFjp+a55TyKIr8RY0NeVMW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4i8Zq4+omILIQcQ2tOzdoz712pw1u1K+nZ85ZlrUNZ0frh4TEvubfjpv8GEyRMZMet/4Z57TN/ErD1C/ylvUledSOIkJqrHE08MhCsUH952WSjaN3wtGrNBW1NAO/a7r0q/Jkwme0plkkoKeZea0Mz8juB8NZ5TCMWTNhRZzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XonATC2g; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XonATC2g"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so697747b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525661; x=1789130461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/o2hmJ0LIrPtpf95qcGGCcq5zc3JRhE9kQ0QRna2H5Q=;
        b=XonATC2gLtSoAx71i2zlqNRqBCE4mT+w3dggAeaZsGi0jhLtF+fKYWNLyb+5TeMqGr
         +9YuCaNdd5aN2y+/6RRJgpjScAxfMiUMdjO5O/GpFFRonpy3v5qqvkJ9fGQH9m/nFbvT
         lCpyXdb4Gwk2Ed89KZ2yA8qSl/S4eHbciQoH/IUXGq4L79i8TO1R+Ez9Q2Je2mcnSuTn
         ldddip7R+AZtsIwTSolfumLermoTUsm1FBasYxNn5dPReCozFmDqwXxJp43exWsFFMj4
         DIy+05NzmWa6XhY3jdkQzIjyetMNHioIa/f4xin7rEXztlIyKZaxkge0BKk8ia0GJ28z
         osAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525661; x=1789130461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/o2hmJ0LIrPtpf95qcGGCcq5zc3JRhE9kQ0QRna2H5Q=;
        b=H3E9CL7g73E4Gv684TSs2MVgDJJIaCrA9nrg0Bs9wq7FB5U0DMuoFdT7XnEkbZKw9c
         lfdzNb5JPN3EvssUceY+CS73F5wFKpU8yNFXYCAofpagPrXh2zbwLAQwEtv/7vtJFVNC
         kDOdcH/jKiUtOMGIsN/Jl3FJkA4rEkEUqzuKYy0HZfstWk2nb3NkOWGiKeC78KXc7kb4
         FUeVtD41Yn6MRpuTf+zQc+pnoOC4tiSdjYiBUNMf1ny1lsH0UiTfbpOC6ij+ZwCjIe/L
         U5OCOZisP5UImfn9Z0l/jQD6j3sXrgNlWdNLJqWlQt9Vd8030Qp8TkT+J9gWUahP477/
         JVpQ==
X-Gm-Message-State: AFuF++mtlMk5/OrVT57h0LKqtkOFWcSFDjNPAqdlpmilPghqVWlUo0Hx
	lgaZvif6cJWWm7SMJQQIsYFkvc/+mzYvABJ/kuKNGEAxKgUSagCI35IC
X-Gm-Gg: AYBFou032BCWxqX/Gsk0ApsHR/V21G7loNHsK8r5CYwx7SNTcmMG5v/bGRgTWZgM0IN
	WB+S93kIgsQFcdkcnmW9M4bUM6jqGRHUXOHNleWrNYGkdfKXX63EuODxbj74ftqOda2GMqofbbq
	QUEp/WCLPEaOd1Dn1VVyMOG+hwaAwF5tpjAjC3EtXvpCm3Ue3J5ukyalWwMqUK1xSF7F+Co7euS
	U994kYwj7lDn1C1oLl1NEWeVFRDZUeLMLwaqicyrvbK27L7a10mwEVMwIy6q6/gvEAyu3F3yTAE
	+RdKyxKeAuCbrmVxMHzlBA0WjGd6phFyVJLnRsXf16Jb/jHcd4f5PiotN2EBmegTZWTqHDaRgkC
	EPOjtvju1Qj95MpNDYDD2bEvFp+YdTbgi3sHYyHpDsYG3DUqUwWgVc2wUUiahEnH42Tnm1l7Hns
	rM/NFR3o2Ps7gjlrjTrt1LvnJ0e6jW6G/TMxqhTJMwLeRxZQGldEPIrjqqiaQP4qj3q2cQ4LcEM
	grLwWt1qOYAU9M=
X-Received: by 2002:a05:6820:a50e:20b0:6b7:46fa:16ac with SMTP id 006d021491bc7-6b746fa1b09mr1628291eaf.65.1788525661030;
        Fri, 04 Sep 2026 05:41:01 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432437d0f4sm6185774c88.7.2026.09.04.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:41:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH] bsg: fix typo "deafult" in comment
Date: Fri,  4 Sep 2026 18:10:55 +0530
Message-ID: <20260904124056.3929-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "deafult" to "default", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/bsg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/bsg.h b/include/uapi/linux/bsg.h
index 6cff77f5b857..b67d86eff33b 100644
--- a/include/uapi/linux/bsg.h
+++ b/include/uapi/linux/bsg.h
@@ -17,7 +17,7 @@
  * For flag constants below:
  * sg.h sg_io_hdr also has bits defined for it's flags member. These
  * two flag values (0x10 and 0x20) have the same meaning in sg.h . For
- * bsg the BSG_FLAG_Q_AT_HEAD flag is ignored since it is the deafult.
+ * bsg the BSG_FLAG_Q_AT_HEAD flag is ignored since it is the default.
  */
 #define BSG_FLAG_Q_AT_TAIL 0x10 /* default is Q_AT_HEAD */
 #define BSG_FLAG_Q_AT_HEAD 0x20
-- 
2.48.1

