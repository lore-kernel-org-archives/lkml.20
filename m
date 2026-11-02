Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649329;
	b=20KHwyeUrthd6SvmdudrD6ODUlxqgGtzgtjBVA50/PrbTVNK3lJdFGcGGen7eB8KYnmC
	 5BzMyJd9LNGNbtErE1yg7QFi1yTAtJPI+8k6aA4V2XACc2LG3QY8oEPnFKlYgfdvuu9uZ
	 8aGw6DlkTteFqXz1rww+rKnDcaH5ntQ0NUTQLQg2MF98L1mpYhYkor2k5U36jQuRlpwHi
	 Te0AvtS2gqaEsEylIy+GshRrSYbX6/ax45VLyoJ8rEhpW9DJurYAaWGN8YEil84i+hUeC
	 qVUCZ8cgFlMKfAR5iCPfht+hwtxb76rplKUeAgkQ7kXITGA7TGOS+vKf5+6d1s/fvzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=QYZnUN9DI+JHc+jsx6RlPDQHNBhMY02EeWqqNvyH/PBuyDcFgGYfIamNgI1zRCLwOnMX
	 C6tbNY2E/LZoUN5iUo6cKc83dyCfgUg+0YWHUThxphNhGAbvTkR/fknk8tdJbr1hIYzOp
	 6yQpzauD0FC+DlgP0MubJyoWZY+3rOdsfug92O41cryUffcwLmLgyfv43esXApfIEjLNU
	 UyDsy4kb1PNTeA9ftdYHBrKL/vxFS2pTmRWH3r0QQRvSU/IScZczVW9tJmUGM0yxliiUt
	 ibAdVbUnxf4jI7lKfvjovxXjmu9y8TjUXQgjW+sggIA7SN6yeLkXKTQCacqGOTPWWkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SckObWPI;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74612606EEB4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74612606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SckObWPI
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48ed188ee81so1739855fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=SckObWPIPZ5U5QUaJScnIkW49LvzDzWqTzYMi/4o5v+UApWJzMyYGwD+zpGJpOKHEm
         IuzOmAPd36qMIawkt4/9gE47BRcusSGpcfV2qs18o0knGxVzJTV/I/vEq2VUwJbYIAAj
         LBDM9JRH+zTipoD2BpozV5cLIoMVR0J0a1QEyHS01Y4KxeqndfSPDKNYyLVALMX+0VK6
         BkPO5sQxZFQwk/4Pb2009G0bWdTg9Bwivf8rJ4ky5ZxOgJNEcZ39XUi8cgkpmqPmiEeI
         ijMaxjlFWyYOQ6YZHQVUS+hMbQaPEM+wwd3pk/RByx7BNS6hCRCEEMNVFFYzga7+tUHE
         pklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=PhXTL68QadyZCusnIcEmGK49Y5znMc4g6V1isrlJq8yocLFLq+GbF2aUPxNa7CI1i2
         RMmelKPzByD2DOjdu3Mva/F+BnAX/Zr5dkhpj/LkxGE2PQM1K+mwm0udDhYEgL7Sopii
         QjJ+8uP3elhWCYTydUiRpaPAM6f/nC7jefEi51fEjgc/zD6TeoyBzHIss/AfDJijHMTE
         Z0aV7zMCLaPriidkHBz8/srrAi9hP6h417zTl4w7tDqqaJegpPQ//y81a44oNV3ToIIu
         eMgqRMtzZ3NKYM9rMSvn84gEgFMhp9KWVKv2AbFZJYskJjkPaRV1m677HJRTlM7jf0dR
         4SUQ==
X-Gm-Message-State: APuU4Z9nxk3HxzrHXWHkl3IAmOzcNQD/Bvm7t3vBNPRd8yulf0yHcjpX
	qWIMFavtOGES165ThswjIzLK3Jpe/BsnH14YYggtzc9a6klrbtWZAWU5
X-Gm-Gg: AYBFou3HRuUIOGfKCjPyTOnyOLwWxgQu/Tx6Mn2IwcWxd3+W4GWOKnV9OiiQ1WDaF9y
	R7zpy0vIDk02/z/uDiU8GVvLouoBpSw+j8MH2UczwQSJ+oJnaThbBczX7xhDrXfIpeHPPXcyR01
	aJDleRG9t0Wc6leXueGwmANzjzAFea9lALf1LZgMIOqQSaS/Uq6rVMHRlATVpgFqIeW1KiLJdiz
	UF+wRz3v6FRwr9ODLJBqeCWfFuAt5L/AbgHihNZD/vdMJ4UV8SADizcdWTyOBQUyE1No0ZtEHmh
	474nJKAcC1hjOAKyQA6JM/DF0msdY0Wkx1foGpVq1xmha6ZeUyPoBaNZJb8YrUVfimJc5iyenJB
	drgqqG0wE6FI8bNXoy6iTeTotRohVdW6CMUw8H6TaNl0itFG88FcQLIQEohZRMdbq2AExELvuat
	TcTToY5raozUkaLf1Ef8kCogdBuTAgg9qeUcjSj2Qx+gO4tngVNF2+L5lQJPjZuFiRwyCADVQto
	53mGS2Mq/PTvJu4uVfzP2TNpuU4FnpLwjbe9z1IVnbO80qiiyE6J4AZlgyr71WGF78QH3t20J8Z
	L7uPbsG8+XdCWv8portfIHatGvRaxskzzeUd8jpmPYjZpYwK4UikwdChs5nhYFaoDh1osAwOSLZ
	FdlfgB/ZHwVpwXcNWqt02C+0fmQ4G76jZfJQdLcvzYF5WkgTuG82WmZeRqQsk9hJziFx8FSi4rP
	2ZGweu8zPuMu6aE1ft5EIsIexv/L328kXPLLKL6spfzWHQrka2Dr8=
X-Received: by 2002:a05:6871:580e:b0:475:e2e9:4f4a with SMTP id 586e51a60fabf-4a9076b7508mr7711963fac.24.1793649328190;
        Mon, 02 Nov 2026 11:55:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:18 -0700
Subject: [PATCH v6 3/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-3-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

