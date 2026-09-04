Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C323A6B67
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521355; cv=none; b=iJmCDNDgPpavH+7Nt4s5oeFBU8aREGUJVKSzFew9uD2QZB2XsXdN5zqycy2du664DvlrHdPHV29lxDWSfDjxJoGfVef+Qeo+u/+2jZobG5IlsLv9rI1meMFjo/P7KUk60B70ggY5Hsx0mId6Y+EBzSFZVttgqRiTIV63AaxiGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521355; c=relaxed/simple;
	bh=YqdC+8HZ+PPVHMolU7uEZ0uOblEmSW3RjyZqvfuENfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKY073GKanom46QuSkJlIHXYMhfaxIngUhsovzhERaxyszMoAhxebb+X8mCBy4HWmPXzgq7Lc47nVp2QbTZepwaAI/z+921CTVBpHhVRG1uujwbun8+lzQVVu0fG2jyP1yn60dA/hxLIDSuX1wagqY2n8Ix9yU5gsQcruHL3cEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eut8cplA; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eut8cplA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso925534a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521353; x=1789126153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7v/uxnbQMfkKoP1sp33rDvuMipHbkJbh0bcJjU3OA7Q=;
        b=eut8cplAvw1dooOIugfwxUEEsf7CYEp4aVpjcf4gs7UGqsKLR2j2jiTSSvsIPeddKo
         V/Rkz6Vqlt5ZdrraB5kWL30zqLjPevIGzrcI+TwXEsoaFnGqJ4NxZZdLgT7/Oeinn/TF
         +RWGcPf3tQfxlJevNBE3Jcy/jE4UbXJ+FdJEy7SuIPDOXOhze5GzJgiTsG7FYGYSUPjs
         8q4fED3VaedQuL6OuPnG0GZbOWhOlaVs+jxF7k7BfCZGprlU8RRbkjdOcdMjsRjbqgdl
         MfWEgPCRGddNPuWi6H9a7ZoiSakUB0D+AFbLeYGY2OlG9j7tsqkR8WqbOmSbwgUmo99F
         xGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521353; x=1789126153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7v/uxnbQMfkKoP1sp33rDvuMipHbkJbh0bcJjU3OA7Q=;
        b=fC8vKFpf6B6jXGHnqM5I+JaK8Nq6NtOo1qlkYryz+4d7w6PSCyBq5l7RgcItY0b1En
         0QBc1d1ZJ3lMJAbN0V1MXTJrWBLhA7qLWN0u8NEihWN9WJoX/4YCA2Q2ESoM735XqSnK
         7l+xCk5zz1YxMwOkuhnv0iB46epVIrKg+6cnv54KE0X6OFvCHLJeCWsAQxTovKM02XbF
         pFgpDvQQVYnQLDgYnyt/VA5YZsG7C5AUUd55ckGghwqFSXCy1M6mEg+XuApB/hVPE2Gq
         U8wySxDFqWPlJONlDox9VHh5HZFxFWT7a+X97RdkbNMNeA34dsKIxLP4wmi65cnL7g5U
         fTjA==
X-Gm-Message-State: AFuF++mZVdN3vobl2oqeV4afl6ZVl9QUFGKjlzhBd+UWwtFXn7nkxQHy
	CuG9pflxjee8Dle9PZSsaEd0tZuQXlHAKjJbjeIvFOnWlyd789thct4LuMfW8tDEipU=
X-Gm-Gg: AYBFou2Wd7riAmvYV0TFY82hax4BWf3/+gat3y1F35FpuITCZl0pADnJzIYXwcmknMQ
	MWHY315DYbGyhcsTgFavWiH9DrbTMDHAnfWOkfF3K6J19ZeBOkIhSSmtcHAAlqxYdF/ld4hKmuS
	fHmV2QBaHLQr+1NF6GDjZx6eQS4U5fUZD6Z1O/7N7k+FmGFh4JXUJOB7gyBzMVA3yhpR27Ykx8B
	uiTTJI55bLqCBjCa0WccOTvdVXlQK4+IZkTKRjr6RBIKAElQ6gH4YS/K3OumIDPk0henabYVmDj
	/bAFodogLnX7uN27RXtu/bz+A8xHuyh+wH31UEgCeR1Rtc5aPiAr9DVt74Uv/MKq4V+fxZR0oSV
	ezU6cDy5toPbvbmvaWqitJmKpHSUbS27tjJojMvEaItOFG6IOHJAaWgySGQWVrrEMeQQ7Xbaz/T
	29qq/jappe27vMkbKixRISgzxbBXHnauLAViFvCY6TYvWxeu4X7Hqtpo+18Kt+6Vr64SmA9xlL4
	10pw7+XK8nl/fQ=
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr14207230a91.22.1788521353473;
        Fri, 04 Sep 2026 04:29:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm7443259c88.5.2026.09.04.04.29.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:29:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] xfs: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:59:02 +0530
Message-ID: <20260904112909.8197-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  xfs: fix typos in comments
  xfs: fix repeated words in comments

 fs/xfs/libxfs/xfs_ag.h         | 2 +-
 fs/xfs/libxfs/xfs_alloc.c      | 4 ++--
 fs/xfs/libxfs/xfs_attr_leaf.c  | 2 +-
 fs/xfs/libxfs/xfs_errortag.h   | 2 +-
 fs/xfs/libxfs/xfs_exchmaps.c   | 2 +-
 fs/xfs/libxfs/xfs_format.h     | 2 +-
 fs/xfs/libxfs/xfs_inode_buf.c  | 2 +-
 fs/xfs/scrub/agheader_repair.c | 2 +-
 fs/xfs/scrub/alloc_repair.c    | 2 +-
 fs/xfs/scrub/dirtree.c         | 2 +-
 fs/xfs/scrub/reap.c            | 2 +-
 fs/xfs/xfs_bmap_item.c         | 2 +-
 fs/xfs/xfs_inode.c             | 2 +-
 fs/xfs/xfs_log_cil.c           | 2 +-
 fs/xfs/xfs_platform.h          | 2 +-
 fs/xfs/xfs_zone_alloc.c        | 2 +-
 fs/xfs/xfs_zone_gc.c           | 2 +-
 17 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.48.1

