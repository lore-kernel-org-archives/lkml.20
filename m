Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE8503BE0;
	Tue, 29 Sep 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677422; cv=none; b=EwRKhbW9V2oC5/JSP11KJrE5teA4yjlA74HJfPTZGPiVI4VrEkm7S+GuMcM6ot0AHUmE/ZdLOsgeQZt0GKYGCzWrS7sGlQ/2fEahPCR+ioUDf8We1t0IMqLnH8YbOq5b2DFNe2U9MFyh3hqwVst72lucRs1+W3r+oIEwMtfwd+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677422; c=relaxed/simple;
	bh=51dxTRdtG6dyUypmrqAKcFvC3IzAvYaT+xAx/OoKkS4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=igC2M2gEBLxKaJ/qsgMuvX1gtQlSSwkkFiElqC/x9NUC6a3B0upg+ce7j78whJbG2qIurfYDfUH0BxStcWAK2R3wPSnfrYNgA+gJ+05FAS4wnNTV4rWhoRjVNXmY7nmaT4UtpU6vo+lP6c0kTsaUDVmAC/E2r91j8c8hweRkyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAD3kPR2kbtqxsxdCQ--.22338S2;
	Tue, 29 Sep 2026 18:23:17 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 0/4] riscv: dts: thead: Add Milk-V Meles support
Date: Tue, 29 Sep 2026 18:22:44 +0800
Message-Id: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSRu2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3aIy3dzUnNRiXSPTFEMDQxOLlGSDZCWg8oKi1LTMCrBR0bG1tQB
 xEVDcWgAAAA==
X-Change-ID: 20260929-rv-meles-25d10148dc0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:qwCowAD3kPR2kbtqxsxdCQ--.22338S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF43Kw48Xr4UZryUCFy8Krg_yoWkGwcEkF
	s2krZ7ua1UGFykKFW7Ar18CFWkuFW7A3Z3AF10v3yakasruw43Wa9rt34Ykr18Zay5Kr9x
	Zw1kXryxJw4q9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBgcFDGq7hl0qMQAAsZ

Milk-V Meles is a single-board computer powered by T-HEAD's TH1520
SoC with four C910 RISC-V cores. Add the board compatible and device
tree for the Milk-V Meles.

Enable UART0, eMMC, microSD, Gigabit Ethernet and the PWM fan, and
name the GPIO lines exposed on the 40-pin header. Add AP6256 Wi-Fi
support over SDIO and enable HDMI output through the DC8200 display
controller and DW-HDMI transmitter.

Board details:
https://milkv.io/docs/meles/overview

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (4):
      dt-bindings: riscv: thead: add Milk-V Meles
      riscv: dts: thead: add Milk-V Meles
      riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
      riscv: dts: thead: enable HDMI on Milk-V Meles

 Documentation/devicetree/bindings/riscv/thead.yaml |   4 +
 arch/riscv/boot/dts/thead/Makefile                 |   1 +
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   | 345 +++++++++++++++++++++
 3 files changed, 350 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260929-rv-meles-25d10148dc0c

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>

