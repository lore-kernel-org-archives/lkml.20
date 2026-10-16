Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAC11B4138
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116731; cv=pass; b=GTKFgbkCm6PCbbaoZRMEPKJMiSBWXa/EsmreKttSDRdxhWLiClndlw4NAvQ/l6g5WyJldbzDbHhslUFa5bd0FVV0EiqKy0pJhqNNlYrFliHId+pxUkUM0kS982WrCuugfviTYJuAux+tTPjv0S8sdQGwEwM0cd0lnWr/cjBeIA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116731; c=relaxed/simple;
	bh=qU9eFHuBSKzHpCrHgsV1YmKp00u+14wepzaC757ifcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DN8fmRa+RY1tXiJZcllJ0r4yG7n3Cv/u+lqHvLRTA1ocU5RBv5IyZUZz7Jg2b4V4kuydnQRuDdX+Q1zJMJ9bbVycl+vTd2WJrkYQVl65qIHnflVyTxyNnZjMcFMe8W9Rl5IFu903/3hxpJ/8x7q/bg1mqGvob9kExq2scIVFk5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTShg4xO; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTShg4xO"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66d176f0569so663462d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792116729; cv=none;
        d=google.com; s=arc-20260327;
        b=TG37f2arafOusWgQwkA5EYYxPob+/r/60YsY31TFuOSnlT1dZCJq2eKUJXwPrYIUJ3
         dlj6fRC6+qpPlNVOkQ7ILKfRdSyrz/MZ4k6/yNHPYdDe9YmBZ1pLDQ1M6HvtC/Wj2wAU
         tn5bSj6HDabjNUBSDUk0SdcxSIfCPI7MFFKuSkfGe8EARg0odibrABVOMEA09cDUzk+l
         qDqGXItgn/l0ekw8cKxAL3AeZtNHtmWzK1nqmupKRr7zLWoRDOMSTrAj8tWQUb6Nr8iH
         c90GrrWBWNTuVyxzab6HHG/VzrkfZsdOx8EFGlchet2v/fYi1zX/Cb3u5kbiE/Jfkiij
         wxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yqTCNDtnip1f6x/X6fRxNszH5Gy+3+wzW4YU/97IeGA=;
        fh=5NuXpi5Xkjhwgm/513weK1JUl/RMFd3/5dJsk/sUbRA=;
        b=R8wmJccu5jcl7I9+4nCpLm/T2QIIaiOODI+XycW3EZ9yhIUpUHgFQVW17JUasu+FXh
         zekLgmPM4p8b9Zip/M3TbjsKamtR7XiGlnkr1DfeFqyOY8a2+5NILVA94a5FW21AEWkc
         satBgaWrn4JDN6ffBFmubdLRCKJuDIxGaZi62HOqy63YAqZ/GWTjWJUC/K/OuRA1Mxp/
         tesaRXQX9cljXkIP9bF9JaiHVaOn0vgMka5XV+a9B3Yb8q82HIHhi7WwCLqIHaEuG1ZT
         fJ4C0EQCTy3b0MsJtTQ+Tn5ExfzPlerkJKd46gU1jWJe6M/e06bHAX0WTuvaK1WYCRiS
         HV0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792116729; x=1792721529; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yqTCNDtnip1f6x/X6fRxNszH5Gy+3+wzW4YU/97IeGA=;
        b=hTShg4xOjAQrMvs7yIs+PAtGiI7ve/Vc6Tk/n0xh/ylOnVFUn45o3nVKt2U2xb7YDs
         opC4t8pFYaTbPzkwj4yTl3oKmaQp/vTRydjmfHm7bf9l0j/8SiRniglSc/z7RknjnibB
         JqMxhOWhT7dceRcWvx+f0Yeu93I4McWEUH5d7x4OsjepIofiM4bcrTVJomWCICNFcWwc
         5PCdsBEx7mrqOO4HJImSfX9f69JAp9NM8dyj5yYTdf2xdKgxTidJa+UOsRKO7p7JWy6Y
         7I9Cmq/WbeAsDvT7onwfuBhs+edzmlN30YyXPW0FaLJMCPlH3tnZUQ4g2lMIfBvCJEax
         VunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116729; x=1792721529;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqTCNDtnip1f6x/X6fRxNszH5Gy+3+wzW4YU/97IeGA=;
        b=V3YgGDk993duqk/ZSY25W6CGG4sb5yiaQo7Lpg8zhIZWohQ7mX6YYf3s6P3jIkqRgY
         9CtspqFanPm+r966+VTAiBCuVaF+vQkQhVM3bTRbaFHMwm+tadkGzsmwJOM5l+T1Gv5y
         Ie4seBJInUZLT9bZNSbN4Yjx1FmKkTNVIm/uQeWoJmd2gEcfCvPjtu4SUJy1ql9K/wEE
         AUwNbZ+1dsoaUAIqJFgNFVgTVm3bfUFfn2dbwL0a+GNA5m8AleVBqcXinMXapNI89/UZ
         H10KJyjU9Em0N5DftcAyFJ0AC9RYPpJ0Qcn8AztJHhKo68wIj8gwJ7bOiiP+jmOiLCk1
         l8Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzRSXlkQGPNyHg6+Pv+Tv2y2uJEsn35+Jt624oYNWmOQw4NnD+/gksVCxyZdi5sfE81+QJqNpvDxeWscHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/yq+l7bS2zitDVqL5Y9uk9eAbj7334mIMFJlTvwrKSb7THXbM
	u2+3L98N7k17CIIV5ZPp9nJVxz9xLXFWympWDqSmWbsonG2QdY0PjYW+XifLjbVaGYg4nL3AA7X
	xMGBeO2LO279nHSevtsH27rqmT81BcbNrmH0LX3bGdQ==
