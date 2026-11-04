Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762821;
	b=SQZAe+cmVqal9zKUv2gP4RhA2yZ2gxD8FXxUV3/EoI0Tt6LwQ31DWnlRadB7ovD0yvjI
	 z/Sl5E/lgYEaeiEeXQvBNlobcnAzE6fviNz5eX2Ups4q1wssOzRqJdwKnhIwf8bHFUViL
	 8lp4cA45NkmELyLD8XNRKTWf35NXhs/83J8Y4AcSJdW5fEWVRIOe5mBO/8x/MEj2P/vFj
	 wL/WZIZFfudYZMh0ZE/W43xkTyc+klD983WmOkjMln6kET9Co4fG14rdBGFXnwBq/yodq
	 ssWgfJRmFxhYYXGQqmgo5KuuHkFMDCf2B1bJwLs2cZnGH63lDoGLiSe+lyIIcIzTJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762821;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=zMixK3dgHkfJXLQEzBu/EjJno14izQhyCOF4QZyViR8=;
	b=kvwYTMxQMOyrsl4HacE4g9yYlp5aDxjtVMUgWBc/Ad/1tABPlfkm9s9b2XvxXR/AAOa6
	 yQ5R6rIOSmDBFscM3G4DytAW3fS6KmMCnklkNeSDDiJEfVKTrLd2JWuZ8cznY1jWa/2/I
	 WcvItd5IARK3+/39ZsuDDqQaxHdUzEBhERWVmmDw4tk7TbcMiWFcY5L7SHuCtSy5zgFMA
	 ++QVkPzsAuWaSRhZRVri6ng9wf5XuEDse/q2gp4Z6JYr0zihzGxPWcZWqJ3krJ2hy4RXP
	 7sn3YJMTE7dWxvTii8wTcqDPevvnS2r6F9Yne88XoYQURZL5KdkBQ0UKoFr2EZCoO+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="h/mc7YOq";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDCB606A326;
	Wed,  4 Nov 2026 03:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDCB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=h/mc7YOq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=zMixK3dgHk
	fJXLQEzBu/EjJno14izQhyCOF4QZyViR8=; b=h/mc7YOq0D7EhW/6uurXzk54QP
	4aRcGKIcA2Hn5kHScazqwNIumDRLXTG8w+JX8uUYv9yDjpeN+N2T/vcqxlZiUPQ7
	RxpL/EX+YoZT4f7ZQXMMD97O5YIYyz9d2NZUy+13zsbk509ebyZEWEcTDHLT9jM1
	a3DXUk+0GkE7cOhJE=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXnUH4pepqKzSAAA--.3770S2;
	Wed, 04 Nov 2026 11:26:48 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 0/5] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Wed,  4 Nov 2026 11:26:43 +0800
Message-ID: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXnUH4pepqKzSAAA--.3770S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF1ftF4rGF1DAr4UGr17Wrg_yoW7Xw48pF
	ZIvrZxCr4kKryIqw4Sgw1I9a43Zan3J398CFyUK3yUAw45ZF1Iqrsayw15Za4UCrykW3W2
	vF9093WUCF1kZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5GksPUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAcsP

This series was drafted with AI assistance; I reviewed and edited every
line myself, and I am responsible for its content, measurements and
decisions.  The commands behind the verification claims below are listed
in the series README that accompanies this posting.

The WL2868C is the camera PMIC on the Lenovo Legion Tab (TB322FC,
SM8750); its seven LDOs feed the rear camera, the front camera and the
VCM on i2c10.

Changes in v6:

 - Rebased onto current mainline (v7.3-20183-g05441d697f7f, tip of
   master on 2026-11-03).  v5 no longer applied: the board patch anchors
   its arch/arm64/boot/dts/qcom/Makefile hunk on the sm8650-qrd.dtb line,
   and sm8650-valve-deckard.dtb was inserted right there in between, so
   git am stopped on that file (Mark Brown: "This doesn't apply against
   current code, please check and resend").  v6 applies cleanly on the
   new base.

 - The SM8750 CCI patch is gone.  There is an identical CCI series in
   flight from Hangxiang Ma (Konrad: "There's an identical patchset in
   flight, please don't send competing series without a clear reason"),
   so this series no longer competes for those nodes.  The two
   observations sashiko made on the CCI patch (cci2 is not described; the
   sleep states change the pin function to gpio instead of keeping
   cci_i2c_sda/scl) belong to that series as well and are not addressed
   here.

 - The board compatible in arm/qcom.yaml is now a patch of its own
   instead of riding along with another binding (Conor asked for the
   split; checkpatch wants the same).

 - regulator binding: the paragraph that described which board supply
   comes from which LDO is gone from the binding description, it belongs
   to the board patch (Conor).  vsys-supply is added and at least one of
   vin7-supply and vsys-supply is now required, because both feed the
   internal control logic, which is powered from the higher of the two
   (Conor: "the higher of the two powers the internal control logic").
   The other inputs stay optional: they only feed LDOs, so an input may
   be left unconnected on a board that does not use those outputs, which
   the description now says.

 - driver: the enable register is written as a whole instead of doing a
   read-modify-write of SYS_EN plus one LDO bit.  The per-LDO bits can be
   preset by the firmware while SYS_EN is clear, so setting SYS_EN and
   the requested bit would switch the preset outputs on as well
   (sashiko, Medium).  The driver keeps the set of LDOs that consumers
   enabled and writes exactly those bits, so enabling one output cannot
   power another one.

 - The board DTS is split in two: a skeleton patch (compatible, chassis
   type, reserved GPIOs, board clocks) and the WL2868C regulators.  The
   rear sensor and its VCM are gone from this series together with the
   CCI controllers they hang off; they follow with the camera series
   that depends on the CCI nodes.  The board clocks stay: they are the
   XO, sleep and divided CXO clocks that sm8750.dtsi consumes, so every
   SM8750 board file has to provide them (Konrad asked why the board
   repeats what the binding example has; the binding example contains no
   clock, and these four are consumed by the SoC dtsi, as on
   sm8750-mtp.dts).

 - The VSYS input is described as a fixed regulator, as it is the
   always-on system rail.  VIN12, VIN34, VIN5 and VIN7 are fed by SPMI
   PMIC rails that this series does not describe yet, so they are left
   out and follow with the board series that adds those PMICs.

Verification, host-side only: every patch passes checkpatch.pl --strict
with 0 errors (the only two warnings are "MAINTAINERS need updating" for
the two new files, one of them being the driver's own entry added in
2/5); the series replays with plain git am on a pristine checkout of the
base commit, 5/5, and the result is the same tree as the branch it is
generated from; drivers/regulator/ builds with W=1 without warnings;
sm8750-lenovo-elden.dtb builds and dt-validate has nothing to report on
it; dt_binding_check passes for the new binding.

The regulators are still not exercised on hardware: the i2c10 probe, the
regulator registration and the LDO voltages come from our own downstream
board DTS, not from a measured boot of this series.

Qianhui Xu (5):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
  dt-bindings: arm: qcom: document the Lenovo Legion Y700 Gen4
  arm64: dts: qcom: sm8750-lenovo-elden: add the Lenovo Legion Y700 Gen4
  arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/regulator/willsemi,wl2868c.yaml  | 104 +++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 129 +++++++++++
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/wl2868c-regulator.c         | 212 ++++++++++++++++++
 8 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
 create mode 100644 drivers/regulator/wl2868c-regulator.c

-- 
2.53.0

