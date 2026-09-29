Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012D25038EE;
	Tue, 29 Sep 2026 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677422; cv=none; b=VM3ieZC5clz2Y4Vrjs0DcRQxZM+rqULfZYWWXoSfuWsYCjr7orwnCTNKN8ma7rfU4omb5sdkPHORaZJ7s1PYoW4q0EislrRCUwhWgFWxnaWK2o9teQ+AHZQMArKPAzLVmJaDvFR06Ris8i0DOQxyoXedoDMGdVd8rpIDBwIu3kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677422; c=relaxed/simple;
	bh=CPnBeN8WaLD4zBx8ivg4DHzdruR+2YXNRWlDyh95cQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAO5GgYysymfY3idRM+419uhnoyF1Rss8KLDC0F9RPJZB9w7XJih9GvjKJXcCcbMF+E/MG/Fo6OdVcl9Tl0s0TKU9DusLMuhQ2tkCdeSP5pgDEjFfbSpuZiHJ5EUZ9ZwMeT2n9/hs+JGV7/p2UYiNUxJ0dldXYlNrVAxGgg+BD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAD3kPR2kbtqxsxdCQ--.22338S6;
	Tue, 29 Sep 2026 18:23:19 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Tue, 29 Sep 2026 18:22:48 +0800
Subject: [PATCH 4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rv-meles-v1-4-effdd14a76e8@iscas.ac.cn>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
In-Reply-To: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAD3kPR2kbtqxsxdCQ--.22338S6
X-Coremail-Antispam: 1UD129KBjvJXoW7CF17Zw45AFW7Ar1kKF1rJFb_yoW8Xr45pa
	n3Cr4FkF9akr4fGrnIyrWjgrn8KFZ5uF9Iyr13W34UCFsrX395A34rJrySgFWDJay3Xw4S
	yr4kAw1UWw1Dtw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAIFDGq7jI8QYAAAsl

Enable the DC8200 display controller and DW-HDMI transmitter. Connect
the transmitter to the board Type-A HDMI connector with reciprocal graph
endpoints.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
index 92b44cb90f57f4830efd29145744c005afa73119..47b1ce4316468ff94b161cbf56e634040fd03306 100644
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

