Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF763B4E81
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467741; cv=none; b=lvxgDgQXALzrvRWxzj5jwerutkdcWCi0OwQ0oD9XWs+rSKRTAlHowgPa4dUUi9KbAL1P16Ygf/AFvrkacYBNOq/vSP/Q8I+mKaP5iz6evmi8oCG/dwAs4B5iSnqDw360gSVP4XfkN4OjOQzWeluxjaEBFKI1N8DUGa8sNhzx7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467741; c=relaxed/simple;
	bh=9uWd0iWTHtgoOPQrB8sodf7NrxSHcMYqSafeXFsJ/Mg=;
	h=Date:Message-ID:From:To:Cc:Subject; b=CxKQXhkMi82mwKIvRt32VW5O9gaShlfu1lMsUt2gW9HiG1m6GoxmqYOL0/wrLJL2kjQPsZoKyPNUUiFo1PZCqWYxS2/Lncz3Jx+4QLiVa5UXdUrvMfdJfvDSqPZNC6qFjZEDEnj6XdvArrsoT2dSI7OxPFSC5tB/fdfNSodfaJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RHQF0cjB; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RHQF0cjB"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-938cd95b06eso31739285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788467729; x=1789072529; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgZOKPlak6pP0U7KmyWbsU79GCeGbr4ZhDTeyjd+peY=;
        b=RHQF0cjBtrfmsK62fMliV4TZPzmAVUhmbKA1iOju8Cp7W+ECT152FENTL6yKbQ5Mqm
         ANOJnsaEn5ihqrsFfDdNDbKzsYNDuFn+5/hIp+SPxMZfCauOmvxtq956CQrD3mdqh7qy
         4R+3GTIjFpQnnS9kIcJTq+iizD4IK6riW/LV3wIVeGFh3OlzYnTBwF4Q9GdOd7eat2V5
         3dCUmlN2GfrLvUF9daY+yA6eiTK4E4jXj+0NkdWakob9xHz5H62012NbKdRxIDdILSiN
         pHay5oBoC5/0lNC3uihAVkmnenH3KUZ9FP85bg3TPmBXlpyRhfFW9NedQNhYW9krIYHd
         GgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467729; x=1789072529;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BgZOKPlak6pP0U7KmyWbsU79GCeGbr4ZhDTeyjd+peY=;
        b=ZjP4Ivw0K/He/DJYnDWagWjK9iLroYkbDigclOpN7KiK0DH5w550uj7aPobrH3ZntW
         K7K1xg+49t5Cd7Gfby21nI5hnzeEp7yl99ZiD8wRdzs/3O9Yb9JB5icZ+M4BnxTOyXrm
         nZP5S6V+LTfoC+6GHYIGti2f2wL72LUCfawo4fEnkoK1FuKPAv+fPXe7mjhXsi+THRNg
         UilZDyN6Lns0SYLvQfAUZHPNekKJ3yJUtgS3S7tuc7ijgJMElgi7v3NqXZ5G9PuST6MY
         8v/sPXikfWAxydOtDxKV9LU1Q2QWZBSjbtRYMEGnJiU3sSU8n2YNyRy6h5zXhgnuKvNA
         AePg==
X-Forwarded-Encrypted: i=1; AKwUvBz2ZkW3EVvKWsnha8nfR5QTc9fgUHMgI2TzzZVB2/nLA7iiWFZwr4bjDKi5v5c0NEbRo2uE8Ctjfnrv+cE=@vger.kernel.org
X-Gm-Message-State: AFuF++lHAaV/zFtkr0JPbQngJVC4pNC3mOE9M+Nn52eWPh7imx1P4+Vm
	NbmqHhAER+uaf1bsA/Z69hI8pxWnTJzoenWUfxlMOKgaBIYCg1DBClhCxNG0uixTIg==
X-Gm-Gg: AYBFou2b26ty7A2xcZfI92mtNSiMMahZlnUvOM5Cr0G+Be7VRzcqSU4AUQEiepPYRm2
	5HNWowGy7NNOCGx9AdKWlaXljVdRHvAKb69mqTv6tqTjm7fQFFgPQV9dBpuI0oBjyfzh6MBPzwS
	ofGervRTny7U73xN5AiodaZgW6dGSZj/mEGRCE0r1hvGE+ch6PEBbLmVHBXHsafVfRDq1v4z+zn
	84NS6XjIIOSHGyCu/BOoRO0iFEpNJFLFm79WLj6V3wgH0ay3gCGAvlffgX4hLEn90Vz/yz55XSI
	Bl/OwCMwIKaoyuxf7Y0D7UMn/n0U4IbqeKofxC3hg1xcjaVghivrw7EShoXcP9gyfGelYKe+YQC
	pOq5nUPIyxVEGbVIv0BrkNdPTcSuygGPBqdnrdV6MbWEZel4VHSMsc/BuoJfeI2dfFmmEx62IA1
	M3N9L66g6Qostot3a7BFqKSvgqMsSVc5QXJM4X8xNV9P7CNFgj0Hevc/bSAgWt7jh0cfpzWPLIz
	ydXzas54vFVppERtivJ1JY25NPWg+DmuJ2FynPxgSKBzczJFCzKLzka
X-Received: by 2002:a05:620a:2856:b0:939:cda:46ac with SMTP id af79cd13be357-93981737ffamr29121885a.17.1788467728670;
        Thu, 03 Sep 2026 13:35:28 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb70fbdsm50115485a.32.2026.09.03.13.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:35:27 -0700 (PDT)
Date: Thu, 03 Sep 2026 16:35:27 -0400
Message-ID: <8c72adc9e5a9d3ce854fab61ec5f66df@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] selinux/selinux-pr-20260903
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

Two SELinux fixes for the next Linux v7.3-rcX release: one to fix how we
lookup a BPF token's creator label to prevent a possible TOCTOU, and one
to update Ondrej's email address.

Paul

--
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
    tags/selinux-pr-20260903

for you to fetch changes up to 4299767d772d4e498998e32157e45841178ab192:

  MAINTAINERS, mailmap: update email address for Ondrej Mosnáček
    (2026-09-03 16:24:05 -0400)

----------------------------------------------------------------
selinux/stable-7.3 PR 20260903
----------------------------------------------------------------

Ondrej Mosnáček (1):
      MAINTAINERS, mailmap: update email address for Ondrej Mosnáček

Paul Moore (1):
      selinux: fix BPF token permission checks

 .mailmap                 |    1 +
 MAINTAINERS              |    2 +-
 security/selinux/hooks.c |   36 ++++++++++--------------------------
 3 files changed, 12 insertions(+), 27 deletions(-)

--
paul-moore.com
