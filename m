Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489148;
	b=TK4SqlPbWsc1WVYvQjSPBOvZiqg21MtQnYnZp2tyrfyEayCdRpWRkLV4xYWqchjKzEfa
	 s8GY9iVbtjr0GdW98S1dVV8s3a8R8OC7GbFjUCr0TWVACWChYj+PJl8C0hqO9AwLpIEKJ
	 LRT8rw+fJJJd59v/gXfrLauGo4pIIqDeITKufiO/qeJcgkXi2y4GZNvEV0/dcyTb+gtu/
	 3y/Re+W6ljOv/ehL7qEefHryBdrx+k2rF5AcjFlaR/zs0GUAY5IXJpbN1HGEXRfwbTtGf
	 XLByBMM5/C5gd2JRjJMhEwii7wF+iGVxPpa9NFk8VGkx4+2kKUDscyqoigLMABPlIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489148;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-JNJ;
	bh=7bY8wUwtgPs4LjAtoVin5T9Yra70bsBW9lT50OPRGns=;
	b=W/H0q0/DHTinGkZluB3jprGkkPox9qMpxp+fOHAZmc1NDF4fM71ftMClxv/qIqpuc1eH
	 Bzd+yb5Ef7Dt6QB2oTAKlLSsNMH2LD4uksxuELE+MN7Wsh1r1RySYUjw5ai8WY/XOSpc1
	 Ojdo+qQKcC2pKFwCUI3K5LxAPXLF1GxPflVkdDX+WAJw/XnUgOk1RfG8FYscUXXN7igJc
	 Ty1mEoy3r0EQMKw3jr9pSIqy+vclw2UI0XNoWLfMxmG7eMvT221vUxeXQA3gaUcT5C9Ep
	 G2J8+8fH2p3VWye86UVlSgnXinA/b8r9UIbhei04NwfAs+ZxgQyVBU1W1E9gnLDFbKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=oeYhXdvQ;
	arc=none smtp.remote-ip=57.103.79.84
