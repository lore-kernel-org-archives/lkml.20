Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280405;
	b=Xwkkb0jbFEGS1Vdtp1K93ovdmszNnbTZuxXRy9+e4cjcBkpIxeSGDRyItlAorwgXvJbF
	 71X2n41/fDyE25l5gBIUWHNOns0no1TVA7t984xwnt5K7wYPD/Gc2lzx7WhmclJk/KLAx
	 0mVQ65ZFzIjKD9aqDTF+c/rBUhX64Ft4FOAXIxJYss4FLpZqLEOMp510ZrknAMixV/mvh
	 7+LPucj3iAANBDHbJTtV4n+EcOh6Vd4sOGSB2J3FOfvZb1F3vhpXD+5czvaBcDBbsb3mU
	 DhufuMZgH/Te3xqPpp/l2YAZ4jIzI4MMVc6KRxpJ74r0e67SmK/Ssb07QJvCHeWYyVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=x3eGtBmD6DnQC/+wwu+A5+Btftbyi3yQcaiieH6zxRnKOxHK8xNDtiImQyg4f/zqWVlh
	 d3uUpt5G/Hlxg6eKU0vLmzb4a8Cg5fDu+G5527VpRJ2Rw+KHypNwUes2rtz+7WYzAsXnE
	 Pw2q9n8B4jfI6ki85GraM7ADBnEm8n4Wb56RDk5KEOH+4eQkmZ04569pG1slEJm1+1N6K
	 ZISxQV72Za0esI6cTwFZ7gdPM7CZkeXvcHXunb07c51keshHR5rEnDpXfCe3MVqei5Y+n
	 wGaFzuBThXXyuJ2Rqn4XRbhJXoAELFBsMFN3b1EEx8i4HnJLBWigh4yUWaAY4V0SjSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3bjQbyi;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C217960A5BD3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C217960A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3bjQbyi
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-5058b105df7so494560b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280404; x=1794885204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=l3bjQbyiXUB14A26wKcSv5ua9dacnx5+WhNFzm0Ki3HQpqBbk3Gsc0Nz29dnZA/MW3
         +MDpuMWMELqUVajxi3Fuc8EKLVIDZJkX4mgNrYWHtfJEHjsNckS/IIeia2rHTtotdyb1
         V9u/IserDlXT9tduNcT9PTYazDOC48j8+Q4T2lyHCsjBdMKbtRzgwWa/C2kg8g7rC4u5
         IHRJFfs/PiG6lfqzYOyzpqw2wdcEBdHRYdiSKXJqwvPBCpLeuFhNgiyXpzTc7t1vOhnc
         CXswg5b/5He5KGHzjfXv4gs0ccrZuxRD3DUXplwUvR3B87Mhp51lTloovxdNsxFA0Npn
         SS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280404; x=1794885204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=LdpOAIbJ8CdOhhR9uxuwsLcweOmTBwr2G2kQxd+8ythAKomJRBRLrh2tncCastN0Ut
         qDnIpRJsmeag5VNz3RYIqWhbtwF+Zbzis0U3X8bu8ayd92Na3SYb1JbBLLEakE6kOCqe
         hgO0iY79qDOe/WjCGYghkqE6q1NnGyMzQTz34oevcJkzHXOLDDBD1exKFs9wGhrdAC2T
         iOKPnEMBsnNJebZe3Qak/nVdKolW6oKZTxhv9vM9ALgp4IygSe8AzbtJyxOaIxOUnwz4
         k6Rjs7RZy4lpMfR7yiqSwC2MZ0voyTv8rlh0TF17i0c9gtsHjX2EeZY1W3Y4lE5fZY/v
         c27Q==
X-Gm-Message-State: APuU4Z+vNWoGNJnn+L29IilKwo1DMrdz/8OcGEBTegDwdfpjdnzWXh6s
	Q6EIa08E6WdB/bxp+UwRkviEarglc2xqv+3WvlXfPyUx7l0rOF3pAdS8
X-Gm-Gg: AYBFou2yyec1XIRiM27NEEeu9R+la6P4g3IRrcZD6HcPB473Urw35p3xElL1YaY5LNJ
	bW11YOcchALFfsXU0jDVc7BCB3+UC89ljuzVz9OKoFVRwaXaRgi6hrLmWtSZoELDIRxOO5MTBgZ
	QVkLsxXZWm2A2RpG5ALDXrVyaEqDFpvnDd1lnicf144fooFE1OcIdXfEqnJcmYN8jgbhHwonPOw
	GKh4MQEEJ4sWeCu0YQnKtZqw0uxyh0QMAHzLNrSX0DGtX1gLw8do89F08s7VmFqagcKG0Kw/Ozd
	X0jcVGhuL3e6fpQPk8O2Dajf8mp7n8cSA4h9NLxWS9OQPd3CyULw3a8XFIA9I08djeBgZCdCJ36
	LHUALPRR+8vRmgAN0APzT+D/4tC50VjEp81GgrfytvSjcNRB4dYr468/fAShVuWmco0fb/fl09J
	NQJpDtpTnYCsSjhvi7JWHP3WDmnafBXV47pAo7+u4esJywZ8WbqSmSMCyQ+VhYwrepLaC1jRrdN
	lhpaNa73jwANrCuldsk6E3SoRWYXyZxo3kHagZlqflhbmSgjAvlLaYgor/H6H5sKGcJTpEfoTVu
	l/B9wAuEwbgtzlvJqBKx7KIKC53y7+6ReEXnoZM2C1/xs3UIakR06D6xKycovY8nIn/R5DfZGmT
	9cqbaKQLTauoHUWJL5V8RgPkRSz0VZrBZ2HJ3IPoUK2NegmKkqcRFe0fzFA3nC2y0haYZj1LE/x
	zYBMzz1BvF1A70ATKZTCV3nR2JY+VHEHIwKiFc9NwrwYTKGkCBu2ql
X-Received: by 2002:a05:6808:509f:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-5683cd30aacmr1359211b6e.43.1794280403760;
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:58 -0700
Subject: [PATCH v9 09/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-9-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

