Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695093;
	b=mVOvkcXBSIfOivfmzYT5tM4ErrH6xoJ6EsSbC0QlsAPemLBQqpbnWqrhAc1n/MLlK09R
	 //E4nNeMmAGNVYPS14t7WfaUx+FJo5X7ylfYFHzLuXpZ3YsQdS3xTW+Yr4F0yqwSnNc2S
	 eHFSoo7cPMm/rlVQMtlvfKMdAPvYbACusVO826i1A+y5lVG37n7GQYcVG4q8PhpRMTW6+
	 CqdhECH8B01pkG198CY3IdAaOikMChKJWR/5X0D8gTJFoDJ2C8TegO/B9NM47wOsM7pHw
	 a6lnTlwcdK4BsJPLhMDXDveWTkJDKIBFNx133wnEf/V8quxIAY5TwkLNk5I4r1INpEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695093;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	b=FWGPySwx/bbNUcJKktgqYm7UiOD1Hz3gKQ9hybpQtcFnpRLTfCzQ95Y6/wFDNgRJ3fRP
	 EnPJITp3/4JFxpKst8mq5GMvANvSwO8U+281xFj5GJwgbmiOrhxLUTHUJC+6Yly7J4nWp
	 NVc/0H2UF72R1Z7KqnFbyozdYgg72mqs8JI3yTORQ1fB0mamExX0vJf5fHNI5z5sxiKSg
	 G7K8B6aE0I1p0AbetJDyWMRuPZ5HRdbymlZMEnhrz9bYpVqPfpLmqBLIHNkZCroE9CjzQ
	 b5UoYm6KOdDnoCWhYUVPHbAfxMBB+vmOZUQX0A4U5dy2EGg0b2ommiMh3d4Gy2GA5oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YQaiQVua;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A80606B6CD;
	Tue,  3 Nov 2026 08:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A80606B6CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YQaiQVua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695039;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=YQaiQVuag2zAwv5W0T68QlpG/yh/AHzlsq3zqa+lMPQegpoJvU8HFFy3JDw92j9Io
	 nyDOYNrF+MUfZGOjeaCBH2GQyqZzebV/JI8ivHG8E1SGKLZL4+2+FzK6mr7woTXbKb
	 WuSDEspZPUZwRzARs693KmrphqRG5hkJGfq7WnBY=
X-QQ-mid: zesmtpgz3t1793695037t030083c8
X-QQ-Originating-IP: sI2LLpGLequLdxW9VHeaFrs2SKpIJE7lpGeu+1lQLK0=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:37:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10615523159336062745
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 03 Nov 2026 08:36:49 +0000
Subject: [PATCH 4/5] riscv: dts: spacemit: Add the K3 APB timer
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
Message-Id: <20261103-spacemit-soc-timer-v1-4-36722421db6e@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Lakketge+7u3TGaLDJYVC3ImXbq0o9pWuFTAwlnXYmc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5yozHdn37fiEmoRFaWuW7kg4v1p8PYP9pIn+NQq8R
 9YpPDbN7ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjIvykM/1NFRW2brnxu9f3E
 VTr5Xeb3s54T1wtN2PZL/+DF2JNexyYwMiz+/ljmUb1uQSSL6tkDPl5hRx5FLfyy5KhNYKeN3o6
 Hb3gB
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfoWz7r3VqW3+gkYNcai2LOCeVYjlYYV37hZjsbAiCR81r2lQZq7i/so
	5hZDnZ3rfCDvj1BdVbrpbbYWhbg4ypIZkczFtZxY/I/ZKBmXTptZKblvjZXvfPiKNBiK5cv
	ZNxqqk1yRVcbXwOdU2LSWUd4HpdyzlX5Rxpxo71irOBsuhfpXKB32pINQvucuRzFKuX8TaD
	Lm74QsKvMDTrywRdVqET8S+tAUN/klO6ZtvRONiJFhUeGZWACpNQ/L6kL5U6q+mSgtIp+h/
	chS9yVH2BjIVKZYlFcGUwXb/K7HYBnG/SBWPeOwFREQsR9s82Cq/bDixvQmwHiKocww25vo
	3kL38/V2D/13ZcMSOweLoAbwHlJzhxWThv7yN8IeAuFbWxtWA1kyxRJlWAOyRi8XAqZk1QG
	Y09bz4f5KS7Z2k5KpyXkWJdObii0jYjMm4RUxAI3U9GtFE1Jent75GDevwzIaOPTM+gkPkd
	3LfdwnIUf2wTZhiTTvM8z4UdDqDHEV9nK9mNAJJ3D++nIBdxhJCyj4C7Qtu+8QVs8Ak0oxv
	G4we3aDOHNKJuvBELOdo6gAxBQvD7c4OLf1k2MGe2pXy2disd4SHw6k8O3YI7nJkJFI/oAK
	A+tlN9Q75fCsDG9/go+xDTZaEbHflOe2lBisrWrjmdQWA7Chuht2id4Lgpt+suBRQvCGGhI
	bI4wWapzogLRsMeSTyhH95EWNurTDjwVQX6agdqlXQjwaYG+SlXS1UnC/F7svK86zr3otak
	jkEF7Z337Q0CW9pKwgijoY1HS4NYlEouzxN5WCitq5kVatlUSDwqfLexq/g+3U7cqrmss7V
	J1W5p7p8V3aw1V9sfeCV7mATCXfcC4PVKw7CHFUfvgg/dv461f9uWI31Qe9bbj+/c7jl3mW
	eqkRYYMSENniUc0XhVM6xdR2WAops/0BnMH3Nb5QcU/eiEq9tdclYg9wt4/GdOXB7TPfHZ7
	QvMBg1xcNIKejwjSDgvshb3xksA8mSY86WfWg3PgFGkrmLgeq1fTmOFNyIfLpyc59LQMKdU
	NBreKBo91oE46IXKBOVDGJXKMv4BMmwjaSmS0tVzIE3d6XEyLGWytXwg1gDPzEzLviR8IPm
	o+EH2S/ouxqG3BRblIi+6VVX3eTORaz06t5YuT51Jg5j4Rew1kjA1QE/MDahVZ5Md3Fefvc
	U7JQSNPYodH21Ama37nvg+U3kDKwYc0/yuKF
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Describe the APB timer at 0xd4016000 and its counter 0 interrupt so it can
provide a shared clockevent. Select the oscillator-derived 1 MHz input
and connect the functional clock, bus clock and reset.

The register interface is compatible with K1, so use the K1 fallback
following the K3 compatible.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..cee313232c11 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -777,6 +777,18 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		timer1: timer@d4016000 {
+			compatible = "spacemit,k3-timer", "spacemit,k1-timer";
+			reg = <0x0 0xd4016000 0x0 0x100>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TIMERS1>,
+				 <&syscon_apbc CLK_APBC_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_APBC_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_APBC_TIMERS1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k3-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;

-- 
2.56.0

