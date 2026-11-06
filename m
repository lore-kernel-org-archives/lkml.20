Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964613;
	b=f+C5ZbAdLM8aUjsFR8PRMDSKKWSll62FJdzTaEA9pYEyx/v7G9bM3aaTIMe77J8vfho8
	 ZBxX0Jm0gFSgU3amL6FBl/ANiCuURIXGtQ6wo+BV04bBtJwoewZNbV4I1BAvSjtAHE4nl
	 mq4+rb88goSXkJoBsIdeGYSSBUZgCCVPFouAztJf3+sn3g/xLVdzENiOoScKWRVAKyTYo
	 UZczaYdP9UGb4GTb47pfHTGRe0G7r6IUyshw37pz79CTvA2Ogjf9eAuhptCBCqGgBzAXM
	 FFDIVu1+2Q7Lph1c2U5O+GvFEDGiaQTyboVPzvqs1HH6A7NEA4vilK/Pth1tBwoB9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964613;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=r75pjL1lwsrTNpfsItTlJCD4RgVhy+TX8WewtawH42c=;
	b=1OuJucQiqhYJCCIwkVYJWo2iUjng7legH8KLnvN8xBL/dWxxCTfqbCeYD3KrC7AwEXvw
	 G8pSe6ZCUK5BmqpOvZdMED1W8D1D9o1dOGVLqYbJCdfBXeP3M60vHOcf5Y9fJrgAEyLP/
	 wFrc4vgEpoVsl31Yp4IGV4yHjUfXoLPnhUY0N1Rqgppmd3uvTOFzb7xEw/89eGdg8Ncjt
	 3i1in6EZaVW80db6b5H2/B2/QkVcxz2mhT3SVCpLDNbDBksd0YmT4SIJk4kT52nfhDEfP
	 Zf6iMnlbH/8FU2wyr0nLnPgDHa5xSSfqtm5u/V3B2ynuKqp4CxMwjHSK/+Uaa+QIp7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qpgHAIOZ;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADCF606A330;
	Fri,  6 Nov 2026 11:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADCF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qpgHAIOZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=r75pjL1lws
	rTNpfsItTlJCD4RgVhy+TX8WewtawH42c=; b=qpgHAIOZywucHtAOgEZTzJ2IGV
	SBZuOcRTdmsG+EwTnDejktqP4dvbTjGSealupqbGhr3FKFOLOmMvZCVb/ivLkXB5
	9REjGHrsrIWKjuCfKp+UnQU27jsJF6NOPWMLszGGtPg7wAfWrqnWBXq8nz40e9f/
	6hd68ie/6l7B1I248=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.184.75])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn2S09uu1qwTCPAA--.854S2;
	Fri, 06 Nov 2026 19:30:05 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 0/2] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Fri,  6 Nov 2026 19:30:03 +0800
Message-ID: <20261106113005.970822-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:3pYKCgBn2S09uu1qwTCPAA--.854S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtFWrZF1rJry3AFy5ZryUGFg_yoWxWw48pF
	Z8KrZ3Gr4DtryIvrsrCr1Iqa45ua18Ar9xCr18Kw1UZw4YkF1xXrZ7tw45Z3WUWrn5Cr1a
	vFyDWF1kGF1kZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqHqcDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rs2VhhrAAps3

*** AI-assistance disclosure ***
This cover letter and the two patches below were prepared with the help of
an LLM coding assistant.  The author reviewed every line, ran every gate
quoted in this letter himself, and takes full responsibility for the
content.

This is a two-patch series: the binding and the driver for the WL2868C, a
seven-LDO I2C camera PMIC.  It supersedes the v6 posting
(<20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>) in full, and it is
deliberately smaller: the board devicetree patches of v6 (4/5 and 5/5) are
not part of it.  The reason is in "Board devicetree held back" below.

What changed, and why
=====================

Two reviews were waiting on this series: Krzysztof Kozlowski's
changes-requested on 5/5 and 3/5, and sashiko's three Medium findings on
the driver and two on the board devicetree.

