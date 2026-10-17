Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7683C09E0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206015; cv=none; b=h2F1qEKZ8UrF+ASSMOzrfzM/nT5TWoYh1hYAlr/mK0A/xQGe/1VIGMTUSc+saNLh2Cr4LmR69L9K/HBQueXOac+0YiTHhFn3fPQOopXTnoLuuAlvnSmCKvpxszeLsLUpu3QAQD6q7vDBUtyZSPU6wQSZsQIo1Es2uliehUNzy3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206015; c=relaxed/simple;
	bh=XKZ636C+0wZF282LG7kK4JTGRRg5tviYpbDi0A8qZDo=;
	h=Date:Message-ID:From:To:Cc:Subject; b=LNsYCN9l0V/u5Ol54nTKxXibmgaa+zVEUZuV0AAoeUCoZd3wKM++2hJedgwNYQMBSNJCzq66xAOzxbXw6T8H3KepsYV6Nbb3lgsB91ubJfc8p5UEFH8kH8eb5SewSyuvioljZ+0eSjrC8MV0XnlfVZT6nvmFgc8ehi8Yp499G3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=N5ToaYPI; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="N5ToaYPI"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91791ec1b83so4639656d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792206000; x=1792810800; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69p2wdFQwE6sYgQUmJukW/ziWDawqkeq3jAApKFhQsc=;
        b=N5ToaYPIwJJh3D9MNF/JHT+nTNn5KSod1OTqgifkNA5YnahST4QqvUmOK7XEhK8GEX
         x/5v5eA+GZ1Cy7fnNaAQfOUx2ff/ALgJtFiuXV4AFfxlGLOswG8AKIlsut8Lp4R9rA7s
         rPri5Z4NAZAE6nLafdKJkfTeTfdfqaNuwLfbJvnXyERvcXcYatsRe0E5xfO1M3eo77vt
         iOVLhEeh0sbgc1aR6Px+Q6RIvDjx/0r3Bz4FWRtFmMMmbf4reqIpSv378ZR2LyqHVtG1
         e03IFC2U6epmGy0p59XdmrGgm1c7tDq+P6jXI3wD2MTCY6vdN9gQk3X2UY2s+9/pKRqE
         puSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206000; x=1792810800;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69p2wdFQwE6sYgQUmJukW/ziWDawqkeq3jAApKFhQsc=;
        b=dRXfx7DdIcSpWot09cBW87rOmZIv+wcbnkKecRwrQLnxwWT2dhQIMPtHMnrHhjMFc7
         etCTpTK8X2xmtdW9crBhB45PCSimV87LfoqdHQ2rZAzekavmLIf2O4YdUz2exLSQ3Ra/
         7c1oqkI6VnAoAisRZeyU2+e+BX3zEiTGhS14k2reyLqX1erw9rz9hvDt03HksNDngBbJ
         i9Gm3KWQJYWxiGAklA5wIEQzUYHjD5iYtZiP8cK4Idl227Q/Swng1Rg1QMmFVdJphZPB
         klR8VODEhjE3gsrA12gf5Vlkm6OfrTxJl6GhVMK4V+VW0f6NqCuIcKY+sYGKgh+kH2UJ
         VfGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8bArC6Xq9ANu8UWDPzV5r1FAGG723efZRi/kvW1FDBJTNMwkniFN3o05Jq2u6gfN2fTm1ClYLfeh1Nu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbuo5dQSsbnKsp1io2qpxgpQEir1QWcchluzWYY1bgkodE+xzS
	TMZKZJCq1mU0ABwsyew/xrpRK0WGifIbMIBagygQwUKG1J1w9g0Fti01HIKyZNbsxw==
