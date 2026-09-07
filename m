Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A564746A611
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778677; cv=none; b=imuGQjI2Sq3mLwi74ya+Zp4BB+APuroL9o36t0pz+REel5JZyJAwEIeg8bvjNa2mCombkx+TSTkdTQQAsD9ezxgV9Raohpx1cVf5NFXmO8zw2IM9E7uPTM1vBaNAb0vPOiwNO3UuFIbQA2icDOFX3pCqz9WISmb7WmcouvsZbe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778677; c=relaxed/simple;
	bh=syzTCPf76miV9CWWGJGfEfziLpI1w4A3k4WXq3RHFG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PnehudE7vnv/m8xzWN1s0h5D6VxJ8bpfA9Ac+BUxSB7YhEyw9ISGS7XICroAOBhmzmJJ+O/r6SAvku1PkuAe2/C/1NmdGbeFDnssL7cKxEveiryNr+k2gvHYXjvRPg9N+TojTBKHArjL68eY4Ugh9SNeYUz5o2fX9EF9m8ZEF6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SAN6CeC9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SAN6CeC9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3114256a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788778675; x=1789383475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJLnGW9pcX8j15B5/bmzsLemLtVeZ3mcxy8gd7OV26o=;
        b=SAN6CeC9ZXkL1E4d5q90CRchLx6I1CAoD0v/3fGU+rXRXISR96RldI2ZIyJLraqnFh
         fk+Fq0JJy/EFHxmZ+aFYWOS3pTmX35H3eZb+GfxLiNODZfbeIrUoLLM7prF450gyXLuJ
         KPf64JyRdPHJnDkaWaTXZBMDBCn2sFRywZE04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778675; x=1789383475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJLnGW9pcX8j15B5/bmzsLemLtVeZ3mcxy8gd7OV26o=;
        b=KAmndSv7y87YfcgYgus/tS58kkKz0Wlj4jgKDPJt8yi3tdpctH3rGlOzYmW6PsqpfN
         hEz3VtVZJsPUp3yQ2TKPMHwtECkS/tZge5/9xl0ylRWr667h/Isx2ukbYRqHxt3EIpxD
         Z5JLuvjgXN7WKdoL7HM0m05qQKrlQLzSHCPAi627T4f9fX/xzz6TxFIhp0t8Z7Rkusax
         yFk6fvR7EZjYYRPw5UFrBuPzHjqYZkd3513n5akmqPAo3anc0wjEaY0ZmV/duCfpHqy4
         4qKKidBuNeM+Thz8XABRTyWdRwuMhaT2WYEMPvM8PiVdSvPCZYQX4MAvt6FpE2TC9Etv
         Hglg==
X-Forwarded-Encrypted: i=1; AKwUvBysebqkOSlccyfzVzhOFer9y6KBpyCd5wPO7pks2Yn5mj8qah12GXgWUPVPS5YXl66KQqRzz2aY5bSN4xo=@vger.kernel.org
X-Gm-Message-State: AFuF++mXdBuIkLssREj7++hnpzRPSgtKn24D2JC0xMlgwdrNhmLW1f3V
	90IlV4ilynrhCzpG170U7Q29VEd5pI+O3ArlEKpwdSze1TBXDbkpga/eZvo49gqLl7hCGwZrYaw
	9cLc=
X-Gm-Gg: AYBFou3aT201vrpmtytt/bKGifj5Xr7PCGmNGE8TYCTuq7EjNtCwqcnGYRvhXC05Rd0
	tWHlLhfgaafcVNlUCLcoa9c/nbSUgml/2fjCtiEZ0O42Jqb6fIQRB+8sxB8+0kcnaS+UW4JYemN
	/9RF1Yrq7qsXLT9Hau7xtiG08sWQbZUzlRKAvC6OeOWTVdg2r9XCIorGZsX4d/OI1hvRMppfrY0
	4hVhSeL4afUzbT4VzbMsMn5cjnf+IPdDmNPmEjWQE7MGpaeJJtl6yBrxbUQ4Osr25fRdkm9b6QL
	tPm/i4Z6u0/mzsrMYcZpV09CU2GLEPxO3rsLFtR4uWY9nH9nPcmDjlAsp3NeomXt9sh/RS2loec
	vK7ISLZuWEDf5FLCjtTkhgrblspcszV1D2kn9SMWYLFauNyx7r0nKEB6YvvKjB3lS2gLuvy8/3g
	OlwJDvJzSybP5XK2dH6gxlqEzKUSUikQJz/TnU2irWMHzQcpA2iBkTHW2yA9dEEuQkHa6CUpscN
	igI6Nt7Myr9gcPb4DBOe6PEvMORZ53ZWcqCaLRIQSKvlhyESx6hPg==
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr34448742a91.15.1788778674947;
        Mon, 07 Sep 2026 03:57:54 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:7fc7:d8d5:4877:bc3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b51eb40e6sm10343714a91.16.2026.09.07.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:57:54 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 0/2] zsmallc: remove old object read API
Date: Mon,  7 Sep 2026 19:57:27 +0900
Message-ID: <20260907105739.1793316-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zram reamins the only user of old zsmalloc object read API.
This series removes the old API and converts zram to use the
new SG-list based API.

Sergey Senozhatsky (2):
  zram: convert to SG-list zsmalloc object read API
  zsmalloc: remove old object read API

 drivers/block/zram/zcomp.c    | 23 +++++++++--
 drivers/block/zram/zcomp.h    |  4 +-
 drivers/block/zram/zram_drv.c | 56 ++++++++++++++-----------
 include/linux/zsmalloc.h      |  4 --
 mm/zsmalloc.c                 | 77 -----------------------------------
 5 files changed, 55 insertions(+), 109 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

