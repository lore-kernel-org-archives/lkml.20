Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C443C870E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901632; cv=none; b=cbJhhZZTEa/Kb7aOgfv/Q0B1IsUHJD7sltsJNBbZfM7DAPw03EeSL7LFe2mhK1p7+miP688G8RLBvY9iyBYaJIf+MTv7hVBAsoOtfifq6ZSzgvoy85m8UTh22JTsbZPQJaU/NJlO1o/WVb7cpvM79/MpjG7rhXYZrYS7dbEgXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901632; c=relaxed/simple;
	bh=3gZQe4naWkCk3PI6QwGN0Xy6nwQOLhavNa+Y40M9jx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8wDbyb/vR3Trh3fMkuDIRzi9+mOcN0j0cgtf/zBwgrCCAYg4fteeQdLjrY6sPUyrky3ZuHwDoVkwO1vBnr+e2nXtShu506OETAIICIAhu/N8OELbRz7xjPa2Drk+ulkhE3MAPfbAyEiqKvlY2hPOgo2l5IWT2hv/SNUu83+Lek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ic/wpcz0; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ic/wpcz0"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so560280a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787901630; x=1788506430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXsApZa8Vi5ynohBI7cN4DA/XtwNMqC5yo4nBQCk/iE=;
        b=Ic/wpcz0uSdCf1GimLs8tzj74RpYnoykAGn6xNtBC7QjugOXG8syM6KBhNxpHsRJeB
         Gxvgk7Td6fn8K0w9YJzAzu/i1O1qzMuIFv6dSeQ0TprU182bsBq+Q7i1aBQ51h838lP+
         zVljBpzaSVB+5y+gLCMYPbJNygqRv3ts6WuvtJUc9VAilYA/K+EPck96QaSIgtL0lX1b
         aT5X7e81B62cGJuyYDFfqNrlP0/p3rY03CCB9kmnDJiiHRS1MEpWLpN8gkrhjz7KGCvj
         NgK0rSwsh92+S8L6W07lX57LxKlwjmvGD4/cRl3XVUTt8ueL8DC3LVkNU8Q9Uv0ISPq0
         97bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901630; x=1788506430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXsApZa8Vi5ynohBI7cN4DA/XtwNMqC5yo4nBQCk/iE=;
        b=E7/iMow7VgUxMkaEdtj3sUeVIYn6CtNJ/c8lLLH+MQSbkva7FZHmnRn4jh7W+A2hjt
         4Ze3Negl74OwvZwwy4hjJVp8/qdXAf/qIkpQL5rXOQzUCJ6Eo5NQM7UdbzDXI/kJzCiX
         OdLU8UowZnYvv2m1gzbZS8k90TrSX0IcDfVfWUD1gbbH4SXjpJGzG+5y0XIenrwM+TVw
         d/t2jV8KtFg4ERlF0hAzSqqE11zmje0Nj8NASZKClIVfAyljr/0vO0uKKQSgzJt9/jfi
         w33NDHC/i+vmV3H/ro6LdvRVKTUcK7zSIY/rBy0q8PGLf1Abnj2tJZnQSXp+rhHpTMBv
         jRBw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+XoJaHYq3vcxnbg7lkhw2XI4dk9q4HBBBwinrRh34CUEeiU+RKchXnQw9eKJYJXKNDMKFFK4Og/0wi2g=@vger.kernel.org
X-Gm-Message-State: AFuF++m51YWxfE/+ooQ8rn4bm0A05djcS1Qbm5Wms5fJk21Bhek6WX3y
	wt2JXXzUiJ0WThBLHriqakb5C9u3HOrbdD3B7MMaLqo+aqGTiNJ9OeCT
X-Gm-Gg: AR+sD13Gcy8yylce4Ht5s2zFXbtk9IUw1kN+l7fOOl+Eqzu7B52H+ZEx+74fMR1toHl
	q296ZugCsmeWVKWeZL9t8VptoQ2mxGCOUTUduKAe+OzmAkN0GkBtH5bvnQGke76EgRdRzVcTvkH
	9cqXbVz5mSXN0PNUiGpfGt9Rn8WwmhMdWuWQGk7dStMLs5hwmc8PIDWY1+XkQfi6e93vPf6elnd
	xkglk/EgyuNWBNkcTD2RzgSe2RcdG3hkvo2tiiLjmBHuS72QQYr/EwmIYzUT+u26iZC7S4kId9N
	OipVTJl9JZfJzmL2KaxmcCEorGXROFBg99sEZD286wLs64B7phfu7HT3hsWlRNhU9ZhrodkJTSL
	cL1BK01LQZcOhHpRyfpFjHt2Mqzk7GZnMr70NFTVR94tpLtRK21XjWP9JHeAPNvfjbyCkZSjfrG
	96V4259/RYfUfCsqzbwem/iXYhR4Ej9Ycrjz/GgK06wWY8LraEUjHzcsXoaeOxQDgKSd0=
X-Received: by 2002:a17:90b:54c5:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-396d0e5ccc7mr10951364a91.3.1787901630320;
        Fri, 28 Aug 2026 00:20:30 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm6123731a91.4.2026.08.28.00.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:20:30 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
X-Google-Original-From: Jeuk Kim <jeuk20.kim@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Yohan Joung <jyh429@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	j-young.choi@samsung.com,
	yunjae00.jo@samsung.com,
	keosung.park@samsung.com,
	Jeuk Kim <jeuk20.kim@samsung.com>
Subject: [PATCH 0/3] f2fs: add per-file out-place update control
Date: Fri, 28 Aug 2026 16:20:14 +0900
Message-ID: <20260828072017.44569-1-jeuk20.kim@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS currently has only filesystem-wide controls for its update policy.
Both "mode=lfs" and ipu_policy affect every file in the filesystem, so
there is no way to force OPU for a selected file while leaving unrelated
files under the normal adaptive policy. This series adds a persistent
per-file OPU override.

Patch 1 fixes write tracking for pinned direct I/O in LFS mode. Pinned
files still overwrite in place, so FI_UPDATE_WRITE must be set to ensure
that fdatasync() flushes the device cache.

Patch 2 fixes a regression in the existing LFS-mode direct-I/O path.
Since commit 351bc761338d ("f2fs: optimize f2fs DIO overwrites"), an
O_DIRECT overwrite of an already mapped range can reuse the existing
physical block even in LFS mode. Restore OPU for those overwrites before
extending the same path to per-file OPU in patch 3.

Patch 3 adds F2FS_IOC_{SET,GET}_OPU_FILE and stores the per-file policy
in a new F2FS_OPU_FL bit in the inode's on-disk i_flags word. A
runtime-only inode flag would lose the setting on inode eviction.

There is no free bit in i_inline or i_advise, and extending extra_attr
would require a larger i_extra_isize, which cannot be assumed for existing
inodes. Store the policy in an unused i_flags bit instead, avoiding an
inode layout change and allowing the policy to be set on existing files.

Comments on the per-file interface and the use of an i_flags bit for the
persistent policy would be appreciated.

Jeuk Kim (3):
  f2fs: set FI_UPDATE_WRITE for in-place direct writes to pinned files
  f2fs: fix in-place direct I/O overwrites in LFS mode
  f2fs: add ioctl to force out-place-update per file

 fs/f2fs/data.c            | 36 ++++++++++++------
 fs/f2fs/f2fs.h            | 16 ++++++++
 fs/f2fs/file.c            | 80 ++++++++++++++++++++++++++++++++++-----
 include/uapi/linux/f2fs.h |  2 +
 4 files changed, 113 insertions(+), 21 deletions(-)

-- 
2.43.0
