Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742016;
	b=C5wYOVYYCWk/OtfLiOReRh1UBx4E/KpPMwJMj1H5BVG7nKXtSNvJ0yi4mkrGqRXYIQEG
	 kGoFR8MQNos5o66OLs/FLy9mh6s/QEmKuEW7xVUtnnZSgfFtac7kyIaD9b1qKmAFBAnlR
	 U/v+vwg6DiSpuGG7+FTJ+JKV0fNRF6X7VUBFB/k8PztQP0b7VV2XQHAgzn3C8ZDAuka2b
	 rRXZyusRCsh7njkIY1jjG46n7KythQxdZXBTiXQRa9ixsSk+Xr8PkxMAMXITH1NlZysI3
	 +FdS+t9iyYfHWDb5ulTgF6lhra6KPcFmPSubvfj31IDgQvK8D9IIHN2jo6q7eGmAOdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=gk2H2VlsPidxY+tcrPkj0FpnoV6YjS6Huxj81aKW/55Wd+4i8RTzsTiaFiYOK26JNei9
	 lt3L2g+NviFeIpynwsUe8d6TWqIsL2siKB8KuX8b5lVQjClf1GX9QvfHV9RzT9MrIilfi
	 i+PNuQn2pc30xyKa7WH6mmAnC0RiXaL0mDo529d22RF4tSbHMnge9HDW/A68oVxiLJjE/
	 KThTsy/+/uWb8f1aG942Cx8FB0NAVRUlL1dDBU29v0BCxI4wa23Xq0CxFYannew6OQYAH
	 MQP1VVhJhrjZp3S/ScIcVfQt8pPISke/CVWIc3svZOKZKNAgeKC7DKNJwDOwphd8EHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFzqB2p;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9173E606D821
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9173E606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFzqB2p
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84621d8c7aaso15316a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742014; x=1794346814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=ezFzqB2pNszwv2nsMajwEwrlsXnChTPseu0ngTqhGbRKsfjqRzQDp+73bjr+lA1ARJ
         NNwz1/qfrk5c59LHztMRDIA1vsRyM/VOCaOcGEOJb1GYnWqHoQ/4H1VK6BB90Nd+rUrv
         1YXht9wxF8gl0I232NhMFI94NrdVB4kLpQQklWN0eXedK8Ey50KG20MgcOT9A8Sd484c
         vPeXbqDSLSIvPz8mX6pLkGxV6RATZ/kDccHR8alRRSZ1vyAhCwtoOnZP8FBkX0vMCMAY
         nJuZjNarJnEyQCW8yTnVfo0Q9XkFRZ4Zx2Eo32tcvDwo53WnuMmbEExqyOv/Afdp16VH
         Fa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742014; x=1794346814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=F+5wAQdJrlzLeiXxFwrYWSgsjTh64Sy3AalKHooSy88vLKmqlGOspqQoxSPkXtCyqn
         2Uzfr5m51xJd29Uy+cZfZq5NuoEE4BfQ34dTCjo+/lg2pNbpoW55t8gF/h2RpmRx62BX
         dnp2M1IUTQKD8Vcl6UZj2CofkTV8A7LBrlKjm4wZoU6TUjcF6aRevHEl5ra4ge7SjPRn
         N/sf99wwhxUGVnYIgdANFhp0orBcR4zdg235ml960PfVUvx9XxcXpGg6Uk6ulXp9h8NP
         pr6C5WoNwGmkwqUO+ZeeYk2U0/1rEJ6H8ZOIIjwzguJedUqWt5FiiYkDCrJzFHOktxWL
         gDGw==
X-Gm-Message-State: APuU4Z+M4DPhfBGkghsJqctvDk0NApdCcbBJJ49CeeqAsO2P859Nsqaz
	8R5dD1O/7NH2tHuzCDnOXl5EccQnPjdg76JgDu/wAoFaVzhK4+HVRYYN
X-Gm-Gg: AYBFou3o7Od6/kN/ubhSYYdHrQDuI0sZItAAbTvcvBT2gsbBYHCKaaxycxgofwazbRo
	xsqe1Pz6IYlg+2DBR9o34VTvOBkYKgz4aEUR9mcIM4WJDcXQ6H/Pz/wJWOXvXFXk+9XokimZz/1
	rUpjqQUiOKqapUjqImAJ34JD/QhFDNWW/gA/3Zv5VXQb8OgIw36E8x9LcOMyYgmvnRfQCRS1OFU
	a84lFo/71dT1efXyhT2Yjc7Y0X/jBF67sqdyAOckn3fPP0GPFpaSPZI/UgKDr9WNgmS+lkqdJFR
	sZTE+kTPVgSvekVQ45sUwsaqYndpZDd72WEsE8Kpow/K6lBSE4d0Jt0VwDUGR28vMGQwiV4afjp
	WlIWsxEEF0ZdDFjzVYAI24+TX2Tyx+cADCzf58IqSeR1NKUTMoUjeFnG8n4fAcg8BZChIjQxaeY
	e+DTEvoDJcihk8A/nRkt7eAQ0n6KirNejerZ3WAfb4cpHe/cj5qtcy1eltO18mtSdiwn2aUn4ll
	nXDGI4ju0irn2mVARWEVHMheMcnWXxfhy6DFaCZO7tWNdjsLTWHXPfCfs/8HoIN/UKHt7kxWq1U
	VrFSM7zZQpg44+wGvG839uCSO47qrifbY0aa5SAdWqLIC0x80CmpdvoJU9oO9wLFZ3C2DZ6qMNj
	h2ejhwFK1ACvSOgW8dDQAUfYUKZLcH7vYQ5OOKmIVeFjMDMsEPZcewfUvqTgQ/fxFuLemTL92MK
	dWFYbd6B5c+ZRsExBJckOyaEvzvLXH3aD1u+QaJxsKI16lwFJj6Acc
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr9603574b6e.36.1793742014606;
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:02 -0700
Subject: [PATCH v7 09/12] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-9-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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

