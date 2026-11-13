Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557963;
	b=UBsuBxcPrp9GavMNvUZwR2d8Iu3IVX89hbU9CmzJS7aK8nhbKUOUaeDNKCrkto99d/3+
	 rGwTFZIOd9nDgZekqCAIOZZzFz5pl5PomCjdo21Dy35e4agnsNjqLouyvrAjnY4XjC55g
	 qlvDayqjw5dMS8RqjzEjcQsg0qx/Gro7Z0SrPNB6njxAvSEiOCPW2i5KAvTkzz7joVOVk
	 udf/tfoU/xcF4aM4g3mQTCkzDzkyKvMQcZdmp+kTDHe7yOm53XdISIQ7/7Vpn31zxR9FE
	 RljwKHEHaeJlvXrNbdzOB3KsDi6/L2SD2oliv7amGCyyGL2ywP5BYibGiABncslKwyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557963;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=5BxipZIRI/QUeWboqgmOWLXtvdEMQ00UKulK7sI3VHA=;
	b=eVlBEB13XelgQcwwKGmyByWY8B73eyHrR99409MsN5LyG7ISgnER5tLetSih+PGb2Iva
	 GtA1iYDNssoOazDs1NnXaLzUhEPyYDZ87aFp05R6qxyvdLPuYeiGG2xsHxm+nzE6NGeFF
	 QgkW57CHZGJeX2oKr3a/g/AltjZe5xWNEG+wC92TpTjqbh4uxUGDJA2zl+sZ1xoeW+wq0
	 K1fUi5D67N/omxgcd6EHqHCob9wa3qGDpTDzAGs4lCftNP7R3fHtc9a3O3PmQsvj0ed4v
	 J8xvzZeOLq+qKZ13KwCjpDfH87z5JdB+7xSFFyHNUEi/8SX5SgpQoKwubPQQDIk3J1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=JGJ8zC2R;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CB9606A31C;
	Fri, 13 Nov 2026 08:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=JGJ8zC2R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=5BxipZIRI/
	QUeWboqgmOWLXtvdEMQ00UKulK7sI3VHA=; b=JGJ8zC2R8N04jyt6z6gqsXNiNM
	9GdUaYGOl5VA3DcaLXCBEK6aFIF0v/jX+jpI47jA0Z4ePXEm5pmwk7PagsTH2zlA
	CIsvH+JTrptJKpeGUMZqgmuEUo4JHnNdXEyrZHBU1nXMeP26b+B4rdTQQbarDX4D
	2csPkEHZbbDijqXyk=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBX1DgCyPZqlSK4AA--.7571S2;
	Fri, 13 Nov 2026 16:19:15 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v11 0/2] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Fri, 13 Nov 2026 16:19:12 +0800
Message-ID: <cover.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBX1DgCyPZqlSK4AA--.7571S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4DKw43Zr1UAFWktryrWFg_yoW5Kry8pF
	s8ArZ3Cr4kKry8KrsFyF1Iqa4rZrn3ArZxC3s7A3W8Zan8Aa4Iqryftw45uFyUGrn7ZF1a
	vF98WF1kCF18Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgcTQUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2r0wlk29gAdsG

*** AI-assistance disclosure ***
This cover letter and the two patches below were prepared with the help
of an LLM coding assistant.  The author reviewed every line, ran every
gate quoted in this letter himself, and takes full responsibility for
the content.

This is v11 of the WL2868C binding+driver series.  It supersedes v10
(<20261111111132.1296892-1-xiaqinghuan@mail.ustc.edu.cn>) and differs
from it in one place only: the LDOx_SEQ handling Mark asked about.

What changed in v11
===================

Mark Brown asked on v10 2/2
(<20261111111132.1296892-3-xiaqinghuan@mail.ustc.edu.cn>):

> Should the driver not also override the LDOx_SEQ registers to make sure
> we have software control of them, or hide the enable/disable ops if
> they're non-zero?

Taken the first way: the four slot registers are cleared in probe.

The datasheet (WL2868C, Will Semiconductor, Rev 1.4, April 2022,
"0x0A, 0x0B, 0x0C and 0x0D: LDOx_SEQ", p.35) defines LDOx_SEQ[3:0] as
the power-up sequencer slot of each output:

  - 0000, the reset value: the output is controlled by its LDOx_EN bit
    in 0x0E;
  - x001..x111: the output is controlled by the sequencer, which brings
    the LDO up once SEQ_ON in 0x0F is set and SEQ_COUNT[2:0] reaches
    the slot; writes to the LDOx_EN bit have no effect on it.

So a non-zero slot silently defeats enable()/disable(): the register
write succeeds, is_enabled() reports the LDOx_EN bit, and the output
still follows the sequencer.  The binding describes no sequencing at
all, so clearing the slots and keeping 0x0E as the only control path is
the way to make the enable ops truthful.  The other option, hiding
enable/disable when a slot is non-zero, would leave the outputs
uncontrollable on exactly the boards where software needs them.

Measured on the reference board (Lenovo Legion Y700 Gen4, SM8750;
Linux 7.3.1, driver bound, read-only through regmap debugfs):
0x0a..0x0d = 00 00 00 00, 0x0e = 0x80, 0x0f = 0x00.  The firmware left
every slot at its reset value and the sequencer disabled, so the clear
is a no-op on this board today; it is there so that a board whose
firmware does program the slots does not end up with silently
uncontrolled outputs.  Clearing a non-zero slot switches off the outputs
it had turned on; at probe time no consumer is up yet, and the core
re-enables whatever it needs through the enable register.

Everything else is unchanged from v10, so the v10 changelog (sashiko's
three Medium findings and the two Low binding points) still applies as
written.

Gates for v11
=============

- git am of the two patches onto pristine v7.2 (25f7927e6ccb) leaves no
  local changes after the series.
- checkpatch --strict on the driver change: 0 errors, 0 warnings,
  0 checks.
- W=1 build of drivers/regulator/wl2868c-regulator.o with
  REGULATOR_WL2868C=y and its dependencies: rc=0, no warnings.
- dt_binding_check: unchanged and passing; the binding is not touched
  in v11.


Qianhui Xu (2):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

 .../bindings/regulator/willsemi,wl2868c.yaml  |  99 ++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/wl2868c-regulator.c         | 301 ++++++++++++++++++
 5 files changed, 419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
 create mode 100644 drivers/regulator/wl2868c-regulator.c

-- 
2.53.0

