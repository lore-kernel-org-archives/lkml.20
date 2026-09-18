Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447336167B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722057; cv=none; b=POceWS5jmKd/EoF9uR0vFYCXRV7VDl62uAlLS06+mlvDmDSHIsak+kL5YNC/YvzlqfQAqBH4Nd7j9UQszhFeYjIhHoCQfuP5vertD3SisDDFlccSgus5ImExIeU2GSDxhhZPB9nXquipntU3nnSSwzUXZLkvADFkZcrpOS6xFCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722057; c=relaxed/simple;
	bh=m4ZbhDJfV7md//ofsICU2QzhHI6k8KTOEZrwq/uln6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArXvgZuul1btxTUDjtFH1gSVE5XDMZbwQjSBLKlcBUSRJ1S4aK40uPxlbux8X6eQRyjCd1VvZZSwDtN5fTvHNN9K7fPNJslhAl0jbZ2xAb/OMSuoeBOVjy7lqWPAY2vdy2V/v7m/TbS6ozc6cgUMkXUrQF/zyf+QgeVzny5P7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGOUtPAy; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGOUtPAy"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25400so389676b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722056; x=1790326856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mNPvRwIoYtv1U+zE4RruJ91hXpp045j5mrIpQ+qMH4=;
        b=bGOUtPAy5/q+HGtPN53C53D1sNJqfHaM38CaEKc7/l8rYTuGtv0uNTHb0x4KWG2DKE
         kTiZKEpmZFpx47jAPGkW3Mg9LU/Pgu7lFZQ9/jLhHQKhbgRTtaQreoUPtN2hzjmcurXd
         D98BeJkq5xwmt0LINEeMclsjZDir9eB6cB1hPp/eYcu0A+OS/ElsM9w+x5CWJ6FMM44m
         5P02ueRlltMNf++5gJrPNCwGa98SEldZ1M+hwtk3siYWEh7pvKMbXAVe2McSrfhlAQ2Y
         7W5Ld+NrKd2MY2nln50spZcyDs/IWWvN853dAj/N7kQBp9A7IJFiv4Ipp9e4IlocrdrY
         J1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722056; x=1790326856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mNPvRwIoYtv1U+zE4RruJ91hXpp045j5mrIpQ+qMH4=;
        b=kTubrKVOuCp26vjxZNcty6uxGD9iwbTdhI/kEIkmJzsdFJq61oV7MEHiKp939dB0/q
         HxWM+JmPmTxGgDx/LTtCRMD68k6UDj7F6bIotTbJ1ZFLa4gkLotUmd73BVCDhilaYv5W
         5JrnNRxS6i7x+KWlatpvWBmGoZplsZxaabDwjzVFeGFOFtNJn48aU6GaFb6mpYrO8RND
         fflGmlHG+eQYe2bNOA4mjyQL1k3nWUaTeVkSqaFEbErN6XQSQ4KG5OnOl+1gf6YkICh0
         1W/F5pbDCLrtLl9KadwP2/2jyRurOCWKcD9TtQJBHBoOIGttih4vFbZGbDL9d+xO0tLj
         DGcw==
X-Forwarded-Encrypted: i=1; AKwUvBx+Bp0PDI8MuPY1X1du0CFLf8n+8jhmroAWTt71nlTgGeKXBsoQ1MCxfRlu8fmvvBZQNguinAcxNShQ1tU=@vger.kernel.org
X-Gm-Message-State: AFuF++lbJW3emVCsiuky8fzWKAa12A9RhJ5zyzpyzYZ7wvVsEz2Sn3XY
	3CteEZWir9mb+bd3JjGeOaxx0CIfjVkWI6/RQFS1TUlTf3ZiNTYQkh6v
