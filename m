Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82A3DDB0D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394064; cv=none; b=pqZTSqr+DiINadXILJwlOu7XkLfh3RIami0MEb8CvASGGCFvr2SS+uRbEGDG/Dhghnt4OR2YBGwCTnKCiwnn9WHvlORcrozyKBylGyOgMXgBSUG9hpXBqlW5D9Tjs/pQO7AvP6wkfrYRvw0wF6Z4qfzYa4FK6d3iDCYy/lKfD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394064; c=relaxed/simple;
	bh=1IOBSbtm8blMjj4jz8ccFmyuAa7PBcQB3s4HZOXp5KA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JUPDS04q7D28eLMsGVqcEYv2PpuRHs1ftjhajILCzLMsfawV8isbUWALaVAOQEmGh81E+Ll2wAOE+Ut6bbSzVyjvU8oJKurQy9LlNQtOxKJPQq4fWqbkIP1ANr37WROeRjoL+J6wEYXTIf4ZGQj46yeybvsteF5n8vf7oF+wBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2Fc3Yy+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2Fc3Yy+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so12825725e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394061; x=1792998861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jADCjLU3MoUpjv4xpRKfYAlD1L0XyJcyjm1DBlO63j8=;
        b=m2Fc3Yy+VwfF59S7lVKWlq9ER1Gp3mrzAFacy8q4GQP9ejt+uKzwhF+pQC4Wpp/1Ab
         mEdlobbAy9FbBOgq/YVJYw4sN31PPomEeCT6qpxuuUWqzmcBs1G9BZIAEWojo4ko9PZn
         VV17NRIjG0PioYHXR+vU/+FY9xK3ok9S0KyJBgbQqS5tSH514jlZ9ygGDeb0ZpvpdPve
         rsy5LMl0lu1ee1AIO4n02EnW7+E1jKmVO5uRPJWNDyHXw0xxp+M72IKqDqSR6XEZOK15
         NQHM0hH2CvTx9VxAl2fSDldsGrn3knD6+3j0k6aPIDazeyECklDyFU59klCZKQeGlD32
         ndsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394061; x=1792998861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jADCjLU3MoUpjv4xpRKfYAlD1L0XyJcyjm1DBlO63j8=;
        b=KljtU6crdd6WSbMpCvfO5pFEz+YmfFNHUZ5TV9UGWPScje2XWaHCbsLi/6eBR5w3pb
         /+8rtpreNJ3HPVV/W1e5nFCahvNlda0shqBIcyaSCsfo+Lf0KXeEEJWNUTx0W4OnWgVO
         zNR7opmQzH1URC9MUt7F9UVnnSsGnHDx/0D6ZywPERqQyx7V2XSA35R38Nkpp4A2MrrW
         9eC3/TYtFyuFg9yWmdGdXJuGHjlsmIrxEqj9PW0HCvTkz+aqlG0INJYUxya3IfpfqI97
         rlqVJ9H/h6Ay0DYx5hcyzPidGk5AGuo+mQR/OjL/Vj+23n1UusxMlFyYvLbP8qIc4eBy
         WQdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw20UJ3OtkuDO2ac8T2NSMLj0ag2imb8cYjRIUc6RmGOvUmMIZ+mOfc8QabpcjKluNYkEbXM+eyNKU+VsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgzxLAsxOPwgHSh8RKhK/e1zlpofwSgBmuE9olAn/R5udjmLms
	VnbsY4mxU3Gr9SXkz3lv4+krHRascMnv8AhGQuuwOidY4ag780+Ydrj5
