Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7213380FD6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132476; cv=none; b=tpQTcA8hG/KfpsUdd5h3qHfoqUItAlR/L9gTqFy3cDHSbJDI6eNEZIeGYKKkJyHUz5nPgDaUDD9bsybg+Skcbrw86jXPROwCu9ieDvty4NDMdq5VRzFvPIBgugntqkwfD1FjCOezpbUDq6QPPt9kImfxWQINcDjG4w9Yk4ujvl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132476; c=relaxed/simple;
	bh=kzS7VwfoZu/q+MpUppGjJ0x5vjYk3q1oxntQo2bzQVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jigSOliObhXT0IJuFd7ILEsnxh9QyCRonUIDcmZaZY0xdHHRRp0YqKSF/NlmciB9TVutgmzmsBTlaa3EaCl5IGpbERkHP43wjHVT0HltigrQLUYqBaLUHg1GBhDedtpOHRLrth9tQ393hQDNghP5zoGqfHWrcDhARetxbOvOxWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=mhHABKTy; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="mhHABKTy"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3a476ee8669so339609a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1791132475; x=1791737275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MplwpeuSIBeXa4kTMHRjBXSdtpzWWqZO04EAnu2iID0=;
        b=mhHABKTy+5i/0NqPg034Fs+a5q2FE22UJEaDJCHEgdqXwI4/JRff1BriyC/6urF8aD
         M4BHrsA2RfuMZdidAFLiTkNDbPMfkE0LgoDtdZoKJZ70O+5Fa0j0LAkpgqyrOJ2hhu4r
         womA66v5LXKG4D3PdHvbkVAJat3NSdRbMvjZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132475; x=1791737275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MplwpeuSIBeXa4kTMHRjBXSdtpzWWqZO04EAnu2iID0=;
        b=ExpkPS+Oh/2ToaMzbfjF7vG3nBZnDRQU6JNj3agMt3ktFGELh+OvOAJc/Hxtj4WNjJ
         9k7se5oQ9J6Pw2Kh9Q12zgjqav144ZlZjWDU8cQuKYZf/hE5plCKFN3cIGSxZIw0vvB1
         LVD42ooIhDE47PEPeJX2jj6EUNnXMsIxDB7HltnkWlvuT5irn6a3NL/NLD4nkF4i19ox
         H0dozA/LadBWlDXBVGrIgzksAObQGYGe5lrRAsiKUBwdCMqjpup7fBYnDeXo7D2igxtv
         NDtTMXGCtaF9f8KFDoMU+7Qenz0zx9VetiH+Fa77GVMrw/lbOV1/fOWohtaP7gtYQKzk
         Y1bQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4qKMP3zxbVK5yWr5AJIT7cRsNIMYqjgZlJ34pbkzy9r/c9YcKv/7vVr37a9Wlk5BZe7+fHQ694AX21L0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS7HZDWIn6aWv5mHHcpSP0lD+yTideoT3le+jgsSG/DGE/Txrp
	Uh/nlza02js13ZoFekdkJZvmerOKS6hdrRXssLYIEoox6DIqFQ1wmNzWGeyYvbsdRuY=
X-Gm-Gg: AYBFou2K/vOVnTTE28zXYMGGIQSZnpPldgeiFTUpkCG5V5JpM5NVxzbN3YLF0IkCYs4
	FLlBIv8N3WjMCMV1vCp2kQYM9xZsKskpACqUSlpK3jV8huhg3na3qYgO8eM6Arxl0TIdXyGLSIx
	Ook1jrL8bXHGprIqqz2txU3wVZE3ABZOzHabKnIwYxJiE+RI9Yv6/cXH8YmxaqB3GlAmQzTrvTK
	VP9l2dvWriwVvAOx86P6pefXbqX1/PRG64uXdjZg5QobOlBAsp4ZTDsWPCmvEsL8kOpz8ct9aUL
	SGwmeSXRGAi35r8S9dPbH/3axnjbnzAgU8q/QjOrsLvnafgsw+V95Cp6zJpQ4x6F5CKiBQ5AJje
	jiG+iuFgujP81H+Dyiftl8egxTfsNpMaYQjsuabImnFehxlJUuk7EpgAVCqeU/QNYuZwNyW5E6r
	Cb2HLy+oLEga2ftnhOWrzgSsL9aMx2A57Y7kgK+uyTCQRHlQhYHzLM5PT/gGyM30HQuhMs04cx
X-Received: by 2002:a17:90b:164b:b0:3a4:9859:9749 with SMTP id 98e67ed59e1d1-3a7873dcbc8mr4126659a91.38.1791132474877;
        Sun, 04 Oct 2026 09:47:54 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm6500454a91.2.2026.10.04.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:47:54 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v2 0/3] accel/rocket: Validate task regcmd fields
Date: Mon,  5 Oct 2026 01:47:24 +0900
Message-ID: <20261004164727.466164-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 3 rejects misaligned regcmd addresses and out-of-range regcmd
counts at submission. It is unchanged from v1.

Patches 1 and 2 fix two pre-existing issues from Sashiko's review of
v1. Of its other findings, the ignored submit error [1], the
iommu_group leak [2] and the unchecked allocation in rocket_job_open()
[3] are handled by patches already on the list. Until [1] lands, a job
that patch 3 rejects is dropped, but the ioctl still returns 0. The
__u32 regcmd cannot truncate an IOVA, as the rockchip IOMMU aperture is
32-bit.

Tested on RK3588 (ROCK 5B+): Teflon MobileNet v1 output and latency are
unchanged, the bad regcmd values are rejected, and an injected
drm_sched_init() failure fails probe cleanly.

Changes in v2:
- Add patches 1 and 2.
- Rebase onto drm-misc-next.

v1: https://lore.kernel.org/r/20260711062137.36044-1-sidong.yang@furiosa.ai/

[1] https://lore.kernel.org/r/20260828064152.37822-4-Naixumogu@whut.edu.cn/
[2] https://lore.kernel.org/r/20260610071045.3414828-2-zhaojinming@uniontech.com/
[3] https://lore.kernel.org/r/20260818041505.1579320-1-triet.hoang.dev@gmail.com/

Sidong Yang (3):
  accel/rocket: Don't tear down the scheduler when drm_sched_init()
    fails
  accel/rocket: Use an unsigned index to copy the job's tasks
  accel/rocket: Validate task regcmd address and count on submission

 drivers/accel/rocket/rocket_job.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)


base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
-- 
2.53.0

