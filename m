Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CEB3822B4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877438; cv=none; b=HTmHJJRK1lX6SjcukvF8oMrjg4+M6EEMPIWpocuO5rVlK292lEfZwSng/z3mZ6bdTzAsEclG9o4GWQ6U6BYga/C4vaicWCS71Yt7DtxGYM+xaQftibh/93nXPmSsPrw5i94SVr6ewC00RtrG+B4V5FApc8vVLOW2QBMgdlS9pAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877438; c=relaxed/simple;
	bh=DgZc9TaOzYmHYSvKJq23geFrfrxuctba2uQ61M8yVKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSLnf/5rut0fYdekKFQrQ7Kz/aNvX58W+flXwgaBs2fKdYKz93Qe6h1Gn+q/PjZjODcO2CEREjzUt9VTQh1EBNG8dSdMqVO4DfoqdgstT8fGiWg3uaPWrRtjP/1E0IKbpPBtnRhCE2+VNiGYzGh4PIFe50q70IxcYFPqGDb53kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWpy+7MW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWpy+7MW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1592818a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877437; x=1792482237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZK1NeHdcHM35sHEDjJ2Bqzc2/PgsQjYGP/lMmIlnTdw=;
        b=PWpy+7MW2HrjjKxdUyB5uzBtTmBE1oKDszK/ZLHgHXbiymkPOYdUtYijfPYzzZzcxs
         cBWTU52I+vqE2ztG7NkU8htO0t3ZaeLXkv94MVB4QPT+L8eorOJYeyMjciZB8a11XgiU
         u2rdJinZ9+RUxaUlsaejk5BRTdADTWIrzCfbVH7s1BBjT7CLc27tNmdsK2n4zjkSsEl2
         ySfdqISMbHfqd2Vt85EMpujbjDRoVw9IUWAHO7MB4h/yAiSfM+MVUsAcLoZeafBwVGlE
         wY9bHrT7XP1IJ7H1jsdMM5uy29TMEJenzL/7G+4Fe9mVqbrwELnHQwRcj08LYj5TlEti
         B2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877437; x=1792482237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZK1NeHdcHM35sHEDjJ2Bqzc2/PgsQjYGP/lMmIlnTdw=;
        b=XAfyBFYfMafwawsj92Fuef5JSsCsj9s4t/jb9eAV3T5ZW4jMhI74CVW48lLpxvmtUi
         8ZmcajT0/JTCGcz/g6ii4uBd4XqVclv32sTPXglP1d+TOZ5W8Z5XE4fU5yfexjhlweot
         vVosE1RZwTEYE1fhQo10tvdnFoP3K5TwHs6WKDyd0mdqNkfdD/A4p0sJ6BpKKfhnL4p6
         skw4NH/4/BvUcN/T4hyUA172H1VNN/GtlEVvoVZrdi6px4fPPH+bxoRB5SgTkKyXHkSz
         gqluGFkfkcm316t3zSU+dAqVUXa/btTdqZw4RZPHoiTvfzpfLn8uX5gEPpZfVvHlaLD5
         HiCg==
X-Forwarded-Encrypted: i=1; AKwUvByqqhK8cArruVujcEY0UUGy7O6rDjhzJtIF/bA6tcG49p1UCQFzyCUQ640sc+aLEHkEyKhxPP69ODES0Rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1+LNVD/53hrvywYyA/8ejsSo4xjqpdkUXP3O/yIkrid9h129p
	CjBtcSWaeN+AuyVK6M/c01FyjmOTx4zlsqv9BVASGLjFqbWhiLAq5ay+
X-Gm-Gg: AYBFou1aXWODcyaYnC6riLnJeS+RtFPY5Tt/zTrSxZVSq57NCvSJ4EHW1p+7IpbLzdu
	5Rl0FgdUi39MFu6mNlucyGx0hHpxhqskuwvLm5jb7M60R87KB8BIp9ANKHLZA+AYxWG/HYHLFrQ
	m9+mHSlnyij6cnMbDQEXfZ146vSkK+49Mom9VNFyGxv41MiEKwlLQWoCtblbAYVDA0MSTYxZ/hq
	Vqx/V3x8RdMy0F7VkZabjSa2gczgoP0ZV7j8JyJ8Dd4fnU0vDA6+fqZ+UI/PBGDOwf7378woD1/
	SDSpVEf5Ue46qcqSYZBBjHI9oYxhwIQ8feMK+RZmtkCodww2b9itSIMROjWhGgPPdb22spDkzjr
	MaCJgg6C04sElvI2hpeEjD6YcJqSAyO9kR1XzSklgxtxpOBf5ffInpudP11HWf/vyi+BRysgU8l
	q/avSd3VBrftYJSAlH0tLlsCO7TbRNA18jbmIlbpt+X5bW1q61pRSAjLBXlPdM1WeZDKgJ43PNg
	/0h4BB+VRZkngFaTfBK+kfkKDiizujifuRRPjHBAcpSsKUaNaqf4ff2zUS6R03ySUuNIrPOL6v7
	T6gdjHLkILUX7t3D
