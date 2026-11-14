Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794615232;
	b=4sKaMYzY63rSiCJiiZvNIBxTztC/W/wQQf01WQsuaf3WmZRfR8P73WKOBRW4l7fWQ9jP
	 Ysy75vYeKss1ABjrJWH/0YOnHgPBvH9yTV0jGWmB1PsEaymBIFy9s9XMeeChdVBGVbyWH
	 27yx1Q44HnMW1vVtTd6XSpY2MnwME3I/1a9ToJAiBykOrdGUMI2CsyZ2x5L8XouSTMl6B
	 Bey+RJRXebVuQ1qgIVDHQPgRUSnDHbeo1DlbgW2sUzvzV2yJvNbBbtWMciFtb270su79j
	 2n0QkdcGw7sWvP61scH5/bWEhWWGrXwjVnekBljJFOUFEAb1yLNbqgW9MhjXLSWwRaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794615232;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=W2a03Wp7T/0gZY+b5a/UEGNSnI/4/VSrt3bc6LnlLEs=;
	b=2x06UVQARyNKeCknP5+5aYv4XUsVh1cvGCNCB8FNShCjPvyFtTD3NTfL/fgRSMRcxyJC
	 R7dR/FP6ga6cGeBLlnS6EmEOS1AJDPxYKuombmxaXhiU6KSkNriC9G4ktE6GZUUH7Yqd6
	 5p/uSKSI0Lz9MFdz7/GbxgsX9LpgrXibHTCbmG1Q36z+/Q1Qvh6Y0Dc8wOWbXY0HWyFWQ
	 57ElvP4sdXjUzx6Ru7VOKm4bPo/CjMNEwTp7Q7er5S9cPOAcXSck3VnLwuqsFfLvLdkuS
	 AA7/3OvfSuJSd/QgaGJEoYKKg1xckmZQ6hdEHWQWyCY5H6JBf5yVg5G6nCURCtF9o2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsL5d2lo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4CD606A327;
	Sat, 14 Nov 2026 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsL5d2lo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794615232;
	b=wCXqiqr7OMzn0gW5hGDTQZ/RA962+0bD7EKlRI4/avtfEwJkUEsOea2eCLzTfrHjp3sr
	 fA8Ba6klUsTNv9xNcFeeRwGerLcyYHieqtB3x+pLEqSHcEZsp63yR6jd0ezaTHBALH/1A
	 4Bh36ZdgcIqOiCl3cBUz9j+cCd1sFQiBsXtbrhOf9jRaUeL0QmodJk+Y+m7xHutv+JkOD
	 qYSlveixYbLmPHSDQnN9atRMDb/Qf3oF8YmFzWtomT3tem64wEO20wDA3MFGQl7vYs0YH
	 8X91MsdWdbV+c8E6PKHSFln3zL8VYPGVSyAHdB+srMK51c7tPTw/5KOpuQLjbCTWvMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794615232;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=W2a03Wp7T/0gZY+b5a/UEGNSnI/4/VSrt3bc6LnlLEs=;
	b=fnSHRGACZKy9PMjeL7PgFK6CKF/NIYbKcL/u6AgiFanUqsYLG/vH2DSe+LPt6iNdE6Tp
	 m05bd1NXcqH/Ofa7azOof3B56CkdGrZVPGjfM8joGxE1gF7QAq3jlLtneYt8qCDycy7Mn
	 PM8wEZmJ283HYvHOYcvwCWNupy5Kj2LDIkxSTHSnaDumdHCWP0aultZ8NXHidgUzgQkOk
	 +Iyk1qj5ndXonX51fjZy4mXq98f4C05X7AmXGJcOiXMhYB9c3i1otKtqlmuYuEx59ykkg
	 g4YSXavg4UFVnJ4b/tWW2+S6PxYo5+JUTU9PrzegpL43SXWZpTDtClXqjf8FD7FEByg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 048B21F000C4;
	Sat, 14 Nov 2026 00:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615232;
	bh=W2a03Wp7T/0gZY+b5a/UEGNSnI/4/VSrt3bc6LnlLEs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UsL5d2loUCTSPUZwQvvDUBeqc2c4xrwXyZTnBDIh9XQJuR3Xqj1uw04XanvPU5IWz
	 dX623IgDKtYB2mreP3qT5Tv58MJmGn2CzJqpseWGUkXOgui6Jufaz4DpXEguB+QoCC
	 r0Ki+ODIPMX/2s2lCg1xcLRc6w3X1b9uY19wwj2uL+gHrF+yDrxXmCFLMYFxhhv6Bg
	 yBzR3agAWM8aHMP5PqpH9F06pBlap42b3bhRDjL7j2rMaGiZOl17jnJsHpy7GBsn93
	 WSRVaMIQ9On74AHm1etdsANfa+Wd1SOF2jftMANvdeLi7hPuuc3db3y7AZxeS7P/jR
	 +jK75eu0lhQXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5883449BB3;
	Sat, 14 Nov 2026 00:13:50 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/3] media: rockchip: Add the IEP2 deinterlacer of
 RK3568/RK3588
