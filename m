Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340513;
	b=JaocPw7Z2uWfRKwT5lF30O0ftUt3WfhbbAas9uma9jYmgGxFPZUEZkBoG0qYNjGrSIGt
	 9t2vRkg0OSQ8xd0mIKKLp3/1vK7LG5TIg1NFehQcVBQgrykHRHY7i6Eo48ZSafAokTBax
	 q5FDjqsWtG3s9px4s8FjdsmSoP32cqocpT3SgBlnKm0pXCapFdiuLMHt7ljR2XhyMpidU
	 uPEuCRUd7fCArygfoA5JwvjwIj812eSGs2xfr//XzVDZDqN/csBUrP3+hssXyHxK6GZNJ
	 SrNH9YC/FN6AkZsG+ljcd9ks+ko6iWZ2Cy7yEXKQsktYtvcXHw+2a87q135yhPsZF/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340513;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6GlDb7lm6aYR0IRYgfnid+NysewOROjC7qCh2yImHJI=;
	b=MdJ/8hORqbYwqUVwcNol1SF9zNA+0BqKopkLWLw3ubqmp8x9clRVaXrNDGnw4jgDWa5S
	 DgvY8Lk0koNvVgV9S7PbkQatKgAkDIfI1p6j1SHulej6vB+MYqqcWeHMHzq/5xQ/AaJcH
	 mXxaI9Ta1GMItZQLx9M9G4Gf1TfCWwN3qBrRZiw8uY/xwCmuRUnfYTjlOglUyUKbUXOWy
	 PbSjOjQyQmEynG9FWaPYDTdBEjtAWBkFpI0hlTaOjqDg9y3uWEAiqeuUccKjXS0JPR7MO
	 O7QgobEJ8vl5d8nkPHcARjLf6vKj19yqAVTuMlb3Y2Z9Db0RrTP3FY7gJ3ZuonCjZyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=UgGmkneU;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8308F606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8308F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=UgGmkneU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794340508; x=1794599708;
	bh=6GlDb7lm6aYR0IRYgfnid+NysewOROjC7qCh2yImHJI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UgGmkneUXm+lg3jM7c4zqXdaPfY/scr9jsyBotztjHOkTTf/cMb6IsDDmWPHP9+1y
	 M78iD6W9kwLonJ9cQ6i0svFAglqMvROs3qTcCrvcYYNkyvTAx6/p8QE6G6MX0Oy0Ol
	 YQER9eBLetc7oCTFE2b2W2g7+uqKWEnRYlZw89xDR9uI5DRy6Zr7N0vHadSr+VwQhw
	 aTtouvEcgDuSuY2LsVl25Fnxsf/YYkJhHEjxnULdc+rfCBafEsp9e1j7L+lJaiAari
	 kwIr61Eud6R9UHhydkzCf8/NdrPPw1dZ20TYaDQJxIuX8gd3bQPb9W8iMfheZssqxK
	 lIp0zKmgI1KlQ==
Date: Tue, 10 Nov 2026 19:54:59 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261110195454.48176-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a298519fe2adf8271fe84889c724d7d1933a6d62
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

  1/6  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  2/6  media: i2c: Add ST VD55G0 global shutter sensor driver
  3/6  platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
  4/6  media: ipu-bridge: Add ST VD55G0
  5/6  media: ipu-bridge: Index the sensor device properties as the endpoin=
t ones
  6/6  media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator

The driver is a port of ST's own downstream driver, firmware patch
included, as vd55g1 carries its own:
https://github.com/STMicroelectronics/vd55g0-linux-driver
2/6 carries Benjamin's Co-developed-by, and its clock tree is based on
his.

Changes in v4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- 2/6, Sakari's review:
  - the controls hold the settings, applied with
    __v4l2_ctrl_handler_setup() at stream start and written by s_ctrl
    only while the sensor is powered, as in vd55g1;
  - the format and crop live in the subdev state, and
    media_entity_is_streaming() replaces the driver's own flag;
  - one supply list for DT and ACPI; the ACPI table moves to the end;
  - and the smaller points.
- 2/6 also: the control handler's lock is the state lock, as in vd55g1;
  hflip and vflip form a cluster; AE_TARGET_PERCENTAGE is written as the
  16-bit register it is, and LINE_LENGTH at stream start, from the crop
  and HBLANK; no pm_runtime_dont_use_autosuspend(), which the core now
  does, as in Joshua Crofts's patch for vd55g1.
- 2/6 keeps the bias on AE_TARGET_PERCENTAGE: AE_COMPENSATION sends the
  AE to its maximum for any negative value here (Benjamin, on v3):
  https://lore.kernel.org/all/20261110194620.46374-1-lsa.uz@pm.me/
- 3/6 is new: int3472 gives SMO55F0's two supplies the driver's names.
- 5/6 is new: dev_properties indexed as ep_properties (Sakari); 6/6
  takes its entry that way.
- 1/6 does not change, and carries Krzysztof's Reviewed-by. One file
  stays, since the two sensors' bindings are the same (Krzysztof, on v3).
