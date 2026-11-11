Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395500;
	b=luIak11uxZwtLFOM0QDH9P746rfp80BTLf2L0rRnbL4WOCzZOkTkDXNFD63jz9mHpMtT
	 omOX64TXIYD12brunjezRAuVQ4drh8MfYj1LB/1JBSNhyrHRhFriSayZD+OIIou6jhvg1
	 ePACeTPWEsKybCLhTeoy12D7eROFpWCwwUT6FIrDt1RT8KpG5zDEdKGZ/eRDFdykZwZx2
	 yiGM+l8bBbdmUPwgRMwf4Rk4BH3Y5RN/0oWv6t2QNw3P0j1/von5Gg++DSlXtvTaEVERi
	 5Mw2Mm7Y1C9CGqrtL0Kotkv8UbujAN17VVgXOEtb4sE3yACt5/xE9zeZ15zLlxaGcgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395500;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=jwIvi+CDyCVtdUk1U/U2+9OpUe/CHWnmzUcZIl4KO1Y=;
	b=iW21X0XnW4PYzkby6s5ysi1cicMd4X5isoclsYXTfzkvvaFQ38K7rITHuAtR8ax3QnFz
	 a72yTH2lEMAp2b8HBhkRmh0F/PYOhBrkG8oP3j/nclHCfKhwn1sR6oOrPj0VSiqg96bjC
	 StbVIgcYhxbawI51qHTRNV2t0dQIDWOiCSGHP00y2lyEQGs78364Obd3Z7VNz1nNTx5FT
	 9J6fb+YR8GjLpWYGKPfEqflLS+fBvhzu9iKRB3Q5/fo6b4g6gOiJLeK2Y9jHxxE2wRKsn
	 Ul2IbfpLigrRX3AOSqDgxlLINS86KZbJkPHdq58YUtqeUsaUpJr2DUlJRYzOOxRUQ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ybxQD8f2;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C73606B410;
	Wed, 11 Nov 2026 11:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C73606B410
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ybxQD8f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jwIvi+CDyCVtdUk1U/U2+9OpUe/CHWnmzUcZIl4KO1Y=; b=ybxQD8f2xHw5z
	cywyvAr4DiypgZEzaEAuAKYavVUXtu6hyLQz/5i1YlQH2ErezkMhZjFiwMb5gzoq
	O4VHTN+GYG1VqWX+D+F4lCjoO9sOWRDMgX5/VNPG+O3gz3ijeOqjNkwfV6FRHc0N
	sPHLPKu7C35SLsMShetY+gtbxGOytU=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.178.45])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3QEVkTfRqfLWsAA--.2531S2;
	Wed, 11 Nov 2026 19:11:32 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v10 0/2] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Wed, 11 Nov 2026 19:11:30 +0800
Message-ID: <20261111111132.1296892-1-xiaqinghuan@mail.ustc.edu.cn>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgC3QEVkTfRqfLWsAA--.2531S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtFW5Jw4rtrW7Zw1kZrWDArb_yoWxJr48pF
	Z8XrZakr4kJrW8W39rCw1xZ34rur1SyrW5tryvyr18Z3Waya4Iqryayr15CF1UGr1kCr1a
	yryDua4xGF18Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgcTQUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREIB2rzcNlJ1wBIs5

*** AI-assistance disclosure ***
This cover letter and the two patches below were prepared with the help
of an LLM coding assistant.  The author reviewed every line, ran every
gate quoted in this letter himself, and takes full responsibility for
the content.

This is v10 of the WL2868C binding+driver series.  It supersedes v9
(<20261107015014.22374-1-xiaqinghuan@mail.ustc.edu.cn>).

What changed in v10
===================

v10 addresses the three Medium findings sashiko posted on v9 2/2
(<sashiko-outbox-205554@kernel.org>, 2026-11-09) and the two Low binding
points from the v7 review (<sashiko-outbox-201357@kernel.org>) that v9
did not carry forward.  Sorry for the round trip: v9 2/2 is
byte-identical to v8 and v8 2/2 to v7, so those reports predate v9, and
v9 only carried Rob's binding points.  v10 fixes all five.

2/2 regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

