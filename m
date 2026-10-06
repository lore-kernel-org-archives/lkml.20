Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836A49DBB9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304276; cv=none; b=MEhLM49SXFDl1GCE2oyxLfjRdYY9hpP5Z4z9vZQrKcEpEuujMU8O5dgXT9BWhssJeZ8gkU4uTtHAEYTh3OWgOcSYg6aLEOG3Vi4CDz2oxaRyMSe4aXhD9708042jFkxsDSTTv18/LhpUXDq+gbe3lZquZNK7vUipUN6ix0CTfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304276; c=relaxed/simple;
	bh=WXcly/MABuM+KHwXWL2hf3oERsAi0yaIkHJOZ6o97cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rljGGXu0JxDCnY9L09s1gpkh1DdAk1pIo2dw7n3bryagmu2ihVSvTg5RurRQDKBluFORnlZCghxCVl9X45RI6U8OVrY6PDP5cfqJkep0DT3zo1C3UbtWnrMYK+CA6U5+AsGI3iAWdiRus5UE5HLJaaOuOYV7iJhu7rwjt97LTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avkiv3Fq; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avkiv3Fq"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5e3e525cf4bso744247e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304273; x=1791909073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywN4tNJNNqDRUPP3AsT8Nesevvk83PmWOswuYVqECKw=;
        b=avkiv3Fq+Ic3qrn+tYhqQDlFz4NBcxPUb0GKX0nj5qLqjCWcX7HUZvXEb+zWkxusrn
         1aP329WRFpTC+4JUZWpP4MzWwa3kfUx75Qy21ttDgXB7JhluFdbUTnB4NBW93pAhemq1
         OEr5TAFYvc/JFl5l2VCp/EaCYYxqYc5uBGJtwmCMn7YGoDRrm1v81mnQ+wwNRQv11DjV
         QZlv4dAI3GXIsocs8pMt5DAems9pK5nAs5z9hpevWw5gcsBmpND9a3B1qXpA69l5VoyZ
         Udzbn42XS9YuggQZVxNRFJP0kBKgNOZiagJk4tWnq0NV71LQUu60hyau0pRnlg9sgOtS
         t4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304273; x=1791909073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywN4tNJNNqDRUPP3AsT8Nesevvk83PmWOswuYVqECKw=;
        b=bZAFrj1fY9vxXVrdWUYtlJJnxs+BsO+l80/bX0PNC+B4kc4pZYGPze2Gi90zEEhstM
         sD5p/GWwAVSqQB5e4uqavCvQkSaENBlthiJUnrg5grKSCjZrb4j8FLUOBvSSxASfPn73
         wdcJ+2QAVl4uNvnNA202GIf1wqiRh2fmdqUUx+iuwc1g10GIunt0dc3/HKfsgTo+5Xx1
         dy2SoTpbBP0C0+5InTqiarjc+wIoRi7rerWiqBOydP+60V+NM5nAxQt2FY853obE9hjz
         2JvP8UPeYyqevkQgYFzsag7ejgKwB1dFgWpG4Y3s1Yzd7QsLEZjj6i40mt+/VKVEIMwS
         Cmpw==
X-Forwarded-Encrypted: i=1; AKwUvBz7DkgcJeNxiMJjORzO2b/tEcnCuXst4W1EGP54RAg0Ix1fiGKbm3kbZ0ryHC+TMKxBz1unMF2fTqdudKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDqEH2BVb0+bhItE3GgkPG39/1YTYp0aMVL67rDoYpywmkQBYf
	ZtgMxO/WT8L6GXADdSDdSDCxc1QZWKTI8VdBDPWxk7NiOQZWDdgc42BN
X-Gm-Gg: AYBFou20aVadakBMCl246Wgu7VolzUqIGVLrvwcAY4j724CO+4QsSmISpc2QFx5WSxH
	jmaDyVbdOAqJPQgIny1h6IMiB5LLX2e8FKNeqw7ztw1Fxv10lpaCJbd2+j7Dc83acQbQ9BMAGRW
	GpwaTL73NFD22bm9hX9cvrEQhuLD9H3a07cHVa9ZZazls1xYTsjS1hm3/hzDmil1shGj6DGAvTx
	ZODfTpto2R/F/pujCrJzXnxWiCVj1e89WdxgOO70SdUQF1pz50K+8meWn3PRbxMF4o77YioCaOM
	7minDf70o47bjO4aaGl/YUveFwQqMgPJJkURsgNzc/wH+EZzK/IppzgjRL1LXEUgfOpyGrrRX1u
	vaP9uC2dIBkdavUcDApXTc0XWUyxsjCw/0SxeH8gSsaE0Hp5uPELf7KqCi2V9M21FGcu+JErxqZ
	vch+Z0oi4fjHHOOc3r8cZVSoezmzs5o4n/rV9t4us9ohNYcfCIkthw7+vc/GmWG93pvho2Rar6v
	dfO5NEM4notZ+BDtPH4CzNTKRppzTM/ibOt8dBf
X-Received: by 2002:a05:6102:1628:b0:7b3:32fe:77b6 with SMTP id ada2fe7eead31-7c875583d16mr612192137.3.1791304273204;
        Tue, 06 Oct 2026 09:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ff5c49a9sm13562366137.4.2026.10.06.09.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:31:12 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: staging/ipu7: fix typo in comment
Date: Tue,  6 Oct 2026 13:30:55 -0300
Message-ID: <20261006163055.66095-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in a comment: utlization -> utilization.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.h b/drivers/staging/media/ipu7/ipu7.h
index ac8ac0689468..d045e16bbcf0 100644
--- a/drivers/staging/media/ipu7/ipu7.h
+++ b/drivers/staging/media/ipu7/ipu7.h
@@ -114,7 +114,7 @@ struct ipu7_device {
 #define IPU_UAO_PLANE_MAX_NUM		64U
 
 /*
- * To maximize the IOSF utlization, IPU need to send requests in bursts.
+ * To maximize the IOSF utilization, IPU need to send requests in bursts.
  * At the DMA interface with the buttress, there are CDC FIFOs with burst
  * collection capability. CDC FIFO burst collectors have a configurable
  * threshold and is configured based on the outcome of performance measurements.
-- 
2.56.0

