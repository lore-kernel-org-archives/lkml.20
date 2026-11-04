Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826535;
	b=oon80m5co5hh3iToELOAsBeQVPy1Amy9wYNyodnj0so0SRvWvDTwOUNHnHohbpjyDRH8
	 vOgNHQJz4mzJDjEZxwbxZT9PTmdeeJBBzro46xXu7XdnmqvrIcgITNp8bWFUCld1urnH/
	 TPx7en6q7GUVpnXobUo+eVbMMLjyHkw4y2Q9UkMQjK8L+8jcSzc/PRaYnam7TIdqj/x9G
	 QEet7b3BoDM9UC5tovFwvLzhRw/azuWd/iqEdJNloUJR32Sf9v33yGMPXFTw/BDvnngmd
	 FVLSWDeLRRQZCFTSKwsPgrDbaLdgUf2+ZDv0n2h5kAdMDcL+7zYidYKJgNeuLQkxHIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4OSWRtRd+V91Vqwy50g3O6DPEqRmvPxAQw2Z2wGJO2E=;
	b=ffQVEretUf4eIYyExgCTj0tE4bmANO69mExkpSVQYlbA7EcC4uSmtIUT5YlQLZ7rwLIm
	 k4g5x4+WXQZN1JIjV3ml4GTbWHAQf/CzPAggih1Vq9A6AGnLBP9baE3lFgZgaayzLnNuT
	 bpeCmy9oAgbqF+iQ7ypMAFHv2Eo9VMydzSOFnsHKs+1WpdwApxXFaui8Bc7AgbTlno6/7
	 98CHgrYuG1IDB6kzvG0GVG+hO7OdH/hF3gyhEWQ73fJbRihBtBtdVZr9983wlEXUDYG7m
	 Rtuy/BiPjhiAUkYMuDwuHzTubrEtOLPBArjrA1bYUY4p7xkfpyfvk3k6RQGCqbiBMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRxGPTfT;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B54607C096
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B54607C096
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRxGPTfT
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so9734245e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826534; x=1794431334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4OSWRtRd+V91Vqwy50g3O6DPEqRmvPxAQw2Z2wGJO2E=;
        b=gRxGPTfTWalo994sN1tcM8Gk6GH7B3u/3u+F1Kga5xftUlTlJ+u+1yOwZSLEM7R7aJ
         FROykiffhUmwAaJBOn0r3S4I4IVM6erRuf77jUBCj/eO3FvlzgriebXvlaf/6V2eH3Mo
         fsMxDzITqnq6BNLn+6zyyLxMSXv7hPNPgabFJN6NqxKx1PMIqDF5W7vE0IYAhha9OD9C
         RwADQixSQl4Dp1d85S/d/e7/WsvZ4wtQS09FmQnCTMi3VFAuLTPeKr8rK/93/TJ5UHSy
         SiwtgOkxGsRhFm9044+37iy+D+5GlNp64v4HTtASP34RoGpoImJsKaN9+aBo3owFhhJY
         Gf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826534; x=1794431334;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4OSWRtRd+V91Vqwy50g3O6DPEqRmvPxAQw2Z2wGJO2E=;
        b=FlSMAtaaFRVTymA0N9eH+HX/Wnc+8ydHOIgMnTckMra6aimJt73x7DLGxxYaiFwfFd
         yx01hs07ZlFuWjL9kyIEgHoua+SLGr3Jiu+KI8prXzapOHunV76mgmg5X6ubI8Zqz5dj
         i57rchnQENRSl7QoAcSc6558kElpAkWecVuhWoAvUJ9VSrZGArwpOEhqyVwJie+ppiVs
         i91VWT9kqcWOdrTPijUdLK0a0+LUrrr9tBaBkK2kU6y+vi0hut3A3e/2EkgED2fXcStp
         jcpe/Y+0elVZHZp0PY0tbh6bS11STm6o8y+R26E9ndFxTaLT6Tp1R3jOVxM16ANsjsF0
         1FuA==