1) [Medium] "reset released before enabling vsys in wl2868c_probe()".
   Accepted; all three sub-points were real.  v9 got the GPIO, registered
   the reset action and waited 1 ms before enabling the control supply,
   so the deassertion and the delay ran while the chip could be
   unpowered, the device ID read followed the supply turn-on with no
   startup delay, and the reverse-order devres teardown disabled the
   supply before asserting reset.  In v10 (drivers/regulator/
   wl2868c-regulator.c, wl2868c_probe()) the reset GPIO is taken with
   GPIOD_OUT_HIGH (RST_N asserted), the control supply is enabled first
   (wl2868c_enable_control_supply(), new), and only then is RST_N
   explicitly released with gpiod_set_value_cansleep(reset, 0) followed
   by a startup delay before the device ID is read.  The reset action
   (wl2868c_reset_assert(), renamed from wl2868c_reset()) is registered
   after the supply action on purpose: devres unwinds in reverse order,
   so on unbind RST_N is asserted again before the supply is disabled,
   not after.  The 1 ms values are now WL2868C_RESET_RELEASE_US /
   WL2868C_STARTUP_US; I could not quote a datasheet page (see the note
   at the end), so the letter keeps the same conservative 1 ms as v9.

2) [Medium] "vin7-supply not enabled for I2C in wl2868c_probe()".
   Accepted.  The binding allows either supply, but v9 only asked for
   "vsys" with devm_regulator_get_enable(), so a vin7-only board got a
   dummy regulator and the control logic never came up.  v10 adds
   wl2868c_enable_control_supply() (drivers/regulator/
   wl2868c-regulator.c): it uses devm_regulator_get_enable_optional()
   for "vsys" first and falls back to "vin7" only on -ENODEV, keeping
   whichever is present enabled for as long as the driver is bound.
   The -ENODEV check (not IS_ERR) matters: -EPROBE_DEFER for a vsys
   provider that has not probed yet is returned as-is instead of being
   misread as "no vsys described".  On boards that describe both, only
   VSYS is enabled as the control supply and VIN7 stays available to
   the regulator core as LDO7's input, unchanged from v9 behaviour.

3) [Medium] "preset LDOs enabled by wl2868c_probe() when SYS_EN is 0".
   Accepted; this is a real bug on a board whose firmware presets LDO
   bits with SYS_EN clear.  v9 seeded chip->enabled from the whole
   LDO_ENABLE byte, so the first enable() of any single output wrote
   SYS_EN | (preset bits | own bit) and switched on outputs no consumer
   asked for.  v10 seeds the tracked set only when the register already
   has SYS_EN set (wl2868c_probe(), right after reading
   WL2868C_LDO_ENABLE); with SYS_EN clear chip->enabled stays 0, which
   matches what is_enabled() reports, and the first enable() writes
   SYS_EN | <that one output>.  The comment in wl2868c_enable() was
   updated accordingly.

1/2 regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC

4) [Low] example enables ldo1 without describing its input.
   The provider node is already gone since v9 (Rob's point); the
   remaining half is fixed here: the example now also describes
   vin12-supply = <&vreg_vin12> next to vsys-supply, since the binding
   says an input may only be left out when the outputs it feeds are
   unused on a given board (willsemi,wl2868c.yaml, examples).

5) [Low] MAINTAINERS driver pattern dangling in the dt-bindings patch.
   The "F: drivers/regulator/wl2868c-regulator.c" line moved from 1/2
   into 2/2, where the file is actually created, so
   scripts/get_maintainer.pl --self-test=patterns has no dangling
   pattern at any commit of the series.

Gates run on v10 (on the 7.2 pristine base, commit 25f7927e6ccb)
===============================================================

  git am of 1/2 + 2/2 on a pristine checkout: clean, git status clean
  scripts/checkpatch.pl --strict --no-tree v10-0001 -> 0 errors, 0 warnings, 0 checks
  scripts/checkpatch.pl --strict --no-tree v10-0002 -> 0 errors, 0 warnings, 0 checks
  make ARCH=arm64 W=1 drivers/regulator/wl2868c-regulator.o
    -> rc=0, no warning
  make ARCH=arm64 DT_SCHEMA_FILES=.../willsemi,wl2868c.yaml dt_binding_check
    -> rc=0 (CHKDT/LINT/STYLE/DTEX/DTC all pass)
  scripts/get_maintainer.pl --self-test=patterns at both commits
    -> no new warnings (pre-existing unrelated upstream warnings only)

The 1 ms reset/startup delays and the 150 us enable_time come from the
WL2868C datasheet; I do not have a citable document revision to link,
so I kept the same conservative values v9 already used.

Qianhui Xu (2):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

 .../bindings/regulator/willsemi,wl2868c.yaml  |  99 +++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/wl2868c-regulator.c         | 280 ++++++++++++++++++
 5 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
 create mode 100644 drivers/regulator/wl2868c-regulator.c

base-commit: 25f7927e6ccb6f4d8652b2b474d4c935faf580f6
--
2.53.0


