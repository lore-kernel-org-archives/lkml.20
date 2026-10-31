Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418186;
	b=Mm3DpNGgH9QmaKtxDJFCGLfcEHdYMk9dsbPRE89JU2MvUC/0eml3l3fDHgGvZlIiVzf5
	 NKBNZt4ZAz/Mqu9R6jWrhmIzvjGuOcCGH46MVW/u6WK98c26iCvGvJ/Y3BJ5vbD/uMoyy
	 j9yMuGFqFIw02xQbknjdXG4HQts5g3S/LTDqIaf9vhOo4TRyiNQPV5jwQeb0QGdYi4wI5
	 hbSOzrOGDGOY/BAxGP5Xt5TtVpZ0jFT0mgWNIJ4T3ce4oylql5Ni25NUpuO1kKZukvzTE
	 fPBC50TPAq7cehxw/uGdJnUkmOtlf3PQHzB0suMfwK0tc4K1BLcTWb56LhQs1IxDpWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418186;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=K3nYHqy/UrBaeHCdIvsFQrRPke2Rvq8/nr+0ZyK4ENI=;
	b=YLrkWXEptR+925SOx5QjWFbkAUP5wRSJWjtrBZV9v8Fv8/k6Dt/5w2VfA7bl3eGHWKBk
	 usTiO/OdG0F16xNePOkpnR1uLTBf721/hiZRYYUgJHOwlLSI5tXTVtZDjePCh0X/TVx8X
	 9lzXDoeYNArAh9Vm5L4VwrU0wRPb262vHfQ4uiGHP4gCSXiD+t+JD7JVKfuRgj1ulbATE
	 t/nHoIeS8gQlHCrearSn+fiXdPuIAaBYsgUPAK+V1tpRXfl1qAjEGg07ZId3I+XrqcRSp
	 Br0huWUdJ7fvLZ7YQnGjmn/Oj+TLiTpTiP8Xk9oJdFUuKNyzv63oUJpVcVqGP97rKJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="aBlI/D2g";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74FD606A31C;
	Sat, 31 Oct 2026 03:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=aBlI/D2g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=K3nYHqy/UrBaeHCdIvsFQrRPke2Rvq8/nr
	+0ZyK4ENI=; b=aBlI/D2gTATgZ0YSBfaUhCGJ5tY3BYuYGIas9Zh6+SFLM6fBHn
	AScak2ozqSjQshkSfS+wGUw43FRHbVDS5ClpWrvVNd7ehE0TtT/jd3+8/0j8EGCz
	t0EONJeznESgSYeixGrdYJX+i3tPnetVujMkZ7L+3nfq8OfQSbbnraPAQ=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXjjLEY+VqGO1sAA--.76S2;
	Sat, 31 Oct 2026 11:43:00 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] regulator: add the WL2868C camera PMIC and its users
Date: Sat, 31 Oct 2026 11:42:57 +0800
Message-ID: <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXjjLEY+VqGO1sAA--.76S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF15CrykArWruFW7WF4kJFb_yoW8ury3pF
	4DuFZxCr4kKFyIqrWSyw1I93Wfu3WrJayjkr9rt34UZ3W5ZFyxtrsxtw15CF18Jr18J3WI
	9F1q9F18GF1vvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07bYEfrUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAcse

regulator: add the WL2868C camera PMIC and its users

Hi all,

this series adds a driver for the WL2868C camera PMIC found on the Lenovo
Legion Tab (TB322FC / "elden", SM8750).  The chip is an I2C regulator with
seven LDOs; on this board eight supplies are wired to the camera stack
(S5KJNS sensor, GC08A8 sensor, GT9764 VCM, and the CSIPHY rails).

Changes since v2:
 - Bind the board clocks the camera regulator nodes depend on.  The board
   DTS now defines xo_board, sleep_clk and the two CXO/2 fixed-factor
   clocks by reusing the existing definitions from sm8750-mtp.dts, so the
   DTB links cleanly instead of failing with 15 phandle errors.
 - Register the board compatible in arm/qcom.yaml.
 - Fix the reset description in the driver commit message: the GPIO is
   released (active-low) during probe and asserted on unbind, which is what
   GPIOD_OUT_LOW plus the devm action actually do.

The binding and driver are unchanged in behaviour since v2 apart from
the commit message correction.  The camera sensor and lens bindings the
board DTS also references are not part of this series; they are being
submitted separately.


Qianhui Xu (3):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
  arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/regulator/willsemi,wl2868c.yaml  |  79 +++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 202 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 112 ++++++++++
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/wl2868c-regulator.c         | 155 ++++++++++++++
 9 files changed, 569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
 create mode 100644 drivers/regulator/wl2868c-regulator.c

-- 
2.53.0