X-Gm-Gg: AYBFou2mZdFQSkidLgDy7lVpYUhS2tWxu7Tqt7QpGhoEUwhsFRWmb3srNVql3UX3twQ
	62adsRf3WbOXIFh92NRHd3x9JHGeHpTq/C5Q5GU0xozVp5UplrR/K0su/c8IHnRc2qUkWZqKASX
	G3f4/6X2Vpt4mUozS7hbjeB0bHgpyKhlcVlA50SwSkFhUfEQEBuX8WARfUV36cWYMPlRD/x0j53
	TwPZcbKJH9mhNI2cencmTUP0RcfJKjk/O16CuTJUxdJzPkSyCAWu+gVDnkK3d+aYXTY4SmQUtsX
	2NqqK3FF1zQsS6Kyj5gPRLpd5Uz9JWqBurw/RfrXot9FAfLU/KhvOdA+T0zOB2SflioLMjPllzP
	7xTUmKUQ94/vziRWYAT7+YwTDSMJMCGsLBvgAnLW3VjBFrEecVmGoRiCbxsBFQFxK4sDWjjuBpb
	EyWNxGr3/7QaQQl5Bk7vTz7Vq8VQ5WpsyKv/jzXqc11nhOH0+Kh5H5z6vlNidu9UBolnfP9LJGd
	F14NMQuViVChfMerXQJ7qkkY1RuR8DToyGPwUc5qs+Da9CojlrTZZNtMZ6yQtcYXYM/6DcAVTY=
X-Received: by 2002:a05:620a:4395:b0:93a:2611:270f with SMTP id af79cd13be357-93f29cc7d03mr292326485a.13.1792206000328;
        Fri, 16 Oct 2026 20:00:00 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16c21esm364494685a.16.2026.10.16.19.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:59:59 -0700 (PDT)
Date: Fri, 16 Oct 2026 22:59:58 -0400
Message-ID: <58518dd02336a6018abb7fb8b34f5212@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] audit/audit-pr-20261016
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

Six audit patches for the Linux v7.4 merge window:

- Fix the accounting of audit filter rule additions and removals

Tracking audit filter rules is important as their presence can trigger
additional processing.  Unfortunately, the existing code did not properly
track the removal of filter rules, resulting in some cases where
additional processing was done when none was required.  This pull
request not only corrects the accounting problems, but also provides
a cleaner API for tracking audit filter rule additions and removals.

- Add a FSOPEN record to log the filesystem name in the new mount API

Close a long standing audit blindspot by capturing the filesystem name,
e.g. "tmpfs", when calling fsopen().

- Split audit's storage of process and file capabilities

Instead of a single structure that stores all possible capability
information, create a dedicated audit file capabilities struct and
convert the existing audit capabilities struct into a process
capabilities struct.  This saves 80 bytes from the per-task
audit_context on 64-bit systems.

- Ensure that the PROCTITLE record is reset on exec()

This fixes a problem where systemd would set a temporary PROCTITLE string
after forking a child process before calling exec(), effectively locking
the PROCTITLE string to the temporary value.  This pull request resets
the PROCTITLE state on exec() so that newly executed processes can set
their PROCTITLE correctly.

- Add some missing unlikely() annotations to the audit wrapper functions

- Clean up the audit netlink multicast skb length adjustment

Paul

--
The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
    tags/audit-pr-20261016

for you to fetch changes up to 5d59024a6cc9aa9300da59fbf7e2c29f1f2393c6:

  audit: add FSOPEN record to log filesystem name
    (2026-10-04 07:33:18 -0400)

----------------------------------------------------------------
audit/stable-7.4 PR 20261016
----------------------------------------------------------------

Christian Göttsche (1):
      audit: separate file and process capability storage

Ricardo Robaina (3):
      audit: add missing unlikely hint to audit_dummy_context() wrappers
      audit: use copied skb length in kauditd_send_multicast_skb()
      audit: add FSOPEN record to log filesystem name

Richard Guy Briggs (1):
      audit: free proctitle in context so it can be re-set by fork on
         exec_binprm

Stanislav Kinsburskii (1):
      audit: Fix filter rule accounting after automatic removal

 fs/fsopen.c                |    3 +
 include/linux/audit.h      |   16 +++++-
 include/uapi/linux/audit.h |    1 
 kernel/audit.c             |    2 
 kernel/audit.h             |   20 ++++++--
 kernel/audit_tree.c        |    1 
 kernel/audit_watch.c       |    2 
 kernel/auditfilter.c       |   86 ++++++++++++++++++-------------------
 kernel/auditsc.c           |   17 ++++++-
 9 files changed, 93 insertions(+), 55 deletions(-)

--
paul-moore.com
