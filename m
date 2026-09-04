Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9B49481D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525410; cv=none; b=ulDIzASHlp+nuFdFsKmg84/F6oxJu/nHXmMYo/NW05RsXLlsDyHZqnGCaL5YPkPXttWB6Ip1TWpfdzikiOlm3WvtZW1/chJrHRTB5bcZwPoNmR23pIKpd1PmlVX0wsPcj+LOIFmQ8Y8BjWXx7c84hW614untrty7/xbgVMVmOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525410; c=relaxed/simple;
	bh=tH5joQ+dbJ4gmQwRc26THdyfzzcCWvanW+iPGsvkOcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1AEbPxPndJ1B9hKrXx86wmGRwHzYXc47y95dav8WMmDcQoHgj3V1edjXgyK3OLPeMlI8h8+2wNKCsCUzSPkA9TbGZXpKfaNv9V2N8tvOToU0f5b5slvgOM/Bfr9nEUclxSGAWfFIGkcRvF8UjyKui57HDUXPVBeahKzPbqFXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYediU7U; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYediU7U"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c65093556aso781859e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525408; x=1789130208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaXFEfCbqyYB3STA0VXC5iTAUczjE1vXIyyNkAxzA4s=;
        b=bYediU7UuLezVVfGXOBGPJ6Kh8dFczz12xCvfCQMHYqf/9P8qJ8/I1cwfrSrteHfzY
         Y5mpSp2DlGUnaK3Q/d30ROkwZxjrdGLnN8ozrjCCtn/KE6awzSziyeh003NVQrPF75MI
         iJQ6YHM+ZUSYtvasNO/2iJteBu86qXHtUCK4W1A9DFfJfCQrHVNK7JDWwwl2VLYLGSvP
         7InN28woeBmoBcxO91xgR2w/HNH9Ew6blr281hRkgL3VtgfCKGm8mkKlESfZzD4elS5/
         FpdZ4bWqN5Pbyz1+ihNBvPkLMre0yPVKYYxjNm/YCttrX04b+PZ6+HJU8B7ZjwkIkjS6
         ffKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525408; x=1789130208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vaXFEfCbqyYB3STA0VXC5iTAUczjE1vXIyyNkAxzA4s=;
        b=RLvBcLyzc/m/GUqEVhMrJWnxAnAwUwCGc+tJj4mhfA/O+HNablrmauf9CfHoE+lsrw
         YV5+sVPqZ24SXyt9Ud417OYrSa4qvU/xaD6uqYDooaeCF3/50YyBB/i0rRvSrEb00Kdz
         FJba3RqpULWBxccjZKZePEzm/15/SsS8khIgSOg4P0XgXjq2kp+QjvXhKWEt09pb54WP
         wG+hvcbHLFs8d8H3cY32IcxFieZwQF+OukAy/aSbOFkZlHDM9V43NriPlcBJiq44l3cz
         NNM+Osfd//NIBY39ZyCrhZ/t54vjvlBm4Isw0Ivej0WNKXRyl04uXLby2R+EwNgX1B9Z
         +fQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuXQX7DCStHM38eO8C215uTdYh3ytPV75/pgXRCRgOj7TECqW34U6BFME8zoUxZZJcliOUE1o/eQ4jppQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lGwqe6hBRGBcaTDMB6esm7zYGS95D4PlzMHdjPERMEHBXmLfrj
	4KVyqS3CWBA6nZ5jHRNbua2mfjcqXCNLIMveD6sxWYqVwJhpQcDCNu+T
X-Gm-Gg: AYBFou1TAYJeJ3AGZ8ppJH1rJWby6A7y6lXPh2mFluTkh0wKP6wjaMISyse6l5AfXNC
	cTNR5NFYHlKB06ZbFh+Y3ezk7KtsMvPTdla3npqxjsvYmH6PJTOXUODG6O1RHd5+QwJZ5DJvKd1
	gf6CxyZVtxhEGPXcbAP2WiArXtwf8MBBZlfFDrDPsokGFpet3zeiPz5F+kxnjXzkYDb2QYXl0y7
	t9K03YRcWpYTjzEQwtqdSx/dMWGKn1dS7+5a3AP5g2g5TxikQzC7eD5azo+HvBDBlTAQmn+8ICq
	HecxC7JqPO0jRKHiOLgZINAVeq3oeovORw3AAW0kvjIgOi1kp2BMRLRO71J14T8mptp+ydiS4C4
	aKvUd5MeeXH7Lvn2cXJQfGCUZ46xC7G4/MftqIU94+snTlqcLnXuyQaF03RlJSkgiaoEVrRwwZ8
	k3BYZQNy1OgCgvNVrPDQVY6zEnuSivcdWKhkx4XLiDpe8MGd6tMLTl
X-Received: by 2002:ac5:ce1c:0:b0:5c7:ed31:3c11 with SMTP id 71dfb90a1353d-5c7ed796b9amr2110769e0c.3.1788525407840;
        Fri, 04 Sep 2026 05:36:47 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b36cbsm1924498e0c.17.2026.09.04.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:36:47 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused field in false alarm statistics
Date: Fri,  4 Sep 2026 08:36:23 -0400
Message-ID: <20260904123623.175042-2-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260904123623.175042-1-adrianox@gmail.com>
References: <20260904123623.175042-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cnt_Ofdm_fail_pre is never used, so remove it.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.h b/drivers/staging/rtl8723bs/hal/odm_DIG.h
index 5517ef79bd..1482290b26 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.h
@@ -65,7 +65,6 @@ struct  false_ALARM_STATISTICS {
 	u32 Cnt_Crc8_fail;
 	u32 Cnt_Mcs_fail;
 	u32 Cnt_Ofdm_fail;
-	u32 Cnt_Ofdm_fail_pre; /* For RTL8881A */
 	u32 Cnt_Cck_fail;
 	u32 Cnt_all;
 	u32 Cnt_Fast_Fsync;
-- 
2.51.0