X-Gm-Gg: AYBFou2mrGghypVzrVaDrhggUJBwwqXsqk+WKrnpPz7GcnsqWEENb7eIT6YlWwxuqw1
	E1MWaLa91FL/ERaMn40PdxmVjFmsY/AfiY4d8H13E+Qk6PETdjJ10t1lGf7W+BSwhanrrM9wqqm
	mdQTpbEcm5FbXynZAmfacCo8Csdqyx2WkeMIUITOnQnZeYPpKFa640y2A0/msBnA429UslSskbg
	N/z5KiM56eDn1kCUVqfQiopHMNa+o3cYTNUuHQ1IOMgs4FgDPbrbpC6g6P168dGFuK/ILUxPLp5
	wisHOXGjFncN+6Ow3lvIBERcQU7f8bo0LgO17p4TEhpR5tNFE8EMkbvC2iXLGqfAAf+QKTHRc/r
	bGjUVevGu8hmp2kPm7SB+ng1lQOCY3gSgVoctY9fryH8vZvVGBRelUw3BNMVay4fhuF5ZzqDdQi
	TTHKFe9ujQ0gjsB2v4yTcLcS/DnR3o6U6pHSs3o+6I0OfY2i8OFLJmM77uW53EUxrh+mTUQhoz6
	b4MxK77a4AbelX/JpsKkWeiwbwGayQTdK8a378VjIl4Rp3mdI2w2BFe+MgqTuYiySN8ErWRd+Ez
	nauodw7fkGCVZGoHox3/VsdJkkJsm73wKtFmpJ+zMfF08PEbtJF9duyFoUO11Gs889qfS7FE8tZ
	jV+fI6w==
X-Received: by 2002:a05:6a00:3a20:b0:845:e440:d0ca with SMTP id d2e1a72fcca58-874db6f70aamr3110164b3a.8.1789722055106;
        Fri, 18 Sep 2026 02:00:55 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-a.c.t54fbfa9bf0658dcb-tp.internal (96.177.21.34.bc.googleusercontent.com. [34.21.177.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8fa40fsm504491b3a.15.2026.09.18.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:00:54 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v4 0/3] io_uring: add fremovexattr and flistxattr support
Date: Fri, 18 Sep 2026 09:00:07 +0000
Message-ID: <20260918090010.1688-1-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series completes io_uring's FD-based xattr operations by adding
support for:
- IORING_OP_FREMOVEXATTR
- IORING_OP_FLISTXATTR

This allows asynchronous xattr removal and listing.

New test cases have been added to the liburing test suite
(test/xattr.c) and verified to pass. A separate userspace patch
implementing the matching prep helpers, sanitizers, and test cases
has been updated and submitted in parallel.

- Patch 1 syncs the tools/ directory's io_uring.h UAPI header to
  align it with kernel mainline prior to introducing the new opcodes.
- Patch 2 makes the necessary VFS-layer list/remove helpers
  non-static and declares them in fs/internal.h.
- Patch 3 implements the io_uring operational support (opcodes,
  opdefs, preparation, and issue handlers) and invokes these helpers.

Changes since v3:
- Split the tools/ UAPI header sync of pre-existing mainline opcodes
  into a separate precursor patch (Patch 1) (Suggested by Gabriel).
- Robustify io_fremovexattr_prep by initializing kname and kvalue
  to NULL to avoid potential garbage-pointer crashes in the
  io_xattr_cleanup path (Reported by Gabriel).
- Add strict validation to both fremovexattr and flistxattr to
  zero-check and reject all unused SQE fields (Reported by Gabriel).
- Reset ix->ctx.kname to NULL on error inside io_fremovexattr_prep.

Changes since v2:
- Revert unnecessary formatting changes to filename_listxattr in
  Patch 1 (now Patch 2).

Changes since v1:
- Omit path-based opcodes to prioritize optimal FD-based variants.
- Limit exported VFS helpers to only file_listxattr and
  file_removexattr.
- Rewrite standalone test program into a standard liburing testcase.

Aditya Prakash Srivastava (3):
  tools: sync io_uring.h UAPI header
  fs: make file_listxattr and file_removexattr helpers non-static
  io_uring: add fremovexattr and flistxattr support

 fs/internal.h                       |   2 +
 fs/xattr.c                          |   3 +-
 include/uapi/linux/io_uring.h       |   2 +
 io_uring/opdef.c                    |  18 ++
 io_uring/xattr.c                    |  83 +++++++
 io_uring/xattr.h                    |   6 +
 tools/include/uapi/linux/io_uring.h | 342 ++++++++++++++++++++++++++--
 7 files changed, 438 insertions(+), 18 deletions(-)

-- 
2.47.3
