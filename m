Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283524;
	b=yIeovfqb0cTcZgodPNpyU3AxGsTaelfWLFe3FGDMrIdLwQeU92YZ5x7LkB1nXfDnKeji
	 ait+COVGO/gBIA8gbgqr8qlwBnC7PYA+dI2YVlvIwrhLAb6PThBleYvzTDsB8k3WTT4X5
	 dIaR5aKpZ4bkMgwJlnvo0dS19hMf0CIU98fHONtTuIKg/+vEMKwWbHnugRBT1D5BSupK/
	 NMWQZIjf6YdPAuWHaspmapGr1Pofqn7gMojyEEi0f1Dnp9ETOMVlIClYD17rSaf6/CkHz
	 9VnhTvBtXfd1pzsMJ+yMqr34qDJ8MVU5gSNU/P9xCBokL274OdHU7LN7TIxvKwlfi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
	b=M2YsuU0pQmqM5No0WJNd9Vhoxv2bFKn7SbbMGPqJ76cIJACoCqvP1pDEgSS6cS8Y9w4X
	 w1/noBJfd42AOuwsP4M1xvdESnkIpDaCWbPeAZCcWDgThsrDrHC8qaakt3hRV3xeL0P/N
	 w4UVoZBXqIxUcA6VhDvFSGwxwgsaK3wtGttnQpP7d9RznAFbEBfttsBy63iNbM/BXgvOy
	 S11hUtGC8O6ggnHQCwc6k175znwlJaBRM7sgMKng6dKPuVAW74v0LMFDCWfyxjNPHJEMk
	 e2Nb42xO5g2cKMEIbAga0th5BuvDhTcNyPdLAxsdy7fXlD9GPKf+1Sw4MrPT0tHhuPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=dhOIy7ji;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C9606A336
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518C9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=dhOIy7ji
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so17275305e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283522; x=1793888322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=dhOIy7ji+W6TANGxzif2oMq88Dm7wMUE2qvC2UegV47Jc/ZPGCdEcPXmtNrZb5Sbb4
         YInMAP1Z0sjxqTUkaEwsh8HiY5ycIA1cWtTSLeUAklibQONfVo0O1r6l6t8CsXQzWumG
         GC8FmGUj7fGdZIA07dyC4ksOChVOiNGdTtfiIMMeTKwCgloi4HWv8ztOG/+1qVhc/H67
         TlpDsbhQpKdeZXNmov1WnX8DPs2nRGnz5eRJ6J2zZg87GG1MtZeGxfeQc/vyQ/xLBZJW
         0ffWjtD3z49GopF4q+k4Fi3EyoNRTgV9I1hj4qW91j+AmKZy4lvWBO0r7VGiA96qRLHT
         Y+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283522; x=1793888322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=ntuq/NTmpe7646JhTXIQAJYP5BYA6hJqECK+zp1GRWzfWxmhnnw7j0i0c9E6Y494dI
         rqTbOn9l1+YwXBjOTihP+JxDurvFirfQ8IGFk6aJueYHu48y8ksLQDDsn/nOVpG0BzX+
         sluGydNUD4kN45p/TtySGDO48RDe+36IN2QOdaCktm23f7eeNyfggqgjQ36QYdsKXe3w
         RZc4CS3FDgY5PztNUKiEaFsGa3+bTx7LZJAEBxshHGbUzGKSE2NH2eMyAFVIeby/6nrB
         QBrLcP13Ja2xtrN4wfDFjIEf5tSfJ3kDXE9P35N/5vG2kSqt2oH5eewRmmGjLBV0ANB5
         sgww==
X-Forwarded-Encrypted: i=1; AKwUvBzauhZcdOBCkQEX0FZPIbltGL/OwmPyrp8nhikRH4LAcRN8dUQjB/bnKbBThoaPtd+U9cq6yMEHWQsP7eE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcMDe/fZH1qbwlsdCkGTRCtkgeZByEFdSrP5jscZgqBcxLxZ3P
	cfogy2IJkKzFF6Xthn4eN17npZkxfA7GlbiAu80LdwbVo0oF0huTNY0QyvMBAyGQMPM=
X-Gm-Gg: AYBFou1UJQyWit2Yb/+RNUHK6dKSqstRnjYK7B0loT85qpvdELjVv0ZcAJ1FsNx2Ofe
	EEaFRERAqcA1jRsZuxfVPBPEiHtxwySc+0lW0X6Tmvs7Teg0DX+iD3MvanFCdRDfrCt54+fjLH3
	QOc+CpY8/kaq6as7UUwWnBflchNzWorSW/O/4hP68ZK7ZChsWLGQfD5NK4Avvhdm86YTN9GGt71
	65Dn+/Z/OWFp+NhofXuD279Wq0vc2BVh13B8yRspEqaOS9OZ6Ilt9HcXmu02y4wWvB7/3GUsasT
	3awe/2xM1WZxDvEX23CHKltXIljAJMXdEm4q8+Enhe0+M6LTDknABcbjYvN0rIOty1X6reKC7qO
	fSLYP0t/6A56SK5cG5Cohqz/gRQaQCf4MRxp6xNegHLo8y/MmUoRuanT5AVbZFCFHGWguhZRHbi
	iApv/cUI1y2PuNeLw7Qe4a+i6pOpj7Ov0d51o++lCbl16L3KY2fE9tYJ+VxE9QvZogWDAsa2sMm
	mjIX9OVWUry4Lo4q7WRwqPdH5E1eEVZb/C9LDL1lrIfbrnZyUNgKez1DsjbirsZN1j/BFH9HbZM
	PHtTFWWvgsCeY6jl3syeAD9DSx+zB/qcr04vg4TzgB1x5YCUUJSluntycQ7tbYLEWKPjXFWSv4s
	Jl0/i
X-Received: by 2002:a05:600c:6209:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a9640f231dmr129989245e9.3.1793283521614;
        Thu, 29 Oct 2026 07:18:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:24 +0000
Subject: [PATCH v7 03/18] media: sony-starvis2: Always program the sensor
 in window mode
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
Message-Id: <20261029-media-starvis2-v7-3-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 134fececac5c..31aa1ec6ba40 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -923,9 +923,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

