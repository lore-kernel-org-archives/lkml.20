Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8A46D0A8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189754; cv=none; b=tqJDG4IC/nbcY639SIS0PwCW0BDRfBdLG6AAIBENX391Tm7zf1fqbO5+VEMEPzo6ngSLVqh/YmaNwc1xx8q5f50z77e1cTPcO6mpjyApnmwkKkQP4d7x+BRtIDLssjeRxcIpdi3JZ1xp2t7rIpGbQvR99s0HIkzjhnbd+lK2BkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189754; c=relaxed/simple;
	bh=xF4vDxhZsiTA4r2A8/vCm1EiUkqmg5AbA5+SGktjuhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PG5SOhEPOQRdF4fmlMWMrZ5G/fmtRniIUMGMOAetFDg0oBJlUG7tdo/p5NBa+Q3UwSjpCysquLnIand0FihYn1+Jr/SZWsXziKiI/KClZJ/6VrO0AKjafR1czXBLYZ9MfwRORRZ3KU1h3SRTzn02xgXy0SU1/DxgJrW94nk7Smo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVC7eJ0K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVC7eJ0K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so33043025e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189751; x=1788794551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0rSuKTGURsC+BjATOKT6I6iefn9uhHjm15dQZzDRO74=;
        b=TVC7eJ0K0D1sriZ9t62OwxLOetT5Oz50xrZW0yBKOFXQ4ISRb4BvNH75Yea+/f95aP
         UnUwht9BaogaVQKG6X20c2gQUgN5wE86ei0ap+iHCG3WBs00SUS7ZZBXmCcMEPdx0pCX
         FjCb9znoknMbRulscor/RsYe7pP7ETuWHA0bacgowTE5sTZjqWf38rPo2U0x5v3McycJ
         TRKM9woWjRQR5oCj5pKQr25Cc0kwI3P77eTje6MaH6h+C0cfrWeXPhUkMGNzDJDEqMQy
         8rvfCo4WM50op4Jdmr3l62+Ii6U+e4xkvyfm6Y+/fqbPy3QI5cqqh1l3HWBYf73SukSb
         XaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189751; x=1788794551;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rSuKTGURsC+BjATOKT6I6iefn9uhHjm15dQZzDRO74=;
        b=tKaZMtJkWeugtunsoOfE+bKsU1stHfmS39yNLDOsj0H+C/8DG1sHdfjnwTxy7QmWSF
         CIm/vQpJmo7TMJo54pcKx9guv5OQK5KFNIBAEwuQtlZq1GKMsJVb31sEYRssVdSMDeJQ
         JSAXKuBZPeNQGyEUli+sDSv1mbxTfWg0KPcHlYO7GshA5imudbJw8ZyXpLCj/nwWo92L
         XHPjgBOGDFfijrLBwDD5vJO4h6tvyPsJmaqh4VKkdctA5NO8Zewfp+XJO5LZQweuKGxQ
         sFVw8HhpQP7CBSmujMckNMHXrD6/iPCYWCvpj2BXNs22i4qsOwMQ0u2X+QPiZF5Qp9tC
         y99A==
X-Forwarded-Encrypted: i=1; AHgh+RrGqFgdW95EAe23nPH9kKRiprlOSGS7l9U5ZJuUjnWeTHz4M/u1Lw5yrHz6YqMyZ57qtclF/ctDcOE/2rs=@vger.kernel.org
X-Gm-Message-State: AFuF++m8Hr36AnMDb4iKt7sXjwck65iQTw8FRNjXcwyOvTU+tWj2qxun
	5GZg/JtpxvVxz0EEPIo0CU7HmFpcKLd5CGqhWg+SsCDXLZbnCr1flcj6iQN7dzsedvk=
X-Gm-Gg: AR+sD128Ryrq1zFRKPYXacuf0muf2STNgc68rmTdWMT9PBL5iPVbyXJPMAzjgRDqwaa
	b7Hr26mhbAMHQPKWj07XnSglyrk/LooMnckEgwZqTtZ15vx1JKgOPyeRwsG2jzhlr951V2bhuoQ
	DxpXpWRCeUe9MjpuzgD3+BjO6TMRQ/AIFgRuSSwVxQD4s0sBFLLtpqrUBsh/Nv+u7a9McprTDQs
	7agipXSt8ziATbvE2jwqqqbFB0r5Rd5Y/N8tFp8s5/Ppoaj9HeAQeEyCpNL/YlHAMHrwC1q0Nrk
	PiDFbxeU++MMDCLTnuXBNcq2uCxqauJStQmcnDuBCfJKJR4vSEebrg72a5vW6Zsrld5LssMKoOl
	K4bttWWqSG9tN5Qt9IUH6ZkyN/DNHeKq2P6pEitESxDX9Kmba4SQ0MzRASwHBkiqpb3r6/FKFQk
	nTk8XmZoMqOXkUuw1aU6eABdstGp6UjP6F+G9iFptk9klGBFPgdVSFFzNLx8zp/tZaTixsSO7tq
	oe4Eutnt25jaOh+pN3teel0
X-Received: by 2002:a05:600c:c113:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cdc435d58mr25770285e9.9.1788189751203;
        Mon, 31 Aug 2026 08:22:31 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484322ce2a6sm17342585f8f.19.2026.08.31.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:22:29 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 1/2] Input: evdev: propagate EVIOCSFF copy errors correctly
Date: Mon, 31 Aug 2026 12:21:55 -0300
Message-ID: <20260831152156.166514-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831152156.166514-1-ivanrwcm25@gmail.com>
References: <20260831152156.166514-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Return the error from input_ff_effect_from_user() instead of always
mapping failures to -EFAULT, so wrong buffer sizes surface as -EINVAL.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/input/evdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 3a718d600006..27bcf4f099be 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -1180,8 +1180,9 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
 		return str_to_user(dev->uniq, size, p);
 
 	case EVIOC_MASK_SIZE(EVIOCSFF):
-		if (input_ff_effect_from_user(p, size, &effect))
-			return -EFAULT;
+		error = input_ff_effect_from_user(p, size, &effect);
+		if (error)
+			return error;
 
 		error = input_ff_upload(dev, &effect, file);
 		if (error)
-- 
2.43.0