Krzysztof, on 5/5: "I do not understand why this is a separate patch.  You
add new hardware, so the commit is 'add new hardware'.  One logical
action, one commit."  Taken -- and applied further than asked: the whole
board enablement (compatible in arm/qcom.yaml, the board DTS, and the
WL2868C regulators node) leaves this series, because it is not the same
logical action as "add the driver for this chip", and because the board
DTS cannot be sent on its own yet (see below).  The 3/5 commit message
objection ("Board cannot be shipped with such compatible ... 'Add Lenovo
Legion Y700 Gen4, an Qualcomm SM8750-based tablet'") is moot here for the
same reason; when the board series goes out, the compatible and the
message will be exactly that.

Board devicetree held back
==========================

v6 4/5 was a board skeleton: board clocks, reserved GPIOs and
chassis-type, with SPMI PMICs, console and storage explicitly deferred.
sashiko called it an unverified skeleton, and the v6 5/5 regulators node
then referenced VIN12/VIN34/VIN5/VIN7 from SPMI rails that do not exist in
the tree yet, so six LDOs ended up with dummy parents.  Krzysztof and
Konrad have both said the same thing in other words: a board is not
shipped as a skeleton.

So the board devicetree is not sent here.  It will go out with the SM8750
PMIC description and the camera consumers (CCI plus the two sensors) that
give it meaning, in the board series that is already in progress.  The
v6 4/5 + 5/5 content is kept, merged into one patch, in
held-back/ of this series directory, so nothing is lost; it needs the
PMIC rails described before it can be sent.

Response to sashiko on the driver (three Medium findings)
========================================================

 - "chip->enabled is not initialized, so a boot-enabled LDO bit is
   cleared by the next write": fixed, the tracked set is seeded from
   WL2868C_LDO_ENABLE during probe, so an output the firmware left on is
   carried over by enable() and disable() instead of being dropped.

 - "vsys-supply is never requested or enabled": fixed, probe enables it
   with devm_regulator_get_enable() before reading the device ID.  This is
   not cosmetic: the I2C interface is powered from the higher of VIN7 and
   VSYS, so without it the device does not answer on the bus at all.

 - "disable() clears the tracked bit before writing the register, so a
   failed write desynchronises the driver from the core": fixed, the new
   bit set is committed only after the register write succeeded.  A failed
   write leaves the output on and the core's use count unchanged, which is
   the only self-consistent state.

Response to sashiko on the board patches (two Medium findings)
==============================================================

Both are answered by holding the board patches back, as described above:
the skeleton devicetree is no longer part of this series, and the missing
VIN parents go away with it (the regulators node travels with the PMIC
description that provides them).

Changes relative to v6
======================

 - 1/2: unchanged content, moved MAINTAINERS into this patch.
 - 2/2: driver only; three state-consistency fixes above, and the commit
   message now describes the seeded state and the VSYS requirement.
 - dropped: v6 4/5 and 5/5 (board enablement), kept in held-back/.
 - net: 5 files, 369 insertions(+), 0 deletions(-).

Testing
=======

All re-run on this exact series:

 - checkpatch.pl --strict --patch - (mbox on stdin): 0 errors, 0 warnings
   for 1/2 (117 lines); 0 errors for 2/2 (270 lines) with one
   FILE_PATH_CHANGES note ("does MAINTAINERS need updating?"), which is
   checkpatch's per-patch heuristic -- MAINTAINERS is updated by 1/2 of
   this same series, so the note does not apply.
 - dt-doc-validate on willsemi,wl2868c.yaml: clean, exit 0.
 - make W=1 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
   drivers/regulator/ with CONFIG_REGULATOR_WL2868C=m: 0 warnings, 0
   errors.
 - git am of 1/2..2/2 on f66469d9905b (torvalds master, 2026-11-06): applies
   cleanly, resulting tree is identical to the series tip.
 - scripts/check-series-selfcontained.sh: PASS, both patches replayed in
   order.

Board behaviour: this driver has been running on the tablet (Lenovo Legion
Y700 Gen4, SM8750) for several weeks as a module, with all seven LDOs
registered and the two camera sensors powered from LDO1/LDO2/LDO4/LDO7;
the LDO voltages match the values the stock firmware programs.  The
regulator node itself is part of the held-back board patch, so that
evidence is about the driver, not about an in-tree user.

Links
=====

v6: https://lore.kernel.org/all/20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn/
Krzysztof on 5/5: <20261104-elfish-booby-of-awe-27d2b6@quoll>
Krzysztof on 3/5: <20261104-offbeat-cerulean-degu-cfec1b@quoll>
sashiko on 2/5: <sashiko-outbox-196615@kernel.org>
sashiko on 4/5: <sashiko-outbox-196620@kernel.org>
sashiko on 5/5: <sashiko-outbox-196621@kernel.org>

Qianhui Xu (2):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

 .../bindings/regulator/willsemi,wl2868c.yaml  | 104 ++++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/wl2868c-regulator.c         | 246 ++++++++++++++++++
 5 files changed, 369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
 create mode 100644 drivers/regulator/wl2868c-regulator.c


base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1

