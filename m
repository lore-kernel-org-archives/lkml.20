Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CBA3D891F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093658; cv=none; b=u84dIZcJwQI/37i75gvLeJRqXVhkP4TwfxW9BmEHy4uNiBGOXa/k0uVDnB6GoyW87ggCf/T/rYk4z36+FAuq5h8Fq4J0KbytjP8Jq2mSdUCYca8Jemwp8o78pqnhJ2xWemWpYsBWjEgQ2dKsGyq1/xje/rDNobOWHaWHpijJCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093658; c=relaxed/simple;
	bh=UzUJo8PA+kyhr7mZ/5yxaJYo1rS+5xXgZOrG7mYTv6s=;
	h=From:Date:Subject:Message-Id:To:Cc; b=awPcmJ2qWtmLFwkXziigGce+0Q/bjyqB6sn4Tv0g3He3KuTkLCuhax0OH/pgjRvXC+Rh8enlonihRKpHfOK4IWiyKQVP5mZjLuDMzLXHT8FDDNlRg/ogQM7QuFqsKs1vdtTgrVi3+4FyoKeeshSx9ITDs6hSUwideNmkT6rWwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyJ8DJju; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyJ8DJju"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so350918b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093656; x=1789698456; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTZufsgY5jIPStSEuwAUSbEj1W0xSX3oqSzNV/+6YeY=;
        b=AyJ8DJjubIpeFfsCvk5ksCMdwDx1PxMufjoWw8Uq2W23QX3slov6DMZvMzoOU9XYbh
         9tPZ/YrQQbr5isaQrP3XxFPnBSQDnJDZia+T8cDa0uIN7AaYYqSOGf1WNexNW7oRNtJ8
         HYNELdYzjL4Bmo1FQ1VCs5eVabybj0BUyoWc6NT1NZNBYx4cLnVvK9YzWuhHktBN65Wl
         ympeqlrIdbBFNSsHwodM/nB6LtWAqLzYzUArPrqeHsH//GyvQ3B6Ddt8X/T0zXpem9Do
         WxitcNO6PSkUhv6s9f0EvelWAADnuOP3lGCJH3CVvVuzTHX20MVPQvi/EBrSUMNTPql1
         jTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093656; x=1789698456;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTZufsgY5jIPStSEuwAUSbEj1W0xSX3oqSzNV/+6YeY=;
        b=IyaaocrE5iIVPCHCKFhl2pCGoVfHuQ09ImB4xAc9Ed6TcQ0daExVkp16nfeBYs6BuB
         bShe2Sr2+hOIfcuBqxUDd605+6XwBDqeBDKQ519+rzAVps0G/5nBQMFtEKnQXayxyK/w
         wuMWRFv5RQ3YsCQFguSuOB94LqzbWZ+T3JYIL45HxtgaqT1yIVzpzaS4spsei2fJfBeA
         rW0Y9EcSfc7QHMjwRnJKJ5Y28zI1Bz7iYPtfoXwXvwCdI1ufLxlWiY+smoBz2TxJg5JN
         nKdGxpLVzuyQSIW3zw2y1g78KwxfhhzrOG+Tqeh00ybgbXGVEfM01Js1NaQNoTRA6pzR
         9B1g==
X-Gm-Message-State: AFuF++nE/Lyle9VmY4k/jlEfb+WmoPE8/3aOl52WrP5o6qvMmVcjkBl3
	NxrkJHzwvAaXXIlMYGykhxlJARHyI7O/9N9iYOaRRYHLGLO0nsL21zAmnFizDi10
X-Gm-Gg: AYBFou2cwChKfRoKrupM6suC9w2ogCwplpbTsADWrhkUGWar/C8/7tGqKi5ZTHJ2BwL
	eq+ldciVuKmoAZwh8a8cJoOjC4Pyok6YGFYPZl+6uv4oTkeOV1MqAPpWD7bCk6ORRBumukVd84y
	MkjkSKUXoBKIJLaH7ggIfEMk3Is0hE9ji0LuzYsnaC964daVcE1ZGScm+oNqSWuAAg8+cVyLuxe
	cQwFI7ylyn803OTa3rGG2jXfOM+2KkMnw5TylsVhOIvGziXe5uEMWFkq2h1k44KoR9nZ1JbvntH
	cZaSlZZ980lxseP/YiKc7KD5WToDHcWvKqypzj47MpuDakZwd/irl/tWiBUn3KY4ReVFuAlXgCe
	mE4FFlMpAGTPczeqHTPQpmUC+lT9z/2o5J6arrGnyBLA0U3YDdblz9RTsvZvSO2Pkff5y3rtQYZ
	0D8anToCdllX3IvAoONhajRlHUvgcDl1m8Cv7CZn/k17WM662m53YXGuiNRQNSBD8b7Dq7Kt2sV
	gJX+/ipMQ==
