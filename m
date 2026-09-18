Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1FC5172D7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750274; cv=none; b=VsD8NVVR/s+MmTw0wFRg2xf74HlTo0fecYHi60Z6K7zlEi6IxyTCic+BHZ6mBcPSOacPy/io8uYRVtWyRnYdvDVM21RGBXuY3wCyjyDSunU/kCATNpYjjO2V4tnOGr+nRGnsTZdZlnaImFkOQADIy24WCSA8CJFQnlI7EALu+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750274; c=relaxed/simple;
	bh=PJZCqNz/EWydbRV7255ZT5ETxs8mwt5+88gHtRiMO/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lLWQT5GL/werVwLq/HlGuiYmUhJtrsP9WZQJc9E8396TtQ4fbjLqAk4OkFodYJRZ7sAPYyfizT8NZdiH9EAOZVcxa2w2NM9pthm5XnurJoNKu2HnLzLDrYOk/F+Vz0P6wlq2bv3QTxsN0MLnjSzYohGPTz0ECQTcUHFnLPzUYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUpzv/yh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUpzv/yh"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fdc579daso10953925ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750273; x=1790355073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfsShWeiS4tZlSkNs80JEvfqVPZ9mGtd0aKlxlb8/So=;
        b=YUpzv/yhKsqRHI4/ibSJEZu4BqSN4HkqPCyqrLiBFYbiC56WrdMjhoCU5mVE0kVbIH
         LqXdi+ADbK85xG+s9cMp2HUsd/6Evu3v0qdUXLv5sBebSTbyWVYtYJqlmp/3YT4TblZG
         yvYyWIHQ+QjDnRSSYYWOUX1nEXatLfkF53yGYwlEx0VgD+YJCVxbTGal2N6nc9IKWYgA
         5QvQbm0JsBq4lDZ4johrDgVqT+yBRCp0IBBlooNHxsDLwtJGjvBfA9FCjra5A58jJqJi
         2xbTPWhk2/QGSMvQMvd5UuvAaJNpvCe8vIumEbXzeRIMios4ksgQcxmI/IrfRDJkNMlp
         N8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750273; x=1790355073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfsShWeiS4tZlSkNs80JEvfqVPZ9mGtd0aKlxlb8/So=;
        b=nnh8nHtpl4d/9f586ojD275mj1IHRwitYw4qjrtyFM9gdnQN0Sf9n88piDSZvqr3M0
         zAUcr+XonGLifWjSBLMv94LA5dbA1XcJQHgKKwoPrNh+bi5gqIBHHesiuM5VPgidzO8g
         Ybm5pUZez1zsqTA1EQv/czv6LCEtybcJ+ufJaCvRt/DPMrWTLr6ISh+4BO6e3nNEPiFl
         fy3AblbCqw45BxPRBDJfrhzUi9/QuU/iYvVUFetBvxC4J/ADaH3JrLP9Q+cQN8B4bHyG
         zvlyxOoT1Y2GbmCEcApem0SdVW0qtw/BQOSpxLpZglb9QUdcc1+92HXHyft3it2W+loa
         UBqg==
X-Forwarded-Encrypted: i=1; AKwUvBwI0im6i+OEtOnI6F5BqZCOHWYi511Q3Oy5xDaLTt1+hW9iVZxFyo56Ruz/b/gnijeuUuHSXWiFmRCOjlo=@vger.kernel.org
X-Gm-Message-State: AFuF++mVGtOM366GxaK4pHBH2lATE4Z0p8W49MYpYflgGhtQepZdqu4Y
	wjmRnclGiXOtUIUS+0JJ+BacfL5ArPSDhYFZ6HuRirOsOab5UYjiMwzn
X-Gm-Gg: AYBFou3j99fzPNuytyoaU3BffQ+fSqfP0/R4tReeVAI2ZAQDM0dQklmTNIsgFB0JTWp
	cKuvur6+iWkZB9C1l3f2wi5k19R3NIzXIZc3JtRB5Q0kx9m6kMNLasx+4FKXXp5qvk4Bnc8AEdh
	q5cj31MYc8Z2/TP9VtmeWiHU5E6VGcy86XjWmP0eJk48cWX57wNFVXEt9ue4UIhZ69qESIWvJ/n
	cksewR5nfNhSue8CuMzWSg6jAacEqhwQ20bD2jDqEi8sSyiUaNpq47fTbSw8Wim1sbCRyPkh/6c
	dGxmyS1BUdjDQaNLFeRm2ioQmzmNBkPSVYbTIBO62AMiSqAYXf2ztohh5h6fXMthvAL++JExX7R
	9boNgYdrKuwr5vxsbFLuoEd86DW/Qgz1Un9gNLHiOceiO3xbMlHVAipXdvhQ7nmWdPCvTZ62weq
	Ft4Ut/dtkTS2HdD0r8VNtJdvDL0dZt9Ng/CKucZ3/cSRDY2P16RU1o4QqgTvMv/o1O
X-Received: by 2002:a17:903:1b47:b0:2dd:ad74:ac24 with SMTP id d9443c01a7336-2ddb1be939emr75755475ad.31.1789750272857;
        Fri, 18 Sep 2026 09:51:12 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddba2a8c5dsm9630595ad.29.2026.09.18.09.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:51:12 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs: remove unused vfs_empty_path()
Date: Sat, 19 Sep 2026 01:51:03 +0900
Message-ID: <20260918165105.1013792-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit e896474fe485 ("getname_maybe_null() - the third variant of
pathname copy-in"), vfs_empty_path() has no callers.

So remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 include/linux/fs.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 05d05bb9c951..ef8eb5af06c5 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3653,23 +3653,6 @@ extern int vfs_fadvise(struct file *file, loff_t offset, loff_t len,
 extern int generic_fadvise(struct file *file, loff_t offset, loff_t len,
 			   int advice);
 
-static inline bool vfs_empty_path(int dfd, const char __user *path)
-{
-	char c;
-
-	if (dfd < 0)
-		return false;
-
-	/* We now allow NULL to be used for empty path. */
-	if (!path)
-		return true;
-
-	if (unlikely(get_user(c, path)))
-		return false;
-
-	return !c;
-}
-
 int generic_atomic_write_valid(struct kiocb *iocb, struct iov_iter *iter);
 
 static inline bool extensible_ioctl_valid(unsigned int cmd_a,
-- 
2.43.0

