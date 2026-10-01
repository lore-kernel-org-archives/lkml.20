Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A6D39524D;
	Thu,  1 Oct 2026 07:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840680; cv=none; b=G34kVIRn1SYQKCyM0qf8opY+XG7EEhXfg56UXuqzVX/jWyeye7YqQAId2Ef9tB5FZcayhN0I/wDazCXI/fxQd3bWtbMOqsaelJjMMNm0qIhdS7MqmoJEZp86XGC25kusAP/G+8YW39+/hMopEssYI5X+36Xs+qprQNV1jrA1lbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840680; c=relaxed/simple;
	bh=fXGi1o1nI34EB0S7ghz+mW6OifApFd0H2fXkAvNNspU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IG21hNtkMZ2GUvlZfUy1Ja1B9jSJwwtCiX4R5YI5Qxd5nMNreacE9vGA+cdBdd3BpZ/SjkA4hJDizur6zbntkFv3CWagRSU+viHbTQ5IvDbB/nOmRaUy3UxjVLxCqVbVLqL38ZkjAABpXVDQCsxXW0rUSu2q+jqpLJ46m95suB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowAD3J0JPD75qjtLZCQ--.7172S2;
	Thu, 01 Oct 2026 15:44:18 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v2 0/4] riscv: dts: thead: Add Milk-V Meles support
Date: Thu, 01 Oct 2026 15:44:09 +0800
Message-Id: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkPvmoC/23MQQrCMBCF4auUWTslCbW2rryHdBEmEzugrWQkK
 CV3N3bt8n88vg2Uk7DCudkgcRaVdanhDg3Q7Jcbo4Ta4IzrzehGTBkffGdFdwzW2G4IZAjq/Zk
 4ynunrlPtWfS1ps8uZ/tb/yDZokGOMQTb+VPPw0WUvLaeWlpgKqV8ARBTv5SiAAAA
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
X-CM-TRANSID:zQCowAD3J0JPD75qjtLZCQ--.7172S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1UCry8GFW3try7WrWfKrg_yoW8XFWrpF
	48Ca1FkrZ7JrW7Kw4fZF17GF4fKF4fJFnruF15Gas5ZwsIyrWkZr93tw1rXF4DWF93Xr4F
	yFy7KF15CF1DtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBgkHDGq9rKmJkgABsM

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
Changes in v2:
- Group BeagleV Ahead and Milk-V Meles compatibles in a common TH1520
  enum, as requested by Krzysztof Kozlowski.
- Explicitly select the GPIO function for the Wi-Fi host-wake pin,
  as reported by Sashiko and confirmed by Drew Fustini.
- Add Drew Fustini's Reviewed-by tags to patches 2-4.
- Link to v1: https://lore.kernel.org/r/20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn

---
Han Gao (4):
      dt-bindings: riscv: thead: add Milk-V Meles
      riscv: dts: thead: add Milk-V Meles
      riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
      riscv: dts: thead: enable HDMI on Milk-V Meles

 Documentation/devicetree/bindings/riscv/thead.yaml |   6 +-
 arch/riscv/boot/dts/thead/Makefile                 |   1 +
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   | 346 +++++++++++++++++++++
 3 files changed, 351 insertions(+), 2 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260929-rv-meles-25d10148dc0c

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>

