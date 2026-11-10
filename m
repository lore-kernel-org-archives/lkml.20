Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340375;
	b=CEJ+ZR5zCa2ejH88WRRSlmS4Mi6k9/JrRLzMwzg1u1tLdPXZ7SmLkPZHd7aQsMLPzkc9
	 cvTDmf5b0AnMzg8MVRq7oKRzI8Q7RpGdnrNmJjd/hvQ5oF1yyF2fkPRs6A3+AHZvvNjZ5
	 a7s1jZ9KNYdKLnYqI7ADl+JFkYL9+gtgBTFwwXZEs8nDUjRZuEndZSwQh8bdCAFogNYcN
	 zrxZpYviZo9mr4y7Z3YZXfYG1Rp3wtM4f5a1fVVvdjTa6XGiNPv/CHzVywZpPRvKhzRpn
	 MHOloS4ErphHSLSUaotmNXPulaqMR6y+qw4FSE/xLbqSWpJlWKViZcrp9mwo9FYAldQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XK0glUGtYh2qenvIp5qWYb1mVMZVDWpeT01ZIqCTHss=;
	b=xXq7t0dtLGmWAM2SX2wMFmErZoqkPRuX/HgzLL+1/R2vfG2Vm4jjidFH2mry9AZ4h+LZ
	 e4zlu5lBHE/IdMa3Oo27TE4rtvGeQjdM8N+CDnBIxtw14QptO/Gcx9tY6cOSaU6WX50Jv
	 QiILSWyj5OPAlaztnOTGzNk2ULmPOAdtthzvL+VkiBUtQe6BLAnfYaVt60QhBqKLPJMxI
	 Rsip4jiFJDCFRY5ghee8Fr8+daaZkhP4t1kSaXU8y/NmNVNq7iRi0L9h8vtgXWGFelfJi
	 /8K4TSqVmWOJ4k+IQFXSs4EVRrpWrwXZ8lAxwwtEXx9r4Aih937Q1VZy9/LEbrEunuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvKc+S5C;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C7560A2609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C7560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvKc+S5C
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso281821eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340374; x=1794945174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XK0glUGtYh2qenvIp5qWYb1mVMZVDWpeT01ZIqCTHss=;
        b=gvKc+S5CLxUYAye0zrhTm1rEdr8R6KJpXFKE9ItC4AUioMkqErMof+XzlAb807xC/C
         yMMaIFlJ1xsWUD0ThK8F3QnkoR6BnB54EraFAvsLniIthjoFsH7MeMjL75sPC8q7upLN
         PAM5JJyKuCUAjzJ9xBwnLkX63Vvd7CSKh/aQQNYJWOtPhaKGrOHFYcpHxFIK/0HqvcOR
         XR0w4qKtvRSdy4ieIolCIlJ5BEl7YRj4qFxjy/9YB0EctPyu9eUttLQRBm9vWRm2C19P
         tbEPN7nmUZH0jDgL9U4zfy8saqUImMUR7YkLB3vbNHqeYZj0dX5OhnKn+prhAskEjynu
         F1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340374; x=1794945174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK0glUGtYh2qenvIp5qWYb1mVMZVDWpeT01ZIqCTHss=;
        b=Ua5u4uxRwzOnEP9na5KlvCNLn6k5hR0t6u9pCHhKoMQmLRGj/QkKvRpGuD78BG6DW3
         zTrc++1iKpUFBoxRvI980IdFPfB/3om5YiRBlo3A7toBlicRrYRxIQH0yY2kQ1mP1vOq
         TnpK3vah71Mim7f+DBXIazZFfAXMEkQMUN06yJlj6HEZ/YoXgZrSHLVwWfHLLxxOhelA
         A/uDxCqqyX7RN++SITj/AAS0pftY3WXwrdKMRP9QQXLfh9BhERzJYjjXDklPgQTZze/V
         W57IbcAYFX+mhSDKV0oXVR+Px3VGH0rUkgP+Uh1ECTRB0OKvGD34/mH+cRfoCy1eXuZ6
         37Zw==
X-Forwarded-Encrypted: i=1; AL+hErFDfCihgcYU6mTOP3401jkNqRQylEvzhkPY6yA4ztXQUq8/+vMDiSC0/p8dZJ8fIk+RXY4olTuv78lrmpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Z8BBzb8SeLuj3GQnihVOWcEtWCCQrMAc+sa4oExZxeifEHdc
	E1yGoZyUVxdG7+g8Mo+mTHMbvgY5vaz1hNJdB3GfbcA8QAnCEPSFY++n