X-Gm-Gg: AYBFou2lqV3OX2awludqO32/O4wsEki9C0WWsbd7sF/a7k3wqsAnxblyBT5ZLC5gXGO
	qTlSb41jsmZWnJ5yictnBhHYLGKS/pqU1VFwCLUx6oTRDzpoi9afHMxiULQm7TgmoUyLAvprmzg
	rv9MK1W1HESsdZQyMo8uBK/wqhfGvEotyqin4xG3SW1Gbhja2x4pdBHTD6Hy/VXlmQRs8JGc+EO
	Zhdo3sR8EKE3uliUj1emAMZ67qaCad9F5C9QGNlEc7WNctSN5BCv9rxD/DPUPDtSFDCx15CMLab
	mJ/EuAfYT3IIhWFO7UkwhM969resI9kbb6evx98/f9nJyprfA2yfmlPg9+8nSX8A0AeZgt1VPOq
	9JX5mSFTUsTVmS/lOPyGdKI3uUeyfYOLiZx/MjyZKWGeJ83cXY4WQz3porzd0ITLwRIEU5g==
X-Received: by 2002:a05:690e:1309:b0:679:3765:f01d with SMTP id
 956f58d0204a3-679376605f2mr11650522d50.4.1792116728632; Thu, 15 Oct 2026
 19:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Reid D <skibletz@gmail.com>
Date: Thu, 15 Oct 2026 22:11:57 -0400
X-Gm-Features: AclHuK9osQiWniGHpbG4Ve0gko3Z_iWaB2dskCMVirr_QbHk7UbV_rzUGzJvXC4
Message-ID: <CAGNJ+_2p_qyY2xx0b7wgHg+PJWLSQzYmfRqk3UCpue2f6GchVQ@mail.gmail.com>
Subject: [PATCH] xfs: fix bs_xflags copied from wrong compat field
To: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Reid Downing (b1nv0id) <skibletz@gmail.com>
Subject: [PATCH] xfs: fix bs_xflags copied from wrong compat field

Read bs_xflags from the correct compat field in
xfs_ioctl32_bstat_copyin().

Signed-off-by: Reid Downing (b1nv0id) <skibletz@gmail.com>
---
 fs/xfs/xfs_ioctl32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/xfs/xfs_ioctl32.c
+++ b/fs/xfs/xfs_ioctl32.c
@@ -124,7 +124,7 @@
            xfs_ioctl32_bstime_copyin(&bstat->bs_mtime, &bstat32->bs_mtime) ||
            xfs_ioctl32_bstime_copyin(&bstat->bs_ctime, &bstat32->bs_ctime) ||
            get_user(bstat->bs_blocks,  &bstat32->bs_size)      ||
-           get_user(bstat->bs_xflags,  &bstat32->bs_size)      ||
+           get_user(bstat->bs_xflags,  &bstat32->bs_xflags)    ||
            get_user(bstat->bs_extsize, &bstat32->bs_extsize)   ||
            get_user(bstat->bs_extents, &bstat32->bs_extents)   ||
            get_user(bstat->bs_gen,     &bstat32->bs_gen)       ||
