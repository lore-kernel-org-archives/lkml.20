Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00BD35F5ED
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488497; cv=none; b=oFCP5ntvzcHfBGrdUfPgOiZihjQI8FpWqW+1e8F0V2qM9ufqbooK5E5bHIqbpEpIQxeDPvIDrEkVgtST2wJYgyb9PteVyRmP6IOjZgifW/Trt+E9ejYFsRAlzw/J+4RDUjDXggRM87WO0E4J+6sxzASMY0SInfXnRO54nEiTs/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488497; c=relaxed/simple;
	bh=kJ8A2o/UZ0mgONwUJC/941kV4kbtBGHonCNWzYdcslo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rjr+tt3N0NYCmjxADjr1Glo/SHNcfoq+s3qcsBG0JJUic69OwjuD4zeyqi55UnE8QbXzLg90E1k0PmocYQQ2Wc7k6ErA2xgmh8S7q1VPmLKg45KJQBTbE27XGWbAkpEIAkmsZeuzXx6ckYmBz33rJF5ejXZRisbYG0b/LxvH3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=gqWmVYh8; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="gqWmVYh8"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso5137446d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788488494; x=1789093294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+/FE/y9ST1Zo9N51I7plUbyGgWh9xTfCZH/6siYgus=;
        b=gqWmVYh8D2U4EFeCsvuSr1Pq+fj7Sseufv0gILhvcwJn9XNkcu4GjO8h2Uj3OsiU87
         U/sp9b+fVpesB22gTqAy73gwB63EhwI0HgopaaltMoZcvjgmDvaDA5YbaNuoXJnYUuPo
         WUkvKPjsH4n6ToLTa2mOBLFIbreEb9mxHCA7p5wiqMvXDJhiX0WZb3sEA5teY/TRLnnK
         bQhN5V9ETmghZ7v+wQT3wsmh7rqSZrwbkpizUA3Fx6VwGIv0sk4LG1aX/k1JvVXhu1mS
         WUV17jpZFfSZyA2ndBrnmLFBuY/DidUJK629657tW+p01Ct7gI1geV+Qv4On/Bla0+Rw
         NBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488494; x=1789093294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+/FE/y9ST1Zo9N51I7plUbyGgWh9xTfCZH/6siYgus=;
        b=tG61MXxVnjs6heWFkFqEGZA8jF+UrpaAAZ1E0KT/lsB6XwEw2CIOeYg+7fDKspCk1l
         pkLEfURxTfV+BnHxTInSzAal6tbrNAR2u8FERUvHDy6MA0NvUPIjgCpGEbWUVMdfpN7J
         sybcirrtxffNzV+w6hyUR6X4L92bDdvFkjnDMEZjx3Fw64R3PZpt2gCnPn1bjiLWzNH3
         ru6ZqnzO2u6Od/hIocG5bb/pAaOyFymbmXP4e5vCTl4GCYENlQJ9c8LX5S5ZsL+hTF5u
         o8YxEoErwPL57Qs2AJnSa2wDWUwHYlEaPXllME1kW/j2Dd8V+3S5b4LKBFYz2nj5qgne
         sZ3w==
X-Forwarded-Encrypted: i=1; AKwUvBzquejPiybL+MhsxeqQ/bHyGnxceLoKweSk/9dKG/NHeHiQNZn9bKsENH6vXRkQP1UASFWz1pc4UZCbBk0=@vger.kernel.org
X-Gm-Message-State: AFuF++lqtU8Wknm8Nz5RZd07UdSlcQxXifcLu/MAPzAEH+6GXUYQjuWh
	xd2KuTxYL9iSNyj2urqFSn/devKyFKRgXNCa/L/NFUW14jtroVx8dOwl1n45GDg3N0nbNkuLfA5
	SdJxWsAHOWA==
X-Gm-Gg: AYBFou2ruWCd130gPv8x3jucTaQHHClDtITQ0ZumSOmGAlm52a422sMNAfuKGE4F6GI
	pzTTIawKBdvkwFLBaAPW7j+0rcnzXfXJJ12AGw3TLv7TjcpRNizSjQ1iksXfWifomiYd3lPA+qx
	GOSpuAZazAsRp70+t+nMFr1Ytp2sF386fx9MZmlyiRowGHiZn9Wp1/Y5AjkCNENFIS9m2jnW2Il
	pgFe9zZQg1xhj1xMYszzgI4Bcy/wzQq8aZK+6uNt/ZIfGFYlA/0rzupijwD/bp98H9bcwPeDx/h
	HnS4bHwj1AOuko3se9NgADjQ+1qM8az9/d5/mRc82iWokF6sKOV1mmdBjVFPK9uUVdP7fl1zNXT
	EZxlgsQgtj/uYHfTS07Se21nZn9kfEpzWYTkasK0+ZRsA+gtdWhE01A9Q7DinbRRDYmctxa+T7E
	xB+vL5A10PrSqq7KjAhL0V0PdFrHv9Oh6JDVQ4jV1Y9vA15hmGjuEWSB/npDHzSgV2hETeugK/8
	dD3e0AWeMpRD7+8hpVs7taJSMwLq1hdIO3aihoM/8WcIcU=
X-Received: by 2002:a05:6214:5f0a:b0:910:3451:340 with SMTP id 6a1803df08f44-9103efb477dmr42621986d6.31.1788488494443;
        Thu, 03 Sep 2026 19:21:34 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm9508846d6.2.2026.09.03.19.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:21:33 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH 0/2] hwmon: Fix ASUS ROG Ryujin HID report handling
Date: Thu,  3 Sep 2026 22:21:27 -0400
Message-ID: <20260904022129.97896-1-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Sashiko review found two pre-existing issues in the ASUS ROG Ryujin
driver: missing HID report length validation and a race between completion
updates and reinitialization.

Reject undersized reports and serialize both paths with the existing
spinlock.

Tested on an ASUS ROG Ryujin III EVA using a DKMS-built module with 16,000
concurrent hwmon reads and 50 liquidctl status requests over hidraw. No
failures, timeouts, lock warnings, or HID errors were observed.

Arie Miller (2):
  hwmon: (asus_rog_ryujin) Validate HID report lengths
  hwmon: (asus_rog_ryujin) Synchronize HID command and report handling

 drivers/hwmon/asus_rog_ryujin.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

-- 
2.55.0
