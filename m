Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793429741;
	b=DpQN6MIk9+esMN2uw8+0yQXnwGnWWgqnsWT+mmBxJ2EcpmSn3PZRcWS7/jC3hPUr8aMw
	 TC9rhoPNrAueFte3iUjrQmmOhq+/CHVwS+5vaVoQtBhBnsPJdV7jgcFSa2H6A2WTXXlRh
	 q24Whuvsc+o1k2zLGsYqhcl2CW+kksmfuEPKXybO6Vb7ky/C+vt57biQkgenKbuuwUrct
	 EgwyrgX1hId0uPW10T/HN8vkLXHD87/uxObl1Xq4Q6MV86X0yRjsp1Wu3UQU+bKdlbnXY
	 DMgaO457EA5ZYntUEgok8p0X5lKgjdMhsdEvhrah/A2DFNx7Z+ElKBQhKe3VsU0V08g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793429741;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=JhdFgfl/oZNUnw8d/iRMP+ItzhYUKplnCXU9iJhm6t0=;
	b=tS1IvJOxyJXDyN5gnE0JNZxAQH43rNZCf8cJioNk3Jyz3/9Hf7lzRXSA8S1LEuTnQRGM
	 gn6pio4o2n3P28iABBeyR8X+KwHxSeuToHl2uX5zGCrARAx5rRoDbsQYC9WOMWc7g/1vW
	 tTY1j+STwvCbYhTrkwuXbBJAZZWbn+ZcWZ3DtWV2Bk7O4Eo2G00t1UiHkDKMhvm+a40li
	 5ApfteKP8Tw632vnF5YhT5OfvOvdxzLg7oV8JPRURQtKOlkomfeqO8ehKJmwTmrRVhifu
	 Rqf+78CR72X8NaaafMj/SkoebV794nSEP6M2OY4ErhowYusz7tbQaOtqFd1zfry3oAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=bWbQBr+J;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14039606A31C;
	Sat, 31 Oct 2026 06:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14039606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=bWbQBr+J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=JhdFgfl/oZNUnw8d/iRMP+ItzhYUKplnCX
	U9iJhm6t0=; b=bWbQBr+Jo4u+aCnhoV6Zy3n8p1Ho+PFu/bJvunX9ZKbrb063we
	UauqQjfkkESyGPC42/oA60lNbofgKMUizP9MRIcf9fPLV27hpDPWOVdz8FwvVxNj
	LLkEDe81FHwAxo6WBRhiQwFvod+ZlRPjUFoNhDISVAu8sRbXmDrYwcEYk=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCH_THmkOVqQXFtAA--.295S2;
	Sat, 31 Oct 2026 14:55:34 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Sat, 31 Oct 2026 14:55:30 +0800
Message-ID: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCH_THmkOVqQXFtAA--.295S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1DWr18GFyUtry8tF4ktFb_yoW5ZFWrpF
	sxZFsxKr4kKFWxKr4fG34Iq3WfZFs5JFWkCry7XrWxAw43Zas7tr9akr45Ca48Gr4kG3Wx
	tF9rur1xCF1kZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUy-eoDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwA5s7

The WL2868C is the camera PMIC on the Lenovo Legion Tab (TB322FC,
SM8750); its seven LDOs feed the rear camera, the front camera and the
VCM on i2c10.

v3 was reviewed by sashiko and Krzysztof; what changed, point by point:

 - i2c10 was enabled while its parents were not, so the bus could never
   populate and none of the regulators it hosts could have registered.
   The board DTS now enables qupv3_2 and gpi_dma2 alongside i2c10
   (sashiko, High).

 - The binding schema, the SoC dtsi and the board DTS were mixed in the
   board patch. The series is now one binding patch (including the
   arm/qcom.yaml registration), one driver patch, one sm8750.dtsi patch
   and one board DTS patch (sashiko, Low; checkpatch flagged the same
   thing).

 - The sm8750.dtsi patch now leaves both I2C buses of each CCI
   controller available instead of disabling bus 1, as sm8550.dtsi and
   sm8650.dtsi do, and carries the bus 1 pinctrl states on gpio115/116
   and gpio119/120 (sashiko, Low).

 - The CCI nodes moved after videocc@aaf0000 into unit-address order,
   and the new pinctrl states sit alphabetically inside &tlmm (sashiko,
   Low).

 - The commit message now says that the SoC has three CCI controllers
   of which two are described, instead of "the two CCI I2C
   controllers" (sashiko, Low).

 - The front galaxycore,gc08a8 node is dropped: it has no binding at
   all, unlike samsung,s5kjns and giantec,gt9764, whose bindings were
   posted separately and are still in review. LDO2 and LDO3 stay wired
   in the board file for when that series lands. The sensor nodes also
   lost their power-domains property: the TITAN_TOP GDSC belongs to the
   camera controller that owns the CCI bus, not to an I2C sensor, which
   is powered through its supplies and its reset GPIO (sashiko,
   Medium). The rear sensor gained its CSI-2 endpoint; the
   remote-endpoint side arrives with the camera subsystem series.

Everything above is host-side only. The i2c10 probe and the runtime
existence of the regulators are still unverified on hardware; the
on-board evidence reported earlier (i2c-10 present, camera_ldo1..5,7
registered, LDO6 without consumer) comes from our own downstream board
DTS, not from the files in this series.


Qianhui Xu (4):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
  arm64: dts: qcom: sm8750: describe two of the three CCI I2C
    controllers
  arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/regulator/willsemi,wl2868c.yaml  |  79 ++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 175 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 158 ++++++++++++++++
 drivers/regulator/Kconfig                     |  11 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/wl2868c-regulator.c         | 155 ++++++++++++++++
 9 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
 create mode 100644 drivers/regulator/wl2868c-regulator.c

-- 
2.53.0

