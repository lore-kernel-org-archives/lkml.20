Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0823319CD0A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776980; cv=none; b=noVCLvOIfiIeveUhmiNQtND2wD1rAa01ciLnIzCnd4wL16B181oLZZpxgxEq0hddR1UeWRxF/79Z0of2coLgSn/l19fDwpZ0b8X4FFonhsDMPEI3btmNqgyki6Aklq9P9HrrP8hao3asoHZ7XR7oPRoHLKY8atY/m/OY4TLvULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776980; c=relaxed/simple;
	bh=54CpVjHxi7V9SkY2dMFcyHBSedLguHY5+b6EV1dsVF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0pcTwMP1judsUEcsitPZcXeL3WVfhLWS+I2reb1McORZ1a8KbpTydj7gI/1VBX3I5pe+3vVyhfQbIij7QYxGBuN9/TgPtIOxtsZRZ8jpYABzTXTmJVDyiVNUaNnckkhvKG5tDo7YNEGy/DsjNG+3DSXknT+/w2jIqTFcoDE3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=fnL/NQgF; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="fnL/NQgF"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fabb1a601so1220373d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1789776977; x=1790381777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcjINpZaTr9sSBvWPRrCS7IFZ529Tzos82jwPMAifdI=;
        b=fnL/NQgFao52MFNme+hMMewRkMoYxxrU7agSRW6rU7mGtLtJYhFftCSJPoZFCmpnoq
         5iGKYAd2Nd7v+cEtJ9+a0RtncTJIjBwGGyFSVQ4rXkmVKXXYt6nld97pZ7c22uLPj9Ga
         0CpB84B9DL0IN9vWJUE/Buj97VODvfxtzrIdWAT7HN7UYvlT6r9YnH4m4ygFR7r4SiWF
         rF6SqCpRpliuBoDBCEQf3fmOKYLCUauS0gYJOzLtsFvkvEzG5bqD0e096Brawehvk7iV
         MN0+b7ER+x0LBU9Q4iSXiIrnAxHsPemkPQzaffnMmakThS7UJLuSMjB2lO+UuQQpLQxq
         bHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776977; x=1790381777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcjINpZaTr9sSBvWPRrCS7IFZ529Tzos82jwPMAifdI=;
        b=mOwpfnRLzzazW9mckSOoCgib9Y/ZvFjg5BBwJe58rFcb5UxTRgmNYwgGdKK76HcM1O
         E+gCKiMN+0FbPVErcpvLbns4Xk70i9fHp13RBuq1/ocmlxqYheRQvBrCbX7lc/Oo5IRN
         pw9sQGXfWOZPaYAPFPAaah6rLqcwYGjLkuVM9vwUnsW96BE+4vENpNKR6hZagS5f848o
         73w/6kCvGw+SOOjAd7a447JPvoLD5PJ9TXVghP9mJXEFsyyE9tEcnPV/b9Qwyq6vXhgS
         d8pHSeluGscLoimrx0YxpDxBRbBD9CreQvoEwYIZFCpldxAgbuWNkyBbp/gOD6MlYrd1
         4A4w==
X-Forwarded-Encrypted: i=1; AKwUvBziC42gR6Qj9VWv9SRv4LC4/l58haJvWFw7K/Cpv43I2NFOVnVfLmMxZ0shGtUPSCJr2/nbG/6/Zjl27AU=@vger.kernel.org
X-Gm-Message-State: AFuF++l7jftXIsjPf2Jwba/VWjMozY2Ljd52KlC0RF1A3DD63q67iJPN
	pnRj1N6t9IGY6STMbhWBQDX9OAFtgbi0LSw/TQsRpmMn6V7UBwsr1gbCPoCidcxOclM=