X-Gm-Gg: AYBFou1papgyVQXdHw2oIZ3f26w7uoK4M5ujrkPtpanGMAm068qa4UAuJPFy4telHf/
	a7xeO7xaBD3Hfmtk/XdPsiPZjCshJbJLzZFBVkJ4npegHDHytUx3F476HK4f183mB4GZcUCXyOO
	khDxN9AUiVQ0C3cFGuYHglTAcHivfYEaythS9SuwCU2oGr9Hki5G+CthCAE9++xSFkzooxrQQtW
	FuKzbe4FdIykpbfhjtf7A5mW3ggQt6Y/YNK+IA8LIn1UQP9cKOYS3YYk3TKxU0k7LyOyOxVsZty
	0s/R9DV9kQXCTKqfPuqRST8CM3QXAQQTyLxAA1zjhv3k7xiWSYX40lO9ofIX185Vknxuma3iMGf
	h+nCWIERXftfu6THoSt6xnRJsByxT6OMpVI+OlLZUMQiBTQ+u9xvVR+Ww/s80ovsHNjp0AdCjPy
	RNdHfft0XRkME9jaGgTKt5kZH13JxSc4UonkO/tnJn+Vw7+WTDhGzmis1sGEQ9DXqM2+nnLEbaU
	yXK4+pCo3p2+4TXy/UQjkeU/NK//nGkEmJBSegQDA7WAlGPowd1cxb1DTPYFVF2k38uAlk9r8nx
	vj2/B9ASc5udlrBZ3eNsB/st6TCwkgooiCWEjT/WQsKWKEov66G+nVNDET5P
X-Received: by 2002:a05:7300:f547:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-376854b73ddmr592563eec.2.1794340374097;
        Tue, 10 Nov 2026 11:52:54 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:53 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:32 +0530
Subject: [PATCH 2/7] dt-bindings: arm: omap: document missing AM33xx boards
 and SoMs
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
Message-Id: <20261111-ti-omap-dts-fix-v1-2-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=2257;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ToVc+9KRI9uPv3z9Dm2qjNBtZIyu3nXqpyevUzcgwDM=;
 b=8WjKIkFnAI1eIHACbL0SOi2MHdaM4Wq2VK76kK3l3tauEuAJpu9+2Ey1BzgL4mnC4IBQPb6fG
 DR7VRvyxg2BC8HHrC6Q1bFOazeYDIMIVJbBfOSdKvydA/rBM5qZZyZH
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several AM33xx devicetrees trigger dtbs_check warnings because their
compatibles are missing from omap.yaml.

Document the missing AM33xx compatibles (Bosch Guardian, Gumstix Pepper,
Moxa UC-2101, TCL SL50, BeagleBone Blue, AM335x EVM-SK, and VScom
OnRISC), add entries for the EETS PDU001 and Newflow NanoBone boards,
and for boards based on the MYiR MYC-AM335X and Grinn ChiliSOM modules.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index f694dcbf23486..c97eb4953ed25 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,13 +104,22 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - bosch,am335x-guardian
               - compulab,cm-t335
+              - eets,pdu001
+              - gumstix,am335x-pepper
+              - moxa,uc-2101
               - moxa,uc-8100-me-t
+              - newflow,am335x-nanobone
               - novatech,am335x-lxm
               - seeed,am335x-bone-green-eco
+              - tcl,am335x-sl50
               - ti,am335x-bone
+              - ti,am335x-bone-blue
               - ti,am335x-evm
+              - ti,am335x-evmsk
               - ti,am3359-icev2
+              - vscom,onrisc
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33
@@ -136,6 +145,20 @@ properties:
           - const: tq,tqma3359
           - const: ti,am33xx
 
+      - description: MYiR MYC-AM335X SoM based boards
+        items:
+          - enum:
+              - myir,myd-am335x
+          - const: myir,myc-am335x
+          - const: ti,am33xx
+
+      - description: Grinn ChiliSOM based boards
+        items:
+          - enum:
+              - grinn,am335x-chiliboard
+          - const: grinn,am335x-chilisom
+          - const: ti,am33xx
+
       - description: TI OMAP4430 SoC based platforms
         items:
           - enum:

-- 
2.56.0

