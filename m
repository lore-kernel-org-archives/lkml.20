Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695093;
	b=ked8jHa1f4hdv3Spu2TbqQ2VzPFdyq7CDi5hpxhFkxf2z6G77JRVdV/B5LyVOlXv0s6W
	 poEvIWClXK0pwvQhT2uOFH7R1c8sfWl6QYsnwvmLZAI3RUxVLfM63HGvDOay+/Ys2ZAPY
	 jCHOIV/V170medQR+XEipwxQybz+za5otaoo1JSkjPZixpV9yYec9vNdm49FfiNyxAAJC
	 JqFhGYMEYLMsgex4Dh6ch9742d2wBvNwuOKKLd1MC+c7WqTLFUvUleUhIu64uLX32Rcff
	 4qjGTtvDOKyrQswdx0VZ1ozQSWnJCO/ioRcHQu2PkIYSetYO8i75gpkvsapPQcz6RRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695093;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	b=0j7Q+IAD1SbU3yvcfQl/JmX8yeGhK15k9QZN8ES2m/Ji4HE2CTnsTXhFhum93/f2QrBz
	 3dnVmwF/9KVSiOqAWej5MOeBvms3UC9d7xrFWKdmLHdN/wwMZdVPu5ucX8arpK9hr+k5O
	 F4dHxs88nB7QrnQd4B0CEcssd0Uus1gJrihEyKax+Ir8OnG3doY7brzg2dXcaxooul4Hm
	 rdlEr2NvPSAJ5zhj3OZ8gYwK670XXshR9C8d98UUQU2fe0+ti1OUkffAb5gXW7lzH2bEh
	 kavTfOPf1TqR4xcqO7kZBIp92117a46btRs4xpT8o7yxu+3EasOWxEypdile9rTqJ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=EcLo26a3;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C2606B6D1;
	Tue,  3 Nov 2026 08:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865C2606B6D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=EcLo26a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695034;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=EcLo26a3AGIS9XZNSijAaKMHz00dPQ/WvTDDzwSX9id3eZ4dshhzDOiY1QM6IuLBg
	 BdBY7z8zU5i9Y5H9tB2Ab7e4tLqn4/xypEHVLmMTjGSbaH0eCYveFahlJOcnJHo9Gg
	 hquJj672weI3fKVME7SxRRHrWdyGrGJs49j2rxds=
X-QQ-mid: esmtpgz12t1793695033tdc4d96fb
X-QQ-Originating-IP: JcdVJio/hJmTz6vZxxa3J3Rp1TnfThoafdDs7/0vr9o=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:37:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8282491870121424289
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 03 Nov 2026 08:36:48 +0000
Subject: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=MskIDgqPGeV/8XRXVLyf9Iga/gwF4QUehWI17LXRw8Y=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5yrnru7ZKtn7onXL9yWxG9MvyClvTH93QWlpWOpF4
 7xTl5V3dJSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAExEVZzhv0vekUhWF/cDDrxR
 pVOqWQ8HlGlVZ/Jsiz1gtfW+YfhpMYa/IoKTVOcGz9JyXvg4a2+4gGt8kbb+7mr9U3eX2zz+vms
 ODwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8BaT0GEeXPx/NNhnjzhsl8/Fiox/cTCavMobl6pYUcejSbd3fePUASI
	HpSumTidgvvd+N/rl1aeQyxWmCyulCDBWWgCQGsAj9TMbXh6tiAwAGy9OuqpRNXaN9njka5
	hSLCWkevuJsy5mEE0i+tScdDAQQnCvAvAGUYZKiGVk1H+iAFIQ2NR/WbO2brfm42tk9EsKM
	xEdfZu4iPbKoBGoSmyRdCE5mSZN7paP/K/CgRRejiaPBWzoGjzdXdaDIk/L17AvmrzwVt8e
	Rtzt/qosckBk/lN086VqbY9mJumxm3N9BoyArJ6oI0O2cGetNyzLlarY1Nxr60a611KosoU
	teWSH5UXUMyr38D/c6JTA6EDLIdepSasCQiAO1ahQPkh+rsRGOqbBQiXxXfKfVxzPm12G6U
	/gzLpQmonTIGJ5kXctYmbfXuIXm8heTkscjnF551I6EhlAXwBbrfp6OgULlYlqbCxtLFlpj
	jDfwU4N7QNY6h/AUp9FzoeMAJN/ZwrftrxRmrgF728w70yJaZtU0tiNm9qtwslLOPlH+a8y
	2vMuiOWa1HcSbP0PAzDZT9BAd513PJuhjYoOJnGq+vEuQKBoIRCcU7AoIfkN4qIeoQdVK9J
	yGAQytn+cFrN7ulwW5YP7z9tTIfxWMrFOpno8FAGfQyJc53XWK8LIN/i/TYc89k+sTeKVU/
	M3j42CTdqQvE2j0qsNTmnhw08c8T/IFmy4FRnxyZtfKfvgP7n1uir9sI+m+OQ5n50IgwfHr
	Jlo1mHjrco4nAXe39C/vquVs6TVgBvTxd0jeuabi3dPA4NtC2clPj8fZYQFOpo4Cp/SgBc1
	6v2gs74rt6UwjGWdskavwovV4lr86/X2ovbbKdGNmbUb/o2kJY/GCfR2ksYYOxroOqjJiUI
	LKqbGprKZnMRstI5t7EbaactnVgnKLVr1QIReDwnLZZzJAJ8Ex6kQ3NvJqHyXv3h1VO9uWU
	XjPTTEoOFwf6y88Z9YUTKWSoAZ4LccwbU3Bd5lD1BjzlnnetkPf8ZNFTcpGlSvBPl5FhDQ/
	3XQ54Uw4fqIpbAuN66Jxf8YWeEkoXuIuWwIFja+tTZqNpi+q0/ES5P6f827+zDBP/OvxiF4
	gy8AUWSYelx6FDiQry5yvnz1u2NtEyREgFRumuW6MkCu+tjcKGHiI/6g0Sspg+T7J0kEZeE
	ctAx
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Describe the first APB timer block and its counter 0 interrupt so it can
provide a shared clockevent. Connect its functional and bus clocks and
reset, and select the oscillator-derived 1 MHz input for a stable counter
rate independent of the PLLs.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..c3db90f6bf14 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -583,6 +583,18 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
+		timer0: timer@d4014000 {
+			compatible = "spacemit,k1-timer";
+			reg = <0x0 0xd4014000 0x0 0x100>;
+			interrupts = <23>;
+			clocks = <&syscon_apbc CLK_TIMERS1>,
+				 <&syscon_apbc CLK_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_TIMERS1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.56.0

