Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794016222;
	b=H+hHLic6ntl1d17jekdM6JzK4Dz6f1cVtqnmxMz+lHe5+HSc6WHZj9Mz7RHJFRKQjtyJ
	 O5S3wN+PUIWoGFitUwM3gCWEmjPkS1OeOZuN1+xd22IKlkvZRz6T3Y4aoMpEq6BX5XSVd
	 nw3iPGT869hYRcZoEBwsnyp3RASz/Avty678f8kFCUopf4g3ePwIIaWIlDydTkRVz0Z0n
	 6YqUztu4As/FjcH7UjDaE/VCo2EQRDtA6vuiltjogt57bFepVPAHe5x4NHcDgaMafPkho
	 jGe4jHMeQo/RsDnLsmA2wv8tMZb38c7XBQhnFPvvJkLFmxbjyqthM7XnOVhKnl1o5Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016222;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=i8NZ3eK9vnkA7bDd4ZMgWFJPK7A5LqJVOCB5UrZARFE=;
	b=pnKNIIGp61XGIbNsZAnsLokSrm5ACmDXEONu3ier3DU7VOJEgfEKrhScz9MwtQP/9rJD
	 YeF8hhuVj5GQYPKVwb4ndlVzQbDlWIBpghyBnF/mn2Mu7+ePmxlVLgZvX7z6hyWYZv0Hw
	 EZt++lYsELScxyUM+y+FUuj4Jgs6LbXatxL6MoBChaybLEBEho356+l6xaqlCycfrcLCq
	 mVePhTJCN8mDU/OsbloQGLCuSMsosXb99Rk82cwCcJGxZWGuJ5mrjGFO79T7FEP5Jwzpn
	 v9UJ2tIsgjKc1YkzyT5foZ9ybTfo7kyux2BsYy/t0lAfOntmPwPg7YfnBSf0WiJWtpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="sRO/wa6v";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF11606A333;
	Sat,  7 Nov 2026 01:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF11606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=sRO/wa6v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=i8NZ3eK9vnkA7bDd4ZMgWFJPK7A5LqJVOC
	B5UrZARFE=; b=sRO/wa6vHPijcv3p6zelJmFvS87oOtb8M7DL/niMzAthFBBkw8
	pSE2ge7eFwq435AoSVQDeWU2++Uorwx9mu4V/Zm7JM8eC5reI/V+49hcqKIrUTQ3
	86LbO6YC4eoLY9FigWo4vrfHAvyy5Qx9t8e5Ms+f4EhrI7yQn1OJ3937M=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.197])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnlyvWg+5quEKSAA--.1389S2;
	Sat, 07 Nov 2026 09:50:14 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 0/2] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Sat,  7 Nov 2026 09:50:12 +0800
Message-ID: <20261107015014.22374-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAnlyvWg+5quEKSAA--.1389S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4DKw1DWw1kWw1rAF1kZrb_yoW5CF18pF
	Z8AF93Jw48Gry7Xr4fJw48tr15Wr18Jry5Jr1xAr15Zw15GF1fXr1ayr15AF15Gr1kCr17
	tF98ur1xGF1UZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeE_NUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2ruKtgCVAAzsH

*** AI-assistance disclosure ***
This cover letter and the two patches below were prepared with the help of
an LLM coding assistant.  The author reviewed every line, ran every gate
quoted in this letter himself, and takes full responsibility for the
content.

This is v9 of the WL2868C binding+driver series.  It supersedes v8
(<20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>).

What changed in v9
==================

v9 is v8 plus the two binding points Rob Herring raised on v6 1/5
(<20261106141036.GA2921668-robh@kernel.org>).  Only 1/2 changes; 2/2 (the
driver) is byte-identical to v8.

1. Multi-paragraph descriptions now use the folded block scalar:

   -  description:
   +  description: >
   ...same for vin7-supply and vsys-supply, the other two properties whose
   description spans more than one paragraph.

2. The example no longer defines a supply provider.  The
   "vsys_reg: regulator-vsys" node (compatible = "regulator-fixed") is
   gone; the consumer keeps "vsys-supply = <&vreg_vsys>", which is the
   same shape other regulator bindings in the tree use
   (e.g. docs: microchip,mcp16502.yaml, ti,tps65132.yaml).

About the pw-bot "changes-requested" on v8 1/2
==============================================

Conor Dooley's bot marked v8 1/2 changes-requested
(<20261106-lucrative-sadden-741ffe6c43e9@spud>) with the note that Rob's
v6 feedback was ignored.  It was not ignored, it was overtaken: v8 was
sent at 11:42Z on 2026-11-06, Rob's reply arrived at 14:10Z, i.e. 28
minutes later.  v9 fixes exactly those two points.  No other v8 content
was touched, so every review tag already given to v8 2/2 still applies.

Krzysztof's two v6 points stay addressed the way v8 did it
==========================================================

- "One logical action, one commit" (5/5): the board enablement is not part
  of this series at all; it is held back (patches/held-back in the author's
  tree).
- 3/5 compatible/commit-message wording: moot, that patch is not here.

Gates run on v9 (on top of v7.4-rc2 line, master d48723711b)
====================================

  make DT_SCHEMA_FILES=Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml dt_binding_check
    -> rc=0, no output (schema and example both validate)
  scripts/checkpatch.pl --strict --no-tree v9-0001*.patch  -> 0 errors, 0 warnings, 0 checks
  scripts/checkpatch.pl --strict --no-tree v9-0002*.patch  -> 0 errors, 1 warning
       (the warning is "does MAINTAINERS need updating?", which 1/2 does)

Qianhui Xu (2):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

 .../devicetree/bindings/regulator/willsemi,wl2868c.yaml   | 98 ++++++++++++++++++++
 MAINTAINERS                                                |  7 ++
 drivers/regulator/Kconfig                                  | 10 ++
 drivers/regulator/Makefile                                 |  1 +
 drivers/regulator/wl2868c-regulator.c                      | 262 ++++++++++++++++++++++++++++++++++++
 5 files changed, ...

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

