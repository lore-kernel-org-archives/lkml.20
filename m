Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19391E1A17
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514896; cv=none; b=ZA+KaqDjbkiJkaPaYrPZ6okh31ehjhvXlTgJEnmWyH7SFItsJzw4oY0m+sEGGn476KHNyQvlygmlINxwJ9u25aKGTVC54WCZ4pQh+764dfilR7SjrMdo3IlCf11bkkfnavhl2gpX6U6OzQFB/bup139+keQcGFJa4IeaPXO8J0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514896; c=relaxed/simple;
	bh=YrxOXGS2JpS78v8REuNcVwokEtv5Whbe4izZmskN9BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DDI1gGNjECnT4+TzKJTVTUBlrhIwfBqv6/mgi4bS7hUzDLOkMpaQb2tvpKLtD1iGuYtFzfQdEDMhjBtGlnUlNZDHWLK6aRBtzl7LhT787xEW146tiIyRFtRfmbJ+nR8C8gmTkfdVwUtZrFGsVPy7K1VvTYm6HrpaQ8PLXghdj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com; spf=pass smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=F77CkqZ/; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="F77CkqZ/"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35115b52125so4885636eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1791514892; x=1792119692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xk4cQ5w6rgcfSik2vkPhBRPqtZG+6WqFpZrQIqGQzLA=;
        b=F77CkqZ/QmW3GXhtWyYRUdGad3yGLgGDwKAgiNHut1gPISa5hCRHslfhVUODA3FlaO
         Is5HxKI3QrQhJuYdPgWBqzJvudC00yQyA/Cds1R47845foW8u4Yo1//tarO2Al9qipCj
         hdvJB+p6kdLOE5npHt3ubdiUappwEC9YWjOlJrmxYa9aQW7Dg84S49oux5sTX56m3aGk
         5jJZcUSiKg5Q4FfbRp70jB+3JySYo8hXe4xkRl/cAh6FSyTHEdJuMjCD03705OwwW1kb
         iyxNR89F5dEblUxACUWQltzkwlXiaueDLzmHxexFXN73TMZ8bhwWX2dj2NNWceZldb7D
         YNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514892; x=1792119692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xk4cQ5w6rgcfSik2vkPhBRPqtZG+6WqFpZrQIqGQzLA=;
        b=MaWga3H8M6GZG4phdFjDPq22EBYAee+ca2h3Bzb1/btG25KSAgCg+XkdrhBhkmJTmu
         4xn8821hOmGaGs6npJ/4PfpfLve7xrlqXuyD72XxEWzzIkgdVfsmnwvm3AQLaIbh8kV3
         IpEhD0vS7yB3fa9Xg4LCKSHD+eyR5fe19fua7Q89SfV2T1jd8oWht6ANWNGdh/nNgTqA
         GMu65S4yqabkUmBpkg8AjMH1oHfExAstXCd6N1GWKNWqA+2x0ciite74xudvwD2O7GBu
         pVGv/IopipyqF88Q0L4LJeGJHWLUmpQw6+MNfcIJC61ztJ8qjPQBFmFM9Is6AIAKtsH0
         CklQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpBPB3NNiZdeL06awMDlGReiw2OhZXE9LTcZrr61ZJ2j8jrp0PDSOlpFw8K/20uWeQr2YCj/S6Zjl0hLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvK/7W841BsfO/Z0/rV88yxyJiHXpDoPlhjO1kxADCm3Lh1y4K
	nZRQB01N9oyoq1p2Io+KEuX8042eQNTN/FznY5BLXlykE21VP3/egChGE9o+QOn64A0dxd0YDid
	wXxMz3AEw/FG6yMFGoMencqX/uFH5ZUywlKAUPecg6OvOl2I1/alYA4WkF/Y=
