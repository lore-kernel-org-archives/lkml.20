Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048441;
	b=QveIBE/0VwMvuNKpR20bL/g811CR5G8wRCXVSiwsoX6njcIofYEwYO92EJXw1HNyttPG
	 aaXkxjtSFUlIKJuwy0CSbNTcMk5H5jisxgQ96iTf4FchS1JCv26mdDiVhmRbKYkGGIGgD
	 MItivMQflIqZc3FkFBz+gnAXN8GscwNMv9XIRhBdXFAFx8vXpq50VWfC5Kf/BtHqRnANx
	 3T/IMpl2rb48jEHnnI1TasoHjB1quNL6YixF8CsyjsrZxCN7kN5mhneMdqJhCuX1kabL5
	 Qu3Xz81IxQM6DOC/6cSuNfI8DwFMCDTkjKJzny5PqwYlUHEH/QbYNJaanlXujKBjXmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+OU4gePN1TbrZEx6lkd5UF6PxGqdlcQqr6Ot6rmKywQ=;
	b=gUJsswkQxeUQ7w3q95gpJD0VUWZyimA/XJRSuzdGSd0Kjr6if416qNOHmyL/sD7iwaT9
	 5hcHFgzeWotR3Wy36i4p7Kxd6bGQjc/rB5q8t6Dsc+wkJif3u57Y9ykApZxEmQZ50pa/X
	 bav2GaX3fex1PJz9fB85cGmUWOeKtR2tS5GSIdb+tGjLYQiYpqsHF4zlOu45dHHIT25VY
	 OIcUvRTvw5ACcXTx9IrvDAZtAHfDgRF/TlHL2nx4cEuyfHgyfWPnXJo18O7NB2kby9CoX
	 mbM/0YGVuIIx5rbDV+imw5R27fPbQxZi09gnSfE3UyVdvuZw8SLRvW8hwDTl3SBoydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpZxkZh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8C606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A8C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpZxkZh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so1262894f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048439; x=1794653239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OU4gePN1TbrZEx6lkd5UF6PxGqdlcQqr6Ot6rmKywQ=;
        b=FPpZxkZhP8DkXqTcCgU2KR9Y7JfY8TZj5ukgXKtcjF6rCyTzhPETGMqhaUHJcapsq5
         dTpPSHlpct1nSBdWg1Hnz7mkTR8xBebdniUE1HFqtItzYMSlPgoLyEUKihI0KIFLD4ZL
         9v4YjbQrfc+rIIaqimAX7pPaE0kU/2cHeBi0slLsQHUVRkFVNARboThr2IvKCuEz58PU
         y59sMjikGMfHrmMBkQ/Loi5vF6FGfiBXQR4tdD2aRHyI6F5IbhHghmnXWO91g4cwfO10
         ROB10FdYyMMpW6L3BCSxnWsrmJ7DoMwl0H5RMjk8CLzMeUpvA3VaZTLGKfx2b1VBAE6R
         GLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048439; x=1794653239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OU4gePN1TbrZEx6lkd5UF6PxGqdlcQqr6Ot6rmKywQ=;
        b=QndlgjbU7sVRLWZpWTf0XF0krujZpyAJ6UjbO2vV7QoNEB6bB8mtCo/ofcZq18+g2Q
         eLxXejD0Hj+UyV0YFiJpzvD5lHMlVEm96evM1uGWykQNotfLk/wBlW+lsGBud8HLR2g3
         3evGTUmlwJ5BfIcOHRdF0seVQRaJpd1DYUnphu/NuEZSyxXpTkoMpwVfm1rhzkoYo105
         s4q5BueV6UY3gDqJTFepK1OCZgvmH1aM5QQLw8yc9RsaWplZBQqWspNJw0VzmxiehPZn
         t4j2lsMy9c8Kgt/uviS9eAP6S0IQb5inWnrA7+3lMiqhJ5hEPyL1LNPuKH3kKVAy/zyf
         MmoQ==
X-Forwarded-Encrypted: i=1; AKwUvByeX/lA0RnaOpS/r8/Ty3DClb2sJnrC//Vb1cS4TE5jjgKUlWysOX3nRfs+L4osMUJSdg4e3Vi1iEyoxgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8laisbX2ph0Ls7PDSsfJj1UvNDbsi8qPp4/2zHpAPxfbBB3ZUY
	1HTMxFXDdbRsvozjyq7Ni/78pT/dz6hE4LsQembrZCm63HJEmJbx5GXY
X-Gm-Gg: AYBFou2HO/7RGdC0IdMSjCiMutruLRlyunXgV4efyWgjb6NfMAlBtGI/feDuusNpxyP
	j466ssmykuymLsK1001HtT91FlZiqK/bz3T7LdgNQyprAQbXULAdu+IEhQV0Ty4697Sq6jMWkPK
	e3M1JxwDPYfgmXc+vKQ+vl5gZxK+uqRQCL1J0prySWloQiHU/94oBz6DETPxafMjhHGjjq4eO/e
	3kQRvHZOLr8EiUAJVNyiXJep35SsrGdT9LU+I4FCmpzlCPjpeY7NAoL7i8zOJSgBvhAYLXvuHfe
	6eWtpQ8EacVv0N0NtWCqcePrweChRNn5GCfEFVX0oZd3MgVOwqD/oKhZG1K/x/uUhw+9+Sse4a6
	DOWK3sfmTCAmF+pfUTislI7ffwLEXaCeNY6AJG7Wk+/OklMooa44ZsMcRR0WbZQqeqKsMNpCy3p
	fn9Ihtqh9+Ek6ckFZexHkSgDIJG2/I+lI+pVYQcrXJMjGE3vaDK2JqH3HFGCnKFFMrm5HxJboio
	8vxrsdeq2x9qT+aN6HK9Ht+LUXByvm7lFbRoTXjINWG4AHEk91qfQB4Uv1oAQNElkuwPy2jjT2t
	ePXEJu4mOyGndfgJ2YEDDoc++Dba0vsoS3Pofm35ypwqTw4pcY7Loz6Jjct/OM2Bvxj9ZRH9++o
	B0+2GAp5DYoz03OBokDTc75MNgVAn6/Vb4Z68JdX5+XdaJ8ajlkw5b1ERL+2iYxhv4zpUVRUAj5
	bS3gPmscU3QHVTgH8mWEtssd+k04ioj2jm9CwY
