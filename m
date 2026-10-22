Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659438;
	b=namnnXu2Qls6ud//2GDFX+2886NpcJY6rFBU/zHTUV0OSTUP6fhVK9+kKdksrBaFW1KO
	 RjsOfHBPZhbwB2qbr7z5LFc1jgm998krsoJdfsQT9HOqRx4NubJROT3C3CamocdWzZKY/
	 xOOYjggpaAogkV27uDOQxt0BznKJZFb11AqmvjfMpk/th40dWwBZa9uHKkV3SOLm/X6i8
	 3p8j3wVexx4AcDQdIMuYKXnLjE5/ZXh82l8xE6WmY2qJGl86vIvBbdNCzJYEw/7pLR0Q5
	 frfPXeRJzOmpKMO01rVMU7CLBwPsCegFDPeoGI8AgWycAdH+E4HymFvV/YF9nUsn58g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UxwOL1GCHgPqfUhQREZ4EGaDCyWDOXreH6QpNfsuSK4=;
	b=jvKY/KoOzQzQjIghJ9ZYe2iViSFACiUVLj8YYAeuPaO/tXmuy/XTqMm2zUR53gjOmeQ5
	 S6tmIeP1TaTnJDBK1isqieHUilHVjF48Ni+TH5BfW5wIfAXRrIhWuweynwtIEsQY4NSPn
	 nQDY1vs8894lOcTU+dO1qLBtB5bYSK/RNNmOAdo5dfwJKLswwCSqBHHeR69toFx+uPpA9
	 851raX1R7mo+JuDS7oRwvILsg1A7qh22JgeKYGxoRkbZlqHmkxrop6qfRkYqv1uE5huZz
	 XGniwgHSXF/fJBVvOwPdOBMWwVc0oGnCylgyg3gNUcaEyoB6+10ZcbGfynhM5Dwic5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hSKlNvpT;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F225606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F225606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hSKlNvpT
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso648007a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659437; x=1793264237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UxwOL1GCHgPqfUhQREZ4EGaDCyWDOXreH6QpNfsuSK4=;
        b=hSKlNvpT66PTKODaTG3EjekagSSL1+L8Y6ly7ImPt0XnJtXIwglbZZcxOaMPU73c7Y
         ZxxXgelYkI8VGN9bLU5l0BhQPKZS7PRHeslGTQjFbwlLPsSiRKdpn9XBC3Fb/0GoIdGS
         wj8aq8HVkdMYJ+/8AXFP0P5XbjXNivKJZK7ceINjWI3/5xbLgVOk8XpELx4ekYaXIKHY
         z2xwbiSlAtickuJyevU/Uw5HCygg/vD63yRrWvK2CeZ8tCvSQQpYdmv4tSS7kMbR/ywT
         M3uOZisBegySz5a4dsBIN81VIpRH3SUNrkVVdk0vZkEFe6IxL6iLG+zNdHxW0VFvjLW7
         mwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659437; x=1793264237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxwOL1GCHgPqfUhQREZ4EGaDCyWDOXreH6QpNfsuSK4=;
        b=e0amvuWel8Dj71YzpPr2xew4y5cZRL9Nksk/cEmnopDK7IJJj4r6bmOqC3jnv3O+vX
         SYZG8Un0JNVnddo7AF8daRphB87gni6r1WcgmUI/G3dlf8yRhTV//knNWzBbY62FDQ2q
         f8++Ppy05FzhKxrctyoLQ0nfF6leYHGVnwtOFM+cdftVnNQV37Zv6P+oEKCTRB4oVFvm
         kU8q4bsndfQPNKCiKwL4TXfSvryxdhEiNzsgw+cgQi40D8LVhsA+wkF4bepMxcVxRtgO
         qbTWfDbgRoy6aryvDbt2kNx5dCdiPiL+GP27+nWpCigeK8ozBrpO0ThLNH/t5Bdlf+Lb
         iRqQ==
X-Gm-Message-State: AFq9FYKT54Q++s9SfdbSBmiCEp6gNpDYYGJfN5kMD4c8L/vcuTKV5x2L
	CWLRzknwj3tegh5XPRV57P3JYDP8NWATwG9BznYtJ6gyt+22AFYO94pD
X-Gm-Gg: AYBFou38NLR6bjWVyW1IHP/fCazgcvJG7aDrQX8KSwhlxbPaZAQ7JWGR4+TsAIQ1gok
	1viWpopfj741DPohoz7FiF5UlxUR3Iu9Aam8vVJKlcKBjsEIsT5QnNfOMAZrC53P0MUNK+FCuqG
	POiXpAcCjqULiYXqWkqsz8aIz0QKGbnLb6W6Zp256RoVlebsuxFeYUtcL7mPh8+o78p3eY8js0J
	7ttUHRxge4RF+yxQLzoGo2fBp5F9V7Xxit6uEUKuOXOqBVxkeRGBqOUmTVjxLiJigh100tO0zTO
	mwp7TC7opx/5CUdcldyyCBZsPwjoZNusCR9VfzADqta99ksxdh8HZ8fYYEqgLQ9UuzsEmkE0j+n
	CIMcvHaN8CH9nM0ZD7UeSkPEBBKcnuBG1fOvXWMNGqfrVMwH1yYM/a64IUYBQqUvCu+oeIYCvco
	2Z6FlRXs1NkU+EJs1ZbGar6pg6QsUwf8xARQnKxWj74j3BN8UZa//kfiNuxfe38NzQVB5nc2tQb
	StLJ5ihfSJ7bM160SEnEk10fJxFIMaqKibysFAXCEjsQNgbspMhOFr/RtnX
X-Received: by 2002:a17:90a:cf01:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3ad86e9eb60mr2614714a91.17.1792659436838;
        Thu, 22 Oct 2026 01:57:16 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bcb45sm3172774a91.16.2026.10.22.01.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:57:16 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Reject ris_idx == MPAM_MSC_MAX_NUM_RIS
Date: Thu, 22 Oct 2026 16:57:10 +0800
Message-Id: <20261022085710.1597276-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

While checking the driver's partid and ris bound checks, after the
hardware team mistakenly configured PARTID_MAX in an MSC to 16,
this issue was found: MPAM_MSC_MAX_NUM_RIS is the max number of
RIS an MSC can have, so a ris_idx of 16 passes the current check,
and would later be silently truncated to 0 by FIELD_PREP(),
landing all configuration for that ris on RIS 0.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..347a5a6d6a1d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
-- 
2.34.1

