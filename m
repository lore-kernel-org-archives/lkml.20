Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59C2E764D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780358; cv=pass; b=hVL7vQvzuIwSpvUQNfYJxDoBckgYWZJ19mn5Mb2DYWRiuLgaucQjXNQG2yirCQTXVKhOpKeINk6OMouoWHSVpRvhnscXhLJo0gfDVDPfLHFP+g9uU/czEwwdAqdeb2k9aEK+9oQ8aRU0poVXa4aTpfSBLeRi93v1j3qG7FCNaUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780358; c=relaxed/simple;
	bh=V8D4Ph2iQjDaur95DB3Yptav92Kxg/oDfK1utSU5RJs=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=QG4KNuLsCTudve/YO3Vva+Cv5/WFV5dOeVpJYgScC7P6J78kaJoWf1cDdhvwl3cvWAnrPgydvOxdAMseAOvhEvlUmn73KhYFsxjdKSbTekM3EMSzh9xertL/BAx8xrYOssicYZOZGjSFMVK2QH1hwCccucSbhZpWnpS43GZ39Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Alh2LdJ0; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Alh2LdJ0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so1597095a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787780355; cv=none;
        d=google.com; s=arc-20260327;
        b=IXsNd7n2FOKQvIb3q2vuQ9ztBXm9QmRlvq/FSU51k9vYVf0MPnZH9yREuntUzVgON3
         y8k5+bkZ0xq0RDUfkCixm0MEy/IQjqdAd8sf0eZHNfcgWAeTTYXFgWestyQt2yMisd2g
         L5WjySyCoZCXJQ2OZbW/GkekmULzFTkrnRJgErkZqqiqsrnNHb6tWxa8RsF+2g3VMmWR
         WL5+lvLRFkMoQYXlPFqHQeXAQ0kZTiD99W+9pCL7mMSggd2cAlmJcxhc7G1+kXUpZr2l
         GdXboQYlImss/TnxUfcdevVhm/XKu6FyDRPCVSAX1GhO6oDSUkfhnDX/j3ZEKtnZ+1ob
         XHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=zPpg4/2kYNXlQVEAkyt3FxBQhaPnP8EOgxLGCkf4X/s=;
        fh=vOKxvtNJ0lBiq081o5pL6FIld4Q+qH9DUW5T6Hof3AQ=;
        b=gFcloPVoTDD6g1L4r3b5b7reE9yEOV67hEHDOVp/BFuaK+IcG3EX0tM64J+n0N0WEY
         OpbHDecDEcXdOuxjAZ2Im9ZHLRBhalyNUNEjwDKGSlivOJj+wR59pTE3VS8Xj8x2Ha+C
         qjNSdTI02V2DsKlOs2JNx0smd7b3ruxGJ8Az2+qJi8GsbOWCiKz534pRGXR0pAWjKfg5
         W4XwDsbS6/4fmxJ3wtB+tC07gBCq9/boao1lieVqWwpvyZQoO0Hl2IMl/nSfm7yr/pSF
         a89aum0/IImK/c4XKz6FZLUvU6uMIu0n86VDfjhBYT32Wymn7GwQL4QdhZlRhAhSCwSz
         rQEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787780355; x=1788385155; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPpg4/2kYNXlQVEAkyt3FxBQhaPnP8EOgxLGCkf4X/s=;
        b=Alh2LdJ0ny32cck71fMQolruYfu3UE8ZMe/9QkWO4ehk7gRjkrkU7pq8mSJNLuVZ+3
         h3W7xCEWhpeJVDl1Rt5R60CAboCsiSeSdxNOUQozAk1wbi3np7prtfj00E7obrqT4R6S
         i1zi01V/GsiPurZgVEY01xyK5/7gxdfGJpr7k0M4j3LtN/yOabFoDfmJuRw0kEslfCOY
         LAroo1JTP7Xdbp19VDDaGhnICYMgEsTMNsJIT7UYtOK9sjBBO9S1sMnGpTLH/stRyPzu
         uw35KEdYYmk9/nC8ACJni9bXMMQPO+Eo6haQch6ngtOCeyr/mCNda4EH8mU5DYIL0VF6
         uGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780355; x=1788385155;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zPpg4/2kYNXlQVEAkyt3FxBQhaPnP8EOgxLGCkf4X/s=;
        b=l353EXn1+LAy82ur3bsSCJghzkkg4ZBuY9k/wG8YB1DTx0xPfzoKV1bi6PapS4pFba
         IY4yIUUVDQMMC98IaYSzdz2CGOZkDTAXllm/YAo/Qlv9ZzBXZWJ23CJv1f2akSTxK81/
         /KOb3OK/VUIBA9fYFhvuPaacZAxbkhIhXMQ2XCQ1fWeHAtHBm+9cabE6IJGsEivqhzfS
         bF92FlgGRO6bo+IvvXnE4lZ1FTqit9ljDiHdNjfyPsGxZEM4qn8qi8XcQd14uPZ8tV/o
         Jt5w+ZkrwMUGnnTnXf+CNRThR1K5+3CEIamGrGRgX9OKvVdOH3vrxs3WDIlj1SUctmOP
         M73g==
