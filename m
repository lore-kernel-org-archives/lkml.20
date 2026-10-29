Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315641;
	b=Bh6tbXBxXbcwWuiaL5SfPgxtyA8HfvhzbeFDOfWPN98ouvOoW2PwrGxz+2v64Y8i5ZkL
	 B7/cIE0RseQyy8Q2A+2GFnzSWH6Vmi7gvWKMuUNKda2hVCRosxh5YNZdQ2Yz8gajsL85J
	 R+SLIwukfyi7sPU2U8geguyVaRhikOA/ZRHmHoxkNaaalIrcLx6NYFk9EAvxIEDe4uTsR
	 uAuJr3Qdg2gOtot9xPEGdVktpoGssQ7a0RnVf3wlT2bExBkks8PACDUOvaJWlrvHebhaR
	 ndSTPxIaQg9J/CdDF3w2iAQtK4ntLI8lI6oGyvWYYtudPpubCsq2fTJaZtPNnvlDNLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
	b=z5JeTV3jbntf/jxbgOV3gRVTe815EsR4Si19bnW2u9hmHUmQ7/47ozUd9RufpOOmsVrs
	 ZWESzOjElxkeRQUjUN2gjyuEFrE0gI9pOpFHw3LWiSZEV76ppltq43v45n5K229AOrQr1
	 uufVLBmHiG6CE/+MsGEq4CpzBLgXLoQjTAPac/HVm6qF/G7F7wXw7pDVqxCuUpqTJMlVt
	 s8u3/gGchjscZgofgg2u62fOPN35vLaLAiA8B8xX8qv3e4YOKK5cTlW/OKydsU0D+BMPV
	 YzWbX1fQIhEsIQRUhwJIQwBIOGnJUse6RBTlYzlghOpxCBqrxTyj7qf+p/rThTfCVfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTpUT7P0;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDA9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTpUT7P0
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so289804eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315640; x=1793920440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=NTpUT7P0WALtnjRSQA31Kc+hUvpcCorxcI3GquI97C7zXZVZuZmOBtGw1gEKk35KVu
         4zwoO5zE0QoCbAZjVIpTklAsL4dpaCwUn68rFJ1oZDyu7+4VMD0V/B/FHMihp9T+0JHo
         pPqUrfEAHalGu2N5oubbu+nlweGLXOyS1WYqiTe2wV66VjoCHjZu/TBv3O/YsSTjzyy7
         XX2LinTNatUtFW74ZUBL/K6qf4YqJUGWOILjVFgQ7Bon3dIkl03RUf4nyXQYQ8bkSW4R
         QyJwbgPkKyarvRmxmVoV1xilA44It7GcNvlFDhOTHrudsF7mVdXkRSn/n3rGOcpWNmWV
         3Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315640; x=1793920440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=aPh0KOHMh6k2or1CVw6r04za8eLLNPIA1HOvA0Wrx9ntu8wDWVj2lUHdx24sCjeOHU
         pDHRQd56yKb92TK8IUeXqxCpy3JwKa64tZvSf90mgeuGzDizMFkkRZ/DVV4utv0HkEqy
         zBZUPJ8jjF2DDc9GqFlzPZqfbf7uKy6yoZ2qLCIJJaokkY1tzFd4D3V2ZVVB0xSR2gLw
         kGuu9RoXx6ggA29mNaMhFzfOkbXX0yZqvOtHAKLhBVoIG4aLSKnkTiclFTy4leo+v2kd
         y9I13kWBLGUml1XYKMUTLTSSAtw2vsk1s+qmcCU2nFJ4O2Q47GvzhKcO32zzlKI3aiSl
         +KiA==
X-Forwarded-Encrypted: i=1; AKwUvBzvG6kCMylHPy1wupyYA9Zh/iv2XMfu0aoyYjsnlJbAJN8t4JDRyOufqQD6iaP23LLzTaIf3Mh+veI5+vA=@vger.kernel.org
X-Gm-Message-State: AFq9FYII8hRXuD1JmzOv/jrnllsrlmqu0H/8EXSPpyq4lbN4hhrjydNx
	4xjsrTeVOLAkLOkiuI7iNa8qAg65bjj+wxEd/YyA1O1snFKTwD7HG+k7
X-Gm-Gg: AYBFou2kiPyBO6tnNRgsQb3z+9Tiu3jfReTD2CEtvZ3v2ww1wWss+dac+9yjXlm2/cn
	IpiJOvOTH6UzIepn89FgeAZJ4XQoXwVN2NyvFkINRUSD18nRoGxtYYxhmCJWQieMBLwkJ+3I/ut
	9KKF6ovHCdY86tyVharDiWvAQCOW79tRofeKlUYDM7cuNEz2/tWNZmvjawGywFpmU8NyyC3VdhT
	aivQDnhDBtyldUNIIeTpHexr9MLTrO8kHijisN9b9hRezoQ+WbB90SlX8/fIj0wP0ATBakJWJmf
	jWEvU7EP0sjXSk7RRGDfu7bosYtkvSvEW/4/XAwd1Zq4v1gg9lnk81kOGL03I5ALhJte/Il6lmH
	8Ih5mEUDBOHlRWGJIYCqvLBdx1jYhWUzDkjhDu5EsGIiGVfc12VfOtOCPcL+j+HLdLSH22rub0G
	LmuWo66lqE2eaL6iLzQ2TVD12AF0b0W5lmTr0GzzmvCsWveMnVK/ag4Ro50XajH0YofkHHsDxh9
	5KhVu/LiiPtHdKLz2bssYEJ5HsGQd+6snNwzdG541NuhNZkOkeio5wh1H9djeziVLnJvTpSm+Tq
	a+BxmP4FpWD5yxtCQG5z1CoDZSIJ2tBAzZmc7CteuT73e0PLHJ+sWrtyGNSyfANC6g==
X-Received: by 2002:a05:7301:4246:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-36a42345878mr1118524eec.10.1793315640398;
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Fri, 30 Oct 2026 04:43:38 +0530
Message-ID: <20261029231339.9497-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
References: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes in v10:
- Restore the original Acked-by and the alphabetical compatible position.
- Revisions v7/v8 already carried both; their loss in v9 was accidental.
Previous series and full history: see the cover letter.
Prior binding review:
https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..c2275d7f4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3

