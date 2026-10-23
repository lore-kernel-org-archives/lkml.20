Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740841;
	b=QlMe299WMWip3Mcfrj6Om0vWxBu6saLGi910Nyr+yHfr+J5e6lR2gZABoUinHw39Tgwg
	 tYaIoTXg1CkTXmjwmS0deVxIVaNXxo5Nx8lSW4kc49ayOlYCBXeHk8xF83wObaVQ6WPro
	 iHSbEzXe9DtTuNhNhX1lq2Z+yviT7KilfWvHPgwFknzpq6t2QTpqcYsPBtcNgJnhiwEO7
	 ZRIE917UsOuwGd9QYJhPjZa1Oa+sdUOIIq0JGkWciBLDbST/XH69OL2qUR18c3uEqElgE
	 mFI+FF/HlTQqWSGR7t81vBHgct3MdDPsXbbamIsd5DW/u8ztUuSDPzSjs2TixHeO7kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
	b=CmPr39lCWy9YUSJm2Gf+evguU7tEmolFdvGFR1+iJIW0BhVoPWQxJkAB+5wHiu4C7uRW
	 DlYzaCfXVlYOAvweOOCGjQBgEGOaO3abBDwRAvHSIJ0ITFNSjAUN/Nla9Y4XcYRAk6VVW
	 LxDUniEMcMYDQMN7e4BW2UgD0S9LLd02Y3xdRWbf5npMtcgtuH63rqsf612nGVYeLkFeM
	 CwhDCG9vJZH7e0MFS1bpFZsqwf6sFjwlnNjnI0rgODo+RoX0IZO+oVNptYulZIsR0XvMD
	 8J32Y6wdZTfs65wR6Q/zVjzXSmZpvg3V3jmwGk/ZttAlLEhNmx6RckqzSPhLMmB8Utg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EnhbhvY2;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C151606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C151606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EnhbhvY2
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-81ae6aefdceso531731a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740839; x=1793345639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=EnhbhvY2XbYfTl7qeP9r6CgcCUsceSgFL9mfHJXMPEig/UsejZrlWzzKmLih8QUoAJ
         NxcLvphld28+mFu9sTIfbP7CHWA2F9AXJmwxAMHc0RXKfwQ3SWuI+ApEN77IAsIS//v8
         r6OfeABoDDEzRsOTV2ksscTv6KTL14Ov/o7S//qIFTsQf1iyiOoBwWFiBlDJ30cgFeW4
         STFDE6e6HNiOlOFVuuQlnrz8oZPDR28v+N9VjF0oCR27xjOLSqMXBVw8HhDZf2lpfyAn
         njfXd+RnM3y3A3DxS4KcF9SE2jHztvKs3ZgdnBSSLAbnoaWzn5ic06yD/hnpB4CRqEGY
         Jpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740839; x=1793345639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=B8T72gIq9Xwd059lceDnZ4Tkvu+WQQcVx+6gUE6EHL4O8Hn/1EauDb67Rdsq5WgS58
         z6VLCeIgeSMFZG/aL0lAGhcXBaaXCXyyC+F4+MluT3yGjGmwQK17Zf7ia/UANLOoDgYO
         HbE8Ssj9whfLXnIpWFuzZbhlN54ARDFv43xoyYVWDZnuXfxah81tW8b1fmuV59FR3nyq
         rCMLFB82PFzExIwJYqve8wFaJL/rYGLNQ8sFiaHDqOp8GsdWU1unt1MfUmCRDDU7OJ9b
         8UOBPcvFXKmRKKrROgMxyP94XuLPQoqY1XXI4rUnSGmKbx1FFMvTzcKWsPTiM6Z5oy1B
         lctA==
X-Gm-Message-State: AFq9FYIs2q8b1RzZnzcPOGVPexAmvaf79SKd0BGEV3DhIJ1mzAiDpwkE
	mGL8ols6vpproopW5Ut4/awz7HJ7GAyGbhY/4bOVq5FCyg8j7MImoP/Bpr8Ywl7u
X-Gm-Gg: AYBFou2Ae8XL5cJBUCHZ12EEcTCVv3dKDUbFLpi/L+s/r9zuKBs0Q0uBsTVrtwSCJ3h
	KywPKd4Yw43+hGLYl5I3x1oxsu6JqEz8r3OHpPYh8LpFANEKOdjxwR4Kw0Z5OjwD0pHemqp+oNB
	YnBAn5gHNCPjxYWzGFOAOqxDjoD35JF4KZosdjt0VpJsZ3qqGxwWzS9qQu/Br1+DInwrIbMgxnb
	j3pNjlZXa8evP7jrQ4NqliqG85UL+Tv7uMQ2qrp1LFjs3XMbvZd636s0/pYnPyOqlDKjeDfQAsB
	ZCwKSsdtLbmKpmhWEQue9Prdw71RF7C1l29mLi8AyIh7y26lIZCyfeSioAZ83Iro9xRiy75X8PM
	7KZ6HdQ20px5LjzPILevRsI12D3PyU8c27TnHXQXQTtJCoCWP6fTYqCZyrMFiet2DifF7MxkWvq
	scRW9y31Wojzchgms2UK7zSpHg2vInqXJgmFxi20ZXEJQ0Yjjnk0IzeXuVT49n0pEfEW0a+5XqY
	jTLY/7cVy+wi2k+xSv0/TYMyFSli57QubbbkgRLqRd+ofp79C86NZJtyuBGPc33ETcS8ugluhXP
	dBEZkmkbrNt43plHTs6dK/6eLJgTG/iwX4Ds9UaRXOWTIN0UwZ8R/slFlgY/jt9dXA8OjErJCcG
	uhwQVI7fWx3ZuxNaWBA4KroOX38dIWnZ7RVtmqoxnZ6M/AH63ShVcf5GjZWPNBE1kkYwZ7XYdBI
	jguRU=
X-Received: by 2002:a05:6808:16a8:b0:4d5:27da:a496 with SMTP id 5614622812f47-55be873584emr874475b6e.48.1792740839404;
        Fri, 23 Oct 2026 00:33:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:49 -0600
Subject: [PATCH 1/3] dt-bindings: serial: snps-dw-apb-uart: add Allwinner
 H616
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-1-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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

