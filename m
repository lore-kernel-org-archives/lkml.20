Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216856;
	b=KnbMqXj05euiDNcvTnrzZcT/J2MEiiosUEHz8HmAmreNJeFF7zP+42VRIy/RPg8r28Q/
	 BpJ/9/OKMyLHEBr+4H8XbsXIvxLyarI7+AWjf/EkriUtx2NUqQbbdUdEkY5WsWiibYVO7
	 NCc9Cf0q9YecXwT1yME6kYPLvgl+4tbySM7WJHIcen9k+ToG9D75kyE1WeFffreJj/O7g
	 zEZbrQdfrqlsPA5B7cyAxf3cZhSvzuO3DCm2y7X+oYuK1PeKF87l/ecMPm/6r0/J6xOGL
	 xn2QeMjFb3AHMbvYfPwFnK7C3jYKefnSiP4vZk/1z65qrNuc4Uid74AWSKZZT8+ZcMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216856;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n4GaosAghDqO6pAayHdy/5ViKOQOZe9uvaTY4SQf0mY=;
	b=LkTeb4cpJHDpJ3o4Necjxqo+lZ5nF/xI68qDJZLp8SeQ2m1ycNoR41Gz/HN0Ejp6+ff7
	 /xTKLicGldHS9W/Ph13hRAd7LdRRImgL3zP6cVNZ2pYcZ1g2FrzzSz7xETsCCSjs9oP3b
	 eacUrfMkGWXcdoabvpHF2fXqKTyp48HhY3PlXQ3KT4rnoI2i+UEee2WZTL5JaxuH2XY6p
	 pUDjtSuJp07NAiY+k9WTbpI7TkvM8dYiJI2a9jCllo5tlRxeFHLOQfzKPMj3cqLGm1aEM
	 gWzTrInrGb9k7oAUsgU2R/bexI57V/W4+e/X7+xCm/w1xGYYj2H2R2t5VR665EOg1jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=jmkDiJoQ;
	arc=none smtp.remote-ip=79.135.106.119
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E131C606A325;
	Mon,  9 Nov 2026 09:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E131C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=jmkDiJoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794216852; x=1794476052;
	bh=n4GaosAghDqO6pAayHdy/5ViKOQOZe9uvaTY4SQf0mY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jmkDiJoQ3jdyua2YKHF10eJXBkEMoOX0bRLhzpMr1XtSLrAZs1YwFtYiR6U0adAKa
	 QaWTfDiFDhiBL+PchGOghzPfXu0/xNX7LtUq12DfTJSZDQRAiMmT7c5oGS8Qlu83cl
	 zNhTonvaK5GBNIi2IKoZxI9vhyk/FenzEMSi+N45qyzzfyDeXbbBEmRtlVjRB75x/x
	 92e0s4APnzV7AN+37gs9SxQ9PTI5229TJbiUcMlzPr6BteXS0qpbNFfZqGJVsQJcCj
	 Pc+pExztRPVH2UBxTl+Z/aG8n6UZ+L0LS5nHMn6AMmlB0/d0+nB2S+XyF/lXdNln/s
	 KxTHcB/e4BNWA==
Date: Mon, 09 Nov 2026 09:34:03 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261109093353.3757-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 74ed771a4eab9a2850d6d5d62174c245ddcb0a0f
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The ST VD55G0 is a 644x604 monochrome global shutter sensor. It is the
infrared camera of the Microsoft Surface Pro 11 for Business with Intel
(Lunar Lake, IPU7) and of the Surface Pro 9 (Alder Lake, IPU6), ACPI
device SMO55F0. Without a driver the camera does not appear at all.

  1/4  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  2/4  media: i2c: Add ST VD55G0 global shutter sensor driver
  3/4  media: ipu-bridge: Add ST VD55G0
  4/4  media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator

The driver is a port of ST's own downstream driver, firmware patch
included, as vd55g1 carries its own:
https://github.com/STMicroelectronics/vd55g0-linux-driver
2/4 carries Benjamin's Co-developed-by, and its clock tree is based on
his.

