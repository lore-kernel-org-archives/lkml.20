Received: from outbound.mr.icloud.com (mr-2006h-snip4-6.eps.apple.com [57.103.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6A737C0F0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737349; cv=none; b=PhrAoj3UenSL9w6FkbXYh5SnY8j01HZ8qFZ8MqvlFNvmPgE9HCBrluZ3dEMv8G2s5Zoc+d6WVLfvpg8/5EI0IyODSI6o1JonkXRORy0AbDj1s4jlmLyXJGW3NkZpjqY1UKHHTCITieDaKLYwaT6aIOgg/0y9XqKLbFa5RBtYIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737349; c=relaxed/simple;
	bh=PD1kfiMF9zZyEOH0fS59yswHL/cepV3gwZLd4pQSRzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pe7HAXkpKJ+IAJxHd7eM7W4N4U7h6ecaDwoIR4ZgPdUZprHFLZuh2SpFcZikKkQz2ZrCFEnTWe3wkel1TnqVx1itReN1DEizxu8bqsXi8XyBeOjfaN4GIiebZHKqcP0Kydkq71rYHsq6OT0GXkIukrCXif+hH8eAz+v80N8I/OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=QgHJifj4; arc=none smtp.client-ip=57.103.70.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="QgHJifj4"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id E2C811803F15;
	Fri, 18 Sep 2026 13:15:41 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-936c-7f5b-b7c6-f10ea2f507c0
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGAl0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737345; x=1792329345; bh=+VsZZSAEII1s70obPcx7OhpRIxbOYvboRWhiysa5x/c=; h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme; b=QgHJifj4O9pluplzBM7OxByU1m8YeNHqk/To0aPA3APUlR79MgDYoHQESyPgmcG3Oq/YKlipx1DcnVkqTh5min8PwozqPdZEis77tQIovdkYTU5GkfdGi5lRBBPYNBXiXPu+FnkfAjpfK6iDIYFYIFvF94nW6yKLkLsLxOD/uUOfvmUP0jZcgsC5t/qIf4dbpPZdwxMGtc+VNeMN3D5NuD5vhPdBaCT9ou3O/LTQj0V0GfkxWSzbP7V1xd1xQGWCFiyVfVwg4X9NL1/Shyp4q3XYG/v0dX8cqti/9s8gTx74T+oFAAvGenzIWGd9Lwjtf2lyOXf5R5IQe4YWIW1wjw==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 220D21800179;
	Fri, 18 Sep 2026 13:15:37 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Subject: [PATCH 00/14] media: apple: add avd driver
Date: Fri, 18 Sep 2026 15:15:05 +0200
Message-Id: <20260918-avd-v1-0-49977931f455@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3cSyFF3z1FRTE3OTJBMzi2QloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0AlJ8B1mcAAAA=
X-Change-ID: 20260917-avd-7ee5474b468c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfXyyhb2qJwQNnf
 7hMJVsQoQXb9c7lsu53OoTOfmurzACsgBL25mczsP2k4A67c8Os5tRMLLvkQdgvymsmdJkSZR9l
 pFwXxqtPV21Ue3FD6fP/QMhXjT9w0Ll3awmq8mOsySTpPX0oBLIj3R87Fq1nJrFE492IHGGK+tc
 XsFyUqveR3Vhu+bo7Kfk/RMNyS539EMSsT0zbGHSyD3oZ6f8ZRo9WMT4qm/1A2UhJCszBwZ/AZ2
 XHYcVrySreGMDeSkaLUYQqqBJ5Y53ygc0xJvZWF80KZQoLFJ9WOZTPQMAF+RyvDKpgnZac2EfsH
 2Y7gZF38RjawjsJzmHGunrR3p46bSU4LyTt3iMGtaQW13MStRWCWIlNCDwU9PI=
X-Proofpoint-GUID: liDOzJqqvLy9C-Z5txNItY91-6C2QZnk
X-Proofpoint-ORIG-GUID: liDOzJqqvLy9C-Z5txNItY91-6C2QZnk
X-Authority-Info-Out: v=2.4 cv=V8VwEOni c=1 sm=1 tr=0 ts=6aad3980
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=v3ZZPjhaAAAA:8
 a=fYXbmyo_D6U5GG4wB3gA:9 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-JNJ: AAAAAAABiGr4SscrqLxkWtLE/1STqxfG3fbWxjFZjWKp8kaTv1vr9p0xnAkIrpil2HsnB2re1k0FzoFHt7pGgXC3fQotxSjvOndacarUwUKsUg3Z7NU2bKzQcmjECuxqDRrzHApEYXr7aLwWdDVuBWnW1gGTDS1Cks6iHmYUumji5MqX8vGuLFjtBCravL+zSHsn+/Hz2zxg4hTsRw9tBSxkJJEMtvanSHTAt0Zb+f3ZUUuSaSkq42IKmWRkNP0KTRAQW7vO/ZUlohwiGD64kLgXAMI88AeWcEGnwy2uOe/fMjZ7CNj3N0CfDpfBCJYbyNmGt9YnZ5Q3no8XrzgqZURT6eapwJhQLKQYLbiyakQwmB9k1dbubq4sYfRWx1n0XqtFA2fBOK+f8lR9J+K5l0NzV0zREa+Pv9/MBsvr1ML+AM80wisZ+I6GS95n1M00bbDddfcZz34VnxEApQ3gawGHKtSKPujP8T/pvlA/BUKJgPSlqCLhEFHr7fYIC4b7uyJ0ij+RNWlyJJm4JRUgfWTrEm+gnbg4tVIbEs5N9yfyVDmHHZtgE8ORf//Nl4AWBXa36QVQC/TAGRhfF+Mo9AlJIlCF9e5ZNOFc9FY0u+ENGcj1wKrvbz7xHzpiqgCj2ANfa5RCv3OJijsHCkLRYHwtYw+addUZNHVHyfyl2LRohjQX0i8BZjy8eCkhaRUKLeSOjhrpNtrNI9O4bsyQc5A500U/75n+d9J3a0P8w8mDZ8+McsUXppyFU7Q6hhwzsdOJZR7NZx89XrSqBVZDzt/xR2ZRxIWxJol/6urFpRdAqdjMFjVSHgtOoaic/G2CBdbd6LYU4pJChOpIsJNOSS+xvpWqM/MgCRTtmuxFYdcIF0knwDMwRNOdnuRonhuuRs6tmJAhzCgS0Lydjmf/1sFDD03AJ6XXHsC0Yzw1oc/LzsO6zxSUzd4QCgrwV3yxvnhjLUnxKIutz4v7F2NEr/1WMMGXJjL
 hKFI1YI0/EaCC4MgE+FugQG13tgVQyIYtH6Mq+ukps0X4XEbGuZA/n6wMuqhHkKJe4V7ipLXz0yS5oVHxLZWCZGnDbllf1L/I2yv6013woQTPysZQdCkccoFtTQJiaNFdeqxAyX3xSt6/dzvWHHTQ3ycBw3+2l6vRuiUHngc5B17o2r2F/xz93UamKE5UOyDQOSVVTPh1Fuofz8p/+FcLHCA40rTooYL2L3hRExXMxhYgdSeuowjlu8q4GQZk6SAZS5Km7w1Ns6rVZLeQHLM/I1q+0Ly+j4hcuopCWZ2Nx/GWafuQwSLSKK0gZ7YfZfjTJ7s9DwcqzPIwel4n+u02pz3BiWR+UpY1QG6+zJZqMu+gpZhVzGkMpliV7/tXhKXoCGle9wuAzVsCW2m6FI5fcsS0ZVWyJHgXq/EZY4HV

Hi,

This series enables hardware video decoding on Apple Silicon M1, M2 and
M3 SoCs. It adds support for all the codecs AVD (Apple Video Decoder)
supports, which is H264, H265, VP9 and AV1 (only on M3+).

The AVD is a bit unique both as a video decoder and an IP block on Apple
Silicon SoCs. Instead of following the normal "a register for each
parameter", AVD is programmed through one single register. This means
the order of the writes are important, but its also important to ensure
we dont write faster than the hardware can process.
To solve this problem the driver writes the 'instructions' into a list
of 'segments'. A shared function then submits those to the hardware
while making sure to wait each time the hardware lacks behind.

The block also includes Cortex-M3 co-processor that accepts unsigned
code. The CM3 is not really required, but is the only way to get decode
status IRQ's. For now, the CM3 only handles decode-tunable configuration
and forwards all IRQ's to the AP [1]. In the future this will be
extended to handle the instruction submission, this would likely result
in decreased power consumption, some initial testing even suggests
slightly faster decode times.

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

All codecs support 4:2:2, 4:2:0, in 10 and 8 bit. AVD outputs in NV12,
NV16, P010 and P210. Support for 4:4:4 and 12 bit formats is not added
yet.

Internally the AVD uses an Apple specific compressed and tiled format
called Interchange to store reference image data. This is stored after
image data across all codecs. Apple Interchange is used for sharing
buffers with other hardware blocks (GPU, display controller), support
for this is on its way [2].

This driver has been tested on most Apple Silicon SoCs in our downstream
tree [3]. Its expected this driver will work on M4, M5, M6 and the Neo,
with firmware already being written for all except the M6 SoCs [1].

The groundwork for this was laid many years ago by Jamie, R and Eileen,
who through a combined effort managed to reverse engineer many core
parts of the AVD block.
This driver would not have been possible without the work done by
Eileen, who wrote initial support for H264, H265, VP9 and excellent
tooling [4], allowing me to reverse engineer AV1 and make the driver
conformant.

[1] https://github.com/AsahiLinux/avd-fw
[2] https://patch.msgid.link/20260917-apple-interchange-modifier-v1-1-875294689c48@gmail.com
[3] https://github.com/AsahiLinux/linux
[4] https://github.com/eiln/avd/tree/main

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
Sofus Forstreuter (14):
      media: v4l2: Add P210 pixel format
      dt-bindings: media: add apple,avd
      arm64: dts: apple: t8103: add avd nodes
      arm64: dts: apple: t8112: add avd nodes
      arm64: dts: apple: t8122: add avd nodes
      arm64: dts: apple: t600x: add avd nodes
      arm64: dts: apple: t602x: add avd nodes
      arm64: dts: apple: t6030: add avd nodes
      arm64: dts: apple: t6031: add avd nodes
      media: apple: add avd driver
      media: apple: avd: add h264 support
      media: apple: avd: add vp9 support
      media: apple: avd: add hevc support
      media: apple: avd: add av1 support

 .../devicetree/bindings/media/apple,avd.yaml       |  112 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   10 +-
 MAINTAINERS                                        |    2 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   24 +
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   24 +
 arch/arm64/boot/dts/apple/t6030.dtsi               |   24 +
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |   24 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   24 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   24 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |   24 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/apple/Kconfig               |    5 +
 drivers/media/platform/apple/Makefile              |    3 +
 drivers/media/platform/apple/avd/Kconfig           |   18 +
 drivers/media/platform/apple/avd/Makefile          |    5 +
 .../media/platform/apple/avd/avd-av1-entropymode.c | 4698 ++++++++++++++++++++
 .../media/platform/apple/avd/avd-av1-entropymode.h |  284 ++
 drivers/media/platform/apple/avd/avd-av1.c         | 1447 ++++++
 drivers/media/platform/apple/avd/avd-drv.c         |  817 ++++
 drivers/media/platform/apple/avd/avd-h264.c        |  851 ++++
 drivers/media/platform/apple/avd/avd-hevc.c        | 1326 ++++++
 drivers/media/platform/apple/avd/avd-hw.c          |  127 +
 drivers/media/platform/apple/avd/avd-inst.h        |  218 +
 drivers/media/platform/apple/avd/avd-v4l2.c        |  962 ++++
 drivers/media/platform/apple/avd/avd-vp9.c         | 1072 +++++
 drivers/media/platform/apple/avd/avd.h             |  305 ++
 drivers/media/v4l2-core/v4l2-common.c              |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/videodev2.h                     |    1 +
 30 files changed, 12434 insertions(+), 1 deletion(-)
---
base-commit: aedd77ea8168f00687c1248cdf115071e869cf93
change-id: 20260917-avd-7ee5474b468c

Best regards,
--  
Sofus Forstreuter <sofus.c@icloud.com>

