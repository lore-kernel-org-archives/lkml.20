Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250432;
	b=fJD1ckgj9w0AFjh71jU4KWTs8ukOeu1VQC8k21g/96fTEJDD1tyZUurHGXDzePqkVyf6
	 TKLc9tE1aqryqAyaE8C7byu1X1uaeq5FcJLZ/C5eb70kRmCx0+EbMPVs1b5SjMl3210dV
	 GLXa6NgpbtnhvnMAFxufACzWORXzH/K+Np9OGtWE6Au0N9rh88zxFJb1wVImkT/oKIIb3
	 9ZlRsAdhZruxO5coP4t3Zz/5HV/euwzLIlTr54vQMIa6bxXlee+0Bp+FaOeJboWM+MGsg
	 YVFxPXL7r9fXfd7myo1MH31BO1t6T0/l/skCJiGGQPjg8iYHvc8GhOfw1KWwY32yFUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
	b=tvYlMLK+1PMeJq/jzK2SOMEXAaa0I48JkvnwEg/1rLt8QGYz5S7R0x4HRih+wRAkyLux
	 oEqLNFKEC/JZVxO9wOpY2AIcyOpQkN3P6QpY1cGTQ4JO/zOAmKr598gmLVergv38jATXw
	 vQi8H652f3dTp2v2G6mvk94UswOgyyqYwrinwUiadB85fn3awM4R4ITUiQlm1DRmG/AK8
	 B/eeN8OqPlQZt4QTZZ0pAagBicuJLd7SdWn4ogmkiFD41v5iyG3LmJtABO/7Cc9bPmgJS
	 ZkV/VXGy9TlOcycZ13CG8jEwbuZmz5hpQD2e8Y46N6LuJGYrS8MPHHQiBiCUGnXf16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxXBWzOI;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A3606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 507A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxXBWzOI
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987b4a710so1882515ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250431; x=1793855231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
        b=gxXBWzOIzzYbbu6ef6LGYmLO8fWD6f0eljqy64TeJkzZMhV0XUHIcnw9LU4bReY77a
         naHCdoXxYHI4UkY49em4x42TiVquywCZf3why4XjZ9wmk3fkxQ0BQJoFBznNDeuQivh+
         g5V6u5REf8JcdbMq4jiXBNa1vOFFVpdzX/SRPF1GpdD2iQFsDXpdc96DPh77RJdl+Fvu
         7f+acoURMStFLIeC0rnxbsQq32wMFfFekoojVjAPRDV1SGiYdrto7tiBORSbnisc954A
         4dLySoYXUWBh3yV4B7TXljbtbC4/s8NlPS4c5j0j4/AofIkRLy+J7axNwsC8bSudtHiB
         TBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250431; x=1793855231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
        b=mXe+QKC986Cuk2zvR/vbYbQxmN7oynNBk4TOCTSueYWWSAYbZGSItbKfOTnUHZaPsE
         AZRnqpzGsdXyZV6+9rgXliV6c6pK82NcuSRyIJBj+D+6Q3FosVys8dL4JI6jF+Dx8lhZ
         uWartGvUD3cIZHtTO4nzsS26raAwk3ks0kdJwCWNvCClNvbyl4nS0RqUUt67ooNVI3zL
         NGNuWD4ACkY1JD69OjdsXIhO5W9zotj1eBllQGRjFmktHHSuilANNxOEB+Y3vdni5+DE
         GcCvyUxsuOu95JDuaw6cKppyRbXMVbGNS3KRznGhrriT/XTBdwtrXLcrfTUJaTwRA8/A
         oDjw==
X-Forwarded-Encrypted: i=1; AKwUvBxr3IYmgCBzd6EHXP4FSvQSeqqfjGIZa+JzHuCfZD3M0R5vtTamWgk+Ugn44JUjp1pr5wGYp1LrGhB4bXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPc89+3hQZxdx/8AC+pn//sxMY0dPDdMaf6nPQEoQ4keC5nKRr
	fSxeeZOT7ONDjC5ORqRD7H5ko+cvF/TtPKBLuCYt5EkfCeGomvxxg8cT
X-Gm-Gg: AYBFou0uqSonYkBBqi8vVxeOGoi9g9RTbnpr2f4ZtNHyBseyfukpW10Ya1fnQtWat2T
	ShVJFnG6a80O79mfSDKQP/eTzMEtP92Ml13OH8rlZkzZC6H7cIPfgJ4fkr3yO/xxjM0j6Ekxh9I
	4YIylgJXXL0zW/M2M5lTLtnefGB/S9fDhAIZFFTD31jaUkDn/j1wVQzEG0+T53r7fY12zS2vaxC
	dHwslcO3DQPWWUbrjC6Zoybofl5sQOtBvSiZN8H4uksJH9b8QZCi3APwz5mXuEF6ZysobjDu+n4
	mcnovR0OKiiNXEbWGf1rihKK8MXGHs8vEwBYbdzXF+6yDrnF9/XCKFgWRKQRvAnwk8W670KFUOA
	xH2MK5JkdF1Yk3dYGbRjiP0Ap9pWOLR6oIIxhmMikvu8Y+BVOcDs5DIBNIoFa/BzB59Z/2WtDIz
	5oT2kpm5KOPKH6z+ps7t9gxVfYDDDoqN96arZrSgVaiXJtfi4esoHEI2IV4qfkkz+tikA/JzrXS
	WW3gCvPujIDjT771ejf/Lh8m3Llmy/is0qjMB69G2ZMEtewQnA39wfBg0V/Qo+FQk3phwymSf5o
	xaVBl0NrK04RpuGs2EH3W8Kq3EAp
X-Received: by 2002:a17:903:11d1:b0:2e6:f3ed:a551 with SMTP id d9443c01a7336-2eb1aab257bmr10272905ad.8.1793250431325;
        Wed, 28 Oct 2026 22:07:11 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:10 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:50 -0400
Subject: [PATCH RFC 09/12] riscv: dts: bouffalolab: Add BL808 SoC
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
Message-Id: <20261029-rust-bl808-console-v1-9-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Add the BL808 D0 CPU, PLIC, CLINT and UART3. Leave UART3 disabled for
boards to enable. UART3 connects directly to PLIC source 20; firmware
sets up UART clocks and pins.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..c739c77960c4578b87fcf2bc096ef7c8cda089bd
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "bflb,bl808";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicsr", "zifencei", "zicntr", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	xtal: clock-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		uart3: serial@30002000 {
+			compatible = "bflb,uart";
+			reg = <0x30002000 0x1000>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtal>;
+			clock-names = "baud";
+			status = "disabled";
+		};
+
+		plic: interrupt-controller@e0000000 {
+			compatible = "bflb,bl808-plic", "thead,c900-plic";
+			reg = <0xe0000000 0x04000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <82>;
+		};
+
+		timer@e4000000 {
+			compatible = "bflb,bl808-clint", "thead,c900-clint";
+			reg = <0xe4000000 0xc000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};

-- 
2.47.3