Received: from outbound.st.icloud.com (st-2005e-snip4-1.eps.apple.com [57.103.79.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C7A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C7A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=oeYhXdvQ
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id BA9C91800233;
	Tue, 20 Oct 2026 09:39:03 +0000 (UTC)
X-ICL-RepId: 01a158ad-bd7a-7c32-92c3-6ed5fd9b36de
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXBIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGAl0BTVAPVgoAQQtNV1V3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489146; x=1824025146; bh=7bY8wUwtgPs4LjAtoVin5T9Yra70bsBW9lT50OPRGns=; h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme; b=oeYhXdvQxsM1dsKJ/FmdIc0PzmXwHLzdR5pLW6gEPuQbSlI3K6z3n+sVHq2nFFH9ZTetvRuixjtDJD87nyFqOhCjdJqzZBltWwff2EClErgreG60M8tD8bUWIlsFHxgpCNBvLHjQV43L0vuD19AAwzsKScERl8S73/rCKne25MnOiNI876WWzTHjD5Jv4C5ilk6jHwEj/scshUG6ut+eTWwXm48GXLOGOjmTl+WhVslqhcbOyyxslNe0i3BAFR+aC5n+PmeGcXleTuXIgUum5htacDSbAisoEtWPsKg+LWlm0garm1us/MxGdf0GH9KfrMAfySUSb1thhI/lUhzpLg==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id E991D1800099;
	Tue, 20 Oct 2026 09:39:00 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Subject: [PATCH v3 00/17] media: apple: add avd driver
Date: Tue, 20 Oct 2026 11:37:41 +0200
Message-Id: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WN0Q6CIBhGX8X919EEEcSr3qN1ofibtJIGymrOd
 w90bXV5tu+cbwGPzqCHOlvAYTDe2DFCcchAD814RWK6yMByJnJFJWlCRyRiySVvuag0xOXTYW9
 eW+V82dnP7Q31lNS0GIyfrHtvN4Gm3bdYbcVASU64UlKqgva8LE9G3+3cHbV9QEoG9iMxsUssS
 qixRdEUglf4J63r+gFZyNiq3gAAAA==
X-Change-ID: 20260917-avd-7ee5474b468c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX2diVI5HIqkD6
 xox+gGqW884YFBY8E7hxR8hQ44nrKoStjdfwXxRIawWDyp0br2tIEnb8JKQuYTn5y/WilAyUHQC
 l2PS3sSS0y0ATjQVEagH6f87/Aoq9uPrsVvwjHeIX7wmgWNJ0mkXFuKEaGaJA9mw4j3ydSvW+54
 3tH0voIu28VhvBKs/G+GO8UL7NXqET89D+Y8bWKsjgs5mrN6Gsi46LTm9HkAMeP5JLAnIr81QCk
 lZXnI5CoJim/hpgh+2gUyoHVN9UAMU65BmGWjmh2HoepR20Oa12yrFFpmCzwGR/paO0ZAYKPvxQ
 9epU8YoobV0yEq9rE7VUTSPyNbCOsTIXnMKCAoTnb+HIDJk90Eol6Hd8aBAekg=
X-Proofpoint-GUID: -YrXYUg9FEzCSjC2detl4GzAsqMkRAdk
X-Proofpoint-ORIG-GUID: -YrXYUg9FEzCSjC2detl4GzAsqMkRAdk
X-Authority-Info-Out: v=2.4 cv=O6M0fR9W c=1 sm=1 tr=0 ts=6ad736b9
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=v3ZZPjhaAAAA:8 a=VwQbUJbxAAAA:8
 a=dOLNmq4gAAAA:8 a=JfrnYn6hAAAA:8 a=heJNy-4494lu-r3jR4IA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=_m6CO-mWuQdSFutSHjXj:22 a=1CNFftbPRP8L7MoqJWF3:22
X-JNJ: AAAAAAABHjawVn0MCen8ecItlfTWx4zsNFrLOfIkjZwpVOKP8zTdwmRZKkwvobqvoYjub2XciAp1VHG8tSpaTLLVP1nRpf8KCD2SXulHfjcjkOPakTaPo/Era84DgUfBrasoXHvZuFPtjDfPHAMEa2vAne4gsMnraLYB9SFCNcvplZIv03RKIqp4P+BDMZB25wVH0tvnK4/D9VJ8z0rJT5H2IiZbFBAJfHBnwJ0X3SxkUxW7pFRuc/ipe7YNo1++xUv8iEnCztoemVzhRu3zFLMjmZqbkIhyV5xxpGDLEwFZ+DBYmy5xPQoGaJKGz2dNv4Gsyt7RXEjOgGztUzjv6/X2ysufcjxk7iku0mrGHOfa3ctAH3CI6RDiGEjHGIGwQzH+BejhG3WBeQVGQyp9/ysH9ivqsrHDY2nJHuP7P/P1wSdQKkIjHoEbqNXFyAEZzb+YMZd4di+/eixoBVBJoWiM7+vijSqUnXkTJ11ZL9dTa3fN0SowEIofn4gRF7e1CAJtjGGBLeEblMGnouBrn3QCT1DAbz5RQnegTArJVEfXhcghB5sy+AV8jEJJ5Ob2u+q8SUttzFb68QT15+DI65SPBaofHnemyMitcaEcxxAH34TOZ3HD3y7bKPFb69MtBXTjhFQwQxNbGa3OgjTl/E6xpOe5WYp4wwg0UbGOhBLBokHBT/3p7A5ueeMeIdbnv1c8VgMF2pIXA8uIQ32ViQ5/yaTAbaEHpeU0GsNc+rA8cwWqBbF/mdLWkfzl4H9aGLthH6EPtDy0MCR+2FRyR6IvnnD7CXTimr9sg5keZcaILIbPYOKP65bijtxPqQQqrT22f9n6GcRyty73+V+yIG4dTCZejvpnBsfEwIhfYIOXLIwQINno+mTDStmp9E+4dRmFBFgSgWds3yU694dbbiNyiQ9S/apsI0KJpJvCpVONv719XsFZ/MBjbtMW+VXtiC92/jGc/GtpC1HFkVV/d5lOSL5cWRx
 WsNmwufgcWHh7ksk1Y9kK9MMYEjaQGwDMwxD+5qnp1J2MpP4EXOh8UotaESg5zHMcpFD0+QsBnuF1StFMibIvTIIxR++Ac3t4QAJdPijGPboqKQ+uPDBgCigYBaG5VE3M+5sSjGbQXmOg/gHJZPxHf8oxWuF4a79lQH7PrrNziPubd9Usjl5gwn81fFctEQaYYLaFA2SVEiHd4udjZZMvalWp9dhHWTAI6mnJKNlSTpQnNKgWtjlF/NCp+M8YgRZFGh+4HW0j55E5iN8hrOX/TEz2qOttQG+QdOUWD9zGecRkEebC/94xpSvV/rOriOiv2DngZ9GCQBMo1Do41587SSdPnW9bWwGf4iVL5GkJ8GxWmc83uQ/ya4ujzDwZpoQtep30kekpi8lLH/C02Fcengh6jtBCb3X4pBJftsXvWgcpPouq4h0=

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
JCT-VC-HEVC_V1: 145/147
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
buffers with other hardware blocks (GPU, display controller).
The V4L2 pixel formats have been added to help with calculating sizes.

This driver has been tested on most Apple Silicon SoCs in our downstream
tree [2]. Its expected this driver will work on M4, M5, M6 and the Neo,
with firmware already being written for all except the M6 SoCs [3].

The groundwork for this was laid many years ago by Jamie, R and Eileen,
who through a combined effort managed to reverse engineer many core
parts of the AVD block.
This driver would not have been possible without the work done by
Eileen, who wrote initial support for H264, H265, VP9 and excellent
tooling [4], allowing me to reverse engineer AV1 and make the driver
conformant.

[1] https://github.com/sofus13/avd-fw/tree/avd-next-fw
[2] https://github.com/AsahiLinux/linux
[3] https://github.com/AsahiLinux/avd-fw
[4] https://github.com/eiln/avd/tree/main

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
Changes in v3:
- Align output buffer (fixes 2 hevc tests)
- Renamed interchange formats
- Fix various bitmasks
- Fix minor things reported by sashiko
- Pickup Krzysztof and Neal's R-b
- Link to v2: https://patch.msgid.link/20260926-avd-v2-0-ecebe6a3648e@icloud.com

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
 drivers/media/platform/apple/avd/avd-drv.c         |  782 ++++
 drivers/media/platform/apple/avd/avd-h264.c        |  862 ++++
 drivers/media/platform/apple/avd/avd-hevc.c        | 1328 ++++++
 drivers/media/platform/apple/avd/avd-inst.h        |  210 +
 drivers/media/platform/apple/avd/avd-v4l2.c        |  995 +++++
 drivers/media/platform/apple/avd/avd-vp9.c         | 1054 +++++
 drivers/media/platform/apple/avd/avd.h             |  299 ++
 drivers/media/v4l2-core/v4l2-common.c              |    8 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   17 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    7 +
 include/uapi/linux/v4l2-controls.h                 |    2 +-
 include/uapi/linux/videodev2.h                     |    9 +
 31 files changed, 12383 insertions(+), 4 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260917-avd-7ee5474b468c

Best regards,
--  
Sofus Forstreuter <sofus.c@icloud.com>