- Fernando's Tested-by stays on 4/6, which does not change, and is off
  6/6, which does.

v3: https://lore.kernel.org/all/20261109093353.3757-1-lsa.uz@pm.me/

On the supply names in 3/6: which rail each of the two pins feeds is not
documented. Measuring it here does not tell either: with the power
enable alone, or type 0x10 alone, the sensor never answered on I2C (0
of 6 each), and with both it always did (6 of 6). Type 0x10 maps to
vana because Intel's iactrllogic64.sys calls it Avdd; the power enable
takes vddio, and VCORE stays a dummy. The driver enables all three
together, so the names do not change what the sensor gets. Hans, Hao,
Dan, D. Manresa: if you know what these two pins feed on this machine, I
will change 3/6 to match.

3/6 matches SMO55F0, which is also the Surface Pro 9's IR camera, and v4
has not run there. Fernando, could you try it? If its INT3472 uses other
pins for the sensor, 3/6 needs them too.

On both machines the sensor needs Hao Yao's int3472 fix, which sets the
24 MHz clock the SSDB asks for; without it the sensor runs at four
fifths of every rate this series computes. Its v2 fixes the Surface Pro
11; on the Surface Pro 9 the _DSM wants 0 rather than 3 (Fernando):
https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/

Tested with v4 on the Surface Pro 11 for Business, on v7.4-rc1 with Hao
Yao's int3472 v2, KASAN and lockdep on, IPU7 run by the ipu6 driver, in
four boots:
- 3/6: INT3472 registers vana and vddio for the sensor and nothing else
  changes; vcore is a dummy;
- probe defers until ipu-bridge has made the endpoint, then binds; the
  sensor suspends about 1 s after probe, with no power-off inside it;
- probe forced to fail at registration: no clock or regulator warning.
  As a control, the same failure after a runtime suspend inside probe
  gives three warnings per probe;
- every mode runs at 59.14 fps, in Y8 and Y10 at all four sizes and in
  Y10 packed at full size;
- read back over I2C: the controls libcamera leaves alone reach the
  sensor at stream start when set with it off, and during a stream at
  once; the 3A lock freezes auto exposure and holds across manual mode;
  an active format change while streaming gets -EBUSY;
- under auto exposure, exposure and the gains read back what the sensor
  applies, and after the stream stops, what it last applied;
- the illuminator through led_mode, and the privacy LED lit while
  streaming;
- three unload and reload cycles, and ten runtime PM cycles;
- s2idle with the camera idle, and in the middle of a stream, which the
  ISYS refuses: the sensor gets no callback and the stream goes on;
- v4l2-compliance 46 of 46, and 54 of 54 through the media device, with
  two warnings for the read-only crop;
- no KASAN, lockdep or Oops report; the only other WARNING is the ipu6
  driver's lockdep_assert_held() at each stream start;
- after the last change, no pm_runtime_dont_use_autosuspend(), a fifth
  boot repeated the probe, the forced failures, the unload cycles and
  compliance, with the same results;
- checkpatch --strict, W=3D1 and sparse clean on x86_64, i386,
  allmodconfig and without CONFIG_PM; smatch clean; coccicheck clean
  but for three scripts this spatch cannot run; each patch builds on its
  own; dt_binding_check clean, and it refuses a VD55G0 example at 125
  MHz.
5/6's lens-focus entry did not run: this machine's rear camera has a
VCM type ipu-bridge does not know. The Surface Pro 9 entry in 6/6 was
tested by Fernando on v2, not by me.

On the illuminator in 6/6: it stops lighting past about 70% of the
frame, and in the dark the AE runs past that, to exposure 1796 with both
gains at maximum. v4, as vd55g1, keeps that as the next stream's AE cold
start, so every later stream starts on a black frame and stays there
until the driver is bound again. On a white sheet the AE settles at 51
lines from the default cold start, and from 1796 with no gain, but never
leaves 1796 with full gains. A MAX_EXPOSURE_LINES cap while the strobe
is on should avoid both; I would send it on top of this series.
Benjamin, or should the cold start not carry over until then?

Tool use, per Documentation/process/generated-content.rst (Assisted-by
tags in commits were dropped in 7.4-rc1):

* My contributions to this series were prepared with Claude Code
  (claude-opus-5-5); work by others in it is their own.
* This replaces any Assisted-by tags in earlier versions.

Sergey Lebedev (6):
  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  media: i2c: Add ST VD55G0 global shutter sensor driver
  platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
  media: ipu-bridge: Add ST VD55G0
  media: ipu-bridge: Index the sensor device properties as the endpoint
    ones
  media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator

 .../bindings/media/i2c/st,vd55g1.yaml         |   27 +-
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/vd55g0.c                    | 2232 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   85 +-
 drivers/platform/x86/intel/int3472/discrete.c |   25 +
 include/media/ipu-bridge.h                    |   16 +-
 8 files changed, 2390 insertions(+), 16 deletions(-)
 create mode 100644 drivers/media/i2c/vd55g0.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.54.0


