Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956323;
	b=Rl5aypKndjusLeHLhP1bUSBp4dcZ3kL8h5yRmpfIVgDNZdDc3LaUQ8Zkeja4UBM7nW29
	 XMKiY5zSZdYw9gvaEDeXU32fwIzU9weFrvZe0o6qNrMMM7fPaKHwqlGVcaubHH84J/BJB
	 O+DwHtqaVaNu6Fk92g9ICKiSdaLQ3z7u+ZW7H5ThnHkm8sWrdsp5dzY7gHkdE3pkO4Ceb
	 XYlUwd3t5EP19rF1JQq+PeS/sWqPlvdiiRx7eL7wP2S2iolJte9McyXYCfpON3hgQYcjw
	 fQBqUCo9IQoB6W32xVRTmY/vYg5qNSv9KtLDIj9omZiww3dqN5x6XQ4L1aCHdGDjUpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956323;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=qHbphSO6EZeZLFm54EGadjB1GRG3cUsgbx+hcCXkFZ8=;
	b=sAUbN2ltfE+sv1Iu46/x8+GG+iRUc2pjnJ73mqDa4W7vMlb3VbUx0ntDO2diUqFEW1xY
	 c88wOWJX/mTsv1A4O3FmOburE15+AD29ICuKraZZS2R2kC745PMUvQTdsQQ54OHbrwapB
	 YDMBGUwXeDGPfj77JkR89+vcwsXSvhX6yqG5zpuns++DtXw5QldqvjAj6dGhPLuC+6523
	 sbUxWmB+qW7jVg2LwphRi39i3sOEhLTx3IYy6a7Rj2V3xTfytAx9izrx59XcLhR+a9hKu
	 sZtUL98toTSYmUuZHUbEFsD0ARKImTZKLM8wsdt07qws/lwXKjFKbqKjFk2SZI34OSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=KYWdXEpE;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879EA606ABBC;
	Sun, 25 Oct 2026 19:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879EA606ABBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=KYWdXEpE
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Ei519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:11 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Ei519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956312;
	bh=qHbphSO6EZeZLFm54EGadjB1GRG3cUsgbx+hcCXkFZ8=;
	h=From:To:Cc:Subject:Date;
	b=KYWdXEpEnw6PpPEvPXf4QJbfPDa0B3fJbu/U81aP3ayNuiQOX6O/7347axexaqRDs
	 ujmkfIXbh9cCiCzq142L4t5F09ewwzWKG6YPEfWMmUKWJ7dlVNDGDOPxmaZIG6oZ+T
	 ahvs6urOY2wCqzYuRhxLVeJ3AOV8ifPgdtvGTM9A=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 00/11] media: amlogic: vdec: S4 decoding beyond H.264 Baseline
Date: Sun, 25 Oct 2026 20:24:56 +0100
Message-ID: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
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
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

This builds on Zhentao Guo's "[PATCH v6 0/4] Add Amlogic V4L2 stateless
decoder" and makes the S4 decoder usable for real streams:

 1-2:  MAINTAINERS path fix, binding update for the second (HEVC) core;
 3:    microcode loading that the secure world accepts, HEVC core setup;
 4:    H.264 Main and High profile, bit-exact;
 5-6:  MPEG-1/2 and MJPEG on the VDEC core;
 7-9:  AV1, VP9 (profile 0 and 2) and HEVC (Main, Main 10) on the HEVC
       core, up to 4K;
 10:   MPEG-4 Part 2 SP/ASP;
 11:   regmap naming.

Bit-exactness was checked against ffmpeg/libavcodec frame by frame for
H.264, VP9, AV1 and HEVC conformance and real-world streams; MPEG-2
differs by the hardware's IDCT rounding. Tested with GStreamer
v4l2sl*dec and a VA-API backend (Firefox) on an S905W2.