X-Gm-Gg: AYBFou27MF1v05MsXaCAkj72hjW7nYyDrJgzzQQTk8xI0byNqlm60OmtxamrtaYNh/7
	aNKYKex0e2ftSCGSM0SY9guQbsa1Ar1x2571ZHbAKWwHmg/FOe6T/BvwOnTx4449NqsKvNZ0TTV
	ofpC5Ly5hVg7GhVveHqH6JAffe1+r8JhTeBAuNCsbCJ9hgRc4VLYiCTp2WfUjkcnJjJq6+8G2lX
	46BlruEvANxrdQ6dL+pL9UW9BAHCitUATK5rRgBiZRucms1cCiK/Sb3+K1hJYErwjjFldvC0PH7
	NXLM0bX5e9+E5wXfAKCnrV7P3jp5qE3TUZLlRKEud0+9lmeHVmccIlIs1UkUvYCMh9UcCjoIIO8
	n2WtXR+4WpvggSJCjjZuAC8pzTsgMKGZ6Eipl6uy9zMaQ1Qzer1BtVGfX0+r6AH17nx0LC163xf
	ffZEPe5GUpVlh/USigJpdaMk4NVMNf27BiOfaoc59v+Al5n8RO5pIS3wohHdiNO7jP4jmIxVfcl
	ald6PtoYzaClc6qYU5kLPiyjHUk6P5vgcAyW8GKvu6GpkiPCW+UJhnvnFAXTvEoeYyHD4+EHEpv
	ulcWDoLklkbugV2SEuS1UKJTalCnazLIHOByYpwLL4lvrEaTC72YTcJ31ZXRhCFae7t1pmvu0vM
	0
X-Received: by 2002:a05:600c:3513:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a1d760e58fmr141500925e9.27.1792394060636;
        Mon, 19 Oct 2026 00:14:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 0/4] media: synchronize CPU access to imported DMA-BUFs
Date: Mon, 19 Oct 2026 09:14:07 +0200
Message-Id: <cover.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UVC and vivid access imported DMA-BUFs with the CPU without cache
synchronization. On a Pi 400, captured data remained in the CPU cache
while physical RAM was stale.

Add an opt-in queue flag to bracket CPU access from buf_prepare() through
buf_finish(). The allocator cannot imply CPU use because some vb2-vmalloc
drivers pass buffers to hardware. Patch 1 balances finish operations in
VIDIOC_REMOVE_BUFS so removing prepared buffers closes this interval.

This follows the per-queue flag proposed here:
https://lists.openwall.net/linux-kernel/2024/06/20/236

Based on Linux 7.3. Tests cover the same code on these earlier bases:

- Pi 400, 7.3-rc4, all four patches: eight 640x480 YUYV frames per run,
  imported CMA DMA-BUFs with a DRM device mapping:

  Path                          Runs   Stale frames
  UVC, vb2-vmalloc               12        0/96
  vivid, vb2-vmalloc             12        0/96
  vivid, vb2-dma-contig          12        0/96

  All six lifecycle cases passed with both vivid allocators. Read-only
  output USERPTR passed. The test added no warnings or failed CPU-access
  callbacks. A control without the DRM mapping found 4/16 stale frames.

- SAM9X75 (ARMv5), 6.18 backport of all four patches: the baseline
  PREPARE_BUF/REMOVE_BUFS imbalance was fixed. USERPTR and six lifecycle
  cases passed. All 128 vivid and 96 UVC frames matched RAM, with 100/100
  begin/end calls. The baseline was already coherent.

- BeagleV Ahead (RISC-V), 7.3-rc7, patches 1, 2 and 4: read-only USERPTR,
  six traced lifecycle cases and 60 repeats passed with balanced callbacks
  and no kernel diagnostics. A vendor 5.10 backport of patches 2 and 3
  captured 96 UVC frames without stale data, with 100/100 begin/end calls.
  Its baseline was already coherent.

Karl Mehltretter (4):
  media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS
  media: videobuf2: add opt-in DMA-BUF CPU access
  media: uvcvideo: synchronize imported DMA-BUFs for CPU access
  media: vivid: synchronize imported DMA-BUFs for CPU access

 .../media/common/videobuf2/videobuf2-core.c   | 96 ++++++++++++++++++-
 .../common/videobuf2/videobuf2-dma-contig.c   |  5 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  5 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  5 +-
 drivers/media/test-drivers/vivid/vivid-core.c |  1 +
 drivers/media/usb/uvc/uvc_queue.c             |  1 +
 include/media/videobuf2-core.h                | 12 ++-
 7 files changed, 116 insertions(+), 9 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.47.3

