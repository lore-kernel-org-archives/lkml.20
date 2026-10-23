Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790373;
	b=fWbAv5+kTkjjDEGcNWDjLcpKNXIbzrMHXPQK81UFpOg54xIa+TD4cKePwXgSVH7rUnM/
	 ljMJ9mf3BYuLcyc70dQXUmH7aLVtwhvye5qF7MBvBiWCq9ye+xMx1/Jf6T8uvVJrf+VMY
	 FE/DOpLIj947GwPpTKWCwMV6QXbP5mZfyDQCBK9O1IbX+vpm1H3Ytj9wZYlWEbFkVL7qk
	 4uWPLf12OcdV1Iigb54Z9oaoDSLRxnLNJGPndhpgZ/IXechSuzmeoYervNaWtHmhRtjfh
	 D3hnegCeluFXnYjii9pcyQE29xdOxOsUdf4c5128uNtIQDF22kihJmSTCH3TQY7sHFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
	b=2at6j+UXn7TM7VLPuencmdw8vMsR+ACQTXeoxR4MluGgV5i26bwobR2V4kw2tN4TIiEe
	 n4eqYdk/dJYNdhbK4G8c1xKUXI4yQdZK4EUZsrEpZmjeZo149Wt1Txz/3/b9metWSRL9/
	 +xu1/XcUgVglBeaIdxbr3du2o3fm9I6Dn0DAWW+K56mdfWt5Yi2gfcuKahV3ZxE9o7fHr
	 Tf8yvIPTla+5I4ycS+pmtQQH6K5wC4qGHhP601GrR7jtBxjj01bI+fkx2Vipvk1Ych7zn
	 ziNhMs4PfCCO2cL+EaWXhl3MixN4KysBAQQPXTEuS57e2jyHk/XdjSFvBiITx5N0DEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfKrrTH0;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F89A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfKrrTH0
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8451a619da7so752172a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790372; x=1793395172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=JfKrrTH0n5VQuIi/rhoK5UA64PDmOuJ1t4AR1OqcbZgn82yEjF2i53eXW5O2dbwj3O
         AVDI6Vah41EXndWY4AaJt+oolwlQsxyNoMQ+znMO4xL5Kx9JTldEnlJPzGNlQTAZgdjI
         /lURYPjs6TQ5h7BPNYECPsbZFs8U6uL8opBLchJqnXZ8cEVE/9pA2cD4ppTc8eeY4pJP
         mNKeY4OPIfnWwQgf51PCkhWof+t3WOSoPUC/uJWJPuIvXfevEKTQ3frkxKUPLYLTq1sL
         mMvKQEDFruV/nDBDL+fbkFs6KPZ7s9FJGs3/92vc6GvgjNbzP6CYKdd0J+CM6YGixexP
         yeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790372; x=1793395172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=0FzRMJT0wNBUG8lCFHHW1q91Fw1cGln62CsmaGydiw2/nSmpqp0KiHmnrtGRZ0EXTg
         29l5cTaCDgNWHDxaeRi32MB2QBAV9PddbroaEjRNQrnOkl5CR3n9Nmzyr0KCImIT2fQa
         Y8P5Jhm20uriQ+JJjCiw9c9iA5JX01WQS3vAacrFcJDj+VYCaivxnMy9RSlSLOH6I4Jt
         mFIyMEdz78dJKgnAxNkF9TBAl5CdddQ/KJIeRvLsrNPuxsWofDPOtezHqN5w9hg4sDEM
         ic680WcPsN/ptuwn8YeEJTAZLoFMkcNq1ZOqtutl4y/oNbSgZ7sR2CqJmuCCsgdDVgbv
         OYGw==
X-Gm-Message-State: AFq9FYKtYf3hT4HnNk/SVwq4TZowNrXoXg7MJRPHyQqhM9hGDXDCuEJV
	L2Eukh0iHdCE8yS0AKh2xYXL9qIfQq2s7kiH0u2Z9zHoMIpn2kqFbKOS
X-Gm-Gg: AYBFou1LgNU9+WrgM3YmlFZ/q0vcMZCapsJqFZmS47G4cpW4PZdnSbTAm1hQKjmgqH4
	HRnkb7W51mhz3NlFmvKuEh77WvTa1eZwPXAtxbrwlScAdL0biIziv3QVfjD2hREgBvZhfPwvRKA
	uCBkVDwILVxZyXeX8bL+rkzEcr+qPOe+YTtySCI+B446N0RIb5H+k411DZpLXY8Gn+ABEEbx4GD
	yKzO1o2HGAxHUVA77pktfnCfNZ8gTOWJm+dUBfNTnMOFnXF5CaHtFnCIpMxQaA5Hhdmdl4mCVUM
	E+eNhbmaETkh/n85RoUG5JTJwMi8AkCS8IINbS9guVnKHQKAStoOC3kJJhEXl7BET5ooniV/WSc
	H/Sntnjk2dDfXEPtXGp2d1Fa0NP9im0/vTsiPhvooxcAN4jqhgfadDDxvrgSD/sbrqBju/wJkrR
	utVTjO2+A2RrS9hO90ARwA8QGh5/lQWQQ+0n8Ctb9vu+smmQ+hdbxFvSwmKRzoeA7ROiAvEuSJn
	MnU0LXU+GA8hHkdPz3CyzcysBC6rDLg+9H2TN06xDkQanW4QjbzqsUWsKrkpW5fQO7u929K6hGu
	1dUnuMF5hEXHYqQgwJF3ACWOM7q94udoK0DSO1Dt1oQtLdklm3embgWppX6SMNCuP19pt24u8X/
	GzvnXmnmy1TD0pkbZ2GX63jQl60XChu85A6ptidnOgaoUffrNaOANoGs9vJCP2tOpualyTDcT4B
	Xn5A==
X-Received: by 2002:a05:6830:640e:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-850fedbbf50mr560464a34.16.1792790372497;
        Fri, 23 Oct 2026 14:19:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:27 -0600
Subject: [PATCH v2 1/3] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-1-af0593504635@gmail.com>
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

The Allwinner H616 UART has 256-byte FIFOs but does not implement the
DesignWare component parameter register used to discover their size.

Add a compatible to identify this integration and its fixed FIFO
configuration. Retain snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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

