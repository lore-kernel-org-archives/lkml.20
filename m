Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440431;
	b=kZVROMbelXy6I9yRRUH24zBYBct6F9x5Duy5aXzQirb6JL1wJVL8n4VqAUCdWo9mMvuk
	 b8Fq6bU6DdDfQeoSk9gnnlVcbH6kFN1+IHOxFRfAA6sCyu+I7oOt5jq5Cv8zsvsChK2BV
	 E0JlKnPVr7ili4ktWNRoM09BzzdCkEibFvSykbQO5vtpBIAeQyU7WXdZs7+m33mPrfnbL
	 SOYtvkV3r4x0kQiacbxp9X/HtIEXTgKwohucdoBlC/KCXjId+bIN21Ytpb8oawHejb080
	 4wJafSGNCBK3aYY6OmA3Oa2AzHwps2HB5el0QZ/JAchE+S536sq1pZ3LyNrNIoHYVxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
	b=ioc/PafD4145VENp+mAB7bD2wcAvC9C90fhdUEEaF4sB1HKteLoJilFCUL14jQn/yzMT
	 37cqvg8Ncnaqi4l+/qUUSChMe3kXntwvptKr1gQITwiWU+VvBob6b8NaJLB1CVbmoAo9z
	 ndMuDdXAjXowebaOhbl8ZDGGhS3KrfO95OgHS3UJYj8v0A4DB4XNuWauiAwZwIyKQTTbn
	 YOhW1SCXI/igkFgLhsK7G/rpwkLocr5M+YY4KvweQHUL7KyNdiRY8LGOyM/vXNw3bcOR2
	 sgoLPlFwvlgoLkSjkwKv5LnODIqqsV6/bCmrOtXA+zduxvKy35UFxgGtfIbGhy4SPbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFjW6Ke7;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D66E606A321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D66E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFjW6Ke7
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso978346e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440429; x=1793045229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
        b=lFjW6Ke7fqt2qCOeXGHITKP2EScCXZd0ELJY6MwJisMJLOS1qIFTPrCr2eT4uKGhi0
         T5rEMvzdIhWysJgwDefpXyrveKX86LjLk54uzPkVPcXWmnq5GEU7kK1sVjVfixysUKev
         DW0Wx7GlV0E9+QE/Px90najt976ve8wiR+8LBZbn5krM0VxARSo2DpoNA8XI59F4GEGw
         sifqaooDNtbypP+kdTAeQ7BQHM5U8i1KoZ/+8iA4csVYkrzTj2liwDSKipLoNeRmaF0B
         ylXiAzMMZk2q4DeYUYeSZIkyBtQExkQ6YGXjL5fWK0fcZAl1h4/pTfL6d0XjFoRD1Z7r
         xVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440429; x=1793045229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
        b=O8mu/wUa5GYckkW5JZSqoIdlTgsyGscifRLJ42VC3yPXMfahBIZdWyim0Wp2IjMIto
         cscDtKQ5YVTTSINTR1hXVg7tKVjE0Qe34Lw5+IXog8nZcW3aJ+BAskbcR2O6vhelXbIY
         J5nS2lFs3vunRWyk4VSL1t2Yv+7W5s5g7S0poNBaqdo99dES5I3TS6xMiKxLqECQEho8
         Z484Gkfh612VyNBby/Ulp1IgW+sMQI9CXeX5rmIsMVCBk50jJj3QW2OLFlH8Mo523Hk3
         pgmS7ZB4Tt6OSbG7vN44sMD2tF3MD8FTRloqxC97Uug4B7mNmApuezGqbZ+7jv9UNort
         68xQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/cjua2U4oEAVz81rmAnwdONy3hcnguZZmbQZnqn8t18/OhXjz9iIN58sm+gRpz0iedbGTvPCpH2CBs0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRTQlU6M8JblUSMsaXo5Zidm2hb8WUwwl//qQCxeShark7By9M
	uqM8O+W+2tf8cgzTLXmbzgGAIveORmCr7TSuWUz/Zas2berpdvJEdn9N
X-Gm-Gg: AYBFou1Z1f7nbvGTDiqUz1A+GNdcCFkUQ7NUR/RB8LjE33cpA30pH06gZVrWWYz9xUj
	kIP9sQ0ZqaWCjd4a1uaSUZY/XfVBn058bm8rf2zSMpt4R6H4bu4lf/h6FJQj21NxU/tbRCWgdsb
	QipQ4ATvR1HKEIj3+8EdYKFAEhZN387q8UHDVvmKk+4wms6/hUwPEXcsBovfjcahw+4HJ6vthjz
	a+LeMqHfdLlF+d7z02yos4ocF2kevQzeWP2r+kdPSffj/V8n0dNNL3Xx/oLMnQ98CW4HD/RFra5
	xahMClD6EKjdcqRNsUdnlHTZ4zpCHRbLI+Eyhk3cq97q+L8pp0VZhQ/nDIVniSJC6F012ua2ucM
	JoIn+XTzH53bh2BUqoN1tpGNVsfcQo/5cn865AQHXyBNDCtcMAjAnbA0fQbNJqkfNInYq7ciHq6
	4k2pkAlGEivy78wTu5Ac9xWSZHQV9Iu1e/41wwVuXqp5errttdcEg91Yq54i6vBab3Eni2nXFis
	C7z7+rgRKThp7e26t3+iqRiFWKsWyUDc1gqfTVtKO7wb1Tf/Aj5EmwQBtVOJ0q3p2aRb0p7og8T
	njf6XuY=
X-Received: by 2002:a05:6123:2eb:b0:5dc:d0cb:7d6b with SMTP id 71dfb90a1353d-5eaaa65aa82mr3039279e0c.14.1792440429039;
        Mon, 19 Oct 2026 13:07:09 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:07 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/4] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Mon, 19 Oct 2026 17:06:12 -0300
Message-ID: <09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

The Allwinner A733 UART is a DesignWare APB UART, but it needs
SoC-specific handling so the driver can avoid stopping its clock during
termios changes.

Add an A733-specific compatible, with "snps,dw-apb-uart" as the
fallback.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..532392dd54cf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun60i-a733-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
