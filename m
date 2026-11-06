Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923611;
	b=rqZ2f7sFIBJ3fzVnwqmXlBNBn8kVDZOvCHKvtfzojohAbm9/ktAj4QI81Twrio2f+72F
	 hkMkcLF+5bl3grYQMPL1SQfw/rGy/ePojCorhRhQFztB9wr2urW84yvmHkrDDHsbDgN+T
	 F2n5WS7SGwaDyhb8WH/DvL8H901lKCaDaKv4vnwoXeaM75LxLzOQ1KSNGwNEpeO2c178h
	 2KO3sdo7OYR4ZT8MzAJ1/UzEacMHrvNmI+6QGhmYd9WcLYupKImz/H5Dq1rki2+QY/MsW
	 7t974c/BM12NcNG+QnRTgzYWI97DK3Tb2kxhu7Llk1TPKPryush83OHjrpFxGboDKSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
	b=tutPGwyz3oU/YpsQH4TM9ttnDmVWCzHFEA5ntNAnWNUBuUiWBGHust2/CuQxDqH1T3uj
	 ZasDgfFJQxsSov85jK1dwGwjdMAphUd2GbCv6y7WHQVOgk2zkSyDUxw2DmOzhrc0wS5x7
	 h8TGdBkMhyhJP66PYecurVksujmk3GzrtJ5FwM5oy1BPnK79ZPUBn9r4oY09ea3C90snt
	 gPid2Lb3zcisV661UvzgMKfCja/0DKvbotC/ChROKlGdwogtVRDwjB7lC/5HyHTnK7vsn
	 iPgEqP2rCowm/FXvVthRycRhG5HYrwuFGI2gIRbQWHuHtthQtuEVCfMmDHiOaK9oDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUzlzjXX;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUzlzjXX
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso207208eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923610; x=1794528410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
        b=rUzlzjXXQrgeZVhDtCIi0p2CITRdKKsknqZzQuoRnEyAn7+S4LAkHs5nmX3aDL1P/d
         0KGgqq4kJw6sr8G8yU9Hj9E9wcG2dYfMLY4lq3snbaOylEyYJ8rn0l1z747y9h+7G7DZ
         Em8PM2qcC+DGcSyhJWaCZJGafTlWd+WiJTyyjn9wIgVzwhsSzTDnJrzGL3tJGeWGgFQI
         m4e5XcQBSH2r8eFCQ0mJqxicwdc6+3lxNyhBBsGbYqmDw5KGy+qN+Ezg4LMkCErePYG8
         tBjDA3aNSf5gkt49Qa0NB/DWIGgVV7bybfYEDX2zwKRcFI2z09QcEmwXx5ddiAOx48c7
         /xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923610; x=1794528410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
        b=t+7NO9SG6lOfhT1xxNWe776tJyEFA1WL57KlJyQzTOokJdMwAhA9wy+zJlytN2QmJK
         W/qmCNnOR7wpMR1H23ZfdFRKJr7W083kV/+DpksmZi3UrIr0F9dTp2Em2U2ol60qm2xS
         Y4hLcNINIvFwlAQT+UWjifWKy5q5q7/NI8Uyxqcn1Hf8gCA5szmytd1BIFh9C07P80B0
         KMz6ejL4Bo/1VlZa28DF22oaViAGT9KxLnXafvs6GcQPQSB/JVO1OKddy2L7qSGQpeML
         Q7hmgLwzy+GDagIa/Iscue3kOOiWvFH6UdHrRm5clVzjHvzTPGB4gGwWRqzbfln8wRBo
         vzjw==
X-Forwarded-Encrypted: i=1; AKwUvBypKdgt0gFmCMPVA4X0SCuoO86G3KLeVuuq2isyWq38URVJi0wYfeuAcj/0iFmFm6MRySA+mkK6cuIpj2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZxfmZ0qqRgdzGEimAlsxgVNQEVoWR56paA7RoJ6xgPAyPSQCV
	W6tnEV/0h/Uk1MiCDlw4NhwtvPGV1GYundayN2OkEDHqb2eqV4tcx6ILMq/27Q==