X-Gm-Gg: AYBFou1arJTIHIHVwBAvvcajfOXSmqTlVLBjLdwnCx2e2BdkCBoYYrpYB6iYGtuiI+H
	xIzJeITlFRUk0KESy46cawGKfYG+o+34GsdJ3nXyxHGKQatVaW4Zao/+PrqyoGX30bYrmIRmIl5
	HBXeDTya/mDo99rzl+GkZE6V0f4NHaiNzpejNOOZSFfnW2yp96bg/r64mgtcqAS5jMy7npPI7vi
	yYnSEwpFDjDq0Vsca4OACCsbnuOLaQewB9myaG0MC6sIkIbsXE9v2BHVCX3/JzHsHOMNJjnyaTz
	RlNDNUC5o5M4cjMueQxXaWGR1ZtZPp3jugnalFsfPNVgn8k7/eu4rXVuIO5D3w0yybYhCpcEMgu
	KatfadhxK/9seOqYIc8SihzgwoHJrgrdSVMKbwTtnAS7ADsPCTM371zsyjCMitFf/yKLyaEFwCA
	MSR9H2tNv1jqcFFE+MF1dFTfJd9k8tTvN1a6X1ZtpDOccpVcjLmPSANG963gDkLgeFfu1llf4yU
	//rBRCOzA==
X-Received: by 2002:a05:7301:454c:b0:351:6009:9a6 with SMTP id 5a478bee46e88-3537dfc6a59mr947149eec.12.1791514892374;
        Thu, 08 Oct 2026 20:01:32 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.128])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm2427626eec.27.2026.10.08.20.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:01:31 -0700 (PDT)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [PATCH v1 0/4] Expose blk-mq tag sets through debugfs
Date: Fri,  9 Oct 2026 11:01:07 +0800
Message-ID: <20261009030111.57784-1-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block debugfs provides views of request queues and hardware contexts, but
not the tag set they share. This series adds a tag set view for inspecting
configuration, CPU mappings and driver tags, with links from request queue
directories to identify queues using the same tag set.

The series first removes a stale CPU mapping comment and moves driver tag
allocation and reclamation from individual request queue initialization to
the tag set level. This gives the debugfs tag files a lifetime that can be
coordinated with tag allocation and release. It then adds tagset/<id>
directories under the debugfs root and links each request queue to its tag
set directory.

Tag reads hold a debugfs active reference only while copying tag fields to
local variables. Releasing it before copying to userspace lets tag file
removal complete even if a reader faults on its user buffer and needs I/O
to a frozen queue.

Based on Linux v7.3-rc2.

Testing on a 192-CPU x86_64 host with KASAN and lockdep enabled included:

  - null_blk queue growth and shrink under concurrent direct I/O and
    debugfs reads, including 100 cycles between 1 and 192 queues.
  - Shared tag sets, shared tag bitmaps, three-map configurations, and
    repeated device teardown and recreation with old file descriptors.
  - Unmapped tag reclamation with 256 poll queues: tracing confirmed
    allocation, reclamation, reallocation and reclamation again for
    indices that became unmapped as the queue count changed.
  - Task-local allocation fault injection, including hctx allocation
    failures that rolled the hardware queue count back.
  - NVMe loop with two namespaces, 50 controller resets and data-checked
    direct I/O. These resets retained the same hardware queue count.
  - userfaultfd-controlled stalls in tag reads: null_blk queue resizing
    and NVMe loop controller deletion completed while copying to the
    user buffer was blocked.

No KASAN or lockdep reports were observed in these tests. A hardware queue
count change with NVMe queues already frozen has not been tested.

Lei Chen (4):
  blk-mq: remove stale comment about non-present CPU mapping
  blk-mq: manage driver tags at the tag set level
  block: expose blk-mq tag sets through debugfs
  block: link request queue debugfs directories to tag sets

 block/blk-mq-debugfs.c | 298 +++++++++++++++++++++++++++++++++++++++++
 block/blk-mq-debugfs.h |  22 +++
 block/blk-mq.c         | 143 +++++++++++++++-----
 include/linux/blk-mq.h |  13 ++
 4 files changed, 445 insertions(+), 31 deletions(-)

-- 
2.43.0

