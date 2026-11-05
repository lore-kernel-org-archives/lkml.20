Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895480;
	b=L/fQeFXslH0VcCVssTdDHC89Z7bV7MshNnhDjcdAW5Je1mdMVztm3ZGG/cauPFoqH4fX
	 OKGA73qZz8a684/RKvR6/YGq+rGOw/isrtnIY2BGuxDOnzwu/6UtPkYmwShK0HQHaKYq2
	 Pu5J8A+ch2RluvgAgtFt+uX+3RIkQgq9N9PQrybko2MemFvLLydC/6E4hDQSmnv55tWzG
	 02pQCWQlqRHBuZvyRGeVwIfVzH8sqy1aMLqBzFlQ72z7if6gQg6LG9F0NLo5B7hto2pvm
	 V/UBhWRApZl4BHnjrAyFbBz8ZDEplFKSnFqjQrxo09qn+EL25TXLJgmh9SJkFVD//gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
	b=J1eAmqbAIIMFC2Pe61tQDFx0RGBAUjLlzsV+n+JkVfzYrbxatefPTpIJtYrECFZyk536
	 lt0VTGkA3TX2pc2eWgfBR9EYtYg6GjKFBzIJ4wcYJ3Pe7mXD7a7P6WPQzo0rGuKNAtXP5
	 UA1/5R4MPTKjgneDL3Vsox3JnPOzaiq08lPoLaN+pvz2mqSCj76uEZirqExoyVW66lEZX
	 To5ZxCnIMcPn/Rsg8ysYdmdylf7xOv3MVSgijsMrt//sJkjnkLPJoK8EdZ1wjaZrbp6M8
	 +H9HyUv4vE3e2lTR/WqGmFaPiNkSv9940qo3mRyDFDrh+v4Ddx3F+q0/CWA/DHU8aXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lenRHN0w;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73957606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73957606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lenRHN0w
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so597626a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895480; x=1794500280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
        b=lenRHN0weog1JZwr4zo1E5NSnY1hPDdyygskorgc8rjvPM43mTMRNhGxPZyiZulXCi
         +TcufP+vAJVvKD2KGnqPQnUb7+xTigb42hBb5vtOy6R+EH3/WiNvli9C3WW9y1vzCswZ
         53Wdv9p1ZB6znt8L22fJqJLHIOEmhaX3nCqSafdLaSfITyfh1gzr7oPZ1SsdiFS5eDdZ
         6hu+e+DBARGW8zp7iTHuDLCxn8cGWqLN3TL6Sq5YxEqaXKRHdXtuN+XHvL/sLIx+cDC8
         rJrKEb21lQvuTuA/MUbDUFSlqnI5AUvBuV38c31rADaFMHjUcm9u8qFAnGYuLUQ9qTVj
         tt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895480; x=1794500280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
        b=El1hOsqJkolhcFjb5bIinRejqErp980Hpl4hKQC/Bsm5jqNDbBCEW2KDJoBaMlGPDC
         4OG+s62Pf13Yc/OWCQutCOFlGjItBY9K1cTo5oIvSTg1GUHLwUxbD/4DF6l4y/ypfsP2
         qrkwLnHdymCuNBlfs/nEz8oqy102R5cetGNC5Jgtw6hlEiQCjeUss14/MmI1RvmItcLg
         q8lRlMXXqKddtTYgBZQmccrfdRxl7wzv607d5NUVsFuys63EoEo3wqawqpG4G0RwDXeP
         W6Zg6K8PtTFd++8hzHup2ISw6dbmf4gEdJSpmbwLG1B2yE282PD/a4qGHzy58l4MT6LM
         gK2w==
X-Forwarded-Encrypted: i=1; AKwUvBx/kFDeqnAkUIOUVHv/aWiFk7ekBSimvS9i7ghvGN/gluJRxxxeK+PXI/98LXaluVx53BG3A27W5TNCtHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tzr+1SUJbAglcSCdNtGyeNnOYUyZa3Lz2x94ktieVe5RhFE3o
	xgUrUKd0wgf3xddCR69gD2mlGJDyI6Z1tKIavgHMsc+PQFjhz+6x1Ij4
X-Gm-Gg: AYBFou2Rz4SkEGL3oycTcWd6ZbcXqNU0KQfJ/EL2eplnnWpp2C1RNr0AkhoLcHoH1PZ
	DOe2zD19sl90ZuCelam5Jwl5vJ6sffYcAXnqIrgzS+/9ngzbwVmeRCOiJrxkYrcPwsMflCSC/sh
	mjz625+KjHDQCAycbDOfmIgGgBupZNmpH9x41vZ7TWn5qcAjVPX9N48cnI4KFQNGeuIYNXaGMLQ
	MD5uuK/DvrweJGnzUzYOwGeZpQl0Gw8X7Bn4nnnfrtm41iOk/veB0Af05c+WefYlxSllBbSKCfw
	oru1EUN2Dyl5cRvhiyZEUFYnjFP19gSmgP8++Dw7LxlkrdWeZa6EP9DJTX4vduwnFO3TzadZIdq
	dmp061RPlHp9ETEVJBIDcTTYERfz7hj/d5AYMZOT871qwEgIiLbd0dsDt2rWyel2GHNE/06PUq8
	8M4dQSgvzQqU3CpnZLQpwWhscrhbhGwHlE7tNJSb6Qv26ccdgSco89dgYU0yBXbtceh7jGhf9i7
	HnzoLuWoZSIQFBpJLRmnHiIPfMebGfaAmFrS7juy/vWzGw7dnblpSzbccNcqgLvxEm36KW3V6ix
	LKthX12Nm4KthyDpacen5UwrdyruG27NHLvd2zov4baADd2wCBYGbvrmIIJIyt1+aVIH9S18+Q6
	8SHqkLS6KYKWyDLncMlTrePjc
X-Received: by 2002:a17:90b:4486:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b0afbf69a0mr1776647a91.8.1793895479717;
        Thu, 05 Nov 2026 08:17:59 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:59 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 5/8] clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
Date: Thu,  5 Nov 2026 16:16:59 +0000
Message-ID: <20261105161702.3515900-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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

clocksource_register_hz() automatically calculates cs->max_idle_ns, so
the explicit max_idle_ns assignment in goldfish_timer_init() is
redundant and overwritten during registration.

Remove the redundant assignment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 88253bd1f569..bac84e0f9b7b 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -140,7 +140,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
 		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-		.max_idle_ns	= LONG_MAX,
 	};
 
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
-- 
2.56.0.398.g882cbad275-goog