Date: Sat, 14 Nov 2026 00:13:49 +0000
Message-Id: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3czUAiPdJMtEy2SzVHPzZBMTJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAEkCkF9oAAAA
X-Change-ID: 20261110-iep2-b9a9c6e77c44
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794615229; l=6741;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=OpCTf+DntkJDTyfZ3/J0N4OqBaxbAYAunGoZnsZjH2s=;
 b=fBLb7QhzTLrMzpxNDgL+CKTSM7jvAO8XNEhGsM9vy//P24fCJNATWcaOBG8nXGm1GUXIwGJNw
 mkgtkaJAvO9CICYC4XSn6ApIOcLKAs5aEGsc4AIaQJxzjEntf4Vlyr7
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

This adds a V4L2 mem2mem driver for IEP2, the deinterlacer of the
RK3568 and RK3588 SoCs, with its binding and the RK3588 DT node.

It is based on Rockchip's vendor driver and MPP; the V4L2 part follows
Alex Bee's out-of-tree driver for the older IEP and sun8i-di. The older
IEP is a different block, so this driver uses iep2 names and leaves
the iep ones to Alex's driver.

The OUTPUT sizeimage is 4 KiB larger than the image: the hardware
reads past the end of the source (seen in a bob mode), which faults in
the IOMMU, and the block retries the read forever. How far it reads is not
known; 4 KiB never faulted. So an imported DMABUF of exactly the image
size is refused at QBUF.

Tested on an Orange Pi 5 (RK3588S) with a v7.3-based kernel carrying
this driver (plus a test-only parameter that shortens the watchdog); on
this series' base it is build-tested only.
The posted code ran v4l2-compliance (all three runs), the exact-size
DMABUF check and a motion adaptive stream; the other results below are
from the version before the last review fixes (size clamp, open error
path, Kconfig text).
- v4l2-compliance -s: 59/59, 1 warning (no --expbuf-device); 59/59, 0
  warnings with vivid vmalloc and dma-contig exporters
- exact-size DMABUF refused with -EINVAL; field order; timestamps at
  field rate; payload check; unbind with an open file and while
  streaming; rebind; s2idle and deep suspend while streaming
- with earlier unposted versions: 72 cases (576i/1080i, NV12/NV16/NV21,
  TFF/BFF/progressive, all four modes) without IOMMU faults, luma PSNR
  35.2-37.2 dB (bob) and 33.2-36.6 dB (motion adaptive), progressive
  bit-exact; -EBUSY on a rate change while streaming; 1080i motion
  adaptive at 290 frames/s

Not tested: RK3568 (no board), NV61, DMABUF on CAPTURE, the recovery
paths (never triggered).

v4l2-compliance output (no --expbuf-device):

v4l2-compliance 1.33.0-5524, 64 bits, 64-bit time_t
v4l2-compliance SHA: d2e89246cefc 2026-10-30 13:45:36

Compliance test for rockchip-iep2 device /dev/video3:

Driver Info:
	Driver name      : rockchip-iep2
	Card type        : Rockchip IEP2 deinterlacer
	Bus info         : platform:fdbb0000.deinterlace
	Driver version   : 7.3.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
		warn: v4l2-test-buffers.cpp(2223): Cannot test DMABUF, specify --expbuf-device
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for rockchip-iep2 device /dev/video3: 59, Succeeded: 59, Failed: 0, Warnings: 1

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (3):
      media: dt-bindings: Add Rockchip IEP2 deinterlacer
      media: rockchip: Add IEP2 deinterlacer driver
      arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588

 Documentation/admin-guide/media/rockchip-iep2.rst  |   59 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/rockchip,rk3568-iep2.yaml       |   95 ++
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   22 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/iep2/Kconfig       |   16 +
 drivers/media/platform/rockchip/iep2/Makefile      |    3 +
 drivers/media/platform/rockchip/iep2/iep2-regs.h   |  192 +++
 drivers/media/platform/rockchip/iep2/iep2.c        | 1275 ++++++++++++++++++++
 drivers/media/platform/rockchip/iep2/iep2.h        |  106 ++
 12 files changed, 1780 insertions(+)
---
base-commit: ad6549a46748d00818483b535e5cd2a704685c98
change-id: 20261110-iep2-b9a9c6e77c44

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