X-Forwarded-Encrypted: i=1; AKwUvBxCseBWx8qvWWXky4pPfxqQjvzH7SzaN02hSCRwA1A70zDcgC1NxpJg+YrMAZYEoLBdllfRdDyfDqIvfbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OxivkJssi4qYKlXbIbOAUrgqGRehLXVpSxQ7NPgtX1qWQNgGI
	2AuYYlEmd/omUT9HRt92bPhLvZqOF2cKFEqwuSOdOdnPKPXlidBLuDE0
X-Gm-Gg: AYBFou1fDHd0re+QVaWQuFGljrrcE2XUl2pXlUY9FJpO5x/biJJCsUy66Oiz90mMBWf
	4NNWe8sUUzj57+pD5G5rYREQqt98V3rHGIumjABUN9mG4e7efECggQHyXqnB+KZjb+VHkBz6Mm3
	KWytB9DnSUnh4wy7wdiPfjktY21wfJLRt3LfGN1XbDiW5dlbmOqKcmnuP6rhrjYNAWvjNT5zr0s
	hKqElGcbmAlNhRA20BMUVW93qIC7UT6mpu+bZ1NKe5TrQydorCwD3HHQN2EadpLFHuAYOo+yFY8
	Cs9UVOW21eSo5rlp2F2M/oF0/9YUBh5v/uxU1Z6HhXidkrxGgA94y8Zy4UXjw5D9YnRlcjqevOV
	drM3kSgNcOx/fQ9eQW938qtz/cS7zphSMvmZzJyJHkxzh09gy2errxQjUfTCxbmX4SXiL9pfHWc
	aI4MBCa3jkW9A/kxA4h9g5kDEmTD91AA2wp4x65XgHfMlIubomhWKyGBwm3BtVkiCmJnTVoNirm
	XhEujFOY2tBSyW6PEz2oIHFglalq5yA3m378HoW0Mi4mZ5wHmvRKNzWV4HdfklKkowBGQM++/LB
	vaXM6D1dVCW4RloFkeZo3dJwfYQ3FDLBgYMazQAGh6EQjIw1FZ8jzg==
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr391930765e9.18.1793826533442;
        Wed, 04 Nov 2026 13:08:53 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844c8sm6227254f8f.26.2026.11.04.13.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:53 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 00/27] landlock: Selftest fixes and cleanups
Date: Wed, 04 Nov 2026 22:08:46 +0100
Message-Id: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6tmRaGlBX3sOwKHUKVaGmU4mGc
 HdbXLh2+fLnvz8LIwwOiR2LhQWcHTk/JZC7gplBTz1yd0nMJMhaCFCc8G4jUiQe0GoTfeCqUaJ
 DUBKVZan4SIl7bdJz+2V6dlc0MZvyhQ1+5HEIqH9ygL1QsgZVVgcBDZe8n7w2twoATv2o3b00f
 sztwVGafW8/zyKv/GVo13X9ACDHseb4AAAA
X-Change-ID: 20261104-selftests-refactor-4741be042e4f
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

A collection of Landlock Selftest fixes
=======================================

This patch set is bundled together to be slightly less spammy,
but the patches are mostly independent.  The commits are ordered
such that the simpler and more orthogonal patches come earlier.

The patch set is LLM-assisted (and that turned out to be very useful
for spotting errors).  Needless to say, I have verified all commits by
hand, and reworked them where necessary.

The last few patches are a bit more cross-cutting and probably more
prone to merge conflicts, as they correct cases where we have been
using EXPECT and ASSERT in the wrong way (details in the commit
messages).  I believe that the rationale for each of these is
reasonable, but I am happy to discuss.

Motivation
==========

LLMs (and humans ;-)) have an unfortunate tendency to pick up and
replicate bad coding style patterns, so I hope that a broader cleanup
of the test style will avoid this spreading further.

–Günther

---
Changes in v2:
- Rebased onto master (v7.4-rc1-132-g05441d697f7f).
- Dropped the "Assisted-by: LLM" trailers (not required any more).
- Applied the same ASSERT/EXPECT rules to the test code that was added
  in the meantime (cap_test.c and ns_test.c, plus new checks in
  base_test.c and trace_test.c):
  - "Assert tracefs_extract_field() results that are used": also the
    new handled_permissions check in trace.create_ruleset.
  - "Assert audit initialization in fixture setups": also the
    cap_audit, ns_audit and ns_proc_open fixtures.
  - "Assert audit_count_records() before using its result": also in
    cap_test.c and ns_test.c.
  - "Use ASSERT for syscall failures before errno checks": also in
    cap_test.c and ns_test.c.
  - "Use EXPECT for checks that later steps do not need": also the
    errno and WEXITSTATUS() checks in cap_test.c and ns_test.c, and the
    errno check in base_test.c's ruleset_with_unknown_permission.
