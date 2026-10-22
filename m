Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690484;
	b=WT9SDsrdU8EXOIUs74pTl0N9TnsW6YYJWPpbzrI0MCU/iiW//0ns5csMtBKQzBdWhbAI
	 KcBVgiL11Orwzu7fzEQMQ6WBCIwFEGtVX2w9B6dMeKkYNqiUidtsr6TzPhG96TYse9t/k
	 suNxzEidiVq+/4P0LTqxdRmas4t9LhR+tKGrqKgS1Ed2Fb8w7Fzi0S80cKUBaluEqVKF3
	 OX0iqzO6ncVy5j4QBXtcvhIv/NWhuXywfNBzJ7NG4V5t1kjmT9Be3jKFrXcYdNiP9xZSO
	 zczaAjUAyPhzA/U4RlpUOkphw6slT/64L9u0IWwJZfb/DH2Ze9Tsn+8QFqo9JGY1cGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
	b=uAmH74PsTjcvr5VxcyvfJv5dDd121pOGa3QTo70J1m6A2vVAXFSejQpJGDvN+INSEOFZ
	 ZM51Yot/m/0kdkRO7sfds1Cd0IAz5YskzlMbKz6dmYMDGpeT1dMNlZU52tmbLjD1Vnl+6
	 koLJIZ44eop90VlRKTFzLMgc4AZAaeEdKWKsGUX3qQECU0s1rUsFqgMPF3iBcWo/tN2US
	 s8hcPDK2JuO9SqIySvyfR9gMdlr9KiyjvWYH9MkBc5NDzSBDlZhS61aC9GFHLa3toE+n8
	 7ayArtKL9FCBQIa4qM8bcLhWlumX4i6hNZ55WqNo21WlFSoV4MSdHJcOIJ6nL0BQBIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=oZKn81O0;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E460A5BE2
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766E460A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=oZKn81O0
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso33908f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690483; x=1793295283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=oZKn81O0a11SpkUNeq2NAxJwSgzjpEfa7Rt7URUvcUigkeVeR6y+gSwCWzHGJgosfg
         oEye/GszlPOD7YktNmWOjC+tXfVrMfi+810862/ttdzsqpjrDR/hYxTLwWLFDQNDbFTI
         2Q19Cq/w9jF2bSRVq5iqWbmSQnIN7SrfdoWM4dbmajBGEenGW2voPdZRNER6A6/DvhkN
         9rRb1OAuGH5cZkrUzLX/1G0YjPYWfMuk/1Zj0u8rvoWNEnuNQrosVWs5+WoKwS0E8SM1
         QIo7unWbf6ybwQHolfuEmMJLUYGidpR/fkjyyeN98xbiTZAtS3U1PsulMvI34hdjzDcc
         6wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690483; x=1793295283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=yxD57RrbYpu91P9KN0MNwTB1uoklWB9+8m0F0CRM7W6nxq0S4FCUF3saRqk9iddrx8
         mBAM1WtuNvnWCzQYhxLYgrPaPFTuoWo9smuqSYY8ktIS55bvFNoSZ7Salq/rpvMeY7hm
         GOqQDOUQq2sGSCSb1eq0zqKSF7mAa1kIj4WlZdrUFpghxUOKkA84VYQncLrG0MVgQ87W
         qzhkoRCMj6ryQpbNFCar1jVyf4FKVWmTWcTseCYilA5CL+qnlVocjd9nzp3uN2pRxE0r
         tGN80KoFLtnSYVI7cK6pfPqgFJMztH6vJLkr02ZBOPjSk4qhmFo57F1VC0eXG18QbGdh
         YTCg==
X-Forwarded-Encrypted: i=1; AKwUvByqx7GL5lFgI6+q8DIVWIBIEROVC8CibBna8C4BtyDGXDH88QknJUfRbbCiBru3nTpGsCqQExPQuY0WmLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIgdJHoJnCbIgzYA64q7sVwIDYPjWJ2QBazIQc+DjarRld16F/
	V2o45dD8kQLy+6lvrBeYpdKrR8ZURI3tUCd+/NqQUMwjhSVg5qdtrW5Lna/lNS9rXjY=
X-Gm-Gg: AYBFou2YLjE3FTUt9l3DEZ/NkT1xJILGdQSQzF1KDWApGbGY+tL/Pi8TSZYoogxa/LH
	2sxpk/lDgGnpeE2//17D1COmx4zu6knvV/Ys77yP3zpEwWpzIHGwxCA7dPumYyxtM3U0UKmBc6g
	8npdlecpzsRHwAxu0my17efCj8d91t7ftBG5CvZoxNKWVEj4g+CgQkawh4xz7N0GrQaCukEQlUj
	13BlXoPve0bKGLzoSkvNmdJJIii9HGfAfQ6nQnTO+jKGUgg3zZPhBqzBF8Ve66bfTAgG1BGn1Ox
	76i6DVVU18IT8OAn2J6AwRK36iLXsZL16UxW/5qMIaxW9FMGGiKaFasMim9ZGNMJxJTErbQsQFl
	APdK8+FKPkpDKnezyiDqIJzOiKlOxpCknHMGDIDoEO3uYzO8JIX+rfg3I7yGKBlQNIdTnZkQWOL
	ItOD4zFLyw2d/Aaa89h2bZC6SjrIPUpDV9AO3If3SpXR1J0Nd2uzl9bXhSbPdQVqoVY3Sj3MVnn
	EEgB3inL1K1RIVqnyfyzT+JIBjTWf16CDRkrYreKwG0lrJpHmDluefSLIhiJeQ3lzduX/+Y4dkD
	npiW9uuzZKltiU+V/oL/20wPEc/HBKk=
X-Received: by 2002:a05:6000:29c9:b0:48e:203e:84f0 with SMTP id ffacd0b85a97d-48e264a7cc6mr8368922f8f.24.1792690482821;
        Thu, 22 Oct 2026 10:34:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:07 +0100
Subject: [PATCH v6 14/18] media: sony-starvis2: Only update bits for window
 mode
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
Message-Id: <20261022-media-starvis2-v6-14-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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
index 645417cc08fb..e64d943369b1 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -89,6 +89,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1460,7 +1461,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

