Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0321B4257
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314018; cv=none; b=jP2mtrN+oRTJF2y3aWo8uzLL+hE86I24oMm3CGzfWJ3G3u0EAhletFPGbUdx4xPPJtnxtTmLqMznRUethqG9pBh0Y1J7eaEYiynFCk0GC0BUHA2/9WvddzwpFV5KteRIJOVEQvam7dutZla+ffvQC/p3z9rh8XY8vJgLbQ3n5Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314018; c=relaxed/simple;
	bh=0inVXbYiGxiGXy6j7SvTUy//4zaCBXiLbcknOERUIVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WieqIFRSozq48+pk7gTMMna/oiHVPgjPIIycCcH+JVQwGhejsR1lnkoDkPyeGW/clpZLm1G9eE5VJkEEnfGq36Y7lh7A5V4vRtXSHvYdT9E4+T8GPU0x+MiyOUtzPhUNw3OcGfhZtfUSKgeGR2XwsdOe2JnFx0IzzFQcKacP83Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxBMJDFh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxBMJDFh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso538299a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314007; x=1788918807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYKtlERduPFiYIX1bfhWeBK1L/1dAk0lE32+h0N/XY8=;
        b=ZxBMJDFht5DFN0nY61QZ3BxEzEno80BUHCZw4zQUdt8YIcyCfVPAWUIly3t0Dj6UN9
         s8BMq7+/rwCTv69Ls6LNh/HRb19ihcmJKJIPB+wJX4Fb9G0DbJ8ADYMepDOW25n0pjmB
         QTeVJGyNJBx0uvUIVCLM8SzU8OWZ4NPcw24ekvo7FjpoqY0xxMK/4ttVLMKi0nKaiWEE
         2rK8S3r+pF3NbPpmROqC+/Hmwe8b0B+2wyQ6yGn0K6EmdMF+O/YuTLe2YA/GkAZhXocW
         jc0OeuIrNph5Me6gFkhF4l0mg8pUqOw95NIbZnY6xfffZavyHjVT06FcdwqcFYjCVQHs
         XHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314007; x=1788918807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYKtlERduPFiYIX1bfhWeBK1L/1dAk0lE32+h0N/XY8=;
        b=NwGYzW1BeSreAwVkYBNzoSlpLraKivQzrUEveyDovlYnu4Waq3ml9r6WvADuEDwIjF
         0z5s9SP7hPhLRypsAlW1JdMPQWFpIJRAWqPzMUkhdxrHrJ2fQrWzukjeCPKV29UVQ6N/
         /xhc7kVVA4fC3KXyG109gEDz/dtOJznfcyruDGSQzGOERgTl8V/93ALForU3PvbvZA2t
         JRDDw+XAiX9EvH5Ll3wWyS3Qcmnk9W73dsvwEIkM+vr085soJWJtW4poyggGasbJFs4Q
         V9HEjMNxe1QZjijUHo805WIZdxpe2ou0dBHIGaWIZFe96pKGg8thBid94Uua1PgguodS
         G0sA==
X-Forwarded-Encrypted: i=1; AKwUvBxXzcvB5WJQuxXhB4MfkqAu63OCUUU+Xg0JEBRLWJSYBi79flYdjmEUAzNamqKM8MtDrXZfG2MoPmmU33I=@vger.kernel.org
X-Gm-Message-State: AFuF++m46p7V+dxSQw0bVr14rZsOhnOG9uP9jzRaZp1RvP1BOiUBl1pV
	xxaYI7FTMmr27L3zMaD2oCI4LlhxkD22PY0qt0NOWI9fOSSggIwFa2LN
X-Gm-Gg: AYBFou2VeV9m7caXLWoGi3vKb7HO0mlYaPOYSWdbS4n5L5FSxMyr5k18lfs70osilJ5
	iFPkw1wBIM9AmcXbKpciDWWwgV3z3vcO+deNttnot57xc77KJ/NWsxXhdsgMm6Hxr5jbJ8Sj4DH
	Lmb+uVqMDTWgEHuYRgMrnznxbRIzQH9KjNS10dQG+qYLaqgs7AlsJsV3bVmsaV3VVwOCHtqIi1c
	IulXZpCJLlXdC9vlYU1FYIKBNZmIrTfiuKzelG4JznX9NKUSzMHJcChUCdsAJy77bm7IQQh0ngC
	VbSGqa5ADWvoZj89E+RnjcEqcFurUwRSBAf915wLfDyBRAq76BY/wL7R+NUbCn7Lp0afk9t/nGy
	ZvA7b9mw3+T1nmuRLZBwq9WiElTLwNUMwhM6sXDbiEFuBWtivMDs1eSnoe1pBioOll/sp7kv+Jr
	RpNLbXCeN0OblhgPlH0bkvMne8S10QkjnCeoKL+/7IxmRIN97xyfWjZg==
X-Received: by 2002:a17:90b:524c:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39aedfb8ebcmr1963259a91.7.1788314006989;
        Tue, 01 Sep 2026 18:53:26 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62cfe43sm467404a91.1.2026.09.01.18.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:53:25 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use kfree_sensitive() for key material in rtw_set_key()
Date: Tue,  1 Sep 2026 19:53:14 -0600
Message-ID: <20260902015314.21525-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730231315.79688-1-skunkolee@gmail.com>
References: <20260730231315.79688-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psetkeyparm holds WEP/TKIP/AES key material copied in via memcpy
from psecuritypriv before being freed. Use kfree_sensitive() instead
of kfree() so the key bytes are zeroed before the memory is released,
consistent with how psetstakey_para is already handled elsewhere in
this driver.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2: add Fixes: tag
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..fb45f7295386 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1926,14 +1926,14 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		break;
 	default:
 		res = _FAIL;
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 		goto exit;
 	}
 
 	if (enqueue) {
 		pcmd = kzalloc_obj(*pcmd);
 		if (!pcmd) {
-			kfree(psetkeyparm);
+			kfree_sensitive(psetkeyparm);
 			res = _FAIL;  /* try again */
 			goto exit;
 		}
@@ -1949,7 +1949,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		res = rtw_enqueue_cmd(pcmdpriv, pcmd);
 	} else {
 		setkey_hdl(adapter, (u8 *)psetkeyparm);
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 	}
 exit:
 	return res;
-- 
2.55.0

