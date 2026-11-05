Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904963;
	b=NtCGPM5TRGgXuQG3qKhJiwab2yyBRcVkDIzoMFjUXayHlw8ycEEBCrJusjLf1P7OmJjP
	 BwX4zmK/2xQ6BdKygEdOXCvpSTTpWK/INPbIdBiVEFHvqpuJixmeb4sOTzaeIcjVi5x76
	 IIGDzeyRGBgDBIPIqiem30CMqdrFU2riXICWg9Y8twI/W2EQV6UwmDSZjmKFrv+otqoWu
	 PMwoHfglb+aa0FoQ5KtcUhcKhZB7lihI1NRW/khlTqNVAtQRvBfNYCnfadnarDo9QoXsR
	 8BIspw35kEc1Ic4Wh3VF2jEru0cWxgqHB9XTNh6nIsJqtlQhkwPp2E7uNx2IBrUmi+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
	b=U2AdZhvYaCFJT6DQIfxH5KAPT3u4Rm1gSfq9mOVdl/oVy2doVuW4YhHehHMkEVu6t/UW
	 14wQgCBcZ7AKxbE91V9XW3N2sSPRknnZAzRTdxUoIgbtTKrLbuoI/Q6JRsMd2d2mt2nzJ
	 xlU5wRhLhp6U76EVCoQ1kRqGqkGVohV3n/kYNMhS1V14oCVnmVABROe7FdXlNA+tD6xCA
	 6OJ1FZH9LG3K+GW6nGEJC1C8JQBuc+BQKZyfmgGbagDhSzfbX1x+LzDeAUMTzBVKXmip0
	 UgSNsN71UjLoicyxn/1cnNW7yxwYSTGDEGSYOqYA9qM2ECDUjdMuyRAPC5j9EZXtuXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzE9vvoW;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84911606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84911606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzE9vvoW
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70b875f6f1fso2047579eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904962; x=1794509762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=tzE9vvoWdwUEP8232GMXy5iPK/RwgbnZdEPSEeYdEQ3dG/wXcDgCtl4UtWr3Ny9KmT
         I6I72gq7gx0bkb/QHwVRnzAV37IYydpoOcVLmTyDHlKucSTTNAuKloUFoTAujYWSxFKb
         p2T6KvpOOAnXCh8J76LkH5LOx2BfFjoz89f30Q6gjrvOyaWV2vWZFV2j/9GwKi/6rWRH
         ayfhPr6aEDNyFWGKkzjyA0hR9NTmIiDCWLFlvrkyUejKAowvdtJ2ZZOISXSO/XyMISPn
         E+Ca6uAJ4rd27bE/0Bt1YUeTGI244/qRqAFBzaSi9I+LR+W/d9mm6wgp2EXQ5wTqgKpr
         f3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904962; x=1794509762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=j+x8/gtyLsHV1+1hGnEW+Z9hglKDlkiIjJA+6tSzDXoVLEoKv1GIVXNAu5HFkBreUw
         TGl6xAyJORwALSVGlXiW7WqyI/1C0h/Jvxj6J0q+UumSzmQSY2tYz2L7zjhrcT6/T0yx
         sf2rlmfLPUokSp8ialABan42ZLnyo95yoGFnMNNXenNsVSmCeGH0W/FBhJedwZk8PIXR
         Ky07rygomQUaFfnJdlnWy8N1HA6SPNCmado1zxYhuCRZvWMNxNwU7W4aKh3OUUip1Qnr
         wLBHTSRll03yWWGLdbX1GTEZDE/uJsXUEtV4xMzTq6uDqowKQOWj7goJp8ZzzwOuqQGT
         smnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW/Bg7taYGAq05/Xqbh6BJmkEFuHASJzZaBZx+SM37xRbMhE1Q8vChj75YU8tERMPMQdY/M0HMvas7gbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cao4rLkrmljZ+r6lpQabl4Dd+yLKh/xNZ6StYOEpt0qGjqLJE
	uC5KbfjaF4wVrCHNSp/LdAWGwRnC+XfwaUEfZMxnMUeEIctHDViAmaNa
X-Gm-Gg: AYBFou07t1/1XPCMV6epUsNuMapj+fL5rZLp9qUJsLHylJp8uqHt7/Uy0DXQ4Hg/yfo
	/Kw0EUlFcdVJ2InxI7WJRYd2cxgG9GoZ1B44wwoUm7cQ7wvwPtf+xbuGkPRHtBBnmKrNXjTWX5K
	rLs3UnVLemUnwSAzp564R8d4FFfqlh+K0pM16ZLhKbhJOAPm7oUgguNNqvLTw0ZcwJ5Bw+W0Yr+
	mhESvgZjnulySNYp/WaYAWOg2WiPzqr9KxZ2wEI9e+pWbmz8FDUmqGaVTfac9ePNNWBIbTBGSHA
	6kCubXYCNNtFaZnVnzIqFkTJy7OQ/wLGb2Cjmyqkj9KMa919mCaLeeTwmq7W5SvI4AhZy+mcG7S
	jSFB9IyTq0xLchfeMZgU9VBLUK+SpMTBEm5j/NKM3Tu+hHnaeNCZjKpUGSvdDx4bnzXIi9ksll+
	ZFFIjeh55QiZRx2PmudXqaUWosGEYHfq7JYPTWxPsZEyK8o3Ozlbh5SmslhUpxCmxdKRnUKazV5
	jaCnCF2gz9w6zONrlFZdOQ4WPIas09WBnBPgtAqLKivL7q/NPF+C8noulByZj5MVIwhkPmUd+Rr
	lX2ka+NesMdTUEOEICuy3Q4A4+P3gSUdUPd2oLTuE5BCmHBoFaqADgsq/w/KoWKsGrIFcj+9Ynl
	Vlike33a2ioTFHsVAUHb00affN3ee5rnPNFob9IDHuIrNgq8pMeRafQ69p45YpUfN8YoiTzndbS
	LGlctHAREVOz28dhpM1CmfeRXpLWPHaiiU8R8ASHzzDqTn/A4lV3bo
X-Received: by 2002:a05:6820:c91:b0:706:50ad:fd7f with SMTP id 006d021491bc7-716e7b33226mr291273eaf.87.1793904962431;
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:36 -0700
Subject: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The H616 NAND controller needs its AHB reset to stop internal DMA and
restore data ordering after an aborted transfer. The controller's soft
reset alone can leave the next read displaced.

Require resets and reset-names for the H616 compatible so the binding
describes the reset needed for recovery. The existing H616 SoC description
already provides the named AHB reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..ccf616fabc91 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -119,6 +119,9 @@ allOf:
           minItems: 4
         clock-names:
           minItems: 4
+      required:
+        - resets
+        - reset-names
 
 examples:
   - |

-- 
2.53.0

