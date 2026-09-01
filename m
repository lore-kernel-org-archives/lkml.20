Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BCA49CF56;
	Tue,  1 Sep 2026 18:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288257; cv=none; b=soarUjjBQVN+2T42oc24jtwRu+es08pPisf92aDNpCnfCiicbIx+hu0Dz/UiyWIuyAj+JMCqHEE023Y/b1fTexvA7qCwQ2kuNFCl7Jv6nUIoewvFGRlHw+i/cv3/rv2Fr8/xkFOaOvvEGFJo3xr0IcyXNeUJ7E+JV9GyIgUOci8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288257; c=relaxed/simple;
	bh=xk6PRnRgACW3GTRlBqh9u6XpLM+tqeF1Tp0sPa/NhVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kRSVODxS0caAjiOueQte7AQZuXrzmG8DJ19lx07xQDC0jlzcGldra/6lfESA/Dh8mmzriQq+IVTseyoKnyC6Z/hznVDVPFc58Cvjb1IYvyLY3b06ovQbi9RUj3+ycClx9diaV54wYZGi3WUidw7weXAZLY5q2J0+3lQhHQKhOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-03 (Coremail) with SMTP id rQCowADHzz3jHJdq01y6Bg--.19179S2;
	Wed, 02 Sep 2026 02:43:55 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Wed, 02 Sep 2026 02:43:40 +0800
Subject: [PATCH] riscv: dts: sophgo: sg2044: srd3: add spifmc node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-sg2044-dts-v1-1-aa1fd1a4ec0d@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIANwcl2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMj3eJ0IwMTE92UkmJdY8s0A8O01ERjMwMLJaCGgqLUtMwKsGHRsbW
 1AOJ6wUpcAAAA
X-Change-ID: 20260902-sg2044-dts-39f01fea3608
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Hangfan Li <lihangfan@iscas.ac.cn>, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:rQCowADHzz3jHJdq01y6Bg--.19179S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF17ZFy8Ar13KFWDZFW5ZFb_yoW8Gr1Up3
	W3CrW3Ga4rtrn7tanIqry0gF43JF95Ga4Ikr13Cw48Xan2qFyDG390ywn3JrnrXF45X3yr
	Gr17XFyruFsIvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRIRDGqWi1k0UwABsO

From: Hangfan Li <lihangfan@iscas.ac.cn>

The SRD3-10 board has two spiflash.

Signed-off-by: Hangfan Li <lihangfan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index fed3d9a384a00ccfc91dfa1531f799aa397a5dde..e0cd939e742ec349c8b7516c4924d94b9e763b53 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -109,6 +109,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <133000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <133000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	/* for firmware */
 	status = "reserved";

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260902-sg2044-dts-39f01fea3608

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>