Changes in v3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- 2/4, the three points of Sashiko's review of v2 2/4:
  - under auto exposure, a stopped sensor's exposure and gains read back
    what the last stream applied, not the manual values set before;
  - probe holds a runtime PM reference until the subdev is registered,
    so the sensor no longer suspends 22 ms after probe;
  - RUNTIME_PM_OPS() and pm_ptr(), so the ops go with CONFIG_PM=3Dn.
- 2/4: register with v4l2_async_register_subdev_sensor(), so that the
  privacy LED the firmware describes is lit while streaming (Jizhou
  Tong); a failed registration now goes through dev_err_probe(), as the
  LED can defer probe.
- 3/4: SMO55F0 moves before VD55G1, so the table stays in vendor order.
  imx681 v10 3/3 adds SONY0681 at the same place, so whichever of the two
  goes second needs a trivial fixup.
- Fernando's Tested-by on 3/4 and 4/4. Not on 2/4: he offered it for
  the Sashiko fixes alone, and 2/4 now also registers differently.
  Fernando, if you want it on 2/4 as it is now, say so and I will add
  it back.
- The Assisted-by tags are dropped; see the end of this letter.

v2: https://lore.kernel.org/all/20261103103235.94397-1-lsa.uz@pm.me/

On both machines the sensor needs Hao Yao's int3472 fix, which sets the
24 MHz clock the SSDB asks for; without it the sensor runs at four
fifths of every rate this series computes. Its v2 fixes the Surface Pro
11; on the Surface Pro 9 the _DSM wants 0 rather than 3 (Fernando):
https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/

Tested with v3 on the Surface Pro 11 for Business, on v7.4-rc1 with Hao
Yao's int3472 v2 and D. Manresa's ipu-bridge v5 1/2, KASAN and lockdep
on, IPU7 run by the ipu6 driver, in three boots:
- probe defers until ipu-bridge has made the endpoint, then binds;
- after probe the sensor stays active and suspends about 1 s later,
  with no power-off inside probe;
- probe forced to fail at registration with a test-only parameter: no
  clock or regulator warning, and a deferral prints no error. As a
  control, the same failure after a runtime suspend inside probe gives
  three warnings per probe (clock already disabled and unprepared,
  unbalanced regulator disables);
- every mode runs at 59.14 fps, in Y8 and Y10 at all four sizes and in
  Y10 packed at full size;
- under auto exposure, exposure and the gains read back what the sensor
  applies, and after the stream stops, what it last applied;
- the illuminator through led_mode, and the privacy LED that INT3472
  describes, lit while streaming and off otherwise;
- three unload and reload cycles, each with a capture;
- s2idle for 20 s with the camera idle, and in the middle of a stream,
  which the ISYS refuses: the sensor gets no callback, the stream goes
  on, and a stream and compliance pass after both;
- v4l2-compliance 46 of 46, and 54 of 54 through the media device, with
  two warnings for the read-only crop;
- no KASAN, lockdep or Oops report; the only other WARNING is the ipu6
  driver's lockdep_assert_held() at each stream start, as with v2;
- checkpatch --strict, W=3D1 and sparse clean on x86_64, i386,
  allmodconfig and without CONFIG_PM; smatch and coccicheck clean; each
  patch builds on its own; dt_binding_check clean, and it refuses a
  VD55G0 example at 125 MHz.
3/4 only moves its line and 4/4 does not change, so their unload test
is v2's. The Surface Pro 9 entry is Fernando's test, not mine.

Tool use, per Documentation/process/generated-content.rst (Assisted-by
tags in commits were dropped in 7.4-rc1):

* My contributions to this series were prepared with Claude Code
  (claude-opus-5-5); work by others in it is their own.
* This replaces any Assisted-by tags in earlier versions.

Sergey Lebedev (4):
  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  media: i2c: Add ST VD55G0 global shutter sensor driver
  media: ipu-bridge: Add ST VD55G0
  media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator

 .../bindings/media/i2c/st,vd55g1.yaml         |   27 +-
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/vd55g0.c                    | 2442 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   70 +-
 include/media/ipu-bridge.h                    |    6 +-
 7 files changed, 2559 insertions(+), 7 deletions(-)
 create mode 100644 drivers/media/i2c/vd55g0.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.54.0


