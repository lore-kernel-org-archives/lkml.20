Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965380;
	b=2Xj4oZLNKBInllW+UYsCbLGu4Aoy8PmkEG84QKRqFv4Ad9suDFS2/5M52hkWxD2uZ8Nb
	 9a0M6oL6jNrSCQC4adGsPbYoeFYsYCuLa2u0T49n0jk2sE8EbBhEA4SODnDfaGrS/2cEp
	 WoWKy+QUg9LpYfA4EJ1epQFG5gx93eSwhJe12a3dax3SOvAcmWz8eSCpIMhvufAGwc6jR
	 SG3Q9c5Gun8BkN7wcQfO7kKhZ8KDZLiTF3Mgb6GT9weJj0NKxWgHsayek/ARMnaen1gEV
	 qzY1FbFaQ7QvM9bNfjZRpeJW7IUejjwB6YMYNctWxAlinSrXxF0SjlqzL5DAWTPInwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965380;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=AjPXGxoDKl+k3lBwROGllhbCGms+vB6SYc57+d45zc0=;
	b=Sk1NHGv5ybiBY6ePybBn+WGiGxgd6+trCboWzbloBOd7lsnakv9yNnBW1XRL+664Ks8B
	 FRe1NusGH3tepUKUp2/I0DPzKq4rs+/2WNdS0GNpH4uVHURFexVTrUW0j43OjFVfHEbHh
	 iSaAuqcR1NrPPmhoai5b6LOH/Wh/qGDWFWq2PwPjnaXd4R12T9dEcf+ECf2oZ7e5HvHvm
	 b8URTsjxWZzhERrj2H0UwV8n/ktJvyfqnYZ397Gt9C/g5HZoTROCBNSB/HEOBognFEeMJ
	 MdsDFN8tnesj+HoA1yELPL3QTJ/499dZZ0UdWJ6u0/8vw0tcdkI2FGrh+Mjpeuy3peQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=sAsw17Ly;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF4F606A922;
	Fri,  6 Nov 2026 11:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF4F606A922
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=sAsw17Ly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=AjPXGxoDKl
	+k3lBwROGllhbCGms+vB6SYc57+d45zc0=; b=sAsw17LyAr6UHDJI/fDUw5Yw5n
	vM5HmDxwOMadIs5bgP1hHKAcLAKGuOmH69MAiEtfkTwv3/V9aYIHRe5vMxAGjg0l
	E5V6ZlaBnSp0UUDB93RHkIIbLukTHfH4Ca/hlmUGX1YZHSZfuypaEF78+iU9FhWq
	bQvhk0VPd3nIGJtwM=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.184.75])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn3DA8ve1qfj2PAA--.533S2;
	Fri, 06 Nov 2026 19:42:52 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 0/2] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Fri,  6 Nov 2026 19:42:50 +0800
Message-ID: <20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBn3DA8ve1qfj2PAA--.533S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtFW8ur4fAry7tr1kJr48Xrb_yoWxur18pF
	Z8KrZ3Gr4DtryIvrsrCr1Iqa45ua18Ar9rCr10kw1UZw4YkF1xXr97tw45Z3WUWrn5Cr1a
	vFyDWF1kGF1kZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr
	0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5qXd5UUUU
	U==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rs2VhhrAA5sn

*** AI-assistance disclosure ***
This cover letter and the two patches below were prepared with the help of
an LLM coding assistant.  The author reviewed every line, ran every gate
quoted in this letter himself, and takes full responsibility for the
content.

This is a re-post of the series sent a few minutes ago (Message-ID
<20261106113005.970822-1-xiaqinghuan@mail.ustc.edu.cn>): that posting lost
the version tag in the per-patch subjects -- they went out as "[PATCH 1/2]"
while the cover said v7 -- which is a tooling slip on my side.  The patch
content is unchanged, only the subject lines differ.  Apologies for the
noise.

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

