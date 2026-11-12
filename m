Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.72.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444433;
	b=EMtbKDWWczSl/OU9PZ3gMdS2ayUrGxyn26qakujwhCzY0Orvjldd1FIjenqhq7FsodGP
	 dqBq5tRo7uQ6xyGVEsbOCKGvwdpqw78Yn3cSDljVVu4Kju6qvwaAOIxY75dmhjVlbmLu0
	 oWxIiIh4KirCYfrGWI/NDW92PjeoOqfYKEo8CWTVwpl60YFWjjGSXOAw5vJZ2F94YOjlg
	 gbaE/29yIF4AYpf7EbKKdbD2p/u9EY9KqCdlxOckiRpQfNOHsElE6yM/VwV306Pdztg7d
	 s/C6av8G3kGkLS5RyIoT+642mf+P7z5WohT0EC94roSVvGGP8MGH2gxkkWdCKZ4XyiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444433;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=XbrOo4huBxc2L0xUVgvUtiLAkLCu0nqc4PmTkdL7jno=;
	b=Rz/4RYTplZ5WUq6W+I9cWre//vl7OHU+PZhb+Wcvr64So3gg/sGSDp0kBe8iVSfFGjGg
	 bPIdsWzxKMi401/C2tBkBNoPBvkMwhbwOYOukGwgulyc6v2zA5z42rkjukX+Qt7hNF3x7
	 sDUiMUBaKVGw6qLrVnwmF57Lf4nzQ/8aB/PIPM7o9zqPTXo4VT5usMhIvwC+31XBKmXU2
	 zPjjowSDRTq5Gk4TE79Hb5xfUergc2PBwbEZVbmyJ3xfJtdWT58eyWCzR0LXeDSiEsYeZ
	 n8Cbmldo9qoKMMt++tLfII+fn5g78sW/umWC3hHkOgYAg2cr1ROpe6gDfaMxEitLxNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=I9c7LqFG;
	arc=none smtp.remote-ip=57.103.72.103