X-Received: by 2002:a17:90b:4b:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3ab3a9a0c59mr6091973a91.16.1791877436619;
        Tue, 13 Oct 2026 00:43:56 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm20552825a91.4.2026.10.13.00.43.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:43:56 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2 0/5] ALSA: virtio: Fix request lifetime and error recovery
Date: Tue, 13 Oct 2026 16:43:45 +0900
Message-ID: <cover.1791877396.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed PCM start or a timed-out request can leave virtio-snd messages
owned by the device after the caller returns. Retrying can then reuse
pending messages, and freeing ALSA or control buffers can leave their
addresses in a virtqueue.

This series fixes enqueue-error recovery and keeps the memory referenced
by outstanding requests alive until completion or device reset. Reset
also detaches unused descriptors before deleting the queues, releasing
their DMA mappings and cancelling PCM messages without reporting them
as completed audio.

Changes since v1, following the Sashiko AI review:
- Patch 1 propagates enqueue failures through ACK. Indirect PCM state is
  committed only on success; a failed transfer stops the stream and
  returns -EPIPE rather than allowing an out-of-sync retry.
- Patch 2 is unchanged.
- Patch 3 detaches unused descriptors on all queues after reset and
  balances PCM cancellation and control-message references.
- Patch 4 supports NOMMU with an owned, zeroed buffer instead of rejecting
  an ordinary kmalloc-backed ALSA buffer. Capture copies are bounded and
  disabled once the stream stops.
- Patch 5 separates CPU metadata from DMA storage and aligns each DMA
  region to dma_get_cache_alignment(). Control-send cleanup also uses
  explicit, balanced locking instead of mixing scoped guards and gotos.

Validation of the final source:
- Source-extracted ASan/UBSan regressions on macOS arm64 and Linux arm64,
  including expected failures on the v1 ACK and NOMMU implementations.
- ARM64 W=1 module builds at all five patch steps, plus an ARM32
  CONFIG_MMU=n driver object build of the final source.
- QEMU ARM64 KASAN tests with delayed PCM completion past hw_free,
  delayed PCM_INFO completion after timeout, and reset with pending
  control requests. Each case includes a subsequent recovery operation.

The QEMU tests use a synthetic audio backend; they do not validate a host
microphone. NOMMU coverage is a compile and source-extracted test, not a
booted NOMMU guest. Cache-alignment checks are not a physical
non-coherent DMA hardware test.

Reproducer source and instructions, pinned to the tested revision:
https://github.com/whatisyourname0/virtio-snd-reproducer/tree/ef97b69baea51d952ddd7c329a1894150f41849e

The reproducer currently obtains the same final driver source by applying
the archived v1 patches plus review-v2.diff. Its full kernel/QEMU rebuild
recipe has not been rerun end to end; the reported runtime tests used
rebuilt candidate modules with the existing matching KASAN kernel image.

Based on sound.git for-next commit
8d70e364e866bdfca81eee24d0688fac9472cfb9.

AI assistance was used for code changes, test harnesses, review, and patch
text. The Sashiko findings were checked against the driver and reproduced
where applicable before incorporating the fixes. Assisted-by trailers are
included in the patches.

Previous series Message-ID:
<cover.1791867377.git.mynameisjune111@gmail.com>

Joonho Lee (5):
  ALSA: virtio: Propagate PCM send failures through ACK
  ALSA: virtio: Recover PCM state after a failed start
  ALSA: virtio: Retain queued messages through device reset
  ALSA: virtio: Keep PCM DMA buffers alive through device ownership
  ALSA: virtio: Keep control payloads alive through DMA completion

 sound/virtio/virtio_card.c    |  44 ++++-
 sound/virtio/virtio_card.h    |   2 +
 sound/virtio/virtio_ctl_msg.c | 305 +++++++++++++++++++++++++++-------
 sound/virtio/virtio_ctl_msg.h |  28 +++-
 sound/virtio/virtio_kctl.c    | 104 ++++++------
 sound/virtio/virtio_pcm.h     |  13 ++
 sound/virtio/virtio_pcm_msg.c | 295 +++++++++++++++++++++++++++++---
 sound/virtio/virtio_pcm_ops.c | 147 +++++++++++++---
 8 files changed, 780 insertions(+), 158 deletions(-)


base-commit: 8d70e364e866bdfca81eee24d0688fac9472cfb9
-- 
2.54.0 (Apple Git-157)