Depends on Zhentao's v6 series (not resent).

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (11):
  MAINTAINERS: fix the Amlogic VDEC binding path
  dt-bindings: media: amlogic,s4-vdec: describe both decoder cores
  media: amlogic: vdec: fix the microcode loading and prepare the HEVC
    core
  media: amlogic: vdec: h264: decode Main and High profile bit-exact
  media: amlogic: vdec: add MPEG-1/2 decoding
  media: amlogic: vdec: add MJPEG decoding
  media: amlogic: vdec: add AV1 decoding on the HEVC core
  media: amlogic: vdec: add VP9 decoding on the HEVC core
  media: amlogic: vdec: add HEVC decoding on the HEVC core
  media: amlogic: vdec: add MPEG-4 Part 2 decoding
  media: amlogic: vdec: give the regmaps their own names

 .../bindings/media/amlogic,s4-vdec.yaml       |   24 +-
 MAINTAINERS                                   |    2 +-
 drivers/media/platform/amlogic/vdec/Kconfig   |    1 +
 drivers/media/platform/amlogic/vdec/Makefile  |    2 +-
 .../media/platform/amlogic/vdec/aml_vdec.c    |  157 +-
 .../platform/amlogic/vdec/aml_vdec_drv.h      |   21 +
 .../media/platform/amlogic/vdec/aml_vdec_hw.c |  178 +-
 .../media/platform/amlogic/vdec/aml_vdec_hw.h |   64 +
 .../platform/amlogic/vdec/aml_vdec_platform.c |  129 +-
 .../platform/amlogic/vdec/aml_vdec_tee_fw.c   |  102 +-
 drivers/media/platform/amlogic/vdec/av1.c     | 3140 +++++++++++++++++
 drivers/media/platform/amlogic/vdec/av1.h     |  308 ++
 drivers/media/platform/amlogic/vdec/h264.c    |  477 ++-
 drivers/media/platform/amlogic/vdec/h264.h    |    7 +
 .../platform/amlogic/vdec/h264_headers.c      |  249 ++
 drivers/media/platform/amlogic/vdec/hevc.c    | 1728 +++++++++
 drivers/media/platform/amlogic/vdec/hevc.h    |  125 +
 drivers/media/platform/amlogic/vdec/mjpeg.c   |  471 +++
 drivers/media/platform/amlogic/vdec/mjpeg.h   |   33 +
 drivers/media/platform/amlogic/vdec/mpeg12.c  |  708 ++++
 drivers/media/platform/amlogic/vdec/mpeg12.h  |   51 +
 drivers/media/platform/amlogic/vdec/mpeg4.c   |  480 +++
 drivers/media/platform/amlogic/vdec/mpeg4.h   |   52 +
 .../media/platform/amlogic/vdec/reg_defines.h |   24 +
 drivers/media/platform/amlogic/vdec/vp9.c     | 2004 +++++++++++
 drivers/media/platform/amlogic/vdec/vp9.h     |  149 +
 .../media/platform/amlogic/vdec/vp9_prob.c    |  213 ++
 .../media/platform/amlogic/vdec/vp9_prob.h    |   32 +
 28 files changed, 10847 insertions(+), 84 deletions(-)
 create mode 100644 drivers/media/platform/amlogic/vdec/av1.c
 create mode 100644 drivers/media/platform/amlogic/vdec/av1.h
 create mode 100644 drivers/media/platform/amlogic/vdec/h264_headers.c
 create mode 100644 drivers/media/platform/amlogic/vdec/hevc.c
 create mode 100644 drivers/media/platform/amlogic/vdec/hevc.h
 create mode 100644 drivers/media/platform/amlogic/vdec/mjpeg.c
 create mode 100644 drivers/media/platform/amlogic/vdec/mjpeg.h
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg12.c
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg12.h
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg4.c
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg4.h
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9.c
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9.h
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9_prob.c
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9_prob.h


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
prerequisite-patch-id: 106aac9a55fa72f68fe458d405a69a66678c7040
prerequisite-patch-id: ed3f15728a5c616aca82b5086dc924adba315993
prerequisite-patch-id: 6845fd22135330ee201405f38d5c2a72bbe9d452
prerequisite-patch-id: 626eaa3d309664901ba13acc331d327a4ddc64c1
-- 
2.56.0