X-Gm-Gg: AYBFou39sWYAxi2Z7VjkZicytypGYOKsSFBJeTFFVTK11CP6oUdRZls0MQtWG3CZVJW
	ZHR6AzeTdF1+bFCvN9ge5yP9p7UWAnkcys8k4q7PKcDk3KjxIuvtQIxxnqHwPeQ2Nqo8i1XwV1a
	sKuXWlGB2A96L5um1h482X0haBebA591YfRabB1URPi1zGOg0vk/czt0zpOmJuXbMXEzQNJi6d2
	arwr5ZN8OXIE+TuIigkRiP+3U2cukflQHucNZsOWpDfKh3fsYtZkmIdZY+3+aQkG3Cq0xdQHa9a
	T7xmd3oD5lrNqFmD1c+ipjeMGxhMIAPNWFuG4P6EOWMQSbFI5Z8d5U47jPKjnonie3c/w2M8hll
	L1XNQTEi4aIPawFzQ7XKujPUr1Q4Qc4gathzDg9vk1t7PIfKKOmYsKWRzBGJyzv7Wj/DmABkVX+
	RkZvkvN/I6LSw1txuwDWOELm9nsFPoJ9Dzd+iurjLSMT0j84EuxDb1PeJMEWeglkrWe3JOQNnZn
	NEXl08QHcYzagYhNF/vVAHaVclDvTTxapzehF/tLEAhYcPr3OxobDw9pEs+EORVV+GxmC4/2bIO
	5tbRdoBXiLJzC5owlRUL8MtzfKfS
X-Received: by 2002:a05:690e:4545:20b0:671:5653:8571 with SMTP id 956f58d0204a3-6717fe4b7a6mr971040d50.94.1789776976982;
        Fri, 18 Sep 2026 17:16:16 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:f1ff:bb02:6c7c:6979])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672990ab5desm642471d50.8.2026.09.18.17.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:16:16 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 0/3] hfsplus: fix "Illegal name" fsck failures from non-canonical decomposition
Date: Fri, 18 Sep 2026 17:16:04 -0700
Message-ID: <20260919001607.2777138-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xfstests generic/339 (fsstress-style dirhash collision testing)
leaves an HFS+ volume corrupted and, as a result, fsck.hfsplus
reports a long run of "Illegal name".

The root cause is that fs/hfsplus/unicode.c's decomposition table
(Apple Technote #1150) decomposes each source character entirely on
its own and never does anything further with the result. Real fsck_hfs
has carried a permanent "FixDecomps" fixup in CatalogCheck.c for
exactly what that leaves unhandled:

 - combining marks contributed by two different source characters
   landing adjacent must be in ascending Unicode combining-class order,
   not just input order;
 - a small, fixed set of characters either weren't decomposed at all,
   or were decomposed into a sequence Apple corrected back in Mac OS X
   10.2 ("Jaguar"), and this driver's table still predates that.

A name that violates either of these gets flagged "Illegal name" by any
real macOS system (or fsck_hfs) that later reads the volume, even
though nothing else about it is wrong.

This series makes hfsplus store, hash and compare names the same way
current macOS does:

 1/3 adds the data: a Unicode combining-class table generated from UCD
     12.1.0, and two legacy-decomposition correction tables decoded
     programmatically from hfsprogs 540.1's own DecompData.h. Pure
     data, no behavior change.

 2/3 adds the logic that uses that data: canonical reordering of
     decomposed names, a fallback to the legacy decomposition table,
     and legacy sequence substitution, all applied in hfsplus_asc2uni()
     so this is what actually gets stored. hfsplus_hash_dentry() and
     hfsplus_compare_dentry() are reworked to canonicalize names the
     same way, so a lookup can't disagree with what a create() of the
     same name actually wrote.

 3/3 adds KUnit coverage for both: reordering, stability of equal-class
     marks, the legacy decomposition and sequence fixups, and that
     hashing/comparison agree across differently-typed-but-equivalent
     spellings of the same name.

Viacheslav Dubeyko (3):
  hfsplus: add Unicode combining-class and legacy decomposition data
  hfsplus: canonicalize decomposed catalog names like fsck_hfs expects
  hfsplus: add KUnit coverage for canonical reordering and legacy fixups

 fs/hfsplus/hfsplus_fs.h   |   6 +-
 fs/hfsplus/tables.c       | 496 ++++++++++++++++++++++++++++++++++++++
 fs/hfsplus/unicode.c      | 390 ++++++++++++++++++++----------
 fs/hfsplus/unicode.h      |  63 +++++
 fs/hfsplus/unicode_test.c | 309 ++++++++++++++++++++++++
 5 files changed, 1127 insertions(+), 137 deletions(-)
 create mode 100644 fs/hfsplus/unicode.h

-- 
2.43.0

