Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E652572EA6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420115; cv=none; b=sGdz8pGTSHOupTm/IJLaubm8nS4v/nfciYDcaC3Jr4EVpIxt68qPNouDxtvyQrwv558f4ABhRf7z00ZpDfTEpD6dbn9iljf5JqEUGqMwh8uydSsouqTmN7Sepchq9zGDznvKlqcHtqR7PYLfeLZHhKmtXOigkLbXxvr5X5fDZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420115; c=relaxed/simple;
	bh=QrUTULrAzmLGnxNb3WOiSw1gB5Q7qbOJEVQG/tEUjDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gETQyeeFw4xoD4L7ds41A6Xuf6WPa6RJqi2+tKCEdKyFBEUCG/ldvOX/B2AwrWPPZS8fLDNn8KHLnUQ+e1nDF6vGxEmV4zVS8k0ODiJVTZk7IS6Fp10XnpU/hmEAet0Qqs116sgGXTMmArmO4FgCWmSPUsr+rJ7MA/GbsZAMppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OgYCA6hp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OgYCA6hp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so12629315e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420111; x=1793024911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kul4vFEXVE06RfU7X7+iYlSBqPrNkIOuPBTEB3ZLc2M=;
        b=OgYCA6hpION7n3MzDqQg14349pO47uG/jMASVyAtONrvqKqAD6haWpIkhAk4mduVJD
         K4qz0vmbIIHnmUm0DV65yxlgOxi4nIyTxt9fMJROhqnA/jGYJM6XW6EKV/A2dDvirdZV
         zTSoyiFPoLSRclKNah+792PIfL8W+s5pXXNydwrgX3odeCf6bg+mw8rXvUX8B0hPE5Td
         OJCD48tmSPQYi8PKe1I30rXlSlte5DxhWblTSOjtcYRBVvK2WACCB9J2QbO/KpbduCoh
         9CMiDZX3XwQEXnXsBlVFtsYGXbGZahzoLsbJlhkYCLxW6ibVVqqsZ8qcgl80X8FO5eqv
         eUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420111; x=1793024911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kul4vFEXVE06RfU7X7+iYlSBqPrNkIOuPBTEB3ZLc2M=;
        b=nVmhx/OPANac449p5Kkddn//QniAqqxsWPJRsDsgmP1DElDOUxED5LGAL7uGAByk1J
         QVQwv+9eGYwNhlsclIF1/UIu3viK4fjcl7gTmvOhRsMXW9YyVVI7ewh1i4z5nuq96FiJ
         hu1QTc02w5OCPPdcx9eSKsv/W20aj9K2tleYF0FwGN2ELK/G2yOm6exJgyxzFyKzRFxP
         ADfv2ZDrEISWa4qnptlU+dSF6PMPcNMWKITc5AHtPSM4A/ab6KDJJ3y3jC2u8mue3v2u
         bZLly00yhhPdDmznmAUn/24sM4OMyk+C7VfTPhThZ1s0IGgLSgVmVQ5zS02lcktXy95b
         z4Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwb4dbICW7r4h6FMlAhmdliPr2n0TMKDhLCWCgmrRaFKzSvsJXUCIBzLxFOu4bt8wTCu+eTlm3Kqmr320U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN0wtcAuBx30H0KnhmHeOyVWbqjBM8lipvcCDHUCkPVe+u+uVR
	HFzJI+Bkli4rBoy7mrOd+3IcxHeby2dHfzLvluHy4N6WSilatt0FgxF7Ubpck38B0aw=
X-Gm-Gg: AYBFou2cTH44sI1UQL7WaeWmXU+5UA4+WTWdF+zZl9Q2NlUVE9FIqeF9rElqk1IjgX7
	fKKCR+URGKECREHdYn/9DMqfzzl22O4e35awrwi4rx4gtOIu/NWQez7Qto7qBYd2gds4nJjljeF
	q4nP/KEpfr0jc4QfPRcK0zTBLkJAI98AipRC0U5M+Us+MkAX0xOTKrFqik0MljtkyyunWQrgxJF
	3a/AQKrGlQAJa+HoiGAv39obJuyIxF/BFbb2tW/ruLE/YhR+4CJnT3IQlmthAF44il4sN7bcYKu
	hHruXfFBxO2OMYvv3EQoPVoRB+/GbicEVLTYSa6kjKJctUu1rVHliltDHI3p9agvId9LQ3euc/M
	J8Pkq0aj/v1ENf9XXzyJwtPJG3BYrkwX6+RlHm5OR4mWrt1oLJAMAusOfl4SZ7ZpkppgxZOD1mL
	PJnGLfATknjQjp6MpHt3hNlR2HN+GDKknj2Ql1m14U8edXZMUTJU6eAT8g2tR7s33k62kazy1uX
	7neKlfhdrvovJd5CgCLZDfdLnKZl4jC9OsR4fG2IwO+yExEOw==
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr173737685e9.11.1792420111387;
        Mon, 19 Oct 2026 07:28:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:14 +0100
Subject: [PATCH v5 07/16] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-7-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 56fa2d5ea3fe..1c3dcae5e0a4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -61,10 +61,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  8
+#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1

