Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C294DD3A1
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221176; cv=none; b=k8b/UuapSCAvfcMvENSPNVwu8N0C/yaFIrL0Uo/sDaZpKw4W8HEEGWJA7Ok/m/r0MbQCDP1vXug+HfU5J+6QPCCFxA+UqFZIeapnkYzP4HJDfZ481o92UC3xyfWNEuWpBuu14FAwMxzj9lC3XBqYqHkPYiXx+jLaVBqUsw5aUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221176; c=relaxed/simple;
	bh=RteOrGLlQTXAnYWg5zjbSnYFrD1pgoJ54/qMOu/aInU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4iBSDMKwUHDR2Ph42xeGP4iWTxe6M66GkGeBWrBRq4WueffgXovYRaWToCfdixyGKLg0A7MVNVuKTHJPNOWJbBqp4IIe4s/3B7Lm6iFdTbMsjjoqnzcz8gpsCovOtLE+MYnkW1dxVeESkFQ2ORJdp3zhfgvQ3hq8gZkM0cfvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssoQqnrS; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssoQqnrS"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-66e4aa8d881so1828362d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221174; x=1791825974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcdQtERBvEEEhQkX7i6RjlhDSgKxE0CpVxD5Gi87UTw=;
        b=ssoQqnrS9oZqdE2wLjqbCqYpW3uaMGwbUYtTR216b31V+vSNQf4RrWELEdaNBW/5rI
         VlSL41I9SIvlDz9b3p/lZsNNzV+lMNaf88UKyEMxK0gZ8NrtJEa3mflA+SOxOJdZlZWO
         MbNr0cHJ1scG40NKwLqOsS6kNtvzCl5JCiJPAn9VVnXnQWzZO/+ONpwyefwbRsHRi+p3
         RKhKgnK8UGBhyKXLUhbbsECt+eIdWJl4GSwLbwCO/Z5ATOSJMq2i6pW3qKpO/6frWPZa
         E2qbmBqoVULvaUyT8rhV/4rQTSjoF7UET5fvpKWibY1yF7GocBYDvzUUV/7xsUvaJj9s
         8RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221174; x=1791825974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcdQtERBvEEEhQkX7i6RjlhDSgKxE0CpVxD5Gi87UTw=;
        b=k64mTZ0+EH19/3cNADY4Pe3zVVkihyGRbL77vNAXPkVcf3GltC+kAZyJlCQMPTVMLO
         zgH3ZBCZwzxzBDNdzZ/jm68DogaEqQTYCnq9JlVCAug7QrhuSLwXT/fo90TC+mdnezWx
         qHvE6irAb+F+a6KzhkrtTAPe1/nMbbhnwHLtBhJmOyXx/PjKCIcN3ZyQdx2hobPuKGCc
         332AtbHgnNSKNWRSghdzSnhbiLG9XcsZGeTmCCOXazCRNLpdn0ihUh0M05zoBBluI9Ya
         KqQOMmkxAZViT+bz3cYm7m/+vy31VqtSU+SQPI3hbr8lWjVze5WHolsz+Y2WAhr6hv19
         1/vg==
X-Forwarded-Encrypted: i=1; AKwUvBwX0hThGFnF5cfI7OkhDGKeW/QHtvRq9R9TwC4sDCoPZJnG0pSMQrO5AexX7BMCrgKT6zPOiR0jocOZVq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmH32M4UMQ1vnVX418TucKtKsX2+HjpudwoN5kSU65mFC2xfrw
	Q+tMIfp4AWGF9/gFp56jCqbI0ChYnH3/i8ZcL8yql+gMkRy64W+etg5j
X-Gm-Gg: AYBFou1Z+ZCyPn+HsfcPlv2dvuk8X1KyuTyaA/xSw5JNPtqPMx+spj2woJWMTlevdmu
	nKJttoWQCttOqibJZvRU6ZvKwINDQKUmw2dZyWFYsUr0gyk1CiGXgUYA4/6eNTUcyvHmxssCagp
	/ahIGWRxZ3uEHn9JCOpBksnyOZQCdPLemi6i5h/7FxtcKcD+0i7e3synHwd7Vzrb/5GwSGAJ1mq
	w0G3Itk236dK/ALIw8iZprSQT/zwyfW59213OfjQ6RGFWhexax2m+7UsqibceItFfXxGQ219AVg
	vlF+ld2YGmd5L0EaEo6OmucUlGQsCCWcRtjiz26TLC9oratbmv1j88gqAYFr7ffSyggosHzD0/S
	8WwEBrDCRas05AEU0RwNQhJRJi4CmSgLSEWqeYNMxdcdF3pWUIT/xsJ0iuKusDe4DxKNfumwx0M
	zpaZwvrsYk0NnzGKD85KBrmP/I2H+qBT8CgDCYjW4WlIHd9R0/C6p7LsBQlKcFtfu3M7Q3t293T
	tZ2JNY8hoEbFolLiWZ/NdGx+F+PqCb9i9khkaPkyuyF2DGePQhz8X9/Y5EECdQPRYhiDWkVcuij
	AO6MTg==
X-Received: by 2002:a05:690e:11ca:b0:675:5ce8:f037 with SMTP id 956f58d0204a3-677abf9bb0cmr4946331d50.35.1791221173929;
        Mon, 05 Oct 2026 10:26:13 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:26:13 -0700 (PDT)
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
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 2/3] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Mon,  5 Oct 2026 14:25:37 -0300
Message-ID: <20261005172538.398522-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A733 UART is a DesignWare APB UART with two SoC-specific
differences. Its baud clock is the bus clock gate, which can't change
rate, and offset 0xc0 holds an RS485 control register instead of DLF.

Add a SoC-specific compatible, with "snps,dw-apb-uart" as the fallback.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 86dc25919311..aa8cab5ba3d3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -51,6 +51,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun60i-a733-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
-- 
2.43.0

