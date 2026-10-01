Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3323B1ED7;
	Thu,  1 Oct 2026 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840682; cv=none; b=FybvlHihXStw+K+tzaiwoDHf3t8gOxf7YrFc2N8ArSoj1L2n/clb8jGMcEB/2sCcMPDt9Xb4LbJgv0n0TFvZQnHEnvICHEVaoEiEEy443c54dqMohNvIiBoyCDV5WvY+16eV1p9kVUaswvEuhlwj/rHU8y2DrmqJIxbfQsA7Ti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840682; c=relaxed/simple;
	bh=mNTij5OYs2fRfuVHGu8NBFyvsMTOkChZu+WzbF0hDa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvhwFoJjwR/CudyWuAwyiY7Dwal4kfPeyCvB1ah4mGFsP7Sg24BSNhjq2M4VDv/vFUVffY7gK4b+EniCW0grdjwIF2p8xj8UdO83UmgbO6iUGrsyvTmbkpb925F5Y6Q+Dr/sG+fvHufwVhN6tdujlS2khKVY3SR98WVtcjdGfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowAD3J0JPD75qjtLZCQ--.7172S6;
	Thu, 01 Oct 2026 15:44:20 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 01 Oct 2026 15:44:13 +0800
Subject: [PATCH v2 4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-rv-meles-v2-4-c61052262f84@iscas.ac.cn>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAD3J0JPD75qjtLZCQ--.7172S6
X-Coremail-Antispam: 1UD129KBjvJXoW7CF17Zw45AF4kZFWfKF4kZwb_yoW8XF4xpa
	n3Cr4FvFykGr43GwnIyF4jgF15KFn5ZF9xtr13G34UCanrX3ykA34rJrySgF4UJay5Xw4F
	yrs5Aw1UWw1Utw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsG
	vfC2KfnxnUUI43ZEXa7VUbPC7UUUUUU==
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAMHDGq9sMO43wAAsH

Enable the DC8200 display controller and DW-HDMI transmitter. Connect
the transmitter to the board Type-A HDMI connector with reciprocal graph
endpoints.

Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
index bb1be377569063b0f6d6864c8d18d37103c2c7a6..1c9de6b37a3e6f7a4ec34fdfa584332c7ab3fc59 100644
--- a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
+++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
@@ -38,6 +38,17 @@ wifi_32k: clock-wifi-32k {
 		/* The module LPO input is supplied by PMIC_32K_OUT. */
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x2 0x0>;
@@ -83,6 +94,10 @@ &aogpio {
 			  "AOGPIO_8", "", "AOGPIO_10", "AOGPIO_11";
 };
 
+&dpu {
+	status = "okay";
+};
+
 &emmc {
 	bus-width = <8>;
 	max-frequency = <52000000>;
@@ -133,6 +148,16 @@ &gpio3 {
 	gpio-line-names = "GPIO3_0", "GPIO3_1", "GPIO3_2", "GPIO3_3";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out_port {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mdio0 {
 	phy0: ethernet-phy@1 {
 		reg = <1>;

-- 
2.47.3

