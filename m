Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312E568554
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000486; cv=none; b=dSt/7MIR7q/iXKSaLC7HmnSKdwtxr/OLuxpjPETVaHbQiCupvcKP6ySRFsjyJKzXShDT3tDUIsD3Oy1inLA5ZC5DJ6EB0awodhHPFoUrLMqSHx3DtDtOvqPOP4RGMLja6N/V0SeszwvbkSG+VBk1YZpvuuqLlxHXmK221HrfQ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000486; c=relaxed/simple;
	bh=4roB2H7cNDjO/LXIqC2XOjpQcaxJKWSUGDnr1sFA2T8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GohmgRvUIucRewNmXH/MiOqNLmRlUYMik32q6nfguqruomhz3HeBDhAXsxXWZ/PXS09g3Wz18DuRtRzMMPn7wS+xhBPZJ2WZewAHZUL50rJjcHCPMpIIXaYEQqc3ryS9MLBiR+elgjbjDD1ymRZCJf8WU53/29wRb2t5yyyz+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ln2MSmme; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ln2MSmme"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso24400145e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000482; x=1792605282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UtlNA1xvJFzZ9phCn25F8LpQNd1vSbWT52wzAm7fk4=;
        b=ln2MSmme8lhDgQpY0Jsb3vvD/4tVM6BZEEGywrKdnvqw0XeiR/jCrBL5jb3S/KFggt
         nDPSFIUxSKvgJ6ul5nbzR/zXHE7051yq72YaTgWq/iecwv0Pc6AGhOPFDKaHPmUNVxU3
         TZZE01Lic2tPdi7BYB0Meg1deGFuFvauP7MxjE+Mt7DGoxrOj2GQ+GMdm9q5xn9K+Upd
         T/e7T0eCkJtHzlWx+auuMl2bPHB7L1X3aXIB7nwJyOhzieVPz52es2GstddpTB29E3jA
         UMM7j99UUhYn8MjpvY55RdJsYWj/0FtRv1KT91SpsoONKl2BItLR8iZbmtc8E1ewH6YX
         WszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000482; x=1792605282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UtlNA1xvJFzZ9phCn25F8LpQNd1vSbWT52wzAm7fk4=;
        b=ZMFItiRf0WiRqs6+ptQgpk9jGV8Antxmh7g0Ie26Y43Vnfvxs63JyZISZeNfO8zTFb
         PYUQYjxwOMGinTmxSagXamoaKdYBf+1p6TvAHH5Bc4gHy27IruwP+ZpQZsoOCI2+cw+4
         wvKUSqpvVy2FZD9QA5ekT1Vj90l/0C4NoyQHCGsjGz4UDq17HhL+MB03PrdHLVTK4d6h
         WgF/icWqksqbhIAoRE8PnRqJV7uEXVXcxrtT5J9KWlfPnbCBTdcAXiGX2RmK8H4CAMlN
         gYV3svDQNkABXYnIyhuV5/s8bezfD1+uSWafFc82AGmM7v52NfY1dA6jNFghe+SLDVPF
         ryAw==
X-Forwarded-Encrypted: i=1; AKwUvBxO0vLjd0MJogC4ran/bc173nVhnngBELMIOPQa+dYggVV6Un2wP7IONQipmrwNUpzNDVUfYnWAaU9JPP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIyg8jjT9XvF67l/VWhhmIQXDTDbxkEBmlpD1KfXzIAPCaYwJ0
	a3cDiZFuUaPZJ0zLMgO6WN3T3go/QacrJPB85TLcT4qISCu+6hDiLEZ2nPCccCNDAro=
X-Gm-Gg: AYBFou2glSFqx/mu7ByQ5fe45vvse5Bmx9TF8nOeyz8uZPt3aDNRvB2n5EaO4GQ4WtX
	KX5lrdS3fi9cevpKRKljzKzpuIlo6qkdi/w2FdWsQZByrrU2guJ9PeGV9Jfa9x3wNw1qkug7+OQ
	ULj7JCXelcvX8VFDJshVQtE8nFQ+u7v9a662pPELKYc68pW4G3tDNaPNyrU4K6T7ZU7/cuzojS/
	ju41xtq7+RpOMS+FONKzqWknnJec6fUYdR3e0yWps5ONPizdGe6CbRJ6sEZ8CXhdDFvHFx207La
	vd3KTghfy0B+auGmPAeaCukWAFxOr9eOtYH5pjzouzXeaOB4rMoTvhaJVjYi/n6cgpvmthN7yr6
	s7hapg2hrabELF5dk2P0t5pLS1rnLitSEh6H2Rxnc+t6VOGzoAJNnTRK8LQvfcXfkNZlZ7uPmMf
	zOCK42OplLDYcMJdRQ7dbNRBfme8UJIHMGnxWK43ZY+Uzv8TMdRxdVQ/Gs+AR6e1Tt059774ZyD
	gqBEXT4mkU65vbeYuFe2rE2hxWViwAqXuRFprMezxTdA1FWWg==
X-Received: by 2002:a05:600c:1909:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a18e4d5412mr370442525e9.30.1792000481482;
        Wed, 14 Oct 2026 10:54:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:33 +0100
Subject: [PATCH v3 12/14] media: sony-starvis2: Only update bits for window
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-12-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b6c08729bc3c..86f740e10402 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -88,6 +88,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1458,7 +1459,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