Received: from outbound.ms.icloud.com (ms-2005j-snip4-11.eps.apple.com [57.103.72.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11980606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11980606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=I9c7LqFG
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPS id 45AE318004BA;
	Thu, 12 Nov 2026 00:47:08 +0000 (UTC)
X-ICL-RepId: 01a1cd39-0380-728f-a833-7c436969ede5
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794444432; x=1825980432; bh=XbrOo4huBxc2L0xUVgvUtiLAkLCu0nqc4PmTkdL7jno=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=I9c7LqFGQPC4hc1j883OqiSDgYE7IJNWYG15Bc+xeEZF72THLRHv00wP+6LxBfI9KWN21zFfzG0oLxaHDd3wgrLKz2im4/qheCerstXsDeehhxVS7zsbRRS1bLc/yCG+6JTC4lZ1bArcQ/bl5ILTAVcp3JYYaGyJzPTJUltvDX6TDUBoXnZCJhzQEi4CJBdSjlpjCNEVTThvPMYLjJff54cC/9W2gQSJIfU1+n/I0u17qGYe90tBGFJnk7JLz+iRTv0gWXBmF0hzgn7cLa+YGxeh/9MMyqWFv9dGiYVA4v3WvqoVDBoKqo41aMfvubIn06iB3imnSPWlfLmeQiv3rw==
Received: from bigre.tail98293.ts.net (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPSA id B663D1800357;
	Thu, 12 Nov 2026 00:47:05 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Purism Kernel Team <kernel@puri.sm>,
	Vincent Cloutier <vincent@cloutier.co>
Subject: [PATCH v2 0/3] media: i2c: Add Samsung S5K3L6 and Librem 5 rear camera
Date: Wed, 11 Nov 2026 19:46:33 -0500
Message-ID: <20261112004636.739749-1-vincent.cloutier@icloud.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMiBTYWx0ZWRfX2LD5oNNx4wel
 DQBrYC1DtHdZp5j25LvjfxeG06Q1ThoXhcMNCUPbLa5EqtTkU5RMZw7LO/M82MPUYSDDwr9xgUC
 RJlNv8zeqkssQbXqnl6TOWz4PmqIxmsRQAepITjy8l48yMbRymjXtFfhTbXNUUUkI549oT9wbLq
 OM1VBHbXXa/TyL0mnOrvlRUU2mRBfgl2LfeC4h/1NQl5+swtyWoCfudqAaRwpLQungzxHiaIPAh
 3wvF4sh3kFpvcV28f6FiBp8zBVgy01iNbZy7UQK75/9mL6ApyRX3EqT0Zuy9IADPqPsopYUJv3G
 N68wvqXXPkoB8T7D5OwtKYWsXy5cFexfBP74F9lkbu0tHMDzQHSayfCcBt/nSw=
X-Authority-Info-Out: v=2.4 cv=DPIacCNb c=1 sm=1 tr=0 ts=6af50c8e
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kibvr5HLtuNvmma_iept:22
 a=NVRLzpS9o0UsCidzZbzm:22 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8
 a=Td3DOQvXE0cbqhFbeG0A:9
X-Proofpoint-GUID: V9lDdZNu0kPE1xwmJrEcl88tXz0EzloH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMiBTYWx0ZWRfX4vmFs7WVeV90
 vMc9I214PFlmf3KTuvFncIjsyckYeNM2yYiN7QQzD1UXjwOGh8Bm4YFHVVdJTFd9fsqNbWr89bw
 K7mpD4HYai8gpT7MwESvq/b2msuwVAs=
X-Proofpoint-ORIG-GUID: V9lDdZNu0kPE1xwmJrEcl88tXz0EzloH
X-JNJ: AAAAAAABUoX1BC//txojkthr/46AsiV8JAB8JP4pp5G3al/KmSo03UqV0f+q+ZixGTTInc
 OXBe1pDxfgVBnkehI6/ZL2LmjxoLtVAUduJxqWJwDeuoTin7/eQI/qWPjwAaAv2r5RofP7
 Ktq59XbM8eKa1haKofGs+UJ/IG3dlsxyISf1NndcA/khSd3JBi5qfULkB4wc2DnRF49zdZ
 RT3iZKOYiBpT+nI2+Lo/Ugewm7RtBWvIVYfgSLUl9SsDZ3imnLuz/eCY4CMVDZ3hKkQ+9h
 qR3hML4T/pkW7C91cAm5O0dMWJx9CU5O998qsjZ0hOTSiaQ+SEi3P61GPSt7CmyQyatWVM
 Sc+5+a7lnjo07yE2oZThOmCM35+1mNKovOP9q7kMCzc1ov7VNq3vhuN7IBZ8+IX1w1Ncbo
 qke6XQV6AHg3nI16r3ScNythuknBATDcU3XIMTivVmOl1z61MIY9aHXElU6CgHickCsYXg
 th6EzV2D45huPByTXQg3dnH2kDnnM3rLYCwYF095Ngzqv/t3jrbrdniM/c9POKWwKbh1u4
 FefBF1LTKCOFDi2zgZTQQJijD1d4wbMUGfzBAtHo7WG1Lek8XIupJnvElZ9iO0RifIW+5I
 aR2VecAirYihU+YrFY+mAFJy9/Ryh6yAAsEOLJkRs/R5zMa2UAX12trF9+k8ywVBuuwfm4
 nWhF1aaIeyQqr3ZkvZi2miXwtjwYLpnxRz/5V9mjFNChXYDSneKlmn4n21SzPOr05k8pXz
 Drbrvl7nZjPx5wpyyPbEetmWVnV8fvIyxx3vIt6+sgo4fIfIDXQ+Z6O2QVoyODKJLvTFl9
 ispM4TYPEmmWhIk4A51jnrHr6+zuqn0mksqKSUyOsVh94gZTs0kdLy8/mv6Y+Fl6CiEJjJ
 19WORXSJg/jW+jv2+3PDt0Iu1ihFghRYwe7NkUSa1ghm9yRuEV2fodxdZcKatJvzHB62X2
 D7lITo/cm02I2SX+cVfN7xN7XvQMo/+kDym37EcdGZsItZPvmhAn2l5dMkYH/mPFiRYN/w
 jaOPU6DWNiEaIfKKppmxDYlwJ2AMAMQ60nL737ix0rpBiX/XFpY4eyL5EhLZNwxOcU+xop
 1aWu3DFmye3wrhcawsn0pPdaB0T1HKUeyFWITCa7yCXtvxhw95Kubh5xkh+qqX772WM/3U
 DaCZxVcuhyKBy9xJzvtPOktLWA/j7pctbOEJ7UKzAMozkRgXNYY0tNjOW+4oUMAAT+aYd0
 expJsC55tGd6Z+nmi8olVkHS4uJP0vkKGIHJ4xbeTBi8it+jvkFOrNv7hnVvWWOZK5hJ05
 jxi2gKRHXrL34AvCvc5oOtuEB6MP+mP2Le4t5cWr7EwHM7LCRDJ1Bt9KOXVkwMo4A4pV0h
 AJ+3euuf69QEux6jOasawjuYF19U6HbSGulvbSP9qBRKl3H5Ohgg/J0=

From: Vincent Cloutier <vincent@cloutier.co>

Add initial support for the Samsung S5K3L6 raw Bayer image sensor and
describe the Purism Librem 5 rear camera and second CSI-2 capture path.

The driver targets the validated Librem 5 configuration: a 25 MHz input
clock, two CSI-2 lanes, and RAW8/RAW10 SGRBG modes at 1052x780, 2104x1560
and 4208x3120. It uses CCI regmap, runtime PM, endpoint validation and the
subdev stream API, with exposure, gain, blanking, link-frequency,
pixel-rate, test-pattern and firmware orientation controls.

The sensor driver is a rewrite of the Librem 5 downstream implementation,
not a direct forwarding of its bring-up history. Thanks to Martin
Kepplinger, Dorota Czaplejewicz and Sebastian Krzyszkowiak for the original
driver, mode tables, controls, power sequencing and tuning.

The Purism kernel team is Cc'd for review. Would you be willing to join as
maintainers of the S5K3L6 binding and driver? For now, only I am listed;
I will add you if you agree.

Focus-actuator and flash integration are deferred; this series adds the
sensor capture path only.

Changes since the RFC:
- Drop the media-driver reset workaround, as suggested by Philipp Zabel.
  The base already includes 71827776667f ("reset: imx7: Correct polarity
  of MIPI CSI resets on i.MX8MQ"), so no reset prerequisite is needed.
- Refresh onto media-committers.git next, fetched November 8, 2026, at
  v7.4-rc1 (6628e7d4c6b2).
- Remove redundant minItems/maxItems from the binding's fixed
  link-frequency item list, as required by current dtschema. The three
  frequencies and two-lane configuration are unchanged.
- Adapt set_fmt and get_selection to the V4L2 client-info API. The mode
  tables, requested-link-rate/line-length writes and PLL sequencing are
  unchanged from the actual mailed RFC driver.
- Reject active-format changes during streaming, retaining TRY negotiation.
- Recover failed stream stops with hardware reset before releasing the PM
  reference, and reset after failed starts. Reinitialize on an immediate
  restart and cache controls while reset is held. Require reset-gpios for
  this recovery path; the Librem 5 already supplies it.
- Clamp the exposure default when reducing its range, require a port
  endpoint, add MAINTAINERS coverage and document the register provenance
  and deliberate extra reset pulse.
- Support control setup and streaming with CONFIG_PM disabled.
- Propagate exposure-update errors before reducing frame length. Restore
  exposure-range metadata on VBLANK failure, and roll back mode-dependent
  controls and mode selection on a failed active-format change.

Previous version:
https://lore.kernel.org/all/20260626000715.1111803-1-vincent.cloutier@icloud.com/
Reset review:
https://lore.kernel.org/all/d80cecc3f317e4493207ea3c347dd144390d299f.camel@pengutronix.de/

Tested on Librem 5r4 on November 12 (UTC) with the v7.4-rc1 carry using the
sensor source from this series. All six size/bit-depth combinations pass
captures and sustained streaming, as do all 30 directed mode transitions,
controls, test patterns and runtime PM. Reducing VBLANK clamps exposure and
updates its range without interrupting capture. Active-format changes during
capture return EBUSY; TRY succeeds without changing active state. There are
no EOF timeouts. This is carry-based coverage, not a clean submission-base
boot. Error paths and PM-disabled setup have host-side coverage; no physical
I2C fault injection or new system-suspend cycle was performed.

Vincent Cloutier (3):
  dt-bindings: media: i2c: Add Samsung S5K3L6 image sensor
  media: i2c: Add Samsung S5K3L6 image sensor driver
  arm64: dts: imx8mq-librem5: Add rear camera

 .../bindings/media/i2c/samsung,s5k3l6.yaml         |  118 +++
 MAINTAINERS                                        |    7 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   51 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5k3l6.c                         | 1192 ++++++++++++++++++++
 6 files changed, 1379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
 create mode 100644 drivers/media/i2c/s5k3l6.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0