X-Received: by 2002:a05:600c:3e0b:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4b6ded4ac6fmr78413885e9.13.1794048438783;
        Sat, 07 Nov 2026 02:47:18 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:18 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: synchronize CPU access to imported DMA-BUFs
Date: Sat,  7 Nov 2026 11:47:00 +0100
Message-Id: <20261107104703.44111-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvcvideo and vivid (when using vb2-vmalloc) access imported DMA-BUFs
through a kernel vmap without cache synchronization. When a non-coherent
importer such as V3D maps the same DMA-BUF persistently, captured data
remains in the CPU cache while physical RAM holds stale bytes.

Add an opt-in uses_cpu_access queue flag for vb2-vmalloc queues to
bracket the interval from buf_prepare() through buf_finish() with
dma_buf_begin_cpu_access() and dma_buf_end_cpu_access(). Keep this
opt-in because some vb2-vmalloc drivers pass imported buffers to
hardware, and end CPU access in process context because DMA-BUF
callbacks may sleep.

This follows the per-queue flag proposed here:
https://lore.kernel.org/r/CAAFQd5Am5jBev5P1HmsdeHoJfROZat3bi1W=UsN7wpVqw-XUQQ@mail.gmail.com/

Based on Linux 7.4-rc1 with prerequisite patch "media: videobuf2: finish
prepared buffers in VIDIOC_REMOVE_BUFS":
https://lore.kernel.org/r/20261026071735.37220-1-kmehltretter@gmail.com/

Changes in v2:
- Split patch 1 of v1 into the standalone VIDIOC_REMOVE_BUFS patch above
  and use its __vb2_buf_cancel() helper so queue cancellation and
  VIDIOC_REMOVE_BUFS share the finish path (Tomasz).
- Scope uses_cpu_access to vb2-vmalloc queues and drop the attach_dmabuf
  dma_dir parameter from vb2_mem_ops, videobuf2-dma-contig,
  videobuf2-dma-sg and videobuf2-vmalloc (Tomasz).
- Enable uses_cpu_access in vivid only when vivid uses
  vb2_vmalloc_memops (Tomasz).

Link to v1:
  https://lore.kernel.org/r/cover.1792392288.git.kmehltretter@gmail.com/

Testing:

- Raspberry Pi 500+ (6.18.34+rpt-rpi-2712, aarch64, 16 KiB pages,
  Sunplus UVC camera 1bcf:2701 and Broadcom V3D 7.1 GPU), backport of
  the prerequisite patch plus patches 1 and 2: eight 640x480 YUYV frames
  (614,400 B) captured into DMA-BUFs pre-seeded with 0xA5 and imported
  into persistent EGL_LINUX_DMA_BUF_EXT textures before VIDIOC_STREAMON,
  then copied by V3D 7.1 immediately after VIDIOC_DQBUF:

  Heap                        Baseline stale      Patched v2 stale
  /dev/dma_heap/linux,cma     8/8 (329,890 B)        0/8 (0 B)
  /dev/dma_heap/system        8/8 (509,818 B)        0/8 (0 B)

- QEMU virt (arm64, Linux 7.4-rc1 with the prerequisite patch and
  patches 1-3, VIDEO_ADV_DEBUG=y, DEBUG_ATOMIC_SLEEP=y): six vivid
  lifecycle cases (stream, streamoff-queued, prepare-reqbufs0,
  prepare-remove, close-streaming, replace-dmabuf) across single-planar
  and multi-planar queues with kprobe counters on
  dma_buf_begin_cpu_access() and dma_buf_end_cpu_access():

  Queue                        begin/end calls   Unbalanced   Warnings
  vivid vb2-vmalloc (SP)           34 / 34            0           0
  vivid vb2-vmalloc (MP)           34 / 34            0           0
  vivid vb2-dma-contig (SP)         0 / 0             0           0
  vivid vb2-dma-contig (MP)         0 / 0             0           0
  20x prepare-remove (vmalloc)     20 / 20            0           0

Assisted by an LLM for code changes, test harnesses and commit message
drafting.

Karl Mehltretter (3):
  media: videobuf2: add opt-in DMA-BUF CPU access
  media: uvcvideo: synchronize imported DMA-BUFs for CPU access
  media: vivid: synchronize imported DMA-BUFs for CPU access

 .../media/common/videobuf2/videobuf2-core.c   | 76 +++++++++++++++++++
 drivers/media/test-drivers/vivid/vivid-core.c |  4 +-
 drivers/media/usb/uvc/uvc_queue.c             |  1 +
 include/media/videobuf2-core.h                |  5 ++
 4 files changed, 85 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aa99d5c3c27082cbe003ed94a195e3de415777c9
-- 
2.39.5 (Apple Git-154)
