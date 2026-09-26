Received: from outbound.mr.icloud.com (mr-2001l-snip4-3.eps.apple.com [57.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8A377A83
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428564; cv=none; b=LN5mg3YMABFCODhXuZbrfcon+pE4N677qXsVAD3uNtvWQhm2RFRWd48xOV6FkbJUfVvKb1Efo3XQtpJCM3CuG/5K1aOPrSp+4cT3PlhrZGCno7YSpsgqDUgRk0ylh/scb8KxqfSP/E8Zj5eQovYKk0yLoDBT3EfrhZQojcDqpaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428564; c=relaxed/simple;
	bh=y4NcqXu4fmxJw4BlAyjwpfyQ+mUjiUdCKPAwSGZwHD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qIKvNRzMTt0ZUtMyBEs37Biw+VLWayUAE9xkEHyyvQ78iAzXxmKL/w98/+te91wXcWVZSX4Y47Dc8mgzJ5izV6ubovAeDbdMiKSbgHOKqVzGEOvT+INFcChurrP+BZHwNkDROCNhvK1n7yEnloSIJZ6YnLwG3jCfVP+j4AYwWq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=WiUwkdiK; arc=none smtp.client-ip=57.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="WiUwkdiK"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id BFBF118019F2;
	Sat, 26 Sep 2026 13:16:00 +0000 (UTC)
X-ICL-RepId: 01a0dddb-bd65-7ef8-ab6a-19eca2026e38
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGAl1cG1YPUl1TQw9MCwh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428562; x=1793020562; bh=6Ye/NaLuBknhmOQtXuZUKPosIFvKEUkt9bpcl1xaD+g=; h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme; b=WiUwkdiKp592Zm8r23Yr0Y/aofxQsA0feMaYQRVhmbI6tIxzbeav+dR9OnJjlH5cfnekqf9Xff+Ig96bW9llWf6zoD7T5tybrUNxkjlVOIAF5QRbO8M6LQwcaT/8K4gk4Ou2pfi5A4KsEEdNbBVlVVbOw+KHbRFkDGP/T2NpBGy9fleUBcFWv8373nYL39yZIuR8Bbr0xpjMiWCZZJixSvHjrhLUzKlBW3+LY8ROm0XKjktc9uJTbh0kr0+3agi2FXDZKMZK78F0w5E1DiuqOfO6z0n7ptbFFWP7LB4tWusjycjK1n7U37aNiuZjPYRsUrNbBsjN4s/8pCv2z2o3Eg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id A2D9F18019F5;
	Sat, 26 Sep 2026 13:15:57 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Subject: [PATCH v2 00/17] media: apple: add avd driver
Date: Sat, 26 Sep 2026 15:14:39 +0200
Message-Id: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNwQ6CMBAFf4Xs2RpaC6We/A/DAdpF1ig1LTQa0
 n8XajxOMm/eCgE9YYBzsYLHSIHctIE4FGDGbrohI7sxiFLUpeaKddEyhVhJJXtZNwY28+VxoHe
 uXNsfh6W/o5n36W6MFGbnP/km8t37F5tcjJyVTGqtlD7xQVbVhczDLfZo3BPalNIXkKJLTakAA
 AA=
X-Change-ID: 20260917-avd-7ee5474b468c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: qLH5h3CH5f4NReoJdHgu3vQ3lGpCw_hO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX8w3gITNlMfQZ
 4nenGojk19ugBJ+TyYrNjkclGipL0+laUczsmz4i4KJdCzz0ygNfOI15AWFmWt/ekiIFxh+XLPo
 NrVuutvh0b1RcygKl30btYOoGsFNw6orublk4tdohfwBErzAmCOceQv4LVi6lg/cMWGskrdZpHM
 4zNlAZLV/8r8YFXeAw6mKZazjT2aAsvlZpwClraNdk7O/g1xBUKWeLM9AzRAoqiK6uMXI5uZ6q3
 Jkj3kpQBmrNnrylCfTRI27aZed46kTyqN9mD69xIx8OEPcOxdeS607lTNzFPE7MWoUl2jitSsDj
 CI7fVdJDHWHWfXJk8BNBdy6H95SuCrHi308gD5AwwoBHnoLsO4ILWxnNc1RhHI=
X-Proofpoint-GUID: qLH5h3CH5f4NReoJdHgu3vQ3lGpCw_hO
X-Authority-Info-Out: v=2.4 cv=J6enLQnS c=1 sm=1 tr=0 ts=6ab7c591
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=v3ZZPjhaAAAA:8
 a=VwQbUJbxAAAA:8 a=dOLNmq4gAAAA:8 a=JfrnYn6hAAAA:8 a=jHwbcGeO01bA_06mPPQA:9
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=_m6CO-mWuQdSFutSHjXj:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-JNJ: AAAAAAABhPT3xgwkHYNBpTTg4Yg4VppZVD/leoZorA8/6JCyKzUhp6liLcApoEoeedTuzLYDY4UJwWWh/qT0yzJUm1H3ooCtOe8qJr3mxQAde3eOOehl4/7+6kFX4jf/zLWQmOa9sLtAE6v5BvL2sLCNMhH6bB2KoRNpWtRn/cQ9h0IjCBe8vlQfrqjL+57RR+lDrKw3le5ntFoBZfIBJQh/zdqpgK22ove6vbybJ5wxFHakv+mmXAO+/AF80WpJhVD+bRJPhqQSDEo2410/D0w8E+M3yuMSz+aTKbl670H3pxC1YoN+pKs2Tme2ENYNiqlLRxbKlCQrdIzByTd5zAE4lUgzTfMi4mghhedNMshzLuw4eUqKIgMKJbW/W95vY7jlYQjNxiVzjwVjh2sr7SWAtYx9uqLYq9QobYu8LPidSGE0mlN4mKpvGxw+asR0zPSLZzBC6EbDgkQ0X8mWiX7cqS6wCQPO4u0lMKcEPGL7mnMYEwbYh+ofV4aftIorkB4/238gXsS85aG8MIpJhfq562sWd8m5cIeLV/ro9IGr8XQrrVtGb+l0isZ7MFwYwcT7Lco3FZ4wRQ5fxVCu+tbAkYbUY3TXCxlfT17aAb7mDqVp8FKUEfEACZDuCNyVkpzmHdizf6579p9mSNLW/8t61dga/SserbyUyZpr86MxO2os+cng/zZcE7IJzK2VMVTrkZpD71stjTD+zI/4rpfTl4vbpLgjldM9his/yjxLhJtMv4xHM2+k49v7aOHDdXGsMjOt+j/MzTZr1s4eXaM9dJ4rWfWiZP3L+jVceKuGHEL7HDN7oxQNmYjmKUWYTw+pwee9+ckapoSy6VkKz29LVrxPq9G7r4X6Onu4UvCDRsqxKpZrJedbMTj51lzGdNoH4BZSBpz8WIgMauWQPn3lFv3QcKxkfMV8QHGYW8Ivc2Rw0Dvwj5QSag/3dnzLo0zdGW2RsFLtNc9lc0jn8gr5jHDiIaN
 5nLYASTG7HTQy7nj+KhLtXC7TnUCwwEb0Fu1i5bfijlnWraElbtri6InUa47A92Eeaf/0jyiRdIxBRQHi9JNCV1/ghqq0Fm19SwGZvMmHcR6uxUKEcEtTo+xcwHiwEq1cei1h5k723ySUFuaht8DP5l9rIOMsQZLhLE9t7C+dimn/1mfpZoXYGRS8DhuZBJdwIx4OZLi5gNHjia8hsYIN0JVUIYtU4aUaY12vYI3ED8Awmb7ExiMP9cIH8gKz6nj/HU53i7jn4bWnhWMc3/gmd18XIDMtopisnooLnIoXAQ7EHUyfV8QYUX/Ps+OTG7XlSSJ5QHrojLp3k8kZQn3IPc6UMP7ST9WX4X4Qoz5w8q0kfvnYW8dqo/d41n2RhVyoOFTQcs3sWlaP2PVsHbASFpvVtV7+J7sfbNk=

Hi,

This series enables hardware video decoding on Apple Silicon M1, M2 and
M3 SoCs. It adds support for all the codecs AVD (Apple Video Decoder)
supports, which is H264, H265, VP9 and AV1 (only on M3+).

The AVD is a bit unique both as a video decoder and an IP block on Apple
Silicon SoCs. Instead of following the normal "a register for each
parameter", AVD is programmed through one single register. This means
the order of the writes are important, but its also important to ensure
we dont write faster than the hardware can process. To solve this, we
use the included Cortex-M3 co-processor. The CM3 accepts unsigned code,
which we take advantage off [1].
The driver prepares the instructions and writes them into segments,
which are submitted to the CM3. The CM3 then programs the hardware and
notifies the AP when the job is done or if an error occurred.

The driver implements the V4L2 M2M stateless decoder API. The driver's
framework is based very heavy on rkvdecs driver. It therefore comes as
no suprise that `v4l2-compliance` reports no errors:
Total for avd device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

The fluster scores are:
JVT-AVC_V1: 77/135
JVT-FR-EXT: 42/69
VP9-TEST-VECTORS: 216/305
VP9-TEST-VECTORS-HIGH: 1/6
JCT-VC-HEVC_V1: 143/147
AV1-TEST-VECTORS: 238/242

Since not all unsupported H264 streams are rejected, the scores
depend on the reset working, this only works with a patch to the
apple-dart driver so that the IOMMU attach/detach trick works.

All codecs support 4:2:2, 4:2:0, in 10 and 8 bit. By default, AVD
outputs in NV12, NV16, P010 and P210. Support for 4:4:4 and 12 bit
formats has not been added yet.

Internally the AVD uses an Apple specific compressed and tiled format
called Interchange to store reference image data. This is stored after
image data across all codecs. Apple Interchange is used for sharing
buffers with other hardware blocks (GPU, display controller), support
for this is on its way [2].
The V4L2 pixel formats have been added to help with calculating sizes.

This driver has been tested on most Apple Silicon SoCs in our downstream
tree [3]. Its expected this driver will work on M4, M5, M6 and the Neo,
with firmware already being written for all except the M6 SoCs [4].

The groundwork for this was laid many years ago by Jamie, R and Eileen,
who through a combined effort managed to reverse engineer many core
parts of the AVD block.
This driver would not have been possible without the work done by
Eileen, who wrote initial support for H264, H265, VP9 and excellent
tooling [5], allowing me to reverse engineer AV1 and make the driver
conformant.

[1] https://github.com/sofus13/avd-fw/tree/avd-next-fw
[2] https://patch.msgid.link/20260917-apple-interchange-modifier-v1-1-875294689c48@gmail.com
[3] https://github.com/AsahiLinux/linux
[4] https://github.com/AsahiLinux/avd-fw
[5] https://github.com/eiln/avd/tree/main

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
Changes in v2:
- Patch order
- Fixed dt-bindings by constraining all properties
- Fixed dts, add interrupts, iommus and regs. Drop labels, fix names
- Add Apple Interchange format
- Add more av1 and vp9 validation to v4l2-ctrls
- Validate more codec parameters
- Use the new CM3 firmware (drop avd-hw, drop submission loops)
- Updated cover to reflect changes
- Link to v1: https://patch.msgid.link/20260918-avd-v1-0-49977931f455@icloud.com

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sofus Forstreuter <sofus.c@icloud.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org

---
Sofus Forstreuter (17):
      dt-bindings: media: add apple,avd
      media: v4l2: Add P210 pixel format
      media: v4l2: Add Apple interchange pixel formats
      media: v4l2-ctrls: validate av1 tile info
      media: v4l2-ctrls: validate vp9 tile_rows_log2
      media: apple: add avd driver
      media: apple: avd: add h264 support
      media: apple: avd: add vp9 support
      media: apple: avd: add hevc support
      media: apple: avd: add av1 support
      arm64: dts: apple: t8103: add avd nodes
      arm64: dts: apple: t8112: add avd nodes
      arm64: dts: apple: t8122: add avd nodes
      arm64: dts: apple: t600x: add avd nodes
      arm64: dts: apple: t602x: add avd nodes
      arm64: dts: apple: t6030: add avd nodes
      arm64: dts: apple: t6031: add avd nodes

 .../devicetree/bindings/media/apple,avd.yaml       |  127 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   14 +-
 MAINTAINERS                                        |    2 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   32 +
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   32 +
 arch/arm64/boot/dts/apple/t6030.dtsi               |   32 +
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |   32 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   32 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   32 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |   32 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/apple/Kconfig               |    5 +
 drivers/media/platform/apple/Makefile              |    3 +
 drivers/media/platform/apple/avd/Kconfig           |   18 +
 drivers/media/platform/apple/avd/Makefile          |    5 +
 .../media/platform/apple/avd/avd-av1-entropymode.c | 4698 ++++++++++++++++++++
 .../media/platform/apple/avd/avd-av1-entropymode.h |  284 ++
 drivers/media/platform/apple/avd/avd-av1.c         | 1432 ++++++
 drivers/media/platform/apple/avd/avd-drv.c         |  776 ++++
 drivers/media/platform/apple/avd/avd-h264.c        |  862 ++++
 drivers/media/platform/apple/avd/avd-hevc.c        | 1340 ++++++
 drivers/media/platform/apple/avd/avd-inst.h        |  210 +
 drivers/media/platform/apple/avd/avd-v4l2.c        |  992 +++++
 drivers/media/platform/apple/avd/avd-vp9.c         | 1054 +++++
 drivers/media/platform/apple/avd/avd.h             |  299 ++
 drivers/media/v4l2-core/v4l2-common.c              |    8 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   17 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    7 +
 include/uapi/linux/v4l2-controls.h                 |    2 +-
 include/uapi/linux/videodev2.h                     |    9 +
 31 files changed, 12386 insertions(+), 4 deletions(-)
---
base-commit: 4efa625593e1e9c76346232413997556dea1d89f
change-id: 20260917-avd-7ee5474b468c

Best regards,
--  
Sofus Forstreuter <sofus.c@icloud.com>

