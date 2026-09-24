Received: from mail-dy2-f24.google.com (mail-dy2-f24.google.com [74.125.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF14D90DE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282544; cv=none; b=FonKjNaWsqUx6QXEdq81Qa4o2tX5CcFnVuflAavqkdpanO6ZMMiupyN8QY/eDh9n9MnV/WAtH3SWJAa8yVCTlehBcPCVzwLiYOHuPGzD0RWbKJKW0x6Ch7a0M6RmrhuAfziC3bGXQ6tHVuGILP2T5U/sJBwvlYMXEfeuwE7J0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282544; c=relaxed/simple;
	bh=bBi9t3/XNj2fxZ4GFxBaUZi+HB2ny2QNyH+RsLcMXqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gwp17tgSBmnmqy2kgqWKxeBto4KiYkdTV4aM3nj+kQ3gJO0qlRCJ1Nfa0LhYv9ue9inmvUvq8/8O9XnFfVi1R1qYwKFrskLKEQepPE5z9bMINBo4jfLbJqghcGnOY8J77VaOBuGKMrw4I8+5agvfb1WuGQ8RUb26bZVfYrSPF6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKyfQYUq; arc=none smtp.client-ip=74.125.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKyfQYUq"
Received: by mail-dy2-f24.google.com with SMTP id 5a478bee46e88-328664dbdd2so56292eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282532; x=1790887332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Quf+BJxgePyIzaM/U+UOmAKPgAdi1GCD5xdWybO6rFI=;
        b=KKyfQYUq27vw2IMBkBhWY6gQ56fu6eoVeoWpmuzsLB3KTG9v1+7/LpUZC/t+tpSe1s
         3IRWzR27WvyFyrVJD7Op8kqMkjpsuPPxhyNfRtWKP9R+FB3Oi5Ai/aHclCBHmvMbeGUS
         Y0tts3OujfRoP98FUXek2VcLzR8DGb1ff06ZwlYFPncRmZD4c1lljGDD/vT+dwN6LufW
         y5irk3THLuzvuFKR2tOBKbjpMwvAXn1iALxlq8BqTz4Urrp5d7QM1lUpEsYVO0j0LPA6
         gQraca6Vb29uALaArMixJMGa2vT4bOb57vFXlbXnmDC6fP2aiNwSSr+FfJbmvBQW1hWS
         q9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282532; x=1790887332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Quf+BJxgePyIzaM/U+UOmAKPgAdi1GCD5xdWybO6rFI=;
        b=N+lDAx1mHZCkZxZMB/1MFLG66jTgC7Z3z8jZOsPiFuGGe/VFM5a6FtCkcl56Kv0oQT
         eHdY2Ix+pk4EPW3U2RBXpU+hLF3qbNxCd/eNL5EiUE+YBKVUFGxqqnWztXzXPslzIZ13
         k576ZvvIW8s84aSTIR62hpbWJPdJ/Fut+Dbuif/T4uNrbgeUhrAMUSdVfaVBrmGGQfiw
         K8pcakMx6jdbSGi3g/fetbT+iWgWS7GlEKBzJKM/DVmVnyVUecE194ofGx26xU+1wLf9
         h1x7ARN3PjggKYttpSDQDIXlloiSovOynw5nOpg2H3Lq4yaQ2UcEa/4X8woLzhCeHZrA
         pgLQ==
X-Gm-Message-State: AFuF++mOIK2VEDFLRXbNc3dOhAjhGkESnLXCD5yx8bEr7WMzDMTQebe8
	AOodUuHnOIp54vLbXG1a6lQqOn32O3+FuqzfRfStd7mnxg9jXm+3nGdb
X-Gm-Gg: AYBFou3gtsoAG2cn90g6UnbkTekBxkR3FdpVibMsxbjyZQffmSRT9TXB9Q51A2fRp69
	1s8+rNCTg1ukbaFcEGty03dEKbLXo++MbnqzypHHu3sb3JH3+EDkltUwtcU2hdxVYRBAe/uKSRR
	xFaRtORqek1u+CR+BfQHvTHOgu6NatcNE8jWwLaTUfSNeX1GQVfYkAAU3Qm2FVhw8PLRFH7qjcT
	un7BluAcMMdOppDzvUCE4hPk9HeR0peeyA9d5vTS7rEb/rrx3BiJ3QjOpV3/pMpvg6J9TkdIHgV
	wK0wK+B4PUHHKCgV2PXG4nb81uEXvFE1sxmUCRCZGctV7FYqFrt+oy7Qqot+DasSk8IshWJ+s20
	oOVxcVurrApwDnYhZ9RKXGCTHJXHc89+a/Vl7kq2wydIN6nkWD1ObRBoSQNgZ8Za8IHnV1ceOAs
	z6Sq3GhTtOm2Kw94uo0H9xbYOKc4ye4o9psbsTo8FIRGutXK0PYobm1V8/BJ+RvWkyDbsrRJzWQ
	uVovoIYOhpPM5VPiZmhXi/SWz2FjtoDbXg6uHYZyw==
X-Received: by 2002:a05:7301:e0f:b0:33c:29d8:bc21 with SMTP id 5a478bee46e88-34004a89af2mr2406330eec.10.1790282531857;
        Thu, 24 Sep 2026 13:42:11 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1073470eec.4.2026.09.24.13.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:11 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/3] seccomp: opt in to restarting notifications before receipt
Date: Thu, 24 Sep 2026 13:42:06 -0700
Message-ID: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

Sandlock is an unprivileged Linux process sandbox that uses Landlock and
seccomp to confine untrusted programs.

While using seccomp user notifications to enforce process limits,
sandlock encountered intermittent shell pipeline failures: SIGCHLD can
interrupt a pending fork notification and make fork return EINTR before
it executes [1]. The same pre-execution interruption can leave an
intercepted close returning EINTR with its descriptor still open.

Receiving notifications eagerly only narrows the race, and
WAIT_KILLABLE_RECV protects the task only after receipt. This series
adds SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV so applications can opt in
to restarting these unexecuted syscalls after the signal handler
returns. Existing signal-driven cancellation remains unchanged unless
the flag is enabled. The series includes regression tests and
documentation.

[1] https://github.com/multikernel/sandlock/issues/235

Cong Wang (3):
  seccomp: allow restarting interrupted unreceived notifications
  selftests/seccomp: cover restart of unreceived notifications
  docs/seccomp: describe the SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV
    flag

 .../userspace-api/seccomp_filter.rst          |  29 ++
 include/linux/seccomp.h                       |   3 +-
 include/uapi/linux/seccomp.h                  |   1 +
 kernel/seccomp.c                              |  16 +-
 tools/include/uapi/linux/seccomp.h            |   1 +
 tools/testing/selftests/seccomp/seccomp_bpf.c | 354 ++++++++++++++++++
 6 files changed, 399 insertions(+), 5 deletions(-)


base-commit: f2c53ea949c5048f96b3dbb5a5ee7131ce4ff2de
-- 
2.43.0