X-Received: by 2002:a05:6a00:448c:b0:86a:5a9b:32a with SMTP id d2e1a72fcca58-86b31706dbemr3550402b3a.9.1789093655991;
        Thu, 10 Sep 2026 19:27:35 -0700 (PDT)
Received: from smtp.gmail.com ([185.151.146.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c3f70sm377098b3a.18.2026.09.10.19.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:27:35 -0700 (PDT)
From: "lichen.wang" <wanglichen9110@gmail.com>
Date: Fri, 11 Sep 2026 09:23:09 +0800
Subject: [PATCH 0/2] ubifs: add KUnit tests for scan and key helpers
Message-Id: <178909365090.247910.11265261850560199708.p0-of-2@gmail.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This series adds KUnit tests for fs/ubifs/scan.c and for the helpers in
fs/ubifs/key.h, so that the node parsing code can be validated offline
without an MTD device, a UBI volume or a development board.

Baseline:

  commit df2908090cda368b01ff43709f51890076c56157 ("Linux 7.3-rc2")
  git describe --always of that commit: v7.3-rc2
  (the describe string is that of the base commit itself; the patch
  commits sit on top of it, so a describe run at their tip reports
  v7.3-rc2-2-gaf7a59658 instead)

Motivation:

UBIFS has no test coverage for its on-flash parsing code: checking a
change to scan.c or key.h currently means bringing up a real NAND
device, a UBI volume and a board. KUnit makes the same checks run in a
plain QEMU boot within seconds, and it is the established in-tree
framework for this kind of unit testing, so the tests are reusable by
anyone touching this code.

Approach:

 - The tests are compiled into the ubifs module itself (ubifs-y) so
   that they can call the non-exported ubifs_scan_a_node(),
   ubifs_check_node(), ubifs_add_snod() and ubifs_end_scan() directly.
   No EXPORT_SYMBOL() is added to production code.
 - kunit_helpers.h builds a minimal fake struct ubifs_info with
   kunit_kzalloc(); only the fields read by the tested paths are
   initialised. The node length ranges mirror init_constants_early()
   in super.c, because a zeroed range means "fixed length" for
   ubifs_check_node() and would make the length checks pass for the
   wrong reason.
 - The node constructor fills the common header and payload first and
   computes the CRC last with the kernel crc32(), over exactly the
   bytes that ubifs_check_node() checksums.

Testing:

The whole suite runs with a single command:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 --timeout=300 'ubifs*'

Two consecutive runs of the final tree reported 5 suites and 80 cases,
all passing:

  Testing complete. Ran 80 tests: passed: 80

with zero "not ok" lines in the KTAP output. The archived logs are
reports/round-1.md, reports/round-2.md, reports/ktap-20260910-220005.txt
and reports/ktap-20260910-220802.txt; they live in the project tree
only and are deliberately not part of this series.

The fake ubifs_info environment was additionally checked against the
real stack: a nandsim smoke test booted the same kernel over a complete
MTD -> UBI -> UBIFS stack, attached mtd0, created and mounted the
volume and wrote and read back a file successfully (SMOKE: PASS). The
report is reports/smoke.md and the raw serial log is
reports/smoke-qemu.log.

Known limitations:

 - ubifs_scan() and ubifs_start_scan() are not covered: they read from
   a real UBI volume through ubi_leb_read() and are exercised by the
   nandsim smoke test instead.
 - The tests build nodes in memory, so they cannot catch bugs in the
   on-media layout itself; they only pin down the behaviour of the
   parsing code for the layouts that UBIFS currently writes.

Notes:

checkpatch.pl --strict reports 0 errors for both patches. Each patch
also carries the generic "added, moved or deleted file(s), does
MAINTAINERS need updating?" warning; that reminder is emitted for every
patch that adds a file, and the new files live under fs/ubifs/, which
is already covered by the "UBI FILE SYSTEM (UBIFS)" entry in
MAINTAINERS ("F: fs/ubifs/"), so no MAINTAINERS change is needed.

Signed-off-by: lichen.wang <wanglichen9110@gmail.com>

lichen.wang (2):
  ubifs: add KUnit test scaffolding for scan.c
  ubifs: add KUnit tests for key helpers

 fs/ubifs/Kconfig               |  16 +
 fs/ubifs/Makefile              |   1 +
 fs/ubifs/tests/key_kunit.c     | 555 +++++++++++++++++++
 fs/ubifs/tests/kunit_helpers.h | 222 ++++++++
 fs/ubifs/tests/scan_kunit.c    | 980 +++++++++++++++++++++++++++++++++
 5 files changed, 1774 insertions(+)
 create mode 100644 fs/ubifs/tests/key_kunit.c
 create mode 100644 fs/ubifs/tests/kunit_helpers.h
 create mode 100644 fs/ubifs/tests/scan_kunit.c

--
2.43.0


