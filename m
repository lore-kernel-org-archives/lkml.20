Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBE9372ED3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786048; cv=none; b=EQ3oTo6kXrW37XPSGPTHatmo2Kr+0ruxKi175geFRi3pVew3sNqskKBhjqZUu0iLz2vURmQ0d1JA+R0MzEitZRC/dIcMBX1PER48nF2otbfjcqzTVP4cFUbmKRzbPejw8mmfxJkhIcZoUhkVs4M+vtge+4/prnu7ctVtZCAnS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786048; c=relaxed/simple;
	bh=KjaORzNmIC0hbf9pMq5xRub4erK67RsKQRLJdDK1qSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9p0Tc+3c1yxkxc4DYVMJvOYY0qC5vJ7PrBcwrB3gL7fXyO4Ee5BLDmmCpwh4HO5z2QOM7tv5rlaeMeNdqa70zAZIgAwjgqLHPIs4YSvA58+/7G/Hb6stEpAAAHl6Kax3e+ca3UJMKX7F290gYV8/nlqIwHmvdCdPtaRbg7n5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNJQ76Y2; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNJQ76Y2"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc7cc8aafe6so499194a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786047; x=1792390847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilUEX6P5SXdjM30xs4/YiTd6UosFP69OH0rOy8mkCZ0=;
        b=DNJQ76Y2PqmxhnZmiK7oAUK4/HanWySX1WrsBUT5hw4Ukkl9ys9w3FiTiTz5XiAOAo
         vuNsSGZxEuWFzQ7SwESldwzhwYZfWu20+WGWd5rp5ZYqCuYhCAOAiIC99x9PkEtUcFDi
         eJ+47ZuaPLfXHuxcz/BtxrKcEpQf4K2NmH99GtoJJNWCXgmPnOuZulayUXoM+mImYszi
         uYLLQ0u+OpUhk8T1znECEVfQk0s5mK8LVsHxXpxRdJ3kLiF3hCERec/C7oHhbIY/4spI
         tU4qINq6RfxcSVX4mFv7xR1FeOoRvczJALpxMT8aapP8uf0Osx0S+V26Bl5vpGhUgmOb
         UqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786047; x=1792390847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilUEX6P5SXdjM30xs4/YiTd6UosFP69OH0rOy8mkCZ0=;
        b=CgTAK8qwBP5O7cxTGvD5Hi85CoLyFRbMscJTpAgUdrAci2PrApazBKjhJ2LqMBU4vD
         2IgKZ4NmiZ+Im/b8hI1SZatPnCxHdSDQbhiokRPKt7Sw4F4y9kINkE88Op4R2VPQ4TCm
         6r9OksFCzgO4MWQRSjI5Dann982B2BkCFgFBg5bM3O4lh36ssWZ//rNsCDUVeFOH083A
         EP4CJg9dUqvBbgrQ5Siu/Xy7xFBm9WIMINdJhN1u3/I2L1r0nX8dlaRGp+uxCTULnG4y
         SX3vT5Lb+bhoE7+5EcPHqc2bh9PLUDsGZtaeW+vuYtS+87tU0396AtsJ76P9kV8ufcgb
         rXBA==
X-Forwarded-Encrypted: i=1; AKwUvByaLcYD7awqoxvCrVQR5x6NEtafsl3sybNw1qe6YJ9SkOSFDCAT2A3CzAA8+1LZNO8z6qD8/1EDXTTm+iw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGgShdG7r+8gDrYtIRJNLB1mIfjhbIdawbIXuqctovBthKN98U
	5brPY5d8DhKtmzZvfCi42CPHZ7zvjhM8a4mXu7YPnFKt1KY9AOGTsAzE11nh/g==
X-Gm-Gg: AYBFou3iwuABN4bSOhpvEp8iOQu+nkU3rI8AvLlsvpX9s+ORhEC+wsXpLezneVtkBKQ
	0fTmHK5SJg6IkxIMYwTb4QcZqYYSAPz+OclIu1elNt3Bc+zd/4+B3PhZ10Ptqg4FkqEQ9Aca6JM
	urH89o0As6d3syc8CIgBiAZ0OJ4xFgFaY/e535Czafww7vWQqAwQ1S+bbZYgQZu20tS1XQo+s9y
	taLvWqIXWwgdayVAmCcGLe156wcjUIt83D3I+oyotkbwKdqJZ/QOjcUYTls7r4zhY8NwHFXG4zA
	39FJ2hZ3FEgN3tk4912TvvpOEisYN09OJkXdVHk/QGqgLKaoF/Sji0DIQVSBssy6jGWi6G/CPv7
	Orrp+xs8QGqFgdqqSv+/mWp2ghZ4r42Y01BFHRh+8PUv3MN+jlpnL8dFRZMvq2ZvU4C48l5TFSc
	+nRDRy8vO59Z9Wyl01QiUJ8j+keO/wlXbPM6f3YL2HKarIylIyAl0uIWnL10lORaxxGJUpHR06+
	3lvOZPVOh8=
X-Received: by 2002:a17:90b:1e47:b0:3a4:ee64:b82c with SMTP id 98e67ed59e1d1-3ab3b06bb4bmr6635992a91.66.1791786046779;
        Sun, 11 Oct 2026 23:20:46 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d93c2c75sm3990091a12.0.2026.10.11.23.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:20:46 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 0/2] ntfs: enforce the encrypted-file policy on the read paths
Date: Mon, 12 Oct 2026 14:20:38 +0800
Message-ID: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

EFS-encrypted attributes are refused with -EOPNOTSUPP in exactly one
place, ntfs_read_folio(), because decryption is not implemented.  Two
read paths get there without passing that test and return the raw
on-disk ciphertext instead, so the same read returns either ciphertext
or -EOPNOTSUPP depending on which path serves it.

Patch 1 is readahead, which marks the folios uptodate so ->read_folio
is never called.  read(), mmap(), splice() and fadvise() all populate
the page cache this way, so one test closes all four.

Patch 2 is direct I/O, which bypasses the page cache entirely and has
no such backstop.

Both commits are in v7.1.  I have not added Cc: stable; returning
ciphertext rather than an error is a correctness bug but not a
privilege boundary crossing, so that call is better made by the
maintainers.

Found by reading the code.  I have no EFS-encrypted NTFS volume, so
there is no reproducer; the paths were traced in the source.

Zhan Xusheng (2):
  ntfs: do not read ahead encrypted files
  ntfs: reject direct I/O reads of encrypted files

 fs/ntfs/aops.c | 7 ++++---
 fs/ntfs/file.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)


base-commit: d6d3455d8751854e0d1820f14184682e23ac4475
-- 
2.43.0