X-Forwarded-Encrypted: i=1; AHgh+Rpc0yi5koEDfN67uYPhyArisensu54p6MTr28JudwfWfObqTp3WjfuXRQzevx/BVUPf1oti0bPDuWRoDDo=@vger.kernel.org
X-Gm-Message-State: AFuF++kFpzVDpOokfQTOSRLZv6XJ2l3IK6aLM78jY9oUxKWATYCWZFpD
	QginMKvAqIgdsNEglJHPIQjNta+5jzOQyc60tbhcrMZ0YGSs2Fn9fJltlS2oG1M9qs2B+NI3XrI
	vHm0Yc+0AWSaPz6uqqcMjP2G6hSBZFmxhsYSA
X-Gm-Gg: AR+sD12ZnURWbiZWg9upA4IOcilNMezD8TsrwSbM0m4vQgBZ7vH8NiPM1UuWlRZezfE
	noeVIUViFHUdg7mXP8dbv9pvb8fHlOuQHyE/DymwOqy6qcg+eJTyvLky2XjZRO+z3OwoSW+RQJu
	f/WOeRAtHMHtRFVKpfJrM4kGkXYmFB+QgU5VBBQztOmljC+ElV9/GutF32mpVogKRQb3BN45NKJ
	nf34aK856ZxwqTNCV6OVvcZmY+OyBkp42f9eIFQcdZYKbSkCFgRPMVFHk5iR4osYcWws1zEK2KU
	CAKERvmAa+/NXrwy6dnp2UTEpjBTbBSSlQmOlfWv7BmlFOyRrbWELQ4e6KAfeQBv04LrzAzCKLv
	gdNLuLm64uNY=
X-Received: by 2002:a05:6402:504d:b0:6a3:ff14:ebc9 with SMTP id
 4fb4d7f45d1cf-6a5df653f67mr3823591a12.11.1787780354691; Wed, 26 Aug 2026
 14:39:14 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:13 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:13 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 16:39:13 -0500
X-Gm-Features: AcwNN1UG9EACUwSLC_kUicrp_uLYav7JIwvDNltpLto-LKkaIlFC2KCRmJHHdV8
Message-ID: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
Subject: [PATCH 0/5] f2fs: prepare metadata layouts for runtime block sizes
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series fixes a free-NID shrinker underflow and prepares selected
on-disk metadata structures for filesystem blocks whose size can differ
from PAGE_SIZE.

Patch 1 compares the free-NID count with its retention threshold before
subtraction, avoiding unsigned underflow.

Patches 2-5 make the SIT, orphan, dentry, and inode-node layouts describe
their runtime block-size geometry while preserving the current on-disk
format and behavior.

These are preparatory layout-only changes; the runtime geometry conversion
will follow separately.

Kelvin Zhang (5):
  f2fs: avoid underflow when counting free NIDs
  f2fs: describe SIT block layout dynamically
  f2fs: describe orphan block layout dynamically
  f2fs: describe dentry block layout dynamically
  f2fs: describe inode node layout dynamically

 fs/f2fs/checkpoint.c    | 46 +++++++++++-----------
 fs/f2fs/data.c          |  2 +-
 fs/f2fs/dir.c           | 51 +++++++++++++------------
 fs/f2fs/f2fs.h          | 76 +++++++++++++++++++++++++++----------
 fs/f2fs/gc.c            |  2 +-
 fs/f2fs/inline.c        |  5 +--
 fs/f2fs/inode.c         |  5 +--
 fs/f2fs/node.c          |  4 +-
 fs/f2fs/node.h          | 53 ++++++++++++--------------
 fs/f2fs/segment.c       | 15 ++++----
 fs/f2fs/segment.h       | 19 +++++-----
 fs/f2fs/shrinker.c      |  5 ++-
 fs/f2fs/super.c         | 14 ++++++-
 include/linux/f2fs_fs.h | 84 +++++++++++++++++++++++++----------------
 14 files changed, 225 insertions(+), 156 deletions(-)

-- 
2.53.0