X-Gm-Gg: AYBFou0xRs8yaTLJaN8ZUdwlhMq7kWwdzsBa4zsUUkRVgFv+J7C93Y+Bi4uSkaIt3HV
	RCAjmWV3oCezfiwyB3KT/t30awXSnXZhN3IfXT9jc3x4VYKOnHhpVAwDtQ4yhaFwr/hM0XJeRT5
	WlK2aDYmrzf0CAmfoEDn8Ux/Az71EZFks9MzYfEF87kXcCU7CdC3u7PO6vc3CjenpV4NbOenRRp
	Wn+5iWAu/WUx2lSlkZxpV8RUbMDvuSjhmwlyfWRdKX4jb5X1IQlg06UxDEJTCQ52grnJc+0e8DI
	sqoxZ7/Xn4GjZD7JK7wurKQQarYUlVMjBodZdR/PuAGe8l2dmuRUsaccOJ8gfo5uqkNd1z4SQef
	3U0/8EVkyqlMHd8TqAaZR+fnLWH/H+m103/2ZyMz1Yzty+HSyDGKxPgkOnWMNLHj4DxYyBEVcYn
	nVkn5jkWXLViM4Sa/YI43mqqnSu3cNwAdFZhlvDMcl+xQohSWgqE/RGGPPSbGEbOC5uJooxk/AK
	sSiVVu2RgogYAStAH4ursFPCLW6ugVIkvC4unsDfLQtv6mifR9oNsP/E7f62L51GUokZszwp0V2
	+Wb9bwbwciYK6KE8xvrcKUrcU9n3Yh1mMm+IpiztwdJ42llRTQIiSwDCUkjunf0WL7R1X1FhU1t
	e1/mDh355M+9liNiX6wxT1yrDXMEXsXcqTRMG91m/HTtB07o=
X-Received: by 2002:a05:7022:170e:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1b25d29403dmr804327c88.5.1793923609691;
        Thu, 05 Nov 2026 16:06:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:49 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v18 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Fri,  6 Nov 2026 09:06:32 +0900
Message-ID: <20261106000644.20460-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This cumulative resend keeps the twelve-patch series on the same base,
a4311e9447bbb219044db38897f95be112f46a8a. It covers PCM stop-threshold
sampling, locked partial-progress reporting, the optional reset operation,
VirtIO ACK error propagation and recovery, PCM and control DMA ownership,
signal-safe teardown, staged capture lifecycle and work prioritization, and
capture parameter documentation.

Relative to v17, patch 4 adds the transfer-failure XRUN latch so later
completions do not advance PCM accounting after a failed ACK. The existing
ACK and prepare recovery behavior is retained. Patch 6's partial-restore
rollback and event-message ownership fixes, and patch 9's wait-result type
fix, are carried forward unchanged from v17. Patch 7 retains PCM DMA lifetime
and fixed-slot completion checks, and now reserves the successfully seeded
ordinary capture ring until userspace advances appl_ptr. Patch 10 retains the
staged capture lifecycle and paused linked-stream XRUN handling, and restores
full-ring accounting after active and native paused RESET requeues completed
requests.

Validation:

- Cumulative stages 04–12 passed incremental ARM64 W=1 builds with KASAN,
  lockdep, and OSS PCM enabled.
- The no-hook production candidate passed ordinary and staged RW/MMAP QEMU
  capture. The 14-capture sequence verifier passed across both modes,
  including RESET/reopen boundaries.
- A slow-reader QEMU oracle reproduces unread-period overwrite on upstream
  a4311e9 and v17. The candidate keeps the ring slice unchanged until
  appl_ptr advances. Separate active and paused RESET pairs reproduce the
  same baseline issue and show the candidate preserving the unread slice.
- Synthetic ACK-failure QEMU probes cover capture, playback, and DRAINING
  admission. Subsequent virtqueue completions and recovery paths were also
  exercised.
- An exact ALSA-helper model covers partial-period capture accounting.
- MMIO rollback, timeout-width, PCI remove/reprobe, and linked paused-XRUN
  evidence is inherited from the validated v17 candidate for source paths
  unchanged by v18; the manifest identifies those inherited checks.

These are guest QEMU and host-model results. ACK failures were injected by
test-only hooks; the returned VirtIO completions were real QEMU events.
Physical Virtualization.framework devices and KCSAN were not tested.

Previous version:
https://lore.kernel.org/linux-sound/20261105070845.6449-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
