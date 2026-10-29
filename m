Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299660;
	b=IZFfjs9w7RMlKc3Jr8P06EbgQ9V65cS91KG+aXwWZzNFrH1HMRnkKVxqSUS4A2Tgamah
	 SRy4EQNmdelyuxvmiIVhbRTstugT2yYA1EqAe3qemLLiGlRl/KeLWWpInwLjExrDsObfn
	 tm99JqvioeHImtyFMZv3H1Qdc2nYDl9kXw44H76vQpG06coiDHIHLWQE04E98zapEVOSM
	 AGpJ3YYtgOyMpiqMpNa1K+hY8ISz0bg/PfEP+Sw3D9C7f6/griMay8ZAyaxCVDyVsU5ZY
	 M0zKeVl4TlO6nx51SLEw9tjBT7zn5C0Htw1/xuSc5wayxcPQGH55qhLhdycIP2vcUJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
	b=2Zq/Amt3qbGQYQ7xm/rJlw6EeSIbWcK7XGbwNX9rx+uFBVRKjW3B5jad/vFIbm5uMvx+
	 U4BRePKSvuQ8IKLAcn0+GJlPLWsbD5WZzgb3Y8rKIxZfT5JfX9Ym1PsHVDjN64TaEJaaG
	 okRVvZAPWtq31SlJucgGk1MmTeS2Y8jMZGviByk0d2uOZ8+UDIroTlgXZYQ75IQMZrJae
	 oTsc1tWodwwk8vqfRbrlMpayeUWpzLq8fSYyXlsgDuN5LiI/cJdC9sxR7hlewIt1brHU/
	 Db+EOvsXQYnIsyfuYl3RjYXj8ioAH+0FTmMldinLlS+Cfygo1Tp9YecPPqahR/86RLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3l0uMc8;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862C60A3804
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8862C60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3l0uMc8
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8490a7d6696so1535197a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299659; x=1793904459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=H3l0uMc81HJcpPRBsywanbMbUnGdCuNIr2O7sufq6Z8PqEpFB5X0btCbPE/TdARDBh
         9kSGajs9GDRZXaveRdkg/z63lGQOMQNGajXTe39Orx2zN3WUYlrc6EcS38zyMhEnzFeX
         WTDpQ4quOeVVTFbep6szXGXMMlLIjs2mGrFz7yTe4i61t7yLR3iUWF6HnExXc5OiPEv2
         yT6PXCxybLvwe8InLzlvztmydU+pJlQtQcqsUhz4vbALr6kC9FsqlEuEc9rUOUuKspjZ
         8DcLmRVSKZszIIGaBLRToY1a4gQhkQRPhU/Taw6JiPqyeZrc+WnVuRAB+VB9EbqjvmMd
         i78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299659; x=1793904459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=v4aMsvEyY/jg5QOqxPd2ou5PJfm1wZ+02Q0wu9sYqfIi36X0/fKYVoRUAdH4gf2UTL
         K/5JbV/tPVLadEzSfFbdjJUON5AAoeG85F3n7s/jYY4jV+lHv4WreJ8hMPe6So7B9iHl
         2kEzFs/jIofMFzaPljNvBujADTUw9lXiAsqjGQVL0syusQ4stOGg/pnYDp8g0wQsd8SF
         pqHsFOF7QTzZdzfMz74FNjmDMUblDEmGu9mJUKm/NW20HRFI/o5KOVWceA5UVJuuuy0c
         fUT/+INydJdCpYhaXnECEq5G6iFYZwi5OTcYE/2OwqmXAvNdifssej8PGwlsck2zCZqt
         fyLA==
X-Gm-Message-State: AFq9FYIdAYE8TQdVOiT0lZZKqo4IMC5AaXeMxTsSiRXIjowKbRfqbTuA
	pV9HQ+bTb3HHjz3qA74k7puB/xNvGorC8CXZFrxIOT/zkdUqyHPtAVAl
X-Gm-Gg: AYBFou1cFuDdNljNmGfy4fQP3/BjevQvTw1lwhVWQaoA8IYAHZMv/hLUMrzGV84ZlgW
	C+izia21S/G3xEr1oBiCGZOB0FsICcz1B06J0HyTyN5olFnpGpaqj+RdM/i9Pb3QFVzmWn1CLDB
	/fmNTB17jnv7YHoMqNVfPnvZYrNQ3Oyu+8WF8yRLFDVp6eHw2Sc33M/7JHSmhLqcEE8l8p8k6AQ
	riw8GL3L++W9O0WhvXEsfgdcxKfa667ZHQq9VSTrBTJHY3PXb0yi3BtV6RbNrZW4qBzm9OVQ6Hi
	gc4ii01E7AE6pQlfjFwmhUXnRntK9WiTXBRvuvhJDOpy/973kq9unIQKRmdN/nsZ9IxcSlz8oR1
	NF/lpPHHEy01gRVeM5OMVjNTpKoya51uLIwQhg88fD30ljgfiHYQi/J2k2FotHGob19KMZx253t
	gbV6eL6FcwEOuOAeyosrjhfK+/FYvk0cUvHcA6l4eDMx/cdQXKuyDqjEtjwDNdV526mfkgnY7t0
	eDEcadjgLk1n4Dx+cTZJlEiVZ92ITlvXPcJjuXgiLWhn1Bek67XXoWaagC58cI8CD48mab0oeEa
	EediYQ3GE5nTBnF/qvuVSijE3yiPwhaP1w4T2RQ4TRqHu/0hklcbXOEYMtbZgMOQPQ0XSbhhbeS
	jxDODNCV3oNs+EYhpLsUTE4AJoFBc7b54zHl8bbDOT45DpNCL5/JUj4Vi3FFfcLLy4CEHE20U/F
	cYCnJ+oHSDqF2PeB2gn26uaSRkgkh/oPRgF3IsFYPasluybCFYDP0=
X-Received: by 2002:a05:6830:3153:b0:830:43b8:72db with SMTP id 46e09a7af769-85d365ca9a6mr29214a34.24.1793299659371;
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:27 -0600
Subject: [PATCH v5 6/8] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-6-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

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

