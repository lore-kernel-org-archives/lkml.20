Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204757;
	b=loiby/k1xF8ukz4pj5F3X/OiEE3R288S/VbnTe+o85Pb00Dx1E7O0B1iWFjAYW4Yb65M
	 iuxaj6w3rFbfUrWwUxDxSKj4R0nZXtKpr+PtmToZcgYY4LOar/Y8agsN4rEzokqy9EOFr
	 W3QNB/VjexJwyrLpP3Z/7H5/pO2a9TAWok8xcmQHziAfA9Vh8a9ZhqF7S4x/qaL4IBBl2
	 zTBFgepum1vC4tUDqEi8R9ro8QYi3fQABQgF5jf+Opjjy6XBtqPzaaDoHPX1IoUVtfDO+
	 mfT3xa6Pe49OZYFNEd3576HLdgvlCzXyuhRMoZbmdhsCjN2GB9d5/RhLsRYoIFlHZtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
	b=2lKSBbqXlxoxveDu2vkG3Ja21SveT/A6vtPwPhz6XJnjQKfX/lce6uoFzYYVTgsBOjEh
	 0GHa2hAkBHlTTF4gNwQNM4uWQ6Kk8/RnC9Xm+TV15VCKa/4y5LNDVYc8L5+T7FMkXtVI6
	 glUD21tx0m2laDpvQSglIXT3tF3T4JjXVkVTyR3oK4TgJ8VdyNhEGocj9dqVpKkjNbKZ8
	 iSozD9nj3v85aQRhSkzJOTAzNqx0nTEAhcE9xEtP+HjFLuwDmudDVkgMp1QgoJS0RdQpo
	 dABp8Xm7yIGn/g/+cHj/BBZ+HMwnbhJwOPpaMA+jtPhwW7vEd9Q76ia3l/BDaRU8vOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypFOmIcC;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96233606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96233606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypFOmIcC
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso713713eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204756; x=1794809556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
        b=ypFOmIcCCXirRaYF2vctT7IyVr9bqprzHJYmx6d4kV/4990vsFXxGtvUxCVi88u2AA
         mHsIy2gDoqHFC38an+MSkhl9DBiuDy7+bsFW5UI+XPNpuzydlV3bSXozkDCk/Ir8Aoz9
         nB6VwmUJOpqPVywRdm/Djv9vFpv2Ze04xnlh4vZQVLynICxH1x72j+Cn2FY3+NrWhBFd
         zErbr73yuYHBuiKSK0j/0t8vomotfpUcZE1LQOFXpE3WJdOxYIWmpupKs9xCx4gBpWJz
         IVeRsvB5ZP4IdgiO2uIs9VPL65vdubBvZgSFFxf510mmZhV6i6uyFuS38wR7Ey4UgrHV
         iOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204756; x=1794809556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
        b=UhJJ6QYeaE/FpeTSOvbh0Fl0VfpNJnZG49iueM9WObeFeIFcYRmxO/LcKJTuGQ4s6b
         yfeQ+egbUzgirekeqcl2PmY1c6bvjVg60U68fWrAJj41kdX+oPD0Xc9GSU9Ied816j4S
         YKZEsXMmj6TJsDCpL/yjBRJbhz5VA/PnA+M4Ps18czheWxyXIzjeWJExkzC0EG0Qh6mx
         0xzbV+dAgJ8SKLTK3ZfP9vOtpu+qWIelMpjVPuv3KO0SWOl6ea+82NnbHirokMEP0p87
         rHCOXRtm2nkHEyq3pmXHD4MtAsrfIzkvnMLW5/4uQqRGxQNzq6u6y2akq/Q3jTYisErq
         /VjA==
X-Forwarded-Encrypted: i=1; AL+hErGtujv6O6N13M8esbA7FG4EjsA3dmEX7fK9wnzg2zTm3CEFXqHOgdrJou/80qvIwzTLEMvgECmoySsd1vY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3PFgnNP2O5tWvuX1WqBxa+e+cejSnjIO4ZPyG3hvrJTZ7CYHn
	pzCkdfjegOkvut6ehD3xhypy7QQhIvtI5+WlKEk9034e3y2xr+lmclLp
X-Gm-Gg: AYBFou1MyBFpM2ObHsLX5CsDZ9oik89OCB4ZoSme1M0oHkdmxJVu47iWoJDyn9IUJp8
	s460LuhHPmjuY6nI4DGE6A0PYb7WUcVjUYAfH27tPZwDibdY2sXn17ZtHFxLn6DMSjmUPH/1Cyo
	hIOmJFDqlUVU89X7yQTZXgPaeTCd4P78vdBVODMUvb5HS5KKNv7dnqoxurPKblqmiY4pJT2k3NV
	FURZDchL4jCGUP+fVxv/yIVCXcc231ceYa1EdhXBduV3grne5i/92hPhOSyEw4FTJcumxaVjIHZ
	63Z8AtdHMJ18sdljAc9NsHTmYg88RTBXOQVXkhHqZhyybCqHoEHu4YknIpLZE2JCZObhV9cUQpj
	snhUwXLXCaudhLIJFw39FGqSB/QNBFWECMZgOi3xjlV6z5TJHXy7SmtsHveBA0y8kMd3Ak623lK
	oPOq1nbrJkxX5+wmhSR17fmPD2wGxCpfCrwshoBXsKKmrWKlMBkrnlgF+nNTIYlXEny3OIC+LLe
	lrEcVYcYbQducP4VRC7Psgz23xVnzHvKOanVn9yQ5znCOS+amh75jOzL3nC9dMfYTW03KIQljE2
	OrY86LoF+kqgmbl5zqN6jNEPvVGtU7qeHjPo97i1TypBZwiG97RFqWRwx4WGPYIr0TsLXOCNhw+
	Ue/uAI5Cz2jnbm/8klrGgukA5H3rMFgpuXA==
X-Received: by 2002:a05:7300:d20b:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-372571d7f02mr4839228eec.24.1794204755480;
        Sun, 08 Nov 2026 22:12:35 -0800 (PST)
Received: from codespaces-88e7e5.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm9835409eec.10.2026.11.08.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:12:34 -0800 (PST)
From: Lame Morupisi <lamemorupisi12@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lame Morupisi <lamemorupisi12@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout comment
Date: Mon,  9 Nov 2026 06:12:23 +0000
Message-ID: <20261109061223.17144-1-lamemorupisi12@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108122840.85622-1-lamemorupisi12@gmail.com>
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
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

Clarify the description of the MIPI frame memory layout by
explaining the meaning of optional fields and payload words.

Leave the frame layout diagram unchanged to preserve its
existing representation.

Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cd..09c2b1286 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -130,7 +130,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 		even_line_bytes = odd_line_bytes;
 	}
 
-	/*  a frame represented in memory:  ()- optional; data - payload words.
+	/* Frame representation in memory: () denotes optional fields;
+	 * data denotes payload words.
 	*  addr		0	1	2	3	4	5	6	7:
 	*  first	SOF	(SOL)	PACK_H	data	data	data	data	data
 	*		data	data	data	data	data	data	data	data
-- 
2.56.0

