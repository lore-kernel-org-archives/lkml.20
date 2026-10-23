Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790376;
	b=UCor5MK9JvAJEJbrr+RoYROlKYpZ6oRXUt+Cw6Ngx5riYIJ+LiX9agyQboqe8EVVQUcv
	 g+HXBhI4DEs3+SoYJtN+RWZ6DOKdz6HPDZYKwajSSt0VxwLHXIe8hI2BHqh88h0vksaIP
	 pf0V223DRj8tK1kMIO7PhgTivsYg/5uw5GLEFsfH+72CwpHoiGktGTe6P4WaMTxEWWarI
	 629C/7cc5tnOnvp64wUkogznl7AgeO5lcRuZuma73LUCamw00uq9Wt9T2iY3QVGdbCVmE
	 w1SHIi9W7qRuslv9sZ1IxM9ve1bNAIEkM8kcun633/p/EAUc67OOL+PsYTE2DHYKMIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
	b=a9ANPkz1hl9vqBxrK1pthmN+cB3nV7KGq/hQXhxn6oIMuNio+Y6hvcwnhtzhATuKu5dG
	 XCZzoYkjfI6WLUwwLa1WVkyogD7Safgablx2pshJ6J+gWNaz2R6EHu5Civj9RuY52xnAx
	 TqobnbpZWHCaFMkouSOLgSBIq9jXybik5wdS5QY89dvFx7qoNVtLQtTPVaRqaMfXi/K1c
	 PmzYEgFCXl20evPQj4L3AA7bHmJ611mqWM3vv/1qXMNAGX2/SBS0v7Sm9R7TJRFPKMZVk
	 LVI3XhIryhBJMCRBtjcuv1cqjnaOVI7DtBXVp1IG+2YNaDIN22K2Ou0Hej56byalM0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s84EnQUw;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29303606A337
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29303606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s84EnQUw
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8439fe796ebso826791a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790375; x=1793395175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=s84EnQUwh51TN5JAgndhoT5KOgs7U6N6XwybtUOHCnuENP+4Bfe6YjQbzPG8sQOAN2
         beWfQi2nybUsKw4r7MRV9hgxTFMkRoMvNECYToehWpfrzilR2AYpg/x8bP2kr1jxOkKa
         mo49KYtmW7X2mzthF58JQyNvqzFkksImrrDnGdCqW+Lfl1tKy7lQIXyn+FryfmvU7mQM
         h9b4NzJ+/PY9soGIaEP1g6u+DfvsZJikWsb9yBkmnwPNCi/7CLCqqjP/PGIkZcTgguQ1
         tyPIHy+LB2e2RDXKV1VtL1LPRmeWSu6f2daZ0qqMiAf/2UE7ZfP9eItUxBYZJdAI3Y9o
         HHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790375; x=1793395175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=a/gFnq2uDonr/dsSc8Neq7UFXUSR5XEzmN4nnRyUQsr2TVW+OCi8Al69F/FCBc7goO
         wTJqh7lGO1HeD2PtdgKeVwZm0yeECSolzxmCfJQ6bB7V8xzsV+nYlEK+u21JOWr1plO9
         w9/IJQgDR3nJXfmulLF8dnI0D+j3LJhq8BRCmQcM49pD34C4Zw6+pO3vjaECB/qX2fnC
         2IgRDy08qb0CTAzWf6DzwIMgR0qqF3oHXYrVpy+Y2vlQPUWjwybH5iaEQXYjyNvprTI0
         Ve71EJ3gXZNAXW4QMEEtG7foLWSlLOM91zQl86xQ1L8OpxIEEENC078nbQgHgCNcbvAw
         S5gQ==
X-Gm-Message-State: AFq9FYI13PjGbCHUbZwn2tzJQYyGM6BC1ug/K2ut59i7Ixl60oWP7kI6
	TzQYzgxKzrlHeK0LzXZcHV1Qf5+jo4rhae8qTv5s4bOCU3Z8o9IEY04r
X-Gm-Gg: AYBFou06iyW0+PZpHHFipJrAOnZtIkAgJe/d4jJzqVTZ3qRrkb8AQRaW84XjBtkd3+m
	aZY/bvtGPHoN5d+ZP9oO5y5ZqF4MInMYbtpDmTXHMu57GKCQFVfI0pi/xOMJwrPfRWY3LxZ/ixX
	SUeTDEa3gWhW7VqlVO2WCxSXM3jChl87Rm2ynU8uYvW3qlCMlMiHSVyvY2zLq9jJZuy4euOJE9a
	Hy4QMVRjb/Pu6gLCczrz1sPND2k1XbGZE7ri6vpCLwbg8ccy2q/Lz1+ZWnJzs/+7JdGOzzkCskc
	TbHWhw+Hcpq7te1TWmUB6C8k7AwSfnF4GnMfGbnsxaxCZEZddGXhHIQB7Irrn/6jb6FYbO7oh1K
	9N50pt5uXhfzd5o4NU8wdnqNI7VEdBw1WgrSQbESvUDjlsj7Xwk3l97qDEat5616764ggHpFNcv
	aRMQqPAhwjJMcadeN8AaVGqCecxsW/kbMVrrWwTo3NBP5LzPdkktlsacZYAdywWLBrcFhR6kRc/
	87N9jDD3iiw+b2vx6+11uh/OkR0vU5K/QB821sZXVyiQleTqMtA9sUStdCZWSa1onNWdhZATz4v
	5yMMFKVQkxVD7KPk9PF90x/qZEn+gQcWRrEvdtTTgkLf+uJi58AeLAO/xGOvURlxI9vUiQqYxVO
	GTPzzILcEMcHMJ2LDgVyq6FqQMlqrjd1RI/rhrP3IDRprurq+NI1iGZsrHbEINAdAdwuXbExFwZ
	hhxA==
X-Received: by 2002:a05:6830:906:b0:7fa:5c49:523e with SMTP id 46e09a7af769-850fecc32fcmr525089a34.23.1792790375055;
        Fri, 23 Oct 2026 14:19:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:29 -0600
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h616: identify the UART
 integration
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-3-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Use the H616 UART compatible for all six controllers so the driver can
select their fixed 256-byte FIFO configuration and register layout.
Retain the generic DesignWare compatible as a fallback for older kernels.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