- Dropped the note about depending on Wang Yan's snprintf() fix, which
  has landed as commit 8e4c736cffdd ("selftests/landlock: Fix snprintf
  truncation checks in test files").
- Link to v1: https://patch.msgid.link/20261008142604.39107-2-gnoack3000@gmail.com

To: Mickaël Salaün <mic@digikod.net>
To: Günther Noack <gnoack@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Günther Noack (27):
      selftests/landlock: Propagate grandchild failures in unix_scoping
      selftests/landlock: Propagate EXPECT failures from forked children
      selftests/landlock: Check the thread result in audit.thread
      selftests/landlock: Zero-initialize the buffer in inconsistent_attr
      selftests/landlock: Fix the openat() success check in fs_bench
      selftests/landlock: Fix the reported clock tick rate in fs_bench
      selftests/landlock: Fix the ruleset_fd check in empty_or_same_ruleset
      selftests/landlock: Handle a missing control message in recv_fd()
      selftests/landlock: Assert tracefs_extract_field() results that are used
      selftests/landlock: Assert audit initialization in fixture setups
      selftests/landlock: Assert helper results that are used afterwards
      selftests/landlock: Assert audit_count_records() before using its result
      selftests/landlock: Fix memory leak in audit_init_filter_exe()
      selftests/landlock: Make audit_message large enough for any exe filter
      selftests/landlock: Close leaked file descriptors
      selftests/landlock: Check errno for combined VERSION and ERRATA flags
      selftests/landlock: Fix SIGURG handler setup in scoped_signal_test
      selftests/landlock: Fix regex_escape() error handling in matches_log_fs_extra()
      selftests/landlock: Fix off-by-one in regex_escape()
      selftests/landlock: Fix the snprintf() error check in matches_log_fs_extra()
      selftests/landlock: Use _exit() in the named_pipe_ioctl child
      selftests/landlock: Fix messages and comments in helper programs
      selftests/landlock: Fix stale comments in common.h and audit.h
      selftests/landlock: Use ASSERT for syscall failures before errno checks
      selftests/landlock: Assert WIFEXITED() before checking the exit status
      selftests/landlock: Use EXPECT for closing FDs and stopping threads
      selftests/landlock: Use EXPECT for checks that later steps do not need

 tools/testing/selftests/landlock/audit.h           |   20 +-
 tools/testing/selftests/landlock/audit_test.c      |   56 +-
 tools/testing/selftests/landlock/base_test.c       |  192 +--
 tools/testing/selftests/landlock/cap_test.c        |   70 +-
 tools/testing/selftests/landlock/common.h          |   32 +-
 tools/testing/selftests/landlock/fs_bench.c        |    5 +-
 tools/testing/selftests/landlock/fs_test.c         | 1300 ++++++++++----------
 tools/testing/selftests/landlock/net_test.c        |   64 +-
 tools/testing/selftests/landlock/ns_test.c         |  124 +-
 tools/testing/selftests/landlock/ptrace_test.c     |   44 +-
 .../selftests/landlock/sandbox-and-launch.c        |    6 +-
 .../selftests/landlock/scoped_abstract_unix_test.c |   45 +-
 .../selftests/landlock/scoped_signal_test.c        |   23 +-
 tools/testing/selftests/landlock/scoped_test.c     |    2 +-
 tools/testing/selftests/landlock/trace_fs_test.c   |    8 +-
 tools/testing/selftests/landlock/trace_test.c      |   28 +-
 tools/testing/selftests/landlock/tsync_test.c      |   22 +-
 .../testing/selftests/landlock/wait-pipe-sandbox.c |   16 +-
 tools/testing/selftests/landlock/wait-pipe.c       |    2 +-
 19 files changed, 1051 insertions(+), 1008 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261104-selftests-refactor-4741be042e4f

Best regards,
--  
Günther Noack <gnoack3000@gmail.com>

