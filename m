Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892892;
	b=EPGVfGPxEMFQbMdGdQsXqUWAA4uCoSUABS3dH0xvpVOXY44B7+4Kitrs8UCg7/TGQyu2
	 OEIT9n55jBeqn8cpHTR/In0LfhxQn04qefukHD1JA9DhWeVvUH8tnzKVJiETKrKSDycqD
	 dNptoCIp/tPkqlxazEIa3/fiDC7i30LEdYae2ULxP93nxN/sGjV7XAfEBgYLVGkM+dp2O
	 c0aoPZaO1pyOctExT3LodP4ZoYVOTW7po71SGX2KYFX+RthoBXm9PykWavGE16i+TQbbq
	 0lY6dSL4lyBrTNNGxYoxfo9TXgPi9cfxw8GZ+l6xyHnJnTeUC0iOhyDBPRivSVGOtFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892892;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Oap1bsEOTP6HJmx6qH4+a8BfGH+K0b0RENVgcyJfEgQ=;
	b=006re+9woYj2GJCRb8Pz4OG0nS6pZxMkeiW3pDD8mCuzTImMb2E8gj8bJRqvrGHF6wUg
	 rkfHtEw8vwNpv/SCl52Ns/d+NHyIMZrJ3f09e/aEOhoSFHqiQ7BYPToEG0F2K17E1WIDU
	 ICFE4JODDAGVTU7OtcpV/cf63UBEEx7BcPqzu/SHjaafijEO4cW7qxseNlzVTPHdTZVZ1
	 qJV48jdFD4mJD2UBP7e5LfKi58gUsTHv2LVmKugOUWAYbNZ0qaH5T3QTduooNjskm79nG
	 u5vxRsH+zTb+EE4OFZV7/b4W9Tg+GOKHidDatVYpS3ErZHuTRQLQFl3DO7AncsbRlQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qlC7YTOf;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C62F606A880;
	Tue, 17 Nov 2026 05:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C62F606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qlC7YTOf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=Oap1bsEOTP
	6HJmx6qH4+a8BfGH+K0b0RENVgcyJfEgQ=; b=qlC7YTOf6iZnbSH0ivyZU7yQ00
	uP7/HsDjObKlpRefpyNb8bWl+JcW3UcYLqj91yncNfUBA7/lW22aenJCnfCRALmn
	nxs/1o8M4wEOJlgzYLkCzGYB06R2MJteQHNNgqU4nY5hb1EaxVPcVpXSWWhZROtI
	7S+BY3nNBwyShad4w=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.190.181])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHCj9X5PtqqkLLAA--.229S2;
	Tue, 17 Nov 2026 13:21:27 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v12 0/2] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Tue, 17 Nov 2026 13:21:25 +0800
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
X-CM-TRANSID:3pYKCgCHCj9X5PtqqkLLAA--.229S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyUAF45Cr4DGw1UCF4kWFg_yoWrAFy8pF
	s8AFZ3Gr4ktry8KrsrtF1xJa4rZrn3JrW7C34kAF1UZan8Aa4Iqry3tr4ru3WUGrn7uF1a
	vFn0gr1kGF1kZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUgS__UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2r7WdojVwAcsj
Message-ID: <20261117052125._RNcj5G-MmllzMzVD2QiDvPpc_f2X38-G8yAO5c1mjg@z>

*** AI-assistance disclosure ***
This cover letter and the two patches below were prepared with the help
of an LLM coding assistant.  The author reviewed every line, ran every
gate quoted in this letter himself, and takes full responsibility for
the content.

This is v12 of the WL2868C binding+driver series.  Nothing in the code
or in the binding changed since v11: the only difference is that 1/2
carries Rob's Reviewed-by tag again, which v11 dropped on re-send.

What changed in v12
===================

Rob wrote on 2026-11-16 15:10 UTC, in reply to the v11 1/2
(<20261116151052.GA1449968-robh@kernel.org>):

> Missing my Reviewed-by tag. It's your responsibility to add tags when
> sending new versions.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

The tag is back in 1/2, ahead of the Signed-off-by.  Apart from that one
trailer line and the version in the Subject lines, this series is
byte-for-byte identical to the v11 postings; `diff` against v11 shows
only those lines and no hunk is touched.

What changed in v11 (unchanged here, kept for context)
=====================================================

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

Gates (unchanged since v11)
==========================

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

